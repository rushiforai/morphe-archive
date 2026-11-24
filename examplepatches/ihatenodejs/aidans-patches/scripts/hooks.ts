#!/usr/bin/env bun
/**
 * Stage-aware Git hooks for the repository.
 *
 * The stage registry below is the single source of truth for both Git hook
 * execution and tests. Git is only ever read in place; audits run against a
 * temporary snapshot of the staged index (pre-commit) or the pushed commit
 * tree (pre-push), so partially staged files and unrelated working-tree edits
 * are never inspected or modified.
 */
import { spawn } from 'node:child_process';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';
import { parseTOML } from 'toml-eslint-parser';

const LARGE_FILE_LIMIT_KB = 2048;
// Renderer goldens intentionally preserve legacy trailing whitespace/CRLF.
const HYGIENE_EXCLUDE =
  /(?:^scripts\/test-fixtures\/generate-patches-readme\/|\.(?:so|mpe|mpp|apk|apkm|ttf|png|svg|lock|pdf)$|patches-(?:list|bundle)\.json)/;
const ZERO_SHA = /^0+$/;

export type HookStage = 'pre-commit' | 'pre-push';
export type AuditPhase = 'format:check' | 'lint' | 'typecheck' | 'test';
export type CheckName =
  | 'check-added-large-files'
  | 'check-merge-conflict'
  | 'check-case-conflict'
  | 'trailing-whitespace'
  | 'end-of-file-fixer'
  | 'check-yaml'
  | 'check-toml';

export interface CommandResult {
  code: number;
  stdout: Buffer;
  stderr: Buffer;
}

export interface CommandOptions {
  cwd: string;
  env?: Record<string, string | undefined>;
  stdin?: Buffer;
}

export type CommandRunner = (
  cmd: string,
  args: readonly string[],
  options: CommandOptions,
) => Promise<CommandResult>;

export interface AuditContext {
  stage: HookStage;
  snapshotDir: string;
  repoRoot: string;
}

export type AuditInvoker = (
  phase: AuditPhase,
  context: AuditContext,
) => Promise<CommandResult>;

export interface CheckResult {
  name: string;
  kind: 'check' | 'audit';
  ok: boolean;
  messages: string[];
}

export interface HookResult {
  code: number;
  stage: HookStage;
  checks: CheckResult[];
}

export interface HookOptions {
  stage: HookStage;
  cwd?: string;
  stdin?: Buffer;
  args?: readonly string[];
  runner?: CommandRunner;
  auditInvoker?: AuditInvoker;
  /** Environment for read-only Git commands; audits get a sanitized copy. */
  env?: Record<string, string | undefined>;
}

export const STAGE_CHECKS: Record<HookStage, readonly CheckName[]> = {
  'pre-commit': [
    'check-added-large-files',
    'check-merge-conflict',
    'check-case-conflict',
    'trailing-whitespace',
    'end-of-file-fixer',
    'check-yaml',
    'check-toml',
  ],
  'pre-push': [
    'check-added-large-files',
    'trailing-whitespace',
    'end-of-file-fixer',
  ],
};

export const STAGE_AUDITS: Record<HookStage, readonly AuditPhase[]> = {
  'pre-commit': ['format:check', 'lint'],
  'pre-push': ['typecheck', 'test'],
};

export const HYGIENE_EXCLUDE_PATTERN = HYGIENE_EXCLUDE;
export const LARGE_FILE_THRESHOLD_KB = LARGE_FILE_LIMIT_KB;

export const spawnCommand: CommandRunner = (cmd, args, options) => {
  const { promise, resolve } = Promise.withResolvers<CommandResult>();
  const stdout: Buffer[] = [];
  const stderr: Buffer[] = [];
  const child = spawn(cmd, [...args], {
    cwd: options.cwd,
    env: options.env ?? process.env,
    shell: false,
    stdio: ['pipe', 'pipe', 'pipe'],
  });
  child.stdout.on('data', (chunk: Buffer) => stdout.push(chunk));
  child.stderr.on('data', (chunk: Buffer) => stderr.push(chunk));
  child.stdin.on('error', () => {
    // The command may exit before consuming stdin; the exit status wins.
    return undefined;
  });
  child.on('error', (error) => {
    resolve({
      code: 127,
      stdout: Buffer.concat(stdout),
      stderr: Buffer.concat([
        ...stderr,
        Buffer.from(`${cmd}: ${(error as Error).message}\n`),
      ]),
    });
  });
  child.on('close', (code) => {
    resolve({
      code: code ?? 1,
      stdout: Buffer.concat(stdout),
      stderr: Buffer.concat(stderr),
    });
  });
  child.stdin.end(options.stdin ?? Buffer.alloc(0));
  return promise;
};

class GitError extends Error {
  constructor(
    readonly args: readonly string[],
    readonly result: CommandResult,
  ) {
    const detail = result.stderr.toString('utf8').trim();
    super(
      `git ${args.join(' ')} failed with exit ${result.code}${
        detail ? `: ${detail}` : ''
      }`,
    );
  }
}

class GitRepo {
  constructor(
    readonly cwd: string,
    private readonly runner: CommandRunner,
    private readonly env?: Record<string, string | undefined>,
  ) {}

  async exec(args: readonly string[], stdin?: Buffer): Promise<Buffer> {
    const result = await this.runner('git', args, {
      cwd: this.cwd,
      env: this.env,
      stdin,
    });
    if (result.code !== 0) throw new GitError(args, result);
    return result.stdout;
  }

  async tryExec(args: readonly string[]): Promise<CommandResult> {
    return this.runner('git', args, { cwd: this.cwd, env: this.env });
  }

