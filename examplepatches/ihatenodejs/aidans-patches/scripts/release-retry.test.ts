import { describe, expect, test } from 'bun:test';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';
import {
  classifyReleaseFailure,
  decideReleaseRetry,
  extractReleaseVersion,
  type GhResult,
  type Options,
} from './release-retry';

const VERSION_LINE =
  '[4:09:43 AM] [semantic-release] › ℹ  The next release version is 1.10.0-dev.9';

const REJECTED_PUSH = `
To https://github.com/ihatenodejs/aidans-patches
 ! [rejected]        HEAD -> dev (fetch first)
error: failed to push some refs to 'https://github.com/ihatenodejs/aidans-patches'
hint: Updates were rejected because the remote contains work that you do not
    at async push (file:///home/runner/work/aidans-patches/aidans-patches/node_modules/@semantic-release/git/lib/git.js:60:3)
`;

const MODE_A_LOG = `${VERSION_LINE}
Prepared Git release: v1.10.0-dev.9
${REJECTED_PUSH}`;

const VERIFIED_SHA = 'abc123';

describe('extractReleaseVersion', () => {
  test('reads the last version line', () => {
    const log = `The next release version is 1.9.0-dev.8\n${VERSION_LINE}`;
    expect(extractReleaseVersion(log)).toBe('1.10.0-dev.9');
  });

  test('strips ANSI color codes', () => {
    const log =
      '\u001b[1m\u001b[92mThe next release version is 1.10.0-dev.9\u001b[0m';
    expect(extractReleaseVersion(log)).toBe('1.10.0-dev.9');
  });

  test('returns null when no version was computed', () => {
    expect(extractReleaseVersion('build failed')).toBeNull();
  });
});

describe('classifyReleaseFailure', () => {
  test('retries a failed prepare push while the branch tip is unchanged', () => {
    const decision = classifyReleaseFailure(MODE_A_LOG, {
      tagExists: false,
      branchMoved: false,
    });
    expect(decision.retry).toBe(true);
    expect(decision.version).toBe('1.10.0-dev.9');
  });

  test('does not retry when the branch advanced after the run', () => {
    const decision = classifyReleaseFailure(MODE_A_LOG, {
      tagExists: false,
      branchMoved: true,
    });
    expect(decision.retry).toBe(false);
    expect(decision.reason).toContain('must verify the new tip');
  });

  test('does not retry when the tag exists', () => {
    const decision = classifyReleaseFailure(MODE_A_LOG, {
      tagExists: true,
      branchMoved: false,
    });
    expect(decision.retry).toBe(false);
    expect(decision.reason).toContain('already exists');
  });

  test('does not retry after a tag was created', () => {
    const log = `${MODE_A_LOG}
Created tag v1.10.0-dev.9`;
    const decision = classifyReleaseFailure(log, {
      tagExists: false,
      branchMoved: false,
    });
    expect(decision.retry).toBe(false);
    expect(decision.reason).toContain('tag was created');
  });

  test('does not retry an unrelated push rejection', () => {
    const log = `${VERSION_LINE}
${REJECTED_PUSH.replace('@semantic-release/git', '@semantic-release/github')}`;
    const decision = classifyReleaseFailure(log, {
      tagExists: false,
      branchMoved: false,
    });
    expect(decision.retry).toBe(false);
    expect(decision.reason).toContain('not a rejected');
  });

  test('does not retry a build failure before version calculation', () => {
    const decision = classifyReleaseFailure(REJECTED_PUSH, {
      tagExists: false,
      branchMoved: false,
    });
    expect(decision.retry).toBe(false);
    expect(decision.reason).toContain('never logged');
  });
});

function fixture(): string {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'release-retry-test-'));
  fs.writeFileSync(
    path.join(dir, '.releaserc'),
    JSON.stringify({ tagFormat: 'v${version}' }),
  );
  fs.writeFileSync(path.join(dir, 'failed.log'), MODE_A_LOG);
  return dir;
}

function makeOptions(dir: string, overrides: Partial<Options> = {}): Options {
  return {
    runId: '42',
    repo: 'owner/repo',
    branch: 'dev',
    headSha: VERIFIED_SHA,
    logFile: 'failed.log',
    cwd: dir,
    dryRun: false,
    ...overrides,
  };
}

interface FakeGh {
  gh: (args: string[], cwd: string) => GhResult;
  calls: string[][];
}

