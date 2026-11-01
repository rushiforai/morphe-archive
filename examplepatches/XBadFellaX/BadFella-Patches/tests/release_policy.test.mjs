import assert from 'node:assert/strict';
import { fileURLToPath } from 'node:url';
import { test } from 'node:test';
import { cosmiconfig } from 'cosmiconfig';
import { analyzeCommits } from '@semantic-release/commit-analyzer';

const cwd = fileURLToPath(new URL('..', import.meta.url));
const { config } = await cosmiconfig('release').load(fileURLToPath(new URL('../.releaserc', import.meta.url)));
const options = config.plugins.find(plugin => Array.isArray(plugin) && plugin[0] === '@semantic-release/commit-analyzer')[1];

async function releaseType(messages) {
  return analyzeCommits(options, {
    cwd,
    commits: messages.map((message, index) => ({ hash: String(index), message })),
    logger: { log() {} },
  });
}

for (const [message, expected] of [
  ['fix(peptalk): correct anchor validation', 'patch'],
  ['feat(peptalk): add a genuinely new capability', 'minor'],
  ['feat: add support for a new app', 'minor'],
  ['bump(peptalk): support a compatible app update', 'patch'],
  ['perf(peptalk): reduce patching work', 'patch'],
  ['fix(peptalk): migrate configuration\n\nBREAKING CHANGE: old configuration is no longer accepted', 'major'],
  ['feat(peptalk)!: remove legacy support', 'major'],
  ['fix!: require the new source format', 'major'],
  ['build(Needs bump): update the bundled runtime', 'patch'],
  ['docs: explain the release process', null],
  ['test: cover release classification', null],
  ['chore(release): update release tooling', null],
]) {
  test(`${message.split('\n')[0]} -> ${expected ?? 'no release'}`, async () => {
    assert.equal(await releaseType([message]), expected);
  });
}

test('one bundle release uses the highest required bump across apps and commits', async () => {
  assert.equal(await releaseType(['fix(peptalk): correct validation', 'feat(emby): add a new option']), 'minor');
  assert.equal(await releaseType(['feat(peptalk): add an option', 'fix(emby)!: remove an incompatible setting']), 'major');
});
