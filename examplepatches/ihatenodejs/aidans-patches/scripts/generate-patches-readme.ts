import * as fs from 'node:fs';
import * as path from 'node:path';
import {
  format as prettierFormat,
  resolveConfig as resolvePrettierConfig,
} from 'prettier';

// Match Python's Unicode whitespace set, including NEL and separator controls,
// but not JavaScript-only BOM whitespace.
const PYTHON_WHITESPACE =
  '[\\u0009-\\u000d\\u001c-\\u0020\\u0085\\u00a0\\u1680\\u2000-\\u200a\\u2028\\u2029\\u202f\\u205f\\u3000]';
export const START_MARKER_PATTERN = new RegExp(
  `<!-- PATCHES_START(?:${PYTHON_WHITESPACE}+EXPANDED)?${PYTHON_WHITESPACE}*-->`,
  'g',
);
export const END_MARKER = '<!-- PATCHES_END -->';
export const AUTO_EXPAND_THRESHOLD = 20;

const ADD_SOURCE_TEMPLATE =
  'https://morphe.software/add-source?github=xyz-user/xyz-patches';
const REPOSITORY_TEMPLATE = 'https://github.com/xyz-user/xyz-patches';

export interface PatchTarget {
  version: string | null;
  isExperimental?: unknown;
  description?: string;
}

export interface CompatiblePackage {
  packageName: string;
  name?: string;
  targets: PatchTarget[];
}

export interface PatchOption {
  title?: string;
  key?: string;
}

export interface Patch {
  name: string;
  description?: string;
  options: PatchOption[];
  compatiblePackages?: CompatiblePackage[];
}

export interface PatchesInventory {
  version: string;
  patches: Patch[];
}

export interface RenderOptions {
  repository: string;
  branch: string;
  expanded: boolean;
}

export interface RenderedSection {
  content: string;
  total: number;
  version: string;
  expanded: boolean;
}

export type TransformFailureKind =
  'invalid-metadata' | 'missing-markers' | 'malformed-markers';

export type TransformResult =
  | {
      ok: true;
      readme: string;
      total: number;
      version: string;
      expanded: boolean;
      startMarker: string;
    }
  | {
      ok: false;
      kind: TransformFailureKind;
      message: string;
      fallback?: string;
    };

export interface TransformInput {
  readme: string;
  inventory: unknown;
  repository: string;
  branch: string;
}

interface PackageGroup {
  pkg: string;
  name: string;
  patches: Map<string, Patch>;
  targets: PatchTarget[];
}

interface InventoryModel {
  byPackage: Map<string, PackageGroup>;
  universal: Map<string, Patch>;
  total: number;
  version: string;
}

interface MarkerLocation {
  startIndex: number;
  endIndex: number;
  startMarker: string;
}

class InvalidMetadataError extends Error {}

function requireObject(value: unknown, where: string): Record<string, unknown> {
  if (typeof value !== 'object' || value === null || Array.isArray(value)) {
    throw new InvalidMetadataError(`${where} must be an object`);
  }
  return value as Record<string, unknown>;
}

function requireString(
  record: Record<string, unknown>,
  key: string,
  where: string,
): string {
  const value = record[key];
  if (typeof value !== 'string') {
    throw new InvalidMetadataError(`${where}.${key} must be a string`);
  }
  return value;
}

function optionalString(
  record: Record<string, unknown>,
  key: string,
  where: string,
): string | undefined {
  const value = record[key];
  if (value === undefined || value === null) {
    return undefined;
  }
  if (typeof value !== 'string') {
    throw new InvalidMetadataError(`${where}.${key} must be a string or null`);
  }
  return value;
}

function optionalArray(
  record: Record<string, unknown>,
  key: string,
  where: string,
): unknown[] {
  const value = record[key];
  if (value === undefined || value === null) {
    return [];
  }
  if (!Array.isArray(value)) {
    throw new InvalidMetadataError(`${where}.${key} must be an array or null`);
  }
  return value;
}

function validateTarget(value: unknown, where: string): PatchTarget {
  const target = requireObject(value, where);
  if (!('version' in target)) {
    throw new InvalidMetadataError(`${where}.version is required`);
  }
  if (target.version !== null && typeof target.version !== 'string') {
    throw new InvalidMetadataError(`${where}.version must be a string or null`);
  }
  return {
    version: target.version,
    isExperimental: target.isExperimental,
    description: optionalString(target, 'description', where),
  };
}

