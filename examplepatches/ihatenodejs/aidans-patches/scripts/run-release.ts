#!/usr/bin/env bun
import { spawnSync } from 'node:child_process';
import * as fs from 'node:fs';
import * as path from 'node:path';
import { extractReleaseVersion } from './release-retry';

/**
 * Run the repository-locked semantic-release executable.
 *
 * The previous action installed its own semantic-release and fetched
 * `@semantic-release/github@latest`. This wrapper uses the dependency tree
 * installed by `npm ci`, so verification and publication share one pinned
 * graph. It preserves the workflow outputs downstream jobs consume:
 * `new_release_published` and `new_release_git_tag`.
 */

export interface ReleaseOutcome {
  published: boolean;
  version: string | null;
  gitTag: string | null;
}

const ANSI_PATTERN = new RegExp(`${String.fromCharCode(27)}\\[[0-9;]*m`, 'g');

export function parseReleaseLog(output: string): ReleaseOutcome {
  const plain = output.replace(ANSI_PATTERN, '');
  const tags = [...plain.matchAll(/Created tag (\S+)/g)];
  const published = tags.length > 0;
  const version = published ? extractReleaseVersion(plain) : null;
  return {
    published,
    version,
    gitTag: published ? (tags[tags.length - 1][1] ?? null) : null,
  };
}

function writeOutput(name: string, value: string): void {
  const outputPath = process.env.GITHUB_OUTPUT;
  if (!outputPath) {
    return;
  }
  fs.appendFileSync(outputPath, `${name}=${value}\n`);
}

export function runRelease(cwd: string, args: string[]): number {
  const executable = path.join(cwd, 'node_modules', '.bin', 'semantic-release');
  if (!fs.existsSync(executable)) {
    throw new Error(
      `missing locked semantic-release at ${executable}; run npm ci first`,
    );
  }

  const mavenToken = process.env.RELEASE_MAVEN_TOKEN;
  if (!mavenToken) {
    throw new Error('missing RELEASE_MAVEN_TOKEN for Gradle package access');
  }

  const result = spawnSync(executable, args, {
    cwd,
    encoding: 'utf8',
    stdio: ['inherit', 'pipe', 'pipe'],
    maxBuffer: 128 * 1024 * 1024,
    env: process.env,
  });

  if (result.error) {
    throw new Error(`cannot run semantic-release: ${result.error.message}`);
  }

  process.stdout.write(result.stdout ?? '');
  process.stderr.write(result.stderr ?? '');

  const outcome = parseReleaseLog(
    `${result.stdout ?? ''}\n${result.stderr ?? ''}`,
  );
  writeOutput('new_release_published', String(outcome.published));
  if (outcome.version) {
    writeOutput('new_release_version', outcome.version);
  }
  if (outcome.gitTag) {
    writeOutput('new_release_git_tag', outcome.gitTag);
  }

  return result.status ?? 1;
}

if (import.meta.main) {
  try {
    process.exitCode = runRelease(process.cwd(), process.argv.slice(2));
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error(`::error::${message}`);
    process.exitCode = 1;
  }
}
