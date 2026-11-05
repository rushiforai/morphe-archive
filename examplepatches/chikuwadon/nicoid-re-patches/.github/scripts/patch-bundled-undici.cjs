#!/usr/bin/env node
'use strict';

// Workaround for npm/cli#10163 until a patched npm v11 package is released.
// npm@11.21.1 bundles undici@6.29.0 inside its own distribution. The npm
// "overrides" field cannot replace that vendored copy in the published tarball.
// Use the already-lockfile-pinned undici@6.29.1 installed by "npm ci".
// This affects build tooling only; it does not change the Android application.

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '../..');
const lock = JSON.parse(fs.readFileSync(path.join(root, 'package-lock.json'), 'utf8'));
const packages = lock.packages || {};
const vulnerableKey = 'node_modules/npm/node_modules/undici';
const patchedKey = 'node_modules/@actions/http-client/node_modules/undici';
const vulnerable = path.join(root, vulnerableKey);
const patched = path.join(root, patchedKey);

const lockSource = packages[patchedKey];
const lockTarget = packages[vulnerableKey];
assert.equal(lockSource && lockSource.version, '6.29.1',
  'Pinned, patched undici@6.29.1 must exist in the lockfile');
assert.ok(lockSource.integrity && lockSource.integrity.startsWith('sha512-'),
  'Pinned undici source must have an integrity hash');
assert.ok(lockTarget && ['6.29.0', '6.29.1'].includes(lockTarget.version),
  'Unexpected npm bundled undici version; review before proceeding');

function installedVersion(dir) {
  const file = path.join(dir, 'package.json');
  return fs.existsSync(file) ? JSON.parse(fs.readFileSync(file, 'utf8')).version : null;
}
const sourceVersion = installedVersion(patched);
const targetVersion = installedVersion(vulnerable);
assert.equal(sourceVersion, '6.29.1',
  'Patched undici copy must be installed by npm ci');
if (targetVersion === '6.29.1') {
  console.log('Bundled npm undici is already patched (6.29.1).');
  process.exit(0);
}
assert.equal(targetVersion, '6.29.0',
  'Unexpected installed npm bundled undici; fail closed');

const staging = vulnerable + '.patched';
try {
  fs.rmSync(staging, { recursive: true, force: true });
  fs.cpSync(patched, staging, { recursive: true, force: true });
  assert.equal(installedVersion(staging), '6.29.1');
  fs.rmSync(vulnerable, { recursive: true, force: true });
  fs.renameSync(staging, vulnerable);
  assert.equal(installedVersion(vulnerable), '6.29.1');
  console.log('Replaced build-tool npm bundled undici@6.29.0 with pinned undici@6.29.1.');
} finally {
  fs.rmSync(staging, { recursive: true, force: true });
}

// The lockfile still describes npm's upstream tarball, so npm audit can
// continue reporting the upstream issue until npm publishes a fixed version.
