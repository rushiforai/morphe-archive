#!/usr/bin/env bun
import * as fs from 'node:fs';
import * as path from 'node:path';
import * as readline from 'node:readline';
import { applyApprovedProposal } from './dependencies/apply';
import { collectInventory } from './dependencies/inventory';
import {
  type DependencyPolicy,
  type DependencyReport,
  type Proposal,
  type ProposalUpdate,
  computeProposalDigest,
  loadAndValidatePolicy,
} from './dependencies/model';
import {
  buildSummary,
  formatTextReport,
  isMajorUpdate,
} from './dependencies/report';
import { SourceManager, resolveDependencyItem } from './dependencies/sources';

function printHelp(): void {
  console.log(`
Unified Monorepo Dependency Checker and Updater

USAGE:
  bun scripts/deps.ts check [options]
  bun scripts/deps.ts update [options]

COMMANDS:
  check     Inspect all dependencies and report freshness against upstream registries
  update    Apply approved dependency updates and regenerate affected lockfiles

OPTIONS:
  --json                  Output report in machine-readable JSON format on stdout
  --only <id>             Filter check/update to specific dependency ID(s) (can be repeated)
  --root <directory>      Set repository root directory (default: parent of scripts dir)
  --plan <json-file>      [Update agent mode] Apply updates from a pre-generated check JSON report
  --approve <sha256>      [Update agent mode] Explicit SHA-256 digest of the proposal to approve
  --help, -h              Show this help message

EXIT CODES:
  0: Success (all current or update cleanly applied)
  1: Error (registry failure, policy violation, stale plan, or manager error)
  2: Actionable updates available or compatibility-blocked newer releases
  3: Update declined by user in interactive prompt

EXAMPLES:
  # Check repository dependencies
  bun run deps:check

  # Check wrangler only
  bun run deps:check --only 'npm:worker/package.json#devDependencies/wrangler'

  # Interactive update
  bun run deps:update

  # Agent non-interactive approved update
  bun run deps:check --json > /tmp/report.json
  bun run deps:update --plan /tmp/report.json --approve <proposal.digest>
`);
}

function parseCliArgs(argv: string[]) {
  const args = argv.slice(2);
  const command = args[0] || 'check';
  let json = false;
  let rootDir = path.resolve(__dirname, '..');
  const onlyIds: string[] = [];
  let planFile: string | undefined;
  let approveDigest: string | undefined;
  let showHelp = false;

  for (let i = 1; i < args.length; i++) {
    const arg = args[i];
    if (arg === '--help' || arg === '-h') {
      showHelp = true;
    } else if (arg === '--json') {
      json = true;
    } else if (arg === '--only') {
      if (i + 1 < args.length) {
        onlyIds.push(args[++i]);
      }
    } else if (arg === '--root') {
      if (i + 1 < args.length) {
        rootDir = path.resolve(args[++i]);
      }
    } else if (arg === '--plan') {
      if (i + 1 < args.length) {
        planFile = path.resolve(args[++i]);
      }
    } else if (arg === '--approve') {
      if (i + 1 < args.length) {
        approveDigest = args[++i];
      }
    }
  }

  if (command === '--help' || command === '-h') {
    showHelp = true;
  }

  return { command, json, rootDir, onlyIds, planFile, approveDigest, showHelp };
}

async function promptConfirmation(promptText: string): Promise<boolean> {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
  });
  const { promise, resolve } = Promise.withResolvers<boolean>();
  rl.question(promptText, (answer) => {
    rl.close();
    const trimmed = answer.trim().toLowerCase();
    resolve(trimmed === 'y' || trimmed === 'yes');
  });
  return promise;
}

async function runCheck(
  rootDir: string,
  onlyIds: string[],
  sources?: SourceManager,
): Promise<{
  report: DependencyReport;
  policy: DependencyPolicy;
  hasUpdatesOrBlocked: boolean;
  hasErrors: boolean;
}> {
  const startTime = performance.now();
  const policy = loadAndValidatePolicy(rootDir);
  const { items, inputs } = collectInventory(rootDir, policy);

  const manager = sources || new SourceManager();
  const filterSet = onlyIds.length > 0 ? new Set(onlyIds) : null;

  if (filterSet) {
    for (const id of filterSet) {
      if (!items.some((item) => item.id === id)) {
        throw new Error(`Requested --only id not found in inventory: ${id}`);
      }
    }
  }

  const lookupTasks: Promise<void>[] = [];
  for (const item of items) {
    if (filterSet && !filterSet.has(item.id)) {
      item.status = 'not-checked';
      continue;
    }
    lookupTasks.push(resolveDependencyItem(item, manager));
  }

  await Promise.all(lookupTasks);

  const totalDurationMs = Math.round(performance.now() - startTime);
  const summary = buildSummary(items, totalDurationMs);

  // Generate actionable proposal updates
  const updates: ProposalUpdate[] = [];
  for (const item of items) {
    if (item.status === 'update' && item.latest) {
      updates.push({
        id: item.id,
        from: item.resolved || item.declared,
        to: item.latest.replace(/^latest \((.*)\)$/, '$1'),
      });
    }
  }

  let proposal: Proposal | null = null;
  if (updates.length > 0) {
    proposal = {
      schemaVersion: 1,
      inputs,
      updates,
      digest: computeProposalDigest(inputs, updates),
    };
  }

  const report: DependencyReport = {
    schemaVersion: 1,
    items,
    summary,
    proposal,
  };

  const hasUpdatesOrBlocked = summary.update > 0 || summary.blocked > 0;
  const hasErrors = summary.error > 0 || summary.unsupported > 0;

  return { report, policy, hasUpdatesOrBlocked, hasErrors };
}

