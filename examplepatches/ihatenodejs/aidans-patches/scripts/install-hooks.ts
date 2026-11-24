#!/usr/bin/env bun
import { spawnSync } from 'node:child_process';
import * as fs from 'node:fs';
import * as path from 'node:path';

export const HOOK_STAGES = ['pre-commit', 'pre-push'] as const;
export type HookStage = (typeof HOOK_STAGES)[number];

const MANAGED_MARKER = '# aidans-patches-managed-hook: 1';
const MANAGED_PREFIX = `#!/bin/sh\n${MANAGED_MARKER}\n`;

// pre-commit identifies its generated wrappers by one of these hashes. Keep
// the list in sync with pre_commit/commands/install_uninstall.py.
const PRECOMMIT_WRAPPER_HASHES: Record<string, true> = {
  '138fd403232d2ddd5efb44317e38bf03': true,
  '4d9958c90bc262f47553e2c073f14cfe': true,
  d8ee923c46731b42cd95cc869add4062: true,
  '49fd668cb42069aa1b6048464be5d395': true,
  '79f09a650522a87b0da915d0d983b2de': true,
  e358c9dae00eac5d06b38dfdb1e33a8c: true,
};

const PRECOMMIT_DEFAULT_CONFIG = '.pre-commit-config.yaml';

const CONFLICT_HELP = `Resolve conflicts without losing an existing hook:
  - keep the existing hook: leave it in place and do not install this wrapper;
  - move it aside: mv <hook> <hook>.custom, then rerun the installer;
  - recognized pre-commit wrappers: rerun with --migrate-pre-commit;
    if <hook>.legacy exists, add --accept-legacy-loss only after confirming
    that the legacy hook no longer needs to run (its file is left in place).`;

export class InstallerError extends Error {}

interface GitResult {
  status: number;
  stdout: string;
  stderr: string;
}

function git(cwd: string, args: readonly string[]): GitResult {
  const result = spawnSync('git', [...args], {
    cwd,
    encoding: 'utf8',
    stdio: ['ignore', 'pipe', 'pipe'],
  });
  if (result.error) {
    throw new InstallerError(
      `cannot run git: ${result.error.message}; install Git and retry`,
    );
  }
  return {
    status: result.status ?? 1,
    stdout: result.stdout ?? '',
    stderr: result.stderr ?? '',
  };
}

function gitOk(cwd: string, args: readonly string[], what: string): string {
  const result = git(cwd, args);
  if (result.status !== 0) {
    const detail = result.stderr.trim() || `exit ${result.status}`;
    throw new InstallerError(`${what}: ${detail}`);
  }
  return result.stdout;
}

function canonicalPath(target: string): string {
  const absolute = path.resolve(target);
  let current = absolute;
  const missing: string[] = [];
  for (;;) {
    try {
      const real = fs.realpathSync.native(current);
      return missing.length > 0 ? path.join(real, ...missing) : real;
    } catch (error) {
      if ((error as { code?: string }).code !== 'ENOENT') {
        return absolute;
      }
      const parent = path.dirname(current);
      if (parent === current) {
        return absolute;
      }
      missing.unshift(path.basename(current));
      current = parent;
    }
  }
}

function isMissingPathError(error: unknown): boolean {
  return (
    typeof error === 'object' &&
    error !== null &&
    'code' in error &&
    error.code === 'ENOENT'
  );
}

function isWithin(child: string, parent: string): boolean {
  const relative = path.relative(parent, child);
  return (
    relative === '' ||
    (!relative.startsWith(`..${path.sep}`) &&
      relative !== '..' &&
      !path.isAbsolute(relative))
  );
}

function listWorktrees(cwd: string): string[] {
  const output = gitOk(
    cwd,
    ['worktree', 'list', '--porcelain', '-z'],
    'cannot list Git worktrees',
  );
  const worktrees: string[] = [];
  for (const field of output.split('\0')) {
    if (field.startsWith('worktree ')) {
      worktrees.push(canonicalPath(field.slice('worktree '.length)));
    }
  }
  return worktrees;
}

export type HooksConfigSource =
  'default' | 'local' | 'worktree' | 'global' | 'system' | 'command';

