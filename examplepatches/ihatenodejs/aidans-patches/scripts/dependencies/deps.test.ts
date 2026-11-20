import { describe, expect, test } from 'bun:test';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';
import { applyApprovedProposal } from './apply';
import {
  collectInventory,
  extractKtlintVersion,
  parseBunLock,
  parseBunLockPackages,
  parsePythonRequirement,
} from './inventory';
import {
  type DependencyItem,
  type DependencyPolicy,
  type Proposal,
  canonicalJson,
  computeProposalDigest,
  loadAndValidatePolicy,
} from './model';
import { buildSummary, formatTextReport, isMajorUpdate } from './report';
import {
  SourceManager,
  comparePep440,
  compareSemver,
  parsePep440,
  resolveDependencyItem,
} from './sources';

describe('Model & Policy', () => {
  test('canonicalJson produces deterministic sorted key string', () => {
    const a = { b: 2, a: 1, c: { y: 20, x: 10 } };
    const b = { c: { x: 10, y: 20 }, a: 1, b: 2 };
    expect(canonicalJson(a)).toBe(canonicalJson(b));
    expect(canonicalJson(a)).toBe('{"a":1,"b":2,"c":{"x":10,"y":20}}');
  });

  test('computeProposalDigest computes SHA-256 over sorted inputs and updates', () => {
    const inputs = [
      { path: 'b.json', sha256: '2222' },
      { path: 'a.json', sha256: '1111' },
    ];
    const updates = [
      { id: 'npm:b', from: '1.0.0', to: '2.0.0' },
      { id: 'npm:a', from: '1.0.0', to: '2.0.0' },
    ];
    const digest1 = computeProposalDigest(inputs, updates);
    const digest2 = computeProposalDigest(
      [...inputs].reverse(),
      [...updates].reverse(),
    );
    expect(digest1).toBe(digest2);
    expect(digest1).toMatch(/^[a-f0-9]{64}$/);
  });

  test('loadAndValidatePolicy parses valid policy and enforces non-empty reasons', () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'policy-test-'));
    try {
      const validPolicy = {
        schemaVersion: 1,
        holds: [
          { id: 'npm:pkg', value: '^1.0.0', reason: 'Compat with legacy' },
        ],
      };
      fs.writeFileSync(
        path.join(tmpDir, 'dependency-policy.json'),
        JSON.stringify(validPolicy),
      );
      const p = loadAndValidatePolicy(tmpDir);
      expect(p.schemaVersion).toBe(1);
      expect(p.holds.length).toBe(1);
      expect(p.holds[0].id).toBe('npm:pkg');

      // Empty reason rejection
      const invalidPolicy = {
        schemaVersion: 1,
        holds: [{ id: 'npm:pkg', value: '^1.0.0', reason: '   ' }],
      };
      fs.writeFileSync(
        path.join(tmpDir, 'dependency-policy.json'),
        JSON.stringify(invalidPolicy),
      );
      expect(() => loadAndValidatePolicy(tmpDir)).toThrow(
        'mandatory non-empty text',
      );

      // Duplicate ID rejection
      const dupPolicy = {
        schemaVersion: 1,
        holds: [
          { id: 'npm:pkg', value: '^1.0.0', reason: 'R1' },
          { id: 'npm:pkg', value: '^1.0.0', reason: 'R2' },
        ],
      };
      fs.writeFileSync(
        path.join(tmpDir, 'dependency-policy.json'),
        JSON.stringify(dupPolicy),
      );
      expect(() => loadAndValidatePolicy(tmpDir)).toThrow('Duplicate hold id');
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });
});

