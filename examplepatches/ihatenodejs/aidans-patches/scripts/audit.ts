#!/usr/bin/env bun
import { spawn } from 'node:child_process';
import * as crypto from 'node:crypto';
import * as fs from 'node:fs';
import * as path from 'node:path';

const KTLINT_VERSION = '1.5.0';
const KTLINT_SHA256 =
  'a16be01dcc480aab2f55f444b620142152f66e31564b3b9376506d624c28a2ad';
// --- ANSI Styling ---
const c = {
  reset: '\x1b[0m',
  bold: '\x1b[1m',
  dim: '\x1b[2m',
  green: '\x1b[32m',
  red: '\x1b[31m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  magenta: '\x1b[35m',
  cyan: '\x1b[36m',
  gray: '\x1b[90m',
  bgRed: '\x1b[41m\x1b[37m',
  bgGreen: '\x1b[42m\x1b[30m',
};

const sym = {
  ok: `${c.green}✔${c.reset}`,
  err: `${c.red}✖${c.reset}`,
  warn: `${c.yellow}⚠${c.reset}`,
  info: `${c.cyan}ℹ${c.reset}`,
  arrow: `${c.gray}→${c.reset}`,
};

export type AuditDomain =
  'web' | 'python' | 'android' | 'rust' | 'native' | 'all';

export const VALID_DOMAINS: readonly AuditDomain[] = [
  'web',
  'python',
  'android',
  'rust',
  'native',
  'all',
] as const;

function isDomainValid(domain: string): domain is AuditDomain {
  return (VALID_DOMAINS as readonly string[]).includes(domain);
}

function shouldRunDomain(
  selected: AuditDomain,
  stepDomain: AuditDomain,
): boolean {
  return selected === 'all' || selected === stepDomain;
}

interface StepResult {
  title: string;
  tool: string;
  domain?: AuditDomain;
  success: boolean;
  durationMs: number;
  summary: string;
  diagnostics?: Diagnostic[];
}

interface PhaseResult {
  category: string;
  success: boolean;
  results: StepResult[];
}

interface Diagnostic {
  tool: string;
  file: string;
  line?: number;
  col?: number;
  message: string;
  rule?: string;
  severity: 'error' | 'warning';
}

function formatDuration(ms: number): string {
  return ms < 1000 ? `${ms}ms` : `${(ms / 1000).toFixed(2)}s`;
}

async function execCommand(
  cmd: string,
  args: string[],
  cwd = process.cwd(),
): Promise<{
  code: number;
  stdout: string;
  stderr: string;
  durationMs: number;
}> {
  const start = performance.now();
  const { promise, resolve } = Promise.withResolvers<{
    code: number;
    stdout: string;
    stderr: string;
    durationMs: number;
  }>();

  const child = spawn(cmd, args, {
    cwd,
    shell: false,
    stdio: ['ignore', 'pipe', 'pipe'],
    env: { ...process.env, FORCE_COLOR: '1' },
  });

  let stdout = '';
  let stderr = '';

  child.stdout.on('data', (d) => (stdout += d.toString()));
  child.stderr.on('data', (d) => (stderr += d.toString()));

  child.on('close', (code) => {
    const durationMs = Math.round(performance.now() - start);
    resolve({ code: code ?? 1, stdout, stderr, durationMs });
  });

  child.on('error', (err) => {
    const durationMs = Math.round(performance.now() - start);
    resolve({ code: 1, stdout, stderr: stderr + err.message, durationMs });
  });

  return promise;
}

async function ensureKtlint(): Promise<string> {
  const localBin = path.join(process.cwd(), '.tools', 'ktlint');
  if (fs.existsSync(localBin)) {
    const currentSha256 = crypto
      .createHash('sha256')
      .update(fs.readFileSync(localBin))
      .digest('hex');
    if (currentSha256 === KTLINT_SHA256) {
      return localBin;
    }
  }
  const systemKtlint = Bun.which('ktlint');
  if (systemKtlint) return systemKtlint;

  console.log(
    `${sym.info} Fetching pinned ktlint ${KTLINT_VERSION} binary to .tools/ktlint...`,
  );
  fs.mkdirSync(path.dirname(localBin), { recursive: true });
  const res = await fetch(
    `https://github.com/pinterest/ktlint/releases/download/${KTLINT_VERSION}/ktlint`,
  );
  if (!res.ok) throw new Error(`Failed to download ktlint: ${res.statusText}`);
  const buf = Buffer.from(await res.arrayBuffer());
  const downloadedSha256 = crypto
    .createHash('sha256')
    .update(buf)
    .digest('hex');
  if (downloadedSha256 !== KTLINT_SHA256) {
    throw new Error(
      `ktlint ${KTLINT_VERSION} SHA-256 verification failed: expected ${KTLINT_SHA256}, got ${downloadedSha256}`,
    );
  }
  fs.writeFileSync(localBin, buf, { mode: 0o755 });
  return localBin;
}

function findFilesRecursive(dir: string, extensions: string[]): string[] {
  if (!fs.existsSync(dir)) return [];
  const results: string[] = [];
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  for (const entry of entries) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      if (entry.name !== 'build' && entry.name !== '_deps') {
        results.push(...findFilesRecursive(fullPath, extensions));
      }
    } else if (extensions.some((ext) => entry.name.endsWith(ext))) {
      results.push(fullPath);
    }
  }
  return results;
}
function resolveRuffCommand(): { cmd: string; baseArgs: string[] } {
  const systemRuff = Bun.which('ruff');
  if (systemRuff) {
    return { cmd: systemRuff, baseArgs: [] };
  }
  const venvRuff = path.join(
    process.cwd(),
    'tools',
    'apk-lab',
    '.venv',
    process.platform === 'win32' ? 'Scripts' : 'bin',
    process.platform === 'win32' ? 'ruff.exe' : 'ruff',
  );
  if (fs.existsSync(venvRuff)) {
    return { cmd: venvRuff, baseArgs: [] };
  }
  const systemUvx = Bun.which('uvx');
  if (systemUvx) {
    return { cmd: systemUvx, baseArgs: ['ruff'] };
  }
  const systemUv = Bun.which('uv');
  if (systemUv) {
    return { cmd: systemUv, baseArgs: ['tool', 'run', 'ruff'] };
  }
  return { cmd: 'ruff', baseArgs: [] };
}

function printSectionHeader(title: string, subtitle?: string): void {
  console.log();
  console.log(
    `${c.bold}${c.cyan}=== ${title.toUpperCase()} ===${c.reset}${subtitle ? ` ${c.gray}(${subtitle})${c.reset}` : ''}`,
  );
}

function printResultsSummary(
  category: string,
  results: StepResult[],
): PhaseResult {
  if (results.length === 0) {
    console.log();
    console.log(`${c.bold}${c.gray}${'―'.repeat(70)}${c.reset}`);
    console.log(`${c.bold}  ${category.toUpperCase()} SUMMARY${c.reset}`);
    console.log(`${c.bold}${c.gray}${'―'.repeat(70)}${c.reset}`);
    console.log(
      `  ${sym.info} ${c.dim}No checks applicable for selected domain (skipped)${c.reset}`,
    );
    console.log(`${c.bold}${c.gray}${'―'.repeat(70)}${c.reset}`);
    console.log(
      `  ${c.bold}${c.green}✔ Skipped cleanly (0 checks required)${c.reset}`,
    );
    console.log();
    return { category, success: true, results };
  }
  const totalDuration = results.reduce((acc, r) => acc + r.durationMs, 0);
  const allPassed = results.every((r) => r.success);
  const maxTitleLen = Math.max(28, ...results.map((r) => r.title.length));

  console.log();
  console.log(`${c.bold}${c.gray}${'―'.repeat(70)}${c.reset}`);
  console.log(`${c.bold}  ${category.toUpperCase()} SUMMARY${c.reset}`);
  console.log(`${c.bold}${c.gray}${'―'.repeat(70)}${c.reset}`);

  for (const res of results) {
    const icon = res.success ? sym.ok : sym.err;
    const dur = c.gray + formatDuration(res.durationMs).padStart(8) + c.reset;
    const name = res.title.padEnd(maxTitleLen);
    const summaryStyle = res.success ? c.dim : c.red;
    console.log(
      `  ${icon} ${name} ${dur}  ${summaryStyle}${res.summary}${c.reset}`,
    );
  }

  console.log(`${c.bold}${c.gray}${'―'.repeat(70)}${c.reset}`);
  if (allPassed) {
    console.log(
      `  ${c.bold}${c.green}✔ All ${results.length} checks passed cleanly${c.reset} ${c.gray}in ${formatDuration(totalDuration)}${c.reset}`,
    );
  } else {
    const failedCount = results.filter((r) => !r.success).length;
    console.log(
      `  ${c.bold}${c.red}✖ ${failedCount} of ${results.length} checks failed${c.reset} ${c.gray}in ${formatDuration(totalDuration)}${c.reset}`,
    );
  }
  console.log();
  return { category, success: allPassed, results };
}

