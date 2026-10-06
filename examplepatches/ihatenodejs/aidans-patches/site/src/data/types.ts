export type ApkFileType = 'APK' | 'APKM' | 'XAPK';

export interface AppTarget {
  version: string;
  versionCodes?: Record<string, number> | null;
  isExperimental: boolean;
  minSdk?: number | null;
  description?: string | null;
}

export interface App {
  id: string; // Slugified identifier, e.g. "aftership", "sezzle"
  name: string;
  packageName: string;
  apkFileType: ApkFileType;
  appIconColor: string; // Normalized 6-char hex, e.g. "#FD5B26"
  targets: AppTarget[];
  supportedVersions: string[];
  latestSupportedVersion: string;
  minSdk: number | null;
  signatures: string[] | null;
  patchCount: number;
  playStoreUrl: string;
  docsUrl: string;
  category?: string | null;
  iconUrl?: string | null;
}

export type OptionType = 'boolean' | 'string' | 'color';

export interface PatchOption {
  key: string;
  title: string;
  description: string;
  required: boolean;
  type: OptionType;
  default: string | number | boolean;
  values: string[] | null;
}

export interface Patch {
  id: string; // Unique slug for anchors
  name: string;
  description: string;
  default: boolean;
  category: string | null;
  dependencies: string[]; // Human-readable patch names
  compatibleAppIds: string[];
  compatiblePackages: {
    packageName: string;
    name: string;
    appIconColor?: string | null;
    apkFileType?: string | null;
  }[];
  options: PatchOption[];
  sourceUrl: string;
}

export type FreshnessStatus =
  | 'up-to-date'
  | 'newer-available'
  | 'check-failed'
  | 'not-on-play-store'
  | 'unknown';

export interface AppVersionStatus {
  packageName: string;
  appName: string;
  appId: string;
  appIconColor: string;
  supportedVersions: string[];
  latestSupportedVersion: string;
  playVersion: string | null;
  checkedAt: string | null;
  updatedAt?: string | null;
  updatedOn?: string | null;
  status: FreshnessStatus;
  playStoreUrl: string;
  iconUrl?: string | null;
}

export interface ReleaseChangeItem {
  type: 'feat' | 'fix' | 'bump' | 'perf' | 'other';
  scope: string | null;
  description: string;
  hash: string | null;
  commitUrl: string | null;
  appId?: string | null;
  appName?: string | null;
  appIconUrl?: string | null;
}

export interface ReleaseInfo {
  version: string;
  releaseDate: string;
  downloadUrl: string;
  rawChangelog: string;
  recentChanges: ReleaseChangeItem[];
}

export interface RepositoryStats {
  supportedAppsCount: number;
  totalPatchesCount: number;
  bundleVersion: string;
  releaseDate: string;
}