function fakeGh(responses: {
  tag?: GhResult;
  branch?: GhResult;
  rerun?: GhResult;
}): FakeGh {
  const calls: string[][] = [];
  return {
    calls,
    gh: (args) => {
      calls.push(args);
      if (args[0] === 'api' && args[1]?.includes('/git/ref/tags/')) {
        return (
          responses.tag ?? { status: 404, stdout: '', stderr: 'Not Found' }
        );
      }
      if (args[0] === 'api' && args[1]?.includes('/git/ref/heads/')) {
        return (
          responses.branch ?? {
            status: 0,
            stdout: `${VERIFIED_SHA}\n`,
            stderr: '',
          }
        );
      }
      if (args[0] === 'run' && args[1] === 'rerun') {
        return responses.rerun ?? { status: 0, stdout: '', stderr: '' };
      }
      throw new Error(`unexpected gh invocation: ${args.join(' ')}`);
    },
  };
}

function runDecision(
  dir: string,
  fake: FakeGh,
  overrides: Partial<Options> = {},
) {
  return decideReleaseRetry(makeOptions(dir, overrides), {
    gh: fake.gh,
    appendSummary: () => {},
  });
}

function rerunCalls(fake: FakeGh): string[][] {
  return fake.calls.filter((args) => args[0] === 'run' && args[1] === 'rerun');
}

describe('decideReleaseRetry', () => {
  test('re-runs failed jobs when the remote tip is still the verified SHA', () => {
    const dir = fixture();
    try {
      const fake = fakeGh({});
      const outcome = runDecision(dir, fake);
      expect(outcome.status).toBe('retry');
      expect(rerunCalls(fake)).toEqual([
        ['run', 'rerun', '42', '--failed', '--repo', 'owner/repo'],
      ]);
    } finally {
      fs.rmSync(dir, { recursive: true, force: true });
    }
  });

  test('does not re-run when the branch advanced', () => {
    const dir = fixture();
    try {
      const fake = fakeGh({
        branch: { status: 0, stdout: 'def456\n', stderr: '' },
      });
      const outcome = runDecision(dir, fake);
      expect(outcome.status).toBe('skipped');
      expect(outcome.reason).toContain('must verify the new tip');
      expect(rerunCalls(fake)).toHaveLength(0);
    } finally {
      fs.rmSync(dir, { recursive: true, force: true });
    }
  });

  test('does not re-run when the branch diverged without an ancestor relationship', () => {
    const dir = fixture();
    try {
      const fake = fakeGh({
        branch: { status: 0, stdout: 'fedcba\n', stderr: '' },
      });
      const outcome = runDecision(dir, fake);
      expect(outcome.status).toBe('skipped');
      expect(rerunCalls(fake)).toHaveLength(0);
      expect(fake.calls.some((args) => args[1]?.includes('/compare/'))).toBe(
        false,
      );
    } finally {
      fs.rmSync(dir, { recursive: true, force: true });
    }
  });

  test('does not re-run when the branch cannot be read', () => {
    const dir = fixture();
    try {
      const fake = fakeGh({
        branch: { status: 1, stdout: '', stderr: 'API unavailable' },
      });
      const outcome = runDecision(dir, fake);
      expect(outcome.status).toBe('skipped');
      expect(outcome.reason).toContain('cannot read dev');
      expect(rerunCalls(fake)).toHaveLength(0);
    } finally {
      fs.rmSync(dir, { recursive: true, force: true });
    }
  });

  test('does not re-run when tag existence cannot be read', () => {
    const dir = fixture();
    try {
      const fake = fakeGh({
        tag: { status: 1, stdout: '', stderr: 'API unavailable' },
      });
      const outcome = runDecision(dir, fake);
      expect(outcome.status).toBe('skipped');
      expect(rerunCalls(fake)).toHaveLength(0);
    } finally {
      fs.rmSync(dir, { recursive: true, force: true });
    }
  });

  test('does not re-run when the tag already exists', () => {
    const dir = fixture();
    try {
      const fake = fakeGh({
        tag: { status: 0, stdout: '', stderr: '' },
      });
      const outcome = runDecision(dir, fake);
      expect(outcome.status).toBe('skipped');
      expect(outcome.reason).toContain('already exists');
      expect(rerunCalls(fake)).toHaveLength(0);
    } finally {
      fs.rmSync(dir, { recursive: true, force: true });
    }
  });

  test('dry run reports a retry without invoking gh run rerun', () => {
    const dir = fixture();
    try {
      const fake = fakeGh({});
      const outcome = runDecision(dir, fake, { dryRun: true });
      expect(outcome.status).toBe('dry-run');
      expect(rerunCalls(fake)).toHaveLength(0);
    } finally {
      fs.rmSync(dir, { recursive: true, force: true });
    }
  });
});
