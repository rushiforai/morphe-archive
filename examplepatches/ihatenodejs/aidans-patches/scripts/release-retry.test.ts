import { describe, expect, test } from 'bun:test';
import { classifyReleaseFailure, extractReleaseVersion } from './release-retry';

const VERSION_LINE =
  '[4:09:43 AM] [semantic-release] › ℹ  The next release version is 1.10.0-dev.9';

const REJECTED_PUSH = `
To https://github.com/ihatenodejs/aidans-patches
 ! [rejected]        HEAD -> dev (fetch first)
error: failed to push some refs to 'https://github.com/ihatenodejs/aidans-patches'
hint: Updates were rejected because the remote contains work that you do not
    at async push (file:///home/runner/work/_actions/cycjimmy/semantic-release-action/v8/node_modules/@semantic-release/git/lib/git.js:60:3)
`;

const MODE_A_LOG = `${VERSION_LINE}
Prepared Git release: v1.10.0-dev.9
${REJECTED_PUSH}`;

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
  test('retries a superseded prepare push', () => {
    const decision = classifyReleaseFailure(MODE_A_LOG, {
      tagExists: false,
      branchMoved: true,
    });
    expect(decision.retry).toBe(true);
    expect(decision.version).toBe('1.10.0-dev.9');
  });

  test('retries the non-fast-forward variant', () => {
    const log = MODE_A_LOG.replace('(fetch first)', '(non-fast-forward)');
    const decision = classifyReleaseFailure(log, {
      tagExists: false,
      branchMoved: true,
    });
    expect(decision.retry).toBe(true);
  });

  test('does not retry when the tag exists', () => {
    const decision = classifyReleaseFailure(MODE_A_LOG, {
      tagExists: true,
      branchMoved: true,
    });
    expect(decision.retry).toBe(false);
    expect(decision.reason).toContain('already exists');
  });

  test('does not retry when the branch did not move', () => {
    const decision = classifyReleaseFailure(MODE_A_LOG, {
      tagExists: false,
      branchMoved: false,
    });
    expect(decision.retry).toBe(false);
    expect(decision.reason).toContain('has not moved');
  });

  test('does not retry after a tag was created', () => {
    const log = `${MODE_A_LOG}
Created tag v1.10.0-dev.9`;
    const decision = classifyReleaseFailure(log, {
      tagExists: false,
      branchMoved: true,
    });
    expect(decision.retry).toBe(false);
    expect(decision.reason).toContain('tag was created');
  });

  test('does not retry an unrelated push rejection', () => {
    const log = `${VERSION_LINE}
${REJECTED_PUSH.replace('@semantic-release/git', '@semantic-release/github')}`;
    const decision = classifyReleaseFailure(log, {
      tagExists: false,
      branchMoved: true,
    });
    expect(decision.retry).toBe(false);
    expect(decision.reason).toContain('not a rejected');
  });

  test('does not retry a build failure before version calculation', () => {
    const decision = classifyReleaseFailure(REJECTED_PUSH, {
      tagExists: false,
      branchMoved: true,
    });
    expect(decision.retry).toBe(false);
    expect(decision.reason).toContain('never logged');
  });
});
