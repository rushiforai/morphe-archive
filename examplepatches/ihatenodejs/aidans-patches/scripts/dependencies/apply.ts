import { spawn } from 'node:child_process';
import * as crypto from 'node:crypto';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';
import {
  type DependencyPolicy,
  type Proposal,
  type ProposalUpdate,
  computeProposalDigest,
} from './model';

export function escapeRegex(str: string): string {
  return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

export type CommandRunner = (
  cmd: string,
  args: string[],
  cwd: string,
) => Promise<{ code: number; stdout: string; stderr: string }>;

export async function defaultRunner(
  cmd: string,
  args: string[],
  cwd: string,
): Promise<{ code: number; stdout: string; stderr: string }> {
  const { promise, resolve } = Promise.withResolvers<{
    code: number;
    stdout: string;
    stderr: string;
  }>();

  const child = spawn(cmd, args, {
    cwd,
    shell: false,
    stdio: ['ignore', 'pipe', 'pipe'],
    env: { ...process.env, FORCE_COLOR: '0' },
  });

  let stdout = '';
  let stderr = '';

  child.stdout.on('data', (d) => (stdout += d.toString()));
  child.stderr.on('data', (d) => (stderr += d.toString()));

  child.on('close', (code) => {
    resolve({ code: code ?? 1, stdout, stderr });
  });

  child.on('error', (err) => {
    resolve({ code: 1, stdout, stderr: stderr + err.message });
  });

  return promise;
}

export interface ApplyOptions {
  runner?: CommandRunner;
}

export interface ApplyResult {
  success: boolean;
  appliedUpdates: ProposalUpdate[];
  changedFiles: string[];
  message: string;
}

export function copyDirRecursive(src: string, dest: string): void {
  fs.mkdirSync(dest, { recursive: true });
  const entries = fs.readdirSync(src, { withFileTypes: true });
  for (const entry of entries) {
    const srcPath = path.join(src, entry.name);
    const destPath = path.join(dest, entry.name);
    if (entry.isDirectory()) {
      if (
        [
          'node_modules',
          '.git',
          '.venv',
          'target',
          'build',
          '.gradle',
          'dist',
          '.astro',
        ].includes(entry.name)
      ) {
        continue;
      }
      copyDirRecursive(srcPath, destPath);
    } else {
      fs.copyFileSync(srcPath, destPath);
    }
  }
}

export async function applyApprovedProposal(
  repoRoot: string,
  proposal: Proposal,
  policy: DependencyPolicy,
  options: ApplyOptions = {},
): Promise<ApplyResult> {
  const runner = options.runner || defaultRunner;

  // 1. Verify proposal digest
  const expectedDigest = computeProposalDigest(
    proposal.inputs,
    proposal.updates,
  );
  if (proposal.digest !== expectedDigest) {
    throw new Error(
      `Proposal digest verification failed: expected ${expectedDigest}, got ${proposal.digest}`,
    );
  }

  // 2. Verify all inputs exist and match current hashes
  for (const input of proposal.inputs) {
    const absPath = path.resolve(repoRoot, input.path);
    if (!fs.existsSync(absPath)) {
      throw new Error(`Proposal input file not found: ${input.path}`);
    }
    const currentSha256 = crypto
      .createHash('sha256')
      .update(fs.readFileSync(absPath))
      .digest('hex');
    if (currentSha256 !== input.sha256) {
      throw new Error(
        `Proposal input file has changed since proposal generation: ${input.path} (expected ${input.sha256.slice(0, 8)}, got ${currentSha256.slice(0, 8)})`,
      );
    }
  }

  // 3. Verify no held items are included in updates
  const heldIds = new Set(policy.holds.map((h) => h.id));
  for (const update of proposal.updates) {
    if (heldIds.has(update.id)) {
      throw new Error(`Cannot apply update to held dependency: ${update.id}`);
    }
  }

  if (proposal.updates.length === 0) {
    return {
      success: true,
      appliedUpdates: [],
      changedFiles: [],
      message: 'No updates to apply.',
    };
  }

  // 4. Create staging directory
  const stagingDir = fs.mkdtempSync(
    path.join(os.tmpdir(), 'aidans-patches-deps-'),
  );
  const touchedFiles = new Set<string>();

  try {
    // Copy necessary input files and projects to staging
    copyDirRecursive(repoRoot, stagingDir);

    // 5. Apply scalar updates to staged files
    for (const update of proposal.updates) {
      const { id, from, to } = update;

      // --- NPM Packages ---
      if (id.startsWith('npm:')) {
        const hashIdx = id.indexOf('#');
        if (hashIdx === -1) {
          throw new Error(`Invalid NPM package ID structure: ${id}`);
        }
        const manifestRel = id.slice(4, hashIdx);
        const rest = id.slice(hashIdx + 1);
        const slashIdx = rest.indexOf('/');
        if (slashIdx === -1) {
          throw new Error(`Invalid NPM package ID structure: ${id}`);
        }
        const section = rest.slice(0, slashIdx);
        const pkgName = rest.slice(slashIdx + 1);
        const stagedManifest = path.join(stagingDir, manifestRel);

        if (fs.existsSync(stagedManifest)) {
          const jsonText = fs.readFileSync(stagedManifest, 'utf8');
          const json = JSON.parse(jsonText);
          if (json[section] && json[section][pkgName]) {
            const currentVal = json[section][pkgName] as string;
            if (currentVal.startsWith('^')) {
              json[section][pkgName] = `^${to}`;
            } else if (currentVal.startsWith('~')) {
              json[section][pkgName] = `~${to}`;
            } else if (currentVal.startsWith('git+')) {
              // Git branch dependency stays on git branch
            } else {
              json[section][pkgName] = to;
            }
            fs.writeFileSync(
              stagedManifest,
              JSON.stringify(json, null, 2) + '\n',
            );
            touchedFiles.add(manifestRel);
          }
        }
      }

      // --- PyPI Packages ---
      else if (id.startsWith('pypi:')) {
        const hashIdx = id.indexOf('#');
        const manifestRel = id.slice(5, hashIdx);
        const [, pkgName] = id.slice(hashIdx + 1).split('/');
        const stagedManifest = path.join(stagingDir, manifestRel);

        if (fs.existsSync(stagedManifest)) {
          let content = fs.readFileSync(stagedManifest, 'utf8');
          // Replace package constraint in python pyproject.toml
          const safePkgName = escapeRegex(pkgName);
          const regex = new RegExp(
            `("${safePkgName}(?:\\[[^\\]]+\\])?\\s*)(===|==|>=|>|<=|<|~=|!=)\\s*([^,;\\s"]+)([^"]*)(")`,
            'g',
          );
          content = content.replace(
            regex,
            (_match, prefix, op, _oldVer, suffix, quote) => {
              const newOp = op === '==' ? '==' : '>=';
              return `${prefix}${newOp}${to}${suffix}${quote}`;
            },
          );
          fs.writeFileSync(stagedManifest, content);
          touchedFiles.add(manifestRel);
        }
      }

      // --- Cargo Packages ---
      else if (id.startsWith('crates:')) {
        const hashIdx = id.indexOf('#');
        const manifestRel = id.slice(7, hashIdx);
        const [, pkgName] = id.slice(hashIdx + 1).split('/');
        const stagedManifest = path.join(stagingDir, manifestRel);

        if (fs.existsSync(stagedManifest)) {
          let content = fs.readFileSync(stagedManifest, 'utf8');
          // Replace simple string version or table version
          const safePkgName = escapeRegex(pkgName);
          const simpleRegex = new RegExp(
            `(${safePkgName}\\s*=\\s*)"([^"]+)"`,
            'g',
          );
          const tableRegex = new RegExp(
            `(${safePkgName}\\s*=\\s*\\{[^}]*version\\s*=\\s*)"([^"]+)"`,
            'g',
          );
          if (tableRegex.test(content)) {
            content = content.replace(tableRegex, (match, prefix, oldVer) => {
              const exact = oldVer.startsWith('=') ? '=' : '';
              return `${prefix}"${exact}${to}"`;
            });
          } else {
            content = content.replace(simpleRegex, `$1"${to}"`);
          }
          fs.writeFileSync(stagedManifest, content);
          touchedFiles.add(manifestRel);
        }
      }

      // --- Gradle Settings & Catalog ---
      else if (id.startsWith('gradle:settings.gradle.kts')) {
        const stagedSettings = path.join(stagingDir, 'settings.gradle.kts');
        if (fs.existsSync(stagedSettings)) {
          let content = fs.readFileSync(stagedSettings, 'utf8');
          content = content.replace(
            /(id\(["']app\.morphe\.patches["']\)\s+version\s+["'])([^"']+)(["'])/,
            `$1${to}$3`,
          );
          fs.writeFileSync(stagedSettings, content);
          touchedFiles.add('settings.gradle.kts');
        }
      } else if (id.startsWith('gradle:gradle/libs.versions.toml')) {
        const stagedCatalog = path.join(
          stagingDir,
          'gradle/libs.versions.toml',
        );
        if (fs.existsSync(stagedCatalog)) {
          const hashIdx = id.indexOf('#');
          const fragment = hashIdx >= 0 ? id.slice(hashIdx + 1) : '';
          const key = fragment.split('/')[1] || '';
          let content = fs.readFileSync(stagedCatalog, 'utf8');
          const vRegex = new RegExp(`(${key}\\s*=\\s*)"([^"]+)"`);
          content = content.replace(vRegex, `$1"${to}"`);
          fs.writeFileSync(stagedCatalog, content);
          touchedFiles.add('gradle/libs.versions.toml');
        }
      }

      // --- Tool: Gradle Wrapper ---
      else if (id === 'tool:gradle') {
        const stagedProps = path.join(
          stagingDir,
          'gradle/wrapper/gradle-wrapper.properties',
        );
        if (fs.existsSync(stagedProps)) {
          let content = fs.readFileSync(stagedProps, 'utf8');
          content = content.replace(
            /gradle-([0-9.]+)-(bin|all)\.zip/,
            `gradle-${to}-$2.zip`,
          );
          if (update.assetIdentity) {
            content = content.replace(
              /distributionSha256Sum=[a-f0-9]{64}/,
              `distributionSha256Sum=${update.assetIdentity}`,
            );
          }
          fs.writeFileSync(stagedProps, content);
          touchedFiles.add('gradle/wrapper/gradle-wrapper.properties');
        }
      }

      // --- Tool: ktlint ---
      else if (id === 'tool:ktlint') {
        const stagedAudit = path.join(stagingDir, 'scripts/audit.ts');
        if (fs.existsSync(stagedAudit)) {
          let content = fs.readFileSync(stagedAudit, 'utf8');
          content = content.replace(
            /KTLINT_VERSION\s*=\s*["'][^"']+["']/,
            `KTLINT_VERSION = '${to}'`,
          );
          if (update.assetIdentity) {
            content = content.replace(
              /KTLINT_SHA256\s*=\s*["'][a-f0-9]{64}["']/,
              `KTLINT_SHA256 = '${update.assetIdentity}'`,
            );
          }
          fs.writeFileSync(stagedAudit, content);
          touchedFiles.add('scripts/audit.ts');
        }
      }

      // --- Tool: APK Lab tools ---
      else if (id.startsWith('tool:apk-lab/')) {
        const toolName = id.slice(13);
        const stagedToolLock = path.join(
          stagingDir,
          'tools/apk-lab/tools.lock.json',
        );
        if (fs.existsSync(stagedToolLock)) {
          const jsonText = fs.readFileSync(stagedToolLock, 'utf8');
          const json = JSON.parse(jsonText);
          if (json.tools && json.tools[toolName]) {
            json.tools[toolName].version = to;
            if (update.assetIdentity) {
              json.tools[toolName].sha256 = update.assetIdentity;
            }
            fs.writeFileSync(
              stagedToolLock,
              JSON.stringify(json, null, 2) + '\n',
            );
            touchedFiles.add('tools/apk-lab/tools.lock.json');
          }
        }
      }

      // --- GitHub Actions ---
      else if (id.startsWith('action:')) {
        const actionName = id.slice(7);
        const workflowsDir = path.join(stagingDir, '.github/workflows');
        if (fs.existsSync(workflowsDir)) {
          for (const file of fs.readdirSync(workflowsDir)) {
            if (!file.endsWith('.yml') && !file.endsWith('.yaml')) continue;
            const wPath = path.join(workflowsDir, file);
            let content = fs.readFileSync(wPath, 'utf8');
            const regex = new RegExp(`(uses:\\s*${actionName}@)[^\\s#]+`, 'g');
            if (regex.test(content)) {
              content = content.replace(regex, `$1v${to.replace(/^v/, '')}`);
              fs.writeFileSync(wPath, content);
              touchedFiles.add(`.github/workflows/${file}`);
            }
          }
        }
      }

      // --- Pre-commit Hooks ---
      else if (id.startsWith('hook:')) {
        const hookRepo = id.slice(5);
        const stagedPc = path.join(stagingDir, '.pre-commit-config.yaml');
        if (fs.existsSync(stagedPc)) {
          let content = fs.readFileSync(stagedPc, 'utf8');
          const regex = new RegExp(
            `(repo:\\s*https://github.com/${hookRepo}[\\s\\S]*?rev:\\s*)(\\S+)`,
          );
          content = content.replace(regex, `$1v${to.replace(/^v/, '')}`);
          fs.writeFileSync(stagedPc, content);
          touchedFiles.add('.pre-commit-config.yaml');
        }
      }

      // --- Rust Toolchain Native ---
      else if (id === 'tool:rust-native') {
        const stagedTc = path.join(
          stagingDir,
          'extensions/nhl-adblock-native/rust-toolchain.toml',
        );
        if (fs.existsSync(stagedTc)) {
          let content = fs.readFileSync(stagedTc, 'utf8');
          content = content.replace(/(channel\s*=\s*")([^"]+)(")/, `$1${to}$3`);
          fs.writeFileSync(stagedTc, content);
          touchedFiles.add('extensions/nhl-adblock-native/rust-toolchain.toml');
        }
        const workflowsDir = path.join(stagingDir, '.github/workflows');
        if (fs.existsSync(workflowsDir)) {
          for (const file of fs.readdirSync(workflowsDir)) {
            if (!file.endsWith('.yml')) continue;
            const wPath = path.join(workflowsDir, file);
            let content = fs.readFileSync(wPath, 'utf8');
            if (content.includes('dtolnay/rust-toolchain@')) {
              content = content.replace(
                /(dtolnay\/rust-toolchain@)[0-9.]+/,
                `$1${to}`,
              );
              fs.writeFileSync(wPath, content);
              touchedFiles.add(`.github/workflows/${file}`);
            }
          }
        }
      }

      // --- Android NDK ---
      else if (id === 'tool:ndk') {
        const stagedPatchBuild = path.join(
          stagingDir,
          'patches/build.gradle.kts',
        );
        if (fs.existsSync(stagedPatchBuild)) {
          let content = fs.readFileSync(stagedPatchBuild, 'utf8');
          content = content.replace(
            /REQUIRED_NDK_VERSION\s*=\s*"[^"]+"/,
            `REQUIRED_NDK_VERSION = "${to}"`,
          );
          fs.writeFileSync(stagedPatchBuild, content);
          touchedFiles.add('patches/build.gradle.kts');
        }
        const workflowsDir = path.join(stagingDir, '.github/workflows');
        if (fs.existsSync(workflowsDir)) {
          for (const file of fs.readdirSync(workflowsDir)) {
            if (!file.endsWith('.yml')) continue;
            const wPath = path.join(workflowsDir, file);
            let content = fs.readFileSync(wPath, 'utf8');
            if (content.includes('ndk-version:')) {
              content = content.replace(
                /(ndk-version:\s*)[^\s\n]+/,
                `$1${update.assetIdentity || 'r28c'}`,
              );
              fs.writeFileSync(wPath, content);
              touchedFiles.add(`.github/workflows/${file}`);
            }
          }
        }
      }

      // --- Embedded Leaflet ---
      else if (id === 'embedded:leaflet') {
        const stagedOsm = path.join(
          stagingDir,
          'extensions/extension/src/main/java/app/aidan/extension/aftership/OsmMapView.java',
        );
        if (fs.existsSync(stagedOsm)) {
          let content = fs.readFileSync(stagedOsm, 'utf8');
          content = content.replace(
            /unpkg\.com\/leaflet@[0-9.]+\//g,
            `unpkg.com/leaflet@${to}/`,
          );
          fs.writeFileSync(stagedOsm, content);
          touchedFiles.add(
            'extensions/extension/src/main/java/app/aidan/extension/aftership/OsmMapView.java',
          );
        }
      }

      // --- CMake FetchContent ---
      else if (
        id.startsWith(
          'cmake:extensions/adobescan-pdf-native/CMakeLists.txt#fetch/',
        )
      ) {
        const pkgName = id.split('#fetch/')[1];
        const manifestRel = 'extensions/adobescan-pdf-native/CMakeLists.txt';
        const stagedCMake = path.join(stagingDir, manifestRel);
        if (fs.existsSync(stagedCMake)) {
          let content = fs.readFileSync(stagedCMake, 'utf8');
          const fetchBlockRegex = new RegExp(
            `FetchContent_Declare\\s*\\(\\s*${pkgName}[\\s\\S]*?\\)`,
            'g',
          );

          let newSha256 = update.assetIdentity || '';
          let newUrl = '';
          if (pkgName === 'qpdf') {
            newUrl = `https://github.com/qpdf/qpdf/releases/download/v${to}/qpdf-${to}.tar.gz`;
          } else if (pkgName === 'libjpeg-turbo') {
            newUrl = `https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/${to}/libjpeg-turbo-${to}.tar.gz`;
          } else if (pkgName === 'leptonica') {
            newUrl = `https://github.com/DanBloomberg/leptonica/releases/download/${to}/leptonica-${to}.tar.gz`;
          } else if (pkgName === 'tesseract') {
            newUrl = `https://github.com/tesseract-ocr/tesseract/archive/refs/tags/${to}.tar.gz`;
          }

          let matchedOldUrl = '';
          const blockMatch = fetchBlockRegex.exec(content);
          fetchBlockRegex.lastIndex = 0;
          if (blockMatch) {
            const urlMatch = blockMatch[0].match(/URL\s+([^\s)]+)/);
            if (urlMatch) {
              matchedOldUrl = urlMatch[1];
              if (!newUrl) {
                newUrl = matchedOldUrl.replaceAll(from, to);
              }
            }
          }

          if (!newSha256 && newUrl) {
            const res = await fetch(newUrl);
            if (!res.ok) {
              throw new Error(
                `Failed to download ${newUrl}: HTTP ${res.status}`,
              );
            }
            const buf = await res.arrayBuffer();
            newSha256 = crypto
              .createHash('sha256')
              .update(Buffer.from(buf))
              .digest('hex');
          }
          if (!newSha256) {
            throw new Error(
              `Could not compute sha256 for ${pkgName} at ${newUrl}`,
            );
          }

          content = content.replace(fetchBlockRegex, (block) => {
            let updated = block;
            if (matchedOldUrl && newUrl) {
              updated = updated.replace(matchedOldUrl, newUrl);
            }
            if (newSha256) {
              updated = updated.replace(
                /URL_HASH\s+SHA256=[a-fA-F0-9]{64}/,
                `URL_HASH SHA256=${newSha256}`,
              );
            }
            return updated;
          });

          fs.writeFileSync(stagedCMake, content);
          touchedFiles.add(manifestRel);
        }
      }
    }

    // 6. Regenerate staged lockfiles
    if (touchedFiles.has('package.json')) {
      const bunRes = await runner(
        'bun',
        ['install', '--lockfile-only', '--ignore-scripts'],
        stagingDir,
      );
      if (bunRes.code !== 0)
        throw new Error(
          `bun install --lockfile-only failed in staging: ${bunRes.stderr}`,
        );
      touchedFiles.add('bun.lock');

      const npmRes = await runner(
        'npm',
        [
          'install',
          '--package-lock-only',
          '--ignore-scripts',
          '--no-audit',
          '--no-fund',
        ],
        stagingDir,
      );
      if (npmRes.code !== 0)
        throw new Error(
          `npm install --package-lock-only failed in staging: ${npmRes.stderr}`,
        );
      touchedFiles.add('package-lock.json');
    }

    if (touchedFiles.has('worker/package.json')) {
      const bunRes = await runner(
        'bun',
        ['install', '--lockfile-only', '--ignore-scripts'],
        path.join(stagingDir, 'worker'),
      );
      if (bunRes.code !== 0)
        throw new Error(`bun install in worker failed: ${bunRes.stderr}`);
      touchedFiles.add('worker/bun.lock');
    }

    if (touchedFiles.has('site/package.json')) {
      const bunRes = await runner(
        'bun',
        ['install', '--lockfile-only', '--ignore-scripts'],
        path.join(stagingDir, 'site'),
      );
      if (bunRes.code !== 0)
        throw new Error(`bun install in site failed: ${bunRes.stderr}`);
      touchedFiles.add('site/bun.lock');
    }

    if (touchedFiles.has('tools/apk-lab/pyproject.toml')) {
      const apkLabDir = path.join(stagingDir, 'tools/apk-lab');
      const pyUpdates = proposal.updates.filter((u) =>
        u.id.startsWith('pypi:tools/apk-lab/'),
      );
      const pkgsToUpgrade = pyUpdates
        .map((u) => u.id.split('/').at(-1) ?? '')
        .filter(Boolean);
      const upgradeArgs = [
        'lock',
        '--project',
        '.',
        ...pkgsToUpgrade.flatMap((p) => ['--upgrade-package', p]),
      ];
      const uvRes = await runner('uv', upgradeArgs, apkLabDir);
      if (uvRes.code !== 0)
        throw new Error(`uv lock failed in tools/apk-lab: ${uvRes.stderr}`);
      touchedFiles.add('tools/apk-lab/uv.lock');
    }

    if (touchedFiles.has('tools/play-metadata/Cargo.toml')) {
      const playDir = path.join(stagingDir, 'tools/play-metadata');
      const cargoUpdates = proposal.updates.filter((u) =>
        u.id.startsWith('crates:tools/play-metadata/'),
      );
      for (const u of cargoUpdates) {
        const pkg = u.id.split('/').at(-1) ?? '';
        const res = await runner(
          'cargo',
          [
            'update',
            '--manifest-path',
            'Cargo.toml',
            '--package',
            pkg,
            '--precise',
            u.to,
          ],
          playDir,
        );
        if (res.code !== 0)
          throw new Error(`cargo update failed for ${pkg}: ${res.stderr}`);
      }
      touchedFiles.add('tools/play-metadata/Cargo.lock');
    }

    if (touchedFiles.has('extensions/nhl-adblock-native/Cargo.toml')) {
      const nhlDir = path.join(stagingDir, 'extensions/nhl-adblock-native');
      const cargoUpdates = proposal.updates.filter((u) =>
        u.id.startsWith('crates:extensions/nhl-adblock-native/'),
      );
      for (const u of cargoUpdates) {
        const pkg = u.id.split('/').at(-1) ?? '';
        const res = await runner(
          'cargo',
          [
            'update',
            '--manifest-path',
            'Cargo.toml',
            '--package',
            pkg,
            '--precise',
            u.to,
          ],
          nhlDir,
        );
        if (res.code !== 0)
          throw new Error(`cargo update failed for ${pkg}: ${res.stderr}`);
      }
      touchedFiles.add('extensions/nhl-adblock-native/Cargo.lock');
    }

    // 7. Atomic publication to repository
    const changedFilesList = Array.from(touchedFiles).sort();
    const backupMap = new Map<string, Buffer>();

    // Take backup snapshots of current repo files
    for (const relFile of changedFilesList) {
      const realPath = path.resolve(repoRoot, relFile);
      if (fs.existsSync(realPath)) {
        backupMap.set(relFile, fs.readFileSync(realPath));
      }
    }

    try {
      for (const relFile of changedFilesList) {
        const stagedFile = path.resolve(stagingDir, relFile);
        const repoFile = path.resolve(repoRoot, relFile);
        if (fs.existsSync(stagedFile)) {
          fs.mkdirSync(path.dirname(repoFile), { recursive: true });
          fs.copyFileSync(stagedFile, repoFile);
        }
      }
    } catch (writeErr) {
      // Rollback
      for (const [relFile, buf] of backupMap.entries()) {
        fs.writeFileSync(path.resolve(repoRoot, relFile), buf);
      }
      throw new Error(
        `Write failed during publication; rolled back all changes: ${(writeErr as Error).message}`,
      );
    }

    return {
      success: true,
      appliedUpdates: proposal.updates,
      changedFiles: changedFilesList,
      message: `Successfully applied ${proposal.updates.length} dependency updates across ${changedFilesList.length} files.`,
    };
  } finally {
    // Clean staging
    try {
      fs.rmSync(stagingDir, { recursive: true, force: true });
    } catch {
      // Ignore cleanup error
    }
  }
}
