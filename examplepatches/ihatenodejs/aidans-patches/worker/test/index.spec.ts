import { env } from 'cloudflare:test';
import { describe, expect, it, vi } from 'vitest';
import { deriveMonitoredApps, MONITORED_APPS } from '../src/apps';
import { compareAppVersions } from '../src/comparator';
import { renderBadgeSvg } from '../src/badges';
import worker, {
  computeAggregateCompatibilityStatus,
  timingSafeEqual,
  performVersionCheck,
} from '../src/index';
import type {
  AppVersionRecord,
  KVVersionPayload,
  WorkerEnv,
} from '../src/types';

describe('Apps metadata derivation', () => {
  it('derives unique package metadata and latest target correctly', () => {
    const mockData = {
      version: '1.0.0',
      patches: [
        {
          name: 'Patch 1',
          compatiblePackages: [
            {
              packageName: 'com.test.one',
              name: 'App One',
              apkFileType: 'APKM',
              signatures: ['sig1'],
              targets: [{ version: '1.0.0' }, { version: '1.2.0' }],
            },
          ],
        },
        {
          name: 'Patch 2',
          compatiblePackages: [
            {
              packageName: 'com.test.one',
              name: 'App One',
              apkFileType: 'APKM',
              signatures: ['sig1'],
              targets: [{ version: '1.1.0' }],
            },
          ],
        },
      ],
    };

    const apps = deriveMonitoredApps(mockData);
    expect(apps).toHaveLength(1);
    expect(apps[0].packageName).toBe('com.test.one');
    expect(apps[0].name).toBe('App One');
    expect(apps[0].apkFileType).toBe('APKM');
    expect(apps[0].latestSupportedVersion).toBe('1.2.0');
    expect(apps[0].supportedVersions).toEqual(['1.0.0', '1.1.0', '1.2.0']);
    expect(apps[0].patchNames).toEqual(['Patch 1', 'Patch 2']);
  });

  it('rejects conflicting app names for the same package', () => {
    const conflictingData = {
      version: '1.0.0',
      patches: [
        {
          name: 'Patch 1',
          compatiblePackages: [
            {
              packageName: 'com.test.conflict',
              name: 'App Original',
              apkFileType: 'APK',
              targets: [{ version: '1.0.0' }],
            },
          ],
        },
        {
          name: 'Patch 2',
          compatiblePackages: [
            {
              packageName: 'com.test.conflict',
              name: 'App Conflict Name',
              apkFileType: 'APK',
              targets: [{ version: '1.0.0' }],
            },
          ],
        },
      ],
    };

    expect(() => deriveMonitoredApps(conflictingData)).toThrow(
      /Conflicting app name/,
    );
  });

  it('rejects conflicting file types for the same package', () => {
    const conflictingData = {
      version: '1.0.0',
      patches: [
        {
          name: 'Patch 1',
          compatiblePackages: [
            {
              packageName: 'com.test.filetype',
              name: 'App Filetype',
              apkFileType: 'APK',
              targets: [{ version: '1.0.0' }],
            },
          ],
        },
        {
          name: 'Patch 2',
          compatiblePackages: [
            {
              packageName: 'com.test.filetype',
              name: 'App Filetype',
              apkFileType: 'XAPK',
              targets: [{ version: '1.0.0' }],
            },
          ],
        },
      ],
    };

    expect(() => deriveMonitoredApps(conflictingData)).toThrow(
      /Conflicting apkFileType/,
    );
  });
});

describe('Comparator semantics', () => {
  it('returns unknown when play version is null or empty', () => {
    expect(compareAppVersions('1.54.0', null)).toBe('unknown');
    expect(compareAppVersions('1.54.0', '')).toBe('unknown');
  });

  it('returns unknown when play version indicates "varies with device"', () => {
    expect(compareAppVersions('1.54.0', 'Varies with device')).toBe('unknown');
    expect(compareAppVersions('1.54.0', 'varies')).toBe('unknown');
  });

  it('identifies newer versions correctly', () => {
    expect(compareAppVersions('1.53.0', '1.54.0')).toBe('newer-available');
    expect(compareAppVersions('1.0.0', '2.0.0')).toBe('newer-available');
  });

  it('identifies equal or older versions as up to date', () => {
    expect(compareAppVersions('1.54.0', '1.54.0')).toBe('up-to-date');
    expect(compareAppVersions('1.54.0', '1.53.0')).toBe('up-to-date');
  });
});

