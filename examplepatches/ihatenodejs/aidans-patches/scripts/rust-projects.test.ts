import { describe, expect, test } from 'bun:test';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';
import { RUST_PROJECTS, cargoArgs } from './rust-projects';

const repoRoot = path.resolve(__dirname, '..');

function trackedCargoPaths(fileName: string): string[] {
  const result = Bun.spawnSync(
    ['git', '-C', repoRoot, 'ls-files', `**/${fileName}`],
    { stdout: 'pipe', stderr: 'pipe' },
  );
  if (result.exitCode !== 0) {
    throw new Error(result.stderr.toString());
  }
  return result.stdout
    .toString()
    .split('\n')
    .filter(Boolean)
    .filter((relPath) => !relPath.includes('/vendor/'))
    .sort();
}

describe('Rust project registry', () => {
  test('covers every first-party Cargo manifest and lockfile', () => {
    expect(trackedCargoPaths('Cargo.toml')).toEqual(
      RUST_PROJECTS.map((project) => project.manifest).sort(),
    );
    expect(trackedCargoPaths('Cargo.lock')).toEqual(
      RUST_PROJECTS.map((project) => project.lockfile).sort(),
    );
  });

  test('referenced manifests and lockfiles exist and ids are unique', () => {
    const ids = new Set<string>();
    for (const project of RUST_PROJECTS) {
      expect(ids.has(project.id)).toBe(false);
      ids.add(project.id);
      expect(fs.existsSync(path.join(repoRoot, project.manifest))).toBe(true);
      expect(fs.existsSync(path.join(repoRoot, project.lockfile))).toBe(true);
      expect(project.label.length).toBeGreaterThan(0);
    }
  });

  test('cargoArgs carries the manifest and project arguments', () => {
    const project = RUST_PROJECTS[0];
    expect(
      cargoArgs(project, ['check', '--locked'], ['--all-targets']),
    ).toEqual([
      'check',
      '--locked',
      '--manifest-path',
      project.manifest,
      ...project.hostArgs,
      '--all-targets',
    ]);
  });

  test('Android target arguments stay on the native crate only', () => {
    const crossProjects = RUST_PROJECTS.filter(
      (project) => project.crossTarget !== undefined,
    );
    expect(crossProjects.map((project) => project.id)).toEqual([
      'nhl-adblock-native',
    ]);
    const target = crossProjects[0].crossTarget;
    expect(target?.triple).toBe('aarch64-linux-android');
    expect(target?.args).toContain(target?.triple);
    expect(target?.owner).toContain('build.gradle.kts');
    for (const project of RUST_PROJECTS) {
      expect(project.hostArgs).not.toContain('aarch64-linux-android');
    }
  });

  test('audit fails for every Rust project when cargo fails', () => {
    const binDir = fs.mkdtempSync(path.join(os.tmpdir(), 'fake-cargo-'));
    try {
      fs.writeFileSync(
        path.join(binDir, 'cargo'),
        '#!/bin/sh\necho "simulated cargo failure" >&2\nexit 1\n',
        { mode: 0o755 },
      );
      const result = Bun.spawnSync(
        [
          process.execPath,
          path.join(repoRoot, 'scripts/audit.ts'),
          'all',
          '--domain',
          'rust',
        ],
        {
          cwd: repoRoot,
          stdout: 'pipe',
          stderr: 'pipe',
          env: { ...process.env, PATH: binDir },
        },
      );
      expect(result.exitCode).toBe(1);
      const output = `${result.stdout.toString()}\n${result.stderr.toString()}`;
      for (const project of RUST_PROJECTS) {
        expect(output).toContain(`Rust ${project.label}`);
      }
      expect(output).toContain('16 of 16 checks failed');
    } finally {
      fs.rmSync(binDir, { recursive: true, force: true });
    }
  });
});