function printFullAuditSummary(phases: PhaseResult[]): boolean {
  const allResults = phases.flatMap((p) => p.results);
  const totalDuration = allResults.reduce((acc, r) => acc + r.durationMs, 0);
  const allPassed = phases.every((p) => p.success);
  const maxTitleLen = Math.max(30, ...allResults.map((r) => r.title.length));

  console.log();
  console.log(`${c.bold}${c.cyan}${'═'.repeat(70)}${c.reset}`);
  console.log(`${c.bold}  FULL AUDIT SUMMARY${c.reset}`);
  console.log(`${c.bold}${c.cyan}${'═'.repeat(70)}${c.reset}`);

  for (const phase of phases) {
    const phaseDur = phase.results.reduce((acc, r) => acc + r.durationMs, 0);
    const phaseIcon = phase.success ? sym.ok : sym.err;
    console.log();
    console.log(
      `  ${phaseIcon} ${c.bold}${phase.category.toUpperCase()}${c.reset} ${c.gray}(${formatDuration(phaseDur)})${c.reset}`,
    );
    if (phase.results.length === 0) {
      console.log(
        `    ${sym.info} ${c.dim}No checks applicable (skipped)${c.reset}`,
      );
    }
    for (const res of phase.results) {
      const icon = res.success ? sym.ok : sym.err;
      const dur = c.gray + formatDuration(res.durationMs).padStart(8) + c.reset;
      const name = res.title.padEnd(maxTitleLen);
      const summaryStyle = res.success ? c.dim : c.red;
      console.log(
        `    ${icon} ${name} ${dur}  ${summaryStyle}${res.summary}${c.reset}`,
      );
    }
  }

  console.log();
  console.log(`${c.bold}${c.gray}${'―'.repeat(70)}${c.reset}`);
  if (allPassed) {
    console.log(
      `  ${c.bold}${c.green}✔ All ${allResults.length} checks passed cleanly across ${phases.length} phases${c.reset} ${c.gray}in ${formatDuration(totalDuration)}${c.reset}`,
    );
  } else {
    const failedCount = allResults.filter((r) => !r.success).length;
    console.log(
      `  ${c.bold}${c.red}✖ ${failedCount} of ${allResults.length} checks failed across ${phases.length} phases${c.reset} ${c.gray}in ${formatDuration(totalDuration)}${c.reset}`,
    );
  }
  console.log(`${c.bold}${c.cyan}${'═'.repeat(70)}${c.reset}`);
  console.log();
  return allPassed;
}

function renderDiagnostics(diagnostics: Diagnostic[]): void {
  if (diagnostics.length === 0) return;
  console.log();
  for (const d of diagnostics) {
    const loc = `${d.file}${d.line ? `:${d.line}${d.col ? `:${d.col}` : ''}` : ''}`;
    const badge =
      d.severity === 'error'
        ? `${c.red}error${c.reset}`
        : `${c.yellow}warning${c.reset}`;
    const rule = d.rule ? ` ${c.gray}(${d.rule})${c.reset}` : '';
    const toolBadge = `${c.cyan}[${d.tool}]${c.reset}`;
    console.log(`  ${badge} ${c.bold}${loc}${c.reset}${rule} ${toolBadge}`);
    console.log(`    ${d.message}`);
  }
}

function printRawCommandOutput(stdout: string, stderr: string): void {
  const combined = [stdout.trim(), stderr.trim()].filter(Boolean).join('\n');
  if (!combined) return;
  console.log(c.dim + combined + c.reset);
}