  async execAt(
    cwd: string,
    args: readonly string[],
    options: {
      env?: Record<string, string | undefined>;
      stdin?: Buffer;
    } = {},
  ): Promise<Buffer> {
    const result = await this.runner('git', args, {
      cwd,
      env: options.env ?? this.env,
      stdin: options.stdin,
    });
    if (result.code !== 0) throw new GitError(args, result);
    return result.stdout;
  }
}

function splitNul(input: Buffer): Buffer[] {
  const fields: Buffer[] = [];
  let start = 0;
  for (let index = 0; index < input.length; index += 1) {
    if (input[index] !== 0) continue;
    fields.push(input.subarray(start, index));
    start = index + 1;
  }
  if (start < input.length) fields.push(input.subarray(start));
  return fields;
}

function decodeUtf8(input: Buffer, what: string): string {
  try {
    return new TextDecoder('utf-8', { fatal: true }).decode(input);
  } catch {
    throw new Error(`${what} is not valid UTF-8; refusing to guess a path`);
  }
}

function nulTerminated(paths: Iterable<string>): Buffer {
  const parts: Buffer[] = [];
  for (const value of paths) {
    parts.push(Buffer.from(value, 'utf8'), Buffer.from([0]));
  }
  return Buffer.concat(parts);
}

interface IndexEntry {
  path: string;
  mode: string;
  oid: string;
}

interface TreeEntry {
  path: string;
  mode: string;
  oid: string;
}

interface IndexState {
  entries: Map<string, IndexEntry>;
  unmerged: string[];
}

async function readIndex(git: GitRepo): Promise<IndexState> {
  const raw = await git.exec(['ls-files', '-s', '-z']);
  const entries = new Map<string, IndexEntry>();
  const unmerged = new Set<string>();
  for (const field of splitNul(raw)) {
    const record = decodeUtf8(field, 'Git index path');
    const tab = record.indexOf('\t');
    if (tab < 0) throw new Error('Unexpected git ls-files record');
    const [mode, oid, stage] = record.slice(0, tab).split(' ');
    const file = record.slice(tab + 1);
    if (stage !== '0') {
      unmerged.add(file);
      continue;
    }
    entries.set(file, { path: file, mode, oid });
  }
  return { entries, unmerged: [...unmerged].sort() };
}

async function readTree(
  git: GitRepo,
  revision: string,
): Promise<Map<string, TreeEntry>> {
  const raw = await git.exec(['ls-tree', '-r', '-z', '--full-tree', revision]);
  const entries = new Map<string, TreeEntry>();
  for (const field of splitNul(raw)) {
    const record = decodeUtf8(field, 'Git tree path');
    const tab = record.indexOf('\t');
    if (tab < 0) throw new Error('Unexpected git ls-tree record');
    const [mode, type, oid] = record.slice(0, tab).split(' ');
    if (type !== 'blob' || mode === '160000') continue;
    const file = record.slice(tab + 1);
    entries.set(file, { path: file, mode, oid });
  }
  return entries;
}

interface ChangedPath {
  path: string;
  status: string;
}

function parseNameStatus(raw: Buffer): ChangedPath[] {
  const fields = splitNul(raw).map((field) =>
    decodeUtf8(field, 'Git diff path'),
  );
  const changed: ChangedPath[] = [];
  let index = 0;
  while (index < fields.length) {
    const status = fields[index];
    index += 1;
    if (!status) continue;
    const kind = status[0];
    if (kind === 'R' || kind === 'C') {
      index += 1; // source path
      const destination = fields[index];
      index += 1;
      if (destination) changed.push({ path: destination, status: kind });
      continue;
    }
    const file = fields[index];
    index += 1;
    if (file) changed.push({ path: file, status: kind });
  }
  return changed;
}

async function readStagedChanges(git: GitRepo): Promise<ChangedPath[]> {
  const raw = await git.exec([
    'diff',
    '--cached',
    '--name-status',
    '-z',
    '--find-renames',
    '--diff-filter=ACMRTUXB',
  ]);
  return parseNameStatus(raw);
}

async function readStagedAdditions(git: GitRepo): Promise<Set<string>> {
  const raw = await git.exec([
    'diff',
    '--cached',
    '--name-status',
    '-z',
    '--diff-filter=A',
    '--find-renames',
  ]);
  return new Set(
    parseNameStatus(raw)
      .filter((entry) => entry.status === 'A')
      .map((entry) => entry.path),
  );
}

async function readBlob(git: GitRepo, oid: string): Promise<Buffer> {
  return git.exec(['cat-file', 'blob', oid]);
}

async function readBlobSize(git: GitRepo, oid: string): Promise<number> {
  const raw = await git.exec(['cat-file', '-s', oid]);
  return Number(raw.toString('utf8').trim());
}

async function readLfsAttributes(
  git: GitRepo,
  paths: Iterable<string>,
  source: string | null,
): Promise<Set<string>> {
  const list = [...paths];
  if (list.length === 0) return new Set();
  const args = ['check-attr', 'filter', '-z', '--stdin'];
  if (source === null) args.push('--cached');
  else args.push(`--source=${source}`);
  const raw = await git.exec(args, nulTerminated(list));
  const fields = splitNul(raw).map((field) =>
    decodeUtf8(field, 'Git attribute path'),
  );
  const lfs = new Set<string>();
  for (let index = 0; index + 2 < fields.length; index += 3) {
    if (fields[index + 2] === 'lfs') lfs.add(fields[index]);
  }
  return lfs;
}

function isTextContent(content: Buffer): boolean {
  if (content.includes(0)) return false;
  try {
    new TextDecoder('utf-8', { fatal: true }).decode(content);
    return true;
  } catch {
    return false;
  }
}

function lowerExtension(file: string): string {
  const slash = file.lastIndexOf('/');
  const name = slash >= 0 ? file.slice(slash + 1) : file;
  const dot = name.lastIndexOf('.');
  return dot <= 0 ? '' : name.slice(dot).toLowerCase();
}