function validatePackage(value: unknown, where: string): CompatiblePackage {
  const compatiblePackage = requireObject(value, where);
  const packageName = requireString(compatiblePackage, 'packageName', where);
  const targets = optionalArray(compatiblePackage, 'targets', where).map(
    (target, index) => validateTarget(target, `${where}.targets[${index}]`),
  );
  return {
    packageName,
    name: optionalString(compatiblePackage, 'name', where),
    targets,
  };
}

function validateOption(value: unknown, where: string): PatchOption {
  const option = requireObject(value, where);
  return {
    title: optionalString(option, 'title', where),
    key: optionalString(option, 'key', where),
  };
}

function validatePatch(value: unknown, where: string): Patch {
  const patch = requireObject(value, where);
  const name = requireString(patch, 'name', where);
  const options = optionalArray(patch, 'options', where).map((option, index) =>
    validateOption(option, `${where}.options[${index}]`),
  );

  const rawPackages = patch.compatiblePackages;
  let compatiblePackages: CompatiblePackage[] | undefined;
  if (rawPackages !== undefined && rawPackages !== null) {
    if (!Array.isArray(rawPackages)) {
      throw new InvalidMetadataError(
        `${where}.compatiblePackages must be an array or null`,
      );
    }
    compatiblePackages = rawPackages.map((entry, index) =>
      validatePackage(entry, `${where}.compatiblePackages[${index}]`),
    );
  }

  return {
    name,
    description: optionalString(patch, 'description', where),
    options,
    compatiblePackages,
  };
}

export function validateInventory(value: unknown): PatchesInventory {
  const inventory = requireObject(value, 'inventory');
  const version = requireString(inventory, 'version', 'inventory');
  const patches = inventory.patches;
  if (!Array.isArray(patches)) {
    throw new InvalidMetadataError('inventory.patches must be an array');
  }
  return {
    version,
    patches: patches.map((patch, index) =>
      validatePatch(patch, `inventory.patches[${index}]`),
    ),
  };
}

function compareByCodePoint(left: string, right: string): number {
  const leftIterator = left[Symbol.iterator]();
  const rightIterator = right[Symbol.iterator]();
  for (;;) {
    const leftNext = leftIterator.next();
    const rightNext = rightIterator.next();
    if (leftNext.done || rightNext.done) {
      if (leftNext.done && rightNext.done) {
        return 0;
      }
      return leftNext.done ? -1 : 1;
    }
    const leftPoint = leftNext.value.codePointAt(0) as number;
    const rightPoint = rightNext.value.codePointAt(0) as number;
    if (leftPoint !== rightPoint) {
      return leftPoint - rightPoint;
    }
  }
}

function buildModel(inventory: PatchesInventory): InventoryModel {
  const byPackage = new Map<string, PackageGroup>();
  const universal = new Map<string, Patch>();

  for (const patch of inventory.patches) {
    const compatiblePackages = patch.compatiblePackages ?? [];
    if (compatiblePackages.length === 0) {
      if (!universal.has(patch.name)) {
        universal.set(patch.name, patch);
      }
      continue;
    }

    for (const compatiblePackage of compatiblePackages) {
      const pkg = compatiblePackage.packageName;
      let group = byPackage.get(pkg);
      if (!group) {
        group = {
          pkg,
          name: compatiblePackage.name || pkg,
          patches: new Map<string, Patch>(),
          targets: compatiblePackage.targets,
        };
        byPackage.set(pkg, group);
      }
      if (!group.patches.has(patch.name)) {
        group.patches.set(patch.name, patch);
      }
    }
  }

  let total = universal.size;
  for (const group of byPackage.values()) {
    total += group.patches.size;
  }

  return {
    byPackage,
    universal,
    total,
    version: inventory.version.replace(/^v+/, ''),
  };
}

