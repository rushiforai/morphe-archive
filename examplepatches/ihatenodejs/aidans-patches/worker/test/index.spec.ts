import { env } from 'cloudflare:test';
import { describe, expect, it, vi } from 'vitest';
import { parseMonitoredApps, compareUtf16 } from '../src/apps';
import { compareAppVersions } from '../src/comparator';
import { renderBadgeSvg } from '../src/badges';
import fixtureHtml from './fixtures/google-play-details.html?raw';
import { parseGooglePlayHtml } from '../src/scraper';
import worker, {
  computeAggregateCompatibilityStatus,
  timingSafeEqual,
  performVersionCheck,
  saveAppRecord,
  reconcileMediaAsset,
  reconcileMediaAssetsList,
  reconcileReviews,
} from '../src/index';
import type {
  AppVersionRecord,
  KVVersionPayload,
  WorkerEnv,
} from '../src/types';

describe('Apps metadata parsing', () => {
  it('parses valid apps catalog correctly', () => {
    const mockData = {
      version: '1.0.0',
      apps: [
        {
          packageName: 'com.test.one',
          name: 'App One',
          description: null,
          apkFileType: 'APKM',
          appIconColor: '#123456',
          signatures: ['sig1', 'sig2'],
          targets: [{ version: '1.0.0' }, { version: '1.2.0' }],
          patchNames: ['Patch 1', 'Patch 2'],
          supportedVersions: ['1.0.0', '1.2.0'],
          latestSupportedVersion: '1.2.0',
        },
      ],
    };

    const apps = parseMonitoredApps(mockData);
    expect(apps).toHaveLength(1);
    expect(apps[0].packageName).toBe('com.test.one');
    expect(apps[0].name).toBe('App One');
    expect(apps[0].apkFileType).toBe('APKM');
    expect(apps[0].signatures).toEqual(['sig1', 'sig2']);
    expect(apps[0].patchNames).toEqual(['Patch 1', 'Patch 2']);
    expect(apps[0].supportedVersions).toEqual(['1.0.0', '1.2.0']);
    expect(apps[0].latestSupportedVersion).toBe('1.2.0');
  });

  it('rejects missing or non-array apps property', () => {
    expect(() => parseMonitoredApps({})).toThrow(/missing "apps" array/);
    expect(() => parseMonitoredApps({ apps: 'not-an-array' })).toThrow(
      /missing "apps" array/,
    );
  });

  it('rejects duplicate package names', () => {
    const duplicateData = {
      apps: [
        {
          packageName: 'com.test.dup',
          name: 'App Dup',
          apkFileType: 'APK',
          signatures: [],
          patchNames: ['Patch 1'],
          supportedVersions: ['1.0.0'],
          latestSupportedVersion: '1.0.0',
        },
        {
          packageName: 'com.test.dup',
          name: 'App Dup 2',
          apkFileType: 'APK',
          signatures: [],
          patchNames: ['Patch 2'],
          supportedVersions: ['1.0.0'],
          latestSupportedVersion: '1.0.0',
        },
      ],
    };

    expect(() => parseMonitoredApps(duplicateData)).toThrow(
      /Duplicate package name/,
    );
  });

  it('rejects empty supported versions', () => {
    const emptyVersionsData = {
      apps: [
        {
          packageName: 'com.test.empty',
          name: 'App Empty',
          apkFileType: 'APK',
          signatures: [],
          patchNames: ['Patch 1'],
          supportedVersions: [],
          latestSupportedVersion: '1.0.0',
        },
      ],
    };

    expect(() => parseMonitoredApps(emptyVersionsData)).toThrow(
      /Invalid supportedVersions/,
    );
  });

  it('rejects incorrect latestSupportedVersion', () => {
    const incorrectLatestData = {
      apps: [
        {
          packageName: 'com.test.mismatch',
          name: 'App Mismatch',
          apkFileType: 'APK',
          signatures: [],
          patchNames: ['Patch 1'],
          supportedVersions: ['1.0.0', '1.2.0'],
          latestSupportedVersion: '1.0.0',
        },
      ],
    };

    expect(() => parseMonitoredApps(incorrectLatestData)).toThrow(
      /latestSupportedVersion.*does not match last supportedVersion/,
    );
  });

  it('rejects invalid or missing required field', () => {
    const missingNameData = {
      apps: [
        {
          packageName: 'com.test.missing',
          name: '',
          apkFileType: 'APK',
          signatures: [],
          patchNames: ['Patch 1'],
          supportedVersions: ['1.0.0'],
          latestSupportedVersion: '1.0.0',
        },
      ],
    };

    expect(() => parseMonitoredApps(missingNameData)).toThrow(/missing name/);
  });

  it('accepts UTF-16 code-unit order for packages, signatures, and patch names', () => {
    // Uppercase precedes lowercase in UTF-16 code units ('B' < 'a')
    expect(compareUtf16('com.test.B', 'com.test.a')).toBe(-1);
    expect(compareUtf16('SIG_B', 'sig_a')).toBe(-1);
    expect(compareUtf16('B Patch', 'a Patch')).toBe(-1);

    const validUtf16Data = {
      apps: [
        {
          packageName: 'com.test.B',
          name: 'App B',
          apkFileType: 'APK',
          signatures: ['SIG_B', 'sig_a'],
          patchNames: ['B Patch', 'a Patch'],
          supportedVersions: ['1.0.0'],
          latestSupportedVersion: '1.0.0',
        },
        {
          packageName: 'com.test.a',
          name: 'App a',
          apkFileType: 'APK',
          signatures: ['sig'],
          patchNames: ['patch'],
          supportedVersions: ['1.0.0'],
          latestSupportedVersion: '1.0.0',
        },
      ],
    };

    const parsed = parseMonitoredApps(validUtf16Data);
    expect(parsed).toHaveLength(2);
  });

  it('rejects out-of-order packages, signatures, and patch names under UTF-16', () => {
    const unsortedPackages = {
      apps: [
        {
          packageName: 'com.test.b',
          name: 'App b',
          apkFileType: 'APK',
          signatures: ['sig'],
          patchNames: ['patch'],
          supportedVersions: ['1.0.0'],
          latestSupportedVersion: '1.0.0',
        },
        {
          packageName: 'com.test.a',
          name: 'App a',
          apkFileType: 'APK',
          signatures: ['sig'],
          patchNames: ['patch'],
          supportedVersions: ['1.0.0'],
          latestSupportedVersion: '1.0.0',
        },
      ],
    };
    expect(() => parseMonitoredApps(unsortedPackages)).toThrow(
      /Apps catalog must be sorted by packageName/,
    );

    const unsortedSignatures = {
      apps: [
        {
          packageName: 'com.test.a',
          name: 'App a',
          apkFileType: 'APK',
          signatures: ['sig_b', 'sig_a'],
          patchNames: ['patch'],
          supportedVersions: ['1.0.0'],
          latestSupportedVersion: '1.0.0',
        },
      ],
    };
    expect(() => parseMonitoredApps(unsortedSignatures)).toThrow(
      /Signatures for package com.test.a must be uniquely sorted/,
    );

    const unsortedPatches = {
      apps: [
        {
          packageName: 'com.test.a',
          name: 'App a',
          apkFileType: 'APK',
          signatures: ['sig'],
          patchNames: ['patch_b', 'patch_a'],
          supportedVersions: ['1.0.0'],
          latestSupportedVersion: '1.0.0',
        },
      ],
    };
    expect(() => parseMonitoredApps(unsortedPatches)).toThrow(
      /Patch names for package com.test.a must be uniquely sorted/,
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
    for (const _app of parseMonitoredApps({ apps: [] })) {
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
      PATCHES_KV: env.PATCHES_KV,
    };

    await seedTestApps(env.PATCHES_KV);

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

  it('serves GET /badges/tests.svg with summed tests and thresholds', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
    };

    await seedTestApps(env.PATCHES_KV);
    // 1. 100% tests passing -> 40/40 green #238636
    const req100 = new Request('http://localhost/badges/tests.svg', {
      method: 'GET',
    });
    const res100 = await worker.fetch(req100, workerEnv);
    expect(res100.status).toBe(200);
    const body100 = await res100.text();
    expect(body100).toContain('tests passing');
    expect(body100).toContain('40/40');
    expect(body100).toContain('#238636');
    expect(body100).toContain('font-weight="bold"');

    // 2. 90-99% tests passing (40/44 = 90.9%) -> orange #bc4c00
    const rawRecord = await env.PATCHES_KV.get(
      'app_version:com.ashtoncofer.Buzz',
    );
    const recordBuzz = JSON.parse(rawRecord!);
    recordBuzz.targetCompatibility.failedCount = 4;
    await saveAppRecord(workerEnv, 'com.ashtoncofer.Buzz', recordBuzz);

    const resOrange = await worker.fetch(req100, workerEnv);
    const bodyOrange = await resOrange.text();
    expect(bodyOrange).toContain('40/44');
    expect(bodyOrange).toContain('#bc4c00');

    // 3. < 90% tests passing (40/50 = 80%) -> red #cf222e
    recordBuzz.targetCompatibility.failedCount = 10;
    await saveAppRecord(workerEnv, 'com.ashtoncofer.Buzz', recordBuzz);

    const resRed = await worker.fetch(req100, workerEnv);
    const bodyRed = await resRed.text();
    expect(bodyRed).toContain('40/50');
    expect(bodyRed).toContain('#cf222e');
  });

  it('serves GET /badges/compatibility/com.ashtoncofer.Buzz.svg for specific package', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
    };

    await seedTestApps(env.PATCHES_KV);

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
  it.each([
    [undefined, 0, 0, '', 'no apk'],
    [null, 2, 3, 'No fixture slot matches target', 'no apk'],
    [undefined, 0, 1, 'Failed fixture retrieval', 'no apk'],
    ['acquisition', 2, 3, '', 'no apk'],
    ...[
      'r2-lookup',
      'r2-upload',
      'r2-download',
      'compatibility-check',
      'pipeline',
    ].flatMap((stage) => [
      [stage, 0, 0, '', 'error'],
      [stage, 0, 1, 'Missing fixture: no APK', 'error'],
    ]),
  ])(
    'renders failure stage %s with counts %s/%s and reason %s as %s',
    async (
      failureStage,
      passedCount,
      failedCount,
      failureReason,
      expectedStatus,
    ) => {
      const workerEnv: WorkerEnv = {
        ...env,
        PATCHES_KV: env.PATCHES_KV,
      };

      await seedTestApps(env.PATCHES_KV);
      const appRecord = {
        appName: 'Sezzle',
        playVersion: '5.3.13',
        checkedAt: new Date().toISOString(),
        status: 'newer-available' as const,
        supportedVersions: ['5.3.9'],
        latestSupportedVersion: '5.3.9',
        targetCompatibility: {
          requestId: 'req-test',
          role: 'target' as const,
          versionName: '5.3.9',
          versionCode: 0,
          patchBundleVersion: '1.5.1',
          gitRevision: 'rev1',
          testedAt: new Date().toISOString(),
          passedCount,
          failedCount,
          status: 'error' as const,
          failureStage,
          failureReason,
        },
      };
      await env.PATCHES_KV.put(
        'app_version:com.sezzle.sezzlemobile',
        JSON.stringify(appRecord),
      );

      const req = new Request(
        'http://localhost/badges/compatibility/com.sezzle.sezzlemobile.svg',
        { method: 'GET' },
      );
      const res = await worker.fetch(req, workerEnv);

      expect(res.status).toBe(200);
      const body = await res.text();
      expect(body).toContain('Sezzle compatibility');
      expect(body).toContain(expectedStatus as string);
      if (expectedStatus === 'error') expect(body).not.toContain('no apk');
      expect(body).toContain('#EF4444');
    },
  );

  it('serves GET /badges/tests/:packageName.svg with green badge when all tests pass', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
    };

    await seedTestApps(env.PATCHES_KV);
    const appRecord = {
      appName: 'SidelineSwap',
      playVersion: '1.52.0',
      checkedAt: new Date().toISOString(),
      status: 'up-to-date' as const,
      supportedVersions: ['1.52.0'],
      latestSupportedVersion: '1.52.0',
      targetCompatibility: {
        requestId: 'req-test',
        role: 'target' as const,
        versionName: '1.52.0',
        versionCode: 222,
        patchBundleVersion: '1.7.0',
        gitRevision: 'rev1',
        testedAt: new Date().toISOString(),
        passedCount: 4,
        failedCount: 0,
        status: 'compatible' as const,
      },
    };
    await env.PATCHES_KV.put(
      'app_version:com.sidelineswap.android',
      JSON.stringify(appRecord),
    );

    const req = new Request(
      'http://localhost/badges/tests/com.sidelineswap.android.svg',
      { method: 'GET' },
    );
    const res = await worker.fetch(req, workerEnv);

    expect(res.status).toBe(200);
    expect(res.headers.get('Content-Type')).toContain('image/svg+xml');
    const body = await res.text();
    expect(body).toContain('tests passing');
    expect(body).toContain('4/4');
    expect(body).toContain('font-weight="bold"');
    expect(body).toContain('#238636');
  });

  it('serves GET /badges/tests/:packageName.svg with red badge when tests fail', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
    };

    const failingRecord = {
      appName: 'Fizz',
      playVersion: '1.54.0',
      checkedAt: new Date().toISOString(),
      status: 'up-to-date' as const,
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      targetCompatibility: {
        requestId: 'req-fail',
        role: 'target' as const,
        versionName: '1.54.0',
        versionCode: 400032,
        patchBundleVersion: '1.7.0',
        gitRevision: 'rev1',
        testedAt: new Date().toISOString(),
        passedCount: 3,
        failedCount: 1,
        status: 'incompatible' as const,
      },
    };
    await env.PATCHES_KV.put(
      'app_version:com.ashtoncofer.Buzz',
      JSON.stringify(failingRecord),
    );

    const reqFailing = new Request(
      'http://localhost/badges/tests/com.ashtoncofer.Buzz.svg',
      { method: 'GET' },
    );
    const resFailing = await worker.fetch(reqFailing, workerEnv);
    expect(resFailing.status).toBe(200);
    const bodyFailing = await resFailing.text();
    expect(bodyFailing).toContain('tests passing');
    expect(bodyFailing).toContain('3/4');
    expect(bodyFailing).toContain('font-weight="bold"');
    expect(bodyFailing).toContain('#cf222e');
  });

  it('serves GET /badges/tests/:packageName.svg empty SVG when untested or unknown', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
    };

    // 1. Unknown / unseeded package returns 0x0 empty SVG
    const reqUnknown = new Request(
      'http://localhost/badges/tests/com.completely.unknown.app.svg',
      { method: 'GET' },
    );
    const resUnknown = await worker.fetch(reqUnknown, workerEnv);
    expect(resUnknown.status).toBe(200);
    const bodyUnknown = await resUnknown.text();
    expect(bodyUnknown).toBe(
      '<svg xmlns="http://www.w3.org/2000/svg" width="0" height="0"/>',
    );

    // 2. Seeded app with null targetCompatibility (like new app) returns 0x0 empty SVG
    const untestedRecord = {
      appName: '365 Pay',
      playVersion: '10.2605.0',
      checkedAt: new Date().toISOString(),
      status: 'up-to-date' as const,
      supportedVersions: ['10.2605.0'],
      latestSupportedVersion: '10.2605.0',
      targetCompatibility: null,
    };
    await env.PATCHES_KV.put(
      'app_version:com.avinside',
      JSON.stringify(untestedRecord),
    );

    const reqUntested = new Request(
      'http://localhost/badges/tests/com.avinside.svg',
      { method: 'GET' },
    );
    const resUntested = await worker.fetch(reqUntested, workerEnv);
    expect(resUntested.status).toBe(200);
    const bodyUntested = await resUntested.text();
    expect(bodyUntested).toBe(
      '<svg xmlns="http://www.w3.org/2000/svg" width="0" height="0"/>',
    );
  });

  it('rejects unauthenticated POST /api/compatibility-results', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
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
      PATCHES_KV: env.PATCHES_KV,
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
    await env.PATCHES_KV.put(
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
    const savedRaw = await env.PATCHES_KV.get(
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
      PATCHES_KV: env.PATCHES_KV,
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
    await env.PATCHES_KV.put(
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

    const savedRaw = await env.PATCHES_KV.get(
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
      PATCHES_KV: env.PATCHES_KV,
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
      PATCHES_KV: env.PATCHES_KV,
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
    await env.PATCHES_KV.put(
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
      PATCHES_KV: env.PATCHES_KV,
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
    await env.PATCHES_KV.put(
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
      PATCHES_KV: env.PATCHES_KV,
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
    await env.PATCHES_KV.put(
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

    const savedRaw = await env.PATCHES_KV.get(
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
      PATCHES_KV: env.PATCHES_KV,
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
    await env.PATCHES_KV.put(
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

  it('rejects unauthenticated POST /api/compatibility-runs', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const req = new Request('http://localhost/api/compatibility-runs', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ packageName: 'com.ashtoncofer.Buzz' }),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(401);
  });

  it('rejects malformed POST /api/compatibility-runs payload', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    // Missing targetVersion in supportedVersions
    const req = new Request('http://localhost/api/compatibility-runs', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify({
        requestId: 'req-1',
        packageName: 'com.ashtoncofer.Buzz',
        appName: 'Fizz',
        targetVersion: '2.0.0',
        supportedVersions: ['1.0.0'],
        gitRevision: 'sha123',
      }),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(400);
  });

  it('registers run-start for known app and preserves existing Play metadata', async () => {
    const pkg = 'com.ashtoncofer.Buzz';
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      playVersion: '1.54.0',
      iconUrl: 'https://example.com/icon.png',
      updatedAt: '2026-10-06T00:00:00Z',
      updatedOn: 'Oct 6, 2026',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      targetCompatibility: null,
      outstandingRequest: null,
    };
    await env.PATCHES_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    const runStartPayload = {
      requestId: 'run-start-uuid',
      packageName: pkg,
      appName: 'Fizz',
      targetVersion: '1.54.0',
      supportedVersions: ['1.54.0'],
      gitRevision: 'git_commit_sha_123',
    };

    const req = new Request('http://localhost/api/compatibility-runs', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify(runStartPayload),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(200);
    const data = (await res.json()) as { success?: boolean; queued?: string };
    expect(data.success).toBe(true);
    expect(data.queued).toBe(pkg);

    const savedRaw = await env.PATCHES_KV.get(`app_version:${pkg}`);
    const saved = JSON.parse(savedRaw!) as AppVersionRecord;
    expect(saved.playVersion).toBe('1.54.0');
    expect(saved.iconUrl).toBe('https://example.com/icon.png');
    expect(saved.outstandingRequest?.requestId).toBe('run-start-uuid');
    expect(saved.outstandingRequest?.gitRevision).toBe('git_commit_sha_123');
  });

  it('preserves playMetadata, iconAsset, and needsAuthenticatedVersion on POST /api/compatibility-runs', async () => {
    const pkg = 'com.ashtoncofer.Buzz';
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      playVersion: '1.54.0',
      playVersionCode: 1540,
      playVersionSource: 'authenticated',
      playVersionVerifiedForUpdatedAt: '2026-10-06T00:00:00Z',
      needsAuthenticatedVersion: true,
      iconUrl: 'https://example.com/icon.png',
      iconAsset: {
        sourceUrl: 'https://example.com/icon.png',
        fallbackPath: '/media/play/com.ashtoncofer.Buzz/icon.png',
        width: 512,
        height: 512,
        alt: 'Fizz icon',
      },
      playMetadata: {
        summary: 'Rich summary',
        description: 'Detailed description',
        developer: 'Buzz Dev',
        category: 'Productivity',
        categoryId: 'PRODUCTIVITY',
        releaseNotes: 'Bug fixes',
        installs: '1M+',
        score: 4.8,
        ratingsCount: 5000,
        reviewsCount: 1200,
        contentRating: 'Everyone',
        contentRatingIcon: null,
        releasedOn: '2020-01-01',
        minAndroid: 'Android 8.0',
        inAppPurchases: null,
        permissionGroups: [],
        screenshots: [],
        featuredReviews: [],
      },
      updatedAt: '2026-10-06T00:00:00Z',
      updatedOn: 'Oct 6, 2026',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      targetCompatibility: null,
      outstandingRequest: null,
    };
    await env.PATCHES_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    const runStartPayload = {
      requestId: 'run-start-preserved-metadata',
      packageName: pkg,
      appName: 'Fizz',
      targetVersion: '1.54.0',
      supportedVersions: ['1.54.0'],
      gitRevision: 'git_commit_sha_456',
    };

    const req = new Request('http://localhost/api/compatibility-runs', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify(runStartPayload),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(200);

    const savedRaw = await env.PATCHES_KV.get(`app_version:${pkg}`);
    const saved = JSON.parse(savedRaw!) as AppVersionRecord;
    expect(saved.playMetadata).toEqual(initialRecord.playMetadata);
    expect(saved.iconAsset).toEqual(initialRecord.iconAsset);
    expect(saved.needsAuthenticatedVersion).toBe(true);
    expect(saved.playVersionCode).toBe(1540);
    expect(saved.playVersionSource).toBe('authenticated');
    expect(saved.playVersionVerifiedForUpdatedAt).toBe('2026-10-06T00:00:00Z');
  });

  it('initializes unknown new app on POST /api/compatibility-runs and shows queued status', async () => {
    const pkg = 'com.new.awesomeapp';
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const runStartPayload = {
      requestId: 'new-app-run-id',
      packageName: pkg,
      appName: 'Awesome App',
      targetVersion: '1.0.0',
      supportedVersions: ['1.0.0'],
      gitRevision: 'sha_new_app',
    };

    const req = new Request('http://localhost/api/compatibility-runs', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify(runStartPayload),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(200);

    const savedRaw = await env.PATCHES_KV.get(`app_version:${pkg}`);
    expect(savedRaw).not.toBeNull();
    const saved = JSON.parse(savedRaw!) as AppVersionRecord;
    expect(saved.appName).toBe('Awesome App');
    expect(saved.latestSupportedVersion).toBe('1.0.0');
    expect(saved.outstandingRequest?.requestId).toBe('new-app-run-id');
    expect(saved.outstandingRequest?.gitRevision).toBe('sha_new_app');

    // Results can then be submitted for this new app
    const resultReq = new Request(
      'http://localhost/api/compatibility-results',
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer test_secret_abc',
        },
        body: JSON.stringify({
          requestId: 'new-app-run-id',
          packageName: pkg,
          results: [
            {
              role: 'target',
              versionName: '1.0.0',
              versionCode: 10,
              patchBundleVersion: '1.5.0',
              gitRevision: 'sha_new_app',
              status: 'compatible',
              passedCount: 3,
              failedCount: 0,
            },
          ],
        }),
      },
    );
    const resultRes = await worker.fetch(resultReq, workerEnv);
    expect(resultRes.status).toBe(200);

    const afterResultRaw = await env.PATCHES_KV.get(`app_version:${pkg}`);
    const afterResult = JSON.parse(afterResultRaw!) as AppVersionRecord;
    expect(afterResult.targetCompatibility?.status).toBe('compatible');
    expect(afterResult.outstandingRequest).toBeNull();
  });

  it('rejects POST /api/compatibility-results when gitRevision does not match run-start', async () => {
    const pkg = 'com.ashtoncofer.Buzz';
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      playVersion: '1.54.0',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      outstandingRequest: {
        requestId: 'req-git-rev-test',
        targetVersion: '1.54.0',
        playVersion: '1.54.0',
        expectedRoles: ['target'],
        dispatchedAt: '2026-10-06T00:00:00Z',
        gitRevision: 'correct_git_revision_123',
      },
    };
    await env.PATCHES_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    const req = new Request('http://localhost/api/compatibility-results', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify({
        requestId: 'req-git-rev-test',
        packageName: pkg,
        results: [
          {
            role: 'target',
            versionName: '1.54.0',
            versionCode: 100,
            patchBundleVersion: '1.4.0',
            gitRevision: 'wrong_git_revision_456',
            status: 'compatible',
            passedCount: 5,
            failedCount: 0,
          },
        ],
      }),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(409);
    const body = (await res.json()) as { error?: string };
    expect(body.error).toContain('Result git revision');
  });

  it('persists failureStage on error result and serves in public status payload', async () => {
    const pkg = 'com.ashtoncofer.Buzz';
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      playVersion: '1.54.0',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      outstandingRequest: {
        requestId: 'req-fail-stage',
        targetVersion: '1.54.0',
        playVersion: '1.54.0',
        expectedRoles: ['target'],
        dispatchedAt: '2026-10-06T00:00:00Z',
        gitRevision: 'rev123',
      },
    };
    await env.PATCHES_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    const req = new Request('http://localhost/api/compatibility-results', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify({
        requestId: 'req-fail-stage',
        packageName: pkg,
        results: [
          {
            role: 'target',
            versionName: '1.54.0',
            versionCode: 0,
            patchBundleVersion: '1.4.0',
            gitRevision: 'rev123',
            status: 'error',
            passedCount: 0,
            failedCount: 1,
            failureStage: 'acquisition',
            failureReason: 'Artifact not available on APKMirror or Play',
          },
        ],
      }),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(200);

    const savedRaw = await env.PATCHES_KV.get(`app_version:${pkg}`);
    const saved = JSON.parse(savedRaw!) as AppVersionRecord;
    expect(saved.targetCompatibility?.failureStage).toBe('acquisition');

    // Public status endpoint returns the failureStage
    const statusReq = new Request('http://localhost/api/status', {
      method: 'GET',
    });
    const statusRes = await worker.fetch(statusReq, workerEnv);
    expect(statusRes.status).toBe(200);
    const statusPayload = (await statusRes.json()) as KVVersionPayload;
    expect(statusPayload.apps[pkg].targetCompatibility?.failureStage).toBe(
      'acquisition',
    );
  });

  it('rejects invalid failureStage in result submission', async () => {
    const pkg = 'com.ashtoncofer.Buzz';
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_secret_abc',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      playVersion: '1.54.0',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      outstandingRequest: {
        requestId: 'req-bad-stage',
        targetVersion: '1.54.0',
        playVersion: '1.54.0',
        expectedRoles: ['target'],
        dispatchedAt: '2026-10-06T00:00:00Z',
        gitRevision: 'rev123',
      },
    };
    await env.PATCHES_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    const req = new Request('http://localhost/api/compatibility-results', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_secret_abc',
      },
      body: JSON.stringify({
        requestId: 'req-bad-stage',
        packageName: pkg,
        results: [
          {
            role: 'target',
            versionName: '1.54.0',
            versionCode: 0,
            patchBundleVersion: '1.4.0',
            gitRevision: 'rev123',
            status: 'error',
            passedCount: 0,
            failedCount: 1,
            failureStage: 'invalid-stage-name',
          },
        ],
      }),
    });

    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(400);
    const data = (await res.json()) as { error?: string };
    expect(data.error).toContain('failureStage');
  });

  it('scheduled performVersionCheck updates Google Play freshness only without making any GitHub dispatch calls', async () => {
    const pkg = 'com.ashtoncofer.Buzz';
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Fizz',
      playVersion: '1.53.0',
      checkedAt: '2026-10-06T00:00:00Z',
      status: 'up-to-date',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
      targetCompatibility: {
        requestId: 'req-prior',
        role: 'target',
        versionName: '1.54.0',
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
    await env.PATCHES_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    let githubCalled = false;
    const originalFetch = globalThis.fetch;
    globalThis.fetch = vi.fn(async (input: RequestInfo | URL) => {
      const url = typeof input === 'string' ? input : input.toString();
      if (url.includes('api.github.com')) {
        githubCalled = true;
        throw new Error(
          'GitHub API should never be called during scheduled check',
        );
      }
      if (url.includes('play.google.com')) {
        return new Response(MOCK_PLAY_HTML('1.55.0'), { status: 200 });
      }
      return new Response('Not found', { status: 404 });
    });

    try {
      await performVersionCheck(workerEnv);

      expect(githubCalled).toBe(false);

      const savedRaw = await env.PATCHES_KV.get(`app_version:${pkg}`);
      const saved = JSON.parse(savedRaw!) as AppVersionRecord;
      expect(saved.playVersion).toBe('1.55.0');
      expect(saved.status).toBe('newer-available');
      // Target compatibility result preserved from prior check
      expect(saved.targetCompatibility?.status).toBe('compatible');
      // No outstanding request created
      expect(saved.outstandingRequest).toBeNull();
    } finally {
      globalThis.fetch = originalFetch;
    }
  });
});
describe('Google Play store metadata scraping and status aggregation', () => {
  const SAMPLE_PLAY_HTML = `
    <html>
      <head>
        <meta property="og:image" content="https://play-lh.googleusercontent.com/test-icon">
        <meta property="og:description" content="Meta summary fallback">
      </head>
      <body>
        [[["2.5.0"]],[[[1]],[[[1]]]
        <div>Updated on</div><div>Oct 14, 2026</div>
        <script>
          AF_initDataCallback({key: 'ds:5', hash: '1', data: [
            null,
            [
              null,
              null,
              [
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              ["Acme Developer Corp &amp; Co"],
              null,
              null,
              null,
              [[null, "Full description with &lt;b&gt;bold&lt;/b&gt; text<br>New line &amp; more."]],
              [[null, "Structured summary for the app."]],
              null,
              null,
              null,
              null,
              null,
              [[["Business &amp; Productivity", null, "BUSINESS"]]],
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              [null, [null, "Bug fixes &amp; performance improvements!"]]
            ]
          ]
        ], sideChannel: {}});
        </script>
      </body>
    </html>
  `;

  it('parses structured ds:5 metadata and normalizes entities/HTML', () => {
    const parsed = parseGooglePlayHtml(SAMPLE_PLAY_HTML);
    expect(parsed.playVersion).toBe('2.5.0');
    expect(parsed.iconUrl).toBe(
      'https://play-lh.googleusercontent.com/test-icon',
    );
    expect(parsed.metadata.developer).toBe('Acme Developer Corp & Co');
    expect(parsed.metadata.summary).toBe('Structured summary for the app.');
    expect(parsed.metadata.category).toBe('Business & Productivity');
    expect(parsed.metadata.categoryId).toBe('BUSINESS');
    expect(parsed.metadata.description).toContain(
      'Full description with bold text',
    );
    expect(parsed.metadata.description).toContain('New line & more.');
    expect(parsed.metadata.releaseNotes).toBe(
      'Bug fixes & performance improvements!',
    );
  });

  it('persists playMetadata in KV and returns it in GET /api/status', async () => {
    const originalFetch = globalThis.fetch;
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
    };

    globalThis.fetch = vi.fn(async (input: RequestInfo | URL) => {
      const url = typeof input === 'string' ? input : input.toString();
      if (url.includes('play.google.com')) {
        return new Response(SAMPLE_PLAY_HTML, { status: 200 });
      }
      return new Response('Not found', { status: 404 });
    });

    try {
      await performVersionCheck(workerEnv);

      const req = new Request('http://localhost/api/status', { method: 'GET' });
      const res = await worker.fetch(req, workerEnv);
      expect(res.status).toBe(200);

      const payload = (await res.json()) as KVVersionPayload;
      expect(payload.apps).toBeDefined();
      const sampleApp = payload.apps['com.adobe.scan.android'];
      expect(sampleApp).toBeDefined();
      expect(sampleApp.playMetadata).toBeDefined();
      expect(sampleApp.playMetadata?.developer).toBe(
        'Acme Developer Corp & Co',
      );
      expect(sampleApp.playMetadata?.categoryId).toBe('BUSINESS');
      expect(sampleApp.playMetadata?.summary).toBe(
        'Structured summary for the app.',
      );
    } finally {
      globalThis.fetch = originalFetch;
    }
  });

  it('parses extended metadata from google-play-details.html fixture', () => {
    const parsed = parseGooglePlayHtml(fixtureHtml);
    expect(parsed.iconUrl).toBe(
      'https://play-lh.googleusercontent.com/test-icon=w240-h480',
    );
    expect(parsed.metadata.score).toBe(4.6);
    expect(parsed.metadata.ratingsCount).toBe(12345);
    expect(parsed.metadata.reviewsCount).toBe(6789);
    expect(parsed.metadata.installs).toBe('10M+');
    expect(parsed.metadata.contentRating).toBe('Everyone');
    expect(parsed.metadata.contentRatingIcon?.sourceUrl).toBe(
      'https://play-lh.googleusercontent.com/content-rating-icon',
    );
    expect(parsed.metadata.inAppPurchases).toBe('In-app purchases');
    expect(parsed.metadata.minAndroid).toBe('Android 8.0 and up');
    expect(parsed.metadata.releasedOn).toBe('Jan 15, 2020');
    expect(parsed.metadata.permissionGroups).toEqual([
      'Camera',
      'Microphone',
      'Storage',
    ]);

    // Screenshots (only valid host accepted, deceptive omitted)
    expect(parsed.metadata.screenshots?.length).toBe(2);
    expect(parsed.metadata.screenshots?.[0].sourceUrl).toBe(
      'https://play-lh.googleusercontent.com/screenshot1',
    );
    expect(parsed.metadata.screenshots?.[1].sourceUrl).toBe(
      'https://play-lh.googleusercontent.com/screenshot2',
    );

    // Reviews (capped at 3, deceptive host rejected for avatar)
    expect(parsed.metadata.featuredReviews?.length).toBe(3);
    expect(parsed.metadata.featuredReviews?.[0].author).toBe('Alice M.');
    expect(parsed.metadata.featuredReviews?.[0].rating).toBe(5);
    expect(parsed.metadata.featuredReviews?.[0].avatar?.sourceUrl).toBe(
      'https://play-lh.googleusercontent.com/avatar1',
    );
    expect(parsed.metadata.featuredReviews?.[1].author).toBe('Bob K.');
    expect(parsed.metadata.featuredReviews?.[1].avatar).toBeNull();
    expect(parsed.metadata.featuredReviews?.[2].author).toBe('Charlie D.');
  });

  it('enforces POST /api/play-metadata bearer secret, validation, and freshness updates', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
      COMPATIBILITY_STATUS_SECRET: 'test_metadata_secret_123',
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Adobe Scan',
      playVersion: '24.01.00',
      updatedAt: '2026-03-01T00:00:00.000Z',
      checkedAt: '2026-03-01T01:00:00.000Z',
      status: 'unknown',
      supportedVersions: ['24.01.00'],
      latestSupportedVersion: '24.01.00',
      needsAuthenticatedVersion: true,
    };
    await env.PATCHES_KV.put(
      'app_version:com.adobe.scan.android',
      JSON.stringify(initialRecord),
    );

    // 1. Unauthorized
    const unauthReq = new Request('http://localhost/api/play-metadata', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ results: [] }),
    });
    const unauthRes = await worker.fetch(unauthReq, workerEnv);
    expect(unauthRes.status).toBe(401);

    // 2. Stale listingUpdatedAt rejection (409)
    const staleReq = new Request('http://localhost/api/play-metadata', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_metadata_secret_123',
      },
      body: JSON.stringify({
        results: [
          {
            packageName: 'com.adobe.scan.android',
            versionName: '24.02.00',
            versionCode: 240200,
            listingUpdatedAt: '2025-01-01T00:00:00.000Z',
          },
        ],
      }),
    });
    const staleRes = await worker.fetch(staleReq, workerEnv);
    expect(staleRes.status).toBe(409);

    // 3. Valid submission applies atomically
    const validReq = new Request('http://localhost/api/play-metadata', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer test_metadata_secret_123',
      },
      body: JSON.stringify({
        results: [
          {
            packageName: 'com.adobe.scan.android',
            versionName: '24.02.00',
            versionCode: 240200,
            listingUpdatedAt: '2026-03-01T00:00:00.000Z',
          },
        ],
      }),
    });
    const validRes = await worker.fetch(validReq, workerEnv);
    expect(validRes.status).toBe(200);

    const savedRaw = await env.PATCHES_KV.get(
      'app_version:com.adobe.scan.android',
    );
    expect(savedRaw).toBeDefined();
    const saved = JSON.parse(savedRaw!) as AppVersionRecord;
    expect(saved.playVersion).toBe('24.02.00');
    expect(saved.playVersionCode).toBe(240200);
    expect(saved.playVersionSource).toBe('authenticated');
    expect(saved.playVersionVerifiedForUpdatedAt).toBe(
      '2026-03-01T00:00:00.000Z',
    );
    expect(saved.needsAuthenticatedVersion).toBe(false);
    expect(saved.status).toBe('newer-available');
  });

  it('serves public R2 media with immutable cache headers, HEAD, 304, and traversal rejection', async () => {
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
      PLAY_MEDIA: env.PLAY_MEDIA,
    };

    const testImageBytes = new Uint8Array([0x89, 0x50, 0x4e, 0x47]); // PNG header
    const hash = 'a'.repeat(64);
    const r2Key = `play-media/com.adobe.scan.android/${hash}.png`;

    await env.PLAY_MEDIA.put(r2Key, testImageBytes, {
      httpMetadata: {
        contentType: 'image/png',
        cacheControl: 'public, max-age=31536000, immutable',
      },
    });

    // 1. GET returns image and headers
    const getReq = new Request(
      `http://localhost/media/play/com.adobe.scan.android/${hash}.png`,
      {
        method: 'GET',
      },
    );
    const getRes = await worker.fetch(getReq, workerEnv);
    expect(getRes.status).toBe(200);
    expect(getRes.headers.get('content-type')).toBe('image/png');
    expect(getRes.headers.get('cache-control')).toContain('immutable');
    const etag = getRes.headers.get('etag');
    expect(etag).toBeDefined();

    // 2. If-None-Match returns 304
    const ifNoneReq = new Request(
      `http://localhost/media/play/com.adobe.scan.android/${hash}.png`,
      {
        method: 'GET',
        headers: { 'If-None-Match': etag! },
      },
    );
    const ifNoneRes = await worker.fetch(ifNoneReq, workerEnv);
    expect(ifNoneRes.status).toBe(304);

    // 3. HEAD method
    const headReq = new Request(
      `http://localhost/media/play/com.adobe.scan.android/${hash}.png`,
      {
        method: 'HEAD',
      },
    );
    const headRes = await worker.fetch(headReq, workerEnv);
    expect(headRes.status).toBe(200);
    expect(await headRes.text()).toBe('');

    // 4. Invalid media path rejection
    const invalidPathReq = new Request(
      `http://localhost/media/play/com.adobe.scan.android/invalid_file.png`,
      {
        method: 'GET',
      },
    );
    const invalidPathRes = await worker.fetch(invalidPathReq, workerEnv);
    expect(invalidPathRes.status).toBe(400);
  });

  it('retains fallbackPath for matching screenshots across scraping and does not re-mirror them', async () => {
    const pkg = 'com.adobe.scan.android';
    const workerEnv: WorkerEnv = {
      ...env,
      PATCHES_KV: env.PATCHES_KV,
      PLAY_MEDIA: env.PLAY_MEDIA,
    };

    const initialRecord: AppVersionRecord = {
      appName: 'Adobe Scan',
      playVersion: '24.01.00',
      iconUrl: 'https://play-lh.googleusercontent.com/test-icon=w240-h480',
      iconAsset: {
        sourceUrl: 'https://play-lh.googleusercontent.com/test-icon=w240-h480',
        fallbackPath: '/media/play/com.adobe.scan.android/prior-icon.png',
        width: 512,
        height: 512,
        alt: 'Adobe Scan icon',
      },
      updatedAt: '2026-03-01T00:00:00.000Z',
      checkedAt: '2026-03-01T01:00:00.000Z',
      status: 'up-to-date',
      supportedVersions: ['24.01.00'],
      latestSupportedVersion: '24.01.00',
      targetCompatibility: null,
      outstandingRequest: null,
      playMetadata: {
        summary: 'Scan documents',
        description: 'Scan documents to PDF',
        developer: 'Adobe',
        category: 'Productivity',
        categoryId: 'PRODUCTIVITY',
        releaseNotes: 'Updates',
        installs: '100M+',
        score: 4.7,
        ratingsCount: 1000000,
        reviewsCount: 500000,
        contentRating: 'Everyone',
        contentRatingIcon: {
          sourceUrl:
            'https://play-lh.googleusercontent.com/content-rating-icon',
          fallbackPath: '/media/play/com.adobe.scan.android/prior-rating.png',
          width: null,
          height: null,
          alt: 'Rating icon',
        },
        releasedOn: '2017-06-01',
        minAndroid: 'Android 8.0',
        inAppPurchases: null,
        permissionGroups: [],
        screenshots: [
          {
            sourceUrl: 'https://play-lh.googleusercontent.com/screenshot1',
            fallbackPath: '/media/play/com.adobe.scan.android/prior-shot1.png',
            width: 1080,
            height: 1920,
            alt: null,
          },
          {
            sourceUrl: 'https://play-lh.googleusercontent.com/screenshot2',
            fallbackPath: null,
            width: 1080,
            height: 1920,
            alt: null,
          },
        ],
        featuredReviews: [],
      },
    };
    await env.PATCHES_KV.put(
      `app_version:${pkg}`,
      JSON.stringify(initialRecord),
    );

    const fetchedMediaUrls: string[] = [];
    const testImageBytes = new Uint8Array([
      0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a,
    ]);
    const originalFetch = globalThis.fetch;
    globalThis.fetch = vi.fn(async (input: RequestInfo | URL) => {
      const url = typeof input === 'string' ? input : input.toString();
      if (
        url.includes(
          'play.google.com/store/apps/details?id=com.adobe.scan.android',
        )
      ) {
        return new Response(fixtureHtml, { status: 200 });
      }
      if (url.includes('play.google.com')) {
        return new Response('Not found', { status: 404 });
      }
      if (url.includes('play-lh.googleusercontent.com')) {
        fetchedMediaUrls.push(url);
        return new Response(testImageBytes, {
          status: 200,
          headers: {
            'content-type': 'image/png',
            'content-length': testImageBytes.length.toString(),
          },
        });
      }
      return new Response('Not found', { status: 404 });
    });

    try {
      await performVersionCheck(workerEnv);

      // Verify screenshot1, iconAsset, and contentRatingIcon were NOT fetched again
      expect(fetchedMediaUrls).not.toContain(
        'https://play-lh.googleusercontent.com/screenshot1',
      );
      expect(fetchedMediaUrls).not.toContain(
        'https://play-lh.googleusercontent.com/test-icon=w240-h480',
      );
      expect(fetchedMediaUrls).not.toContain(
        'https://play-lh.googleusercontent.com/content-rating-icon',
      );
      // screenshot2 had no fallbackPath, so it should be mirrored
      expect(fetchedMediaUrls).toContain(
        'https://play-lh.googleusercontent.com/screenshot2',
      );

      const savedRaw = await env.PATCHES_KV.get(`app_version:${pkg}`);
      const saved = JSON.parse(savedRaw!) as AppVersionRecord;

      expect(saved.iconAsset?.fallbackPath).toBe(
        '/media/play/com.adobe.scan.android/prior-icon.png',
      );
      expect(saved.playMetadata?.contentRatingIcon?.fallbackPath).toBe(
        '/media/play/com.adobe.scan.android/prior-rating.png',
      );

      const screenshots = saved.playMetadata?.screenshots ?? [];
      expect(screenshots).toHaveLength(2);
      expect(screenshots[0].sourceUrl).toBe(
        'https://play-lh.googleusercontent.com/screenshot1',
      );
      expect(screenshots[0].fallbackPath).toBe(
        '/media/play/com.adobe.scan.android/prior-shot1.png',
      );
      expect(screenshots[1].sourceUrl).toBe(
        'https://play-lh.googleusercontent.com/screenshot2',
      );
      expect(screenshots[1].fallbackPath).not.toBeNull();
      expect(screenshots[1].fallbackPath).toMatch(
        /^\/media\/play\/com\.adobe\.scan\.android\/[a-f0-9]{64}\.png$/,
      );
    } finally {
      globalThis.fetch = originalFetch;
    }
  });

  it('reconciles media assets and lists correctly', () => {
    expect(reconcileMediaAsset(null, null)).toBeNull();
    expect(reconcileMediaAsset(undefined, null)).toBeNull();

    const newAsset = {
      sourceUrl: 'https://example.com/img.png',
      fallbackPath: null,
      width: 100,
      height: 100,
      alt: 'new alt',
    };
    const priorAsset = {
      sourceUrl: 'https://example.com/img.png',
      fallbackPath: '/media/play/img.png',
      width: 50,
      height: 50,
      alt: 'old alt',
    };
    const reconciled = reconcileMediaAsset(newAsset, priorAsset);
    expect(reconciled?.fallbackPath).toBe('/media/play/img.png');
    expect(reconciled?.alt).toBe('new alt');

    const diffAsset = {
      sourceUrl: 'https://example.com/other.png',
      fallbackPath: null,
      width: 100,
      height: 100,
      alt: null,
    };
    expect(reconcileMediaAsset(diffAsset, priorAsset)?.fallbackPath).toBeNull();

    const newScreenshots = [
      {
        sourceUrl: 'https://example.com/1.png',
        fallbackPath: null,
        width: null,
        height: null,
        alt: null,
      },
      {
        sourceUrl: 'https://example.com/2.png',
        fallbackPath: null,
        width: null,
        height: null,
        alt: null,
      },
    ];
    const priorScreenshots = [
      {
        sourceUrl: 'https://example.com/1.png',
        fallbackPath: '/path/1.png',
        width: null,
        height: null,
        alt: null,
      },
    ];
    const reconciledList = reconcileMediaAssetsList(
      newScreenshots,
      priorScreenshots,
    );
    expect(reconciledList[0].fallbackPath).toBe('/path/1.png');
    expect(reconciledList[1].fallbackPath).toBeNull();

    const newReviews = [
      {
        author: 'User A',
        rating: 5,
        date: null,
        text: 'Great',
        helpfulCount: 0,
        avatar: {
          sourceUrl: 'https://example.com/a.png',
          fallbackPath: null,
          width: null,
          height: null,
          alt: null,
        },
      },
      {
        author: 'User B',
        rating: 4,
        date: null,
        text: 'Good',
        helpfulCount: 0,
        avatar: null,
      },
    ];
    const priorReviews = [
      {
        author: 'User A',
        rating: 5,
        date: null,
        text: 'Great',
        helpfulCount: 0,
        avatar: {
          sourceUrl: 'https://example.com/a.png',
          fallbackPath: '/path/a.png',
          width: null,
          height: null,
          alt: null,
        },
      },
    ];
    const reconciledReviews = reconcileReviews(newReviews, priorReviews);
    expect(reconciledReviews[0].avatar?.fallbackPath).toBe('/path/a.png');
    expect(reconciledReviews[1].avatar).toBeNull();
  });
});

