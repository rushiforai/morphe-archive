import { describe, expect, test } from 'bun:test';
import * as fs from 'node:fs';
import * as path from 'node:path';

const REPO_ROOT = path.resolve(__dirname, '../../');

const APP_DIR_MAP: Record<string, string> = {
  'com.adobe.reader': 'adobe-reader',
  'com.adobe.scan.android': 'adobe-scan',
  'com.aftership.AfterShip': 'aftership',
  'com.ashtoncofer.Buzz': 'fizz',
  'com.avinside': '365-pay',
  'com.creditkarma.mobile': 'credit-karma',
  'com.eab.se': 'navigate360',
  'com.eumlab.android.prometronome': 'pro-metronome',
  'com.groundspeak.geocaching.intro': 'geocaching',
  'com.instructure.candroid': 'canvas',
  'com.nhl.gc1112.free': 'nhl',
  'com.sezzle.sezzlemobile': 'sezzle',
  'com.sidelineswap.android': 'sidelineswap',
  'com.tripledot.blackjack': 'blackjack',
};
function collectMarkdownFiles(dir: string): string[] {
  const results: string[] = [];
  const ignoredDirs: Record<string, true> = {
    node_modules: true,
    '.venv': true,
    '.apk-lab': true,
    build: true,
    dist: true,
    '.git': true,
    '.astro': true,
    '.agents': true,
    '.omp': true,
  };

  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    if (ignoredDirs[entry.name]) continue;
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      results.push(...collectMarkdownFiles(fullPath));
    } else if (entry.isFile() && entry.name.endsWith('.md')) {
      results.push(fullPath);
    }
  }

  return results;
}

export function generateHeadingSlugs(text: string): string[] {
  const stripped = text
    .toLowerCase()
    .replace(/<[^>]+>/g, '')
    .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
    .replace(/`([^`]+)`/g, '$1')
    .replace(/[^\p{L}\p{M}\p{N}\p{Pc}\- ]/gu, '')
    .trim();

  const exact = stripped.replace(/ /g, '-');
  const collapsed = stripped.replace(/-+/g, '-');
  const dashReplaced = text
    .toLowerCase()
    .replace(/<[^>]+>/g, '')
    .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
    .replace(/`([^`]+)`/g, '$1')
    .replace(/[—–]/g, '-')
    .replace(/[^\p{L}\p{M}\p{N}\p{Pc}\- ]/gu, '')
    .trim()
    .replace(/-+/g, '-');

  return Array.from(new Set([exact, collapsed, dashReplaced]));
}