function patchesTable(patches: Patch[]): string {
  const rows = [
    '| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |',
    '|----------|----------------|-----------|',
  ];
  for (const patch of [...patches].sort((left, right) =>
    compareByCodePoint(left.name, right.name),
  )) {
    let optionsCell = '';
    if (patch.options.length > 0) {
      optionsCell = patch.options
        .map((option) => `• ${option.title || option.key || ''}`)
        .join('<br>');
    }
    const description = (patch.description ?? '').split('\n').join('<br>');
    rows.push(`| **${patch.name}** | ${description} | ${optionsCell} |`);
  }
  return rows.join('\n');
}

function versionsTable(targets: PatchTarget[]): string {
  if (targets.length === 0) {
    return '';
  }

  const cells: string[] = [];
  for (const target of targets) {
    if (target.version === null) {
      continue;
    }
    cells.push(
      target.isExperimental ? `🧪&nbsp;${target.version}` : target.version,
    );
  }

  if (cells.length === 0) {
    return '';
  }

  const rows = [
    `| ${cells.join(' | ')} |`,
    `| ${cells.map(() => ':---:').join(' | ')} |`,
  ];
  const descriptions = targets.map((target) =>
    (target.description ?? '').split('\n').join('<br>'),
  );
  if (descriptions.some((description) => description.length > 0)) {
    rows.push(`| ${descriptions.join(' | ')} |`);
  }
  return rows.join('\n');
}

function spoiler(
  label: string,
  pkg: string,
  count: number,
  targets: PatchTarget[],
  table: string,
  expanded: boolean,
): string {
  const noun = count === 1 ? 'patch' : 'patches';
  const versions = versionsTable(targets);
  const versionsSection = versions
    ? `**🎯 Supported versions:**\n\n${versions}\n\n`
    : '';
  const tag = expanded ? '<details open>' : '<details>';
  const badge =
    '<a href="https://patch.p0ntus.com/status">' +
    `<img src="https://worker.patch.p0ntus.com/badges/tests/${pkg}.svg" ` +
    'alt="Tests Passing" align="absmiddle"></a>';
  return `${tag}
<summary>${label}&nbsp;&nbsp;•&nbsp;&nbsp;${count} ${noun}&nbsp;&nbsp;${badge}</summary>
<br>

${versionsSection}${table}

</details>`;
}

function buildContent(
  model: InventoryModel,
  repository: string,
  branch: string,
  expanded: boolean,
): string {
  const ownerAndRepo = repository.split('/', 2);
  const owner = ownerAndRepo[0];
  const repo = ownerAndRepo[1];
  const lines = [
    `> **[v${model.version}](https://github.com/${owner}/${repo}/releases/tag/v${model.version})**` +
      `&nbsp;&nbsp;•&nbsp;&nbsp;\`${branch}\`&nbsp;&nbsp;•&nbsp;&nbsp;` +
      `${model.total} patches total`,
  ];

  for (const group of model.byPackage.values()) {
    const patches = [...group.patches.values()];
    lines.push(
      spoiler(
        `📦 ${group.name}`,
        group.pkg,
        patches.length,
        group.targets,
        patchesTable(patches),
        expanded,
      ),
    );
    lines.push('');
  }

  if (model.universal.size > 0) {
    const patches = [...model.universal.values()];
    const noun = patches.length === 1 ? 'patch' : 'patches';
    const tag = expanded ? '<details open>' : '<details>';
    lines.push(`${tag}
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;${patches.length} ${noun}</summary>
<br>

${patchesTable(patches)}

</details>`);
    lines.push('');
  }

  return lines.join('\n');
}

export function renderPatchesSection(
  inventory: PatchesInventory,
  options: RenderOptions,
): RenderedSection {
  const model = buildModel(inventory);
  return {
    content: buildContent(
      model,
      options.repository,
      options.branch,
      options.expanded,
    ),
    total: model.total,
    version: model.version,
    expanded: options.expanded,
  };
}