export interface HooksLocation {
  root: string;
  gitDir: string;
  commonDir: string;
  hooksDir: string;
  source: HooksConfigSource;
  configuredValue?: string;
  disabled: boolean;
  external: boolean;
  externalReason?: string;
  sharedWorktrees: string[];
  sharedHooksWorktrees: string[];
}

interface ConfigEntry {
  source: HooksConfigSource;
  value: string;
}

function readHooksPathConfig(cwd: string): {
  source: HooksConfigSource;
  value?: string;
} {
  const result = git(cwd, [
    'config',
    '--show-scope',
    '--show-origin',
    '--get-all',
    'core.hooksPath',
  ]);
  if (result.status === 1) {
    return { source: 'default' };
  }
  if (result.status !== 0) {
    throw new InstallerError(
      `cannot read core.hooksPath: ${result.stderr.trim() || `exit ${result.status}`}`,
    );
  }
  const entries: ConfigEntry[] = [];
  for (const line of result.stdout.split('\n')) {
    if (line === '') continue;
    const firstTab = line.indexOf('\t');
    const secondTab = line.indexOf('\t', firstTab + 1);
    if (firstTab === -1 || secondTab === -1) {
      throw new InstallerError(
        'unexpected output from git config --show-scope --show-origin',
      );
    }
    const scope = line.slice(0, firstTab);
    if (
      scope !== 'local' &&
      scope !== 'worktree' &&
      scope !== 'global' &&
      scope !== 'system' &&
      scope !== 'command'
    ) {
      throw new InstallerError(`unknown Git config scope "${scope}"`);
    }
    entries.push({ source: scope, value: line.slice(secondTab + 1) });
  }
  const effective = entries.at(-1);
  if (effective === undefined) {
    return { source: 'default' };
  }
  return effective;
}

export function resolveHooksLocation(
  cwd: string = process.cwd(),
): HooksLocation {
  const bare = gitOk(
    cwd,
    ['rev-parse', '--is-bare-repository'],
    'cannot inspect the Git repository',
  ).trim();
  if (bare === 'true') {
    throw new InstallerError(
      'bare repositories are not supported; install hooks from a worktree',
    );
  }

  const topLevel = git(cwd, ['rev-parse', '--show-toplevel']);
  if (topLevel.status !== 0) {
    throw new InstallerError(
      'not inside a Git worktree; run this command from the repository',
    );
  }
  const root = canonicalPath(topLevel.stdout.trim());
  const gitDir = canonicalPath(
    gitOk(
      cwd,
      ['rev-parse', '--path-format=absolute', '--git-dir'],
      'cannot resolve the Git directory',
    ).trim(),
  );
  const commonDir = canonicalPath(
    gitOk(
      cwd,
      ['rev-parse', '--path-format=absolute', '--git-common-dir'],
      'cannot resolve the Git common directory',
    ).trim(),
  );

  const config = readHooksPathConfig(cwd);
  const hooksResult = git(cwd, [
    'rev-parse',
    '--path-format=absolute',
    '--git-path',
    'hooks',
  ]);
  if (hooksResult.status !== 0) {
    const detail = hooksResult.stderr.trim() || `exit ${hooksResult.status}`;
    if (config.value === '') {
      throw new InstallerError(
        'core.hooksPath is set to an empty string, which Git rejects; unset it or point it at a directory',
      );
    }
    throw new InstallerError(`cannot resolve the hooks directory: ${detail}`);
  }
  const hooksDir = path.resolve(hooksResult.stdout.trim());
  const canonicalHooksDir = canonicalPath(hooksDir);
  const disabled =
    config.source !== 'default' &&
    (canonicalHooksDir === '/dev/null' || canonicalHooksDir === 'NUL');

  const worktrees = listWorktrees(cwd);
  const sharedWorktrees = worktrees.filter(
    (worktree) => canonicalPath(worktree) !== root,
  );

  let external = false;
  let externalReason: string | undefined;
  if (config.source !== 'default') {
    if (config.source !== 'local' && config.source !== 'worktree') {
      external = true;
      externalReason = `core.hooksPath comes from ${config.source} Git configuration, which is shared across repositories`;
    } else if (isWithin(canonicalHooksDir, path.join(commonDir, 'worktrees'))) {
      const currentPrivateGitDir = isWithin(
        gitDir,
        path.join(commonDir, 'worktrees'),
      );
      if (!currentPrivateGitDir || !isWithin(canonicalHooksDir, gitDir)) {
        external = true;
        externalReason =
          'core.hooksPath points into another linked worktree Git directory';
      }
    } else {
      const otherWorktree = sharedWorktrees.find((worktree) =>
        isWithin(canonicalHooksDir, worktree),
      );
      if (otherWorktree !== undefined) {
        external = true;
        externalReason = `core.hooksPath points into another worktree (${otherWorktree})`;
      } else if (
        !isWithin(canonicalHooksDir, root) &&
        !isWithin(canonicalHooksDir, commonDir)
      ) {
        external = true;
        externalReason =
          'core.hooksPath points outside this repository (possibly a shared hooks directory)';
      }
    }
  }

  // A destination is genuinely shared when another linked worktree resolves
  // the same hooks directory, not merely when other worktrees exist. This
  // catches the default common hooks directory as well as absolute
  // core.hooksPath values shared through repository-local config.
  const sharedHooksWorktrees = disabled
    ? []
    : sharedWorktrees.filter((worktree) => {
        if (!fs.existsSync(worktree)) return false;
        const result = git(worktree, [
          'rev-parse',
          '--path-format=absolute',
          '--git-path',
          'hooks',
        ]);
        return (
          result.status === 0 &&
          canonicalPath(result.stdout.trim()) === canonicalHooksDir
        );
      });
  if (sharedHooksWorktrees.length > 0 && !external) {
    external = true;
    externalReason = `hooks directory ${hooksDir} is shared with ${sharedHooksWorktrees.length} linked worktree(s); installing here changes hooks for all of them`;
  }

  return {
    root,
    gitDir,
    commonDir,
    hooksDir,
    source: config.source,
    configuredValue: config.value,
    disabled,
    external,
    externalReason,
    sharedWorktrees,
    sharedHooksWorktrees,
  };
}

