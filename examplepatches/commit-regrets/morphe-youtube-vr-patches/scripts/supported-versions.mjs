// scripts/supported-versions.mjs
// The one JS reader of the supported-version declarations in Constants.kt, and the renderer that
// turns them into the "Supported app versions" section appended to every release's notes.
//
// Two consumers, both of which must see the same file the same way:
//   * scripts/check-upstream-version.mjs -- decides whether the store serves a version we do not
//     list (its decision table is scripts/tests/UpstreamCheckTest.mjs);
//   * .github/scripts/supported-versions-notes.mjs -- the semantic-release generateNotes plugin
//     that states, in each release body (and therefore in CHANGELOG.md and in Morphe Desktop's
//     "Patch notes" view, which both render the same concatenated notes), exactly which app
//     versions this release patches.
//
// The regexes are mirrored by SupportedVersionsPolicyTest (patches/src/test), which reads
// Constants.kt "the same way the JS parser does" so a Constants.kt edit that would blind this
// module also fails the Kotlin build. Do not "simplify" them: `AppTarget\s*\(\s*version` cannot
// cross the `//` marker of the commented-out example in Constants.kt's policy block, and that is
// load-bearing -- see the kdoc there.

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const REPO_ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');

export const CONSTANTS_FILE = path.join(
  REPO_ROOT,
  'patches',
  'src',
  'main',
  'kotlin',
  'app',
  'ytvr',
  'patches',
  'shared',
  'Constants.kt'
);

/**
 * Every `AppTarget(version = "...")` literal in [content], in file order (Constants.kt lists the
 * newest first), each flagged with its experimental status. Commented-out targets are excluded
 * because the regex cannot match across the `//` of the policy block's example.
 */
export function parseTargets(content) {
  const versionRegex = /AppTarget\s*\(\s*version\s*=\s*"([^"]+)"/g;
  const targets = [];
  let match;
  while ((match = versionRegex.exec(content)) !== null) {
    // The target's body runs to its closing `),`; only the assignment `isExperimental = true`
    // flags it, and only in the header (before `description`): a description string can
    // legitimately contain assignment-shaped text, and a bare word anywhere would misclassify a
    // normal target that merely mentions it. The counterpart in SupportedVersionsPolicyTest
    // applies the same rule to the same span, so the two readers stay in agreement.
    const bodyStart = match.index;
    const bodyEnd = content.indexOf('),', match.index);
    const body = bodyEnd >= 0 ? content.slice(bodyStart, bodyEnd) : '';
    const headerEnd = body.indexOf('description');
    const header = headerEnd >= 0 ? body.slice(0, headerEnd) : body;
    targets.push({
      version: match[1],
      experimental: /isExperimental\s*=\s*true/.test(header),
    });
  }
  return targets;
}

/** The `SUPPORTED_APP_VERSION` constant, or null when absent. */
export function parseSupportedAppVersion(content) {
  const match = content.match(/const\s+val\s+SUPPORTED_APP_VERSION\s*=\s*"([^"]+)"/);
  return match ? match[1] : null;
}

/**
 * The flat supported-version list, in the semantics check-upstream-version.mjs has always used:
 * every target version plus `SUPPORTED_APP_VERSION` when no target names it (a constant without
 * a target still pins the spoof default, so it belongs in the comparison set).
 */
export function parseSupportedVersions(content) {
  const versions = parseTargets(content).map((target) => target.version);
  const constant = parseSupportedAppVersion(content);
  if (constant && !versions.includes(constant)) {
    versions.push(constant);
  }
  return versions;
}

/** Read the checkout's Constants.kt, failing loudly when it is missing. */
export function readSupportedVersionsFile(file = CONSTANTS_FILE) {
  if (!fs.existsSync(file)) {
    throw new Error(`Constants.kt not found at: ${file}`);
  }
  return fs.readFileSync(file, 'utf8');
}

/**
 * The release-notes section stating which app versions this release patches. Order is file order
 * (newest first) -- never re-sorted, so the section reads the way Constants.kt and the README's
 * supported-versions table do. Experimental targets get their own line: they are attempted, not
 * verified, and the notes must not blur that into "supported".
 *
 * Plain-text docs mention, deliberately: the notes are rendered in Morphe Desktop's "Patch notes"
 * viewer too, where a relative link would be dead.
 */
export function renderSupportedVersionsSection(targets) {
  const normal = targets.filter((target) => !target.experimental).map((target) => target.version);
  const experimental = targets
    .filter((target) => target.experimental)
    .map((target) => target.version);

  if (normal.length === 0 && experimental.length === 0) {
    throw new Error('no AppTarget found in Constants.kt -- refusing to write a section that supports nothing');
  }

  // Bold units joined with "and"; the app name rides in the first unit of the verified line
  // ("**YouTube VR 1.90.05** and **1.89.09**"), the way the README's supported-versions table
  // reads. The experimental line uses plain version units -- the name has already been said.
  const joinAnd = (parts) => parts.join(' and ');
  const withAppName = (versions) =>
    joinAnd(versions.map((v, i) => (i === 0 ? `**YouTube VR ${v}**` : `**${v}**`)));
  const plain = (versions) => joinAnd(versions.map((v) => `**${v}**`));
  const lines = ['### 📱 Supported app versions', ''];
  if (normal.length > 0) {
    lines.push(
      `This release patches ${withAppName(normal)} (Meta Quest). Any other app version ` +
        'is skipped by the patcher, not failed -- see docs/VERSIONING.md in the repository.'
    );
  } else {
    lines.push(
      'This release has no verified target yet. Any app version is attempted only with ' +
        '`--force --continue-on-error` -- see docs/VERSIONING.md in the repository.'
    );
  }
  if (experimental.length > 0) {
    lines.push('');
    lines.push(`Experimental -- attempted, not verified: ${plain(experimental)}.`);
  }
  return lines.join('\n');
}