function locateMarkers(readme: string):
  | { ok: true; location: MarkerLocation }
  | {
      ok: false;
      kind: 'missing-markers' | 'malformed-markers';
      message: string;
    } {
  const startMatches = [...readme.matchAll(START_MARKER_PATTERN)];
  const endMatches: number[] = [];
  let endCursor = 0;
  for (;;) {
    const index = readme.indexOf(END_MARKER, endCursor);
    if (index === -1) {
      break;
    }
    endMatches.push(index);
    endCursor = index + END_MARKER.length;
  }

  if (startMatches.length === 0 && endMatches.length === 0) {
    return {
      ok: false,
      kind: 'missing-markers',
      message: `Markers <!-- PATCHES_START [EXPANDED] --> / ${END_MARKER} not found`,
    };
  }
  if (startMatches.length > 1 || endMatches.length > 1) {
    return {
      ok: false,
      kind: 'malformed-markers',
      message:
        'expected exactly one PATCHES_START marker and one PATCHES_END marker',
    };
  }
  if (startMatches.length === 0) {
    return {
      ok: false,
      kind: 'missing-markers',
      message: `Markers <!-- PATCHES_START [EXPANDED] --> / ${END_MARKER} not found`,
    };
  }
  if (endMatches.length === 0) {
    return {
      ok: false,
      kind: 'missing-markers',
      message: `Markers <!-- PATCHES_START [EXPANDED] --> / ${END_MARKER} not found`,
    };
  }

  const startMatch = startMatches[0];
  if (startMatch.index === undefined) {
    return {
      ok: false,
      kind: 'malformed-markers',
      message: 'could not determine PATCHES_START marker position',
    };
  }
  if (endMatches[0] < startMatch.index) {
    return {
      ok: false,
      kind: 'malformed-markers',
      message: 'PATCHES_END appears before PATCHES_START',
    };
  }

  return {
    ok: true,
    location: {
      startIndex: startMatch.index,
      endIndex: endMatches[0],
      startMarker: startMatch[0],
    },
  };
}

function replaceIdempotently(
  text: string,
  search: string,
  replacement: string,
): string {
  if (search === replacement) {
    return text;
  }
  let result = '';
  let cursor = 0;
  for (;;) {
    const index = text.indexOf(search, cursor);
    if (index === -1) {
      break;
    }
    result += text.slice(cursor, index);
    if (text.startsWith(replacement, index)) {
      result += replacement;
      cursor = index + replacement.length;
    } else {
      result += replacement;
      cursor = index + search.length;
    }
  }
  return result + text.slice(cursor);
}

function substituteTemplateLinks(readme: string, repository: string): string {
  let result = replaceIdempotently(
    readme,
    ADD_SOURCE_TEMPLATE,
    `https://morphe.software/add-source?github=${repository}`,
  );
  result = replaceIdempotently(
    result,
    REPOSITORY_TEMPLATE,
    `https://github.com/${repository}`,
  );
  return result;
}

export function transformReadme(input: TransformInput): TransformResult {
  let inventory: PatchesInventory;
  try {
    inventory = validateInventory(input.inventory);
  } catch (error) {
    return {
      ok: false,
      kind: 'invalid-metadata',
      message: error instanceof Error ? error.message : String(error),
    };
  }

  const substituted = substituteTemplateLinks(input.readme, input.repository);
  const markers = locateMarkers(substituted);
  const model = buildModel(inventory);
  const fallback = () =>
    buildContent(model, input.repository, input.branch, false);

  if (!markers.ok) {
    if (markers.kind === 'missing-markers') {
      return {
        ok: false,
        kind: 'missing-markers',
        message: markers.message,
        fallback: fallback(),
      };
    }
    return {
      ok: false,
      kind: 'malformed-markers',
      message: markers.message,
    };
  }

  const { startIndex, endIndex, startMarker } = markers.location;
  const expanded =
    model.total <= AUTO_EXPAND_THRESHOLD || startMarker.includes('EXPANDED');
  const generated = buildContent(
    model,
    input.repository,
    input.branch,
    expanded,
  );
  const readme =
    substituted.slice(0, startIndex) +
    `${startMarker}\n${generated}\n${END_MARKER}` +
    substituted.slice(endIndex + END_MARKER.length);
  const generatedMarkers = locateMarkers(readme);
  if (!generatedMarkers.ok) {
    return {
      ok: false,
      kind: 'invalid-metadata',
      message: 'generated metadata introduces ambiguous README markers',
    };
  }

  return {
    ok: true,
    readme,
    total: model.total,
    version: model.version,
    expanded,
    startMarker,
  };
}

export type Formatter = (content: string, filepath: string) => Promise<string>;

