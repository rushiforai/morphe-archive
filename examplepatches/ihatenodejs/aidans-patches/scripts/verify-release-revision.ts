#!/usr/bin/env bun
import { spawnSync } from 'node:child_process';

/**
 * Fail when the branch tip no longer matches the revision the verify job
 * checked out.
 *
 * Verification and publication must use the same source SHA. The release job
 * checks out the triggering SHA; this guard refuses to start when the remote
 * branch has moved since then. It is intentionally a pure comparison of the
 * local HEAD and the remote ref: no fetch updates the working tree, and no
 * step fast-forwards a newer tree into the release job.
 *
 * The guard cannot close the race between its own read and publication. The
 * release branches are protected so only the release identity may update
 * them, and the Release workflow serializes runs for the same ref with a
 * concurrency group. This guard rejects movement that already happened
 * before publication; it does not hold a lock itself.
 */

const USAGE = `Usage: bun scripts/verify-release-revision.ts --branch <name> --sha <sha> [options]

Options:
  --branch <name>     Branch to compare (required)
  --sha <sha>         Verified commit SHA (required)
  --remote <name>     Git remote (default: origin)
  --cwd <path>        Repository root (default: process.cwd())
  --help              Show this message`;

class RevisionError extends Error {}

export interface Options {
  branch: string;
  sha: string;
  remote: string;
  cwd: string;
}

interface GitResult {
  status: number;
  stdout: string;
  stderr: string;
}

function parseArgs(argv: string[]): Options {
  const options: Partial<Options> = {
    remote: 'origin',
    cwd: process.cwd(),
  };

  let index = 0;
  const nextValue = (flag: string): string => {
    const value = argv[++index];
    if (value === undefined || value.startsWith('--')) {
      throw new RevisionError(`${flag} requires a value\n\n${USAGE}`);
    }
    return value;
  };

  for (; index < argv.length; index += 1) {
    switch (argv[index]) {
      case '--branch':
        options.branch = nextValue('--branch');
        break;
      case '--sha':
        options.sha = nextValue('--sha');
        break;
      case '--remote':
        options.remote = nextValue('--remote');
        break;
      case '--cwd':
        options.cwd = nextValue('--cwd');
        break;
      case '--help':
        console.log(USAGE);
        process.exit(0);
        break;
      default:
        throw new RevisionError(`Unknown argument: ${argv[index]}\n\n${USAGE}`);
    }
  }

  for (const [name, value] of [
    ['--branch', options.branch],
    ['--sha', options.sha],
  ] as const) {
    if (!value) {
      throw new RevisionError(`${name} is required\n\n${USAGE}`);
    }
  }

  return {
    branch: options.branch!,
    sha: options.sha!,
    remote: options.remote!,
    cwd: options.cwd!,
  };
}

function git(args: string[], cwd: string): GitResult {
  const result = spawnSync('git', args, {
    cwd,
    encoding: 'utf8',
    stdio: ['ignore', 'pipe', 'pipe'],
  });

  if (result.error) {
    throw new RevisionError(`cannot run git: ${result.error.message}`);
  }

  return {
    status: result.status ?? 1,
    stdout: result.stdout ?? '',
    stderr: result.stderr ?? '',
  };
}

export function readHeadSha(cwd: string): string {
  const result = git(['rev-parse', 'HEAD'], cwd);
  if (result.status !== 0) {
    throw new RevisionError(
      `cannot read HEAD: ${(result.stderr || result.stdout).trim()}`,
    );
  }
  return result.stdout.trim();
}

export function readRemoteBranchSha(
  remote: string,
  branch: string,
  cwd: string,
): string | null {
  const result = git(['ls-remote', remote, `refs/heads/${branch}`], cwd);
  if (result.status !== 0) {
    throw new RevisionError(
      `cannot read ${branch} from ${remote}: ${(result.stderr || result.stdout).trim()}`,
    );
  }

  const line = result.stdout.trim().split('\n')[0];
  return line ? line.split('\t')[0] : null;
}

export interface RevisionCheck {
  ok: boolean;
  headSha: string;
  remoteSha: string | null;
  reason: string;
}

export function checkReleaseRevision(options: Options): RevisionCheck {
  const headSha = readHeadSha(options.cwd);
  if (headSha !== options.sha) {
    return {
      ok: false,
      headSha,
      remoteSha: null,
      reason: `checked-out HEAD ${headSha} is not the verified revision ${options.sha}`,
    };
  }

  const remoteSha = readRemoteBranchSha(
    options.remote,
    options.branch,
    options.cwd,
  );
  if (remoteSha === null) {
    return {
      ok: false,
      headSha,
      remoteSha,
      reason: `remote branch ${options.branch} does not exist`,
    };
  }

  if (remoteSha !== options.sha) {
    return {
      ok: false,
      headSha,
      remoteSha,
      reason: `remote branch ${options.branch} moved to ${remoteSha} after ${options.sha} was verified; a new run must verify the new tip`,
    };
  }

  return {
    ok: true,
    headSha,
    remoteSha,
    reason: `remote branch ${options.branch} still points at verified revision ${options.sha}`,
  };
}

if (import.meta.main) {
  try {
    const check = checkReleaseRevision(parseArgs(process.argv.slice(2)));
    if (!check.ok) {
      console.error(`::error::${check.reason}`);
      process.exitCode = 1;
    } else {
      console.log(check.reason);
    }
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error(`::error::${message}`);
    process.exitCode = 1;
  }
}
