import type { TargetAppConfig } from './types';
import rawPatchesList from '../../patches-list.json';

interface RawTarget {
  version: string;
  versionCodes?: number[] | null;
  isExperimental?: boolean;
  minSdk?: number;
  description?: string | null;
}

interface RawCompatiblePackage {
  packageName: string;
  name: string;
  description?: string | null;
  apkFileType: string;
  appIconColor?: string | null;
  signatures?: string[] | null;
  targets: RawTarget[];
}

interface RawPatch {
  name: string;
  description: string;
  default: boolean;
  dependencies: string[];
  compatiblePackages: RawCompatiblePackage[];
}

interface RawPatchesList {
  version: string;
  patches: RawPatch[];
}

export function compareVersionStrings(a: string, b: string): number {
  const parseSegments = (v: string): number[] => {
    const clean = v.replace(/^v/i, '').split('-')[0].split('+')[0];
    return clean.split('.').map((p) => {
      const num = parseInt(p.replace(/\D/g, ''), 10);
      return isNaN(num) ? 0 : num;
    });
  };

  const aParts = parseSegments(a);
  const bParts = parseSegments(b);
  const maxLength = Math.max(aParts.length, bParts.length);

  for (let i = 0; i < maxLength; i++) {
    const aVal = aParts[i] ?? 0;
    const bVal = bParts[i] ?? 0;
    if (aVal > bVal) return 1;
    if (aVal < bVal) return -1;
  }
  return 0;
}

export function deriveMonitoredApps(data: unknown): TargetAppConfig[] {
  if (!data || typeof data !== 'object' || !('patches' in data)) {
    throw new Error('Invalid patches list data: missing "patches" array');
  }

  const patchesList = data as RawPatchesList;
  if (!Array.isArray(patchesList.patches)) {
    throw new Error('Invalid patches list data: "patches" must be an array');
  }

  const appMap = new Map<
    string,
    {
      packageName: string;
      name: string;
      apkFileType: string;
      signatures: Set<string>;
      patchNames: Set<string>;
      supportedVersions: Set<string>;
    }
  >();

  for (const patch of patchesList.patches) {
    if (!patch.compatiblePackages || !Array.isArray(patch.compatiblePackages)) {
      continue;
    }

    for (const cp of patch.compatiblePackages) {
      if (!cp.packageName) {
        throw new Error(`Patch "${patch.name}" has compatible package missing packageName`);
      }

      const existing = appMap.get(cp.packageName);
      if (!existing) {
        const sigs = new Set<string>();
        if (Array.isArray(cp.signatures)) {
          for (const s of cp.signatures) sigs.add(s);
        }

        const versions = new Set<string>();
        if (Array.isArray(cp.targets)) {
          for (const t of cp.targets) {
            if (t.version) versions.add(t.version);
          }
        }

        appMap.set(cp.packageName, {
          packageName: cp.packageName,
          name: cp.name,
          apkFileType: cp.apkFileType,
          signatures: sigs,
          patchNames: new Set([patch.name]),
          supportedVersions: versions,
        });
      } else {
        if (existing.name !== cp.name) {
          throw new Error(
            `Conflicting app name for package ${cp.packageName}: "${existing.name}" vs "${cp.name}"`
          );
        }
        if (existing.apkFileType !== cp.apkFileType) {
          throw new Error(
            `Conflicting apkFileType for package ${cp.packageName}: "${existing.apkFileType}" vs "${cp.apkFileType}"`
          );
        }
        if (Array.isArray(cp.signatures)) {
          for (const s of cp.signatures) {
            existing.signatures.add(s);
          }
        }
        existing.patchNames.add(patch.name);
        if (Array.isArray(cp.targets)) {
          for (const t of cp.targets) {
            if (t.version) existing.supportedVersions.add(t.version);
          }
        }
      }
    }
  }

  const result: TargetAppConfig[] = [];
  for (const entry of appMap.values()) {
    const sortedVersions = Array.from(entry.supportedVersions).sort(compareVersionStrings);
    if (sortedVersions.length === 0) {
      throw new Error(`Package ${entry.packageName} has no supported versions declared`);
    }
    const latestSupportedVersion = sortedVersions[sortedVersions.length - 1];

    result.push({
      packageName: entry.packageName,
      name: entry.name,
      apkFileType: entry.apkFileType,
      signatures: Array.from(entry.signatures).sort(),
      patchNames: Array.from(entry.patchNames).sort(),
      supportedVersions: sortedVersions,
      latestSupportedVersion,
    });
  }

  // Sort apps deterministically by packageName
  result.sort((a, b) => a.packageName.localeCompare(b.packageName));
  return result;
}

export const MONITORED_APPS: TargetAppConfig[] = deriveMonitoredApps(rawPatchesList);
