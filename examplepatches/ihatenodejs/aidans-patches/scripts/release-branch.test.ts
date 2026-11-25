import { describe, expect, test } from 'bun:test';
import * as fs from 'node:fs';
import * as path from 'node:path';

const ROOT = path.resolve(import.meta.dir, '..');

interface ReleaseBranch {
  name: string;
  prerelease?: boolean | string;
  channel?: string;
}

const releaseConfig = Bun.YAML.parse(
  fs.readFileSync(path.join(ROOT, '.releaserc'), 'utf8'),
) as {
  branches: Array<string | ReleaseBranch>;
  plugins: Array<string | [string, Record<string, unknown>]>;
};

const releaseWorkflow = Bun.YAML.parse(
  fs.readFileSync(path.join(ROOT, '.github/workflows/release.yml'), 'utf8'),
) as {
  on: {
    workflow_dispatch: unknown;
    push: { branches: string[]; paths: string[] };
  };
  concurrency: { group: string; 'cancel-in-progress': boolean };
  jobs: {
    verify: { if?: string };
    release: { if?: string };
    'deploy-site': { if?: string; with?: Record<string, unknown> };
    'deploy-worker': { if?: string; with?: Record<string, unknown> };
  };
};

interface DeployWorkflow {
  on: {
    push?: unknown;
    workflow_call?: {
      inputs?: { ref?: { required?: boolean; type?: string } };
    };
    workflow_dispatch?: unknown;
  };
  jobs: Record<
    string,
    {
      if?: string;
      steps: Array<{ uses?: string; with?: Record<string, unknown> }>;
    }
  >;
}

interface PromoteWorkflow {
  on: {
    workflow_dispatch: {
      inputs: Record<string, { required?: boolean; type?: string }>;
    };
  };
  concurrency: { group: string; 'cancel-in-progress': boolean };
  jobs: Record<
    string,
    {
      steps: Array<{
        uses?: string;
        with?: Record<string, unknown>;
        run?: string;
      }>;
    }
  >;
}

function readWorkflow(file: string): unknown {
  return Bun.YAML.parse(
    fs.readFileSync(path.join(ROOT, '.github/workflows', file), 'utf8'),
  );
}

const deploySite = readWorkflow('deploy-site.yml') as DeployWorkflow;
const deployWorker = readWorkflow('deploy-worker.yml') as DeployWorkflow;
const promoteRelease = readWorkflow('promote-release.yml') as PromoteWorkflow;