describe('Sources & Version Logic', () => {
  test('compareSemver orders correctly', () => {
    expect(compareSemver('1.0.0', '1.0.1')).toBe(-1);
    expect(compareSemver('2.0.0', '1.9.9')).toBe(1);
    expect(compareSemver('^1.2.3', '1.2.3')).toBe(0);
    expect(compareSemver('v2.5.0', '2.5.0')).toBe(0);
  });

  test('PEP 440 parsing and comparison', () => {
    expect(parsePep440('>=1.35.0')).toEqual([1, 35, 0]);
    expect(comparePep440('1.35.1', '1.35.0')).toBe(1);
    expect(comparePep440('1.35.0', '1.35.0')).toBe(0);
    expect(comparePep440('1.34.9', '1.35.0')).toBe(-1);
  });

  test('isMajorUpdate detects major version changes', () => {
    expect(isMajorUpdate('^9.3.1', '10.0.0')).toBe(true);
    expect(isMajorUpdate('1.5.0', '1.6.0')).toBe(false);
    expect(isMajorUpdate('0.13.3', '0.14.0')).toBe(false);
  });

  test('SourceManager resolves npm, pypi, and crates with mocked fetch', async () => {
    const mockFetch = async (url: string) => {
      if (url.includes('registry.npmjs.org/wrangler')) {
        return new Response(
          JSON.stringify({
            'dist-tags': { latest: '3.120.0' },
            versions: { '3.119.0': {}, '3.120.0': {} },
          }),
        );
      }
      if (url.includes('pypi.org/pypi/boto3/json')) {
        return new Response(
          JSON.stringify({
            releases: {
              '1.36.0': [{ yanked: false, requires_python: '>=3.8' }],
              '1.37.0a1': [{ yanked: false }],
            },
          }),
        );
      }
      if (url.includes('crates.io/api/v1/crates/serde')) {
        return new Response(
          JSON.stringify({
            versions: [
              { num: '1.0.218', yanked: false },
              { num: '1.0.219', yanked: false },
            ],
          }),
        );
      }
      return new Response('Not Found', { status: 404 });
    };

    const sources = new SourceManager({ fetch: mockFetch });
    const npmRes = await sources.resolveNpm('wrangler');
    expect(npmRes.latest).toBe('3.120.0');

    const pypiRes = await sources.resolvePypi('boto3');
    expect(pypiRes.latest).toBe('1.36.0');

    const cratesRes = await sources.resolveCrates('serde');
    expect(cratesRes.latest).toBe('1.0.219');
  });

  test('SourceManager detects python requirement incompatibility', async () => {
    const mockFetch = async () => {
      return new Response(
        JSON.stringify({
          releases: {
            '2.0.0': [{ yanked: false, requires_python: '>=3.14' }],
            '1.5.0': [{ yanked: false, requires_python: '>=3.10' }],
          },
        }),
      );
    };

    const sources = new SourceManager({ fetch: mockFetch });
    const pypiRes = await sources.resolvePypi('test-pkg');
    expect(pypiRes.blocked).toBe(true);
    expect(pypiRes.latest).toBe('2.0.0');
    expect(pypiRes.reason).toContain('requires newer Python');
  });

  test('SourceManager compares full semver strings for GitHub Actions', async () => {
    const mockFetch = async (url: string) => {
      if (url.includes('api.github.com/repos/actions/setup-java/releases')) {
        return new Response(
          JSON.stringify([
            { tag_name: 'v6.1.0', draft: false, prerelease: false },
            { tag_name: 'v6.0.1', draft: false, prerelease: false },
          ]),
        );
      }
      return new Response('Not Found', { status: 404 });
    };

    const sources = new SourceManager({ fetch: mockFetch });
    const items: DependencyItem[] = [
      {
        id: 'action:.github/workflows/ci.yml#actions/setup-java',
        ecosystem: 'action',
        name: 'actions/setup-java',
        locations: ['.github/workflows/ci.yml:10'],
        declared: 'v6.0.1',
        resolved: 'v6.0.1',
        latest: null,
        status: 'current',
      },
    ];

    await resolveDependencyItem(items[0], sources);
    expect(items[0].latest).toBe('6.1.0');
    expect(items[0].status).toBe('update');

    // Same version remains current
    const currentItems: DependencyItem[] = [
      {
        id: 'action:.github/workflows/ci.yml#actions/setup-java',
        ecosystem: 'action',
        name: 'actions/setup-java',
        locations: ['.github/workflows/ci.yml:10'],
        declared: 'v6.1.0',
        resolved: 'v6.1.0',
        latest: null,
        status: 'current',
      },
    ];
    await resolveDependencyItem(currentItems[0], sources);
    expect(currentItems[0].status).toBe('current');
  });
});

