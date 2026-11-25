#!/usr/bin/env bun
import { spawnSync } from 'node:child_process';
import * as fs from 'node:fs';
import * as path from 'node:path';

/**
 * Retry a Release run whose prepare push failed before tagging.
 *
 * `@semantic-release/git@11` pushes the release commit during `prepare`.
 * Release branches are protected so only the release identity may update
 * them, and the Release workflow serializes runs for the same ref with a
 * concurrency group. The prepare push can still lose a race against another
 * allowed write (for example a merge that landed first); it is then rejected
 * as non-fast-forward and the run fails before any tag or note is created.
 * This script decides whether re-running only the failed release job is safe:
 *
 *   - the run logged a next release version
 *   - the failing push came from `@semantic-release/git` and was rejected
 *   - no "Created tag" line was reached
 *   - the tag does not exist on the remote
 *   - the remote branch tip still equals the run's verified head SHA
 *
 * The last condition is mandatory because the retry reuses the successful
 * verify job. A moved or force-pushed branch needs a fresh run that verifies
 * the new tip, even when the old head is an ancestor. Anything else is left
 * for a human.
 */

const USAGE = `Usage: bun scripts/release-retry.ts --run-id <id> --repo <owner/repo> \\
  --branch <name> --head-sha <sha> [options]

Options:
  --run-id <id>       Failed Release run to classify (required)
  --repo <slug>       GitHub repository, e.g. owner/repo (required)
  --branch <name>     Branch the failed run targeted (required)
  --head-sha <sha>    Head SHA of the failed run (required)
  --log-file <path>   Read failed logs from a file instead of the GitHub API
  --cwd <path>        Repository root (default: process.cwd())
  --dry-run           Print the decision without re-running anything
  --help              Show this message`;

const ANSI_PATTERN = new RegExp(`${String.fromCharCode(27)}\\[[0-9;]*m`, 'g');

class RetryError extends Error {}

export interface Options {
  runId: string;
  repo: string;
  branch: string;
  headSha: string;
  logFile?: string;
  cwd: string;
  dryRun: boolean;
}

interface Classification {
  retry: boolean;
  version: string | null;
  reason: string;
}

export interface GhResult {
  status: number;
  stdout: string;
  stderr: string;
}

function parseArgs(argv: string[]): Options {
  const options: Partial<Options> = {
    cwd: process.cwd(),
    dryRun: false,
  };

  let index = 0;
  const nextValue = (flag: string): string => {
    const value = argv[++index];
    if (value === undefined || value.startsWith('--')) {
      throw new RetryError(`${flag} requires a value\n\n${USAGE}`);
    }
    return value;
  };

  for (; index < argv.length; index += 1) {
    switch (argv[index]) {
      case '--run-id':
        options.runId = nextValue('--run-id');
        break;
      case '--repo':
        options.repo = nextValue('--repo');
        break;
      case '--branch':
        options.branch = nextValue('--branch');
        break;
      case '--head-sha':
        options.headSha = nextValue('--head-sha');
        break;
      case '--log-file':
        options.logFile = nextValue('--log-file');
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
        throw new RetryError(`Unknown argument: ${argv[index]}\n\n${USAGE}`);
    }
  }

  for (const [name, value] of [
    ['--run-id', options.runId],
    ['--repo', options.repo],
    ['--branch', options.branch],
    ['--head-sha', options.headSha],
  ] as const) {
    if (!value) {
      throw new RetryError(`${name} is required\n\n${USAGE}`);
    }
  }

  return {
    runId: options.runId!,
    repo: options.repo!,
    branch: options.branch!,
    headSha: options.headSha!,
    logFile: options.logFile,
    cwd: path.resolve(options.cwd!),
    dryRun: options.dryRun!,
  };
}

function gh(args: string[], cwd: string): GhResult {
  const result = spawnSync('gh', args, {
    cwd,
    encoding: 'utf8',
    stdio: ['ignore', 'pipe', 'pipe'],
    maxBuffer: 64 * 1024 * 1024,
    env: process.env,
  });

  if (result.error) {
    throw new RetryError(`cannot run gh: ${result.error.message}`);
  }

  return {
    status: result.status ?? 1,
    stdout: result.stdout ?? '',
    stderr: result.stderr ?? '',
  };
}

export function extractReleaseVersion(log: string): string | null {
  const plain = log.replace(ANSI_PATTERN, '');
  const matches = [...plain.matchAll(/The next release version is (\S+)/g)];
  return matches.length > 0 ? matches[matches.length - 1][1] : null;
}

export function classifyReleaseFailure(
  log: string,
  state: { tagExists: boolean; branchMoved: boolean },
): Classification {
  const version = extractReleaseVersion(log);
  if (!version) {
    return {
      retry: false,
      version,
      reason: 'the run never logged a next release version',
    };
  }

  const plain = log.replace(ANSI_PATTERN, '');
  const preparePushRejected =
    /@semantic-release\/git\/lib\/git\.js/.test(plain) &&
    /! \[rejected\].*\((?:fetch first|non-fast-forward)\)/m.test(plain);
  if (!preparePushRejected) {
    return {
      retry: false,
      version,
      reason: 'the failure was not a rejected semantic-release prepare push',
    };
  }

  if (/Created tag\s/m.test(plain)) {
    return {
      retry: false,
      version,
      reason: 'the tag was created before the failure',
    };
  }

  if (state.tagExists) {
    return {
      retry: false,
      version,
      reason: `tag v${version} already exists on the remote`,
    };
  }

  if (state.branchMoved) {
    return {
      retry: false,
      version,
      reason:
        'the branch tip moved after the failed run; a fresh run must verify the new tip',
    };
  }

  return {
    retry: true,
    version,
    reason:
      'prepare push failed while the branch tip still matches the verified run',
  };
}

