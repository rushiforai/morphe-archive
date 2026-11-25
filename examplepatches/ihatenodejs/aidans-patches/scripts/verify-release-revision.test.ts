import { afterEach, describe, expect, test } from 'bun:test';
import { spawnSync } from 'node:child_process';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';

const SCRIPT = path.join(import.meta.dir, 'verify-release-revision.ts');

function git(cwd: string, args: string[]): string {
  const result = spawnSync('git', args, {
    cwd,
    encoding: 'utf8',
    env: { ...process.env, GIT_TERMINAL_PROMPT: '0' },
  });
  if (result.status !== 0) {
    throw new Error(
      `git ${args.join(' ')} failed: ${(result.stderr || result.stdout).trim()}`,
    );
  }
  return result.stdout.trim();
}

function commit(cwd: string, file: string, content: string): string {
  fs.writeFileSync(path.join(cwd, file), content);
  git(cwd, ['add', file]);
  git(cwd, ['commit', '-m', `add ${file}`]);
  return git(cwd, ['rev-parse', 'HEAD']);
}

function runGuard(cwd: string, remote: string, branch: string, sha: string) {
  return spawnSync(
    'bun',
    [
      SCRIPT,
      '--cwd',
      cwd,
      '--remote',
      remote,
      '--branch',
      branch,
      '--sha',
      sha,
    ],
    { encoding: 'utf8', env: { ...process.env, GIT_TERMINAL_PROMPT: '0' } },
  );
}

const tempDirs: string[] = [];

function fixture(): { root: string; work: string; remote: string } {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'release-revision-'));
  tempDirs.push(root);
  const remote = path.join(root, 'remote.git');
  const work = path.join(root, 'work');
  git(root, ['init', '--bare', remote]);
  git(root, ['init', '-b', 'dev', work]);
  git(work, ['config', 'user.email', 'test@example.com']);
  git(work, ['config', 'user.name', 'Release Test']);
  git(work, ['remote', 'add', 'origin', remote]);
  commit(work, 'file.txt', 'one\n');
  git(work, ['push', '-u', 'origin', 'dev']);
  return { root, work, remote };
}

afterEach(() => {
  for (const dir of tempDirs.splice(0)) {
    fs.rmSync(dir, { recursive: true, force: true });
  }
});

describe('verify-release-revision', () => {
  test('accepts the verified SHA while the remote branch is unchanged', () => {
    const { work, remote } = fixture();
    const sha = git(work, ['rev-parse', 'HEAD']);

    const result = runGuard(work, remote, 'dev', sha);

    expect(result.status).toBe(0);
    expect(result.stdout).toContain(`still points at verified revision ${sha}`);
  });

  test('rejects a branch that advanced after verification', () => {
    const { root, work, remote } = fixture();
    const verifiedSha = git(work, ['rev-parse', 'HEAD']);

    expect(runGuard(work, remote, 'dev', verifiedSha).status).toBe(0);

    // Simulate another push landing after verification. The release checkout
    // stays at the verified SHA; a separate clone creates the new remote tip.
    const fresh = path.join(root, 'fresh');
    git(root, ['clone', '--branch', 'dev', remote, fresh]);
    git(fresh, ['config', 'user.email', 'test@example.com']);
    git(fresh, ['config', 'user.name', 'Release Test']);
    const advancedSha = commit(fresh, 'file.txt', 'two\n');
    git(fresh, ['push', 'origin', 'dev']);

    const advanced = runGuard(work, remote, 'dev', verifiedSha);
    expect(advanced.status).toBe(1);
    expect(advanced.stderr).toContain('moved');
    expect(advanced.stderr).toContain(verifiedSha);
    expect(advanced.stderr).toContain('new run must verify the new tip');

    const freshRun = runGuard(fresh, remote, 'dev', advancedSha);
    expect(freshRun.status).toBe(0);
  });

  test('a release commit based on the verified SHA cannot publish after the branch advanced', () => {
    const { work, remote } = fixture();
    const verifiedSha = git(work, ['rev-parse', 'HEAD']);

    // Model @semantic-release/git preparing a commit on the verified tree.
    commit(work, 'CHANGELOG.md', 'release metadata\n');
    const releaseCommit = git(work, ['rev-parse', 'HEAD']);
    git(work, ['reset', '--hard', verifiedSha]);

    // Another push lands before the release commit is pushed.
    commit(work, 'file.txt', 'two\n');
    git(work, ['push', 'origin', 'dev']);

    const push = spawnSync('git', ['push', 'origin', `${releaseCommit}:dev`], {
      cwd: work,
      encoding: 'utf8',
      env: { ...process.env, GIT_TERMINAL_PROMPT: '0' },
    });

    expect(push.status).not.toBe(0);
    expect(`${push.stdout}\n${push.stderr}`).toMatch(
      /rejected|non-fast-forward/,
    );
    expect(git(work, ['ls-remote', remote, 'refs/heads/dev'])).toContain(
      git(work, ['rev-parse', 'HEAD']),
    );
  });

  test('rejects a missing remote branch', () => {
    const { work, remote } = fixture();
    const sha = git(work, ['rev-parse', 'HEAD']);

    const result = runGuard(work, remote, 'missing', sha);

    expect(result.status).toBe(1);
    expect(result.stderr).toContain('does not exist');
  });

  test('rejects a working tree that is not the verified SHA', () => {
    const { work, remote } = fixture();
    const verifiedSha = git(work, ['rev-parse', 'HEAD']);
    const localSha = commit(work, 'other.txt', 'other\n');

    const result = runGuard(work, remote, 'dev', verifiedSha);

    expect(result.status).toBe(1);
    expect(result.stderr).toContain('is not the verified revision');
    expect(result.stderr).toContain(localSha);
  });
});
