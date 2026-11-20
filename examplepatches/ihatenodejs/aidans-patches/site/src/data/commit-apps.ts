import type { App } from './types';

const STOPWORDS = new Set([
  'student',
  'free',
  'intro',
  'app',
  'android',
  'com',
  'mobile',
  'se',
  'gc1112',
]);

/**
 * Historical word-stem or transposed aliases that cannot be derived
 * purely from app ID, words, or package segments.
 */
export const CUSTOM_SCOPE_ALIASES: Record<string, string> = {
  adobe: 'adobe-scan',
  pay365: '365-pay',
  sideline: 'sidelineswap',
  navigate: 'navigate360-student',
  prometronome: 'pro-metronome',
  creditkarma: 'credit-karma',
  adobereader: 'adobe-reader',
};

function normalizeToken(token: string): string {
  return token.toLowerCase().replace(/[^a-z0-9]/g, '');
}

/**
 * Generates an index mapping canonical scopes, normalized tokens,
 * name components, and non-generic package subdomains to their App.
 */
export function buildScopeIndex(apps: App[]): Map<string, App> {
  const index = new Map<string, App>();

  for (const app of apps) {
    const rawId = app.id.toLowerCase();
    const normId = normalizeToken(app.id);
    index.set(rawId, app);
    index.set(normId, app);

    const rawName = app.name.toLowerCase();
    const normName = normalizeToken(app.name);
    index.set(rawName, app);
    index.set(normName, app);

    // Name words (excluding stop words like "student")
    const words = app.name.toLowerCase().split(/[\s-]+/);
    for (const word of words) {
      const normWord = normalizeToken(word);
      if (normWord.length > 2 && !STOPWORDS.has(normWord)) {
        if (!index.has(normWord)) {
          index.set(normWord, app);
        }
      }
    }

    // Package segments (e.g. 'candroid', 'tripledot', 'eab', 'buzz', 'avinside', 'groundspeak')
    const segments = app.packageName.split('.');
    for (const seg of segments) {
      const normSeg = normalizeToken(seg);
      if (normSeg.length > 1 && !STOPWORDS.has(normSeg)) {
        if (!index.has(normSeg)) {
          index.set(normSeg, app);
        }
      }
    }
  }

  // Custom historical aliases
  for (const [alias, targetAppId] of Object.entries(CUSTOM_SCOPE_ALIASES)) {
    const targetApp = apps.find((a) => a.id === targetAppId);
    if (targetApp) {
      index.set(normalizeToken(alias), targetApp);
    }
  }

  return index;
}

let cachedIndex: Map<string, App> | null = null;
let lastAppsRef: App[] | null = null;

export function resolveAppForScope(
  scope: string | null,
  apps: App[],
): App | null {
  if (!scope || !apps || apps.length === 0) return null;

  if (cachedIndex === null || lastAppsRef !== apps) {
    cachedIndex = buildScopeIndex(apps);
    lastAppsRef = apps;
  }

  const raw = scope.toLowerCase().trim();
  const normalized = normalizeToken(raw);

  return cachedIndex.get(raw) || cachedIndex.get(normalized) || null;
}
