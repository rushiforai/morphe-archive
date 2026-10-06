import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import type {
  App,
  AppTarget,
  ApkFileType,
  Patch,
  PatchOption,
  OptionType,
  RepositoryStats,
  ReleaseInfo,
  AppVersionStatus,
} from './types';
import { getPatchSourceUrl } from './source-links';
import { parseReleaseInfo } from './changelog';
import { getAppIconUrl } from './icons';
import { resolveAppForScope } from './commit-apps';

function slugify(text: string): string {
  return text
    .toLowerCase()
    .replace(/[^\w\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-+|-+$/g, '');
}

const BASELINE_PLAY_UPDATES: Record<string, { updatedAt: string; updatedOn: string }> = {
  'com.sezzle.sezzlemobile': {
    updatedAt: '2026-10-01T21:55:06.000Z',
    updatedOn: 'Oct 1, 2026',
  },
  'com.ashtoncofer.Buzz': {
    updatedAt: '2026-10-01T21:35:34.000Z',
    updatedOn: 'Oct 1, 2026',
  },
  'com.adobe.scan.android': {
    updatedAt: '2026-09-28T23:51:13.000Z',
    updatedOn: 'Sep 28, 2026',
  },
  'com.aftership.AfterShip': {
    updatedAt: '2026-09-23T07:26:28.000Z',
    updatedOn: 'Sep 23, 2026',
  },
  'com.eab.se': {
    updatedAt: '2026-09-21T01:12:34.000Z',
    updatedOn: 'Sep 20, 2026',
  },
  'com.tripledot.blackjack': {
    updatedAt: '2026-09-17T13:50:02.000Z',
    updatedOn: 'Sep 17, 2026',
  },
  'com.sidelineswap.android': {
    updatedAt: '2026-09-03T17:25:24.000Z',
    updatedOn: 'Sep 3, 2026',
  },
  'com.instructure.candroid': {
    updatedAt: '2026-07-30T15:40:20.000Z',
    updatedOn: 'Jul 30, 2026',
  },
};

interface RawOption {
  key: string;
  title: string;
  description: string;
  required: boolean;
  type: string;
  default: string | boolean | number | null;
  values?: string[] | null;
}

interface RawTarget {
  version: string;
  versionCodes?: Record<string, number> | null;
  isExperimental: boolean;
  minSdk?: number | null;
  description?: string | null;
}

interface RawCompatiblePackage {
  packageName: string;
  name: string;
  description?: string | null;
  apkFileType?: string | null;
  appIconColor?: string | null;
  signatures?: string[] | null;
  targets: RawTarget[];
}

interface RawPatch {
  name: string;
  description: string;
  default: boolean;
  category?: string | null;
  dependencies: string[];
  compatiblePackages?: RawCompatiblePackage[] | null;
  options: RawOption[];
}

interface RawPatchesList {
  version: string;
  patches: RawPatch[];
}

interface RawBundle {
  version: string;
  created_at: string;
  description: string;
  download_url: string;
  signature_download_url?: string;
}

let cachedData: {
  apps: App[];
  patches: Patch[];
  stats: RepositoryStats;
  release: ReleaseInfo;
  versionStatuses: AppVersionStatus[];
} | null = null;

export function loadRepositoryData() {
  if (cachedData) return cachedData;

  const currentDir = path.dirname(fileURLToPath(import.meta.url));
  const patchesListPath = path.resolve(currentDir, '../../../patches-list.json');
  const bundleListPath = path.resolve(currentDir, '../../../patches-bundle.json');

  const rawList: RawPatchesList = JSON.parse(
    fs.readFileSync(patchesListPath, 'utf-8')
  );
  const rawBundle: RawBundle = JSON.parse(
    fs.readFileSync(bundleListPath, 'utf-8')
  );

  const appsById: Record<string, App> = {};
  const patches: Patch[] = [];

  for (const rawPatch of rawList.patches) {
    const patchId = slugify(rawPatch.name);
    const options: PatchOption[] = (rawPatch.options || []).map((opt) => {
      let optType: OptionType = 'string';
      if (opt.type === 'kotlin.Boolean') {
        optType = 'boolean';
      } else if (
        opt.type === 'kotlin.String' &&
        typeof opt.default === 'string' &&
        opt.default.startsWith('#')
      ) {
        optType = 'color';
      }

      return {
        key: opt.key,
        title: opt.title,
        description: opt.description,
        required: Boolean(opt.required),
        type: optType,
        default: opt.default ?? '',
        values: Array.isArray(opt.values) ? opt.values : null,
      };
    });

    const compatibleAppIds: string[] = [];
    const compatiblePackages: Patch['compatiblePackages'] = [];

    if (rawPatch.compatiblePackages && rawPatch.compatiblePackages.length > 0) {
      for (const cp of rawPatch.compatiblePackages) {
        const appId = slugify(cp.name || cp.packageName);
        compatibleAppIds.push(appId);
        compatiblePackages.push({
          packageName: cp.packageName,
          name: cp.name,
          appIconColor: cp.appIconColor,
          apkFileType: cp.apkFileType,
        });

        if (!appsById[appId]) {
          const appTargets: AppTarget[] = (cp.targets || []).map((t) => ({
            version: t.version,
            versionCodes: t.versionCodes,
            isExperimental: Boolean(t.isExperimental),
            minSdk: t.minSdk ?? null,
            description: t.description,
          }));

          const versions = appTargets.map((t) => t.version).filter(Boolean);
          const minSdk = appTargets.reduce<number | null>((acc, cur) => {
            if (cur.minSdk === null || cur.minSdk === undefined) return acc;
            return acc === null ? cur.minSdk : Math.min(acc, cur.minSdk);
          }, null);

          const docsName = appId === 'adobe-scan' ? 'adobe-scan' : appId;
          const docsUrl = `https://github.com/ihatenodejs/aidans-patches/tree/main/docs/${docsName}`;

          appsById[appId] = {
            id: appId,
            name: cp.name,
            packageName: cp.packageName,
            apkFileType: (cp.apkFileType as ApkFileType) || 'APK',
            appIconColor: cp.appIconColor || '#3b82f6',
            targets: appTargets,
            supportedVersions: versions,
            latestSupportedVersion: versions[0] || 'Unknown',
            minSdk,
            signatures: cp.signatures || null,
            patchCount: 0,
            playStoreUrl: `https://play.google.com/store/apps/details?id=${encodeURIComponent(cp.packageName)}`,
            docsUrl,
            iconUrl: getAppIconUrl(cp.packageName),
          };
        }
      }
    }

    patches.push({
      id: patchId,
      name: rawPatch.name,
      description: rawPatch.description,
      default: Boolean(rawPatch.default),
      category: rawPatch.category || null,
      dependencies: rawPatch.dependencies || [],
      compatibleAppIds,
      compatiblePackages,
      options,
      sourceUrl: getPatchSourceUrl(rawPatch.name, compatibleAppIds[0]),
    });
  }

  // Calculate patch counts per app
  for (const patch of patches) {
    for (const appId of patch.compatibleAppIds) {
      const app = appsById[appId];
      if (app) {
        app.patchCount += 1;
      }
    }
  }

  const apps = Object.values(appsById).sort((a, b) =>
    a.name.localeCompare(b.name)
  );

  const release = parseReleaseInfo(rawBundle);

  for (const item of release.recentChanges) {
    const matchedApp = resolveAppForScope(item.scope, apps);
    if (matchedApp) {
      item.appId = matchedApp.id;
      item.appName = matchedApp.name;
      item.appIconUrl = matchedApp.iconUrl;
    }
  }
  const stats: RepositoryStats = {
    supportedAppsCount: apps.length,
    totalPatchesCount: patches.length,
    bundleVersion: rawBundle.version || rawList.version,
    releaseDate: release.releaseDate,
  };

  const versionStatuses: AppVersionStatus[] = apps.map((app) => {
    const baseline = BASELINE_PLAY_UPDATES[app.packageName];
    return {
      packageName: app.packageName,
      appName: app.name,
      appId: app.id,
      appIconColor: app.appIconColor,
      supportedVersions: app.supportedVersions,
      latestSupportedVersion: app.latestSupportedVersion,
      playVersion: null,
      checkedAt: null,
      updatedAt: baseline?.updatedAt || null,
      updatedOn: baseline?.updatedOn || null,
      status: 'unknown',
      playStoreUrl: app.playStoreUrl,
      iconUrl: app.iconUrl,
    };
  });

  cachedData = {
    apps,
    patches,
    stats,
    release,
    versionStatuses,
  };

  return cachedData;
}

export function getApps(): App[] {
  return loadRepositoryData().apps;
}

export function getApp(appId: string): App | undefined {
  return loadRepositoryData().apps.find((a) => a.id === appId);
}

export function getPatches(): Patch[] {
  return loadRepositoryData().patches;
}

export function getPatchesForApp(appId: string): Patch[] {
  return loadRepositoryData().patches.filter((p) =>
    p.compatibleAppIds.includes(appId)
  );
}

export function getRepositoryStats(): RepositoryStats {
  return loadRepositoryData().stats;
}

export function getLatestRelease(): ReleaseInfo {
  return loadRepositoryData().release;
}

export function getInitialVersionStatuses(): AppVersionStatus[] {
  return loadRepositoryData().versionStatuses;
}

export function getLatestPlayRelease(): AppVersionStatus {
  const statuses = getInitialVersionStatuses();
  let latest: AppVersionStatus | null = null;
  let latestTime = 0;
  for (const s of statuses) {
    if (s.updatedAt) {
      const t = new Date(s.updatedAt).getTime();
      if (t > latestTime) {
        latestTime = t;
        latest = s;
      }
    }
  }
  return latest || statuses[0];
}