// ============================================================================
// FORMAT COMMAND
// ============================================================================
async function runFormat(
  checkOnly = false,
  domain: AuditDomain = 'all',
): Promise<PhaseResult> {
  const subtitle = `${checkOnly ? 'audit check only' : 'formatting in place'}${domain !== 'all' ? ` [domain: ${domain}]` : ''}`;
  printSectionHeader('Format', subtitle);
  const results: StepResult[] = [];
  const ktlintPath = shouldRunDomain(domain, 'android')
    ? await ensureKtlint()
    : '';

  // 1. Prettier (Web / TypeScript / Astro / Markdown / Configs)
  if (shouldRunDomain(domain, 'web')) {
    process.stdout.write(
      `  ${sym.arrow} Formatting web, configs & docs (Prettier)... `,
    );
    const prettierPatterns = [
      'worker/**/*.{ts,json,jsonc}',
      'site/src/**/*.{ts,astro}',
      'site/test/**/*.ts',
      'scripts/**/*.{ts,json}',
      'package.json',
      'dependency-policy.json',
      '.prettierrc.json',
      '.oxlintrc.json',
      '*.md',
      'docs/**/*.md',
      'scripts/**/*.md',
      'patches/**/*.md',
      'extensions/**/*.md',
      'tools/apk-lab/**/*.md',
      'worker/**/*.md',
      'site/**/*.md',
      '.github/**/*.md',
    ];
    const prettierArgs = checkOnly
      ? ['prettier', '--check', ...prettierPatterns]
      : ['prettier', '--write', ...prettierPatterns];
    const pRes = await execCommand('bunx', prettierArgs);
    const pPassed = pRes.code === 0;
    const pSummary = checkOnly
      ? pPassed
        ? 'All files match formatting rules'
        : 'Files need formatting'
      : 'Formatted web, docs & config files';
    console.log(pPassed ? sym.ok : sym.err);
    if (!pPassed) {
      printRawCommandOutput(pRes.stdout, pRes.stderr);
    }
    results.push({
      title: 'Web, Configs & Markdown (Prettier)',
      tool: 'prettier',
      domain: 'web',
      success: pPassed,
      durationMs: pRes.durationMs,
      summary: pSummary,
    });
  }

  // 2. Ruff (Python)
  if (shouldRunDomain(domain, 'python')) {
    process.stdout.write(`  ${sym.arrow} Formatting Python sources (Ruff)... `);
    const ruff = resolveRuffCommand();
    const ruffArgs = checkOnly
      ? ['format', '--check', 'tools/apk-lab', '.github/scripts', 'extensions']
      : ['format', 'tools/apk-lab', '.github/scripts', 'extensions'];
    const rRes = await execCommand(ruff.cmd, [...ruff.baseArgs, ...ruffArgs]);
    const rPassed = rRes.code === 0;
    const rSummary = checkOnly
      ? rPassed
        ? 'All Python files formatted'
        : 'Python files need formatting'
      : 'Formatted Python sources';
    console.log(rPassed ? sym.ok : sym.err);
    if (!rPassed) {
      printRawCommandOutput(rRes.stdout, rRes.stderr);
    }
    results.push({
      title: 'Python (Ruff format)',
      tool: 'ruff',
      domain: 'python',
      success: rPassed,
      durationMs: rRes.durationMs,
      summary: rSummary,
    });
  }

  // 3. ktlint (Kotlin)
  if (shouldRunDomain(domain, 'android')) {
    process.stdout.write(
      `  ${sym.arrow} Formatting Kotlin sources (ktlint)... `,
    );
    const ktlintArgs = checkOnly
      ? ['patches/src/main/kotlin/**/*.kt']
      : ['-F', 'patches/src/main/kotlin/**/*.kt'];
    const kRes = await execCommand(ktlintPath, ktlintArgs);
    const kPassed = kRes.code === 0;
    const kSummary = checkOnly
      ? kPassed
        ? 'All Kotlin files formatted'
        : 'Kotlin style deviations detected'
      : 'Formatted Kotlin sources';
    console.log(kPassed ? sym.ok : sym.err);
    if (!kPassed && checkOnly) {
      console.log(
        c.dim +
          (kRes.stderr || kRes.stdout)
            .trim()
            .split('\n')
            .slice(0, 10)
            .join('\n') +
          c.reset,
      );
    }
    results.push({
      title: 'Kotlin (ktlint)',
      tool: 'ktlint',
      domain: 'android',
      success: kPassed,
      durationMs: kRes.durationMs,
      summary: kSummary,
    });
  }

  // 4. Rust (play-metadata cargo fmt)
  if (shouldRunDomain(domain, 'rust')) {
    process.stdout.write(
      `  ${sym.arrow} Formatting Rust play-metadata sources (cargo fmt)... `,
    );
    const rustFmtArgs = [
      'fmt',
      '--manifest-path',
      'tools/play-metadata/Cargo.toml',
    ];
    if (checkOnly) rustFmtArgs.push('--check');
    const rustFmtRes = await execCommand('cargo', rustFmtArgs);
    const rustFmtPassed = rustFmtRes.code === 0;
    const rustFmtMissing =
      rustFmtRes.code !== 0 && rustFmtRes.stderr.includes('ENOENT');
    const rustFmtSummary = rustFmtMissing
      ? 'cargo not found in PATH; install Rust toolchain (rustup.rs)'
      : checkOnly
        ? rustFmtPassed
          ? 'All Rust files formatted'
          : 'Rust files need formatting'
        : 'Formatted Rust sources';
    console.log(rustFmtPassed ? sym.ok : sym.err);
    if (!rustFmtPassed) {
      printRawCommandOutput(rustFmtRes.stdout, rustFmtRes.stderr);
    }
    results.push({
      title: 'Rust Play Metadata (cargo fmt)',
      tool: 'cargo fmt',
      domain: 'rust',
      success: rustFmtPassed,
      durationMs: rustFmtRes.durationMs,
      summary: rustFmtSummary,
    });
  }

  // 5. Rust (nhl-adblock-native cargo fmt)
  if (shouldRunDomain(domain, 'rust')) {
    process.stdout.write(
      `  ${sym.arrow} Formatting Rust nhl-adblock-native sources (cargo fmt)... `,
    );
    const nhlFmtArgs = [
      'fmt',
      '--manifest-path',
      'extensions/nhl-adblock-native/Cargo.toml',
    ];
    if (checkOnly) nhlFmtArgs.push('--check');
    const nhlFmtRes = await execCommand('cargo', nhlFmtArgs);
    const nhlFmtPassed = nhlFmtRes.code === 0;
    const nhlFmtMissing =
      nhlFmtRes.code !== 0 && nhlFmtRes.stderr.includes('ENOENT');
    const nhlFmtSummary = nhlFmtMissing
      ? 'cargo not found in PATH; install Rust toolchain (rustup.rs)'
      : checkOnly
        ? nhlFmtPassed
          ? 'All Rust files formatted'
          : 'Rust files need formatting'
        : 'Formatted Rust sources';
    console.log(nhlFmtPassed ? sym.ok : sym.err);
    if (!nhlFmtPassed) {
      printRawCommandOutput(nhlFmtRes.stdout, nhlFmtRes.stderr);
    }
    results.push({
      title: 'Rust NHL AdBlock Native (cargo fmt)',
      tool: 'cargo fmt',
      domain: 'rust',
      success: nhlFmtPassed,
      durationMs: nhlFmtRes.durationMs,
      summary: nhlFmtSummary,
    });
  }

  // 6. C++ (clang-format)
  if (shouldRunDomain(domain, 'native')) {
    process.stdout.write(
      `  ${sym.arrow} Formatting C++ Adobe Scan Native sources (clang-format)... `,
    );
    const cppFiles = findFilesRecursive('extensions/adobescan-pdf-native', [
      '.cpp',
      '.hpp',
    ]);
    const clangFormatBin = Bun.which('clang-format');
    let cfPassed = true;
    let cfSummary = 'All C++ files formatted';
    let cfDuration = 0;
    if (!clangFormatBin) {
      const isCI = Boolean(process.env.CI || process.env.GITHUB_ACTIONS);
      if (isCI) {
        cfPassed = false;
        cfSummary = 'clang-format not found in PATH; required in CI';
      } else {
        cfPassed = true;
        cfSummary =
          'clang-format not found in PATH; skipped (install clang-format)';
      }
      console.log(cfPassed ? sym.warn : sym.err);
    } else {
      const cfArgs = checkOnly
        ? ['--dry-run', '--Werror', ...cppFiles]
        : ['-i', ...cppFiles];
      const cfRes = await execCommand('clang-format', cfArgs);
      cfDuration = cfRes.durationMs;
      cfPassed = cfRes.code === 0;
      cfSummary = checkOnly
        ? cfPassed
          ? 'All C++ files formatted'
          : 'C++ files need formatting'
        : 'Formatted C++ sources';
      console.log(cfPassed ? sym.ok : sym.err);
      if (!cfPassed) {
        printRawCommandOutput(cfRes.stdout, cfRes.stderr);
      }
    }
    results.push({
      title: 'C++ Adobe Scan Native (clang-format)',
      tool: 'clang-format',
      domain: 'native',
      success: cfPassed,
      durationMs: cfDuration,
      summary: cfSummary,
    });
  }
  return printResultsSummary('Format', results);
}

