export type FreshnessStatus =
  | 'up-to-date'
  | 'newer-available'
  | 'check-failed'
  | 'not-on-play-store'
  | 'unknown';

export interface AppVersionRecord {
  appName?: string;
  playVersion: string | null;
  iconUrl?: string | null;
  updatedAt?: string | null;
  updatedOn?: string | null;
  checkedAt: string;
  status: FreshnessStatus;
  supportedVersions: string[];
  latestSupportedVersion: string;
}

export interface LatestReleaseSummary {
  packageName: string;
  appName: string;
  playVersion: string | null;
  iconUrl: string | null;
  updatedAt: string | null;
  updatedOn: string | null;
}

export interface KVVersionPayload {
  updatedAt: string;
  apps: Record<string, AppVersionRecord>;
  latestRelease?: LatestReleaseSummary | null;
}

export interface Env {
  PLAY_VERSIONS_KV: KVNamespace;
  REFRESH_SECRET?: string;
}

export interface TargetAppConfig {
  packageName: string;
  name: string;
  latestSupportedVersion: string;
  supportedVersions: string[];
}