export function extractDocumentAnchors(content: string): Set<string> {
  const slugs = new Set<string>();
  const counts = new Map<string, number>();
  const lines = content.split('\n');
  let inCode = false;

  for (const line of lines) {
    const trimmed = line.trim();
    if (trimmed.startsWith('```') || trimmed.startsWith('~~~')) {
      inCode = !inCode;
      continue;
    }
    if (inCode) continue;

    const headingMatch = trimmed.match(/^#{1,6}\s+(.+)$/);
    if (headingMatch) {
      const headingText = headingMatch[1].trim();
      const candidates = generateHeadingSlugs(headingText);
      for (const slug of candidates) {
        if (!slug) continue;
        if (counts.has(slug)) {
          const count = (counts.get(slug) ?? 0) + 1;
          counts.set(slug, count);
          slugs.add(`${slug}-${count}`);
        } else {
          counts.set(slug, 0);
          slugs.add(slug);
        }
      }
    }

    const idMatches = line.matchAll(/(?:id|name)=["']([^"']+)["']/g);
    for (const match of idMatches) {
      slugs.add(match[1].toLowerCase());
    }
  }

  return slugs;
}

describe('Internal Link Integrity', () => {
  const mdFiles = collectMarkdownFiles(REPO_ROOT);
  const linkRegex = /\[([^\]]*)\]\(([^)]+)\)/g;

  test('found tracked markdown files to verify', () => {
    expect(mdFiles.length).toBeGreaterThan(0);
  });

  for (const file of mdFiles) {
    const relFile = path.relative(REPO_ROOT, file);

    test(`validates internal links in ${relFile}`, () => {
      const content = fs.readFileSync(file, 'utf8');
      const lines = content.split('\n');
      let inCode = false;
      const errors: string[] = [];

      for (let lineIndex = 0; lineIndex < lines.length; lineIndex++) {
        const line = lines[lineIndex];
        const trimmed = line.trim();
        if (trimmed.startsWith('```') || trimmed.startsWith('~~~')) {
          inCode = !inCode;
          continue;
        }
        if (inCode) continue;

        linkRegex.lastIndex = 0;
        let match: RegExpExecArray | null;
        while ((match = linkRegex.exec(line)) !== null) {
          const target = match[2].trim();
          // Exclude external URLs and URI schemes
          if (/^[a-zA-Z][a-zA-Z0-9+.-]*:/.test(target)) {
            continue;
          }

          const [filePath, anchor] = target.split('#');
          let targetFile = file;

          if (filePath) {
            targetFile = path.resolve(path.dirname(file), filePath);
            if (!fs.existsSync(targetFile)) {
              errors.push(
                `Line ${lineIndex + 1}: Broken relative file target "${target}" -> "${targetFile}"`,
              );
              continue;
            }
          }

          if (anchor) {
            if (
              !fs.existsSync(targetFile) ||
              fs.statSync(targetFile).isDirectory()
            ) {
              continue;
            }
            const targetContent = fs.readFileSync(targetFile, 'utf8');
            const targetAnchors = extractDocumentAnchors(targetContent);
            const normAnchor = anchor.toLowerCase();
            const altAnchor = normAnchor.replace(/-+/g, '-');

            if (
              !targetAnchors.has(normAnchor) &&
              !targetAnchors.has(altAnchor)
            ) {
              errors.push(
                `Line ${lineIndex + 1}: Broken anchor link "${target}" (anchor #${anchor} not found in ${path.relative(REPO_ROOT, targetFile)})`,
              );
            }
          }
        }
      }

      expect(errors).toEqual([]);
    });
  }
});

describe('Application Architecture & Patch Contracts', () => {
  const patchesListPath = path.join(REPO_ROOT, 'patches-list.json');
  const patchesList = JSON.parse(fs.readFileSync(patchesListPath, 'utf8'));

  test('patches-list.json contains monitored apps array', () => {
    expect(Array.isArray(patchesList.apps)).toBe(true);
    expect(patchesList.apps.length).toBeGreaterThan(0);
  });

  for (const app of patchesList.apps) {
    const docDirName =
      APP_DIR_MAP[app.packageName] ||
      app.name.toLowerCase().replace(/[^a-z0-9]+/g, '-');
    const docDir = path.join(REPO_ROOT, 'docs', docDirName);

    describe(`App contract for ${app.name} (${app.packageName})`, () => {
      const archPath = path.join(docDir, 'architecture.md');
      const patchPath = path.join(docDir, 'patches.md');

      test(`architecture.md exists for ${app.name}`, () => {
        expect(fs.existsSync(archPath)).toBe(true);
      });

      test(`patches.md exists for ${app.name}`, () => {
        expect(fs.existsSync(patchPath)).toBe(true);
      });

      test(`architecture.md satisfies specification contract`, () => {
        const content = fs.readFileSync(archPath, 'utf8');

        // Overview section
        expect(content).toMatch(/#+\s+.*overview/i);

        // Package name specified
        expect(content).toContain(app.packageName);

        // Target version specified
        const targetVersion =
          app.targets?.[0]?.version || app.latestSupportedVersion;
        if (targetVersion) {
          expect(content).toContain(targetVersion);
        }

        // Technology Stack section
        expect(content).toMatch(
          /#+\s+.*(technology stack|application stack|runtime stack)/i,
        );
      });

      test(`patches.md satisfies specification contract`, () => {
        const content = fs.readFileSync(patchPath, 'utf8');

        // Patch motivation / purpose
        expect(content).toMatch(/#+\s+.*(motivation|overview|purpose)/i);

        // Technical implementation / verification
        expect(content).toMatch(
          /#+\s+.*(technical|implementation|verification|bytecode|strategy|injection|modifications)/i,
        );
      });
    });
  }
});