// ============================================================================
// LINT COMMAND
// ============================================================================
async function runLint(
  autoFix = false,
  domain: AuditDomain = 'all',
): Promise<PhaseResult> {
  const subtitle = `${autoFix ? 'auto-fix enabled' : 'auditing code quality'}${domain !== 'all' ? ` [domain: ${domain}]` : ''}`;
  printSectionHeader('Lint', subtitle);
  const results: StepResult[] = [];
  const allDiagnostics: Diagnostic[] = [];
  const ktlintPath = shouldRunDomain(domain, 'android')
    ? await ensureKtlint()
    : '';

  // 1. Oxlint (Web / TypeScript / Astro)
  if (shouldRunDomain(domain, 'web')) {
    process.stdout.write(
      `  ${sym.arrow} Linting TypeScript, Worker & Site (Oxlint)... `,
    );
    const oxlintArgs = ['oxlint', '--format', 'json'];
    if (autoFix) oxlintArgs.push('--fix');
    oxlintArgs.push('worker', 'site', 'scripts');

    const oxRes = await execCommand('bunx', oxlintArgs);
    const oxDiags: Diagnostic[] = [];
    try {
      const parsed = JSON.parse(oxRes.stdout);
      const diags = Array.isArray(parsed) ? parsed : parsed.diagnostics || [];
      for (const d of diags) {
        const loc = d.labels?.[0]?.span;
        oxDiags.push({
          tool: 'oxlint',
          file: d.filename || 'unknown',
          line: loc?.line,
          col: loc?.column,
          message: d.message,
          rule: d.code,
          severity: d.severity === 'error' ? 'error' : 'warning',
        });
      }
    } catch {
      printRawCommandOutput(oxRes.stdout, oxRes.stderr);
    }
    const oxErrors = oxDiags.filter((d) => d.severity === 'error').length;
    const oxWarns = oxDiags.filter((d) => d.severity === 'warning').length;
    const oxPassed = oxRes.code === 0 && oxErrors === 0;
    allDiagnostics.push(...oxDiags);

    console.log(oxPassed ? sym.ok : sym.err);
    results.push({
      title: 'TypeScript & Web (Oxlint)',
      tool: 'oxlint',
      domain: 'web',
      success: oxPassed,
      durationMs: oxRes.durationMs,
      summary: `${oxDiags.length === 0 ? 'No issues' : `${oxErrors} errors, ${oxWarns} warnings`}`,
      diagnostics: oxDiags,
    });
  }

  // 2. Ruff (Python)
  if (shouldRunDomain(domain, 'python')) {
    process.stdout.write(`  ${sym.arrow} Linting Python sources (Ruff)... `);
    const ruff = resolveRuffCommand();
    const ruffArgs = ['check', '--output-format', 'json'];
    if (autoFix) ruffArgs.push('--fix');
    ruffArgs.push('tools/apk-lab', '.github/scripts', 'extensions');

    const rRes = await execCommand(ruff.cmd, [...ruff.baseArgs, ...ruffArgs]);
    const rDiags: Diagnostic[] = [];
    try {
      const items = JSON.parse(rRes.stdout);
      if (Array.isArray(items)) {
        for (const item of items) {
          rDiags.push({
            tool: 'ruff',
            file: item.filename,
            line: item.location?.row,
            col: item.location?.column,
            message: item.message,
            rule: item.code,
            severity: 'error',
          });
        }
      }
    } catch {
      printRawCommandOutput(rRes.stdout, rRes.stderr);
    }
    const rPassed = rRes.code === 0 && rDiags.length === 0;
    allDiagnostics.push(...rDiags);

    console.log(rPassed ? sym.ok : sym.err);
    results.push({
      title: 'Python (Ruff check)',
      tool: 'ruff',
      domain: 'python',
      success: rPassed,
      durationMs: rRes.durationMs,
      summary: `${rDiags.length === 0 ? 'No issues' : `${rDiags.length} issues found`}`,
      diagnostics: rDiags,
    });
  }

  // 3. ktlint (Kotlin)
  if (shouldRunDomain(domain, 'android')) {
    process.stdout.write(`  ${sym.arrow} Linting Kotlin sources (ktlint)... `);
    const ktArgs = autoFix
      ? ['-F', 'patches/src/main/kotlin/**/*.kt']
      : ['patches/src/main/kotlin/**/*.kt', '--reporter=json'];

    const kRes = await execCommand(ktlintPath, ktArgs);
    const kDiags: Diagnostic[] = [];
    try {
      const files = JSON.parse(kRes.stdout);
      if (Array.isArray(files)) {
        for (const f of files) {
          for (const err of f.errors || []) {
            kDiags.push({
              tool: 'ktlint',
              file: f.file,
              line: err.line,
              col: err.column,
              message: err.message,
              rule: err.rule,
              severity: 'error',
            });
          }
        }
      }
    } catch {
      printRawCommandOutput(kRes.stdout, kRes.stderr);
    }
    const kPassed = kRes.code === 0 && kDiags.length === 0;
    allDiagnostics.push(...kDiags);

    console.log(kPassed ? sym.ok : sym.err);
    results.push({
      title: 'Kotlin (ktlint)',
      tool: 'ktlint',
      domain: 'android',
      success: kPassed,
      durationMs: kRes.durationMs,
      summary: `${kDiags.length === 0 ? 'No issues' : `${kDiags.length} issues found`}`,
      diagnostics: kDiags,
    });
  }

  // 4. Markdown Documentation (markdownlint-cli2)
  if (shouldRunDomain(domain, 'web')) {
    process.stdout.write(
      `  ${sym.arrow} Linting Markdown documentation (markdownlint-cli2)... `,
    );
    const mdArgs = autoFix
      ? ['markdownlint-cli2', '--fix']
      : ['markdownlint-cli2'];
    const mdRes = await execCommand('bunx', mdArgs);
    const mdDiags: Diagnostic[] = [];
    const mdOutput = `${mdRes.stderr}\n${mdRes.stdout}`;
    const mdRegex =
      /^(.+?):(\d+)(?::(\d+))?\s+(error|warning)\s+([A-Za-z0-9/_-]+)\s+(.*)$/;
    for (const line of mdOutput.split('\n')) {
      const trimmed = line.trim();
      const match = mdRegex.exec(trimmed);
      if (match) {
        mdDiags.push({
          tool: 'markdownlint',
          file: match[1],
          line: parseInt(match[2], 10),
          col: match[3] ? parseInt(match[3], 10) : undefined,
          severity: match[4] as 'error' | 'warning',
          rule: match[5],
          message: match[6],
        });
      }
    }
    const mdPassed =
      mdRes.code === 0 &&
      mdDiags.filter((d) => d.severity === 'error').length === 0;
    allDiagnostics.push(...mdDiags);

    console.log(mdPassed ? sym.ok : sym.err);
    results.push({
      title: 'Markdown Documentation (markdownlint-cli2)',
      tool: 'markdownlint',
      domain: 'web',
      success: mdPassed,
      durationMs: mdRes.durationMs,
      summary: `${mdDiags.length === 0 ? 'No issues' : `${mdDiags.length} issues found`}`,
      diagnostics: mdDiags,
    });
  }

  // 5. Rust (play-metadata clippy)
  if (shouldRunDomain(domain, 'rust')) {
    process.stdout.write(
      `  ${sym.arrow} Linting Rust play-metadata sources (clippy)... `,
    );
    const clippyArgs = [
      'clippy',
      '--locked',
      '--manifest-path',
      'tools/play-metadata/Cargo.toml',
      '--all-targets',
      ...(autoFix ? ['--fix', '--allow-dirty', '--allow-staged'] : []),
      '--',
      '-D',
      'warnings',
    ];
    const clippyRes = await execCommand('cargo', clippyArgs);
    const clippyPassed = clippyRes.code === 0;
    const clippyMissing =
      clippyRes.code !== 0 && clippyRes.stderr.includes('ENOENT');
    console.log(clippyPassed ? sym.ok : sym.err);
    if (!clippyPassed) {
      printRawCommandOutput(clippyRes.stdout, clippyRes.stderr);
    }
    results.push({
      title: 'Rust Play Metadata (clippy)',
      tool: 'clippy',
      domain: 'rust',
      success: clippyPassed,
      durationMs: clippyRes.durationMs,
      summary: clippyMissing
        ? 'cargo not found in PATH; install Rust toolchain (rustup.rs)'
        : clippyPassed
          ? 'No issues'
          : 'Clippy warnings/errors detected',
    });
  }

  // 5. Rust (nhl-adblock-native clippy)
  if (shouldRunDomain(domain, 'rust')) {
    process.stdout.write(
      `  ${sym.arrow} Linting Rust nhl-adblock-native sources (clippy)... `,
    );
    const nhlClippyArgs = [
      'clippy',
      '--locked',
      '--manifest-path',
      'extensions/nhl-adblock-native/Cargo.toml',
      '--all-targets',
      ...(autoFix ? ['--fix', '--allow-dirty', '--allow-staged'] : []),
      '--',
      '-D',
      'warnings',
    ];
    const nhlClippyRes = await execCommand('cargo', nhlClippyArgs);
    const nhlClippyPassed = nhlClippyRes.code === 0;
    const nhlClippyMissing =
      nhlClippyRes.code !== 0 && nhlClippyRes.stderr.includes('ENOENT');
    console.log(nhlClippyPassed ? sym.ok : sym.err);
    if (!nhlClippyPassed) {
      printRawCommandOutput(nhlClippyRes.stdout, nhlClippyRes.stderr);
    }
    results.push({
      title: 'Rust NHL AdBlock Native (clippy)',
      tool: 'clippy',
      domain: 'rust',
      success: nhlClippyPassed,
      durationMs: nhlClippyRes.durationMs,
      summary: nhlClippyMissing
        ? 'cargo not found in PATH; install Rust toolchain (rustup.rs)'
        : nhlClippyPassed
          ? 'No issues'
          : 'Clippy warnings/errors detected',
    });
  }

  // 6. C++ (CMake host build with -Wall -Wextra -Werror)
  if (shouldRunDomain(domain, 'native')) {
    process.stdout.write(
      `  ${sym.arrow} Linting C++ Adobe Scan Native engine (-Wall -Wextra)... `,
    );
    const scanNativeDir = 'extensions/adobescan-pdf-native';
    const scanHostBuildDir = `${scanNativeDir}/build/host`;
    const cmakeBin = Bun.which('cmake');
    const ninjaBin = Bun.which('ninja');
    let cppLintPassed = true;
    let cppLintDuration = 0;
    let cppLintSummary = 'No warnings or errors';

    if (!cmakeBin || !ninjaBin) {
      cppLintPassed = false;
      cppLintSummary =
        'cmake or ninja not found in PATH; install cmake and ninja';
      console.log(sym.err);
    } else {
      const cmakeLintConfig = await execCommand('cmake', [
        '-S',
        scanNativeDir,
        '-B',
        scanHostBuildDir,
        '-G',
        'Ninja',
        '-DAIDAN_SCAN_PDF_HOST_TESTS=ON',
      ]);
      cppLintDuration += cmakeLintConfig.durationMs;
      if (cmakeLintConfig.code !== 0) {
        cppLintPassed = false;
        cppLintSummary = 'CMake configuration failed';
        console.log(sym.err);
        printRawCommandOutput(cmakeLintConfig.stdout, cmakeLintConfig.stderr);
      } else {
        const cmakeLintBuild = await execCommand('cmake', [
          '--build',
          scanHostBuildDir,
          '--target',
          'aidanscanpdf_static',
          'adobescan_pdf_test',
        ]);
        cppLintDuration += cmakeLintBuild.durationMs;
        cppLintPassed = cmakeLintBuild.code === 0;
        cppLintSummary = cppLintPassed
          ? 'No warnings or errors'
          : 'C++ compilation warnings/errors detected';
        console.log(cppLintPassed ? sym.ok : sym.err);
        if (!cppLintPassed) {
          printRawCommandOutput(cmakeLintBuild.stdout, cmakeLintBuild.stderr);
        }
      }
    }
    results.push({
      title: 'C++ Adobe Scan Native (clang/gcc lint)',
      tool: 'cmake/ninja',
      domain: 'native',
      success: cppLintPassed,
      durationMs: cppLintDuration,
      summary: cppLintSummary,
    });
  }
  renderDiagnostics(allDiagnostics);
  return printResultsSummary('Lint', results);
}