/** ASCII whitespace as used by Python's `bytes.rstrip(None)`. */
function isAsciiWhitespace(byte: number): boolean {
  return (
    byte === 0x20 ||
    byte === 0x09 ||
    byte === 0x0a ||
    byte === 0x0b ||
    byte === 0x0c ||
    byte === 0x0d
  );
}

function stripTrailingWhitespace(input: Buffer): Buffer {
  const lines: Buffer[] = [];
  let start = 0;
  for (let index = 0; index < input.length; index += 1) {
    if (input[index] !== 0x0a) continue;
    lines.push(input.subarray(start, index + 1));
    start = index + 1;
  }
  if (start < input.length) lines.push(input.subarray(start));
  const output: Buffer[] = [];
  for (const line of lines) {
    let body = line;
    let eol = Buffer.alloc(0);
    if (
      body.length >= 2 &&
      body[body.length - 2] === 0x0d &&
      body[body.length - 1] === 0x0a
    ) {
      body = body.subarray(0, body.length - 2);
      eol = Buffer.from('\r\n');
    } else if (body.length >= 1 && body[body.length - 1] === 0x0a) {
      body = body.subarray(0, body.length - 1);
      eol = Buffer.from('\n');
    }
    let end = body.length;
    while (end > 0 && isAsciiWhitespace(body[end - 1])) end -= 1;
    output.push(body.subarray(0, end), eol);
  }
  return Buffer.concat(output);
}

export function hasTrailingWhitespace(content: Buffer): boolean {
  return !stripTrailingWhitespace(content).equals(content);
}

export function needsEndOfFileFix(content: Buffer): boolean {
  if (content.length === 0) return false;
  const last = content[content.length - 1];
  if (last !== 0x0a && last !== 0x0d) return true;
  let index = content.length - 1;
  while (index >= 0 && (content[index] === 0x0a || content[index] === 0x0d)) {
    index -= 1;
  }
  if (index < 0) return true;
  const suffix = content.subarray(index + 1).toString('latin1');
  return suffix !== '\n' && suffix !== '\r\n' && suffix !== '\r';
}

interface BunYamlModule {
  parse(input: string): unknown;
}

function bunYaml(): BunYamlModule {
  const runtime = Bun as unknown as { YAML?: BunYamlModule };
  if (!runtime.YAML) {
    throw new Error('Bun.YAML is unavailable; cannot check YAML syntax');
  }
  return runtime.YAML;
}

function assertNoForbiddenYamlControls(text: string): void {
  for (const character of text) {
    const code = character.codePointAt(0) ?? 0;
    if (code === 0x09 || code === 0x0a || code === 0x0d || code === 0x85) {
      continue;
    }
    if (
      code <= 0x08 ||
      code === 0x0b ||
      code === 0x0c ||
      (code >= 0x0e && code <= 0x1f) ||
      code === 0x7f ||
      (code >= 0x80 && code <= 0x9f) ||
      code === 0xfffe ||
      code === 0xffff
    ) {
      throw new Error(
        `forbidden control character U+${code
          .toString(16)
          .toUpperCase()
          .padStart(4, '0')}`,
      );
    }
  }
}

export function validateYaml(content: Buffer): void {
  const text = decodeUtf8(content, 'YAML file');
  assertNoForbiddenYamlControls(text);
  try {
    bunYaml().parse(text);
  } catch (error) {
    const message = (error as Error).message;
    // The previous --unsafe hook used an event parser, which accepts aliases
    // before resolving them. Bun composes the document, so only suppress that
    // one composition diagnostic for syntax-only parity.
    if (message.includes('Unresolved alias')) return;
    throw error;
  }
}

export function validateToml(content: Buffer): void {
  // Bun.TOML rejects valid TOML 1.0 integers outside the JS safe range.
  // toml-eslint-parser in 1.0 mode matches tomli/tomllib acceptance.
  const text = decodeUtf8(content, 'TOML file');
  if (/\r(?!\n)/.test(text)) {
    throw new Error('bare carriage return is not a TOML 1.0 newline');
  }
  parseTOML(text, { tomlVersion: '1.0.0' });
}

const MERGE_PATTERNS: ReadonlyArray<{ bytes: Buffer; label: string }> = [
  { bytes: Buffer.from('<<<<<<< '), label: '<<<<<<<' },
  { bytes: Buffer.from('======= '), label: '=======' },
  { bytes: Buffer.from('=======\r\n'), label: '=======' },
  { bytes: Buffer.from('=======\n'), label: '=======' },
  { bytes: Buffer.from('>>>>>>> '), label: '>>>>>>>' },
];

export function findMergeConflictLines(content: Buffer): Array<{
  line: number;
  pattern: string;
}> {
  const found: Array<{ line: number; pattern: string }> = [];
  let line = 1;
  let start = 0;
  for (let index = 0; index <= content.length; index += 1) {
    if (index !== content.length && content[index] !== 0x0a) continue;
    const end = index < content.length ? index + 1 : index;
    const value = content.subarray(start, end);
    for (const pattern of MERGE_PATTERNS) {
      if (value.subarray(0, pattern.bytes.length).equals(pattern.bytes)) {
        found.push({ line, pattern: pattern.label });
        break;
      }
    }
    line += 1;
    start = index + 1;
  }
  return found;
}

function parentDirectories(file: string): string[] {
  const parts = file.split('/');
  parts.pop();
  const directories: string[] = [];
  while (parts.length > 0) {
    directories.push(parts.join('/'));
    parts.pop();
  }
  return directories;
}