async function main() {
  const { command, json, rootDir, onlyIds, planFile, approveDigest, showHelp } =
    parseCliArgs(process.argv);

  if (showHelp) {
    printHelp();
    process.exit(0);
  }

  if (command === 'check') {
    const { report, hasUpdatesOrBlocked, hasErrors } = await runCheck(
      rootDir,
      onlyIds,
    );

    if (json) {
      console.log(JSON.stringify(report, null, 2));
    } else {
      console.log(formatTextReport(report));
    }

    if (hasErrors) {
      process.exit(1);
    } else if (hasUpdatesOrBlocked) {
      process.exit(2);
    } else {
      process.exit(0);
    }
  } else if (command === 'update') {
    // Agent path: --plan and --approve
    if (planFile || approveDigest) {
      if (!planFile || !approveDigest) {
        console.error(
          'Error: Both --plan <file> and --approve <digest> must be specified together.',
        );
        process.exit(1);
      }
      if (onlyIds.length > 0) {
        console.error(
          'Error: Cannot combine --only with --plan (proposal selection belongs to the plan).',
        );
        process.exit(1);
      }
      if (!fs.existsSync(planFile)) {
        console.error(`Error: Plan file not found: ${planFile}`);
        process.exit(1);
      }

      const planJson = JSON.parse(
        fs.readFileSync(planFile, 'utf8'),
      ) as DependencyReport;
      if (!planJson.proposal) {
        console.error('Error: Plan file does not contain a proposal.');
        process.exit(1);
      }
      if (planJson.proposal.digest !== approveDigest) {
        console.error(
          `Error: Provided approve digest ${approveDigest} does not match proposal digest ${planJson.proposal.digest}`,
        );
        process.exit(1);
      }

      const policy = loadAndValidatePolicy(rootDir);
      const res = await applyApprovedProposal(
        rootDir,
        planJson.proposal,
        policy,
      );
      if (json) {
        console.log(JSON.stringify(res, null, 2));
      } else {
        console.log(res.message);
        for (const file of res.changedFiles) {
          console.log(`  - ${file}`);
        }
      }
      process.exit(0);
    }

    // Interactive path
    if (!process.stdin.isTTY) {
      console.error(
        'Error: Non-interactive update requires an approved plan.\n' +
          'Generate a report using "bun run deps:check --json > report.json",\n' +
          'then apply it with "bun run deps:update --plan report.json --approve <digest>".',
      );
      process.exit(1);
    }

    const { report, policy } = await runCheck(rootDir, onlyIds);

    if (!report.proposal || report.proposal.updates.length === 0) {
      console.log('No actionable dependency updates found.');
      process.exit(0);
    }

    console.log(formatTextReport(report));
    console.log('PROPOSED UPDATES:');
    for (const update of report.proposal.updates) {
      const isMajor = isMajorUpdate(update.from, update.to);
      const tag = isMajor ? ' [MAJOR UPDATE]' : '';
      console.log(`  • ${update.id}: ${update.from} → ${update.to}${tag}`);
    }
    console.log();

    const confirmed = await promptConfirmation(
      'Apply these dependency updates? [y/N] ',
    );
    if (!confirmed) {
      console.log('Update cancelled by user.');
      process.exit(3);
    }

    console.log('Applying updates and regenerating lockfiles in staging...');
    const res = await applyApprovedProposal(rootDir, report.proposal, policy);
    console.log(res.message);
    for (const file of res.changedFiles) {
      console.log(`  ✔ ${file}`);
    }
    process.exit(0);
  } else {
    console.error(`Unknown command: ${command}`);
    printHelp();
    process.exit(1);
  }
}

main().catch((err) => {
  console.error(`Error: ${(err as Error).message}`);
  process.exit(1);
});
