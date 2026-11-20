import type {
  DependencyItem,
  DependencyReport,
  DependencySummary,
} from './model';

const c = {
  reset: '\x1b[0m',
  bold: '\x1b[1m',
  dim: '\x1b[2m',
  green: '\x1b[32m',
  red: '\x1b[31m',
  yellow: '\x1b[33m',
  cyan: '\x1b[36m',
  gray: '\x1b[90m',
  magenta: '\x1b[35m',
};

const sym = {
  ok: `${c.green}✔${c.reset}`,
  update: `${c.yellow}▲${c.reset}`,
  held: `${c.cyan}🔒${c.reset}`,
  moving: `${c.gray}↻${c.reset}`,
  ahead: `${c.magenta}★${c.reset}`,
  unused: `${c.gray}∅${c.reset}`,
  blocked: `${c.red}⛔${c.reset}`,
  warn: `${c.yellow}⚠${c.reset}`,
  err: `${c.red}✖${c.reset}`,
};

export function formatDuration(ms: number): string {
  return ms < 1000 ? `${ms}ms` : `${(ms / 1000).toFixed(2)}s`;
}

export function isMajorUpdate(current: string, next: string): boolean {
  const cleanCur = current
    .replace(/^[v=><~^ ]+/, '')
    .trim()
    .split('.')[0];
  const cleanNext = next
    .replace(/^[v=><~^ ]+/, '')
    .trim()
    .split('.')[0];
  const numCur = parseInt(cleanCur, 10);
  const numNext = parseInt(cleanNext, 10);
  return !isNaN(numCur) && !isNaN(numNext) && numNext > numCur;
}

export function buildSummary(
  items: DependencyItem[],
  totalDurationMs: number,
): DependencySummary {
  const summary: DependencySummary = {
    total: items.length,
    current: 0,
    update: 0,
    held: 0,
    moving: 0,
    ahead: 0,
    unused: 0,
    notChecked: 0,
    blocked: 0,
    unsupported: 0,
    error: 0,
    durationMs: totalDurationMs,
  };

  for (const item of items) {
    if (item.status === 'current') summary.current++;
    else if (item.status === 'update') summary.update++;
    else if (item.status === 'held') summary.held++;
    else if (item.status === 'moving') summary.moving++;
    else if (item.status === 'ahead') summary.ahead++;
    else if (item.status === 'unused') summary.unused++;
    else if (item.status === 'not-checked') summary.notChecked++;
    else if (item.status === 'blocked') summary.blocked++;
    else if (item.status === 'unsupported') summary.unsupported++;
    else if (item.status === 'error') summary.error++;
  }

  return summary;
}

export function formatTextReport(
  report: DependencyReport,
  useColor = true,
): string {
  const lines: string[] = [];
  const color = useColor && !process.env.NO_COLOR;

  function style(str: string, styleCode: string): string {
    return color ? `${styleCode}${str}${c.reset}` : str;
  }

  lines.push('');
  lines.push(
    style(
      '=== REPOSITORY DEPENDENCY FRESHNESS AUDIT ===',
      `${c.bold}${c.cyan}`,
    ),
  );
  lines.push('');

  const ecosystemGroups: Record<string, DependencyItem[]> = {
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

    lines.push(style(`── ${groupName} ──`, `${c.bold}${c.gray}`));

    const maxNameLen = Math.max(26, ...groupItems.map((i) => i.name.length));

    for (const item of groupItems) {
      let icon = sym.ok;
      let statusStr = style('current', c.green);

      if (item.status === 'update') {
        const major = isMajorUpdate(
          item.resolved || item.declared,
          item.latest || '',
        );
        icon = sym.update;
        statusStr = major
          ? style('MAJOR UPDATE', `${c.bold}${c.yellow}`)
          : style('update', c.yellow);
      } else if (item.status === 'held') {
        icon = sym.held;
        statusStr = style('held', c.cyan);
      } else if (item.status === 'moving') {
        icon = sym.moving;
        statusStr = style('moving', c.gray);
      } else if (item.status === 'ahead') {
        icon = sym.ahead;
        statusStr = style('ahead', c.magenta);
      } else if (item.status === 'unused') {
        icon = sym.unused;
        statusStr = style('unused', c.gray);
      } else if (item.status === 'blocked') {
        icon = sym.blocked;
        statusStr = style('blocked', c.red);
      } else if (item.status === 'unsupported') {
        icon = sym.warn;
        statusStr = style('unsupported', c.yellow);
      } else if (item.status === 'not-checked') {
        icon = style('·', c.gray);
        statusStr = style('not-checked', c.gray);
      } else if (item.status === 'error') {
        icon = sym.err;
        statusStr = style('error', c.red);
      }

      const namePadded = item.name.padEnd(maxNameLen);
      const curVer = item.resolved
        ? `${item.declared} (${item.resolved})`
        : item.declared;
      const targetVer = item.latest ? ` → ${item.latest}` : '';
      const dur =
        item.durationMs !== undefined
          ? style(`[${formatDuration(item.durationMs)}]`, c.gray)
          : '';

      lines.push(
        `  ${icon} ${namePadded}  ${curVer}${targetVer}  ${statusStr}  ${dur}`,
      );
      if (item.reason) {
        lines.push(`      ${style('↳ Reason:', c.dim)} ${item.reason}`);
      }
    }
    lines.push('');
  }

  // Summary footer
  const s = report.summary;
  lines.push(
    style(
      '──────────────────────────────────────────────────────────────────────',
      `${c.bold}${c.gray}`,
    ),
  );
  lines.push(
    `  ${style('TOTAL:', c.bold)} ${s.total} dependencies checked in ${formatDuration(s.durationMs)}`,
  );
  lines.push(
    `  ${style('UPDATES:', c.bold)} ${s.update > 0 ? style(`${s.update} available`, `${c.bold}${c.yellow}`) : '0'}  |  ` +
      `${style('HELD:', c.bold)} ${s.held}  |  ` +
      `${style('MOVING:', c.bold)} ${s.moving}  |  ` +
      `${style('CURRENT:', c.bold)} ${s.current}` +
      (s.notChecked > 0
        ? `  |  ${style('OMITTED:', c.bold)} ${s.notChecked}`
        : '') +
      (s.blocked > 0
        ? `  |  ${style('BLOCKED:', c.bold)} ${style(`${s.blocked}`, c.red)}`
        : '') +
      (s.unsupported > 0
        ? `  |  ${style('UNSUPPORTED:', c.bold)} ${style(`${s.unsupported}`, c.yellow)}`
        : '') +
      (s.error > 0
        ? `  |  ${style('ERRORS:', c.bold)} ${style(`${s.error}`, c.red)}`
        : ''),
  );

  if (report.proposal && report.proposal.updates.length > 0) {
    lines.push('');
    lines.push(
      style(
        `  Proposal SHA-256 Digest: ${report.proposal.digest}`,
        `${c.bold}${c.cyan}`,
      ),
    );
    lines.push(
      style(
        `  Actionable updates: ${report.proposal.updates.length} items can be updated with 'bun run deps:update'`,
        c.dim,
      ),
    );
  }
  lines.push(
    style(
      '──────────────────────────────────────────────────────────────────────',
      `${c.bold}${c.gray}`,
    ),
  );
  lines.push('');

  return lines.join('\n');
}
