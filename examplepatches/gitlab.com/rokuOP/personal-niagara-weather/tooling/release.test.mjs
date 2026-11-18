import test from 'node:test';
import assert from 'node:assert/strict';
import {mkdtemp, readFile, rm} from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import prepare from './changelog/lib/prepare.js';
import YAML from 'yaml';
import {execFileSync} from 'node:child_process';

for (const [host, namespace] of [['gitlab.com', 'rokuOP'], ['gitlab.com', 'group/subgroup'], ['github.com', 'owner']]) {
  test(`template release metadata for ${host}/${namespace}`, async () => {
    const prefix = path.join(os.tmpdir(), 'personal-weather-release-');
    const cwd = await mkdtemp(prefix);
    try {
      await prepare({releaseJson: {
        path: 'patches-bundle.json',
        downloadUrlTemplate: 'https://' + host + '/${owner}/${repo}/-/releases/v${version}/downloads/patches-${version}.mpp',
        signatureUrlTemplate: '',
      }}, {
        cwd,
        nextRelease: {version: '1.0.3-dev.1', notes: '## Weather release\n\nMetadata compatibility fix.'},
        options: {repositoryUrl: `https://${host}/${namespace}/personal-niagara-weather.git`},
        logger: {log() {}},
      });
      const manifest = JSON.parse(await readFile(path.join(cwd, 'patches-bundle.json'), 'utf8'));
      assert.equal(manifest.version, '1.0.3-dev.1');
      assert.equal(manifest.download_url, `https://${host}/${namespace}/personal-niagara-weather/-/releases/v1.0.3-dev.1/downloads/patches-1.0.3-dev.1.mpp`);
      assert.match(manifest.created_at, /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$/);
      assert.equal(manifest.signature_download_url, '');
      assert.match(await readFile(path.join(cwd, 'CHANGELOG.md'), 'utf8'), /Metadata compatibility fix/);
    } finally {
      const resolved = path.resolve(cwd);
      assert.ok(resolved.startsWith(path.resolve(prefix)));
      await rm(resolved, {recursive: true, force: true});
    }
  });
}

test('release configuration keeps development and stable channels with GitLab job-token assets', async () => {
  const config = JSON.parse(await readFile(new URL('../.releaserc', import.meta.url), 'utf8'));
  assert.deepEqual(config.branches, ['main', {name: 'dev', prerelease: true}]);
  const gitlab = config.plugins.find(p => Array.isArray(p) && p[0] === '@semantic-release/gitlab');
  assert.equal(gitlab[1].useJobToken, true);
  assert.equal(gitlab[1].assets[0].target, 'generic_package');
  // GitLab's plugin uses label as the generic package filename; spaces are invalid.
  assert.equal(gitlab[1].assets[0].label, undefined);
  assert.equal(gitlab[1].assets[0].filepath, '/patches-${nextRelease.version}.mpp');
  assert.ok(config.plugins.some(p => Array.isArray(p) && p[0] === '@semantic-release/git'));
  const backmerge = config.plugins.find(p => Array.isArray(p) && p[0] === '@cleyrop-org/semantic-release-backmerge');
  assert.equal(backmerge[1].backmergeStrategy, 'merge');
  assert.equal(backmerge[1].forcePush, false);
});

test('GitLab port keeps the template release steps and project-local job authentication', async () => {
  const pipeline = YAML.parse(await readFile(new URL('../.gitlab-ci.yml', import.meta.url), 'utf8'));
  assert.equal(pipeline.variables.GIT_DEPTH, '0');
  assert.equal(pipeline.release.resource_group, 'semantic-release');
  const commands = [...pipeline.release.before_script, ...pipeline.release.script];
  assert.ok(commands.every(command => typeof command === 'string'));
  assert.ok(commands.some(command => command.includes('npm ci --ignore-scripts')));
  assert.ok(commands.some(command => command.includes('npm test')));
  assert.ok(commands.some(command => command.includes(':patches:buildAndroid')));
  assert.ok(commands.some(command => command.includes('npx --no-install semantic-release')));
  assert.ok(commands.some(command => command.includes('gitlab-ci-token:${CI_JOB_TOKEN}')));
});

test('Windows wrapper is normalized in Git so release backmerges stay clean', () => {
  const attributes = execFileSync('git', ['ls-files', '--eol', 'gradlew.bat'], {encoding: 'utf8'});
  assert.match(attributes, /^i\/lf\s/);
  assert.match(attributes, /eol=crlf/);
});