export function findCaseConflicts(
  tracked: Iterable<string>,
  relevant: Iterable<string>,
): string[] {
  const repository = new Set(tracked);
  const relevantSet = new Set(relevant);
  for (const directory of directorySet(repository)) repository.add(directory);
  for (const directory of directorySet(relevantSet)) relevantSet.add(directory);
  for (const file of relevantSet) repository.delete(file);

  const lowerRepository = new Set(
    [...repository].map((file) => file.toLowerCase()),
  );
  const lowerRelevant = new Set(
    [...relevantSet].map((file) => file.toLowerCase()),
  );
  const conflicts = new Set<string>();
  for (const value of lowerRepository) {
    if (lowerRelevant.has(value)) conflicts.add(value);
  }

  const counts = new Map<string, number>();
  for (const file of relevantSet) {
    const lower = file.toLowerCase();
    counts.set(lower, (counts.get(lower) ?? 0) + 1);
  }
  for (const [value, count] of counts) {
    if (count > 1) conflicts.add(value);
  }

  const output = new Set<string>();
  for (const file of [...repository, ...relevantSet]) {
    if (conflicts.has(file.toLowerCase())) output.add(file);
  }
  return [...output].sort();
}

function directorySet(files: Iterable<string>): Set<string> {
  const directories = new Set<string>();
  for (const file of files) {
    for (const directory of parentDirectories(file)) directories.add(directory);
  }
  return directories;
}

interface PushUpdate {
  localRef: string;
  localSha: string;
  remoteRef: string;
  remoteSha: string;
}

function parsePushUpdates(stdin: Buffer): PushUpdate[] {
  const text = decodeUtf8(stdin, 'pre-push stdin');
  const updates: PushUpdate[] = [];
  for (const line of text.split('\n')) {
    const trimmed = line.replace(/\r$/, '');
    if (!trimmed.trim()) continue;
    const parts = trimmed.split(' ');
    if (parts.length < 4) {
      throw new Error(`Unrecognised pre-push ref update: ${trimmed}`);
    }
    const [localRef, localSha, remoteRef, remoteSha] = parts;
    updates.push({ localRef, localSha, remoteRef, remoteSha });
  }
  return updates;
}

interface PushRange {
  tip: string;
  base: string | null;
  allFiles: boolean;
}

async function resolvePushRange(
  git: GitRepo,
  update: PushUpdate,
  remoteName: string | undefined,
): Promise<PushRange | null> {
  if (ZERO_SHA.test(update.localSha)) return null;
  if (update.localSha === update.remoteSha) return null;

  if (!ZERO_SHA.test(update.remoteSha)) {
    const exists = await git.tryExec([
      'cat-file',
      '-e',
      `${update.remoteSha}^{commit}`,
    ]);
    if (exists.code === 0) {
      return { tip: update.localSha, base: update.remoteSha, allFiles: false };
    }
  }

  const notRemotes = remoteName ? `--remotes=${remoteName}` : '--remotes';
  const ancestors = (
    await git.exec([
      'rev-list',
      update.localSha,
      '--topo-order',
      '--reverse',
      '--not',
      notRemotes,
    ])
  )
    .toString('utf8')
    .trim();
  if (!ancestors) return null;
  const firstAncestor = ancestors.split('\n')[0];
  const roots = new Set(
    (await git.exec(['rev-list', '--max-parents=0', update.localSha]))
      .toString('utf8')
      .trim()
      .split('\n'),
  );
  if (roots.has(firstAncestor)) {
    return { tip: update.localSha, base: null, allFiles: true };
  }
  const base = (await git.exec(['rev-parse', `${firstAncestor}^`]))
    .toString('utf8')
    .trim();
  return { tip: update.localSha, base, allFiles: false };
}

async function isInMerge(git: GitRepo): Promise<boolean> {
  const gitDirRaw = (await git.exec(['rev-parse', '--git-dir']))
    .toString('utf8')
    .trim();
  const gitDir = path.resolve(git.cwd, gitDirRaw);
  const exists = (name: string): boolean =>
    fs.existsSync(path.join(gitDir, name));
  return (
    exists('MERGE_MSG') &&
    (exists('MERGE_HEAD') || exists('rebase-apply') || exists('rebase-merge'))
  );
}

interface SourceFile {
  path: string;
  mode: string;
  oid: string;
}

interface CheckContext {
  git: GitRepo;
  stage: HookStage;
  files: SourceFile[];
  additions: Set<string>;
  attributeSource: string | null;
  readSource: (file: SourceFile) => Promise<Buffer>;
}

function makeReadSource(git: GitRepo): (file: SourceFile) => Promise<Buffer> {
  const cache = new Map<string, Buffer>();
  return async (file) => {
    const cached = cache.get(file.path);
    if (cached) return cached;
    const content = await readBlob(git, file.oid);
    cache.set(file.path, content);
    return content;
  };
}

