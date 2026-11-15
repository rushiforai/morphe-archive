#!/usr/bin/env node
'use strict';

// Verify the release tooling's unused npm publication plugin stays disabled.
// The upstream semantic-release dependency otherwise bundles an entire npm CLI,
// including minimatch <11.0.1 (GHSA-g3hv-75wg-m249).
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '../..');
const json = relative => JSON.parse(fs.readFileSync(path.join(root, relative), 'utf8'));
const pkg = json('package.json');
const lock = json('package-lock.json');
const config = json('.releaserc');
const stubPath = '.github/stubs/semantic-release-npm-disabled';
const stub = json(stubPath + '/package.json');
const plugins = config.plugins.map(plugin => Array.isArray(plugin) ? plugin[0] : plugin);

assert.ok(!plugins.includes('@semantic-release/npm'),
  'The project must not enable npm registry publishing without a separate review');
assert.equal(pkg.devDependencies['@semantic-release/npm'], 'file:./' + stubPath,
  'Unused npm publication plugin must be replaced by a local stub');
assert.equal(pkg.overrides['@semantic-release/npm'], undefined,
  'Do not use an npm override to substitute the unused plugin');
assert.equal(pkg.overrides.npm, undefined,
  'Do not force an unused, bundled npm CLI into the dependency tree');
assert.equal(stub.name, '@semantic-release/npm');
assert.equal(stub.private, true);
assert.equal(lock.packages[''].overrides, undefined);
assert.equal(lock.packages['node_modules/npm'], undefined,
  'Unused npm CLI still installed: regenerate the lockfile and investigate');
assert.equal(lock.packages['node_modules/@semantic-release/npm']?.link, true,
  'The unused npm plugin must resolve to the reviewed local stub');

// GHSA-g3hv-75wg-m249: all versions >=7.0.0 and <11.0.1 are affected.
const isAffectedMinimatch = version => {
  const numbers = (version || '').split('.').map(Number);
  if (numbers.length < 3 || numbers.slice(0, 3).some(n => !Number.isInteger(n))) return true;
  const [major, minor, patch] = numbers;
  return major >= 7 && (major < 11 || (major === 11 && minor === 0 && patch < 1));
};
const affected = Object.entries(lock.packages)
  .filter(([name, entry]) => name.endsWith('/minimatch') && isAffectedMinimatch(entry.version))
  .map(([name]) => name);
assert.deepEqual(affected, [],
  'Unpatched minimatch detected in the dependency lockfile');

const installedPlugin = path.join(root, 'node_modules/@semantic-release/npm/package.json');
if (fs.existsSync(installedPlugin)) {
  assert.equal(JSON.parse(fs.readFileSync(installedPlugin, 'utf8')).private, true,
    'The installed npm plugin must match the local disabled stub');
}

console.log('PASS: unused npm publication plugin disabled, no bundled npm CLI or vulnerable minimatch');