export function renderWrapper(stage: HookStage): string {
  return `${MANAGED_PREFIX}# stage: ${stage}
# Installed by scripts/install-hooks.ts; rerun the installer instead of editing.
# Git may invoke this from any worktree, so resolve the current root at run time.
set -e
stage='${stage}'
root="$(git rev-parse --show-toplevel 2>/dev/null)" || {
  echo 'aidans-patches hook: not inside a Git worktree' >&2
  exit 1
}
cd "$root"
if ! command -v bun >/dev/null 2>&1; then
  echo 'aidans-patches hook: bun not found in PATH; install Bun (https://bun.sh)' >&2
  exit 127
fi
exec bun scripts/hooks.ts "$stage" "$@"
`;
}

interface PreCommitWrapperInfo {
  recognized: boolean;
  config?: string;
}

const PRECOMMIT_ORIGIN_LINE =
  '# File generated by pre-commit: https://pre-commit.com';

// shlex.quote() leaves safe paths unquoted and wraps unsafe ones in single or
// double quotes. Recognize only those forms; anything else is not a generated
// wrapper.
const PRECOMMIT_INSTALL_PYTHON_LINE =
  /^INSTALL_PYTHON=(?:[A-Za-z0-9_@%+=:,./-]+|'(?:[^'\\]|\\.)*'|"(?:[^"\\$`]|\\.)*")$/;

const PRECOMMIT_ARGS_LINE =
  /^ARGS=\(hook-impl --config=(?:"([^"]*)"|'([^']*)'|([^\s)]+)) --hook-type=([a-z][a-z-]*)(?: --skip-on-missing-config)?\)$/;

const PRECOMMIT_NOT_FOUND_LINE =
  /^    echo (?:'pre-commit not found\.'|'`pre-commit` not found\.  Did you forget to activate your virtualenv\?') 1>&2$/;

