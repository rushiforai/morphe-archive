#!/usr/bin/env node
'use strict';

const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');

async function main() {
  const root = path.resolve(__dirname, '../..');
  const config = JSON.parse(fs.readFileSync(path.join(root, '.releaserc'), 'utf8'));
  const noteConfig = config.plugins.find((plugin) =>
    Array.isArray(plugin) && plugin[0] === './.github/scripts/release-notes.cjs')[1];
  const { generateNotes } = require('./release-notes.cjs');
  const messages = [
    'feat: add regression test for streaming comments',
    'fix: preserve playback controls',
    'perf: reduce redundant calls',
    'build: refresh release tooling',
  ];
  const commits = messages.map((message, index) => ({
    message, hash: String(index + 1).repeat(40),
  }));
  const notes = await generateNotes(noteConfig, {
    cwd: root,
    options: { repositoryUrl: 'https://github.com/chikuwadon/nicoid-re-patches.git' },
    lastRelease: { gitTag: 'v2.0.5', version: '2.0.5' },
    nextRelease: { gitTag: 'v99.0.0', version: '99.0.0' },
    commits,
  });
  for (const expected of [
    '✨ New Features', '🐛 Bug Fixes', '🔧 Improvements',
    'add regression test for streaming comments', 'preserve playback controls',
    'reduce redundant calls',
  ]) {
    assert.ok(notes.includes(expected), 'Missing release-note content: ' + expected);
  }
  assert.ok(!notes.includes('refresh release tooling'), 'Hidden build change must not be displayed');
  assert.ok(notes.startsWith('## 99.0.0 ('), 'Morphe release note heading changed');

  const semanticRelease = await import('semantic-release');
  assert.equal(typeof semanticRelease.default, 'function');

  const mod = await import('@MorpheApp/changelog');
  assert.equal(typeof mod.prepare, 'function');
  assert.equal(typeof mod.verifyConditions, 'function');
  const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'nicoid-release-tools-'));
  try {
    const pluginOptions = config.plugins.find((plugin) =>
      Array.isArray(plugin) && plugin[0] === '@MorpheApp/changelog')[1];
    const context = {
      cwd: temp,
      options: { repositoryUrl: 'https://github.com/chikuwadon/nicoid-re-patches.git' },
      nextRelease: { version: '2.0.6', notes: '## 2.0.6 (2026-11-16)\n\n* **nicoid:** test changelog' },
      logger: { log() {} },
    };
    await mod.verifyConditions(pluginOptions, context);
    await mod.prepare(pluginOptions, context);
    const bundlePath = path.join(temp, 'patches-bundle.json');
    const release = JSON.parse(fs.readFileSync(bundlePath, 'utf8'));
    assert.equal(release.version, '2.0.6');
    assert.equal(release.download_url,
      'https://github.com/chikuwadon/nicoid-re-patches/releases/download/v2.0.6/patches-2.0.6.mpp');
    assert.equal(release.signature_download_url, '');
    assert.ok(release.description.includes('test changelog'));
    assert.ok(fs.readFileSync(path.join(temp, 'CHANGELOG.md'), 'utf8').includes('test changelog'));
  } finally {
    fs.rmSync(temp, { recursive: true, force: true });
  }
  console.log('PASS: peer-compatible release plugins, fallback notes and Morphe bundle metadata');
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
