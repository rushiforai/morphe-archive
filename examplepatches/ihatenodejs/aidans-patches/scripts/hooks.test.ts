import { afterEach, describe, expect, test } from 'bun:test';
import { spawnSync } from 'node:child_process';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';
import {
  HYGIENE_EXCLUDE_PATTERN,
  STAGE_AUDITS,
  STAGE_CHECKS,
  auditEnvironment,
  findCaseConflicts,
  findMergeConflictLines,
  hasTrailingWhitespace,
  needsEndOfFileFix,
  runHook,
  validateToml,
  validateYaml,
  type AuditInvoker,
  type AuditPhase,
  type HookResult,
} from './hooks';

const fixtureRoot = path.join(__dirname, 'test-fixtures', 'hooks');
const hooksCli = path.resolve(__dirname, 'hooks.ts');
const temporaryRepositories: string[] = [];
const testGitEnv: Record<string, string | undefined> = {
  ...process.env,
  GIT_CONFIG_NOSYSTEM: '1',
  GIT_CONFIG_GLOBAL: '/dev/null',
  GIT_AUTHOR_DATE: '2020-01-01T00:00:00Z',
  GIT_COMMITTER_DATE: '2020-01-01T00:00:00Z',
};

function git(
  cwd: string,
  args: readonly string[],
  input?: string | Buffer,
): string {
  const result = spawnSync('git', [...args], {
    cwd,
    input,
    encoding: 'utf8',
    env: testGitEnv,
  });
  if (result.status !== 0) {
    throw new Error(
      `git ${args.join(' ')} failed: ${result.stderr || result.stdout}`,
    );
  }
  return result.stdout;
}

function initRepository(): string {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'hooks-test-'));
  temporaryRepositories.push(directory);
  git(directory, ['init', '-q']);
  git(directory, ['config', 'user.email', 'hooks@example.invalid']);
  git(directory, ['config', 'user.name', 'Hook Test']);
  git(directory, ['config', 'core.autocrlf', 'false']);
  return directory;
}

function stageFile(
  repository: string,
  relative: string,
  content: string | Buffer,
  mode?: number,
): void {
  const destination = path.join(repository, relative);
  fs.mkdirSync(path.dirname(destination), { recursive: true });
  fs.writeFileSync(destination, content);
  if (mode !== undefined) fs.chmodSync(destination, mode);
  git(repository, ['add', '--', relative]);
}

function stageIndexOnly(
  repository: string,
  relative: string,
  content: string,
): void {
  const oid = git(repository, ['hash-object', '-w', '--stdin'], content).trim();
  git(repository, [
    'update-index',
    '--add',
    '--cacheinfo',
    `100644,${oid},${relative}`,
  ]);
}

function commitAll(repository: string, message: string): string {
  git(repository, ['add', '-A']);
  git(repository, ['commit', '-q', '-m', message]);
  return git(repository, ['rev-parse', 'HEAD']).trim();
}

type AuditCall = {
  phase: AuditPhase;
  snapshotDir: string;
  repoRoot: string;
};

function auditRecorder(
  failures: Partial<Record<AuditPhase, number>> = {},
  inspect?: (context: AuditCall) => void,
): { calls: AuditCall[]; invoker: AuditInvoker } {
  const calls: AuditCall[] = [];
  const invoker: AuditInvoker = async (phase, context) => {
    const call = { phase, ...context };
    calls.push(call);
    inspect?.(call);
    return {
      code: failures[phase] ?? 0,
      stdout: Buffer.from(`audit ${phase}`),
      stderr: failures[phase]
        ? Buffer.from(`${phase} failed`)
        : Buffer.alloc(0),
    };
  };
  return { calls, invoker };
}

async function run(
  repository: string,
  stage: 'pre-commit' | 'pre-push',
  options: {
    stdin?: Buffer;
    args?: string[];
    audit?: AuditInvoker;
  } = {},
): Promise<HookResult> {
  const audit = options.audit ?? auditRecorder().invoker;
  return runHook({
    stage,
    cwd: repository,
    stdin: options.stdin,
    args: options.args,
    auditInvoker: audit,
    env: testGitEnv,
  });
}

function named(result: HookResult, name: string) {
  const check = result.checks.find((entry) => entry.name === name);
  expect(check).toBeDefined();
  return check!;
}

function messages(result: HookResult, name: string): string[] {
  return named(result, name).messages;
}

function fixture(...parts: string[]): string {
  return fs.readFileSync(path.join(fixtureRoot, ...parts), 'utf8');
}

afterEach(() => {
  for (const directory of temporaryRepositories.splice(0)) {
    fs.rmSync(directory, { recursive: true, force: true });
  }
});

describe('hook CLI', () => {
  test('refuses unknown stages before running any check', () => {
    const result = spawnSync('bun', [hooksCli, 'post-commit'], {
      encoding: 'utf8',
    });
    expect(result.status).toBe(2);
    expect(result.stderr).toContain('unknown stage post-commit');
  });
});

