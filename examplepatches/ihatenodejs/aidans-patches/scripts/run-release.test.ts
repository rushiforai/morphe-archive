import { afterEach, beforeEach, describe, expect, test } from 'bun:test';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';
import { parseReleaseLog, runRelease } from './run-release';

const PUBLISHED = `
[4:09:43 AM] [semantic-release] › ℹ  The next release version is 1.10.0-dev.13
[4:10:00 AM] [semantic-release] › ✔  Created tag v1.10.0-dev.13
[4:10:02 AM] [semantic-release] › ✔  Published release 1.10.0-dev.13 on dev channel
`;

describe('parseReleaseLog', () => {
  test('reports a published release and its tag', () => {
    expect(parseReleaseLog(PUBLISHED)).toEqual({
      published: true,
      version: '1.10.0-dev.13',
      gitTag: 'v1.10.0-dev.13',
    });
  });

  test('reports no publication when semantic-release skips a release', () => {
    const log = `
[4:09:43 AM] [semantic-release] › ℹ  There is no new version to be released.
`;
    expect(parseReleaseLog(log)).toEqual({
      published: false,
      version: null,
      gitTag: null,
    });
  });

  test('strips ANSI color codes and keeps the last created tag', () => {
    const log =
      '\u001b[1mCreated tag v1.0.0\u001b[0m\n\u001b[1mCreated tag v1.0.1\u001b[0m\n';
    expect(parseReleaseLog(log).gitTag).toBe('v1.0.1');
  });
});

describe('runRelease', () => {
  let previousMavenToken: string | undefined;

  beforeEach(() => {
    previousMavenToken = process.env.RELEASE_MAVEN_TOKEN;
    process.env.RELEASE_MAVEN_TOKEN = 'test-package-token';
  });

  afterEach(() => {
    if (previousMavenToken === undefined) {
      delete process.env.RELEASE_MAVEN_TOKEN;
    } else {
      process.env.RELEASE_MAVEN_TOKEN = previousMavenToken;
    }
  });

  test('fails before invoking anything when the locked executable is absent', () => {
    const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'run-release-missing-'));
    try {
      expect(() => runRelease(dir, [])).toThrow(
        'missing locked semantic-release',
      );
    } finally {
      fs.rmSync(dir, { recursive: true, force: true });
    }
  });

  test('runs the local executable and writes the workflow outputs', () => {
    const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'run-release-'));
    const binDir = path.join(dir, 'node_modules', '.bin');
    const outputPath = path.join(dir, 'github-output');
    fs.mkdirSync(binDir, { recursive: true });
    fs.writeFileSync(
      path.join(binDir, 'semantic-release'),
      `#!/bin/sh\nprintf '%s\\n' 'The next release version is 1.2.3' 'Created tag v1.2.3'\n`,
    );
    fs.chmodSync(path.join(binDir, 'semantic-release'), 0o755);

    const previous = process.env.GITHUB_OUTPUT;
    process.env.GITHUB_OUTPUT = outputPath;
    try {
      const status = runRelease(dir, []);
      expect(status).toBe(0);
      expect(fs.readFileSync(outputPath, 'utf8')).toBe(
        'new_release_published=true\nnew_release_version=1.2.3\nnew_release_git_tag=v1.2.3\n',
      );
    } finally {
      if (previous === undefined) {
        delete process.env.GITHUB_OUTPUT;
      } else {
        process.env.GITHUB_OUTPUT = previous;
      }
      fs.rmSync(dir, { recursive: true, force: true });
    }
  });

  test('passes separate release and Gradle package credentials', () => {
    const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'run-release-auth-'));
    const binDir = path.join(dir, 'node_modules', '.bin');
    const capture = path.join(dir, 'environment');
    const keys = ['GITHUB_TOKEN', 'GITHUB_OUTPUT', 'RELEASE_ENV_CAPTURE'];
    const previous = new Map(keys.map((key) => [key, process.env[key]]));
    fs.mkdirSync(binDir, { recursive: true });
    fs.writeFileSync(
      path.join(binDir, 'semantic-release'),
      '#!/bin/sh\n/bin/sh -c \'printf "%s\\n" "$GITHUB_TOKEN" "$RELEASE_MAVEN_TOKEN" > "$RELEASE_ENV_CAPTURE"\'\n',
    );
    fs.chmodSync(path.join(binDir, 'semantic-release'), 0o755);
    process.env.GITHUB_TOKEN = 'test-app-token';
    process.env.RELEASE_ENV_CAPTURE = capture;
    delete process.env.GITHUB_OUTPUT;
    try {
      expect(runRelease(dir, [])).toBe(0);
      expect(fs.readFileSync(capture, 'utf8')).toBe(
        'test-app-token\ntest-package-token\n',
      );
    } finally {
      for (const [key, value] of previous) {
        if (value === undefined) delete process.env[key];
        else process.env[key] = value;
      }
      fs.rmSync(dir, { recursive: true, force: true });
    }
  });

  test('fails before publication when the package token is missing', () => {
    const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'run-release-token-'));
    const binDir = path.join(dir, 'node_modules', '.bin');
    const marker = path.join(dir, 'invoked');
    const previousMarker = process.env.RELEASE_MARKER;
    const previousOutput = process.env.GITHUB_OUTPUT;
    fs.mkdirSync(binDir, { recursive: true });
    fs.writeFileSync(
      path.join(binDir, 'semantic-release'),
      '#!/bin/sh\ntouch "$RELEASE_MARKER"\n',
    );
    fs.chmodSync(path.join(binDir, 'semantic-release'), 0o755);
    delete process.env.RELEASE_MAVEN_TOKEN;
    delete process.env.GITHUB_OUTPUT;
    process.env.RELEASE_MARKER = marker;
    try {
      expect(() => runRelease(dir, [])).toThrow('missing RELEASE_MAVEN_TOKEN');
      expect(fs.existsSync(marker)).toBe(false);
    } finally {
      if (previousMarker === undefined) delete process.env.RELEASE_MARKER;
      else process.env.RELEASE_MARKER = previousMarker;
      if (previousOutput === undefined) delete process.env.GITHUB_OUTPUT;
      else process.env.GITHUB_OUTPUT = previousOutput;
      fs.rmSync(dir, { recursive: true, force: true });
    }
  });

  test('propagates the semantic-release exit status', () => {
    const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'run-release-fail-'));
    const binDir = path.join(dir, 'node_modules', '.bin');
    fs.mkdirSync(binDir, { recursive: true });
    fs.writeFileSync(
      path.join(binDir, 'semantic-release'),
      '#!/bin/sh\necho "release failed" >&2\nexit 7\n',
    );
    fs.chmodSync(path.join(binDir, 'semantic-release'), 0o755);

    const previous = process.env.GITHUB_OUTPUT;
    delete process.env.GITHUB_OUTPUT;
    try {
      expect(runRelease(dir, [])).toBe(7);
    } finally {
      if (previous !== undefined) {
        process.env.GITHUB_OUTPUT = previous;
      }
      fs.rmSync(dir, { recursive: true, force: true });
    }
  });
});