// ============================================================================
// TYPECHECK COMMAND
// ============================================================================
async function runTypecheck(domain: AuditDomain = 'all'): Promise<PhaseResult> {
  const subtitle = `TypeScript, Astro, Python, Rust, C++, and Kotlin/Java${domain !== 'all' ? ` [domain: ${domain}]` : ''}`;
  printSectionHeader('Typecheck', subtitle);
  const results: StepResult[] = [];

  // 1. Worker TypeScript (tsc)
  if (shouldRunDomain(domain, 'web')) {
    process.stdout.write(
      `  ${sym.arrow} Checking Cloudflare Worker types (tsc)... `,
    );
    const wRes = await execCommand('bun', ['run', '--cwd', 'worker', 'check']);
    const wPassed = wRes.code === 0;
    console.log(wPassed ? sym.ok : sym.err);
    if (!wPassed) {
      printRawCommandOutput(wRes.stdout, wRes.stderr);
    }
    results.push({
      title: 'Cloudflare Worker (tsc)',
      tool: 'tsc',
      domain: 'web',
      success: wPassed,
      durationMs: wRes.durationMs,
      summary: wPassed
        ? 'Clean, no type diagnostics'
        : 'TypeScript errors encountered',
    });
  }

  // 2. Astro Site (astro check)
  if (shouldRunDomain(domain, 'web')) {
    process.stdout.write(
      `  ${sym.arrow} Checking Astro Site types (astro check)... `,
    );
    const sRes = await execCommand('bun', ['run', '--cwd', 'site', 'check']);
    const sPassed = sRes.code === 0;
    console.log(sPassed ? sym.ok : sym.err);
    if (!sPassed) {
      printRawCommandOutput(sRes.stdout, sRes.stderr);
    }
    results.push({
      title: 'Astro Site (astro check)',
      tool: 'astro check',
      domain: 'web',
      success: sPassed,
      durationMs: sRes.durationMs,
      summary: sPassed
        ? '0 errors, 0 warnings'
        : 'Astro check diagnostics reported',
    });
  }

  // 3. Python (mypy on tools/apk-lab)
  if (shouldRunDomain(domain, 'python')) {
    process.stdout.write(
      `  ${sym.arrow} Checking Python types (mypy on apk-lab)... `,
    );
    const pyRes = await execCommand('uv', [
      'run',
      '--project',
      'tools/apk-lab',
      '--with',
      'mypy',
      'mypy',
      'tools/apk-lab/apk_lab',
      '--ignore-missing-imports',
    ]);
    const pyPassed = pyRes.code === 0;
    console.log(pyPassed ? sym.ok : sym.err);
    if (!pyPassed) {
      printRawCommandOutput(pyRes.stdout, pyRes.stderr);
    }
    results.push({
      title: 'APK Lab Python (mypy)',
      tool: 'mypy',
      domain: 'python',
      success: pyPassed,
      durationMs: pyRes.durationMs,
      summary: pyPassed ? '15 source files verified' : 'Mypy type errors found',
    });
  }

  // 4. Morphe Patches & Extensions (Gradle compileKotlin + compileReleaseJavaWithJavac)
  if (shouldRunDomain(domain, 'android')) {
    process.stdout.write(
      `  ${sym.arrow} Compiling Morphe Patches & Extension (Gradle)... `,
    );
    const gRes = await execCommand('./gradlew', [
      ':patches:compileKotlin',
      ':extensions:extension:compileReleaseJavaWithJavac',
      '--console=plain',
    ]);
    const gPassed = gRes.code === 0;
    console.log(gPassed ? sym.ok : sym.err);
    if (!gPassed) {
      printRawCommandOutput(gRes.stdout, gRes.stderr);
    }
    results.push({
      title: 'Morphe Patches (Gradle)',
      tool: 'gradle',
      domain: 'android',
      success: gPassed,
      durationMs: gRes.durationMs,
      summary: gPassed
        ? 'Kotlin and Java compilation successful'
        : 'Compilation failed',
    });
  }

  // 5. Rust (play-metadata cargo check)
  if (shouldRunDomain(domain, 'rust')) {
    process.stdout.write(
      `  ${sym.arrow} Checking Rust play-metadata types (cargo check)... `,
    );
    const rustCheckArgs = [
      'check',
      '--locked',
      '--manifest-path',
      'tools/play-metadata/Cargo.toml',
      '--all-targets',
    ];
    const rustCheckRes = await execCommand('cargo', rustCheckArgs);
    const rustCheckPassed = rustCheckRes.code === 0;
    const rustCheckMissing =
      rustCheckRes.code !== 0 && rustCheckRes.stderr.includes('ENOENT');
    console.log(rustCheckPassed ? sym.ok : sym.err);
    if (!rustCheckPassed) {
      printRawCommandOutput(rustCheckRes.stdout, rustCheckRes.stderr);
    }
    results.push({
      title: 'Rust Play Metadata (cargo check)',
      tool: 'cargo check',
      domain: 'rust',
      success: rustCheckPassed,
      durationMs: rustCheckRes.durationMs,
      summary: rustCheckMissing
        ? 'cargo not found in PATH; install Rust toolchain (rustup.rs)'
        : rustCheckPassed
          ? 'All targets checked clean'
          : 'Cargo check errors detected',
    });
  }

  // 6. Rust (nhl-adblock-native cargo check)
  if (shouldRunDomain(domain, 'rust')) {
    process.stdout.write(
      `  ${sym.arrow} Checking Rust nhl-adblock-native types (cargo check)... `,
    );
    const nhlCheckArgs = [
      'check',
      '--locked',
      '--manifest-path',
      'extensions/nhl-adblock-native/Cargo.toml',
      '--all-targets',
    ];
    const nhlCheckRes = await execCommand('cargo', nhlCheckArgs);
    const nhlCheckPassed = nhlCheckRes.code === 0;
    const nhlCheckMissing =
      nhlCheckRes.code !== 0 && nhlCheckRes.stderr.includes('ENOENT');
    console.log(nhlCheckPassed ? sym.ok : sym.err);
    if (!nhlCheckPassed) {
      printRawCommandOutput(nhlCheckRes.stdout, nhlCheckRes.stderr);
    }
    results.push({
      title: 'Rust NHL AdBlock Native (cargo check)',
      tool: 'cargo check',
      domain: 'rust',
      success: nhlCheckPassed,
      durationMs: nhlCheckRes.durationMs,
      summary: nhlCheckMissing
        ? 'cargo not found in PATH; install Rust toolchain (rustup.rs)'
        : nhlCheckPassed
          ? 'All targets checked clean'
          : 'Cargo check errors detected',
    });
  }

  // 7. C++ (CMake host target compilation)
  if (shouldRunDomain(domain, 'native')) {
    process.stdout.write(
      `  ${sym.arrow} Compiling C++ Adobe Scan Native host targets (CMake)... `,
    );
    const scanNativeDir = 'extensions/adobescan-pdf-native';
    const scanHostBuildDir = `${scanNativeDir}/build/host`;
    const cmakeBin = Bun.which('cmake');
    const ninjaBin = Bun.which('ninja');
    let cppTypecheckPassed = true;
    let cppTypecheckDuration = 0;
    let cppTypecheckSummary = 'Host targets built clean';

    if (!cmakeBin || !ninjaBin) {
      cppTypecheckPassed = false;
      cppTypecheckSummary =
        'cmake or ninja not found in PATH; install cmake and ninja';
      console.log(sym.err);
    } else {
      const cmakeConfig = await execCommand('cmake', [
        '-S',
        scanNativeDir,
        '-B',
        scanHostBuildDir,
        '-G',
        'Ninja',
        '-DAIDAN_SCAN_PDF_HOST_TESTS=ON',
      ]);
      cppTypecheckDuration += cmakeConfig.durationMs;
      if (cmakeConfig.code !== 0) {
        cppTypecheckPassed = false;
        cppTypecheckSummary = 'CMake configure failed';
        console.log(sym.err);
        printRawCommandOutput(cmakeConfig.stdout, cmakeConfig.stderr);
      } else {
        const cmakeBuild = await execCommand('cmake', [
          '--build',
          scanHostBuildDir,
        ]);
        cppTypecheckDuration += cmakeBuild.durationMs;
        cppTypecheckPassed = cmakeBuild.code === 0;
        cppTypecheckSummary = cppTypecheckPassed
          ? 'Host targets built clean'
          : 'C++ compilation failed';
        console.log(cppTypecheckPassed ? sym.ok : sym.err);
        if (!cppTypecheckPassed) {
          printRawCommandOutput(cmakeBuild.stdout, cmakeBuild.stderr);
        }
      }
    }
    results.push({
      title: 'C++ Adobe Scan Native (CMake)',
      tool: 'cmake',
      domain: 'native',
      success: cppTypecheckPassed,
      durationMs: cppTypecheckDuration,
      summary: cppTypecheckSummary,
    });
  }

  return printResultsSummary('Typecheck', results);
}