async function runCheck(
  name: CheckName,
  context: CheckContext,
): Promise<string[]> {
  switch (name) {
    case 'check-added-large-files': {
      const lfs = await readLfsAttributes(
        context.git,
        [...context.additions],
        context.attributeSource,
      );
      const messages: string[] = [];
      for (const file of context.files) {
        if (!context.additions.has(file.path) || lfs.has(file.path)) continue;
        if (file.mode === '120000' || file.mode === '160000') continue;
        const size = await readBlobSize(context.git, file.oid);
        const kb = Math.ceil(size / 1024);
        if (kb > LARGE_FILE_LIMIT_KB) {
          messages.push(
            `${file.path} (${kb} KB) exceeds ${LARGE_FILE_LIMIT_KB} KB.`,
          );
        }
      }
      return messages;
    }
    case 'check-merge-conflict': {
      if (!(await isInMerge(context.git))) return [];
      const messages: string[] = [];
      for (const file of context.files) {
        if (file.mode === '120000' || file.mode === '160000') continue;
        const content = await context.readSource(file);
        if (!isTextContent(content)) continue;
        for (const conflict of findMergeConflictLines(content)) {
          messages.push(
            `${file.path}:${conflict.line}: Merge conflict string ` +
              `'${conflict.pattern}' found`,
          );
        }
      }
      return messages;
    }
    case 'check-case-conflict': {
      const tracked = await context.git.exec(['ls-files', '-z']);
      const trackedPaths = splitNul(tracked).map((field) =>
        decodeUtf8(field, 'Git tracked path'),
      );
      const relevant = new Set(context.files.map((file) => file.path));
      for (const addition of context.additions) relevant.add(addition);
      return findCaseConflicts(trackedPaths, relevant).map(
        (file) => `Case-insensitivity conflict found: ${file}`,
      );
    }
    case 'trailing-whitespace': {
      const messages: string[] = [];
      for (const file of context.files) {
        if (file.mode === '120000' || file.mode === '160000') continue;
        if (HYGIENE_EXCLUDE.test(file.path)) continue;
        const content = await context.readSource(file);
        if (!isTextContent(content)) continue;
        if (hasTrailingWhitespace(content)) {
          messages.push(
            `${file.path}: trailing whitespace found ` +
              '(check-only; file not modified)',
          );
        }
      }
      return messages;
    }
    case 'end-of-file-fixer': {
      const messages: string[] = [];
      for (const file of context.files) {
        if (file.mode === '120000' || file.mode === '160000') continue;
        if (HYGIENE_EXCLUDE.test(file.path)) continue;
        const content = await context.readSource(file);
        if (!isTextContent(content)) continue;
        if (needsEndOfFileFix(content)) {
          messages.push(
            `${file.path}: end-of-file fix needed ` +
              '(check-only; file not modified)',
          );
        }
      }
      return messages;
    }
    case 'check-yaml': {
      const messages: string[] = [];
      for (const file of context.files) {
        if (file.mode === '120000' || file.mode === '160000') continue;
        if (!['.yaml', '.yml'].includes(lowerExtension(file.path))) continue;
        const content = await context.readSource(file);
        if (!isTextContent(content)) continue;
        try {
          validateYaml(content);
        } catch (error) {
          messages.push(`${file.path}: ${firstLine((error as Error).message)}`);
        }
      }
      return messages;
    }
    case 'check-toml': {
      const messages: string[] = [];
      for (const file of context.files) {
        if (file.mode === '120000' || file.mode === '160000') continue;
        if (lowerExtension(file.path) !== '.toml') continue;
        const content = await context.readSource(file);
        if (!isTextContent(content)) continue;
        try {
          validateToml(content);
        } catch (error) {
          messages.push(`${file.path}: ${firstLine((error as Error).message)}`);
        }
      }
      return messages;
    }
  }
}

function firstLine(value: string): string {
  const line = value.split('\n')[0].trim();
  return line || 'validation failed';
}

/**
 * External dependency installs reused from the working tree. They must not
 * contain links back into repository source (for example workspace packages
 * or editable installs), otherwise audits would execute working-tree code
 * instead of the snapshot.
 */
const DEPENDENCY_PATHS = [
  'node_modules',
  'worker/node_modules',
  'site/node_modules',
] as const;

/**
 * Build-independent tool and compiler caches reused across snapshots. Build
 * outputs are deliberately absent: Cargo artifacts embed absolute source paths
 * (`CARGO_BIN_EXE`, manifest dirs, debug info), so sharing a `target` directory
 * between the worktree and a temporary snapshot makes whichever root runs
 * second execute binaries compiled for the other, deleted root.
 */
const CACHE_PATHS = ['.tools', '.gradle', 'local.properties'] as const;

function writeSnapshotEntry(
  root: string,
  file: SourceFile,
  content: Buffer,
): void {
  const destination = path.resolve(root, file.path);
  const rootPrefix = root.endsWith(path.sep) ? root : `${root}${path.sep}`;
  if (destination !== root && !destination.startsWith(rootPrefix)) {
    throw new Error(
      `Refusing to write snapshot path outside root: ${file.path}`,
    );
  }
  fs.mkdirSync(path.dirname(destination), { recursive: true });
  if (file.mode === '120000') {
    fs.symlinkSync(content.toString('utf8'), destination);
    return;
  }
  fs.writeFileSync(destination, content);
  fs.chmodSync(destination, file.mode === '100755' ? 0o755 : 0o644);
}

async function materializeSnapshot(
  git: GitRepo,
  entries: Iterable<SourceFile>,
): Promise<string> {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'bun-hooks-snapshot-'));
  try {
    for (const entry of entries) {
      if (entry.mode === '160000') {
        fs.mkdirSync(path.join(root, entry.path), { recursive: true });
        continue;
      }
      const content = await readBlob(git, entry.oid);
      writeSnapshotEntry(root, entry, content);
    }
    return root;
  } catch (error) {
    fs.rmSync(root, { recursive: true, force: true });
    throw error;
  }
}

function assertSourceIndependentDependencies(
  repoRoot: string,
  dependencyRoot: string,
): void {
  const repository = fs.realpathSync(repoRoot);
  const dependencies = fs.realpathSync(dependencyRoot);
  const directoryPrefix = `${dependencies}${path.sep}`;
  const repositoryPrefix = `${repository}${path.sep}`;
  const pending = [dependencies];
  while (pending.length > 0) {
    const directory = pending.pop() as string;
    let entries: fs.Dirent[];
    try {
      entries = fs.readdirSync(directory, { withFileTypes: true });
    } catch {
      continue;
    }
    for (const entry of entries) {
      const absolute = path.join(directory, entry.name);
      if (entry.isSymbolicLink()) {
        let target: string;
        try {
          target = fs.realpathSync(absolute);
        } catch {
          // A broken link cannot expose working-tree source.
          continue;
        }
        const pointsIntoRepository =
          target === repository || target.startsWith(repositoryPrefix);
        const staysInDependencies =
          target === dependencies || target.startsWith(directoryPrefix);
        if (pointsIntoRepository && !staysInDependencies) {
          const link = path.relative(repository, absolute);
          throw new Error(
            `${link} links to repository source outside the dependency ` +
              `cache (${target}); refusing to expose working-tree code`,
          );
        }
        continue;
      }
      if (entry.isDirectory()) pending.push(absolute);
    }
  }
}