// Every fixed line of the supported Bash wrapper template, excluding the two
// interpolated lines (# ID and the templated block) and the message variant.
const PRECOMMIT_TEMPLATE_LINES: ReadonlyArray<readonly [number, string]> = [
  [0, '#!/usr/bin/env bash'],
  [1, PRECOMMIT_ORIGIN_LINE],
  [3, ''],
  [4, '# start templated'],
  [7, '# end templated'],
  [8, ''],
  [9, 'HERE="$(cd "$(dirname "$0")" && pwd)"'],
  [10, 'ARGS+=(--hook-dir "$HERE" -- "$@")'],
  [11, ''],
  [12, 'if [ -x "$INSTALL_PYTHON" ]; then'],
  [13, '    exec "$INSTALL_PYTHON" -mpre_commit "${ARGS[@]}"'],
  [14, 'elif command -v pre-commit > /dev/null; then'],
  [15, '    exec pre-commit "${ARGS[@]}"'],
  [16, 'else'],
  [18, '    exit 1'],
  [19, 'fi'],
];

const PRECOMMIT_TEMPLATE_LINE_COUNT = 20;

/**
 * Recognize only the complete pre-commit wrapper template, never arbitrary
 * text that happens to contain the generated-by header or ID. Additional
 * commands, even inside an otherwise valid wrapper, mean the hook no longer
 * belongs solely to pre-commit and must be treated as custom.
 */
export function inspectPreCommitWrapper(
  content: string,
  stage: HookStage,
): PreCommitWrapperInfo {
  const lines = content.split('\n');
  if (lines.at(-1) === '') lines.pop();
  if (lines.length !== PRECOMMIT_TEMPLATE_LINE_COUNT) {
    return { recognized: false };
  }
  for (const [index, expected] of PRECOMMIT_TEMPLATE_LINES) {
    if (lines[index] !== expected) return { recognized: false };
  }
  const idMatch = /^# ID: ([0-9a-f]{32})$/.exec(lines[2]);
  if (idMatch === null || PRECOMMIT_WRAPPER_HASHES[idMatch[1]] !== true) {
    return { recognized: false };
  }
  if (!PRECOMMIT_INSTALL_PYTHON_LINE.test(lines[5])) {
    return { recognized: false };
  }
  const argsMatch = PRECOMMIT_ARGS_LINE.exec(lines[6]);
  if (argsMatch === null || argsMatch[4] !== stage) {
    return { recognized: false };
  }
  if (!PRECOMMIT_NOT_FOUND_LINE.test(lines[17])) {
    return { recognized: false };
  }
  const config = argsMatch[1] ?? argsMatch[2] ?? argsMatch[3];
  return { recognized: true, config };
}

export type HookFileState =
  | 'absent'
  | 'installed'
  | 'needs-update'
  | 'pre-commit-generated'
  | 'conflict'
  | 'disabled';

export type HookAction = 'none' | 'create' | 'update' | 'migrate' | 'conflict';

export interface StagePlan {
  stage: HookStage;
  hookPath: string;
  state: HookFileState;
  action: HookAction;
  message: string;
  previousContent: Buffer | null;
  previousMode: number | null;
}

export interface InstallationInspection {
  location: HooksLocation;
  stages: StagePlan[];
  problems: string[];
  warnings: string[];
  ok: boolean;
  installable: boolean;
  disabled: boolean;
  migratePreCommit: boolean;
  allowExternalHooksPath: boolean;
  acceptLegacyLoss: boolean;
}

export interface InstallerOptions {
  cwd?: string;
  check?: boolean;
  migratePreCommit?: boolean;
  allowExternalHooksPath?: boolean;
  acceptLegacyLoss?: boolean;
}