// ============================================================================
// TEST COMMAND
// ============================================================================
async function runTest(domain: AuditDomain = 'all'): Promise<PhaseResult> {
  const subtitle = `auditing all automated test suites${domain !== 'all' ? ` [domain: ${domain}]` : ''}`;
  printSectionHeader('Test', subtitle);
  const results: StepResult[] = [];

  // 1. APK Lab Python test suite (pytest)
  if (shouldRunDomain(domain, 'python')) {
    process.stdout.write(`  ${sym.arrow} Running APK Lab tests (pytest)... `);
    const pyRes = await execCommand('uv', [
      'run',
      '--project',
      'tools/apk-lab',
      'pytest',
      '-q',
    ]);
    const pyPassed = pyRes.code === 0;
    const pySummaryMatch = pyRes.stdout.match(/([0-9]+ passed[^\n]*)/);
    const pySummary = pySummaryMatch
      ? pySummaryMatch[1].trim()
      : pyPassed
        ? 'All tests passed'
        : 'Tests failed';
    console.log(pyPassed ? sym.ok : sym.err);
    if (!pyPassed) {
      printRawCommandOutput(pyRes.stdout, pyRes.stderr);
    }
    results.push({
      title: 'APK Lab Suite (pytest)',
      tool: 'pytest',
      domain: 'python',
      success: pyPassed,
      durationMs: pyRes.durationMs,
      summary: pySummary,
    });
  }

  // 2. Cloudflare Worker test suite (Vitest)
  if (shouldRunDomain(domain, 'web')) {
    process.stdout.write(`  ${sym.arrow} Running Worker tests (Vitest)... `);
    const wRes = await execCommand('bun', ['run', '--cwd', 'worker', 'test']);
    const wPassed = wRes.code === 0;
    const wSummaryMatch = wRes.stdout.match(/Tests\s+([0-9]+ passed[^\n]*)/);
    const wSummary = wSummaryMatch
      ? wSummaryMatch[1].trim()
      : wPassed
        ? 'All tests passed'
        : 'Tests failed';
    console.log(wPassed ? sym.ok : sym.err);
    if (!wPassed) {
      printRawCommandOutput(wRes.stdout, wRes.stderr);
    }
    results.push({
      title: 'Worker Suite (Vitest)',
      tool: 'vitest',
      domain: 'web',
      success: wPassed,
      durationMs: wRes.durationMs,
      summary: wSummary,
    });
  }

  // 3. Astro Site test suite (Bun test)
  if (shouldRunDomain(domain, 'web')) {
    process.stdout.write(`  ${sym.arrow} Running Site tests (Bun test)... `);
    const sRes = await execCommand('bun', ['run', '--cwd', 'site', 'test']);
    const sPassed = sRes.code === 0;
    const sSummaryMatch = sRes.stdout.match(/([0-9]+ pass[^\n]*)/);
    const sSummary = sSummaryMatch
      ? sSummaryMatch[1].trim()
      : sPassed
        ? 'All tests passed'
        : 'Tests failed';
    console.log(sPassed ? sym.ok : sym.err);
    if (!sPassed) {
      printRawCommandOutput(sRes.stdout, sRes.stderr);
    }
    results.push({
      title: 'Site Suite (Bun test)',
      tool: 'bun test',
      domain: 'web',
      success: sPassed,
      durationMs: sRes.durationMs,
      summary: sSummary,
    });
  }

  // 4. Rust Play Metadata test suite (cargo test)
  if (shouldRunDomain(domain, 'rust')) {
    process.stdout.write(
      `  ${sym.arrow} Running Rust Play Metadata tests (cargo test)... `,
    );
    const cargoTestRes = await execCommand('cargo', [
      'test',
      '--locked',
      '--manifest-path',
      'tools/play-metadata/Cargo.toml',
    ]);
    const cargoTestPassed = cargoTestRes.code === 0;
    const cargoTestMissing =
      cargoTestRes.code !== 0 && cargoTestRes.stderr.includes('ENOENT');
    const cargoSummaryMatch = cargoTestRes.stdout.match(
      /test result: ok\.\s+([0-9]+ passed[^\n]*)/,
    );
    const cargoSummary = cargoTestMissing
      ? 'cargo not found in PATH; install Rust toolchain (rustup.rs)'
      : cargoSummaryMatch
        ? cargoSummaryMatch[1].trim()
        : cargoTestPassed
          ? 'All tests passed'
          : 'Tests failed';
    console.log(cargoTestPassed ? sym.ok : sym.err);
    if (!cargoTestPassed) {
      printRawCommandOutput(cargoTestRes.stdout, cargoTestRes.stderr);
    }
    results.push({
      title: 'Rust Play Metadata (cargo test)',
      tool: 'cargo test',
      domain: 'rust',
      success: cargoTestPassed,
      durationMs: cargoTestRes.durationMs,
      summary: cargoSummary,
    });
  }

  // 5. Rust NHL AdBlock Native test suite (cargo test)
  if (shouldRunDomain(domain, 'rust')) {
    process.stdout.write(
      `  ${sym.arrow} Running Rust NHL AdBlock Native tests (cargo test)... `,
    );
    const nhlTestRes = await execCommand('cargo', [
      'test',
      '--locked',
      '--manifest-path',
      'extensions/nhl-adblock-native/Cargo.toml',
    ]);
    const nhlTestPassed = nhlTestRes.code === 0;
    const nhlTestMissing =
      nhlTestRes.code !== 0 && nhlTestRes.stderr.includes('ENOENT');
    const nhlSummaryMatch = nhlTestRes.stdout.match(
      /test result: ok\.\s+([0-9]+ passed[^\n]*)/,
    );
    const nhlSummary = nhlTestMissing
      ? 'cargo not found in PATH; install Rust toolchain (rustup.rs)'
      : nhlSummaryMatch
        ? nhlSummaryMatch[1].trim()
        : nhlTestPassed
          ? 'All tests passed'
          : 'Tests failed';
    console.log(nhlTestPassed ? sym.ok : sym.err);
    if (!nhlTestPassed) {
      printRawCommandOutput(nhlTestRes.stdout, nhlTestRes.stderr);
    }
    results.push({
      title: 'Rust NHL AdBlock Native (cargo test)',
      tool: 'cargo test',
      domain: 'rust',
      success: nhlTestPassed,
      durationMs: nhlTestRes.durationMs,
      summary: nhlSummary,
    });
  }

  // 6. Adobe Scan Native PDF Engine test suite (ctest)
  if (shouldRunDomain(domain, 'native')) {
    process.stdout.write(
      `  ${sym.arrow} Running Adobe Scan Native PDF Engine tests (ctest)... `,
    );
    const scanNativeDir = 'extensions/adobescan-pdf-native';
    const scanHostBuildDir = `${scanNativeDir}/build/host`;
    const ctestBin = Bun.which('ctest');
    const cmakeBin = Bun.which('cmake');
    let scanPassed = true;
    let scanSummary = 'All tests passed';
    let scanDuration = 0;

    if (!ctestBin || !cmakeBin) {
      scanPassed = false;
      scanSummary = 'ctest or cmake not found in PATH; install cmake and ninja';
      console.log(sym.err);
    } else {
      const configureRes = await execCommand('cmake', [
        '-S',
        scanNativeDir,
        '-B',
        scanHostBuildDir,
        '-G',
        'Ninja',
        '-DAIDAN_SCAN_PDF_HOST_TESTS=ON',
      ]);
      scanDuration += configureRes.durationMs;
      if (configureRes.code !== 0) {
        scanPassed = false;
        scanSummary = 'CMake configuration failed';
        console.log(sym.err);
        printRawCommandOutput(configureRes.stdout, configureRes.stderr);
      } else {
        const cmakeBuild = await execCommand('cmake', [
          '--build',
          scanHostBuildDir,
        ]);
        scanDuration += cmakeBuild.durationMs;
        if (cmakeBuild.code !== 0) {
          scanPassed = false;
          scanSummary = 'CMake build failed';
          console.log(sym.err);
          printRawCommandOutput(cmakeBuild.stdout, cmakeBuild.stderr);
        } else {
          const ctestRes = await execCommand('ctest', [
            '--test-dir',
            scanHostBuildDir,
            '--output-on-failure',
          ]);
          scanDuration += ctestRes.durationMs;
          scanPassed = ctestRes.code === 0;
          const ctestMatch = ctestRes.stdout.match(
            /([0-9]+% tests passed[^\n]*)/,
          );
          scanSummary = ctestMatch
            ? ctestMatch[1].trim()
            : scanPassed
              ? 'All tests passed'
              : 'Tests failed';
          console.log(scanPassed ? sym.ok : sym.err);
          if (!scanPassed) {
            printRawCommandOutput(ctestRes.stdout, ctestRes.stderr);
          }
        }
      }
    }
    results.push({
      title: 'Adobe Scan Native Engine (ctest)',
      tool: 'ctest',
      domain: 'native',
      success: scanPassed,
      durationMs: scanDuration,
      summary: scanSummary,
    });
  }

  // 7. Adobe Scan Extension Java Unit Tests (Gradle)
  if (shouldRunDomain(domain, 'android')) {
    process.stdout.write(
      `  ${sym.arrow} Running Extension unit tests (Gradle)... `,
    );
    const extTestRes = await execCommand('./gradlew', [
      ':extensions:extension:testReleaseUnitTest',
      '--console=plain',
    ]);
    const extTestPassed = extTestRes.code === 0;
    console.log(extTestPassed ? sym.ok : sym.err);
    if (!extTestPassed) {
      printRawCommandOutput(extTestRes.stdout, extTestRes.stderr);
    }
    results.push({
      title: 'Extension Unit Tests (Gradle)',
      tool: 'gradle test',
      domain: 'android',
      success: extTestPassed,
      durationMs: extTestRes.durationMs,
      summary: extTestPassed ? 'All tests passed' : 'Tests failed',
    });
  }

  // 8. Target Application Icons Check
  if (shouldRunDomain(domain, 'python')) {
    process.stdout.write(
      `  ${sym.arrow} Verifying application icon assets... `,
    );
    const iconRes = await execCommand('python3', [
      '.github/scripts/sync_app_icons.py',
      '--check-only',
    ]);
    const iconPassed = iconRes.code === 0;
    console.log(iconPassed ? sym.ok : sym.err);
    if (!iconPassed) {
      printRawCommandOutput(iconRes.stdout, iconRes.stderr);
    }
    results.push({
      title: 'App Icons Verification',
      tool: 'python3',
      domain: 'python',
      success: iconPassed,
      durationMs: iconRes.durationMs,
      summary: iconPassed ? iconRes.stdout.trim() : 'Missing application icons',
    });
  }

  // 9. Scripts & Dependencies test suite (bun test)
  if (shouldRunDomain(domain, 'web')) {
    process.stdout.write(
      `  ${sym.arrow} Running Scripts & Dependencies tests (bun test)... `,
    );
    const dtRes = await execCommand('bun', [
      'test',
      '--timeout=30000',
      'scripts/dependencies',
    ]);
    const dtPassed = dtRes.code === 0;
    const dtSummaryMatch = dtRes.stdout.match(/([0-9]+ pass[^\n]*)/);
    const dtSummary = dtSummaryMatch
      ? dtSummaryMatch[1].trim()
      : dtPassed
        ? 'All tests passed'
        : 'Tests failed';
    console.log(dtPassed ? sym.ok : sym.err);
    if (!dtPassed) {
      printRawCommandOutput(dtRes.stdout, dtRes.stderr);
    }
    results.push({
      title: 'Scripts & Dependencies (bun test)',
      tool: 'bun test',
      domain: 'web',
      success: dtPassed,
      durationMs: dtRes.durationMs,
      summary: dtSummary,
    });
  }

  // 10. Documentation & Link Integrity (bun test)
  if (shouldRunDomain(domain, 'web')) {
    process.stdout.write(
      `  ${sym.arrow} Running Documentation & Link Integrity tests (bun test)... `,
    );
    const docTestRes = await execCommand('bun', ['test', 'scripts/docs']);
    const docTestPassed = docTestRes.code === 0;
    const docTestSummaryMatch = docTestRes.stdout.match(/([0-9]+ pass[^\n]*)/);
    const docTestSummary = docTestSummaryMatch
      ? docTestSummaryMatch[1].trim()
      : docTestPassed
        ? 'All tests passed'
        : 'Tests failed';
    console.log(docTestPassed ? sym.ok : sym.err);
    if (!docTestPassed) {
      printRawCommandOutput(docTestRes.stdout, docTestRes.stderr);
    }
    results.push({
      title: 'Documentation & Link Integrity (bun test)',
      tool: 'bun test',
      domain: 'web',
      success: docTestPassed,
      durationMs: docTestRes.durationMs,
      summary: docTestSummary,
    });
  }
  return printResultsSummary('Test', results);
}