function linkArtifact(
  repoRoot: string,
  snapshotRoot: string,
  relative: string,
): void {
  const source = path.join(repoRoot, relative);
  const destination = path.join(snapshotRoot, relative);
  if (!fs.existsSync(source) || fs.existsSync(destination)) return;
  fs.mkdirSync(path.dirname(destination), { recursive: true });
  const kind = fs.statSync(source).isDirectory() ? 'dir' : 'file';
  fs.symlinkSync(source, destination, kind);
}

function linkArtifacts(repoRoot: string, snapshotRoot: string): void {
  for (const relative of DEPENDENCY_PATHS) {
    const source = path.join(repoRoot, relative);
    if (!fs.existsSync(source)) continue;
    assertSourceIndependentDependencies(repoRoot, source);
    linkArtifact(repoRoot, snapshotRoot, relative);
  }
  for (const relative of CACHE_PATHS) {
    linkArtifact(repoRoot, snapshotRoot, relative);
  }
}

function isolatedGitEnvironment(
  base: Record<string, string | undefined> | undefined,
): Record<string, string | undefined> {
  const env = { ...(base ?? process.env) };
  for (const key of [
    'GIT_DIR',
    'GIT_WORK_TREE',
    'GIT_INDEX_FILE',
    'GIT_COMMON_DIR',
    'GIT_OBJECT_DIRECTORY',
    'GIT_ALTERNATE_OBJECT_DIRECTORIES',
    'GIT_NAMESPACE',
    'GIT_PREFIX',
  ]) {
    delete env[key];
  }
  return env;
}

function snapshotIndexInfo(entries: Iterable<SourceFile>): Buffer {
  const parts: Buffer[] = [];
  for (const entry of entries) {
    parts.push(
      Buffer.from(`${entry.mode} ${entry.oid}\t`, 'utf8'),
      Buffer.from(entry.path, 'utf8'),
      Buffer.from([0]),
    );
  }
  return Buffer.concat(parts);
}

/**
 * Give the snapshot its own Git repository identity. The object database is
 * borrowed read-only through alternates so consumers can inspect history,
 * but HEAD, refs and the index live inside the snapshot and never reference
 * the user's worktree or index.
 */
async function initializeSnapshotGit(
  git: GitRepo,
  snapshotRoot: string,
  entries: Iterable<SourceFile>,
  tip: string | null,
  baseEnv: Record<string, string | undefined> | undefined,
): Promise<void> {
  const env = isolatedGitEnvironment(baseEnv);
  const objectPath = (await git.exec(['rev-parse', '--git-path', 'objects']))
    .toString('utf8')
    .trim();
  const objectDirectory = path.resolve(git.cwd, objectPath);
  const gitDirectory = path.join(snapshotRoot, '.git');
  await git.execAt(snapshotRoot, ['init', '--quiet'], { env });
  fs.mkdirSync(path.join(gitDirectory, 'objects', 'info'), {
    recursive: true,
  });
  fs.writeFileSync(
    path.join(gitDirectory, 'objects', 'info', 'alternates'),
    `${objectDirectory}\n`,
  );

  const localEnv: Record<string, string | undefined> = {
    ...env,
    GIT_DIR: gitDirectory,
    GIT_WORK_TREE: snapshotRoot,
    GIT_INDEX_FILE: path.join(gitDirectory, 'index'),
    GIT_AUTHOR_NAME: 'hooks snapshot',
    GIT_AUTHOR_EMAIL: 'hooks@localhost',
    GIT_COMMITTER_NAME: 'hooks snapshot',
    GIT_COMMITTER_EMAIL: 'hooks@localhost',
    GIT_AUTHOR_DATE: '2000-01-01T00:00:00Z',
    GIT_COMMITTER_DATE: '2000-01-01T00:00:00Z',
  };
  const run = (args: readonly string[], stdin?: Buffer): Promise<Buffer> =>
    git.execAt(snapshotRoot, args, { env: localEnv, stdin });

  await run(['update-index', '-z', '--index-info'], snapshotIndexInfo(entries));
  const tree = (await run(['write-tree'])).toString('utf8').trim();
  const commitArgs = ['commit-tree', tree];
  if (tip) commitArgs.push('-p', tip);
  commitArgs.push('-m', 'hooks audit snapshot');
  const commit = (await run(commitArgs)).toString('utf8').trim();
  await run(['update-ref', 'refs/heads/audit-snapshot', commit]);
  await run(['symbolic-ref', 'HEAD', 'refs/heads/audit-snapshot']);

  const tags = await git.tryExec([
    'for-each-ref',
    '--format=%(refname)%00%(objectname)',
    'refs/tags',
  ]);
  if (tags.code !== 0) return;
  const commands: string[] = [];
  for (const line of tags.stdout.toString('utf8').split('\n')) {
    if (!line) continue;
    const separator = line.indexOf('\0');
    if (separator < 0) continue;
    const ref = line.slice(0, separator);
    const oid = line.slice(separator + 1).trim();
    if (!ref || !oid) continue;
    commands.push(`update ${ref} ${oid}\n`);
  }
  if (commands.length > 0) {
    await run(['update-ref', '--stdin'], Buffer.from(commands.join('')));
  }
}

