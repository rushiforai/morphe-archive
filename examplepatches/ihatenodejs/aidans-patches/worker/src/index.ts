import type {
  Env,
  KVVersionPayload,
  TargetAppConfig,
  AppVersionRecord,
  LatestReleaseSummary,
} from './types';
import { fetchGooglePlayApp } from './scraper';
import { compareAppVersions } from './comparator';

const KV_KEY = 'app_versions';
let memoryCache: { payload: KVVersionPayload; expiresAt: number } | null = null;
const MEMORY_CACHE_TTL_MS = 60 * 60 * 1000; // 1 hour fallback

const MONITORED_APPS: TargetAppConfig[] = [
  {
    packageName: 'com.aftership.AfterShip',
    name: 'AfterShip',
    latestSupportedVersion: '5.25.8',
    supportedVersions: ['5.25.8'],
  },
  {
    packageName: 'com.tripledot.blackjack',
    name: 'Blackjack',
    latestSupportedVersion: '2.22.08',
    supportedVersions: ['2.22.08'],
  },
  {
    packageName: 'com.sidelineswap.android',
    name: 'SidelineSwap',
    latestSupportedVersion: '1.52.0',
    supportedVersions: ['1.52.0'],
  },
  {
    packageName: 'com.sezzle.sezzlemobile',
    name: 'Sezzle',
    latestSupportedVersion: '5.3.9',
    supportedVersions: ['5.3.9'],
  },
  {
    packageName: 'com.ashtoncofer.Buzz',
    name: 'Fizz',
    latestSupportedVersion: '1.53.0',
    supportedVersions: ['1.53.0'],
  },
  {
    packageName: 'com.adobe.scan.android',
    name: 'Adobe Scan',
    latestSupportedVersion: '26.09.25',
    supportedVersions: ['26.09.25'],
  },
  {
    packageName: 'com.instructure.candroid',
    name: 'Canvas Student',
    latestSupportedVersion: '8.10.0',
    supportedVersions: ['8.10.0'],
  },
  {
    packageName: 'com.eab.se',
    name: 'Navigate360 Student',
    latestSupportedVersion: '26.19.22',
    supportedVersions: ['26.19.22'],
  },
];

const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  'Content-Type': 'application/json',
};

async function performVersionCheck(
  env: Env,
  existingData: KVVersionPayload | null
): Promise<KVVersionPayload> {
  const now = new Date().toISOString();
  const appsRecord: Record<string, AppVersionRecord> = {};

  for (const app of MONITORED_APPS) {
    const priorRecord = existingData?.apps[app.packageName];
    const scraped = await fetchGooglePlayApp(app.packageName);

    if (scraped.isNotFound) {
      appsRecord[app.packageName] = {
        appName: app.name,
        playVersion: null,
        iconUrl: null,
        updatedAt: null,
        updatedOn: null,
        checkedAt: now,
        status: 'not-on-play-store',
        supportedVersions: app.supportedVersions,
        latestSupportedVersion: app.latestSupportedVersion,
      };
      continue;
    }

    if (scraped.rawError) {
      appsRecord[app.packageName] = {
        appName: app.name,
        playVersion: priorRecord?.playVersion || null,
        iconUrl: priorRecord?.iconUrl || null,
        updatedAt: priorRecord?.updatedAt || null,
        updatedOn: priorRecord?.updatedOn || null,
        checkedAt: now,
        status: 'check-failed',
        supportedVersions: app.supportedVersions,
        latestSupportedVersion: app.latestSupportedVersion,
      };
      continue;
    }

    const versionToCompare =
      scraped.playVersion || priorRecord?.playVersion || null;
    const status = compareAppVersions(
      app.latestSupportedVersion,
      versionToCompare
    );

    appsRecord[app.packageName] = {
      appName: app.name,
      playVersion: versionToCompare,
      iconUrl: scraped.iconUrl || priorRecord?.iconUrl || null,
      updatedAt: scraped.updatedAt || priorRecord?.updatedAt || null,
      updatedOn: scraped.updatedOn || priorRecord?.updatedOn || null,
      checkedAt: now,
      status,
      supportedVersions: app.supportedVersions,
      latestSupportedVersion: app.latestSupportedVersion,
    };
  }

  let latestRelease: LatestReleaseSummary | null = null;
  let latestTime = 0;

  for (const app of MONITORED_APPS) {
    const record = appsRecord[app.packageName];
    if (record?.updatedAt) {
      const t = new Date(record.updatedAt).getTime();
      if (t > latestTime) {
        latestTime = t;
        latestRelease = {
          packageName: app.packageName,
          appName: app.name,
          playVersion: record.playVersion,
          iconUrl: record.iconUrl || null,
          updatedAt: record.updatedAt,
          updatedOn: record.updatedOn || null,
        };
      }
    }
  }

  const payload: KVVersionPayload = {
    updatedAt: now,
    apps: appsRecord,
    latestRelease,
  };

  if (env.PLAY_VERSIONS_KV) {
    await env.PLAY_VERSIONS_KV.put(KV_KEY, JSON.stringify(payload));
  }
  memoryCache = {
    payload,
    expiresAt: Date.now() + MEMORY_CACHE_TTL_MS,
  };

  return payload;
}

