import { execSync } from 'node:child_process';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';

// release.yml's npm ci holds one writer inside semantic-release's own subtree (writer@8 on
// the preset-9 pairing), not at the tree top, unlike the private tree the release action
// installs for itself. Resolve the way the release does -- from the preset, which is what
// imports the writer -- and report what is actually there instead of assuming a layout.
const candidatePluginPackages = [
  '@semantic-release/release-notes-generator',
  'semantic-release/node_modules/@semantic-release/release-notes-generator',
];
const pluginPackage = candidatePluginPackages
  .map((p) => path.join(process.cwd(), 'node_modules', p, 'package.json'))
  .find((p) => fs.existsSync(p));
if (!pluginPackage) throw new Error('release-notes-generator is not installed anywhere this script can see');
const pluginDir = path.dirname(pluginPackage);

const version = (file) => JSON.parse(fs.readFileSync(file, 'utf8')).version;
const packageRootOf = (entryUrl) => {
  let dir = path.dirname(fileURLToPath(entryUrl));
  while (!fs.existsSync(path.join(dir, 'package.json'))) dir = path.dirname(dir);
  return path.join(dir, 'package.json');
};
// Resolving a package the current tree does not hoist is not by itself a defect, so a
// failure here is reported rather than thrown.
const describe = (specifier, base) => {
  try {
    return version(packageRootOf(base ? import.meta.resolve(specifier, base) : import.meta.resolve(specifier)));
  } catch (error) {
    return `unresolvable from here (${error.code})`;
  }
};

const presetEntry = import.meta.resolve('conventional-changelog-conventionalcommits');
const pluginEntry = pathToFileURL(path.join(pluginDir, 'index.js')).href;

console.log('node:', process.version);
console.log('release-notes-generator:', version(pluginPackage));
console.log('preset:', describe('conventional-changelog-conventionalcommits'));
// What the preset would import. The release action hoists a writer next to the preset, so
// this is the number that decides the render there; in a tree that only nests one, the
// plugin resolves its own and this legitimately reads as unresolvable.
console.log('writer the preset could import:', describe('conventional-changelog-writer', presetEntry));
console.log('writer at the tree top:', describe('conventional-changelog-writer'));

const { generateNotes } = await import(pluginEntry);

// The commits the next release would actually see, so a rendering failure surfaces here
// instead of inside the release.
const raw = execSync('git log v1.22.1..HEAD --pretty=format:%H%x00%s%x00%b%x1e').toString();
const commits = raw.split('\u001e').filter(Boolean).map((r) => {
  const [hash, subject, body] = r.split('\u0000');
  return { hash, key: hash.slice(0, 8), message: subject + (body ? '\n\n' + body : ''),
           subject, header: subject, body: body || '', footer: null,
           mentions: [], notes: [], committerDate: new Date().toISOString() };
});

const pluginConfig = {
  preset: 'conventionalcommits',
  presetConfig: { types: [
    { type: 'fix', section: 'Bug Fixes', hidden: false },
    { type: 'feat', section: 'New Features', hidden: false },
    { type: 'bump', section: 'Updated App Support', hidden: false },
    { type: 'perf', section: 'Improvements', hidden: false },
    { type: 'build', hidden: true },
  ] },
};

try {
  const notes = await generateNotes(pluginConfig, {
    options: { repositoryUrl: 'https://github.com/commit-regrets/morphe-youtube-vr-patches.git' },
    branch: { type: 'release' },
    commits,
    releases: [],
    lastRelease: { version: '1.22.1', gitTag: 'v1.22.1', gitHead: 'e96c8d6' },
    nextRelease: { type: 'patch', version: '1.22.2', gitTag: 'v1.22.2' },
  });
  console.log('RENDER OK, first 2 lines:\n' + notes.split('\n').slice(0, 2).join('\n'));
} catch (e) {
  console.log('RENDER FAILED:');
  console.log(e.stack);
  process.exitCode = 1;
}

// The supported-versions plugin renders from the checkout's Constants.kt, not from a commit, so
// a broken module path or parser would otherwise surface only mid-release. Same deal: resolve
// and render it here, where failing is cheap.
try {
  // The plugin is an ESM default export ({ generateNotes }), the shape semantic-release itself
  // unwraps when it loads plugins -- mirror that unwrap here.
  const pluginModule = await import('./supported-versions-notes.mjs');
  const supportedVersionsNotes = (pluginModule.default ?? pluginModule).generateNotes;
  const section = await supportedVersionsNotes({}, {});
  console.log('supported-versions section: RENDER OK, as rendered:\n' + section);
} catch (e) {
  console.log('supported-versions section: RENDER FAILED:');
  console.log(e.stack);
  process.exitCode = 1;
}