// DEPENDENCIES AUDIT COMMAND
// ============================================================================
async function runDeps(): Promise<PhaseResult> {
  printSectionHeader(
    'Dependencies',
    'auditing repository dependency freshness',
  );
  const results: StepResult[] = [];
  process.stdout.write(`  ${sym.arrow} Checking repository dependencies... `);
  const depsRes = await execCommand('bun', [
    'scripts/deps.ts',
    'check',
    '--json',
  ]);
  const hasUpdates = depsRes.code === 2;
  const passed = depsRes.code === 0;

  let report: {
    items?: Array<{
      id: string;
      ecosystem: string;
      name: string;
      status: string;
      reason?: string;
      durationMs?: number;
    }>;
    summary?: {
      total?: number;
      update?: number;
      held?: number;
      error?: number;
    };
  } | null = null;

  try {
    report = JSON.parse(depsRes.stdout);
  } catch {
    report = null;
  }

  if (!report || !Array.isArray(report.items)) {
    console.log(sym.err);
    printRawCommandOutput(depsRes.stdout, depsRes.stderr);
    results.push({
      title: 'Dependency Freshness Check',
      tool: 'deps check',
      success: false,
      durationMs: depsRes.durationMs,
      summary: 'Malformed or missing JSON report from dependency checker',
    });
    return printResultsSummary('Dependencies', results);
  }

  console.log(passed ? sym.ok : hasUpdates ? sym.warn : sym.err);

  const ecosystemGroups: Record<
    string,
    Array<{
      id: string;
      name: string;
      status: string;
      reason?: string;
      durationMs?: number;
    }>
  > = {
    'JavaScript (NPM / Bun)': [],
    'Python (PyPI / uv)': [],
    'Rust (crates.io / Cargo)': [],
    'Gradle Plugins & Libraries': [],
    'External APK Tools': [],
    'GitHub Actions & Hooks': [],
    'Toolchains & Runtimes': [],
    'Embedded Assets': [],
  };

  for (const item of report.items) {
    if (item.ecosystem === 'npm')
      ecosystemGroups['JavaScript (NPM / Bun)'].push(item);
    else if (item.ecosystem === 'pypi')
      ecosystemGroups['Python (PyPI / uv)'].push(item);
    else if (item.ecosystem === 'crates')
      ecosystemGroups['Rust (crates.io / Cargo)'].push(item);
    else if (item.ecosystem === 'gradle')
      ecosystemGroups['Gradle Plugins & Libraries'].push(item);
    else if (item.id.startsWith('tool:apk-lab/'))
      ecosystemGroups['External APK Tools'].push(item);
    else if (item.ecosystem === 'action' || item.ecosystem === 'hook')
      ecosystemGroups['GitHub Actions & Hooks'].push(item);
    else if (item.ecosystem === 'embedded')
      ecosystemGroups['Embedded Assets'].push(item);
    else ecosystemGroups['Toolchains & Runtimes'].push(item);
  }

  for (const [groupName, groupItems] of Object.entries(ecosystemGroups)) {
    if (groupItems.length === 0) continue;
    const groupDuration = groupItems.reduce(
      (acc, i) => acc + (i.durationMs || 0),
      0,
    );
    const groupUpdates = groupItems.filter((i) => i.status === 'update').length;
    const groupErrors = groupItems.filter((i) => i.status === 'error').length;
    const groupBlocked = groupItems.filter(
      (i) => i.status === 'blocked',
    ).length;
    const groupUnsupported = groupItems.filter(
      (i) => i.status === 'unsupported',
    ).length;
    const groupSuccess =
      groupUpdates === 0 &&
      groupErrors === 0 &&
      groupBlocked === 0 &&
      groupUnsupported === 0;

    let summaryStr = `All ${groupItems.length} items up to date or held`;
    if (groupErrors > 0) {
      const errReasons = groupItems
        .filter((i) => i.status === 'error')
        .map((i) => i.reason)
        .filter(Boolean);
      summaryStr = `${groupErrors} errors (${errReasons[0] || 'lookup failed'})`;
    } else if (groupBlocked > 0) {
      const blockedReasons = groupItems
        .filter((i) => i.status === 'blocked')
        .map((i) => i.reason)
        .filter(Boolean);
      summaryStr = `${groupBlocked} blocked (${blockedReasons[0] || 'policy/compatibility conflict'})`;
    } else if (groupUnsupported > 0) {
      const unsupportedReasons = groupItems
        .filter((i) => i.status === 'unsupported')
        .map((i) => i.reason)
        .filter(Boolean);
      summaryStr = `${groupUnsupported} unsupported (${unsupportedReasons[0] || 'requires attention'})`;
    } else if (groupUpdates > 0) {
      summaryStr = `${groupUpdates} updates available (run 'bun run deps:update')`;
    }

    results.push({
      title: groupName,
      tool: 'deps check',
      success: groupSuccess,
      durationMs: groupDuration,
      summary: summaryStr,
    });
  }

  return printResultsSummary('Dependencies', results);
}

