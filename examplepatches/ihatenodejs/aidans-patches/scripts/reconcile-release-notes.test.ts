import { afterAll, beforeAll, describe, expect, test } from 'bun:test';
import { spawnSync } from 'node:child_process';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';
import getBranchTags from 'semantic-release/lib/branches/get-tags.js';
import getLastRelease from 'semantic-release/lib/get-last-release.js';

const SCRIPT = path.join(import.meta.dir, 'reconcile-release-notes.ts');
const BOT_NAME = 'semantic-release-bot';
const BOT_EMAIL = 'semantic-release-bot@martynus.net';
const TAG_FORMAT = 'v${version}';

const root = fs.mkdtempSync(path.join(os.tmpdir(), 'release-notes-'));
const home = path.join(root, 'home');
const remote = path.join(root, 'remote.git');
const work = path.join(root, 'work');
const env = {
  ...process.env,
  HOME: home,
  GIT_CONFIG_GLOBAL: path.join(home, '.gitconfig'),
  GIT_CONFIG_NOSYSTEM: '1',
  GIT_TERMINAL_PROMPT: '0',
};

fs.mkdirSync(home);
fs.writeFileSync(env.GIT_CONFIG_GLOBAL, '');

interface RunResult {
  status: number;
  stdout: string;
  stderr: string;
}

function run(command: string, args: string[], cwd: string): RunResult {
  const result = spawnSync(command, args, {
    cwd,
    encoding: 'utf8',
    stdio: ['ignore', 'pipe', 'pipe'],
    env,
  });
  if (result.error) {
    throw result.error;
  }
  return {
    status: result.status ?? 1,
    stdout: result.stdout ?? '',
    stderr: result.stderr ?? '',
  };
}

function git(cwd: string, args: string[]): string {
  const result = run('git', args, cwd);
  if (result.status !== 0) {
    throw new Error(
      `git ${args.join(' ')} failed: ${result.stderr || result.stdout}`,
    );
  }
  return result.stdout;
}

function gitAllowFailure(cwd: string, args: string[]): RunResult {
  return run('git', args, cwd);
}

let commitCounter = 0;

function commit(message: string, author = BOT_NAME): string {
  commitCounter += 1;
  fs.writeFileSync(
    path.join(work, `file-${commitCounter}.txt`),
    `${message}\n`,
  );
  git(work, ['add', '.']);
  git(work, [
    '-c',
    `user.name=${author}`,
    '-c',
    `user.email=${author === BOT_NAME ? BOT_EMAIL : 'human@example.com'}`,
    'commit',
    '-m',
    message,
  ]);
  return git(work, ['rev-parse', 'HEAD']).trim();
}

function pushRefs(...refs: string[]): void {
  git(work, ['push', '--no-verify', 'origin', ...refs]);
}

function remoteNote(tag: string): string | null {
  const result = gitAllowFailure(remote, [
    '--git-dir',
    remote,
    'notes',
    `--ref=semantic-release-${tag}`,
    'show',
    `${tag}^{commit}`,
  ]);
  return result.status === 0 ? result.stdout.trim() : null;
}

function localNoteRef(tag: string): string {
  const result = gitAllowFailure(work, [
    'rev-parse',
    '--verify',
    '--quiet',
    `refs/notes/semantic-release-${tag}`,
  ]);
  return result.status === 0 ? result.stdout.trim() : '';
}

function reconcile(args: string[]): RunResult {
  return run('bun', [SCRIPT, '--cwd', work, ...args], root);
}

