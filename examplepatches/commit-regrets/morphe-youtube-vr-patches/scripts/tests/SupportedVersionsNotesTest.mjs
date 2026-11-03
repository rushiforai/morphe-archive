// scripts/tests/SupportedVersionsNotesTest.mjs
// Headless check of the Constants.kt reader that both the upstream checker and the release-notes
// plugin share (scripts/supported-versions.mjs), of the "Supported app versions" section that the
// plugin appends to every release's notes, and of the wiring that makes the plugin actually run:
// the release-notes module is imported and executed here (build.yml, every push) rather than only
// by release-debug.mjs at release time, and .releaserc.js's local module paths are asserted to
// exist and export what semantic-release needs. The section is rendered during a release from
// whatever Constants.kt holds at that moment, so the shapes it can meet -- one target, two, an
// experimental target, the commented-out policy example -- are asserted here rather than
// discovered live in the release workflow.
//
// Run: node scripts/tests/SupportedVersionsNotesTest.mjs

import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';
import {
  CONSTANTS_FILE,
  parseSupportedAppVersion,
  parseSupportedVersions,
  parseTargets,
  renderSupportedVersionsSection,
} from '../supported-versions.mjs';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = path.resolve(__dirname, '..', '..');

let failures = 0;

function check(what, ok) {
  if (!ok) {
    failures++;
  }
  console.log((ok ? '  ok   ' : '  FAIL ') + what);
}

function equal(what, got, want) {
  check(`${what}: want ${JSON.stringify(want)} (got ${JSON.stringify(got)})`, got === want);
}

// includes()-style checks fail as bare "false" unless the mismatch itself is printed -- a check
// that cannot say what it saw is how silent failures get written (the audit's four lessons).
function contains(what, haystack, needle) {
  const ok = haystack.includes(needle);
  check(
    ok ? what : `${what}: ${JSON.stringify(needle)} not found in:\n${haystack}`,
    ok
  );
}

// ---- parsing the declarations ------------------------------------------------

// The shipped shape: two normal targets, newest first, plus the commented-out example in the
// policy block that the regex must NOT see (its `\s*` cannot cross the example's `//` marker --
// the property SupportedVersionsPolicyTest mirrors). SUPPORTED_APP_VERSION is also excluded from
// parseTargets: it names a target, and counting it twice would double-list it.
const shipped = `
const val SUPPORTED_APP_VERSION = "1.90.05"
val targets = listOf(
    //     AppTarget(
    //         version = "1.88.10",
    //         isExperimental = true,
    AppTarget(
        version = "1.90.05",
        description = "Verified.",
    ),
    AppTarget(
        version = "1.89.09",
        description = "Verified.",
    ),
)`;
equal('shipped: two targets', parseTargets(shipped).length, 2);
equal(
  'shipped: versions in file order',
  parseTargets(shipped).map((t) => t.version).join(','),
  '1.90.05,1.89.09'
);
check(
  'shipped: none experimental (commented-out example excluded too)',
  parseTargets(shipped).every((t) => !t.experimental)
);
equal('shipped: flat list', parseSupportedVersions(shipped).join(','), '1.90.05,1.89.09');
equal('shipped: constant', parseSupportedAppVersion(shipped), '1.90.05');

// An experimental target is parsed as one: it is attempted, not verified, and the rendered
// section has to keep that distinction. Detection is the ASSIGNMENT (`isExperimental = true`),
// not the bare word: a normal target whose description merely mentions the word stays normal.
const withExperimental = `
AppTarget(
    version = "1.90.05",
    description = "Verified.",
),
AppTarget(
    version = "1.91.0",
    isExperimental = true,
    description = "Untested.",
),`;
const parsed = parseTargets(withExperimental);
equal('experimental: target count', parsed.length, 2);
equal('experimental: normal flag', parsed[0].experimental, false);
equal('experimental: experimental flag', parsed[1].experimental, true);

const mentionsTheWord = parseTargets(`
AppTarget(
    version = "1.90.05",
    description = "Upgraded from the isExperimental = true channel after verification.",
),`);
equal(
  'a description mentioning isExperimental stays normal',
  mentionsTheWord[0].experimental,
  false
);