function inspectStage(
  location: HooksLocation,
  stage: HookStage,
  options: InstallerOptions,
): StagePlan {
  const hookPath = path.join(location.hooksDir, stage);
  const base = {
    stage,
    hookPath,
    previousContent: null as Buffer | null,
    previousMode: null as number | null,
  };

  let stat: fs.Stats;
  try {
    stat = fs.lstatSync(hookPath);
  } catch (error) {
    if ((error as { code?: string }).code === 'ENOENT') {
      return {
        ...base,
        state: 'absent',
        action: 'create',
        message: 'missing',
      };
    }
    return {
      ...base,
      state: 'conflict',
      action: 'conflict',
      message: `cannot inspect ${hookPath}: ${(error as Error).message}`,
    };
  }

  if (stat.isSymbolicLink()) {
    return {
      ...base,
      state: 'conflict',
      action: 'conflict',
      message: `${stage} is a symbolic link; refusing to write through it`,
    };
  }
  if (!stat.isFile()) {
    return {
      ...base,
      state: 'conflict',
      action: 'conflict',
      message: `${stage} is not a regular file`,
    };
  }

  const rawContent = fs.readFileSync(hookPath);
  const content = rawContent.toString('utf8');
  const previous = { previousContent: rawContent, previousMode: stat.mode };

  if (content === renderWrapper(stage)) {
    if ((stat.mode & 0o111) === 0) {
      return {
        ...base,
        ...previous,
        state: 'needs-update',
        action: 'update',
        message: 'managed wrapper is not executable',
      };
    }
    return {
      ...base,
      ...previous,
      state: 'installed',
      action: 'none',
      message: 'installed (current)',
    };
  }

  if (content.startsWith(MANAGED_PREFIX)) {
    return {
      ...base,
      ...previous,
      state: 'needs-update',
      action: 'update',
      message: 'managed wrapper is out of date',
    };
  }

  const preCommit = inspectPreCommitWrapper(content, stage);
  if (!preCommit.recognized) {
    return {
      ...base,
      ...previous,
      state: 'conflict',
      action: 'conflict',
      message:
        'existing hook is not owned by aidans-patches (custom or unknown hook)',
    };
  }

  if (!options.migratePreCommit) {
    return {
      ...base,
      ...previous,
      state: 'pre-commit-generated',
      action: 'conflict',
      message:
        'pre-commit-generated wrapper detected; rerun with --migrate-pre-commit to replace it',
    };
  }

  let config = preCommit.config ?? PRECOMMIT_DEFAULT_CONFIG;
  if (config.startsWith('./')) config = config.slice(2);
  if (config !== PRECOMMIT_DEFAULT_CONFIG) {
    return {
      ...base,
      ...previous,
      state: 'pre-commit-generated',
      action: 'conflict',
      message: `pre-commit wrapper uses custom config "${config}"; migrate it manually instead of discarding that configuration`,
    };
  }

  const legacyPath = `${hookPath}.legacy`;
  let legacyExists = false;
  try {
    // Any directory entry counts: pre-commit's legacy dispatcher follows
    // symlinks and executes executable files, so a symlinked legacy hook is
    // still active behavior that migration would disable.
    fs.lstatSync(legacyPath);
    legacyExists = true;
  } catch (error) {
    if (!isMissingPathError(error)) {
      throw new InstallerError(
        `cannot inspect ${legacyPath}: ${(error as Error).message}`,
      );
    }
  }
  if (legacyExists && !options.acceptLegacyLoss) {
    return {
      ...base,
      ...previous,
      state: 'pre-commit-generated',
      action: 'conflict',
      message: `pre-commit wrapper has a ${stage}.legacy hook that would stop running; rerun with --accept-legacy-loss to keep only the Bun hook (the legacy file is preserved)`,
    };
  }

  return {
    ...base,
    ...previous,
    state: 'pre-commit-generated',
    action: 'migrate',
    message: legacyExists
      ? 'pre-commit wrapper will be replaced; legacy hook file will no longer run'
      : 'pre-commit wrapper will be replaced',
  };
}

