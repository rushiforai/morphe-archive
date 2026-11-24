#!/usr/bin/env bun
import { spawnSync } from 'node:child_process';
import * as fs from 'node:fs';
import * as path from 'node:path';

/**
 * Reconcile semantic-release channel notes.
 *
 * semantic-release records each release's channel in a git note on the tag
 * commit (`refs/notes/semantic-release-<tag>`). A prerelease branch only sees
 * a tag as released when its note carries the branch channel. If the notes
 * push fails after the tag was pushed, every later run recomputes the same
 * version and dies on the existing tag.
 *
 * This reconciler is additive and idempotent: it only fills notes that are
 * missing on tags created by semantic-release for the current branch. It never
 * rewrites an existing note, deletes a tag, or touches branches.
 */

const NOTE_NAMESPACE = 'semantic-release';
const BOT_NAME = 'semantic-release-bot';
const BOT_EMAIL = 'semantic-release-bot@martynus.net';
const TAG_FORMAT_MARKER = '${version}';

// Official semver 2.0.0 pattern, minus the capture groups we do not use.
const SEMVER_PATTERN =
  /^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[A-Za-z-][0-9A-Za-z-]*)(?:\.(?:0|[1-9]\d*|\d*[A-Za-z-][0-9A-Za-z-]*))*))?(?:\+[0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*)?$/;

const USAGE = `Usage: bun scripts/reconcile-release-notes.ts [options]

Fill missing semantic-release channel notes for tags merged into the current branch.

Options:
  --ref <branch>     Branch to reconcile (default: current branch)
  --remote <name>   Git remote (default: origin)
  --cwd <path>      Repository root (default: process.cwd())
  --dry-run         Report missing notes without writing or pushing
  --help            Show this message`;

class ReconcileError extends Error {}

interface GitResult {
  status: number;
  stdout: string;
  stderr: string;
}

interface CliOptions {
  ref?: string;
  remote: string;
  cwd: string;
  dryRun: boolean;
}

interface BranchConfig {
  name: string;
  prerelease: boolean | string | undefined;
  channel: string | null | undefined;
}

interface ReleaseConfig {
  branches: Array<string | Partial<BranchConfig>>;
  tagFormat: string;
}

interface TagVersion {
  version: string;
  prerelease: string[];
}

function git(
  cwd: string,
  args: string[],
  { reject = true }: { reject?: boolean } = {},
): GitResult {
  const result = spawnSync('git', args, {
    cwd,
    encoding: 'utf8',
    stdio: ['ignore', 'pipe', 'pipe'],
    env: {
      ...process.env,
      GIT_TERMINAL_PROMPT: '0',
    },
  });

  if (result.error) {
    throw new ReconcileError(`cannot run git: ${result.error.message}`);
  }

  const resolved: GitResult = {
    status: result.status ?? 1,
    stdout: result.stdout ?? '',
    stderr: result.stderr ?? '',
  };

  if (reject && resolved.status !== 0) {
    throw new ReconcileError(
      `git ${args.join(' ')} failed: ${(resolved.stderr || resolved.stdout).trim()}`,
    );
  }

  return resolved;
}

function currentBranch(cwd: string): string {
  const result = git(cwd, ['rev-parse', '--abbrev-ref', 'HEAD']);
  const branch = result.stdout.trim();
  return branch === 'HEAD' ? 'HEAD' : branch;
}

function resolveCommit(cwd: string, remote: string, ref: string): string {
  const candidates = [
    `refs/heads/${ref}`,
    `refs/remotes/${remote}/${ref}`,
    ref,
  ];

  for (const candidate of candidates) {
    const result = git(cwd, ['rev-parse', '--verify', '--quiet', candidate], {
      reject: false,
    });
    if (result.status === 0) {
      return result.stdout.trim();
    }
  }

  throw new ReconcileError(
    `branch '${ref}' is not present locally, on '${remote}', or as a commit-ish`,
  );
}

function parseArgs(argv: string[]): CliOptions {
  const options: CliOptions = {
    remote: 'origin',
    cwd: process.cwd(),
    dryRun: false,
  };

  let index = 0;
  const nextValue = (flag: string): string => {
    const value = argv[++index];
    if (value === undefined || value.startsWith('--')) {
      throw new ReconcileError(`${flag} requires a value\n\n${USAGE}`);
    }
    return value;
  };

  for (; index < argv.length; index += 1) {
    switch (argv[index]) {
      case '--ref':
        options.ref = nextValue('--ref');
        break;
      case '--remote':
        options.remote = nextValue('--remote');
        break;
      case '--cwd':
        options.cwd = nextValue('--cwd');
        break;
      case '--dry-run':
        options.dryRun = true;
        break;
      case '--help':
        console.log(USAGE);
        process.exit(0);
        break;
      default:
        throw new ReconcileError(
          `Unknown argument: ${argv[index]}\n\n${USAGE}`,
        );
    }
  }

  options.cwd = path.resolve(options.cwd);
  return options;
}

function readReleaseConfig(cwd: string): ReleaseConfig {
  const configPath = path.join(cwd, '.releaserc');
  if (!fs.existsSync(configPath)) {
    throw new ReconcileError(`missing release config: ${configPath}`);
  }

  // `.releaserc` has no extension, so semantic-release's cosmiconfig loads it
  // as YAML. Match that loader instead of assuming strict JSON.
  const parsed = Bun.YAML.parse(fs.readFileSync(configPath, 'utf8')) as {
    branches?: Array<string | Partial<BranchConfig>>;
    tagFormat?: string;
  };

  return {
    branches: parsed.branches ?? [],
    tagFormat: parsed.tagFormat ?? 'v${version}',
  };
}

function findBranchConfig(
  config: ReleaseConfig,
  ref: string,
): BranchConfig | null {
  const entry = config.branches.find(
    (candidate) =>
      (typeof candidate === 'string' ? candidate : candidate.name) === ref,
  );
  if (!entry) {
    return null;
  }

  if (typeof entry === 'string') {
    return { name: entry, prerelease: undefined, channel: null };
  }

  if (!entry.name) {
    throw new ReconcileError(`branch config for '${ref}' has no name`);
  }

  return {
    name: entry.name,
    prerelease: entry.prerelease,
    channel: entry.channel,
  };
}

function parseTag(
  tag: string,
  prefix: string,
  suffix: string,
): TagVersion | null {
  if (!tag.startsWith(prefix) || !tag.endsWith(suffix)) {
    return null;
  }

  const version = tag.slice(prefix.length, tag.length - suffix.length);
  const match = SEMVER_PATTERN.exec(version);
  if (!match) {
    return null;
  }

  return {
    version,
    prerelease: match[4] ? match[4].split('.') : [],
  };
}

function branchAcceptsVersion(
  branch: BranchConfig,
  parsed: TagVersion,
): boolean {
  if (branch.prerelease === undefined) {
    return parsed.prerelease.length === 0;
  }

  const preid = branch.prerelease === true ? branch.name : branch.prerelease;
  return parsed.prerelease.includes(preid);
}

function branchChannel(branch: BranchConfig): string | null {
  if (branch.channel !== undefined && branch.channel !== null) {
    return branch.channel;
  }
  return branch.prerelease === undefined ? null : branch.name;
}

function hasNote(cwd: string, tag: string): boolean {
  // semantic-release reads both the per-tag namespace and the legacy shared
  // namespace, so either one counts as an existing release record.
  for (const ref of [`${NOTE_NAMESPACE}-${tag}`, NOTE_NAMESPACE]) {
    const exists = git(
      cwd,
      ['rev-parse', '--verify', '--quiet', `refs/notes/${ref}`],
      { reject: false },
    );
    if (exists.status !== 0) {
      continue;
    }

    const result = git(
      cwd,
      ['notes', `--ref=${ref}`, 'show', `${tag}^{commit}`],
      { reject: false },
    );
    if (result.status === 0) {
      return true;
    }
    if (!/no note found/i.test(`${result.stdout}${result.stderr}`)) {
      throw new ReconcileError(
        `cannot read notes for ${tag}: ${(result.stderr || result.stdout).trim()}`,
      );
    }
  }

  return false;
}

function fetchNotes(cwd: string, remote: string): void {
  const result = git(
    cwd,
    [
      'fetch',
      '--no-tags',
      remote,
      '+refs/notes/semantic-release*:refs/notes/semantic-release*',
    ],
    { reject: false },
  );
  if (result.status === 0) {
    return;
  }

  const detail = `${result.stdout}${result.stderr}`;
  if (/couldn't find remote ref|no such ref/i.test(detail)) {
    console.log('No semantic-release notes exist on the remote yet.');
    return;
  }

  throw new ReconcileError(`cannot fetch notes: ${detail.trim()}`);
}

function writeNote(cwd: string, tag: string, channel: string | null): void {
  git(cwd, [
    '-c',
    `user.name=${BOT_NAME}`,
    '-c',
    `user.email=${BOT_EMAIL}`,
    'notes',
    `--ref=${NOTE_NAMESPACE}-${tag}`,
    'add',
    '-f',
    '-m',
    JSON.stringify({ channels: [channel] }),
    `${tag}^{commit}`,
  ]);
}

function pushNotes(
  cwd: string,
  remote: string,
  tags: string[],
  channel: string | null,
): void {
  const push = () =>
    git(
      cwd,
      [
        'push',
        '--no-verify',
        remote,
        ...tags.map((tag) => `refs/notes/${NOTE_NAMESPACE}-${tag}`),
      ],
      { reject: false },
    );

  const first = push();
  if (first.status === 0) {
    return;
  }

  // A concurrent writer may have created one of the notes between our fetch
  // and push. Re-read the remote state and only retry refs that are still
  // missing. Never overwrite a note that appeared in the meantime.
  fetchNotes(cwd, remote);
  const remaining = tags.filter((tag) => !hasNote(cwd, tag));
  for (const tag of remaining) {
    writeNote(cwd, tag, channel);
  }

  if (remaining.length === 0) {
    return;
  }

  const second = push();
  if (second.status !== 0) {
    throw new ReconcileError(
      `cannot push notes: ${(second.stderr || second.stdout).trim()}`,
    );
  }
}

function writeSummary(lines: string[]): void {
  const summaryPath = process.env.GITHUB_STEP_SUMMARY;
  if (!summaryPath || lines.length === 0) {
    return;
  }
  fs.appendFileSync(
    summaryPath,
    `### Release notes reconciled\n\n${lines.map((line) => `- ${line}`).join('\n')}\n\n`,
  );
}

function reconcile(options: CliOptions): number {
  const ref = options.ref ?? currentBranch(options.cwd);
  const config = readReleaseConfig(options.cwd);
  const branch = findBranchConfig(config, ref);
  if (!branch) {
    console.log(
      `::warning::No release branch config matches '${ref}'; skipping note reconciliation.`,
    );
    return 0;
  }

  const markerIndex = config.tagFormat.indexOf(TAG_FORMAT_MARKER);
  if (markerIndex === -1) {
    throw new ReconcileError(
      `tagFormat '${config.tagFormat}' does not contain ${TAG_FORMAT_MARKER}`,
    );
  }
  const prefix = config.tagFormat.slice(0, markerIndex);
  const suffix = config.tagFormat.slice(markerIndex + TAG_FORMAT_MARKER.length);

  const commit = resolveCommit(options.cwd, options.remote, ref);
  fetchNotes(options.cwd, options.remote);

  const tags = git(options.cwd, [
    'tag',
    '--merged',
    commit,
    '--sort=-v:refname',
  ])
    .stdout.split('\n')
    .map((tag) => tag.trim())
    .filter(Boolean);

  const channel = branchChannel(branch);
  const missing: string[] = [];

  for (const tag of tags) {
    const parsed = parseTag(tag, prefix, suffix);
    if (!parsed || !branchAcceptsVersion(branch, parsed)) {
      continue;
    }

    const author = git(options.cwd, [
      'log',
      '-1',
      '--format=%an',
      `${tag}^{commit}`,
    ]).stdout.trim();
    if (author !== BOT_NAME) {
      continue;
    }

    if (!hasNote(options.cwd, tag)) {
      missing.push(tag);
    }
  }

  if (missing.length === 0) {
    console.log(`Release notes already reconciled for '${ref}'.`);
    return 0;
  }

  if (options.dryRun) {
    for (const tag of missing) {
      console.log(
        `::notice::Would backfill ${NOTE_NAMESPACE}-${tag} with ${JSON.stringify({ channels: [channel] })}.`,
      );
    }
    console.log(`Dry run: ${missing.length} note(s) would be written.`);
    return 0;
  }

  for (const tag of missing) {
    writeNote(options.cwd, tag, channel);
    console.log(
      `::warning::Backfilled missing release channel note for ${tag}.`,
    );
  }
  pushNotes(options.cwd, options.remote, missing, channel);
  writeSummary(
    missing.map((tag) => `${tag}: ${JSON.stringify({ channels: [channel] })}`),
  );

  console.log(`Reconciled ${missing.length} release note(s) for '${ref}'.`);
  return 0;
}

if (import.meta.main) {
  try {
    const options = parseArgs(process.argv.slice(2));
    process.exitCode = reconcile(options);
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.log(`::error::${message}`);
    process.exitCode = 1;
  }
}