describe('Security and Timing helpers', () => {
  it('timingSafeEqual behaves correctly for matching and non-matching strings', () => {
    expect(timingSafeEqual('secret123', 'secret123')).toBe(true);
    expect(timingSafeEqual('secret123', 'secret124')).toBe(false);
    expect(timingSafeEqual('short', 'longer_string')).toBe(false);
  });
});

describe('Badge rendering and aggregate calculation', () => {
  it('renders valid SVG with escaped text', () => {
    const svg = renderBadgeSvg('test & label', '<status>', '#34D399');
    expect(svg).toContain('<svg');
    expect(svg).toContain('test &amp; label');
    expect(svg).toContain('&lt;status&gt;');
    expect(svg).toContain('#34D399');
  });

  it('computes aggregate status correctly', () => {
    const mockPayload: KVVersionPayload = {
      updatedAt: '2026-10-06T00:00:00Z',
      apps: {
        'com.ashtoncofer.Buzz': {
          checkedAt: '2026-10-06T00:00:00Z',
          status: 'up-to-date',
          supportedVersions: ['1.54.0'],
          latestSupportedVersion: '1.54.0',
          playVersion: '1.54.0',
          targetCompatibility: {
            requestId: 'req-1',
            role: 'target',
            versionName: '1.54.0',
            versionCode: 400032,
            patchBundleVersion: '1.4.0',
            gitRevision: 'rev123',
            testedAt: '2026-10-06T00:00:00Z',
            passedCount: 5,
            failedCount: 0,
            status: 'compatible',
          },
        },
      },
    };

    const agg = computeAggregateCompatibilityStatus(mockPayload);
    // Because not all 8 monitored apps are in this partial payload, it reports pending
    expect(agg.status).toBe('queued');
  });
});
describe('Worker fetch endpoints', () => {
  async function seedTestApps(kv: KVNamespace) {
    for (const _app of deriveMonitoredApps({ patches: [] })) {
      // empty fallback
    }
    for (const app of [
      { packageName: 'com.ashtoncofer.Buzz', name: 'Fizz', latest: '1.54.0' },
      {
        packageName: 'com.aftership.AfterShip',
        name: 'AfterShip',
        latest: '5.25.8',
      },
      {
        packageName: 'com.adobe.scan.android',
        name: 'Adobe Scan',
        latest: '26.09.25',
      },
      { packageName: 'com.eab.se', name: 'Navigate360', latest: '26.19.22' },
      {
        packageName: 'com.instructure.candroid',
        name: 'Canvas Student',
        latest: '8.10.0',
      },
      {
        packageName: 'com.sezzle.sezzlemobile',
        name: 'Sezzle',
        latest: '5.3.9',
      },
      {
        packageName: 'com.sidelineswap.android',
        name: 'SidelineSwap',
        latest: '1.52.0',
      },
      {
        packageName: 'com.tripledot.blackjack',
        name: 'Blackjack',
        latest: '2.22.09',
      },
    ]) {
      const record: AppVersionRecord = {
        appName: app.name,
        playVersion: app.latest,
        iconUrl: null,
        updatedAt: '2026-10-06T00:00:00Z',
        updatedOn: 'Oct 6, 2026',
        checkedAt: '2026-10-06T00:00:00Z',
        status: 'up-to-date',
        supportedVersions: [app.latest],
        latestSupportedVersion: app.latest,
        targetCompatibility: {
          requestId: 'init-req',
          role: 'target',
          versionName: app.latest,
          versionCode: 100,
          patchBundleVersion: '1.4.0',
          gitRevision: 'rev1',
          testedAt: '2026-10-06T00:00:00Z',
          passedCount: 5,
          failedCount: 0,
          status: 'compatible',
        },
        outstandingRequest: null,
      };
      await kv.put(`app_version:${app.packageName}`, JSON.stringify(record));
    }
  }

  it('serves GET /badges/compatibility.svg with image/svg+xml from seeded KV', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
    };

    await seedTestApps(env.PLAY_VERSIONS_KV);

    const req = new Request('http://localhost/badges/compatibility.svg', {
      method: 'GET',
    });
    const res = await worker.fetch(req, workerEnv);

    expect(res.status).toBe(200);
    expect(res.headers.get('Content-Type')).toContain('image/svg+xml');
    expect(res.headers.get('Cache-Control')).toContain('max-age=300');
    const body = await res.text();
    expect(body).toContain('<svg');
    expect(body).toContain('compatibility');
  });

  it('serves GET /badges/compatibility/com.ashtoncofer.Buzz.svg for specific package', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
    };

    await seedTestApps(env.PLAY_VERSIONS_KV);

    const req = new Request(
      'http://localhost/badges/compatibility/com.ashtoncofer.Buzz.svg',
      { method: 'GET' },
    );
    const res = await worker.fetch(req, workerEnv);

    expect(res.status).toBe(200);
    expect(res.headers.get('Content-Type')).toContain('image/svg+xml');
    const body = await res.text();
    expect(body).toContain('Fizz compatibility');
  });

  it('rejects unauthenticated POST /api/compatibility-results', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const req = new Request('http://localhost/api/compatibility-results', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ packageName: 'com.ashtoncofer.Buzz' }),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(401);
  });

  it('accepts authenticated batched POST /api/compatibility-results and updates per-package KV', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      playVersion: '1.54.0',
      outstandingRequest: {
        requestId: 'req-test-uuid',
        targetVersion: '1.54.0',
        playVersion: '1.54.0',
        expectedRoles: ['target'],
        dispatchedAt: '2026-10-06T00:00:00Z',
      },
    };
    await env.PLAY_VERSIONS_KV.put(
      'app_version:com.ashtoncofer.Buzz',
      JSON.stringify(initialRecord),
    );

    const submission = {
      requestId: 'req-test-uuid',
      packageName: 'com.ashtoncofer.Buzz',
      results: [
        {
          role: 'target',
          versionName: '1.54.0',
          versionCode: 400032,
          patchBundleVersion: '1.4.0',
          gitRevision: 'git123',
          status: 'compatible',
          passedCount: 8,
          failedCount: 0,
          workflowRunUrl: 'https://github.com/test/runs/1',
        },
      ],
    };

    const req = new Request('http://localhost/api/compatibility-results', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify(submission),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(200);
    const data = (await res.json()) as { success?: boolean };
    expect(data.success).toBe(true);

    // Verify individual per-package KV key was updated
    const savedRaw = await env.PLAY_VERSIONS_KV.get(
      'app_version:com.ashtoncofer.Buzz',
    );
    expect(savedRaw).not.toBeNull();
    const saved = JSON.parse(savedRaw!) as AppVersionRecord;
    expect(saved.targetCompatibility?.status).toBe('compatible');
    expect(saved.targetCompatibility?.workflowRunUrl).toBe(
      'https://github.com/test/runs/1',
    );
    expect(saved.outstandingRequest).toBeNull();
  });

  it('accepts acquiredPlayVersion in callback and updates playVersion, status, and release marker', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Adobe Scan: PDF Scanner, OCR',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'unknown',
      supportedVersions: ['26.09.25'],
      latestSupportedVersion: '26.09.25',
      playVersion: null,
      updatedAt: '2026-10-05T00:00:00Z',
      playVersionReleaseUpdatedAt: null,
      outstandingRequest: {
        requestId: 'req-adobe-scan',
        targetVersion: '26.09.25',
        playVersion: null,
        expectedRoles: ['target'],
        dispatchedAt: '2026-10-06T00:00:00Z',
      },
    };
    await env.PLAY_VERSIONS_KV.put(
      'app_version:com.adobe.scan.android',
      JSON.stringify(initialRecord),
    );

    const submission = {
      requestId: 'req-adobe-scan',
      packageName: 'com.adobe.scan.android',
      acquiredPlayVersion: '26.09.25',
      results: [
        {
          role: 'target',
          versionName: '26.09.25',
          versionCode: 260925,
          patchBundleVersion: '1.4.0',
          gitRevision: 'git123',
          status: 'compatible',
          passedCount: 8,
          failedCount: 0,
        },
      ],
    };

    const req = new Request('http://localhost/api/compatibility-results', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify(submission),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(200);

    const savedRaw = await env.PLAY_VERSIONS_KV.get(
      'app_version:com.adobe.scan.android',
    );
    const saved = JSON.parse(savedRaw!) as AppVersionRecord;
    expect(saved.playVersion).toBe('26.09.25');
    expect(saved.status).toBe('up-to-date');
    expect(saved.playVersionReleaseUpdatedAt).toBe('2026-10-05T00:00:00Z');
    expect(saved.targetCompatibility?.status).toBe('compatible');
    expect(saved.outstandingRequest).toBeNull();
  });

  it('rejects invalid non-string or empty acquiredPlayVersion in callback', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const req = new Request('http://localhost/api/compatibility-results', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify({
        requestId: 'req-invalid-apv',
        packageName: 'com.adobe.scan.android',
        acquiredPlayVersion: '   ',
        results: [],
      }),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(400);
  });

  it('returns 409 Conflict when request ID is stale or replayed', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      playVersion: '1.54.0',
      outstandingRequest: {
        requestId: 'current-valid-id',
        targetVersion: '1.54.0',
        playVersion: '1.54.0',
        expectedRoles: ['target'],
        dispatchedAt: '2026-10-06T00:00:00Z',
      },
    };
    await env.PLAY_VERSIONS_KV.put(
      'app_version:com.ashtoncofer.Buzz',
      JSON.stringify(initialRecord),
    );

    // Post mismatched request ID
    const staleReq = new Request('http://localhost/api/compatibility-results', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify({
        requestId: 'old-stale-id',
        packageName: 'com.ashtoncofer.Buzz',
        results: [
          {
            role: 'target',
            versionName: '1.54.0',
            versionCode: 400032,
            patchBundleVersion: '1.4.0',
            gitRevision: 'git123',
            status: 'compatible',
            passedCount: 8,
            failedCount: 0,
          },
        ],
      }),
    });

    const res = await worker.fetch(staleReq, workerEnv);
    expect(res.status).toBe(409);
    const body = (await res.json()) as { error?: string };
    expect(body.error).toContain('Stale');
  });

  it('rejects callback with version mismatch against outstanding request', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      playVersion: '1.54.0',
      outstandingRequest: {
        requestId: 'valid-req-123',
        targetVersion: '1.54.0',
        playVersion: '1.54.0',
        expectedRoles: ['target'],
        dispatchedAt: '2026-10-06T00:00:00Z',
      },
    };
    await env.PLAY_VERSIONS_KV.put(
      'app_version:com.ashtoncofer.Buzz',
      JSON.stringify(initialRecord),
    );

    const mismatchReq = new Request(
      'http://localhost/api/compatibility-results',
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer test_secret_abc',
        },
        body: JSON.stringify({
          requestId: 'valid-req-123',
          packageName: 'com.ashtoncofer.Buzz',
          results: [
            {
              role: 'target',
              versionName: '1.53.0', // Mismatch!
              versionCode: 400032,
              patchBundleVersion: '1.4.0',
              gitRevision: 'git123',
              status: 'compatible',
              passedCount: 8,
              failedCount: 0,
            },
          ],
        }),
      },
    );

    const res = await worker.fetch(mismatchReq, workerEnv);
    expect(res.status).toBe(409);
  });

  it('accepts and persists failureReason in compatibility results', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      playVersion: '1.54.0',
      outstandingRequest: {
        requestId: 'error-req-uuid',
        targetVersion: '1.54.0',
        playVersion: '1.54.0',
        expectedRoles: ['target'],
        dispatchedAt: '2026-10-06T00:00:00Z',
      },
    };
    await env.PLAY_VERSIONS_KV.put(
      'app_version:com.ashtoncofer.Buzz',
      JSON.stringify(initialRecord),
    );

    const submission = {
      requestId: 'error-req-uuid',
      packageName: 'com.ashtoncofer.Buzz',
      results: [
        {
          role: 'target',
          versionName: '1.54.0',
          versionCode: 0,
          patchBundleVersion: '1.4.0',
          gitRevision: 'git123',
          status: 'error',
          passedCount: 0,
          failedCount: 1,
          failureReason: 'Missing target fixture in R2 slot',
        },
      ],
    };

    const req = new Request('http://localhost/api/compatibility-results', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify(submission),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(200);

    const savedRaw = await env.PLAY_VERSIONS_KV.get(
      'app_version:com.ashtoncofer.Buzz',
    );
    const saved = JSON.parse(savedRaw!) as AppVersionRecord;
    expect(saved.targetCompatibility?.status).toBe('error');
    expect(saved.targetCompatibility?.failureReason).toBe(
      'Missing target fixture in R2 slot',
    );
  });

  it('rejects malformed non-string failureReason in compatibility results', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      playVersion: '1.54.0',
      outstandingRequest: {
        requestId: 'bad-reason-req',
        targetVersion: '1.54.0',
        playVersion: '1.54.0',
        expectedRoles: ['target'],
        dispatchedAt: '2026-10-06T00:00:00Z',
      },
    };
    await env.PLAY_VERSIONS_KV.put(
      'app_version:com.ashtoncofer.Buzz',
      JSON.stringify(initialRecord),
    );

    const submission = {
      requestId: 'bad-reason-req',
      packageName: 'com.ashtoncofer.Buzz',
      results: [
        {
          role: 'target',
          versionName: '1.54.0',
          versionCode: 0,
          patchBundleVersion: '1.4.0',
          gitRevision: 'git123',
          status: 'error',
          passedCount: 0,
          failedCount: 1,
          failureReason: 12345, // invalid!
        },
      ],
    };

    const req = new Request('http://localhost/api/compatibility-results', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify(submission),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(400);
  });
});

