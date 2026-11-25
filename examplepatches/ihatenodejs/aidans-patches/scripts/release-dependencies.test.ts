import { describe, expect, test } from 'bun:test';
import * as fs from 'node:fs';
import * as path from 'node:path';

const ROOT = path.resolve(import.meta.dir, '..');

const manifest = JSON.parse(
  fs.readFileSync(path.join(ROOT, 'package.json'), 'utf8'),
) as { devDependencies: Record<string, string> };

const lock = JSON.parse(
  fs.readFileSync(path.join(ROOT, 'package-lock.json'), 'utf8'),
) as {
  lockfileVersion: number;
  packages: Record<
    string,
    { version?: string; devDependencies?: Record<string, string> }
  >;
};

const releaseConfig = Bun.YAML.parse(
  fs.readFileSync(path.join(ROOT, '.releaserc'), 'utf8'),
) as { plugins: Array<string | [string, unknown]> };

const releaseWorkflow = fs.readFileSync(
  path.join(ROOT, '.github/workflows/release.yml'),
  'utf8',
);

const RELEASE_PACKAGES = [
  'semantic-release',
  '@semantic-release/github',
  '@semantic-release/git',
  '@semantic-release/exec',
  '@cleyrop-org/semantic-release-backmerge',
  'gradle-semantic-release-plugin',
];

describe('release dependency lock', () => {
  test('package-lock mirrors package.json direct dependencies', () => {
    expect(lock.lockfileVersion).toBe(3);
    expect(lock.packages[''].devDependencies).toEqual(manifest.devDependencies);
  });

  test('every release dependency resolves to a version in its declared range', () => {
    for (const name of RELEASE_PACKAGES) {
      const range = manifest.devDependencies[name];
      const version = lock.packages[`node_modules/${name}`]?.version;
      expect(range).toBeDefined();
      expect(version).toBeDefined();
      if (!range || !version) {
        throw new Error(`${name} is missing its declared range or lock entry`);
      }
      expect(Bun.semver.satisfies(version, range)).toBe(true);
    }

    expect(lock.packages['node_modules/semantic-release']?.version).toMatch(
      /^25\./,
    );
    expect(
      lock.packages['node_modules/@semantic-release/github']?.version,
    ).toMatch(/^12\./);
  });

  test('every semantic-release plugin resolves from the same lock', () => {
    for (const plugin of releaseConfig.plugins) {
      const name = typeof plugin === 'string' ? plugin : plugin[0];
      expect(lock.packages[`node_modules/${name}`]).toBeDefined();
    }
  });

  test('release config does not shell out to a floating runner', () => {
    expect(
      fs.readFileSync(path.join(ROOT, '.releaserc'), 'utf8'),
    ).not.toContain('npx ');
  });

  test('the release workflow installs the lock and never floats a plugin', () => {
    expect(releaseWorkflow).toContain('npm ci --ignore-scripts');
    expect(releaseWorkflow).not.toMatch(/\bnpm install\b/);
    expect(releaseWorkflow).not.toContain('semantic-release-action');
    expect(releaseWorkflow).not.toContain('@latest');
    expect(releaseWorkflow).toContain('bun scripts/verify-release-revision.ts');
    expect(releaseWorkflow).toContain('bun scripts/run-release.ts');
    expect(releaseWorkflow).not.toContain('git pull');
    expect(releaseWorkflow).toContain(
      'new_release_published: ${{ steps.release.outputs.new_release_published }}',
    );
    expect(releaseWorkflow).toContain(
      'steps.release.outputs.new_release_git_tag',
    );
  });
});