beforeAll(() => {
  git(root, ['init', '--bare', remote]);
  fs.mkdirSync(work);
  git(root, ['init', '-b', 'dev', work]);
  git(work, ['config', 'user.name', BOT_NAME]);
  git(work, ['config', 'user.email', BOT_EMAIL]);
  git(work, ['remote', 'add', 'origin', remote]);

  fs.writeFileSync(
    path.join(work, '.releaserc'),
    `${JSON.stringify(
      {
        branches: ['main', { name: 'dev', prerelease: true }],
      },
      null,
      2,
    )}\n`,
  );
  const base = commit('chore: initialize release config');

  commit('chore: Release v1.0.0-dev.1 [skip ci]');
  git(work, ['tag', 'v1.0.0-dev.1']);
  git(work, [
    '-c',
    `user.name=${BOT_NAME}`,
    '-c',
    `user.email=${BOT_EMAIL}`,
    'notes',
    '--ref=semantic-release-v1.0.0-dev.1',
    'add',
    '-m',
    '{"channels":["dev"]}',
    'v1.0.0-dev.1^{commit}',
  ]);

  commit('chore: Release v1.0.0-dev.2 [skip ci]');
  git(work, ['tag', 'v1.0.0-dev.2']);

  commit('bump(app): update', 'Human Maintainer');
  git(work, ['tag', 'v1.0.0-dev.3']);

  commit('chore: Release v0.9.0 [skip ci]');
  git(work, ['tag', 'v0.9.0']);

  pushRefs('dev', '--tags');
  pushRefs('refs/notes/semantic-release-v1.0.0-dev.1');

  git(work, ['switch', '-c', 'main', base]);
  commit('chore: Release v0.5.0 [skip ci]');
  git(work, ['tag', 'v0.5.0']);
  pushRefs('main', 'refs/tags/v0.5.0');
  git(work, ['switch', 'dev']);
});

afterAll(() => {
  fs.rmSync(root, { recursive: true, force: true });
});

describe('reconcile-release-notes', () => {
  test('repairs only missing notes on semantic-release tags for the branch', () => {
    const result = reconcile(['--ref', 'dev']);
    expect(result.status).toBe(0);
    expect(result.stdout).toContain(
      'Backfilled missing release channel note for v1.0.0-dev.2',
    );

    expect(remoteNote('v1.0.0-dev.1')).toBe('{"channels":["dev"]}');
    expect(remoteNote('v1.0.0-dev.2')).toBe('{"channels":["dev"]}');
    expect(remoteNote('v1.0.0-dev.3')).toBeNull();
    expect(remoteNote('v0.9.0')).toBeNull();
  });

  test('is idempotent', () => {
    const before = localNoteRef('v1.0.0-dev.2');
    const result = reconcile(['--ref', 'dev']);
    expect(result.status).toBe(0);
    expect(result.stdout).toContain(
      "Release notes already reconciled for 'dev'",
    );
    expect(localNoteRef('v1.0.0-dev.2')).toBe(before);
  });

  test('semantic-release selects the repaired tag as the last release', async () => {
    const branches = await getBranchTags(
      { cwd: work, env, options: { tagFormat: TAG_FORMAT } },
      [
        {
          name: 'dev',
          type: 'prerelease',
          prerelease: 'dev',
          channel: 'dev',
        },
      ],
    );

    const lastRelease = getLastRelease({
      branch: branches[0],
      options: { tagFormat: TAG_FORMAT },
    });

    expect(lastRelease.gitTag).toBe('v1.0.0-dev.2');
  });

  test('dry-run reports without writing', () => {
    commit('chore: Release v1.0.0-dev.4 [skip ci]');
    git(work, ['tag', 'v1.0.0-dev.4']);
    pushRefs('dev', 'refs/tags/v1.0.0-dev.4');

    const result = reconcile(['--ref', 'dev', '--dry-run']);
    expect(result.status).toBe(0);
    expect(result.stdout).toContain('Would backfill');
    expect(remoteNote('v1.0.0-dev.4')).toBeNull();
    expect(localNoteRef('v1.0.0-dev.4')).toBe('');
  });

  test('uses the null channel for release branches', () => {
    const result = reconcile(['--ref', 'main']);
    expect(result.status).toBe(0);
    expect(remoteNote('v0.5.0')).toBe('{"channels":[null]}');
    expect(remoteNote('v1.0.0-dev.4')).toBeNull();
  });

  test('skips branches without release config', () => {
    const result = reconcile(['--ref', 'release']);
    expect(result.status).toBe(0);
    expect(result.stdout).toContain('No release branch config matches');
  });
});
