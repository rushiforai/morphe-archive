import { describe, expect, test } from 'bun:test';
import { spawnSync } from 'node:child_process';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';

const ROOT = path.resolve(import.meta.dir, '..');
const SEMANTIC_RELEASE = path.join(
  ROOT,
  'node_modules',
  '.bin',
  'semantic-release',
);

function git(cwd: string, args: string[], env: NodeJS.ProcessEnv): string {
  const result = spawnSync('git', args, {
    cwd,
    encoding: 'utf8',
    env,
    timeout: 30_000,
  });
  if (result.status !== 0) {
    throw new Error(
      `git ${args.join(' ')} failed: ${(result.stderr || result.stdout).trim()}`,
    );
  }
  return result.stdout.trim();
}

describe('release dry run', () => {
  test('config excludes every prepare, publish, and success plugin', () => {
    const config = fs.readFileSync(
      path.join(ROOT, 'release.dryrun.config.mjs'),
      'utf8',
    );
    for (const plugin of [
      '@semantic-release/git',
      '@semantic-release/github',
      '@semantic-release/exec',
      '@semantic-release/changelog',
      '@semantic-release/npm',
      'gradle-semantic-release-plugin',
      'semantic-release-backmerge',
    ]) {
      expect(config).not.toContain(plugin);
    }
  });

  test('resolves the next version offline without touching the remote', () => {
    const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'release-dry-run-'));
    const repo = path.join(temp, 'repo');
    const origin = path.join(temp, 'origin.git');
    const globalConfig = path.join(temp, 'gitconfig');
    fs.mkdirSync(repo);
    fs.writeFileSync(globalConfig, '');

    // Build the fixture environment from scratch. Inheriting the runner's
    // GITHUB_ACTIONS/CI/GITHUB_REF vars makes semantic-release treat the run
    // as a GitHub Actions PR or unsupported branch instead of a local dry
    // run. Keep only what git and the Node executable need.
    const gitEnv: NodeJS.ProcessEnv = {
      HOME: temp,
      GIT_CONFIG_GLOBAL: globalConfig,
      GIT_CONFIG_NOSYSTEM: '1',
      GIT_TERMINAL_PROMPT: '0',
      GIT_AUTHOR_NAME: 'Release Dry Run',
      GIT_AUTHOR_EMAIL: 'release-dry-run@example.com',
      GIT_COMMITTER_NAME: 'Release Dry Run',
      GIT_COMMITTER_EMAIL: 'release-dry-run@example.com',
    };
    for (const key of [
      'PATH',
      'TMPDIR',
      'TMP',
      'TEMP',
      'LANG',
      'LC_ALL',
      'SystemRoot',
      'ComSpec',
      'PATHEXT',
    ]) {
      const value = process.env[key];
      if (value !== undefined) {
        gitEnv[key] = value;
      }
    }

    try {
      git(repo, ['init', '-q', '-b', 'release/main', '.'], gitEnv);
      git(repo, ['config', 'commit.gpgSign', 'false'], gitEnv);
      git(repo, ['config', 'tag.gpgSign', 'false'], gitEnv);
      git(repo, ['config', 'user.name', 'Release Dry Run'], gitEnv);
      git(
        repo,
        ['config', 'user.email', 'release-dry-run@example.com'],
        gitEnv,
      );
      git(temp, ['init', '-q', '--bare', origin], gitEnv);
      git(repo, ['remote', 'add', 'origin', `file://${origin}`], gitEnv);

      fs.writeFileSync(path.join(repo, 'package.json'), '{}\n');
      git(repo, ['add', 'package.json'], gitEnv);
      git(repo, ['commit', '-q', '-m', 'chore(release): initial'], gitEnv);
      git(repo, ['tag', 'v1.0.0'], gitEnv);
      git(repo, ['push', '-q', 'origin', 'release/main', '--tags'], gitEnv);

      fs.writeFileSync(path.join(repo, 'feature.txt'), 'feature\n');
      git(repo, ['add', 'feature.txt'], gitEnv);
      git(repo, ['commit', '-q', '-m', 'feat(core): add feature'], gitEnv);
      git(repo, ['push', '-q', 'origin', 'release/main'], gitEnv);
      git(
        temp,
        [
          '--git-dir',
          origin,
          'symbolic-ref',
          'HEAD',
          'refs/heads/release/main',
        ],
        gitEnv,
      );

      fs.copyFileSync(
        path.join(ROOT, 'release.dryrun.config.mjs'),
        path.join(repo, 'release.dryrun.config.mjs'),
      );
      fs.symlinkSync(
        path.join(ROOT, 'node_modules'),
        path.join(repo, 'node_modules'),
        'dir',
      );

      const before = git(repo, ['ls-remote', 'origin'], gitEnv);

      const result = spawnSync(
        SEMANTIC_RELEASE,
        ['--dry-run', '--extends', './release.dryrun.config.mjs'],
        {
          cwd: repo,
          encoding: 'utf8',
          env: gitEnv,
          timeout: 120_000,
        },
      );
      const output = `${result.stdout ?? ''}\n${result.stderr ?? ''}`;

      expect(result.error).toBeUndefined();
      if (result.status !== 0) {
        throw new Error(`semantic-release dry run failed:\n${output}`);
      }
      expect(result.status).toBe(0);
      expect(output).toContain('The next release version is 1.1.0');
      expect(git(repo, ['ls-remote', 'origin'], gitEnv)).toBe(before);
    } finally {
      fs.rmSync(temp, { recursive: true, force: true });
    }
  }, 120_000);
});