describe('Version API endpoint (/api/version/:packageName)', () => {
  const workerEnv: WorkerEnv = {
    PATCHES_KV: env.PATCHES_KV,
  };

  it('returns 200 with version payload and public CORS for valid package', async () => {
    const buzzRecord: AppVersionRecord = {
      appName: 'Fizz',
      playVersion: '1.60.0',
      playVersionCode: 400032,
      checkedAt: '2026-10-21T20:48:51.000Z',
      updatedAt: '2026-10-21T20:48:51.000Z',
      status: 'fresh',
      supportedVersions: ['1.54.0'],
      latestSupportedVersion: '1.54.0',
    };
    await saveAppRecord(workerEnv, 'com.ashtoncofer.Buzz', buzzRecord);

    const req = new Request(
      'http://localhost/api/version/com.ashtoncofer.Buzz',
      {
        method: 'GET',
      },
    );
    const res = await worker.fetch(req, workerEnv);

    expect(res.status).toBe(200);
    expect(res.headers.get('Content-Type')).toContain('application/json');
    expect(res.headers.get('Cache-Control')).toBe('public, max-age=3600');
    expect(res.headers.get('Access-Control-Allow-Origin')).toBe('*');

    const data = (await res.json()) as {
      packageName: string;
      versionName: string;
      versionCode: number;
      updatedAt: string;
    };
    expect(data.packageName).toBe('com.ashtoncofer.Buzz');
    expect(data.versionName).toBe('1.60.0');
    expect(data.versionCode).toBe(400032);
    expect(data.updatedAt).toBe('2026-10-21T20:48:51.000Z');
  });

  it('resolves "fizz" alias to com.ashtoncofer.Buzz', async () => {
    const req = new Request('http://localhost/api/version/fizz', {
      method: 'GET',
    });
    const res = await worker.fetch(req, workerEnv);

    expect(res.status).toBe(200);
    const data = (await res.json()) as {
      packageName: string;
      versionName: string;
    };
    expect(data.packageName).toBe('com.ashtoncofer.Buzz');
    expect(data.versionName).toBe('1.60.0');
  });

  it('returns 404 for unknown package or missing playVersion', async () => {
    const req = new Request('http://localhost/api/version/com.unknown.app', {
      method: 'GET',
    });
    const res = await worker.fetch(req, workerEnv);

    expect(res.status).toBe(404);
    const data = (await res.json()) as { error: string };
    expect(data.error).toBe('App version not found');
    expect(res.headers.get('Access-Control-Allow-Origin')).toBe('*');
  });

  it('returns 400 when package name is missing', async () => {
    const req1 = new Request('http://localhost/api/version', { method: 'GET' });
    const res1 = await worker.fetch(req1, workerEnv);
    expect(res1.status).toBe(400);
    const data1 = (await res1.json()) as { error: string };
    expect(data1.error).toBe('Missing package name');

    const req2 = new Request('http://localhost/api/version/', {
      method: 'GET',
    });
    const res2 = await worker.fetch(req2, workerEnv);
    expect(res2.status).toBe(400);
  });

  it('handles HEAD request with 200 and empty body', async () => {
    const req = new Request(
      'http://localhost/api/version/com.ashtoncofer.Buzz',
      {
        method: 'HEAD',
      },
    );
    const res = await worker.fetch(req, workerEnv);
    expect(res.status).toBe(200);
    expect(res.headers.get('Content-Type')).toContain('application/json');
    expect(await res.text()).toBe('');
  });
});