function auditEnvironment(
  snapshotDir?: string,
): Record<string, string | undefined> {
  const env = { ...process.env, GIT_OPTIONAL_LOCKS: '0' };
  const virtualEnvironments = [env.VIRTUAL_ENV, env.CONDA_PREFIX].filter(
    (value): value is string => Boolean(value),
  );
  for (const key of [
    'GIT_INDEX_FILE',
    'GIT_DIR',
    'GIT_WORK_TREE',
    'GIT_COMMON_DIR',
    'GIT_PREFIX',
    'NODE_PATH',
    'PYTHONHOME',
    'PYTHONPATH',
    'UV_PROJECT_ENVIRONMENT',
    'VIRTUAL_ENV',
    'CONDA_PREFIX',
  ]) {
    delete env[key];
  }
  if (env.PATH && virtualEnvironments.length > 0) {
    const excluded = new Set(
      virtualEnvironments.flatMap((prefix) => [
        path.join(prefix, 'bin'),
        path.join(prefix, 'Scripts'),
      ]),
    );
    env.PATH = env.PATH.split(path.delimiter)
      .filter((entry) => !excluded.has(path.resolve(entry)))
      .join(path.delimiter);
  }
  if (snapshotDir) {
    env.UV_PROJECT_ENVIRONMENT = path.join(
      snapshotDir,
      'tools',
      'apk-lab',
      '.venv',
    );
  }
  return env;
}

export const defaultAuditInvoker: AuditInvoker = async (phase, context) => {
  const bun = process.execPath || 'bun';
  return spawnCommand(bun, ['scripts/audit.ts', phase], {
    cwd: context.snapshotDir,
    env: auditEnvironment(context.snapshotDir),
  });
};

interface AuditJob {
  label: string;
  tip: string | null;
  files: SourceFile[];
  additions: Set<string>;
  attributeSource: string | null;
  snapshotEntries: SourceFile[];
}

interface CheckAccumulator {
  ok: boolean;
  messages: string[];
}

interface PreparedSnapshot {
  job: AuditJob;
  directory: string | null;
  error: string | null;
}

function auditFailureMessages(code: number, result: CommandResult): string[] {
  const detail =
    `${result.stdout.toString('utf8')}\n` + `${result.stderr.toString('utf8')}`;
  const trimmed = detail.trim();
  const messages = [`audit exited ${code}`];
  if (trimmed) messages.push(...trimmed.split(/\r?\n/));
  return messages;
}