export default {
  async scheduled(
    _event: ScheduledEvent,
    env: Env,
    ctx: ExecutionContext
  ): Promise<void> {
    ctx.waitUntil(
      (async () => {
        let existingData: KVVersionPayload | null = null;
        if (env.PLAY_VERSIONS_KV) {
          const raw = await env.PLAY_VERSIONS_KV.get(KV_KEY);
          if (raw) {
            try {
              existingData = JSON.parse(raw) as KVVersionPayload;
            } catch {
              // Ignore invalid parse
            }
          }
        }
        await performVersionCheck(env, existingData);
      })()
    );
  },

  async fetch(request: Request, env: Env): Promise<Response> {
    const url = new URL(request.url);

    if (request.method === 'OPTIONS') {
      return new Response(null, {
        status: 204,
        headers: CORS_HEADERS,
      });
    }

    // On-demand refresh endpoint
    if (url.pathname === '/api/refresh' && request.method === 'POST') {
      const auth = request.headers.get('Authorization');
      if (!env.REFRESH_SECRET || auth !== `Bearer ${env.REFRESH_SECRET}`) {
        return new Response(JSON.stringify({ error: 'Unauthorized' }), {
          status: 401,
          headers: CORS_HEADERS,
        });
      }

      let existingData: KVVersionPayload | null = null;
      if (env.PLAY_VERSIONS_KV) {
        const raw = await env.PLAY_VERSIONS_KV.get(KV_KEY);
        if (raw) {
          try {
            existingData = JSON.parse(raw) as KVVersionPayload;
          } catch {
            // Ignore
          }
        }
      }

      const refreshed = await performVersionCheck(env, existingData);
      return new Response(JSON.stringify(refreshed), {
        status: 200,
        headers: CORS_HEADERS,
      });
    }

    // Status endpoint (GET / or GET /api/status)
    if (
      url.pathname === '/api/status' ||
      url.pathname === '/' ||
      url.pathname === '/status'
    ) {
      if (env.PLAY_VERSIONS_KV) {
        const raw = await env.PLAY_VERSIONS_KV.get(KV_KEY);
        if (raw) {
          return new Response(raw, {
            status: 200,
            headers: {
              ...CORS_HEADERS,
              'Cache-Control': 'public, max-age=300, s-maxage=3600',
            },
          });
        }
      }

      // Fallback in-memory cache when KV is not yet populated
      if (memoryCache && Date.now() < memoryCache.expiresAt) {
        return new Response(JSON.stringify(memoryCache.payload), {
          status: 200,
          headers: {
            ...CORS_HEADERS,
            'Cache-Control': 'public, max-age=300, s-maxage=3600',
          },
        });
      }

      // If neither KV nor memory cache has data, generate initial baseline payload
      const initial = await performVersionCheck(env, null);
      return new Response(JSON.stringify(initial), {
        status: 200,
        headers: {
          ...CORS_HEADERS,
          'Cache-Control': 'public, max-age=300, s-maxage=3600',
        },
      });
    }

    return new Response(JSON.stringify({ error: 'Not Found' }), {
      status: 404,
      headers: CORS_HEADERS,
    });
  },
};