describe('pure hygiene transforms', () => {
  test('trailing whitespace follows the pinned byte implementation', () => {
    expect(hasTrailingWhitespace(Buffer.from('a  \n'))).toBe(true);
    expect(hasTrailingWhitespace(Buffer.from('a\t\r\n'))).toBe(true);
    expect(hasTrailingWhitespace(Buffer.from('a\v\n'))).toBe(true);
    expect(hasTrailingWhitespace(Buffer.from('a\u00a0\n'))).toBe(false);
    expect(hasTrailingWhitespace(Buffer.from('a\n'))).toBe(false);
    expect(hasTrailingWhitespace(Buffer.from('   '))).toBe(true);
    expect(hasTrailingWhitespace(Buffer.from('a  '))).toBe(true);
  });

  test('end-of-file detection preserves one LF, CRLF or CR', () => {
    expect(needsEndOfFileFix(Buffer.alloc(0))).toBe(false);
    expect(needsEndOfFileFix(Buffer.from('a'))).toBe(true);
    expect(needsEndOfFileFix(Buffer.from('a\n'))).toBe(false);
    expect(needsEndOfFileFix(Buffer.from('a\r\n'))).toBe(false);
    expect(needsEndOfFileFix(Buffer.from('a\r'))).toBe(false);
    expect(needsEndOfFileFix(Buffer.from('a\n\n'))).toBe(true);
    expect(needsEndOfFileFix(Buffer.from('a\r\n\r\n'))).toBe(true);
    expect(needsEndOfFileFix(Buffer.from('\n\n'))).toBe(true);
    expect(needsEndOfFileFix(Buffer.from('\r\n'))).toBe(true);
  });

  test('merge markers require the pinned prefixes', () => {
    expect(
      findMergeConflictLines(
        Buffer.from('<<<<<<< HEAD\r\n=======\r\n>>>>>>> branch\n'),
      ).map((entry) => entry.pattern),
    ).toEqual(['<<<<<<<', '=======', '>>>>>>>']);
    expect(findMergeConflictLines(Buffer.from('<<<<<<<HEAD\n'))).toEqual([]);
    expect(
      findMergeConflictLines(Buffer.from('=======not-a-marker\n')),
    ).toEqual([]);
    expect(findMergeConflictLines(Buffer.from('text = "======="\n'))).toEqual(
      [],
    );
  });

  test('case conflicts include directories and new-to-new collisions', () => {
    expect(
      findCaseConflicts(
        ['dir/other.txt', 'Foo.txt'],
        ['DIR/file.txt', 'foo.txt'],
      ),
    ).toEqual(['DIR', 'Foo.txt', 'dir', 'foo.txt']);
    expect(findCaseConflicts(['src/a.ts'], ['src/b.ts'])).toEqual([]);
  });

  test('exclusion pattern matches only the configured paths', () => {
    expect(HYGIENE_EXCLUDE_PATTERN.test('assets/icon.png')).toBe(true);
    expect(HYGIENE_EXCLUDE_PATTERN.test('bun.lock')).toBe(true);
    expect(HYGIENE_EXCLUDE_PATTERN.test('patches-list.json')).toBe(true);
    expect(HYGIENE_EXCLUDE_PATTERN.test('nested/patches-bundle.json')).toBe(
      true,
    );
    expect(HYGIENE_EXCLUDE_PATTERN.test('patches-list.json.bak')).toBe(true);
    expect(HYGIENE_EXCLUDE_PATTERN.test('patch-list.json')).toBe(false);
  });

  test('YAML accepts unsafe tags/multiple documents and rejects bad syntax', () => {
    expect(() =>
      validateYaml(Buffer.from(fixture('yaml', 'tagged-multi.txt'))),
    ).not.toThrow();
    expect(() => validateYaml(Buffer.from('a: *missing\n'))).not.toThrow();
    expect(() => validateYaml(Buffer.from('a: 1\na: 2\n'))).not.toThrow();
    expect(() =>
      validateYaml(Buffer.from(fixture('yaml', 'invalid-flow.txt'))),
    ).toThrow();
    expect(() => validateYaml(Buffer.from('a: \u0001\n'))).toThrow();
    expect(() => validateYaml(Buffer.from('a:\n\tb: 1\n'))).toThrow();
  });

  test('TOML enforces 1.0 syntax but accepts arbitrary integer sizes', () => {
    expect(() =>
      validateToml(Buffer.from(fixture('toml', 'valid-large-int.txt'))),
    ).not.toThrow();
    expect(() =>
      validateToml(Buffer.from(fixture('toml', 'invalid-duplicate.txt'))),
    ).toThrow();
    expect(() =>
      validateToml(Buffer.from(fixture('toml', 'invalid-escape.txt'))),
    ).toThrow();
    expect(() =>
      validateToml(Buffer.from(fixture('toml', 'invalid-inline-trailing.txt'))),
    ).toThrow();
    expect(() => validateToml(Buffer.from('a = 1\r'))).toThrow();
    expect(() => validateToml(Buffer.from('a = 1\r\n'))).not.toThrow();
  });

  test('audit environment drops release identity and Git config overrides', () => {
    const env = auditEnvironment('/snapshot', {
      HOME: '/home/test',
      PATH: '/usr/bin',
      GIT_DIR: '/repo/.git',
      GIT_CONFIG_NOSYSTEM: '1',
      GIT_AUTHOR_NAME: 'semantic-release-bot',
      GIT_AUTHOR_EMAIL: 'semantic-release-bot@martynus.net',
      GIT_AUTHOR_DATE: '2000-01-01T00:00:00Z',
      GIT_COMMITTER_NAME: 'semantic-release-bot',
      GIT_COMMITTER_EMAIL: 'semantic-release-bot@martynus.net',
      GIT_COMMITTER_DATE: '2000-01-01T00:00:00Z',
      GIT_CONFIG_COUNT: '1',
      GIT_CONFIG_KEY_0: 'user.name',
      GIT_CONFIG_VALUE_0: 'semantic-release-bot',
      GIT_CONFIG_PARAMETERS: "'user.name=bot'",
    });
    for (const key of [
      'GIT_DIR',
      'GIT_AUTHOR_NAME',
      'GIT_AUTHOR_EMAIL',
      'GIT_AUTHOR_DATE',
      'GIT_COMMITTER_NAME',
      'GIT_COMMITTER_EMAIL',
      'GIT_COMMITTER_DATE',
      'GIT_CONFIG_COUNT',
      'GIT_CONFIG_KEY_0',
      'GIT_CONFIG_VALUE_0',
      'GIT_CONFIG_PARAMETERS',
    ]) {
      expect(env[key]).toBeUndefined();
    }
    expect(env.HOME).toBe('/home/test');
    expect(env.GIT_CONFIG_NOSYSTEM).toBe('1');
    expect(env.GIT_OPTIONAL_LOCKS).toBe('0');
    expect(env.UV_PROJECT_ENVIRONMENT).toBe(
      path.join('/snapshot', 'tools', 'apk-lab', '.venv'),
    );
  });
});