describe('Inventory Collection', () => {
  test('parsePythonRequirement parses names and constraints', () => {
    expect(parsePythonRequirement('boto3>=1.35.0')).toEqual({
      name: 'boto3',
      constraint: '>=1.35.0',
    });
    expect(parsePythonRequirement('goopdl==1.2.1')).toEqual({
      name: 'goopdl',
      constraint: '==1.2.1',
    });
    expect(parsePythonRequirement('hatchling')).toEqual({
      name: 'hatchling',
      constraint: '',
    });
  });

  test('collectInventory extracts items and marks holds accurately', () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'inv-test-'));
    try {
      const packageJson = {
        name: 'test-root',
        devDependencies: {
          oxlint: '^1.87.0',
          prettier: '^3.9.9',
        },
      };
      fs.writeFileSync(
        path.join(tmpDir, 'package.json'),
        JSON.stringify(packageJson, null, 2),
      );

      const policy: DependencyPolicy = {
        schemaVersion: 1,
        holds: [
          {
            id: 'npm:package.json#devDependencies/prettier',
            value: '^3.9.9',
            reason: 'Fixed style',
          },
        ],
      };
      fs.writeFileSync(
        path.join(tmpDir, 'dependency-policy.json'),
        JSON.stringify(policy, null, 2),
      );

      const { items, inputs } = collectInventory(tmpDir, policy);
      expect(items.length).toBe(2);
      expect(inputs.some((i) => i.path === 'package.json')).toBe(true);

      const oxlintItem = items.find((i) => i.name === 'oxlint');
      expect(oxlintItem?.status).toBe('current');

      const prettierItem = items.find((i) => i.name === 'prettier');
      expect(prettierItem?.status).toBe('held');
      expect(prettierItem?.reason).toBe('Fixed style');
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });
  test('collectInventory extracts CMake FetchContent and Gradle catalog dependencies', () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'inv-cmake-test-'));
    try {
      const cmakeDir = path.join(tmpDir, 'extensions', 'adobescan-pdf-native');
      fs.mkdirSync(cmakeDir, { recursive: true });
      fs.writeFileSync(
        path.join(cmakeDir, 'CMakeLists.txt'),
        `FetchContent_Declare(
    libjpeg-turbo
    URL https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/3.2.0/libjpeg-turbo-3.2.0.tar.gz
    URL_HASH SHA256=6f30092cef9fb839779646608f4ee14ae3cbac989c47fa05e841b0841f09878e
)
FetchContent_Declare(
    tesseract
    URL https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.5.1.tar.gz
    URL_HASH SHA256=a7a3f2a7420cb6a6a94d80c24163e183cf1d2f1bed2df3bbc397c81808a57237
)`,
      );

      const gradleDir = path.join(tmpDir, 'gradle');
      fs.mkdirSync(gradleDir, { recursive: true });
      fs.writeFileSync(
        path.join(gradleDir, 'libs.versions.toml'),
        `[versions]
pdfbox-android = "2.0.27.0"

[libraries]
pdfbox-android = { module = "com.tom-roush:pdfbox-android", version.ref = "pdfbox-android" }
`,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };
      const { items, inputs } = collectInventory(tmpDir, policy);

      const jpegItem = items.find((i) => i.name === 'libjpeg-turbo');
      expect(jpegItem?.declared).toBe('3.2.0');
      expect(jpegItem?.ecosystem).toBe('cmake');

      const tessItem = items.find((i) => i.name === 'tesseract');
      expect(tessItem?.declared).toBe('5.5.1');
      expect(tessItem?.ecosystem).toBe('cmake');

      const pdfboxItem = items.find(
        (i) => i.name === 'com.tom-roush:pdfbox-android',
      );
      expect(pdfboxItem?.declared).toBe('2.0.27.0');
      expect(pdfboxItem?.ecosystem).toBe('gradle');

      expect(
        inputs.some(
          (i) => i.path === 'extensions/adobescan-pdf-native/CMakeLists.txt',
        ),
      ).toBe(true);
      expect(inputs.some((i) => i.path === 'gradle/libs.versions.toml')).toBe(
        true,
      );
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('parseBunLock parses mock bun.lock with trailing commas', () => {
    const mockBunLock = `{
      "lockfileVersion": 2,
      "workspaces": {
        "": {
          "devDependencies": {
            "prettier": "^3.9.9",
          },
        },
      },
      "packages": {
        "prettier": ["prettier@3.9.9", "", {}, "sha512-abc",],
      },
    }`;
    const parsed = parseBunLock(mockBunLock);
    expect(parsed.lockfileVersion).toBe(2);
    const pkgs = parseBunLockPackages(mockBunLock);
    expect(pkgs.prettier).toBeDefined();
  });

  test('extractKtlintVersion parses const KTLINT_VERSION declaration', () => {
    const mockAudit = `// ktlint pinned version
const KTLINT_VERSION = '1.6.0';
const KTLINT_SHA256 = 'abc...';
`;
    expect(extractKtlintVersion(mockAudit)).toBe('1.6.0');
  });
});