function inspectHooksDirectory(
  location: HooksLocation,
  needsWrite: boolean,
  options: InstallerOptions,
): string[] {
  if (location.disabled) return [];
  const problems: string[] = [];
  let stat: fs.Stats | undefined;
  try {
    stat = fs.lstatSync(location.hooksDir);
  } catch (error) {
    if ((error as { code?: string }).code !== 'ENOENT') {
      problems.push(
        `cannot inspect hooks directory ${location.hooksDir}: ${(error as Error).message}`,
      );
    }
  }
  if (stat !== undefined) {
    if (stat.isSymbolicLink()) {
      const real = canonicalPath(location.hooksDir);
      if (
        !isWithin(real, location.root) &&
        !isWithin(real, location.commonDir) &&
        !options.allowExternalHooksPath
      ) {
        problems.push(
          `hooks directory ${location.hooksDir} is a symbolic link that escapes the repository; refusing without --allow-external-hooks-path`,
        );
      }
      try {
        if (!fs.statSync(location.hooksDir).isDirectory()) {
          problems.push(`${location.hooksDir} is not a directory`);
        }
      } catch (error) {
        problems.push(
          `cannot inspect hooks directory ${location.hooksDir}: ${(error as Error).message}`,
        );
      }
    } else if (!stat.isDirectory()) {
      problems.push(`${location.hooksDir} is not a directory`);
    }
  }
  if (needsWrite && location.external && !options.allowExternalHooksPath) {
    problems.push(
      `refusing to install into ${location.hooksDir}: ${location.externalReason}; rerun with --allow-external-hooks-path if this shared destination is intentional`,
    );
  }
  return problems;
}

export function inspectInstallation(
  options: InstallerOptions = {},
): InstallationInspection {
  const cwd = options.cwd ?? process.cwd();
  const location = resolveHooksLocation(cwd);
  const stages: StagePlan[] = location.disabled
    ? HOOK_STAGES.map((stage) => ({
        stage,
        hookPath: path.join(location.hooksDir, stage),
        state: 'disabled',
        action: 'none',
        message: 'disabled by core.hooksPath=/dev/null',
        previousContent: null,
        previousMode: null,
      }))
    : HOOK_STAGES.map((stage) => inspectStage(location, stage, options));
  const problems: string[] = [];
  const warnings: string[] = [];

  for (const stage of stages) {
    if (stage.action === 'conflict') {
      problems.push(`${stage.stage}: ${stage.message}`);
    }
  }

  if (location.disabled) {
    return {
      location,
      stages,
      problems: [],
      warnings,
      ok: true,
      installable: false,
      disabled: true,
      migratePreCommit: options.migratePreCommit ?? false,
      allowExternalHooksPath: options.allowExternalHooksPath ?? false,
      acceptLegacyLoss: options.acceptLegacyLoss ?? false,
    };
  }

  if (location.sharedHooksWorktrees.length > 0) {
    warnings.push(
      `hooks directory is shared with ${location.sharedHooksWorktrees.length} linked worktree(s); wrappers resolve the current worktree root at run time`,
    );
  }
  if (location.external) {
    warnings.push(location.externalReason ?? 'hooks directory is external');
  }

  if (Bun.which('bun') === null) {
    problems.push(
      'bun was not found in PATH; install Bun before installing hooks',
    );
  }

  const needsWrite = stages.some(
    (stage) => stage.action !== 'none' && stage.action !== 'conflict',
  );
  problems.push(...inspectHooksDirectory(location, needsWrite, options));

  const allInstalled = stages.every((stage) => stage.state === 'installed');
  const hasConflict = stages.some((stage) => stage.action === 'conflict');
  return {
    location,
    stages,
    problems,
    warnings,
    ok: allInstalled && problems.length === 0,
    installable: !hasConflict && problems.length === 0,
    disabled: false,
    migratePreCommit: options.migratePreCommit ?? false,
    allowExternalHooksPath: options.allowExternalHooksPath ?? false,
    acceptLegacyLoss: options.acceptLegacyLoss ?? false,
  };
}

interface PreparedWrite {
  plan: StagePlan;
  tempPath: string;
}

function temporaryPath(directory: string, stage: HookStage): string {
  const unique = `${process.pid}-${Date.now()}-${Math.random().toString(36).slice(2)}`;
  return path.join(directory, `.${stage}.aidans-${unique}.tmp`);
}

function writeTemporaryWrapper(directory: string, stage: HookStage): string {
  const tempPath = temporaryPath(directory, stage);
  const content = Buffer.from(renderWrapper(stage), 'utf8');
  try {
    const fd = fs.openSync(tempPath, 'wx', 0o755);
    try {
      fs.writeFileSync(fd, content);
      fs.fchmodSync(fd, 0o755);
      fs.fsyncSync(fd);
    } finally {
      fs.closeSync(fd);
    }
  } catch (error) {
    try {
      fs.unlinkSync(tempPath);
    } catch {
      // Best-effort cleanup of the partial temporary file.
    }
    throw error;
  }
  return tempPath;
}