export async function runHook(options: HookOptions): Promise<HookResult> {
  const stage = options.stage;
  if (stage !== 'pre-commit' && stage !== 'pre-push') {
    throw new Error(`Unknown hook stage: ${String(stage)}`);
  }
  const cwd = options.cwd ?? process.cwd();
  const runner = options.runner ?? spawnCommand;
  const auditInvoker = options.auditInvoker ?? defaultAuditInvoker;
  const git = new GitRepo(cwd, runner, options.env);
  const checks: CheckResult[] = [];
  const jobs: AuditJob[] = [];
  let canAudit = true;

  if (stage === 'pre-commit') {
    const index = await readIndex(git);
    if (index.unmerged.length > 0) {
      canAudit = false;
      checks.push({
        name: 'index',
        kind: 'check',
        ok: false,
        messages: index.unmerged.map(
          (file) => `${file}: unresolved merge stages; resolve the index entry`,
        ),
      });
    }
    const changes = await readStagedChanges(git);
    const changedPaths = changes
      .filter((entry) => entry.status !== 'D')
      .map((entry) => entry.path);
    const files = changedPaths
      .map((file) => index.entries.get(file))
      .filter((entry): entry is IndexEntry => Boolean(entry));
    const additions = await readStagedAdditions(git);
    const head = await git.tryExec(['rev-parse', '--verify', 'HEAD']);
    jobs.push({
      label: '',
      tip: head.code === 0 ? head.stdout.toString('utf8').trim() : null,
      files,
      additions,
      attributeSource: null,
      snapshotEntries: [...index.entries.values()],
    });
  } else {
    const stdin = options.stdin ?? Buffer.alloc(0);
    const args = options.args ?? [];
    const remoteName = args[0];
    const updates = stdin.length > 0 ? parsePushUpdates(stdin) : [];
    const ranges: Array<{ label: string; range: PushRange }> = [];
    if (updates.length > 0) {
      const audited = new Set<string>();
      for (const update of updates) {
        const range = await resolvePushRange(git, update, remoteName);
        if (!range) continue;
        const key = `${range.base ?? ''}\0${range.tip}\0${range.allFiles}`;
        if (audited.has(key)) continue;
        audited.add(key);
        ranges.push({ label: update.localRef, range });
      }
      if (ranges.length === 0) {
        return { code: 0, stage, checks: [] };
      }
    } else {
      // Manual invocation: audit the current HEAD and the last commit's diff.
      const head = await git.tryExec(['rev-parse', '--verify', 'HEAD']);
      if (head.code !== 0) {
        return { code: 0, stage, checks: [] };
      }
      const tip = head.stdout.toString('utf8').trim();
      const parent = await git.tryExec(['rev-parse', '--verify', `${tip}^`]);
      ranges.push({
        label: '',
        range:
          parent.code === 0
            ? {
                tip,
                base: parent.stdout.toString('utf8').trim(),
                allFiles: false,
              }
            : { tip, base: null, allFiles: true },
      });
    }

    for (const { label, range } of ranges) {
      const tree = await readTree(git, range.tip);
      let changed: ChangedPath[];
      if (range.allFiles) {
        changed = [...tree.values()].map((entry) => ({
          path: entry.path,
          status: 'A',
        }));
      } else {
        const raw = await git.exec([
          'diff',
          '--name-status',
          '-z',
          '--find-renames',
          range.base as string,
          range.tip,
        ]);
        changed = parseNameStatus(raw);
      }
      const files = changed
        .filter((entry) => entry.status !== 'D')
        .map((entry) => tree.get(entry.path))
        .filter((entry): entry is TreeEntry => Boolean(entry));
      const additions = new Set(
        changed
          .filter((entry) => entry.status === 'A')
          .map((entry) => entry.path)
          .filter((file) => tree.has(file)),
      );
      jobs.push({
        label,
        tip: range.tip,
        files,
        additions,
        attributeSource: range.tip,
        snapshotEntries: [...tree.values()],
      });
    }
  }

  const prefixFor = (job: AuditJob): string =>
    jobs.length > 1 && job.label ? `${job.label}: ` : '';
  const checkResults = new Map<string, CheckAccumulator>();
  for (const job of jobs) {
    const context: CheckContext = {
      git,
      stage,
      files: job.files,
      additions: job.additions,
      attributeSource: job.attributeSource,
      readSource: makeReadSource(git),
    };
    for (const name of STAGE_CHECKS[stage]) {
      let ok = true;
      let messages: string[];
      try {
        messages = await runCheck(name, context);
        ok = messages.length === 0;
      } catch (error) {
        messages = [firstLine((error as Error).message)];
        ok = false;
      }
      const accumulated: CheckAccumulator = checkResults.get(name) ?? {
        ok: true,
        messages: [],
      };
      accumulated.ok &&= ok;
      accumulated.messages.push(
        ...messages.map((message) => `${prefixFor(job)}${message}`),
      );
      checkResults.set(name, accumulated);
    }
  }
  for (const name of STAGE_CHECKS[stage]) {
    const result = checkResults.get(name);
    if (!result) continue;
    checks.push({
      name,
      kind: 'check',
      ok: result.ok,
      messages: result.messages,
    });
  }

  const snapshots: PreparedSnapshot[] = [];
  if (canAudit) {
    for (const job of jobs) {
      let directory: string | null = null;
      try {
        directory = await materializeSnapshot(git, job.snapshotEntries);
        linkArtifacts(cwd, directory);
        await initializeSnapshotGit(
          git,
          directory,
          job.snapshotEntries,
          job.tip,
          options.env,
        );
        snapshots.push({ job, directory, error: null });
      } catch (error) {
        if (directory) {
          fs.rmSync(directory, { recursive: true, force: true });
        }
        snapshots.push({
          job,
          directory: null,
          error: firstLine((error as Error).message),
        });
      }
    }
    const preparationErrors = snapshots.filter(
      (snapshot) => snapshot.error !== null,
    );
    if (preparationErrors.length > 0) {
      checks.push({
        name: 'audit-snapshot',
        kind: 'audit',
        ok: false,
        messages: preparationErrors.map(
          (snapshot) =>
            `${prefixFor(snapshot.job)}Could not prepare isolated audit ` +
            `snapshot: ${snapshot.error}`,
        ),
      });
    }
  } else {
    checks.push({
      name: 'audit-snapshot',
      kind: 'audit',
      ok: false,
      messages: ['unresolved index entries; audits were not run'],
    });
  }

  try {
    for (const phase of STAGE_AUDITS[stage]) {
      let ok = true;
      const messages: string[] = [];
      if (!canAudit) {
        ok = false;
        messages.push('audit snapshot unavailable; audit was not run');
      } else {
        for (const snapshot of snapshots) {
          const prefix = prefixFor(snapshot.job);
          if (!snapshot.directory) {
            ok = false;
            messages.push(
              `${prefix}audit snapshot unavailable; audit was not run`,
            );
            continue;
          }
          try {
            const result = await auditInvoker(phase, {
              stage,
              snapshotDir: snapshot.directory,
              repoRoot: cwd,
            });
            if (result.code !== 0) {
              ok = false;
              messages.push(
                ...auditFailureMessages(result.code, result).map(
                  (message) => `${prefix}${message}`,
                ),
              );
            }
          } catch (error) {
            ok = false;
            messages.push(
              `${prefix}audit could not be started: ` +
                `${firstLine((error as Error).message)}`,
            );
          }
        }
      }
      checks.push({
        name: phase,
        kind: 'audit',
        ok,
        messages,
      });
    }
  } finally {
    for (const snapshot of snapshots) {
      if (snapshot.directory) {
        fs.rmSync(snapshot.directory, { recursive: true, force: true });
      }
    }
  }

  return {
    code: checks.every((check) => check.ok) ? 0 : 1,
    stage,
    checks,
  };
}

function printResult(result: HookResult): void {
  for (const check of result.checks) {
    const label = check.ok ? 'ok' : 'FAILED';
    console.log(`hooks: ${check.name}: ${label}`);
    for (const message of check.messages) console.log(`  ${message}`);
  }
  if (result.code !== 0) {
    console.error(`hooks: ${result.stage} checks failed`);
  }
}

async function main(argv: readonly string[]): Promise<number> {
  const stage = argv[0];
  if (stage !== 'pre-commit' && stage !== 'pre-push') {
    console.error(
      `hooks: unknown stage ${stage ?? '(missing)'}; ` +
        'expected pre-commit or pre-push',
    );
    return 2;
  }
  let stdin = Buffer.alloc(0);
  if (stage === 'pre-push' && !process.stdin.isTTY) {
    const chunks: Buffer[] = [];
    for await (const chunk of Bun.stdin.stream()) {
      chunks.push(Buffer.from(chunk));
    }
    stdin = Buffer.concat(chunks);
  }
  try {
    const result = await runHook({
      stage,
      cwd: process.cwd(),
      stdin,
      args: argv.slice(1),
    });
    printResult(result);
    return result.code;
  } catch (error) {
    console.error(`hooks: ${(error as Error).message}`);
    return 1;
  }
}

if (import.meta.main) {
  process.exitCode = await main(process.argv.slice(2));
}