export async function formatWithInstalledPrettier(
  content: string,
  filepath: string,
): Promise<string> {
  const config = (await resolvePrettierConfig(filepath)) ?? {};
  return prettierFormat(content, { ...config, filepath });
}

export interface GeneratorIo {
  cwd: string;
  stdout: (text: string) => void;
  stderr: (text: string) => void;
  format: Formatter;
}

const defaultIo: GeneratorIo = {
  cwd: process.cwd(),
  stdout: (text) => process.stdout.write(text),
  stderr: (text) => process.stderr.write(text),
  format: formatWithInstalledPrettier,
};

const USAGE =
  'Usage: generate-patches-readme.ts <owner/repo> <branch> [json] [readme]';

function publishFile(filepath: string, content: string): void {
  const resolved = path.resolve(filepath);
  const directory = path.dirname(resolved);
  const temporary = path.join(
    directory,
    `.${path.basename(resolved)}.${process.pid}.${Date.now()}.tmp`,
  );
  fs.writeFileSync(temporary, content, 'utf8');
  try {
    fs.renameSync(temporary, resolved);
  } catch (error) {
    try {
      fs.unlinkSync(temporary);
    } catch {
      // Best effort cleanup; the original file is still untouched.
    }
    throw error;
  }
}

export async function runGeneratorCli(
  argv: readonly string[],
  overrides: Partial<GeneratorIo> = {},
): Promise<number> {
  const io: GeneratorIo = { ...defaultIo, ...overrides };
  const repository = argv[0];
  const branch = argv[1];
  if (repository === undefined || branch === undefined) {
    io.stderr(`${USAGE}\n`);
    return 1;
  }
  if (!repository.includes('/')) {
    io.stderr(`Invalid repo format: ${repository} (expected owner/repo)\n`);
    return 1;
  }

  const jsonPath = argv[2] ?? 'patches-list.json';
  const readmePath = argv[3] ?? 'README.md';

  let rawInventory: unknown;
  try {
    rawInventory = JSON.parse(
      fs.readFileSync(path.resolve(io.cwd, jsonPath), 'utf8'),
    );
  } catch (error) {
    io.stderr(
      `Could not read patches metadata ${jsonPath}: ${error instanceof Error ? error.message : String(error)}\n`,
    );
    return 1;
  }

  let originalReadme: string;
  try {
    originalReadme = fs.readFileSync(path.resolve(io.cwd, readmePath), 'utf8');
  } catch (error) {
    io.stderr(
      `Could not read README ${readmePath}: ${error instanceof Error ? error.message : String(error)}\n`,
    );
    return 1;
  }

  const result = transformReadme({
    readme: originalReadme,
    inventory: rawInventory,
    repository,
    branch,
  });

  if (!result.ok) {
    if (result.kind === 'missing-markers') {
      io.stdout(`${result.fallback ?? ''}\n`);
      io.stderr(
        `⚠️  ${result.message} in ${readmePath}. Printed to stdout instead.\n`,
      );
      return 1;
    }
    io.stderr(
      `❌ Invalid ${result.kind === 'invalid-metadata' ? 'patches metadata' : 'README markers'} in ${result.kind === 'invalid-metadata' ? jsonPath : readmePath}: ${result.message}\n`,
    );
    return 1;
  }

  let formatted: string;
  try {
    formatted = await io.format(
      result.readme,
      path.resolve(io.cwd, readmePath),
    );
  } catch (error) {
    io.stderr(
      `❌ Failed to format ${readmePath}: ${error instanceof Error ? error.message : String(error)}\n`,
    );
    return 1;
  }

  try {
    publishFile(path.resolve(io.cwd, readmePath), formatted);
  } catch (error) {
    io.stderr(
      `❌ Failed to write ${readmePath}: ${error instanceof Error ? error.message : String(error)}\n`,
    );
    return 1;
  }

  io.stdout(
    `✅ Injected patches section into ${readmePath} (v${result.version}, branch=${branch}, ${result.total} patches, expanded=${result.expanded ? 'True' : 'False'})\n`,
  );
  return 0;
}

if (import.meta.main) {
  process.exit(await runGeneratorCli(process.argv.slice(2)));
}