function verifyPreviousState(plan: StagePlan): void {
  if (plan.previousContent === null) {
    try {
      fs.lstatSync(plan.hookPath);
    } catch (error) {
      if ((error as { code?: string }).code === 'ENOENT') return;
      throw error;
    }
    throw new InstallerError(
      `${plan.hookPath} appeared while installing; refusing to overwrite it`,
    );
  }
  let stat: fs.Stats;
  try {
    stat = fs.lstatSync(plan.hookPath);
  } catch {
    throw new InstallerError(
      `${plan.hookPath} disappeared while installing; refusing to guess`,
    );
  }
  if (stat.isSymbolicLink() || !stat.isFile()) {
    throw new InstallerError(
      `${plan.hookPath} changed type while installing; refusing to overwrite it`,
    );
  }
  const current = fs.readFileSync(plan.hookPath);
  if (!current.equals(plan.previousContent)) {
    throw new InstallerError(
      `${plan.hookPath} changed while installing; refusing to overwrite it`,
    );
  }
}

export interface ApplyResult {
  written: HookStage[];
}

export function applyInstallation(
  inspection: InstallationInspection,
): ApplyResult {
  if (inspection.disabled) {
    return { written: [] };
  }
  if (!inspection.installable) {
    throw new InstallerError(
      'installation is blocked; no hook files were changed',
    );
  }
  const writes = inspection.stages.filter(
    (plan) =>
      plan.action === 'create' ||
      plan.action === 'update' ||
      plan.action === 'migrate',
  );
  if (writes.length === 0) {
    return { written: [] };
  }

  const hooksDir = inspection.location.hooksDir;
  let directoryStat: fs.Stats | undefined;
  try {
    directoryStat = fs.lstatSync(hooksDir);
  } catch (error) {
    if ((error as { code?: string }).code !== 'ENOENT') throw error;
  }
  if (directoryStat === undefined) {
    fs.mkdirSync(hooksDir, { recursive: true });
  } else if (
    directoryStat.isSymbolicLink()
      ? !fs.statSync(hooksDir).isDirectory()
      : !directoryStat.isDirectory()
  ) {
    throw new InstallerError(`${hooksDir} is not a directory`);
  }

  const prepared: PreparedWrite[] = [];
  try {
    for (const plan of writes) {
      prepared.push({
        plan,
        tempPath: writeTemporaryWrapper(hooksDir, plan.stage),
      });
    }
    // Re-check every destination after all staging is complete, then publish.
    // Any concurrent edit aborts before the first rename.
    for (const write of prepared) {
      verifyPreviousState(write.plan);
    }
    for (const write of prepared) {
      fs.renameSync(write.tempPath, write.plan.hookPath);
    }
  } catch (error) {
    for (const write of prepared) {
      try {
        fs.unlinkSync(write.tempPath);
      } catch {
        // Best-effort cleanup; the original failure is more useful.
      }
    }
    throw error;
  }
  return { written: writes.map((write) => write.stage) };
}

export class UsageError extends Error {}

export interface InstallerCliOptions extends InstallerOptions {
  help?: boolean;
}

export function parseInstallerArgs(
  argv: readonly string[],
): InstallerCliOptions {
  const options: InstallerCliOptions = {};
  for (const arg of argv) {
    switch (arg) {
      case '--help':
      case '-h':
        options.help = true;
        break;
      case '--check':
        options.check = true;
        break;
      case '--migrate-pre-commit':
        options.migratePreCommit = true;
        break;
      case '--allow-external-hooks-path':
        options.allowExternalHooksPath = true;
        break;
      case '--accept-legacy-loss':
        options.acceptLegacyLoss = true;
        break;
      default:
        throw new UsageError(`unknown argument: ${arg}`);
    }
  }
  if (options.acceptLegacyLoss && !options.migratePreCommit) {
    throw new UsageError('--accept-legacy-loss requires --migrate-pre-commit');
  }
  return options;
}