describe('pre-commit checks', () => {
  test('rejects staged additions over 2048 KiB, not modified large files', async () => {
    const repository = initRepository();
    const chunk = 2048 * 1024;
    stageFile(
      repository,
      'exact.bin',
      Buffer.concat([Buffer.alloc(chunk - 1, 0x61), Buffer.from('\n')]),
    );
    let result = await run(repository, 'pre-commit');
    expect(messages(result, 'check-added-large-files')).toEqual([]);

    const second = initRepository();
    stageFile(
      second,
      'over.bin',
      Buffer.concat([Buffer.alloc(chunk, 0x61), Buffer.from('\n')]),
    );
    result = await run(second, 'pre-commit');
    expect(messages(result, 'check-added-large-files')).toEqual([
      'over.bin (2049 KB) exceeds 2048 KB.',
    ]);

    const modified = initRepository();
    const large = Buffer.concat([Buffer.alloc(chunk, 0x61), Buffer.from('\n')]);
    stageFile(modified, 'modified.bin', large);
    commitAll(modified, 'base');
    stageFile(
      modified,
      'modified.bin',
      Buffer.concat([large, Buffer.from('b\n')]),
    );
    stageFile(modified, 'small.bin', large);
    commitAll(modified, 'store large version');
    stageFile(
      modified,
      'modified.bin',
      Buffer.concat([large, Buffer.from('c\n')]),
    );
    result = await run(modified, 'pre-commit');
    expect(messages(result, 'check-added-large-files')).toEqual([]);
  });

  test('exempts staged additions tracked by Git LFS', async () => {
    const repository = initRepository();
    const chunk = 2048 * 1024;
    stageFile(
      repository,
      '.gitattributes',
      '*.lfs filter=lfs diff=lfs merge=lfs -text\n',
    );
    stageFile(
      repository,
      'large.lfs',
      Buffer.concat([Buffer.alloc(chunk, 0x61), Buffer.from('\n')]),
    );
    const result = await run(repository, 'pre-commit');
    expect(messages(result, 'check-added-large-files')).toEqual([]);
  });

  test('merge markers are only inspected while a merge is in progress', async () => {
    const repository = initRepository();
    stageFile(
      repository,
      'conflict.txt',
      '<<<<<<< HEAD\n=======\n>>>>>>> other\n',
    );
    let result = await run(repository, 'pre-commit');
    expect(messages(result, 'check-merge-conflict')).toEqual([]);

    fs.writeFileSync(path.join(repository, '.git', 'MERGE_MSG'), 'merge\n');
    fs.writeFileSync(
      path.join(repository, '.git', 'MERGE_HEAD'),
      '0'.repeat(40),
    );
    result = await run(repository, 'pre-commit');
    expect(messages(result, 'check-merge-conflict')).toEqual([
      "conflict.txt:1: Merge conflict string '<<<<<<<' found",
      "conflict.txt:2: Merge conflict string '=======' found",
      "conflict.txt:3: Merge conflict string '>>>>>>>' found",
    ]);
  });

  test('detects file and directory case collisions from the index', async () => {
    const repository = initRepository();
    stageFile(repository, 'dir/other.txt', 'other\n');
    commitAll(repository, 'base');
    stageIndexOnly(repository, 'Foo.txt', 'x');
    stageIndexOnly(repository, 'foo.txt', 'x');
    stageIndexOnly(repository, 'DIR/file.txt', 'x');

    const result = await run(repository, 'pre-commit');
    const conflictMessages = messages(result, 'check-case-conflict');
    expect(conflictMessages).toContain(
      'Case-insensitivity conflict found: DIR',
    );
    expect(conflictMessages).toContain(
      'Case-insensitivity conflict found: dir',
    );
    expect(conflictMessages).toContain(
      'Case-insensitivity conflict found: Foo.txt',
    );
    expect(conflictMessages).toContain(
      'Case-insensitivity conflict found: foo.txt',
    );
  });

  test('reports whitespace/EOF would-fixes without modifying worktree or index', async () => {
    const repository = initRepository();
    stageFile(repository, 'trailing.txt', 'a  \n');
    stageFile(repository, 'vertical.txt', 'a\v\n');
    stageFile(repository, 'markdown.md', 'a  \n');
    stageFile(repository, 'unicode.txt', 'a\u00a0\n');
    stageFile(repository, 'image.png', 'text with spaces  \n');
    stageFile(repository, 'patches-list.json', '{"a": 1}  \n');
    stageFile(
      repository,
      'scripts/test-fixtures/generate-patches-readme/crlf/readme.md',
      'frozen  \r\n\r\n',
    );
    stageFile(repository, 'other.json', '{"a": 1}  \n');
    stageFile(repository, 'empty.txt', '');
    stageFile(repository, 'one.txt', 'a\n');
    stageFile(repository, 'none.txt', 'a');
    stageFile(repository, 'many.txt', 'a\n\n');
    stageFile(repository, 'all-newlines.txt', '\n\n');
    stageFile(repository, 'crlf.txt', 'a  \r\n');
    stageFile(repository, 'crlf-end.txt', 'a\r\n');
    stageFile(repository, 'cr-end.txt', 'a\r');

    const indexBefore = git(repository, ['ls-files', '-s']);
    const result = await run(repository, 'pre-commit');
    const whitespace = messages(result, 'trailing-whitespace');
    const eof = messages(result, 'end-of-file-fixer');

    const whitespaceFiles = [
      'trailing.txt',
      'vertical.txt',
      'markdown.md',
      'other.json',
      'crlf.txt',
      'cr-end.txt',
    ];
    for (const file of whitespaceFiles) {
      expect(whitespace.some((message) => message.startsWith(`${file}:`))).toBe(
        true,
      );
    }
    const cleanWhitespaceFiles = [
      'unicode.txt',
      'image.png',
      'patches-list.json',
      'scripts/test-fixtures/generate-patches-readme/crlf/readme.md',
      'one.txt',
      'crlf-end.txt',
    ];
    for (const file of cleanWhitespaceFiles) {
      expect(whitespace.some((message) => message.startsWith(`${file}:`))).toBe(
        false,
      );
    }
    for (const file of ['none.txt', 'many.txt', 'all-newlines.txt']) {
      expect(eof.some((message) => message.startsWith(`${file}:`))).toBe(true);
    }
    for (const file of ['empty.txt', 'one.txt', 'crlf-end.txt', 'cr-end.txt']) {
      expect(eof.some((message) => message.startsWith(`${file}:`))).toBe(false);
    }
    expect(fs.readFileSync(path.join(repository, 'trailing.txt'), 'utf8')).toBe(
      'a  \n',
    );
    expect(fs.readFileSync(path.join(repository, 'none.txt'), 'utf8')).toBe(
      'a',
    );
    expect(fs.readFileSync(path.join(repository, 'many.txt'), 'utf8')).toBe(
      'a\n\n',
    );
    expect(
      fs.readFileSync(
        path.join(
          repository,
          'scripts/test-fixtures/generate-patches-readme/crlf/readme.md',
        ),
        'utf8',
      ),
    ).toBe('frozen  \r\n\r\n');
    expect(git(repository, ['ls-files', '-s'])).toBe(indexBefore);
  });

  test('handles staged renames and deletions', async () => {
    const repository = initRepository();
    stageFile(repository, 'old name.txt', 'content\n');
    stageFile(repository, 'removed.txt', 'content\n');
    commitAll(repository, 'base');
    git(repository, ['mv', 'old name.txt', 'new name.txt']);
    git(repository, ['rm', '-q', 'removed.txt']);

    let observed = false;
    const { invoker } = auditRecorder({}, (call) => {
      if (observed) return;
      observed = true;
      expect(
        fs.readFileSync(path.join(call.snapshotDir, 'new name.txt'), 'utf8'),
      ).toBe('content\n');
      expect(fs.existsSync(path.join(call.snapshotDir, 'old name.txt'))).toBe(
        false,
      );
      expect(fs.existsSync(path.join(call.snapshotDir, 'removed.txt'))).toBe(
        false,
      );
    });
    const result = await run(repository, 'pre-commit', { audit: invoker });
    expect(result.code).toBe(0);
    expect(observed).toBe(true);
  });

  test('checks staged YAML syntax and skips binary content', async () => {
    const repository = initRepository();
    stageFile(repository, 'valid.yaml', fixture('yaml', 'tagged-multi.txt'));
    stageFile(repository, 'invalid.yaml', fixture('yaml', 'invalid-flow.txt'));
    stageFile(repository, 'duplicate.yaml', 'a: 1\na: 2\n');
    stageFile(repository, 'alias.yaml', 'a: *missing\n');
    stageFile(repository, 'control.yaml', 'a: \u0001\n');
    stageFile(repository, 'tabs.yaml', 'a:\n\tb: 1\n');
    stageFile(repository, 'binary.yaml', Buffer.from([0, 1, 2, 3]));

    const result = await run(repository, 'pre-commit');
    const yamlMessages = messages(result, 'check-yaml');
    expect(
      yamlMessages.some((message) => message.startsWith('invalid.yaml:')),
    ).toBe(true);
    expect(
      yamlMessages.some((message) => message.startsWith('control.yaml:')),
    ).toBe(true);
    expect(
      yamlMessages.some((message) => message.startsWith('tabs.yaml:')),
    ).toBe(true);
    for (const file of [
      'valid.yaml',
      'duplicate.yaml',
      'alias.yaml',
      'binary.yaml',
    ]) {
      expect(
        yamlMessages.some((message) => message.startsWith(`${file}:`)),
      ).toBe(false);
    }
  });

  test('checks staged TOML with TOML 1.0 semantics', async () => {
    const repository = initRepository();
    stageFile(repository, 'valid.toml', fixture('toml', 'valid-large-int.txt'));
    stageFile(repository, 'crlf.toml', 'a = 1\r\n');
    stageFile(
      repository,
      'duplicate.toml',
      fixture('toml', 'invalid-duplicate.txt'),
    );
    stageFile(repository, 'escape.toml', fixture('toml', 'invalid-escape.txt'));
    stageFile(
      repository,
      'inline.toml',
      fixture('toml', 'invalid-inline-trailing.txt'),
    );
    stageFile(repository, 'lone-cr.toml', 'a = 1\r');

    const result = await run(repository, 'pre-commit');
    const tomlMessages = messages(result, 'check-toml');
    for (const file of [
      'duplicate.toml',
      'escape.toml',
      'inline.toml',
      'lone-cr.toml',
    ]) {
      expect(
        tomlMessages.some((message) => message.startsWith(`${file}:`)),
      ).toBe(true);
    }
    for (const file of ['valid.toml', 'crlf.toml']) {
      expect(
        tomlMessages.some((message) => message.startsWith(`${file}:`)),
      ).toBe(false);
    }
  });

  test('runs the full ordered stage and audits despite earlier failures', async () => {
    const repository = initRepository();
    stageFile(repository, 'space.txt', 'a  \n');
    stageFile(repository, 'eof.txt', 'a');
    stageFile(repository, 'invalid.yaml', 'a: [1,\n');
    stageFile(repository, 'invalid.toml', 'a = 1\na = 2\n');
    stageIndexOnly(repository, 'Foo.txt', 'x');
    stageIndexOnly(repository, 'foo.txt', 'x');
    fs.writeFileSync(path.join(repository, '.git', 'MERGE_MSG'), 'merge\n');
    fs.writeFileSync(path.join(repository, '.git', 'MERGE_HEAD'), 'x');

    const { calls, invoker } = auditRecorder({ 'format:check': 2 });
    const result = await run(repository, 'pre-commit', { audit: invoker });
    expect(result.code).toBe(1);
    expect(result.checks.map((check) => check.name)).toEqual([
      ...STAGE_CHECKS['pre-commit'],
      ...STAGE_AUDITS['pre-commit'],
    ]);
    expect(calls.map((call) => call.phase)).toEqual(['format:check', 'lint']);
    expect(named(result, 'format:check').ok).toBe(false);
    expect(named(result, 'format:check').messages[0]).toContain(
      'audit exited 2',
    );
    expect(named(result, 'lint').ok).toBe(true);
  });

  test('propagates every pre-commit audit failure and continues', async () => {
    for (const failing of STAGE_AUDITS['pre-commit']) {
      const repository = initRepository();
      stageFile(repository, 'clean.txt', 'clean\n');
      const { calls, invoker } = auditRecorder({ [failing]: 7 });
      const result = await run(repository, 'pre-commit', { audit: invoker });
      expect(result.code).toBe(1);
      expect(calls.map((call) => call.phase)).toEqual(['format:check', 'lint']);
      expect(named(result, failing).ok).toBe(false);
      expect(named(result, failing).messages[0]).toContain('audit exited 7');
    }
  });

  test('keeps auditing after an audit invocation throws', async () => {
    const repository = initRepository();
    stageFile(repository, 'clean.txt', 'clean\n');
    const calls: AuditPhase[] = [];
    const invoker: AuditInvoker = async (phase) => {
      calls.push(phase);
      if (phase === 'format:check') throw new Error('bun missing');
      return { code: 0, stdout: Buffer.alloc(0), stderr: Buffer.alloc(0) };
    };
    const result = await run(repository, 'pre-commit', { audit: invoker });
    expect(calls).toEqual(['format:check', 'lint']);
    expect(result.code).toBe(1);
    expect(named(result, 'format:check').messages[0]).toContain('bun missing');
    expect(named(result, 'lint').ok).toBe(true);
  });
});