describe('release branches', () => {
  test('.releaserc releases only release/main and release/dev', () => {
    const names = releaseConfig.branches.map((branch) =>
      typeof branch === 'string' ? branch : branch.name,
    );
    expect(names).toEqual(['release/main', 'release/dev']);
    expect(names).not.toContain('main');
    expect(names).not.toContain('dev');
  });

  test('release/dev keeps the existing dev prerelease and channel', () => {
    const dev = releaseConfig.branches
      .map((branch) => (typeof branch === 'string' ? { name: branch } : branch))
      .find((branch) => branch.name === 'release/dev');
    // The prerelease identifier and channel stay `dev`, so tags remain
    // v*-dev.N and existing release notes still match.
    expect(dev?.prerelease).toBe('dev');
    expect(dev?.channel).toBe('dev');
  });

  test('release workflow pushes trigger only from release branches', () => {
    const push = releaseWorkflow.on.push;
    expect(push.branches).toEqual(['release/main', 'release/dev']);
    expect(push.branches).not.toContain('main');
    expect(push.branches).not.toContain('dev');
    expect(releaseWorkflow.on.workflow_dispatch).toBeDefined();
    expect(push.paths.length).toBeGreaterThan(0);
  });

  test('manual dispatch cannot release from main or dev', () => {
    for (const job of [
      releaseWorkflow.jobs.verify,
      releaseWorkflow.jobs.release,
    ]) {
      expect(job.if).toContain("github.ref == 'refs/heads/release/main'");
      expect(job.if).toContain("github.ref == 'refs/heads/release/dev'");
      expect(job.if).not.toContain("'refs/heads/main'");
      expect(job.if).not.toContain("'refs/heads/dev'");
    }
  });

  test('deploy jobs gate on the stable release branch', () => {
    for (const deploy of [
      releaseWorkflow.jobs['deploy-site'],
      releaseWorkflow.jobs['deploy-worker'],
    ]) {
      expect(deploy.if).toContain("github.ref == 'refs/heads/release/main'");
      expect(deploy.if).not.toContain("'refs/heads/main'");
      expect(deploy.if).not.toContain("'refs/heads/release/dev'");
    }
  });

  test('deploy workflows only run for the release/main handoff', () => {
    for (const deploy of [deploySite, deployWorker]) {
      expect(deploy.on.push).toBeUndefined();
      expect(deploy.on.workflow_dispatch).toBeDefined();
      const refInput = deploy.on.workflow_call?.inputs?.ref;
      expect(refInput?.required).toBe(false);
      expect(refInput?.type).toBe('string');

      const job = deploy.jobs['build-and-deploy'];
      expect(job.if).toContain("github.ref == 'refs/heads/release/main'");
      const checkout = job.steps.find(
        (step) => step.uses === 'actions/checkout@v7',
      );
      expect(checkout?.with?.ref).toBe('${{ inputs.ref || github.sha }}');
    }
  });

  test('release handoff deploys the post-release branch tip', () => {
    for (const deploy of [
      releaseWorkflow.jobs['deploy-site'],
      releaseWorkflow.jobs['deploy-worker'],
    ]) {
      // The branch tip includes the release commit; the tag points at the
      // pre-prepare gitHead.
      expect(deploy.with?.ref).toBe('${{ github.ref_name }}');
    }
  });

  test('promotion workflow merges into a release branch in the publication queue', () => {
    const dispatch = promoteRelease.on.workflow_dispatch;
    expect(dispatch.inputs.source?.required).toBe(true);
    expect(dispatch.inputs.target?.required).toBe(true);
    expect(promoteRelease.concurrency.group).toBe(
      'release-publication-${{ inputs.target }}',
    );
    expect(promoteRelease.concurrency['cancel-in-progress']).toBe(false);

    const steps = promoteRelease.jobs.promote.steps;
    const token = steps.find((step) =>
      step.uses?.startsWith('actions/create-github-app-token@'),
    );
    expect(token).toBeDefined();
    expect(token?.with?.['permission-contents']).toBe('write');

    const checkout = steps.find((step) => step.uses === 'actions/checkout@v7');
    expect(checkout?.with?.['fetch-depth']).toBe(0);

    const merge = steps.find((step) => step.run?.includes('git merge'));
    expect(merge?.run).toContain('git push');
    expect(merge?.run).toContain('main:release/main');
    expect(merge?.run).toContain('dev:release/dev');
  });

  test('release and promotion serialize per release branch', () => {
    // Same effective group for a given target: release.<ref_name> and
    // promote.<inputs.target> both expand to release-publication-<branch>.
    expect(releaseWorkflow.concurrency.group).toBe(
      'release-publication-${{ github.ref_name }}',
    );
    expect(promoteRelease.concurrency.group).toBe(
      'release-publication-${{ inputs.target }}',
    );
    expect(releaseWorkflow.concurrency['cancel-in-progress']).toBe(false);
    expect(promoteRelease.concurrency['cancel-in-progress']).toBe(false);
  });

  test('backmerge is conditional from each release branch to dev', () => {
    const entry = releaseConfig.plugins.find(
      (plugin) =>
        (typeof plugin === 'string' ? plugin : plugin[0]) ===
        '@cleyrop-org/semantic-release-backmerge',
    );
    const backmerge = (typeof entry === 'string' ? undefined : entry?.[1]) as {
      backmergeBranches?: Array<{ from: string; to: string }>;
    };
    expect(backmerge.backmergeBranches).toEqual([
      { from: 'release/main', to: 'dev' },
      { from: 'release/dev', to: 'dev' },
    ]);
    for (const route of backmerge.backmergeBranches ?? []) {
      expect(['release/main', 'release/dev']).toContain(route.from);
      expect(route.to).toBe('dev');
    }
  });

  test('no main or dev release trigger remains in the workflow', () => {
    const workflow = fs.readFileSync(
      path.join(ROOT, '.github/workflows/release.yml'),
      'utf8',
    );
    expect(workflow).not.toContain("'refs/heads/main'");
    expect(workflow).not.toContain("'refs/heads/dev'");
    expect(workflow).not.toMatch(/^\s+- main\s*$/m);
    expect(workflow).not.toMatch(/^\s+- dev\s*$/m);
  });
});
