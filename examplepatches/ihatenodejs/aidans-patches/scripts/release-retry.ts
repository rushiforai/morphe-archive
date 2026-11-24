#!/usr/bin/env bun
import { spawnSync } from 'node:child_process';
import * as fs from 'node:fs';
import * as path from 'node:path';

/**
 * Retry a Release run that was superseded while it was building.
 *
 * `@semantic-release/git@11` pushes the release commit during `prepare`. If
 * another push lands in that window, the push is rejected as non-fast-forward
 * and the run fails before any tag or note is created. That failure is safe to
 * retry, but only when the remote proves no release was recorded:
 *
 *   - the run logged a next release version
 *   - the failing push came from `@semantic-release/git` and was rejected
 *   - no "Created tag" line was reached
 *   - the tag does not exist on the remote
 *   - the branch moved forward from the run's head
 *
 * Anything else is left for a human. The retry is the same run, so GitHub
 * reuses the successful verify job and only re-runs the failed release job.
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

interface Options {
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

interface GhResult {
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

  if (!state.branchMoved) {
    return {
      retry: false,
      version,
      reason: 'the branch has not moved since the failed run',
    };
  }

  return {
    retry: true,
    version,
    reason: 'prepare push was superseded before any tag was created',
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

function decide(options: Options): void {
  const log = options.logFile
    ? fs.readFileSync(path.resolve(options.cwd, options.logFile), 'utf8')
    : (() => {
        const result = gh(
          [
            'run',
            'view',
            options.runId,
            '--log-failed',
            '--repo',
            options.repo,
          ],
          options.cwd,
        );
        if (result.status !== 0) {
          console.log(
            `::notice::Cannot read failed logs for run ${options.runId}; not retrying.`,
          );
          return null;
        }
        return result.stdout;
      })();

  if (log === null) {
    return;
  }

  const version = extractReleaseVersion(log);
  if (version === null) {
    console.log(
      '::notice::No next release version in the failed logs; not retrying.',
    );
    return;
  }

  const tag = readTagFormat(options.cwd).replace('${version}', version);

  const tagRef = gh(
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
    console.log(
      `::notice::Cannot verify whether ${tag} exists; not retrying. ${tagRef.stderr.trim()}`,
    );
    return;
  }

  const branchRef = gh(
    [
      'api',
      `repos/${options.repo}/git/ref/heads/${encodeURIComponent(options.branch)}`,
      '--jq',
      '.object.sha',
    ],
    options.cwd,
  );
  if (branchRef.status !== 0) {
    console.log(
      `::notice::Cannot read ${options.branch}; not retrying. ${branchRef.stderr.trim()}`,
    );
    return;
  }

  const branchMoved = branchRef.stdout.trim() !== options.headSha;
  if (branchMoved) {
    const compare = gh(
      [
        'api',
        `repos/${options.repo}/compare/${encodeURIComponent(
          `${options.headSha}...${options.branch}`,
        )}`,
        '--jq',
        '.status',
      ],
      options.cwd,
    );
    if (
      compare.status !== 0 ||
      !/^(ahead|identical)$/.test(compare.stdout.trim())
    ) {
      console.log(
        `::notice::The failed run's head is not an ancestor of ${options.branch}; not retrying.`,
      );
      return;
    }
  }

  const decision = classifyReleaseFailure(log, { tagExists, branchMoved });
  writeSummary([
    `- Run: [${options.runId}](https://github.com/${options.repo}/actions/runs/${options.runId})`,
    `- Version: ${decision.version ?? 'unknown'}`,
    `- Decision: ${decision.retry ? 'retry' : 'leave for review'} (${decision.reason})`,
  ]);

  if (!decision.retry) {
    console.log(`::notice::Not retrying: ${decision.reason}.`);
    return;
  }

  if (options.dryRun) {
    console.log(
      `::notice::Would re-run failed jobs for ${options.runId} (${decision.reason}).`,
    );
    return;
  }

  const rerun = gh(
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
}

if (import.meta.main) {
  try {
    decide(parseArgs(process.argv.slice(2)));
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.log(`::error::${message}`);
    process.exitCode = 1;
  }
}