describe('staged snapshot isolation', () => {
  test('handles spaces, unicode, leading dashes and newlines in paths', async () => {
    const repository = initRepository();
    const names = [
      'sp ace.txt',
      'unicodé-文件.txt',
      '-leading.txt',
      'line\nbreak.txt',
    ];
    for (const name of names) stageFile(repository, name, 'clean\n');

    let observed = false;
    const { invoker } = auditRecorder({}, (call) => {
      if (observed) return;
      observed = true;
      for (const name of names) {
        expect(fs.readFileSync(path.join(call.snapshotDir, name), 'utf8')).toBe(
          'clean\n',
        );
      }
    });
    const result = await run(repository, 'pre-commit', { audit: invoker });
    expect(result.code).toBe(0);
    expect(observed).toBe(true);
    expect(messages(result, 'check-added-large-files')).toEqual([]);
  });

  test('reads the staged index from a linked worktree', async () => {
    const repository = initRepository();
    stageFile(repository, 'base.txt', 'base\n');
    commitAll(repository, 'base');
    const worktree = fs.mkdtempSync(path.join(os.tmpdir(), 'hooks-worktree-'));
    temporaryRepositories.push(worktree);
    fs.rmSync(worktree, { recursive: true, force: true });
    git(repository, ['worktree', 'add', '-q', '-b', 'hook-worktree', worktree]);

    stageFile(worktree, 'worktree.txt', 'worktree staged\n');
    fs.writeFileSync(path.join(worktree, 'worktree.txt'), 'worktree dirty  \n');
    const indexBefore = git(worktree, ['ls-files', '-s']);

    let observed = false;
    const { invoker } = auditRecorder({}, (call) => {
      if (observed) return;
      observed = true;
      expect(
        fs.readFileSync(path.join(call.snapshotDir, 'worktree.txt'), 'utf8'),
      ).toBe('worktree staged\n');
    });
    const result = await run(worktree, 'pre-commit', { audit: invoker });
    expect(result.code).toBe(0);
    expect(observed).toBe(true);
    expect(git(worktree, ['ls-files', '-s'])).toBe(indexBefore);
    expect(fs.readFileSync(path.join(worktree, 'worktree.txt'), 'utf8')).toBe(
      'worktree dirty  \n',
    );
  });

  test('audits staged content, not worktree or untracked files', async () => {
    const repository = initRepository();
    stageFile(repository, 'tracked.txt', 'staged clean\n');
    fs.writeFileSync(
      path.join(repository, 'tracked.txt'),
      'worktree dirty  \n',
    );
    fs.writeFileSync(path.join(repository, 'untracked.txt'), 'secret\n');
    fs.mkdirSync(path.join(repository, '.tools'));
    fs.writeFileSync(path.join(repository, '.tools', 'tool'), 'artifact\n');
    fs.mkdirSync(path.join(repository, 'tools', 'apk-lab', 'target', 'debug'), {
      recursive: true,
    });
    fs.writeFileSync(
      path.join(repository, 'tools', 'apk-lab', 'target', 'debug', 'apk-lab'),
      'compiled for this root\n',
    );
    const indexBefore = git(repository, ['ls-files', '-s']);

    let observed = false;
    const { invoker } = auditRecorder({}, (call) => {
      if (observed) return;
      observed = true;
      expect(
        fs.readFileSync(path.join(call.snapshotDir, 'tracked.txt'), 'utf8'),
      ).toBe('staged clean\n');
      expect(fs.existsSync(path.join(call.snapshotDir, 'untracked.txt'))).toBe(
        false,
      );
      expect(
        fs.lstatSync(path.join(call.snapshotDir, 'tracked.txt')).isFile(),
      ).toBe(true);
      const artifact = path.join(call.snapshotDir, '.tools');
      expect(fs.lstatSync(artifact).isSymbolicLink()).toBe(true);
      expect(fs.readlinkSync(artifact)).toBe(path.join(repository, '.tools'));
      // Cargo artifacts embed absolute source paths, so a snapshot must never
      // execute the worktree's compiled binaries (or vice versa).
      expect(
        fs.existsSync(
          path.join(call.snapshotDir, 'tools', 'apk-lab', 'target', 'debug'),
        ),
      ).toBe(false);
    });

    const result = await run(repository, 'pre-commit', { audit: invoker });
    expect(result.code).toBe(0);
    expect(messages(result, 'trailing-whitespace')).toEqual([]);
    expect(observed).toBe(true);
    expect(fs.readFileSync(path.join(repository, 'tracked.txt'), 'utf8')).toBe(
      'worktree dirty  \n',
    );
    expect(
      fs.readFileSync(path.join(repository, 'untracked.txt'), 'utf8'),
    ).toBe('secret\n');
    expect(git(repository, ['ls-files', '-s'])).toBe(indexBefore);
  });

  test('gives the snapshot a local Git identity without the user index', async () => {
    const repository = initRepository();
    stageFile(repository, 'staged.txt', 'staged\n');
    fs.writeFileSync(path.join(repository, 'staged.txt'), 'dirty  \n');
    const indexBefore = git(repository, ['ls-files', '-s']);

    let observed = false;
    const { invoker } = auditRecorder({}, (call) => {
      if (observed) return;
      observed = true;
      const head = spawnSync('git', ['rev-parse', 'HEAD'], {
        cwd: call.snapshotDir,
        encoding: 'utf8',
        env: testGitEnv,
      });
      expect(head.status).toBe(0);
      expect(head.stdout.trim()).toMatch(/^[0-9a-f]{40}$/);
      const status = spawnSync('git', ['status', '--porcelain'], {
        cwd: call.snapshotDir,
        encoding: 'utf8',
        env: testGitEnv,
      });
      expect(status.status).toBe(0);
      expect(status.stdout).toBe('');
      expect(
        fs.readFileSync(path.join(call.snapshotDir, '.git', 'HEAD'), 'utf8'),
      ).toBe('ref: refs/heads/audit-snapshot\n');
      expect(
        fs
          .readFileSync(
            path.join(
              call.snapshotDir,
              '.git',
              'objects',
              'info',
              'alternates',
            ),
            'utf8',
          )
          .trim(),
      ).toBe(path.join(repository, '.git', 'objects'));
    });

    const result = await run(repository, 'pre-commit', { audit: invoker });
    expect(result.code).toBe(0);
    expect(observed).toBe(true);
    expect(git(repository, ['ls-files', '-s'])).toBe(indexBefore);
  });

  test('does not reuse an existing native CMake build directory', async () => {
    const repository = initRepository();
    stageFile(repository, 'clean.txt', 'clean\n');
    const hostBuild = path.join(
      repository,
      'extensions',
      'adobescan-pdf-native',
      'build',
      'host',
    );
    fs.mkdirSync(hostBuild, { recursive: true });
    const cache = path.join(hostBuild, 'CMakeCache.txt');
    const cacheContent =
      `CMAKE_HOME_DIRECTORY:INTERNAL=` +
      `${path.join(repository, 'extensions', 'adobescan-pdf-native')}\n`;
    fs.writeFileSync(cache, cacheContent);

    let observed = false;
    const { invoker } = auditRecorder({}, (call) => {
      if (observed) return;
      observed = true;
      expect(
        fs.existsSync(
          path.join(
            call.snapshotDir,
            'extensions',
            'adobescan-pdf-native',
            'build',
          ),
        ),
      ).toBe(false);
    });

    const result = await run(repository, 'pre-commit', { audit: invoker });
    expect(result.code).toBe(0);
    expect(observed).toBe(true);
    expect(fs.readFileSync(cache, 'utf8')).toBe(cacheContent);
  });

  test('refuses dependency caches that link back into repository source', async () => {
    const repository = initRepository();
    stageFile(repository, 'clean.txt', 'clean\n');
    fs.mkdirSync(path.join(repository, 'worker'), { recursive: true });
    fs.writeFileSync(
      path.join(repository, 'worker', 'source.ts'),
      'export {};\n',
    );
    fs.mkdirSync(path.join(repository, 'node_modules'), { recursive: true });
    fs.symlinkSync(
      path.join('..', 'worker'),
      path.join(repository, 'node_modules', 'internal-worker'),
      'dir',
    );

    const { calls, invoker } = auditRecorder();
    const result = await run(repository, 'pre-commit', { audit: invoker });
    expect(result.code).toBe(1);
    expect(calls).toEqual([]);
    const snapshot = named(result, 'audit-snapshot');
    expect(snapshot.ok).toBe(false);
    expect(snapshot.messages[0]).toContain('links to repository source');
    expect(snapshot.messages[0]).toContain('node_modules/internal-worker');
    for (const phase of STAGE_AUDITS['pre-commit']) {
      expect(named(result, phase).ok).toBe(false);
      expect(messages(result, phase)[0]).toContain(
        'audit snapshot unavailable',
      );
    }
  });
});