// A constant naming a version no target lists still pins the spoof default, so the flat list
// (the upstream checker's comparison set) must include it -- exactly the old checker's semantics.
equal(
  'constant without a target joins the flat list',
  parseSupportedVersions('AppTarget(version = "1.90.05")\nconst val SUPPORTED_APP_VERSION = "1.91.0"').join(','),
  '1.90.05,1.91.0'
);
equal(
  'constant naming a listed target is not repeated',
  parseSupportedVersions('AppTarget(version = "1.91.0")\nconst val SUPPORTED_APP_VERSION = "1.91.0"').join(','),
  '1.91.0'
);

// ---- rendering the section ---------------------------------------------------

const twoNormal = renderSupportedVersionsSection(parseTargets(shipped));
contains('render: two normal targets', twoNormal, '**YouTube VR 1.90.05** and **1.89.09**');
check('render: no experimental line', !twoNormal.toLowerCase().includes('experimental'));
contains('render: says other versions are skipped', twoNormal, 'skipped by the patcher');
check('render: section heading', twoNormal.startsWith('### 📱 Supported app versions'));
contains('render: docs pointer', twoNormal, 'docs/VERSIONING.md');

const singular = renderSupportedVersionsSection([{ version: '1.90.05', experimental: false }]);
contains('render: singular form', singular, '**YouTube VR 1.90.05** (Meta Quest)');
check('render: singular has no "and"', !singular.includes(' and '));

const withExp = renderSupportedVersionsSection(parseTargets(withExperimental));
contains(
  'render: experimental carries its own line',
  withExp,
  'Experimental -- attempted, not verified: **1.91.0**.'
);
contains('render: normal line lists only the verified one', withExp, '**YouTube VR 1.90.05** (Meta Quest)');

// Two experimental targets read as a list, not one clipped by the period.
const twoExperimental = renderSupportedVersionsSection([
  { version: '1.91.0', experimental: true },
  { version: '1.91.1', experimental: true },
]);
contains(
  'render: two experimental targets',
  twoExperimental,
  'Experimental -- attempted, not verified: **1.91.0** and **1.91.1**.'
);
contains('render: experimental-only still says there is no verified target', twoExperimental, 'no verified target yet');

// Experimental-only: the honest state while a new build is being fingerprinted. The section must
// not claim any patching is verified.
const experimentalOnly = renderSupportedVersionsSection([{ version: '1.91.0', experimental: true }]);
contains('render: experimental-only admits no verified target', experimentalOnly, 'no verified target yet');
check('render: experimental-only never says "patches"', !experimentalOnly.includes('This release patches'));

// An empty Constants.kt must fail loudly rather than publish a section that supports nothing.
let threw = false;
try {
  renderSupportedVersionsSection([]);
} catch {
  threw = true;
}
check('render: no targets at all throws', threw);

// ---- the real Constants.kt ----------------------------------------------------

// The JS invariant SupportedVersionsPolicyTest enforces in Kotlin: SUPPORTED_APP_VERSION names
// the newest normal target. Asserted here too because this module is the other reader of the
// file -- if the two ever disagree, one of them has been blinded.
const real = fs.readFileSync(CONSTANTS_FILE, 'utf8');
const realTargets = parseTargets(real);
const realNormal = realTargets.filter((t) => !t.experimental);
const constant = parseSupportedAppVersion(real);
check('real: at least one target parsed', realTargets.length > 0);
equal('real: newest normal target is SUPPORTED_APP_VERSION', realNormal[0]?.version, constant);
const section = renderSupportedVersionsSection(realTargets);
check(
  'real: every normal target named in the section',
  realNormal.every((t) => section.includes(t.version))
);

// ---- the shipped plugin module, end to end ------------------------------------

