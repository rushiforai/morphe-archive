import { describe, expect, test } from 'bun:test';
import { spawnSync } from 'node:child_process';
import * as crypto from 'node:crypto';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';
import { computeProposalDigest } from './model';

describe('CLI Subprocess & Approval Boundaries', () => {
  const depsCli = path.resolve(__dirname, '..', 'deps.ts');

  test('check --help exits 0 and prints usage', () => {
    const res = spawnSync('bun', [depsCli, 'check', '--help'], {
      encoding: 'utf8',
    });
    expect(res.status).toBe(0);
    expect(res.stdout).toContain('USAGE:');
    expect(res.stdout).toContain('EXIT CODES:');
  });

  test('non-TTY update without a plan fails with exit 1 and instructions', () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'cli-nontty-'));
    try {
      const pkgPath = path.join(tmpDir, 'package.json');
      fs.writeFileSync(
        pkgPath,
        JSON.stringify({ name: 'test', devDependencies: { foo: '1.0.0' } }),
      );
      fs.writeFileSync(
        path.join(tmpDir, 'dependency-policy.json'),
        JSON.stringify({ schemaVersion: 1, holds: [] }),
      );

      const res = spawnSync('bun', [depsCli, 'update', '--root', tmpDir], {
        encoding: 'utf8',
        stdio: ['ignore', 'pipe', 'pipe'],
      });

      expect(res.status).toBe(1);
      expect(res.stderr).toContain(
        'Non-interactive update requires an approved plan',
      );
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('update with --plan and wrong digest fails with exit 1 and leaves files unchanged', () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'cli-bad-digest-'));
    try {
      const pkgPath = path.join(tmpDir, 'package.json');
      const initialContent = JSON.stringify(
        { name: 'test', devDependencies: { foo: '1.0.0' } },
        null,
        2,
      );
      fs.writeFileSync(pkgPath, initialContent);
      fs.writeFileSync(
        path.join(tmpDir, 'dependency-policy.json'),
        JSON.stringify({ schemaVersion: 1, holds: [] }),
      );

      const initialHash = crypto
        .createHash('sha256')
        .update(fs.readFileSync(pkgPath))
        .digest('hex');

      const planPath = path.join(tmpDir, 'plan.json');
      const planContent = {
        schemaVersion: 1,
        proposal: {
          schemaVersion: 1,
          inputs: [{ path: 'package.json', sha256: initialHash }],
          updates: [
            {
              id: 'npm:package.json#devDependencies/foo',
              from: '1.0.0',
              to: '2.0.0',
            },
          ],
          digest:
            '0000000000000000000000000000000000000000000000000000000000000000',
        },
      };
      fs.writeFileSync(planPath, JSON.stringify(planContent));

      const res = spawnSync(
        'bun',
        [
          depsCli,
          'update',
          '--root',
          tmpDir,
          '--plan',
          planPath,
          '--approve',
          '1111111111111111111111111111111111111111111111111111111111111111',
        ],
        { encoding: 'utf8', stdio: ['ignore', 'pipe', 'pipe'] },
      );

      expect(res.status).toBe(1);
      expect(res.stderr).toContain('does not match proposal digest');

      // Verify file unchanged
      expect(fs.readFileSync(pkgPath, 'utf8')).toBe(initialContent);
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  });

  test('update with valid plan and matching digest applies update cleanly', () => {
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'cli-valid-plan-'));
    try {
      const pkgPath = path.join(tmpDir, 'package.json');
      fs.writeFileSync(
        pkgPath,
        JSON.stringify(
          { name: 'test', devDependencies: { oxlint: '^1.86.0' } },
          null,
          2,
        ) + '\n',
      );
      fs.writeFileSync(
        path.join(tmpDir, 'dependency-policy.json'),
        JSON.stringify({ schemaVersion: 1, holds: [] }),
      );

      const inputHash = crypto
        .createHash('sha256')
        .update(fs.readFileSync(pkgPath))
        .digest('hex');
      const policyHash = crypto
        .createHash('sha256')
        .update(fs.readFileSync(path.join(tmpDir, 'dependency-policy.json')))
        .digest('hex');

      const inputs = [
        { path: 'dependency-policy.json', sha256: policyHash },
        { path: 'package.json', sha256: inputHash },
      ];
      const updates = [
        {
          id: 'npm:package.json#devDependencies/oxlint',
          from: '1.86.0',
          to: '1.87.0',
        },
      ];
      const digest = computeProposalDigest(inputs, updates);

      const planPath = path.join(tmpDir, 'plan.json');
      fs.writeFileSync(
        planPath,
        JSON.stringify({
          schemaVersion: 1,
          proposal: {
            schemaVersion: 1,
            inputs,
            updates,
            digest,
          },
        }),
      );

      const res = spawnSync(
        'bun',
        [
          depsCli,
          'update',
          '--root',
          tmpDir,
          '--plan',
          planPath,
          '--approve',
          digest,
          '--json',
        ],
        {
          encoding: 'utf8',
          stdio: ['ignore', 'pipe', 'pipe'],
          timeout: 30_000,
        },
      );

      expect(res.status).toBe(0);
      const updatedJson = JSON.parse(fs.readFileSync(pkgPath, 'utf8'));
      expect(updatedJson.devDependencies.oxlint).toBe('^1.87.0');
    } finally {
      fs.rmSync(tmpDir, { recursive: true, force: true });
    }
  }, 30_000);
});