describe('Version check and self-healing dispatches', () => {
  const MOCK_PLAY_HTML = (version: string) => `
    <html>
      <body>
        [[["${version}"]],[[[1]],[[[1]]]
        <div>Updated on</div><div>Oct 6, 2026</div>
      </body>
    </html>
  `;

  interface GitHubDispatchPayload {
    event_type: string;
    client_payload: {
      requestId: string;
      packageName: string;
      observedPlayVersion: string | null;
      targetVersion: string;
      expectedRoles: 'target'[];
    };
  }

  function mockFetchWithPlayVersion(
    pkg: string,
    pkgVersion: string,
    dispatchedBodies: GitHubDispatchPayload[],
    githubStatus = 204,
  ) {
    return vi.fn(async (input: RequestInfo | URL, init?: RequestInit) => {
      const url = typeof input === 'string' ? input : input.toString();
      if (url.includes('play.google.com')) {
        const matched = MONITORED_APPS.find((a) =>
          url.includes(encodeURIComponent(a.packageName)),
        );
        const ver =
          matched?.packageName === pkg
            ? pkgVersion
            : (matched?.latestSupportedVersion ?? '1.0.0');
        return new Response(MOCK_PLAY_HTML(ver), { status: 200 });
      }
      if (url.includes('api.github.com')) {
        if (init?.body) {
          dispatchedBodies.push(
            JSON.parse(String(init.body)) as GitHubDispatchPayload,
          );
        }
        if (githubStatus >= 400) {
          return new Response(JSON.stringify({ message: 'GitHub error' }), {
            status: githubStatus,
          });
        }
        return new Response(null, { status: githubStatus });
      }
      return new Response('Not found', { status: 404 });
    });
  }

  async function seedMonitoredAppsStable(
    kv: KVNamespace,
    skipPackage?: string,
  ) {
    for (const app of MONITORED_APPS) {
      if (app.packageName === skipPackage) continue;
      const record: AppVersionRecord = {
        appName: app.name,
        playVersion: app.latestSupportedVersion,
        iconUrl: null,
        updatedAt: '2026-10-06T00:00:00Z',
        updatedOn: 'Oct 6, 2026',
        checkedAt: '2026-10-06T00:00:00Z',
        status: 'up-to-date',
        supportedVersions: app.supportedVersions,
        latestSupportedVersion: app.latestSupportedVersion,
        targetCompatibility: {
          requestId: 'seed-req',
          role: 'target',
          versionName: app.latestSupportedVersion,
          versionCode: 100,
          patchBundleVersion: '1.4.0',
          gitRevision: 'rev1',
          testedAt: '2026-10-06T00:00:00Z',
          passedCount: 5,
          failedCount: 0,
          status: 'compatible',
        },
        outstandingRequest: null,
      };
      await kv.put(`app_version:${app.packageName}`, JSON.stringify(record));
    }
  }

  it('fresh outstanding request prevents duplicate dispatch', async () => {
    const pkg = 'com.ashtoncofer.Buzz';
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      GITHUB_DISPATCH_TOKEN: 'gh_dispatch_token_123',
    };

    await seedMonitoredAppsStable(env.PLAY_VERSIONS_KV, pkg);

    const freshTime = new Date(Date.now() - 3600_000).toISOString();
    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      playVersion: '1.54.0',
      checkedAt: freshTime,
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      targetCompatibility: null,
      outstandingRequest: {
        requestId: 'fresh-id-456',
        targetVersion: '1.54.0',
        playVersion: '1.54.0',
        expectedRoles: ['target'],
        dispatchedAt: freshTime,
      },
    };
    await env.PLAY_VERSIONS_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    const dispatchedBodies: GitHubDispatchPayload[] = [];
    const originalFetch = globalThis.fetch;
    try {
      globalThis.fetch = mockFetchWithPlayVersion(
        pkg,
        '1.54.0',
        dispatchedBodies,
        204,
      );

      await performVersionCheck(workerEnv);

      expect(dispatchedBodies).toHaveLength(0);

      const savedRaw = await env.PLAY_VERSIONS_KV.get(`app_version:${pkg}`);
      const saved = JSON.parse(savedRaw!) as AppVersionRecord;
      expect(saved.outstandingRequest?.requestId).toBe('fresh-id-456');
    } finally {
      globalThis.fetch = originalFetch;
    }
  });

  it('outstanding request older than 12 hours is replaced with a new dispatch', async () => {
    const pkg = 'com.ashtoncofer.Buzz';
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      GITHUB_DISPATCH_TOKEN: 'gh_dispatch_token_123',
    };

    await seedMonitoredAppsStable(env.PLAY_VERSIONS_KV, pkg);

    const staleTime = new Date(Date.now() - 13 * 3600_000).toISOString();
    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      playVersion: '1.54.0',
      checkedAt: staleTime,
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      targetCompatibility: null,
      outstandingRequest: {
        requestId: 'stale-id-789',
        targetVersion: '1.54.0',
        playVersion: '1.54.0',
        expectedRoles: ['target'],
        dispatchedAt: staleTime,
      },
    };
    await env.PLAY_VERSIONS_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    const dispatchedBodies: GitHubDispatchPayload[] = [];
    const originalFetch = globalThis.fetch;
    try {
      globalThis.fetch = mockFetchWithPlayVersion(
        pkg,
        '1.54.0',
        dispatchedBodies,
        204,
      );

      await performVersionCheck(workerEnv);

      expect(dispatchedBodies).toHaveLength(1);
      const newRequestId = dispatchedBodies[0].client_payload.requestId;
      expect(newRequestId).not.toBe('stale-id-789');

      const savedRaw = await env.PLAY_VERSIONS_KV.get(`app_version:${pkg}`);
      const saved = JSON.parse(savedRaw!) as AppVersionRecord;
      expect(saved.outstandingRequest?.requestId).toBe(newRequestId);
      expect(saved.outstandingRequest?.expectedRoles).toEqual(['target']);
    } finally {
      globalThis.fetch = originalFetch;
    }
  });

  it('outstanding request with invalid dispatchedAt is replaced with a new dispatch', async () => {
    const pkg = 'com.ashtoncofer.Buzz';
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      GITHUB_DISPATCH_TOKEN: 'gh_dispatch_token_123',
    };

    await seedMonitoredAppsStable(env.PLAY_VERSIONS_KV, pkg);

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      playVersion: '1.54.0',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      targetCompatibility: null,
      outstandingRequest: {
        requestId: 'invalid-time-id',
        targetVersion: '1.54.0',
        playVersion: '1.54.0',
        expectedRoles: ['target'],
        dispatchedAt: 'not-a-valid-date-string',
      },
    };
    await env.PLAY_VERSIONS_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    const dispatchedBodies: GitHubDispatchPayload[] = [];
    const originalFetch = globalThis.fetch;
    try {
      globalThis.fetch = mockFetchWithPlayVersion(
        pkg,
        '1.54.0',
        dispatchedBodies,
        204,
      );

      await performVersionCheck(workerEnv);

      expect(dispatchedBodies).toHaveLength(1);
      const newRequestId = dispatchedBodies[0].client_payload.requestId;
      expect(newRequestId).not.toBe('invalid-time-id');

      const savedRaw = await env.PLAY_VERSIONS_KV.get(`app_version:${pkg}`);
      const saved = JSON.parse(savedRaw!) as AppVersionRecord;
      expect(saved.outstandingRequest?.requestId).toBe(newRequestId);
    } finally {
      globalThis.fetch = originalFetch;
    }
  });

  it('repository-dispatch body contains the exact expected roles', async () => {
    const pkg = 'com.ashtoncofer.Buzz';
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      GITHUB_DISPATCH_TOKEN: 'gh_dispatch_token_123',
    };

    await seedMonitoredAppsStable(env.PLAY_VERSIONS_KV, pkg);

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      playVersion: '1.54.0',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      targetCompatibility: null,
      outstandingRequest: null,
    };
    await env.PLAY_VERSIONS_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    const dispatchedBodies: GitHubDispatchPayload[] = [];
    const originalFetch = globalThis.fetch;
    try {
      globalThis.fetch = mockFetchWithPlayVersion(
        pkg,
        '1.55.0',
        dispatchedBodies,
        204,
      );

      await performVersionCheck(workerEnv);

      expect(dispatchedBodies).toHaveLength(1);
      const payload = dispatchedBodies[0].client_payload;
      expect(payload.expectedRoles).toEqual(['target']);
      expect(payload.packageName).toBe('com.ashtoncofer.Buzz');
      expect(payload.targetVersion).toBe('1.54.0');
      expect(payload.observedPlayVersion).toBe('1.55.0');
    } finally {
      globalThis.fetch = originalFetch;
    }
  });

  it('failed GitHub dispatch does not persist an outstanding request', async () => {
    const pkg = 'com.ashtoncofer.Buzz';
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      GITHUB_DISPATCH_TOKEN: 'gh_dispatch_token_123',
    };

    await seedMonitoredAppsStable(env.PLAY_VERSIONS_KV, pkg);

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      playVersion: '1.54.0',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      targetCompatibility: null,
      outstandingRequest: null,
    };
    await env.PLAY_VERSIONS_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    const originalFetch = globalThis.fetch;
    try {
      globalThis.fetch = mockFetchWithPlayVersion(pkg, '1.54.0', [], 401);

      await performVersionCheck(workerEnv);

      const savedRaw = await env.PLAY_VERSIONS_KV.get(`app_version:${pkg}`);
      const saved = JSON.parse(savedRaw!) as AppVersionRecord;
      expect(saved.outstandingRequest).toBeNull();
      expect(saved.outstandingRequestId).toBeNull();
    } finally {
      globalThis.fetch = originalFetch;
    }
  });
  it('handles HTML without version token: dispatches target acquisition, clears on callback, and re-dispatches on new release timestamp', async () => {
    const pkg = 'com.adobe.scan.android';
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      GITHUB_DISPATCH_TOKEN: 'gh_dispatch_token_123',
      COMPATIBILITY_STATUS_SECRET: 'secret_compat_123',
    };

    await seedMonitoredAppsStable(env.PLAY_VERSIONS_KV, pkg);

    const mockAdobePlayHtml = (updatedDateStr: string) => `
      <html>
        <head>
          <meta property="og:image" content="https://play-lh.googleusercontent.com/icon.png">
        </head>
        <body>
          <div>Updated on</div><div>${updatedDateStr}</div>
        </body>
      </html>
    `;

    let currentUpdateDate = 'Oct 5, 2026';
    const dispatchedBodies: GitHubDispatchPayload[] = [];

    const customFetch = vi.fn(
      async (input: RequestInfo | URL, init?: RequestInit) => {
        const url = typeof input === 'string' ? input : input.toString();
        if (url.includes('play.google.com')) {
          if (url.includes(encodeURIComponent(pkg))) {
            return new Response(mockAdobePlayHtml(currentUpdateDate), {
              status: 200,
            });
          }
          const matched = MONITORED_APPS.find((a) =>
            url.includes(encodeURIComponent(a.packageName)),
          );
          return new Response(
            MOCK_PLAY_HTML(matched?.latestSupportedVersion ?? '1.0.0'),
            { status: 200 },
          );
        }
        if (url.includes('api.github.com')) {
          if (init?.body) {
            dispatchedBodies.push(
              JSON.parse(String(init.body)) as GitHubDispatchPayload,
            );
          }
          return new Response(null, { status: 204 });
        }
        return new Response('Not found', { status: 404 });
      },
    );

    const originalFetch = globalThis.fetch;
    try {
      globalThis.fetch = customFetch;

      // Phase 1: Initial performVersionCheck with no prior record -> dispatches target acquisition
      await env.PLAY_VERSIONS_KV.delete(`app_version:${pkg}`);
      await performVersionCheck(workerEnv);

      expect(dispatchedBodies).toHaveLength(1);
      expect(dispatchedBodies[0].client_payload.packageName).toBe(pkg);
      expect(dispatchedBodies[0].client_payload.observedPlayVersion).toBeNull();
      expect(dispatchedBodies[0].client_payload.expectedRoles).toEqual([
        'target',
      ]);

      const initialRaw = await env.PLAY_VERSIONS_KV.get(`app_version:${pkg}`);
      const initialSaved = JSON.parse(initialRaw!) as AppVersionRecord;
      expect(initialSaved.playVersion).toBeNull();
      expect(initialSaved.status).toBe('unknown');
      expect(initialSaved.outstandingRequest).not.toBeNull();
      const requestId = initialSaved.outstandingRequest!.requestId;

      // Phase 2: Callback with acquiredPlayVersion: '26.09.25'
      const callbackReq = new Request(
        'http://localhost/api/compatibility-results',
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            Authorization: 'Bearer secret_compat_123',
          },
          body: JSON.stringify({
            requestId,
            packageName: pkg,
            acquiredPlayVersion: '26.09.25',
            results: [
              {
                role: 'target',
                versionName: '26.09.25',
                versionCode: 260925,
                patchBundleVersion: '1.4.0',
                gitRevision: 'git_abc',
                status: 'compatible',
                passedCount: 8,
                failedCount: 0,
              },
            ],
          }),
        },
      );
      const callbackRes = await worker.fetch(callbackReq, workerEnv);
      expect(callbackRes.status).toBe(200);

      const afterCallbackRaw = await env.PLAY_VERSIONS_KV.get(
        `app_version:${pkg}`,
      );
      const afterCallbackSaved = JSON.parse(
        afterCallbackRaw!,
      ) as AppVersionRecord;
      expect(afterCallbackSaved.playVersion).toBe('26.09.25');
      expect(afterCallbackSaved.status).toBe('up-to-date');
      expect(afterCallbackSaved.targetCompatibility?.status).toBe('compatible');
      expect(afterCallbackSaved.playVersionReleaseUpdatedAt).toBe(
        afterCallbackSaved.updatedAt,
      );
      expect(afterCallbackSaved.outstandingRequest).toBeNull();

      // Phase 3: Next scrape cycle with SAME update date -> NO new dispatch
      dispatchedBodies.length = 0;
      await performVersionCheck(workerEnv);
      expect(dispatchedBodies).toHaveLength(0);

      // Phase 4: Next scrape cycle with CHANGED update date -> new target acquisition dispatch
      currentUpdateDate = 'Nov 1, 2026';
      await performVersionCheck(workerEnv);
      expect(dispatchedBodies).toHaveLength(1);
      expect(dispatchedBodies[0].client_payload.packageName).toBe(pkg);
      expect(dispatchedBodies[0].client_payload.expectedRoles).toEqual([
        'target',
      ]);
    } finally {
      globalThis.fetch = originalFetch;
    }
  });

  it('leaves marker stale on null acquiredPlayVersion so subsequent cycle retries', async () => {
    const pkg = 'com.adobe.scan.android';
    const workerEnv: WorkerEnv = {
      ...env,
      PLAY_VERSIONS_KV: env.PLAY_VERSIONS_KV,
      COMPATIBILITY_STATUS_SECRET: 'secret_compat_123',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Adobe Scan: PDF Scanner, OCR',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'unknown',
      supportedVersions: ['26.09.25'],
      latestSupportedVersion: '26.09.25',
      playVersion: null,
      updatedAt: '2026-10-05T00:00:00Z',
      playVersionReleaseUpdatedAt: null,
      outstandingRequest: {
        requestId: 'req-null-acq',
        targetVersion: '26.09.25',
        playVersion: null,
        expectedRoles: ['target'],
        dispatchedAt: '2026-10-06T00:00:00Z',
      },
    };
    await env.PLAY_VERSIONS_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    const callbackReq = new Request(
      'http://localhost/api/compatibility-results',
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer secret_compat_123',
        },
        body: JSON.stringify({
          requestId: 'req-null-acq',
          packageName: pkg,
          acquiredPlayVersion: null,
          results: [
            {
              role: 'target',
              versionName: '26.09.25',
              versionCode: 260925,
              patchBundleVersion: '1.4.0',
              gitRevision: 'git_abc',
              status: 'compatible',
              passedCount: 8,
              failedCount: 0,
            },
          ],
        }),
      },
    );
    const res = await worker.fetch(callbackReq, workerEnv);
    expect(res.status).toBe(200);

    const savedRaw = await env.PLAY_VERSIONS_KV.get(`app_version:${pkg}`);
    const saved = JSON.parse(savedRaw!) as AppVersionRecord;
    expect(saved.playVersion).toBeNull();
    expect(saved.playVersionReleaseUpdatedAt).toBeNull();
    expect(saved.outstandingRequest).toBeNull();
  });
});