// The module the release actually runs was previously exercised only by release-debug.mjs --
// which runs in release.yml, not build.yml -- so a broken import or lost export reached the next
// release dispatch before failing. Run it here against a synthetic Constants.kt via the
// pluginConfig.file override.
const pluginModule = await import(
  pathToFileURL(path.join(REPO_ROOT, '.github', 'scripts', 'supported-versions-notes.mjs')).href
);
const plugin = pluginModule.default;

const scratch = fs.mkdtempSync(path.join(os.tmpdir(), 'ytvr-notes-test-'));
try {
  const fake = path.join(scratch, 'Constants.kt');
  fs.writeFileSync(fake, 'AppTarget(\n    version = "2.0.0",\n    description = "Verified.",\n),\n', 'utf8');
  const rendered = await plugin.generateNotes({ file: fake }, {});
  check('plugin: generateNotes is a function', typeof plugin.generateNotes === 'function');
  contains('plugin: renders the section from the overridden file', rendered, '**YouTube VR 2.0.0**');

  const missing = path.join(scratch, 'gone.kt');
  let missingThrew = null;
  try {
    await plugin.generateNotes({ file: missing }, {});
  } catch (error) {
    missingThrew = error;
  }
  check(
    'plugin: a missing Constants.kt throws the loud error',
    missingThrew !== null && missingThrew.message.includes('Constants.kt not found at')
  );
} finally {
  fs.rmSync(scratch, { recursive: true, force: true });
}

// ---- the .releaserc.js wiring -------------------------------------------------

// Every local module path the release config names must exist and expose either a generateNotes
// (plugin) or a default function (preset/config). A rename or a typo in .releaserc.js otherwise
// surfaces only inside the release run.
//
// build.yml installs no npm dependencies (its script tests are deliberately dependency-free), so
// a module that imports the release toolchain -- the changelog preset and its
// conventional-changelog-conventionalcommits -- cannot be loaded here. That module's full load
// check is release.yml's job: npm ci runs first, and release-debug.mjs resolves the preset, the
// writer, and renders through it before anything publishes. Here a missing third-party package
// while the toolchain is absent is a stated skip, never a silent pass; any other load failure
// fails.
const toolchainInstalled = fs.existsSync(path.join(REPO_ROOT, 'node_modules', 'semantic-release'));
const rc = (await import(pathToFileURL(path.join(REPO_ROOT, '.releaserc.js')).href)).default;
const localPaths = [];
(function walk(node) {
  if (typeof node === 'string') {
    // Module paths only: the config also carries shell commands (prepareCmd's "./gradlew ...")
    // that begin with './' but are not modules.
    if (node.startsWith('./') && node.endsWith('.mjs')) localPaths.push(node);
  } else if (Array.isArray(node)) {
    node.forEach(walk);
  } else if (node && typeof node === 'object') {
    Object.values(node).forEach(walk);
  }
})(rc.plugins);
check('wiring: at least one local module referenced', localPaths.length > 0);
for (const localPath of localPaths) {
  const absolute = path.join(REPO_ROOT, localPath);
  if (!fs.existsSync(absolute)) {
    check(`wiring: ${localPath} exists`, false);
    continue;
  }
  check(`wiring: ${localPath} exists`, true);
  try {
    const loaded = await import(pathToFileURL(absolute).href);
    const usable =
      typeof loaded.default === 'function' ||
      (loaded.default && typeof loaded.default.generateNotes === 'function');
    check(`wiring: ${localPath} loads and exports a usable module`, Boolean(usable));
  } catch (error) {
    if (!toolchainInstalled && error?.code === 'ERR_MODULE_NOT_FOUND') {
      console.log(
        `  note  wiring: ${localPath} needs the release toolchain (npm ci), not installed in ` +
          'this workflow -- existence asserted here; the load check runs in release.yml ' +
          '(release-debug.mjs) after npm ci'
      );
    } else {
      check(`wiring: ${localPath} loads and exports a usable module`, false);
      console.log(error?.stack ?? error);
    }
  }
}

console.log(
  failures === 0
    ? 'SupportedVersionsNotesTest: OK (every expectation held)'
    : `SupportedVersionsNotesTest: ${failures} FAILURE(S)`
);
process.exit(failures === 0 ? 0 : 1);
