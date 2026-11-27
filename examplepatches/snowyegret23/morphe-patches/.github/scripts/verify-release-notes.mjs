import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { pathToFileURL } from 'node:url';
import semanticRelease from 'semantic-release';
import { analyzeCommits } from '@semantic-release/commit-analyzer';
import { prepare } from '@MorpheApp/changelog';

const config = JSON.parse(fs.readFileSync('.releaserc', 'utf8'));
const plugin = name => config.plugins.find(value => Array.isArray(value) && value[0] === name)[1];
const logger = { log() {} };
const options = { repositoryUrl: `https://github.com/${process.env.GITHUB_REPOSITORY || 'snowyegret23/morphe-patches'}.git` };
const context = { cwd: process.cwd(), logger, options };
const notesSpec = config.plugins.find(value => Array.isArray(value) && value[0].includes('release-notes-generator'));
const { generateNotes } = await import(pathToFileURL(path.resolve(notesSpec[0])).href);

assert.equal(typeof semanticRelease, 'function');
const cases = [['feat: feature', 'patch'], ['fix: bug', 'patch'], ['bump: support', 'patch'], ['perf: speed', 'patch'], ['feat(minor): feature', 'minor'], ['chore: maintenance', null]];
for (const [message, expected] of cases) {
  assert.equal(await analyzeCommits(plugin('@semantic-release/commit-analyzer'), { ...context, commits: [{ message, hash: 'a'.repeat(40) }] }), expected);
}

const messages = ['feat: visible feature', 'fix: visible fix', 'bump: visible support', 'perf: visible speed', 'build: hidden build', 'chore: hidden maintenance'];
const nextRelease = { version: '0.0.2', gitTag: 'v0.0.2' };
const notes = await generateNotes(notesSpec[1], {
  ...context,
  commits: messages.map((message, index) => ({ message, hash: String(index + 1).padStart(40, '0') })),
  lastRelease: { gitTag: 'v0.0.1' },
  nextRelease
});
for (const value of ['New Features', 'Bug Fixes', 'Updated App Support', 'Improvements', 'visible feature', 'visible fix', 'visible support', 'visible speed', 'compare/v0.0.1...v0.0.2']) assert.ok(notes.includes(value), value);
for (const value of ['hidden build', 'hidden maintenance', '{{', 'Missing helper']) assert.ok(!notes.includes(value), value);

const temporary = fs.mkdtempSync(path.join(os.tmpdir(), 'chzzk-release-check-'));
try {
  await prepare(plugin('@MorpheApp/changelog'), { ...context, cwd: temporary, nextRelease: { ...nextRelease, notes } });
  const bundle = JSON.parse(fs.readFileSync(path.join(temporary, 'patches-bundle.json'), 'utf8'));
  assert.equal(bundle.version, nextRelease.version);
  assert.equal(bundle.download_url, `${options.repositoryUrl.slice(0, -4)}/releases/download/v0.0.2/patches-0.0.2.mpp`);
  assert.equal(bundle.signature_download_url, '');
  assert.equal(bundle.description, notes.trim());
  assert.ok(fs.readFileSync(path.join(temporary, 'CHANGELOG.md'), 'utf8').includes(notes.trim()));
} finally {
  fs.rmSync(temporary, { recursive: true, force: true });
}
console.log('Release rules, release notes and bundle metadata verified.');