describe('Report Formatting', () => {
  test('buildSummary counts item statuses', () => {
    const items: DependencyItem[] = [
      {
        id: '1',
        ecosystem: 'npm',
        name: 'a',
        locations: [],
        declared: '1',
        resolved: '1',
        latest: '2',
        status: 'update',
      },
      {
        id: '2',
        ecosystem: 'npm',
        name: 'b',
        locations: [],
        declared: '1',
        resolved: '1',
        latest: '1',
        status: 'current',
      },
      {
        id: '3',
        ecosystem: 'npm',
        name: 'c',
        locations: [],
        declared: '1',
        resolved: '1',
        latest: '2',
        status: 'held',
        reason: 'Stay on 1',
      },
    ];
    const s = buildSummary(items, 150);
    expect(s.total).toBe(3);
    expect(s.update).toBe(1);
    expect(s.current).toBe(1);
    expect(s.held).toBe(1);
    expect(s.durationMs).toBe(150);
  });

  test('formatTextReport outputs formatted report with proposal digest', () => {
    const items: DependencyItem[] = [
      {
        id: 'npm:package.json#devDependencies/foo',
        ecosystem: 'npm',
        name: 'foo',
        locations: ['package.json'],
        declared: '^1.0.0',
        resolved: '1.0.0',
        latest: '2.0.0',
        status: 'update',
      },
    ];
    const report = {
      schemaVersion: 1 as const,
      items,
      summary: buildSummary(items, 100),
      proposal: {
        schemaVersion: 1 as const,
        inputs: [{ path: 'package.json', sha256: 'abc' }],
        updates: [
          {
            id: 'npm:package.json#devDependencies/foo',
            from: '1.0.0',
            to: '2.0.0',
          },
        ],
        digest:
          '1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef',
      },
    };
    const output = formatTextReport(report, false);
    expect(output).toContain('REPOSITORY DEPENDENCY FRESHNESS AUDIT');
    expect(output).toContain('foo');
    expect(output).toContain('MAJOR UPDATE');
    expect(output).toContain('Proposal SHA-256 Digest: 1234567890abcdef');
  });

  test('formatTextReport formats unsupported dependencies with warning indicator', () => {
    const items: DependencyItem[] = [
      {
        id: 'tool:custom',
        ecosystem: 'tool',
        name: 'custom-tool',
        locations: ['config.json'],
        declared: '1.0.0',
        resolved: '1.0.0',
        latest: null,
        status: 'unsupported',
        reason: 'Platform not supported',
      },
    ];
    const report = {
      schemaVersion: 1 as const,
      items,
      summary: buildSummary(items, 50),
      proposal: null,
    };
    const output = formatTextReport(report, false);
    expect(output).toContain('custom-tool');
    expect(output).toContain('unsupported');
    expect(output).toContain('UNSUPPORTED: 1');
  });
});

