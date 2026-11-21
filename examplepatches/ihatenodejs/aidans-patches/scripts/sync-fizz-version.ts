#!/usr/bin/env bun
import { readFileSync, writeFileSync } from 'node:fs';
import { resolve } from 'node:path';

const VERSION_BRIDGE_PATH = resolve(
  import.meta.dir,
  '../extensions/extension/src/main/java/app/aidan/extension/fizz/VersionBridge.java',
);

interface VersionResponse {
  packageName?: string;
  versionName?: string;
  versionCode?: number | string;
  updatedAt?: string;
}

interface StatusResponse {
  apps?: {
    [key: string]: {
      playVersion?: string | null;
      playVersionCode?: number | null;
    };
  };
}

interface FizzVersion {
  versionName: string;
  versionCode: string | null;
}

function normalizeVersionCode(
  value: number | string | null | undefined,
): string | null {
  return value != null && String(value).trim() !== ''
    ? String(value).trim()
    : null;
}

async function fetchStatusFizzVersion(): Promise<FizzVersion> {
  const statusBase =
    process.env.WORKER_STATUS_URL || 'https://worker.patch.p0ntus.com';
  const statusUrl = `${statusBase.replace(/\/$/, '')}/api/status`;
  const statusRes = await fetch(statusUrl, {
    headers: { 'User-Agent': 'aidans-patches-sync' },
    signal: AbortSignal.timeout(10_000),
  });
  if (!statusRes.ok) {
    throw new Error(
      `Failed to fetch version from both /api/version and /api/status (${statusRes.status})`,
    );
  }

  const statusData = (await statusRes.json()) as StatusResponse;
  const fizzRecord = statusData.apps?.['com.ashtoncofer.Buzz'];
  if (!fizzRecord?.playVersion) {
    throw new Error(
      'Play version for com.ashtoncofer.Buzz not found in status payload',
    );
  }

  return {
    versionName: fizzRecord.playVersion.trim(),
    versionCode: normalizeVersionCode(fizzRecord.playVersionCode),
  };
}

async function fetchLatestFizzVersion(): Promise<FizzVersion> {
  const versionUrl =
    process.env.WORKER_VERSION_URL ||
    'https://worker.patch.p0ntus.com/api/version/com.ashtoncofer.Buzz';

  let direct: FizzVersion | null = null;
  try {
    const res = await fetch(versionUrl, {
      headers: { 'User-Agent': 'aidans-patches-sync' },
      signal: AbortSignal.timeout(10_000),
    });
    if (res.ok) {
      const data = (await res.json()) as VersionResponse;
      if (data.versionName) {
        direct = {
          versionName: data.versionName.trim(),
          versionCode: normalizeVersionCode(data.versionCode),
        };
        if (direct.versionCode != null) {
          return direct;
        }
      }
    }
  } catch (err) {
    console.warn(`Direct version endpoint fetch failed (${versionUrl}):`, err);
  }

  // /api/version can omit versionCode when Play metadata lacks it. Try
  // /api/status for the build number while keeping the direct version name.
  try {
    const status = await fetchStatusFizzVersion();
    if (!direct) {
      return status;
    }
    if (status.versionName !== direct.versionName) {
      console.warn(
        `Status version ${status.versionName} differs from direct version ${direct.versionName}; keeping the direct version.`,
      );
      return direct;
    }
    return {
      versionName: direct.versionName,
      versionCode: status.versionCode,
    };
  } catch (err) {
    if (direct) {
      console.warn('Status endpoint did not provide a Fizz version code:', err);
      return direct;
    }
    throw err;
  }
}

export async function syncFizzVersion(
  options: { checkOnly?: boolean } = {},
): Promise<boolean> {
  const fileContent = readFileSync(VERSION_BRIDGE_PATH, 'utf-8');

  const versionMatch = fileContent.match(
    /public static final String DEFAULT_VERSION = "([^"]+)";/,
  );
  const buildMatch = fileContent.match(
    /public static final String DEFAULT_BUILD_NUMBER = "([^"]+)";/,
  );

  if (!versionMatch) {
    throw new Error(
      `DEFAULT_VERSION constant not found in ${VERSION_BRIDGE_PATH}`,
    );
  }

  const currentVersion = versionMatch[1];
  const currentBuild = buildMatch ? buildMatch[1] : '';

  console.log(
    `Current VersionBridge seed: ${currentVersion} (build ${currentBuild})`,
  );

  let latest: { versionName: string; versionCode: string | null };
  try {
    latest = await fetchLatestFizzVersion();
  } catch (err) {
    if (options.checkOnly) {
      throw err;
    }
    console.warn(
      `Could not fetch live version from worker: ${err instanceof Error ? err.message : String(err)}`,
    );
    return false;
  }

  const VERSION_REGEX = /^[0-9]+(\.[0-9]+)+$/;
  const BUILD_REGEX = /^[0-9]+$/;
  if (!VERSION_REGEX.test(latest.versionName)) {
    throw new Error(
      `Invalid versionName received from upstream: ${latest.versionName}`,
    );
  }
  if (latest.versionCode != null && !BUILD_REGEX.test(latest.versionCode)) {
    throw new Error(
      `Invalid versionCode received from upstream: ${latest.versionCode}`,
    );
  }

  console.log(
    `Live version from worker: ${latest.versionName} (build ${latest.versionCode ?? 'unknown'})`,
  );

  const needsVersionUpdate = latest.versionName !== currentVersion;
  const needsBuildUpdate =
    latest.versionCode != null && latest.versionCode !== currentBuild;

  if (!needsVersionUpdate && !needsBuildUpdate) {
    console.log(`Fizz version seed is up to date (${currentVersion}).`);
    return false;
  }

  if (options.checkOnly) {
    console.warn(
      `Seed mismatch detected: local=${currentVersion} (build ${currentBuild}), remote=${latest.versionName} (build ${latest.versionCode ?? 'unknown'})`,
    );
    return true;
  }

  let updatedContent = fileContent;
  if (needsVersionUpdate) {
    updatedContent = updatedContent.replace(
      /public static final String DEFAULT_VERSION = "([^"]+)";/,
      `public static final String DEFAULT_VERSION = "${latest.versionName}";`,
    );
  }

  if (needsBuildUpdate && latest.versionCode != null) {
    updatedContent = updatedContent.replace(
      /public static final String DEFAULT_BUILD_NUMBER = "([^"]+)";/,
      `public static final String DEFAULT_BUILD_NUMBER = "${latest.versionCode}";`,
    );
  }

  writeFileSync(VERSION_BRIDGE_PATH, updatedContent, 'utf-8');
  console.log(
    `Updated ${VERSION_BRIDGE_PATH}:\n  Version: ${currentVersion} -> ${latest.versionName}\n  Build: ${currentBuild} -> ${latest.versionCode ?? currentBuild}`,
  );
  return true;
}

if (import.meta.main) {
  if (process.argv.includes('--help') || process.argv.includes('-h')) {
    console.log('Usage: bun scripts/sync-fizz-version.ts [--check]');
    process.exit(0);
  }
  const checkOnly = process.argv.includes('--check');
  try {
    const hasChanges = await syncFizzVersion({ checkOnly });
    if (checkOnly && hasChanges) {
      process.exit(1);
    }
  } catch (err) {
    console.error('Failed to sync Fizz version:', err);
    process.exit(1);
  }
}
