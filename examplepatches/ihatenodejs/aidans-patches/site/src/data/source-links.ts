import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

export const GITHUB_REPO = 'https://github.com/ihatenodejs/aidans-patches';
export const GITHUB_BLOB_BASE = `${GITHUB_REPO}/blob/main`;

const APP_DIR_TO_APP_ID: Record<string, string> = {
  adobereader: 'adobe-reader',
  adobescan: 'adobe-scan',
  aftership: 'aftership',
  blackjack: 'blackjack',
  canvas: 'canvas-student',
  creditkarma: 'credit-karma',
  fizz: 'fizz',
  geocaching: 'geocaching',
  navigate360: 'navigate360-student',
  nhl: 'nhl',
  pay365: '365-pay',
  prometronome: 'pro-metronome',
  sezzle: 'sezzle',
  sidelineswap: 'sidelineswap',
};

function collectKotlinFiles(dir: string): string[] {
  const files: string[] = [];
  if (!fs.existsSync(dir)) return files;

  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      files.push(...collectKotlinFiles(full));
    } else if (entry.name.endsWith('.kt')) {
      files.push(full);
    }
  }
  return files;
}

let cachedSourceMap: Record<string, string> | null = null;

/**
 * Dynamically scans Kotlin patch source files under patches/src/main/kotlin/app/aidan/patches/
 * and maps patch names (with and without appId namespace) to their relative repository file paths.
 */
export function getPatchSourceMap(): Record<string, string> {
  if (cachedSourceMap) return cachedSourceMap;

  const currentDir = path.dirname(fileURLToPath(import.meta.url));
  const repoRoot = path.resolve(currentDir, '../../../');
  const patchesDir = path.join(
    repoRoot,
    'patches/src/main/kotlin/app/aidan/patches',
  );

  const map: Record<string, string> = {};
  const patchFiles = collectKotlinFiles(patchesDir);
  const patchRegex =
    /(?:bytecodePatch|resourcePatch|rawResourcePatch|compositeFeaturePatch)\s*\([\s\S]*?name\s*=\s*"([^"]+)"/g;

  for (const file of patchFiles) {
    const content = fs.readFileSync(file, 'utf-8');
    const relRepoPath = path.relative(repoRoot, file).split(path.sep).join('/');
    const relToPatches = path.relative(patchesDir, file);
    const parts = relToPatches.split(path.sep);
    const appDir = parts[0];
    if (appDir === 'shared') continue;

    const appId = APP_DIR_TO_APP_ID[appDir] || appDir;

    let match: RegExpExecArray | null;
    while ((match = patchRegex.exec(content)) !== null) {
      const patchName = match[1];
      map[`${appId}:${patchName}`] = relRepoPath;
      map[`${appDir}:${patchName}`] = relRepoPath;
      if (!map[patchName]) {
        map[patchName] = relRepoPath;
      }
    }
  }

  cachedSourceMap = map;
  return map;
}

/**
 * Returns the GitHub blob URL for a given patch's Kotlin definition file.
 */
export function getPatchSourceUrl(patchName: string, appId?: string): string {
  const map = getPatchSourceMap();
  const relativePath =
    (appId && map[`${appId}:${patchName}`]) || map[patchName];
  if (!relativePath) {
    return `${GITHUB_BLOB_BASE}/patches`;
  }
  return `${GITHUB_BLOB_BASE}/${relativePath}`;
}