const USAGE = `Usage: bun scripts/install-hooks.ts [options]

Install repo-owned Git pre-commit and pre-push wrappers that run
\`bun scripts/hooks.ts <stage>\` against the current worktree root.

Options:
  --check                       Inspect only; write nothing (nonzero if not current)
  --migrate-pre-commit          Replace recognized pre-commit-generated wrappers
  --accept-legacy-loss          With --migrate-pre-commit, allow replacing a
                                wrapper whose <stage>.legacy hook would stop running
  --allow-external-hooks-path   Permit writing to a global/system/local hooks path
                                outside this repository or shared with other worktrees
  -h, --help                    Show this help

${CONFLICT_HELP}
`;

export interface InstallerIO {
  stdout: (message: string) => void;
  stderr: (message: string) => void;
}

function describeStage(plan: StagePlan): string {
  switch (plan.state) {
    case 'installed':
      return 'installed (current)';
    case 'absent':
      return 'missing';
    case 'needs-update':
      return `needs update: ${plan.message}`;
    case 'pre-commit-generated':
      return `pre-commit wrapper: ${plan.message}`;
    case 'conflict':
      return `conflict: ${plan.message}`;
    case 'disabled':
      return 'disabled by core.hooksPath=/dev/null';
  }
}

export function runInstaller(
  argv: readonly string[],
  io: InstallerIO,
  cwd: string = process.cwd(),
): number {
  let parsed: InstallerCliOptions;
  try {
    parsed = parseInstallerArgs(argv);
  } catch (error) {
    if (error instanceof UsageError) {
      io.stderr(`error: ${error.message}\n\n${USAGE}`);
      return 2;
    }
    throw error;
  }
  if (parsed.help) {
    io.stdout(USAGE);
    return 0;
  }

  let inspection: InstallationInspection;
  try {
    inspection = inspectInstallation({ ...parsed, cwd });
  } catch (error) {
    if (error instanceof InstallerError) {
      io.stderr(`error: ${error.message}`);
      return 1;
    }
    throw error;
  }

  const location = inspection.location;
  io.stdout('aidans-patches hook installer');
  io.stdout(`  hooks directory: ${location.hooksDir}`);
  const origin =
    location.source === 'default' ? 'default' : `${location.source} config`;
  io.stdout(
    `  configured via: ${origin}${location.configuredValue === undefined ? '' : ` (${location.configuredValue})`}`,
  );
  for (const warning of inspection.warnings) {
    io.stdout(`  note: ${warning}`);
  }
  for (const stage of inspection.stages) {
    io.stdout(`  ${stage.stage}: ${describeStage(stage)}`);
  }

  if (inspection.disabled) {
    io.stdout(
      'hooks are deliberately disabled by core.hooksPath=/dev/null; nothing to do',
    );
    return 0;
  }

  for (const problem of inspection.problems) {
    io.stderr(`error: ${problem}`);
  }

  if (inspection.problems.length > 0) {
    io.stderr('No hook files were changed.');
    if (inspection.stages.some((stage) => stage.action === 'conflict')) {
      io.stderr(CONFLICT_HELP);
    }
    return 1;
  }

  if (parsed.check) {
    if (!inspection.ok) {
      io.stderr(
        'Hooks are not installed in their current form; run `bun scripts/install-hooks.ts` to install them.',
      );
      return 1;
    }
    io.stdout('Hooks are installed and current.');
    return 0;
  }

  if (inspection.stages.every((stage) => stage.state === 'installed')) {
    io.stdout('Hooks are already installed and current; nothing to write.');
    return 0;
  }

  try {
    const result = applyInstallation(inspection);
    io.stdout(`Installed: ${result.written.join(', ')}`);
    return 0;
  } catch (error) {
    if (error instanceof InstallerError) {
      io.stderr(`error: ${error.message}`);
      return 1;
    }
    throw error;
  }
}

if (import.meta.main) {
  process.exit(
    runInstaller(process.argv.slice(2), {
      stdout: (message) => console.log(message),
      stderr: (message) => console.error(message),
    }),
  );
}
