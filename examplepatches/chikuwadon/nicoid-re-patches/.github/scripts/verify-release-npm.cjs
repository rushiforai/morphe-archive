#!/usr/bin/env node
'use strict';

// Issue #110: npm v11.21.2 includes fixed undici@6.29.1 inside its bundle.
// Check the actual published npm package, not only the top-level override.
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '../..');
const json = relative => JSON.parse(fs.readFileSync(path.join(root, relative), 'utf8'));
const pkg = json('package.json');
const lock = json('package-lock.json');

assert.equal(pkg.overrides.npm, '11.21.2', 'npm override should use the fixed release');
assert.equal(lock.packages[''].overrides, undefined);
assert.equal(lock.packages['node_modules/npm'].version, '11.21.2',
  'Lockfile must contain fixed npm release');
assert.equal(lock.packages['node_modules/npm/node_modules/undici'].version, '6.29.1',
  'Lockfile must contain fixed bundled undici');
assert.match(lock.packages['node_modules/npm'].integrity, /^sha512-/,
  'Published npm package integrity required');

for (const [relative, expected] of [
  ['node_modules/npm/package.json', '11.21.2'],
  ['node_modules/npm/node_modules/undici/package.json', '6.29.1']
]) {
  const file = path.join(root, relative);
  if (!fs.existsSync(file)) continue;
  assert.equal(JSON.parse(fs.readFileSync(file, 'utf8')).version, expected,
    'Installed build tool version mismatch: ' + relative);
}

console.log('PASS: fixed npm 11.21.2, bundled undici 6.29.1, integrity-pinned lockfile');