describe('pre-push range and audit routing', () => {
  function pushLine(
    local: string,
    remote: string,
    localRef = 'refs/heads/main',
    remoteRef = localRef,
  ): Buffer {
    return Buffer.from(`${localRef} ${local} ${remoteRef} ${remote}\n`);
  }

  test('audits a clean-index pushed commit range and ignores unrelated staged files', async () => {
    const repository = initRepository();
    stageFile(repository, 'base.txt', 'base\n');
    const first = commitAll(repository, 'base');
    stageFile(repository, 'base.txt', 'second base\n');
    stageFile(repository, 'added.txt', 'added\n');
    const second = commitAll(repository, 'second');
    stageFile(repository, 'unrelated.txt', 'staged but unrelated  \n');
    const indexBefore = git(repository, ['ls-files', '-s']);

    let observed = false;
    const { calls, invoker } = auditRecorder({}, (call) => {
      if (observed) return;
      observed = true;
      expect(
        fs.readFileSync(path.join(call.snapshotDir, 'base.txt'), 'utf8'),
      ).toBe('second base\n');
      expect(
        fs.readFileSync(path.join(call.snapshotDir, 'added.txt'), 'utf8'),
      ).toBe('added\n');
      expect(fs.existsSync(path.join(call.snapshotDir, 'unrelated.txt'))).toBe(
        false,
      );
    });

    const result = await run(repository, 'pre-push', {
      stdin: pushLine(second, first),
      audit: invoker,
    });
    expect(result.code).toBe(0);
    expect(result.checks.map((check) => check.name)).toEqual([
      ...STAGE_CHECKS['pre-push'],
      ...STAGE_AUDITS['pre-push'],
    ]);
    expect(calls.map((call) => call.phase)).toEqual(['typecheck', 'test']);
    expect(messages(result, 'trailing-whitespace')).toEqual([]);
    expect(git(repository, ['ls-files', '-s'])).toBe(indexBefore);
  });

  test('runs typecheck and test on a clean-index pushed range', async () => {
    const repository = initRepository();
    stageFile(repository, 'one.txt', 'one\n');
    const first = commitAll(repository, 'one');
    stageFile(repository, 'two.txt', 'two\n');
    const second = commitAll(repository, 'two');
    expect(git(repository, ['status', '--porcelain'])).toBe('');

    const { calls, invoker } = auditRecorder();
    const result = await run(repository, 'pre-push', {
      stdin: pushLine(second, first),
      audit: invoker,
    });
    expect(result.code).toBe(0);
    expect(calls.map((call) => call.phase)).toEqual(['typecheck', 'test']);
  });

  test('skips deletion-only and no-op pushes', async () => {
    const repository = initRepository();
    stageFile(repository, 'base.txt', 'base\n');
    const first = commitAll(repository, 'base');

    const zero = '0'.repeat(40);
    let result = await run(repository, 'pre-push', {
      stdin: pushLine(zero, first),
      audit: auditRecorder().invoker,
    });
    expect(result).toEqual({ code: 0, stage: 'pre-push', checks: [] });

    result = await run(repository, 'pre-push', {
      stdin: pushLine(first, first),
      audit: auditRecorder().invoker,
    });
    expect(result).toEqual({ code: 0, stage: 'pre-push', checks: [] });
  });

  test('runs typecheck and test for a new remote/branch without network', async () => {
    const repository = initRepository();
    stageFile(repository, 'base.txt', 'base\n');
    const first = commitAll(repository, 'base');
    stageFile(repository, 'next.txt', 'next\n');
    const second = commitAll(repository, 'next');
    const { calls, invoker } = auditRecorder();

    const result = await run(repository, 'pre-push', {
      stdin: Buffer.from(
        `refs/heads/feature ${second} refs/heads/feature ${'0'.repeat(40)}\n`,
      ),
      args: ['origin', 'https://example.invalid/repository.git'],
      audit: invoker,
    });
    expect(result.code).toBe(0);
    expect(calls.map((call) => call.phase)).toEqual(['typecheck', 'test']);
    expect(first).not.toBe(second);
  });

  test('checks large additions inside the pushed range only', async () => {
    const repository = initRepository();
    const chunk = 2048 * 1024;
    const oversized = Buffer.concat([
      Buffer.alloc(chunk, 0x61),
      Buffer.from('\n'),
    ]);
    stageFile(repository, 'old-big.bin', oversized);
    const first = commitAll(repository, 'old big');
    stageFile(
      repository,
      'old-big.bin',
      Buffer.concat([oversized, Buffer.from('b\n')]),
    );
    stageFile(repository, 'new-big.bin', oversized);
    stageFile(repository, 'small.txt', 'small\n');
    const second = commitAll(repository, 'new big');

    const result = await run(repository, 'pre-push', {
      stdin: pushLine(second, first),
      audit: auditRecorder().invoker,
    });
    expect(result.code).toBe(1);
    expect(messages(result, 'check-added-large-files')).toEqual([
      'new-big.bin (2049 KB) exceeds 2048 KB.',
    ]);
    expect(messages(result, 'trailing-whitespace')).toEqual([]);
    expect(messages(result, 'end-of-file-fixer')).toEqual([]);
  });

  test('handles renames and deletions in the pushed range', async () => {
    const repository = initRepository();
    stageFile(repository, 'keep.txt', 'keep\n');
    stageFile(repository, 'delete.txt', 'delete\n');
    const first = commitAll(repository, 'base');
    git(repository, ['mv', 'keep.txt', 'renamed.txt']);
    git(repository, ['rm', '-q', 'delete.txt']);
    const second = commitAll(repository, 'rename and delete');

    let observed = false;
    const { invoker } = auditRecorder({}, (call) => {
      if (observed) return;
      observed = true;
      expect(fs.existsSync(path.join(call.snapshotDir, 'renamed.txt'))).toBe(
        true,
      );
      expect(fs.existsSync(path.join(call.snapshotDir, 'keep.txt'))).toBe(
        false,
      );
      expect(fs.existsSync(path.join(call.snapshotDir, 'delete.txt'))).toBe(
        false,
      );
    });

    const result = await run(repository, 'pre-push', {
      stdin: pushLine(second, first),
      audit: invoker,
    });
    expect(result.code).toBe(0);
    expect(observed).toBe(true);
  });

  test('propagates each pre-push audit failure', async () => {
    for (const failing of STAGE_AUDITS['pre-push']) {
      const repository = initRepository();
      stageFile(repository, 'clean.txt', 'clean\n');
      commitAll(repository, 'base');
      const { calls, invoker } = auditRecorder({ [failing]: 9 });
      const result = await run(repository, 'pre-push', {
        audit: invoker,
      });
      expect(result.code).toBe(1);
      expect(calls.map((call) => call.phase)).toEqual(['typecheck', 'test']);
      expect(named(result, failing).ok).toBe(false);
      expect(named(result, failing).messages[0]).toContain('audit exited 9');
    }
  });

  test('manual pre-push audits HEAD while ignoring staged content', async () => {
    const repository = initRepository();
    stageFile(repository, 'base.txt', 'base\n');
    commitAll(repository, 'base');
    stageFile(repository, 'staged-only.txt', 'staged only  \n');
    const { calls, invoker } = auditRecorder({}, (call) => {
      expect(
        fs.existsSync(path.join(call.snapshotDir, 'staged-only.txt')),
      ).toBe(false);
      expect(
        fs.readFileSync(path.join(call.snapshotDir, 'base.txt'), 'utf8'),
      ).toBe('base\n');
    });

    const result = await run(repository, 'pre-push', { audit: invoker });
    expect(result.code).toBe(0);
    expect(calls.map((call) => call.phase)).toEqual(['typecheck', 'test']);
    expect(messages(result, 'trailing-whitespace')).toEqual([]);
  });

  test('checks every pushed ref and propagates later ref failures', async () => {
    const repository = initRepository();
    stageFile(repository, 'base.txt', 'base\n');
    const base = commitAll(repository, 'base');

    git(repository, ['checkout', '-q', '-b', 'first']);
    stageFile(repository, 'first.txt', 'first\n');
    const firstTip = commitAll(repository, 'first');

    git(repository, ['checkout', '-q', '-b', 'second', base]);
    const oversized = Buffer.concat([
      Buffer.alloc(2048 * 1024, 0x61),
      Buffer.from('\n'),
    ]);
    stageFile(repository, 'second-big.bin', oversized);
    stageFile(repository, 'second-clean.txt', 'clean\n');
    const secondTip = commitAll(repository, 'second');

    const calls: Array<{ phase: AuditPhase; second: boolean }> = [];
    const invoker: AuditInvoker = async (phase, context) => {
      const second = fs.existsSync(
        path.join(context.snapshotDir, 'second-clean.txt'),
      );
      calls.push({ phase, second });
      if (phase === 'test' && second) {
        return {
          code: 5,
          stdout: Buffer.from('detail for the failing ref\nsecond stdout line'),
          stderr: Buffer.from('stderr tail'),
        };
      }
      return { code: 0, stdout: Buffer.alloc(0), stderr: Buffer.alloc(0) };
    };

    const result = await run(repository, 'pre-push', {
      stdin: Buffer.concat([
        pushLine(firstTip, base, 'refs/heads/first'),
        pushLine(secondTip, base, 'refs/heads/second'),
      ]),
      audit: invoker,
    });

    expect(result.code).toBe(1);
    expect(messages(result, 'check-added-large-files')).toEqual([
      'refs/heads/second: second-big.bin (2049 KB) exceeds 2048 KB.',
    ]);
    expect(calls).toEqual([
      { phase: 'typecheck', second: false },
      { phase: 'typecheck', second: true },
      { phase: 'test', second: false },
      { phase: 'test', second: true },
    ]);
    expect(named(result, 'typecheck').ok).toBe(true);
    expect(named(result, 'test').ok).toBe(false);
    expect(messages(result, 'test')).toEqual([
      'refs/heads/second: audit exited 5',
      'refs/heads/second: detail for the failing ref',
      'refs/heads/second: second stdout line',
      'refs/heads/second: stderr tail',
    ]);
  });

  test('deduplicates identical pushed tips', async () => {
    const repository = initRepository();
    stageFile(repository, 'base.txt', 'base\n');
    const base = commitAll(repository, 'base');
    stageFile(repository, 'next.txt', 'next\n');
    const tip = commitAll(repository, 'next');

    const { calls, invoker } = auditRecorder();
    const result = await run(repository, 'pre-push', {
      stdin: Buffer.concat([
        pushLine(tip, base, 'refs/heads/one', 'refs/heads/one'),
        pushLine(tip, base, 'refs/heads/two', 'refs/heads/two'),
      ]),
      audit: invoker,
    });

    expect(result.code).toBe(0);
    expect(calls.map((call) => call.phase)).toEqual(['typecheck', 'test']);
    expect(result.checks.map((check) => check.name)).toEqual([
      ...STAGE_CHECKS['pre-push'],
      ...STAGE_AUDITS['pre-push'],
    ]);
  });
});