function readTagFormat(cwd: string): string {
  const configPath = path.join(cwd, '.releaserc');
  if (!fs.existsSync(configPath)) {
    throw new RetryError(`missing release config: ${configPath}`);
  }
  const parsed = Bun.YAML.parse(fs.readFileSync(configPath, 'utf8')) as {
    tagFormat?: string;
  };
  return parsed.tagFormat ?? 'v${version}';
}

function writeSummary(lines: string[]): void {
  const summaryPath = process.env.GITHUB_STEP_SUMMARY;
  if (!summaryPath || lines.length === 0) {
    return;
  }
  fs.appendFileSync(
    summaryPath,
    `### Release retry\n\n${lines.join('\n')}\n\n`,
  );
}

export interface RetryDependencies {
  gh: (args: string[], cwd: string) => GhResult;
  appendSummary: (lines: string[]) => void;
  readTextFile: (filePath: string) => string;
}

export interface RetryOutcome {
  status: 'skipped' | 'retry' | 'dry-run';
  version: string | null;
  reason: string;
}

function skipped(reason: string, version: string | null = null): RetryOutcome {
  console.log(`::notice::Not retrying: ${reason}.`);
  return { status: 'skipped', version, reason };
}

export function decideReleaseRetry(
  options: Options,
  overrides: Partial<RetryDependencies> = {},
): RetryOutcome {
  const runGh = overrides.gh ?? gh;
  const appendSummary = overrides.appendSummary ?? writeSummary;
  const readTextFile =
    overrides.readTextFile ??
    ((filePath: string) => fs.readFileSync(filePath, 'utf8'));

  let log: string;
  if (options.logFile) {
    log = readTextFile(path.resolve(options.cwd, options.logFile));
  } else {
    const result = runGh(
      ['run', 'view', options.runId, '--log-failed', '--repo', options.repo],
      options.cwd,
    );
    if (result.status !== 0) {
      return skipped(`cannot read failed logs for run ${options.runId}`);
    }
    log = result.stdout;
  }

  const version = extractReleaseVersion(log);
  if (version === null) {
    return skipped('no next release version in the failed logs');
  }

  const tag = readTagFormat(options.cwd).replace('${version}', version);

  const tagRef = runGh(
    [
      'api',
      `repos/${options.repo}/git/ref/tags/${encodeURIComponent(tag)}`,
      '--silent',
    ],
    options.cwd,
  );
  let tagExists: boolean;
  if (tagRef.status === 0) {
    tagExists = true;
  } else if (/404|Not Found/i.test(tagRef.stderr)) {
    tagExists = false;
  } else {
    return skipped(
      `cannot verify whether ${tag} exists; ${tagRef.stderr.trim()}`,
      version,
    );
  }

  const branchRef = runGh(
    [
      'api',
      `repos/${options.repo}/git/ref/heads/${encodeURIComponent(options.branch)}`,
      '--jq',
      '.object.sha',
    ],
    options.cwd,
  );
  if (branchRef.status !== 0) {
    return skipped(
      `cannot read ${options.branch}; ${branchRef.stderr.trim()}`,
      version,
    );
  }

  // A retry reuses the successful verify job. It is only safe while the
  // remote branch tip is exactly the revision that job verified. Do not
  // compare ancestry: an advanced branch still needs a fresh verification.
  const branchMoved = branchRef.stdout.trim() !== options.headSha;
  const decision = classifyReleaseFailure(log, { tagExists, branchMoved });
  appendSummary([
    `- Run: [${options.runId}](https://github.com/${options.repo}/actions/runs/${options.runId})`,
    `- Version: ${decision.version ?? 'unknown'}`,
    `- Decision: ${decision.retry ? 'retry' : 'leave for review'} (${decision.reason})`,
  ]);

  if (!decision.retry) {
    return skipped(decision.reason, decision.version);
  }

  if (options.dryRun) {
    console.log(
      `::notice::Would re-run failed jobs for ${options.runId} (${decision.reason}).`,
    );
    return {
      status: 'dry-run',
      version: decision.version,
      reason: decision.reason,
    };
  }

  const rerun = runGh(
    ['run', 'rerun', options.runId, '--failed', '--repo', options.repo],
    options.cwd,
  );
  if (rerun.status !== 0) {
    throw new RetryError(
      `cannot re-run ${options.runId}: ${(rerun.stderr || rerun.stdout).trim()}`,
    );
  }

  console.log(
    `::warning::Re-ran failed jobs for ${options.runId}: ${decision.reason}.`,
  );
  return {
    status: 'retry',
    version: decision.version,
    reason: decision.reason,
  };
}

if (import.meta.main) {
  try {
    decideReleaseRetry(parseArgs(process.argv.slice(2)));
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.log(`::error::${message}`);
    process.exitCode = 1;
  }
}