describe('Transactional Apply', () => {
  test('applyApprovedProposal validates digest and updates manifest in staging before writing', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-test-'));
    try {
      const pkgJson = {
        name: 'test-app',
        devDependencies: {
          wrangler: '^3.111.0',
        },
      };
      const pkgPath = path.join(tmpDir, 'package.json');
      fs.writeFileSync(pkgPath, JSON.stringify(pkgJson, null, 2) + '\n');
      const sha256 = fs.readFileSync(pkgPath);
      const fileSha = Bun.SHA256.hash(sha256, 'hex');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: 'package.json', sha256: fileSha }],
        updates: [
          {
            id: 'npm:package.json#devDependencies/wrangler',
            from: '3.111.0',
            to: '3.120.0',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };

      // Mock runner that simulates bun install --lockfile-only
      const mockRunner = async (_cmd: string, args: string[], cwd: string) => {
        if (args.includes('--lockfile-only')) {
          fs.writeFileSync(path.join(cwd, 'bun.lock'), 'mock lock');
        }
        if (args.includes('--package-lock-only')) {
          fs.writeFileSync(
            path.join(cwd, 'package-lock.json'),
            'mock npm lock',
          );
        }
        return { code: 0, stdout: 'ok', stderr: '' };
      };

      const res = await applyApprovedProposal(tmpDir, proposal, policy, {
        runner: mockRunner,
      });
      expect(res.success).toBe(true);
      expect(res.changedFiles).toContain('package.json');

      const updatedJson = JSON.parse(fs.readFileSync(pkgPath, 'utf8'));
      expect(updatedJson.devDependencies.wrangler).toBe('^3.120.0');
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal rejects tampered inputs or mismatching digest', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-tamper-'));
    try {
      const pkgPath = path.join(tmpDir, 'package.json');
      fs.writeFileSync(pkgPath, '{"name":"tamper"}');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: 'package.json', sha256: 'wrong-hash' }],
        updates: [
          { id: 'npm:package.json#devDependencies/x', from: '1', to: '2' },
        ],
        digest: 'wrong-digest',
      };
      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };

      expect(applyApprovedProposal(tmpDir, proposal, policy)).rejects.toThrow(
        'Proposal digest verification failed',
      );
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal rejects update for held dependency', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-held-'));
    try {
      const pkgPath = path.join(tmpDir, 'package.json');
      fs.writeFileSync(pkgPath, '{"name":"held"}');
      const sha256 = Bun.SHA256.hash(fs.readFileSync(pkgPath), 'hex');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: 'package.json', sha256 }],
        updates: [
          {
            id: 'npm:package.json#devDependencies/held-pkg',
            from: '1.0.0',
            to: '2.0.0',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = {
        schemaVersion: 1,
        holds: [
          {
            id: 'npm:package.json#devDependencies/held-pkg',
            value: '1.0.0',
            reason: 'Do not touch',
          },
        ],
      };

      expect(applyApprovedProposal(tmpDir, proposal, policy)).rejects.toThrow(
        'Cannot apply update to held dependency',
      );
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal correctly rewrites PyPI constraint without duplicate quotes', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-pypi-'));
    try {
      const pyprojectDir = path.join(tmpDir, 'tools', 'apk-lab');
      fs.mkdirSync(pyprojectDir, { recursive: true });
      const pyprojectRel = 'tools/apk-lab/pyproject.toml';
      const pyprojectPath = path.join(tmpDir, pyprojectRel);
      const initialContent =
        '[project]\nname = "apk-lab"\ndependencies = [\n    "boto3>=1.35.0",\n]\n';
      fs.writeFileSync(pyprojectPath, initialContent);
      const sha256 = Bun.SHA256.hash(fs.readFileSync(pyprojectPath), 'hex');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: pyprojectRel, sha256 }],
        updates: [
          {
            id: `pypi:${pyprojectRel}#project.dependencies/boto3`,
            from: '1.35.0',
            to: '1.36.0',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };

      let executedCmd = '';
      let executedArgs: string[] = [];
      const mockRunner = async (cmd: string, args: string[], cwd: string) => {
        executedCmd = cmd;
        executedArgs = args;
        fs.writeFileSync(path.join(cwd, 'uv.lock'), 'mock uv lock');
        return { code: 0, stdout: 'ok', stderr: '' };
      };

      const res = await applyApprovedProposal(tmpDir, proposal, policy, {
        runner: mockRunner,
      });
      expect(res.success).toBe(true);
      expect(res.changedFiles).toContain(pyprojectRel);

      const updatedContent = fs.readFileSync(pyprojectPath, 'utf8');
      expect(updatedContent).toContain('"boto3>=1.36.0"');
      expect(updatedContent).not.toContain('""boto3');
      expect(executedCmd).toBe('uv');
      expect(executedArgs).toContain('boto3');
      expect(executedArgs).not.toContain('apk-lab');
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal correctly updates version catalog entry in gradle/libs.versions.toml', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-gradle-'));
    try {
      const gradleDir = path.join(tmpDir, 'gradle');
      fs.mkdirSync(gradleDir, { recursive: true });
      const catalogRel = 'gradle/libs.versions.toml';
      const catalogPath = path.join(tmpDir, catalogRel);
      const initialContent =
        '[versions]\nagp = "8.2.0"\nkotlin = "1.9.20"\n\n[libraries]\n';
      fs.writeFileSync(catalogPath, initialContent);
      const sha256 = Bun.SHA256.hash(fs.readFileSync(catalogPath), 'hex');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: catalogRel, sha256 }],
        updates: [
          {
            id: `gradle:${catalogRel}#versions/agp`,
            from: '8.2.0',
            to: '8.3.0',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };

      const res = await applyApprovedProposal(tmpDir, proposal, policy);
      expect(res.success).toBe(true);
      expect(res.changedFiles).toContain(catalogRel);

      const updatedContent = fs.readFileSync(catalogPath, 'utf8');
      expect(updatedContent).toContain('agp = "8.3.0"');
      expect(updatedContent).toContain('kotlin = "1.9.20"');
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });
  test('applyApprovedProposal correctly updates CMake FetchContent block', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-cmake-'));
    try {
      const cmakeRel = 'extensions/adobescan-pdf-native/CMakeLists.txt';
      const cmakePath = path.join(tmpDir, cmakeRel);
      fs.mkdirSync(path.dirname(cmakePath), { recursive: true });
      const initialContent = `FetchContent_Declare(
    tesseract
    URL https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.5.1.tar.gz
    URL_HASH SHA256=a7a3f2a7420cb6a6a94d80c24163e183cf1d2f1bed2df3bbc397c81808a57237
)`;
      fs.writeFileSync(cmakePath, initialContent);
      const sha256 = Bun.SHA256.hash(fs.readFileSync(cmakePath), 'hex');

      const newFakeSha =
        '111122223333444455556666777788889999aaaabbbbccccddddeeeeffff0000';
      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: cmakeRel, sha256 }],
        updates: [
          {
            id: `cmake:${cmakeRel}#fetch/tesseract`,
            from: '5.5.1',
            to: '5.5.3',
            assetIdentity: newFakeSha,
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };
      const res = await applyApprovedProposal(tmpDir, proposal, policy);
      expect(res.success).toBe(true);
      expect(res.changedFiles).toContain(cmakeRel);

      const updatedContent = fs.readFileSync(cmakePath, 'utf8');
      expect(updatedContent).toContain(
        'https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.5.3.tar.gz',
      );
      expect(updatedContent).toContain(`URL_HASH SHA256=${newFakeSha}`);
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal falls back to from-to replacement for non-named FetchContent package without assetIdentity', async () => {
    const tmpDir = fs.mkdtempSync(
      path.join(os.tmpdir(), 'apply-cmake-fallback-'),
    );
    const origFetch = globalThis.fetch;
    try {
      const cmakeRel = 'extensions/adobescan-pdf-native/CMakeLists.txt';
      const cmakePath = path.join(tmpDir, cmakeRel);
      fs.mkdirSync(path.dirname(cmakePath), { recursive: true });
      const initialContent = `FetchContent_Declare(
    foo
    URL https://example.com/packages/foo-1.0.0.tar.gz
    URL_HASH SHA256=1111111111111111111111111111111111111111111111111111111111111111
)`;
      fs.writeFileSync(cmakePath, initialContent);
      const sha256 = Bun.SHA256.hash(fs.readFileSync(cmakePath), 'hex');

      const fakeArchiveContent = 'archive-payload-bytes';
      const expectedSha256 = Bun.SHA256.hash(fakeArchiveContent, 'hex');
      globalThis.fetch = (async () => {
        return new Response(fakeArchiveContent, { status: 200 });
      }) as typeof fetch;

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: cmakeRel, sha256 }],
        updates: [
          {
            id: `cmake:${cmakeRel}#fetch/foo`,
            from: '1.0.0',
            to: '2.0.0',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };
      const res = await applyApprovedProposal(tmpDir, proposal, policy);
      expect(res.success).toBe(true);
      expect(res.changedFiles).toContain(cmakeRel);

      const updatedContent = fs.readFileSync(cmakePath, 'utf8');
      expect(updatedContent).toContain(
        'https://example.com/packages/foo-2.0.0.tar.gz',
      );
      expect(updatedContent).toContain(`URL_HASH SHA256=${expectedSha256}`);
    } finally {
      globalThis.fetch = origFetch;
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal correctly updates scoped NPM package in package.json', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-scoped-npm-'));
    try {
      const pkgJson = {
        name: 'test-app',
        devDependencies: {
          '@semantic-release/github': '^10.0.0',
        },
      };
      const pkgPath = path.join(tmpDir, 'package.json');
      fs.writeFileSync(pkgPath, JSON.stringify(pkgJson, null, 2) + '\n');
      const fileSha = Bun.SHA256.hash(fs.readFileSync(pkgPath), 'hex');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: 'package.json', sha256: fileSha }],
        updates: [
          {
            id: 'npm:package.json#devDependencies/@semantic-release/github',
            from: '10.0.0',
            to: '10.1.0',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };
      const mockRunner = async (_cmd: string, args: string[], cwd: string) => {
        if (args.includes('--package-lock-only')) {
          fs.writeFileSync(
            path.join(cwd, 'package-lock.json'),
            'mock npm lock',
          );
        }
        return { code: 0, stdout: 'ok', stderr: '' };
      };

      const res = await applyApprovedProposal(tmpDir, proposal, policy, {
        runner: mockRunner,
      });
      expect(res.success).toBe(true);
      expect(res.changedFiles).toContain('package.json');

      const updatedJson = JSON.parse(fs.readFileSync(pkgPath, 'utf8'));
      expect(updatedJson.devDependencies['@semantic-release/github']).toBe(
        '^10.1.0',
      );
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal updates PyPI package while preserving prefix-sharing packages', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-pypi-prefix-'));
    try {
      const pyprojectDir = path.join(tmpDir, 'tools', 'apk-lab');
      fs.mkdirSync(pyprojectDir, { recursive: true });
      const pyprojectRel = 'tools/apk-lab/pyproject.toml';
      const pyprojectPath = path.join(tmpDir, pyprojectRel);
      const initialContent =
        '[project]\nname = "apk-lab"\ndependencies = [\n    "pytest>=8.0.0",\n    "pytest-cov>=4.0.0",\n]\n';
      fs.writeFileSync(pyprojectPath, initialContent);
      const sha256 = Bun.SHA256.hash(fs.readFileSync(pyprojectPath), 'hex');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: pyprojectRel, sha256 }],
        updates: [
          {
            id: `pypi:${pyprojectRel}#project.dependencies/pytest`,
            from: '8.0.0',
            to: '8.1.0',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };
      const mockRunner = async (_cmd: string, _args: string[], cwd: string) => {
        fs.writeFileSync(path.join(cwd, 'uv.lock'), 'mock uv lock');
        return { code: 0, stdout: 'ok', stderr: '' };
      };

      const res = await applyApprovedProposal(tmpDir, proposal, policy, {
        runner: mockRunner,
      });
      expect(res.success).toBe(true);
      expect(res.changedFiles).toContain(pyprojectRel);

      const updatedContent = fs.readFileSync(pyprojectPath, 'utf8');
      expect(updatedContent).toContain('"pytest>=8.1.0"');
      expect(updatedContent).toContain('"pytest-cov>=4.0.0"');
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal updates PyPI package with dot without corrupting prefix-sharing packages', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-pypi-dot-'));
    try {
      const pyprojectDir = path.join(tmpDir, 'tools', 'apk-lab');
      fs.mkdirSync(pyprojectDir, { recursive: true });
      const pyprojectRel = 'tools/apk-lab/pyproject.toml';
      const pyprojectPath = path.join(tmpDir, pyprojectRel);
      const initialContent =
        '[project]\nname = "apk-lab"\ndependencies = [\n    "backports.zoneinfo>=0.2.1",\n    "backports.zoneinfo-extra>=1.0.0",\n]\n';
      fs.writeFileSync(pyprojectPath, initialContent);
      const sha256 = Bun.SHA256.hash(fs.readFileSync(pyprojectPath), 'hex');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: pyprojectRel, sha256 }],
        updates: [
          {
            id: `pypi:${pyprojectRel}#project.dependencies/backports.zoneinfo`,
            from: '0.2.1',
            to: '0.2.2',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };
      const mockRunner = async (_cmd: string, _args: string[], cwd: string) => {
        fs.writeFileSync(path.join(cwd, 'uv.lock'), 'mock uv lock');
        return { code: 0, stdout: 'ok', stderr: '' };
      };

      const res = await applyApprovedProposal(tmpDir, proposal, policy, {
        runner: mockRunner,
      });
      expect(res.success).toBe(true);
      const updatedContent = fs.readFileSync(pyprojectPath, 'utf8');
      expect(updatedContent).toContain('"backports.zoneinfo>=0.2.2"');
      expect(updatedContent).toContain('"backports.zoneinfo-extra>=1.0.0"');
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal updates PyPI package with spaces around operator', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-pypi-spaces-'));
    try {
      const pyprojectDir = path.join(tmpDir, 'tools', 'apk-lab');
      fs.mkdirSync(pyprojectDir, { recursive: true });
      const pyprojectRel = 'tools/apk-lab/pyproject.toml';
      const pyprojectPath = path.join(tmpDir, pyprojectRel);
      const initialContent =
        '[project]\nname = "apk-lab"\ndependencies = [\n    "pytest >= 8.0.0",\n]\n';
      fs.writeFileSync(pyprojectPath, initialContent);
      const sha256 = Bun.SHA256.hash(fs.readFileSync(pyprojectPath), 'hex');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: pyprojectRel, sha256 }],
        updates: [
          {
            id: `pypi:${pyprojectRel}#project.dependencies/pytest`,
            from: '8.0.0',
            to: '8.1.0',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };
      const mockRunner = async (_cmd: string, _args: string[], cwd: string) => {
        fs.writeFileSync(path.join(cwd, 'uv.lock'), 'mock uv lock');
        return { code: 0, stdout: 'ok', stderr: '' };
      };

      const res = await applyApprovedProposal(tmpDir, proposal, policy, {
        runner: mockRunner,
      });
      expect(res.success).toBe(true);
      const updatedContent = fs.readFileSync(pyprojectPath, 'utf8');
      expect(updatedContent).toContain('"pytest >=8.1.0"');
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal updates PyPI package with extras', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-pypi-extras-'));
    try {
      const pyprojectDir = path.join(tmpDir, 'tools', 'apk-lab');
      fs.mkdirSync(pyprojectDir, { recursive: true });
      const pyprojectRel = 'tools/apk-lab/pyproject.toml';
      const pyprojectPath = path.join(tmpDir, pyprojectRel);
      const initialContent =
        '[project]\nname = "apk-lab"\ndependencies = [\n    "pytest[dev]>=8.0.0",\n]\n';
      fs.writeFileSync(pyprojectPath, initialContent);
      const sha256 = Bun.SHA256.hash(fs.readFileSync(pyprojectPath), 'hex');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: pyprojectRel, sha256 }],
        updates: [
          {
            id: `pypi:${pyprojectRel}#project.dependencies/pytest`,
            from: '8.0.0',
            to: '8.1.0',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };
      const mockRunner = async (_cmd: string, _args: string[], cwd: string) => {
        fs.writeFileSync(path.join(cwd, 'uv.lock'), 'mock uv lock');
        return { code: 0, stdout: 'ok', stderr: '' };
      };

      const res = await applyApprovedProposal(tmpDir, proposal, policy, {
        runner: mockRunner,
      });
      expect(res.success).toBe(true);
      const updatedContent = fs.readFileSync(pyprojectPath, 'utf8');
      expect(updatedContent).toContain('"pytest[dev]>=8.1.0"');
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal updates PyPI package compound constraint preserving upper bound', async () => {
    const tmpDir = fs.mkdtempSync(
      path.join(os.tmpdir(), 'apply-pypi-compound-'),
    );
    try {
      const pyprojectDir = path.join(tmpDir, 'tools', 'apk-lab');
      fs.mkdirSync(pyprojectDir, { recursive: true });
      const pyprojectRel = 'tools/apk-lab/pyproject.toml';
      const pyprojectPath = path.join(tmpDir, pyprojectRel);
      const initialContent =
        '[project]\nname = "apk-lab"\ndependencies = [\n    "pytest>=8.0.0,<9.0.0",\n]\n';
      fs.writeFileSync(pyprojectPath, initialContent);
      const sha256 = Bun.SHA256.hash(fs.readFileSync(pyprojectPath), 'hex');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: pyprojectRel, sha256 }],
        updates: [
          {
            id: `pypi:${pyprojectRel}#project.dependencies/pytest`,
            from: '8.0.0',
            to: '8.1.0',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };
      const mockRunner = async (_cmd: string, _args: string[], cwd: string) => {
        fs.writeFileSync(path.join(cwd, 'uv.lock'), 'mock uv lock');
        return { code: 0, stdout: 'ok', stderr: '' };
      };

      const res = await applyApprovedProposal(tmpDir, proposal, policy, {
        runner: mockRunner,
      });
      expect(res.success).toBe(true);
      const updatedContent = fs.readFileSync(pyprojectPath, 'utf8');
      expect(updatedContent).toContain('"pytest>=8.1.0,<9.0.0"');
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal preserves exact == pin in PyPI package', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-pypi-exact-'));
    try {
      const pyprojectDir = path.join(tmpDir, 'tools', 'apk-lab');
      fs.mkdirSync(pyprojectDir, { recursive: true });
      const pyprojectRel = 'tools/apk-lab/pyproject.toml';
      const pyprojectPath = path.join(tmpDir, pyprojectRel);
      const initialContent =
        '[project]\nname = "apk-lab"\ndependencies = [\n    "goopdl==1.2.1",\n]\n';
      fs.writeFileSync(pyprojectPath, initialContent);
      const sha256 = Bun.SHA256.hash(fs.readFileSync(pyprojectPath), 'hex');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: pyprojectRel, sha256 }],
        updates: [
          {
            id: `pypi:${pyprojectRel}#project.dependencies/goopdl`,
            from: '1.2.1',
            to: '1.2.2',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };
      const mockRunner = async (_cmd: string, _args: string[], cwd: string) => {
        fs.writeFileSync(path.join(cwd, 'uv.lock'), 'mock uv lock');
        return { code: 0, stdout: 'ok', stderr: '' };
      };

      const res = await applyApprovedProposal(tmpDir, proposal, policy, {
        runner: mockRunner,
      });
      expect(res.success).toBe(true);
      const updatedContent = fs.readFileSync(pyprojectPath, 'utf8');
      expect(updatedContent).toContain('"goopdl==1.2.2"');
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('applyApprovedProposal throws error on invalid NPM package ID structure', async () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'apply-npm-invalid-'));
    try {
      const pkgJson = { name: 'test-app', dependencies: { foo: '1.0.0' } };
      const pkgPath = path.join(tmpDir, 'package.json');
      fs.writeFileSync(pkgPath, JSON.stringify(pkgJson, null, 2) + '\n');
      const sha256 = Bun.SHA256.hash(fs.readFileSync(pkgPath), 'hex');

      const proposal: Proposal = {
        schemaVersion: 1,
        inputs: [{ path: 'package.json', sha256 }],
        updates: [
          {
            id: 'npm:package.json#no-slash-here',
            from: '1.0.0',
            to: '2.0.0',
          },
        ],
        digest: '',
      };
      proposal.digest = computeProposalDigest(
        proposal.inputs,
        proposal.updates,
      );

      const policy: DependencyPolicy = { schemaVersion: 1, holds: [] };
      await expect(
        applyApprovedProposal(tmpDir, proposal, policy),
      ).rejects.toThrow(
        'Invalid NPM package ID structure: npm:package.json#no-slash-here',
      );
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });
});