// ============================================================================
// CLI DISPATCHER
// ============================================================================
function printUsage(exitCode = 0): never {
  console.log(`
${c.bold}Usage:${c.reset} bun scripts/audit.ts [command] [options]

${c.bold}Commands:${c.reset}
  format        Format code in-place
  format:check  Audit formatting without mutating files
  lint          Audit code quality and static analysis
  lint:fix      Audit and auto-fix supported lint rules
  typecheck     Audit types across TypeScript, Python, Kotlin/Java, Rust, and C++
  test          Run automated test suites
  deps          Audit dependency freshness
  all           Run format:check, lint, typecheck, and test (default)

${c.bold}Options:${c.reset}
  --domain, --stack <name>  Target a specific domain (${VALID_DOMAINS.join('|')}) [default: all]
  --check                   Check formatting only (for format command)
  --fix                     Auto-fix lint rules (for lint command)
  --deps                    Include dependency freshness phase in "all"
  -h, --help                Show this help message
`);
  process.exit(exitCode);
}

const KNOWN_COMMANDS = [
  'format',
  'format:check',
  'lint',
  'lint:fix',
  'typecheck',
  'test',
  'deps',
  'all',
] as const;
type AuditCommand = (typeof KNOWN_COMMANDS)[number];

async function main() {
  const rawArgs = process.argv.slice(2);
  let cmd: string | undefined;
  let domain: AuditDomain = 'all';
  let checkOnly = false;
  let autoFix = false;
  let includeDeps = false;

  for (let i = 0; i < rawArgs.length; i++) {
    const arg = rawArgs[i];
    if (arg === '--help' || arg === '-h') {
      printUsage(0);
    } else if (arg === '--check') {
      checkOnly = true;
    } else if (arg === '--fix') {
      autoFix = true;
    } else if (arg === '--deps') {
      includeDeps = true;
    } else if (arg === '--domain' || arg === '--stack') {
      const next = rawArgs[++i];
      if (!next) {
        console.error(
          `${c.bold}${c.red}Error:${c.reset} Missing value for ${arg}`,
        );
        printUsage(1);
      }
      if (!isDomainValid(next)) {
        console.error(
          `${c.bold}${c.red}Error:${c.reset} Unknown domain "${next}". Valid domains: ${VALID_DOMAINS.join(', ')}`,
        );
        process.exit(1);
      }
      domain = next;
    } else if (arg.startsWith('--domain=') || arg.startsWith('--stack=')) {
      const val = arg.split('=')[1];
      if (!isDomainValid(val)) {
        console.error(
          `${c.bold}${c.red}Error:${c.reset} Unknown domain "${val}". Valid domains: ${VALID_DOMAINS.join(', ')}`,
        );
        process.exit(1);
      }
      domain = val;
    } else if (!arg.startsWith('-')) {
      if (!cmd) {
        cmd = arg;
      } else {
        console.error(
          `${c.bold}${c.red}Error:${c.reset} Unexpected argument: ${arg}`,
        );
        printUsage(1);
      }
    } else {
      console.error(`${c.bold}${c.red}Error:${c.reset} Unknown flag: ${arg}`);
      printUsage(1);
    }
  }

  const resolvedCmd = (cmd || 'all') as AuditCommand;
  if (!KNOWN_COMMANDS.includes(resolvedCmd)) {
    console.error(`Unknown command: ${resolvedCmd}`);
    console.error(`Usage: bun scripts/audit.ts <${KNOWN_COMMANDS.join('|')}>`);
    process.exit(1);
  }

  let success = true;
  switch (resolvedCmd) {
    case 'format': {
      const phase = await runFormat(checkOnly, domain);
      success = phase.success;
      break;
    }
    case 'format:check': {
      const phase = await runFormat(true, domain);
      success = phase.success;
      break;
    }
    case 'lint': {
      const phase = await runLint(autoFix, domain);
      success = phase.success;
      break;
    }
    case 'lint:fix': {
      const phase = await runLint(true, domain);
      success = phase.success;
      break;
    }
    case 'typecheck': {
      const phase = await runTypecheck(domain);
      success = phase.success;
      break;
    }
    case 'test': {
      const phase = await runTest(domain);
      success = phase.success;
      break;
    }
    case 'deps': {
      const phase = await runDeps();
      success = phase.success;
      break;
    }
    case 'all': {
      const fPhase = await runFormat(true, domain);
      const lPhase = await runLint(false, domain);
      const tPhase = await runTypecheck(domain);
      const testPhase = await runTest(domain);
      const phases = [fPhase, lPhase, tPhase, testPhase];
      if (includeDeps) {
        const dPhase = await runDeps();
        phases.push(dPhase);
      }
      success = printFullAuditSummary(phases);
      break;
    }
  }

  process.exit(success ? 0 : 1);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
