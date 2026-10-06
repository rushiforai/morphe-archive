import type { FreshnessStatus } from './types';

function parseVersionSegments(v: string): number[] {
  // Strip non-numeric suffixes or prefix
  const clean = v.replace(/^v/i, '').split('-')[0].split('+')[0];
  const parts = clean.split('.').map((p) => {
    const num = parseInt(p.replace(/\D/g, ''), 10);
    return isNaN(num) ? 0 : num;
  });
  return parts;
}

export function compareAppVersions(
  targetVersion: string,
  playVersion: string | null
): FreshnessStatus {
  if (!playVersion) {
    // If Play Store does not expose a discrete version string (e.g. "Varies with device"),
    // consider it up to date against the tested target.
    return 'up-to-date';
  }

  const targetParts = parseVersionSegments(targetVersion);
  const playParts = parseVersionSegments(playVersion);

  const maxLength = Math.max(targetParts.length, playParts.length);

  for (let i = 0; i < maxLength; i++) {
    const t = targetParts[i] ?? 0;
    const p = playParts[i] ?? 0;

    if (p > t) {
      return 'newer-available';
    }
    if (p < t) {
      // Play Store has older or equal build than our tested target
      return 'up-to-date';
    }
  }

  return 'up-to-date';
}
