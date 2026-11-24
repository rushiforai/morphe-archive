import { describe, expect, test } from 'bun:test';
import { spawnSync } from 'node:child_process';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';
import type { Formatter, PatchesInventory } from './generate-patches-readme';
import {
  END_MARKER,
  renderPatchesSection,
  runGeneratorCli,
  transformReadme,
  validateInventory,
} from './generate-patches-readme';

const FIXTURES = path.join(
  import.meta.dir,
  'test-fixtures',
  'generate-patches-readme',
);
const REPOSITORY = 'acme/widgets';

function fixture(caseName: string, file: string): string {
  return fs.readFileSync(path.join(FIXTURES, caseName, file), 'utf8');
}

function fixtureInventory(caseName: string): unknown {
  return JSON.parse(fixture(caseName, 'inventory.json'));
}

function temporaryDirectory(): string {
  return fs.mkdtempSync(path.join(os.tmpdir(), 'patches-readme-test-'));
}

interface TempCase {
  directory: string;
  inventoryPath: string;
  readmePath: string;
  readme: string;
}

function copyFixture(
  caseName: string,
  readmeFile = 'readme.md',
  inventoryCase = caseName,
): TempCase {
  const directory = temporaryDirectory();
  const inventoryPath = path.join(directory, 'patches-list.json');
  const readmePath = path.join(directory, 'README.md');
  fs.copyFileSync(
    path.join(FIXTURES, inventoryCase, 'inventory.json'),
    inventoryPath,
  );
  fs.copyFileSync(path.join(FIXTURES, caseName, readmeFile), readmePath);
  return {
    directory,
    inventoryPath,
    readmePath,
    readme: fs.readFileSync(readmePath, 'utf8'),
  };
}

async function runCli(
  args: readonly string[],
  directory?: string,
  format?: Formatter,
): Promise<{ code: number; stdout: string; stderr: string }> {
  let stdout = '';
  let stderr = '';
  const code = await runGeneratorCli(args, {
    ...(directory === undefined ? {} : { cwd: directory }),
    ...(format === undefined ? {} : { format }),
    stdout: (text) => {
      stdout += text;
    },
    stderr: (text) => {
      stderr += text;
    },
  });
  return { code, stdout, stderr };
}

describe('raw rendering parity with the Python generator', () => {
  const cases = [
    {
      name: 'ordinary',
      inventoryCase: 'ordinary',
      readmeFile: 'readme.md',
      repository: REPOSITORY,
      branch: 'feature/test',
      expected: 'expected.raw.md',
    },
    {
      name: 'empty',
      inventoryCase: 'empty',
      readmeFile: 'readme.md',
      repository: REPOSITORY,
      branch: 'feature/test',
      expected: 'expected.raw.md',
    },
    {
      name: 'threshold20',
      inventoryCase: 'threshold20',
      readmeFile: 'readme-plain.md',
      repository: REPOSITORY,
      branch: 'feature/test',
      expected: 'expected.raw.md',
    },
    {
      name: 'real',
      inventoryCase: 'real',
      readmeFile: 'readme.md',
      repository: 'ihatenodejs/aidans-patches',
      branch: 'dev',
      expected: 'expected.raw.md',
    },
  ];

  for (const fixtureCase of cases) {
    test(`matches frozen Python raw output: ${fixtureCase.name}`, () => {
      const result = transformReadme({
        readme: fixture(fixtureCase.inventoryCase, fixtureCase.readmeFile),
        inventory: fixtureInventory(fixtureCase.inventoryCase),
        repository: fixtureCase.repository,
        branch: fixtureCase.branch,
      });
      expect(result.ok).toBe(true);
      if (!result.ok) {
        throw new Error(result.message);
      }
      expect(result.readme).toBe(
        fixture(fixtureCase.inventoryCase, fixtureCase.expected),
      );
    });
  }
});

describe('final formatting parity with the Python generator', () => {
  interface FinalCase {
    name: string;
    inventoryCase: string;
    readmeFile: string;
    repository: string;
    branch: string;
    inventoryFixture?: string;
    expected?: string;
  }

  const cases: FinalCase[] = [
    {
      name: 'ordinary',
      inventoryCase: 'ordinary',
      readmeFile: 'readme.md',
      repository: REPOSITORY,
      branch: 'feature/test',
    },
    {
      name: 'empty',
      inventoryCase: 'empty',
      readmeFile: 'readme.md',
      repository: REPOSITORY,
      branch: 'feature/test',
    },
    {
      name: 'threshold20',
      inventoryCase: 'threshold20',
      readmeFile: 'readme-plain.md',
      repository: REPOSITORY,
      branch: 'feature/test',
    },
    {
      name: 'threshold21-plain',
      inventoryCase: 'threshold21',
      readmeFile: 'readme-plain.md',
      repository: REPOSITORY,
      branch: 'main',
    },
    {
      name: 'threshold21-expanded',
      inventoryCase: 'threshold21',
      readmeFile: 'readme-expanded.md',
      repository: REPOSITORY,
      branch: 'main',
    },
    {
      name: 'real',
      inventoryCase: 'real',
      readmeFile: 'readme.md',
      repository: 'ihatenodejs/aidans-patches',
      branch: 'dev',
    },
    {
      name: 'crlf',
      inventoryCase: 'crlf',
      readmeFile: 'readme.md',
      repository: REPOSITORY,
      branch: 'main',
      inventoryFixture: 'ordinary',
      expected: 'expected.final.md',
    },
  ];

  for (const fixtureCase of cases) {
    test(`matches frozen Python final output: ${fixtureCase.name}`, async () => {
      const temporary = copyFixture(
        fixtureCase.inventoryCase,
        fixtureCase.readmeFile,
        fixtureCase.inventoryFixture ?? fixtureCase.inventoryCase,
      );
      try {
        const result = await runCli(
          [
            fixtureCase.repository,
            fixtureCase.branch,
            temporary.inventoryPath,
            temporary.readmePath,
          ],
          temporary.directory,
        );
        expect(result.code).toBe(0);
        expect(result.stderr).toBe('');
        const expectedFile =
          fixtureCase.expected ??
          (fixtureCase.name.startsWith('threshold21')
            ? `expected.${fixtureCase.name.endsWith('plain') ? 'plain' : 'expanded'}.final.md`
            : 'expected.final.md');
        expect(fs.readFileSync(temporary.readmePath, 'utf8')).toBe(
          fixture(fixtureCase.inventoryCase, expectedFile),
        );
      } finally {
        fs.rmSync(temporary.directory, { recursive: true, force: true });
      }
    });
  }

  test('real current inventory final output is byte-identical to its snapshot', () => {
    expect(fixture('real', 'expected.final.md')).toBe(
      fixture('real', 'readme.md'),
    );
  });
});

describe('render contract', () => {
  test('preserves first-wins maps, insertion order and version order', () => {
    const raw = fixture('ordinary', 'expected.raw.md');
    expect(raw).not.toContain('duplicate universal must lose');
    expect(raw).not.toContain('Empty CP duplicate loses');
    expect(raw).not.toContain('IGNORED LATER LABEL');
    expect(raw.indexOf('com.example.beta')).toBeLessThan(
      raw.indexOf('Alpha App'),
    );
    expect(raw).toContain('| 10 | 🧪&nbsp;2 |');
    expect(raw).toContain('|  | Beta two<br>line | null version description |');
    expect(raw).toContain('| **Empty CP** |');
    expect(raw.match(/\*\*Empty CP\*\*/g)?.length).toBe(1);
  });

  test('does not escape Markdown or HTML in metadata', () => {
    const raw = fixture('ordinary', 'expected.raw.md');
    expect(raw).toContain('| pipe & <tag>');
    expect(raw).toContain('| **__proto__ Patch** |');
    expect(raw).toContain('| **é Patch** |');
    expect(raw).toContain('| **\ue000 Patch** |');
    expect(raw).toContain('| **𐀀 Patch** |');
  });

  test('sorts patch names by Unicode code point, not UTF-16 units', () => {
    const names = [
      '10 Patch',
      'A Patch',
      'Z Patch',
      '__proto__ Patch',
      'a Patch',
      'é Patch',
      '\ue000 Patch',
      '𐀀 Patch',
    ];
    const inventory: PatchesInventory = {
      version: '1.0.0',
      patches: names.map((name) => ({
        name,
        description: name,
        options: [],
        compatiblePackages: [{ packageName: 'com.example.sort', targets: [] }],
      })),
    };
    const result = transformReadme({
      readme: `<!-- PATCHES_START -->\n\n${END_MARKER}`,
      inventory,
      repository: REPOSITORY,
      branch: 'main',
    });
    expect(result.ok).toBe(true);
    if (!result.ok) {
      throw new Error(result.message);
    }
    let previous = -1;
    for (const name of names) {
      const index = result.readme.indexOf(`| **${name}** |`, previous + 1);
      expect(index).toBeGreaterThan(previous);
      previous = index;
    }
  });

  test('renders singular nouns and empty inventories', () => {
    const single = renderPatchesSection(
      validateInventory({
        version: 'v1.0.0',
        patches: [{ name: 'One', compatiblePackages: [] }],
      }),
      { repository: REPOSITORY, branch: 'main', expanded: true },
    );
    expect(single.total).toBe(1);
    expect(single.version).toBe('1.0.0');
    expect(single.content).toContain('1 patch</summary>');
    expect(single.content).toContain('🌐 Universal');

    const empty = renderPatchesSection(
      validateInventory({ version: '2.0.0', patches: [] }),
      { repository: REPOSITORY, branch: 'main', expanded: false },
    );
    expect(empty.total).toBe(0);
    expect(empty.content).toBe(
      `> **[v2.0.0](https://github.com/acme/widgets/releases/tag/v2.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;\`main\`&nbsp;&nbsp;•&nbsp;&nbsp;0 patches total`,
    );
  });

  test('auto-expansion threshold is inclusive at 20 and closed at 21', () => {
    for (const [caseName, expected] of [
      ['threshold20', true],
      ['threshold21', false],
    ] as const) {
      const readmeFile =
        caseName === 'threshold20' ? 'readme-plain.md' : 'readme-plain.md';
      const result = transformReadme({
        readme: fixture(caseName, readmeFile),
        inventory: fixtureInventory(caseName),
        repository: REPOSITORY,
        branch: 'main',
      });
      expect(result.ok).toBe(true);
      if (!result.ok) {
        throw new Error(result.message);
      }
      expect(result.expanded).toBe(expected);
      expect(result.readme.includes('<details open>')).toBe(expected);
    }

    const explicit = transformReadme({
      readme: fixture('threshold21', 'readme-expanded.md'),
      inventory: fixtureInventory('threshold21'),
      repository: REPOSITORY,
      branch: 'main',
    });
    expect(explicit.ok).toBe(true);
    if (!explicit.ok) {
      throw new Error(explicit.message);
    }
    expect(explicit.expanded).toBe(true);
    expect(explicit.readme).toContain('<details open>');
  });
});

describe('CLI behavior', () => {
  test('prints usage when required arguments are absent', async () => {
    const result = await runCli([]);
    expect(result.code).toBe(1);
    expect(result.stderr).toContain(
      'Usage: generate-patches-readme.ts <owner/repo> <branch>',
    );
  });

  test('rejects a repository without an owner separator', async () => {
    const result = await runCli(['not-a-repository', 'main']);
    expect(result.code).toBe(1);
    expect(result.stderr).toContain('Invalid repo format');
  });

  test('uses default paths', async () => {
    const temporary = copyFixture('empty');
    try {
      const result = await runCli(
        [REPOSITORY, 'feature/test'],
        temporary.directory,
      );
      expect(result.code).toBe(0);
      expect(fs.readFileSync(temporary.readmePath, 'utf8')).toBe(
        fixture('empty', 'expected.final.md'),
      );
    } finally {
      fs.rmSync(temporary.directory, { recursive: true, force: true });
    }
  });

  test('ignores extra arguments', async () => {
    const temporary = copyFixture('empty');
    try {
      const result = await runCli(
        [
          REPOSITORY,
          'feature/test',
          temporary.inventoryPath,
          temporary.readmePath,
          'ignored-extra',
        ],
        temporary.directory,
      );
      expect(result.code).toBe(0);
    } finally {
      fs.rmSync(temporary.directory, { recursive: true, force: true });
    }
  });

  test('keeps the original README when formatting fails', async () => {
    const temporary = copyFixture('ordinary');
    try {
      const result = await runCli(
        [
          REPOSITORY,
          'feature/test',
          temporary.inventoryPath,
          temporary.readmePath,
        ],
        temporary.directory,
        async () => {
          throw new Error('formatter exploded');
        },
      );
      expect(result.code).toBe(1);
      expect(result.stderr).toContain('Failed to format');
      expect(result.stderr).toContain('formatter exploded');
      expect(fs.readFileSync(temporary.readmePath, 'utf8')).toBe(
        temporary.readme,
      );
    } finally {
      fs.rmSync(temporary.directory, { recursive: true, force: true });
    }
  });

  test('writes through paths containing spaces', async () => {
    const temporary = copyFixture('ordinary');
    const spaced = path.join(temporary.directory, 'with space');
    fs.mkdirSync(spaced);
    const readmePath = path.join(spaced, 'README file.md');
    fs.copyFileSync(temporary.readmePath, readmePath);
    try {
      const result = await runCli(
        [REPOSITORY, 'feature/test', temporary.inventoryPath, readmePath],
        spaced,
      );
      expect(result.code).toBe(0);
      expect(fs.readFileSync(readmePath, 'utf8')).toBe(
        fixture('ordinary', 'expected.final.md'),
      );
    } finally {
      fs.rmSync(temporary.directory, { recursive: true, force: true });
    }
  });

  test('is idempotent across repeated CLI runs', async () => {
    const temporary = copyFixture('ordinary');
    try {
      const args = [
        REPOSITORY,
        'feature/test',
        temporary.inventoryPath,
        temporary.readmePath,
      ];
      const first = await runCli(args, temporary.directory);
      const firstBytes = fs.readFileSync(temporary.readmePath, 'utf8');
      const second = await runCli(args, temporary.directory);
      expect(first.code).toBe(0);
      expect(second.code).toBe(0);
      expect(fs.readFileSync(temporary.readmePath, 'utf8')).toBe(firstBytes);
      expect(firstBytes).toBe(fixture('ordinary', 'expected.final.md'));
    } finally {
      fs.rmSync(temporary.directory, { recursive: true, force: true });
    }
  });

  test('keeps template substitutions literal and idempotent for overlapping repositories', async () => {
    const temporary = copyFixture('ordinary');
    try {
      const repository = 'xyz-user/xyz-patches-fork';
      const args = [
        repository,
        'main',
        temporary.inventoryPath,
        temporary.readmePath,
      ];
      const first = await runCli(args, temporary.directory);
      const firstOutput = fs.readFileSync(temporary.readmePath, 'utf8');
      const second = await runCli(args, temporary.directory);
      const secondOutput = fs.readFileSync(temporary.readmePath, 'utf8');
      expect(first.code).toBe(0);
      expect(second.code).toBe(0);
      expect(secondOutput).toBe(firstOutput);
      expect(secondOutput).not.toContain('xyz-patches-fork-fork');
      expect(secondOutput).toContain(
        'https://github.com/xyz-user/xyz-patches-fork/releases',
      );
      expect(secondOutput).toContain(
        'https://morphe.software/add-source?github=xyz-user/xyz-patches-fork',
      );
    } finally {
      fs.rmSync(temporary.directory, { recursive: true, force: true });
    }
  });
});

describe('marker validation and fallbacks', () => {
  const malformedFiles = [
    'reversed.md',
    'duplicate-start.md',
    'duplicate-end.md',
  ];

  for (const fileName of malformedFiles) {
    test(`rejects malformed markers without writing: ${fileName}`, async () => {
      const temporary = copyFixture('malformed', fileName, 'ordinary');
      let formatCalls = 0;
      try {
        const result = await runCli(
          [
            REPOSITORY,
            'feature/test',
            temporary.inventoryPath,
            temporary.readmePath,
          ],
          temporary.directory,
          async (content) => {
            formatCalls += 1;
            return content;
          },
        );
        expect(result.code).toBe(1);
        expect(result.stderr).toContain('Invalid README markers');
        expect(formatCalls).toBe(0);
        expect(fs.readFileSync(temporary.readmePath, 'utf8')).toBe(
          temporary.readme,
        );
      } finally {
        fs.rmSync(temporary.directory, { recursive: true, force: true });
      }
    });
  }

  const missingCases = [
    { caseName: 'malformed', fileName: 'missing-start.md' },
    { caseName: 'malformed', fileName: 'missing-end.md' },
    { caseName: 'fallback', fileName: 'missing-both.md' },
  ];

  for (const missing of missingCases) {
    test(`retains collapsed fallback for missing markers: ${missing.fileName}`, async () => {
      const temporary = copyFixture(
        missing.caseName,
        missing.fileName,
        'ordinary',
      );
      let formatCalls = 0;
      try {
        const result = await runCli(
          [
            REPOSITORY,
            'feature/test',
            temporary.inventoryPath,
            temporary.readmePath,
          ],
          temporary.directory,
          async (content) => {
            formatCalls += 1;
            return content;
          },
        );
        const expectedFallback = renderPatchesSection(
          validateInventory(fixtureInventory('ordinary')),
          {
            repository: REPOSITORY,
            branch: 'feature/test',
            expanded: false,
          },
        );
        expect(result.code).toBe(1);
        expect(result.stdout).toBe(`${expectedFallback.content}\n`);
        expect(result.stderr).toContain('not found');
        expect(formatCalls).toBe(0);
        expect(fs.readFileSync(temporary.readmePath, 'utf8')).toBe(
          temporary.readme,
        );
      } finally {
        fs.rmSync(temporary.directory, { recursive: true, force: true });
      }
    });
  }
});

describe('metadata validation', () => {
  const invalidInventories: Array<[string, unknown]> = [
    ['missing version', { patches: [] }],
    ['non-string version', { version: 7, patches: [] }],
    ['non-array patches', { version: '1.0.0', patches: {} }],
    [
      'patch without a name',
      { version: '1.0.0', patches: [{ description: 'x' }] },
    ],
    [
      'target without a version',
      {
        version: '1.0.0',
        patches: [
          {
            name: 'Patch',
            compatiblePackages: [{ packageName: 'com.example', targets: [{}] }],
          },
        ],
      },
    ],
    [
      'non-array compatible packages',
      {
        version: '1.0.0',
        patches: [{ name: 'Patch', compatiblePackages: 'com.example' }],
      },
    ],
    [
      'non-string description',
      {
        version: '1.0.0',
        patches: [{ name: 'Patch', description: 7 }],
      },
    ],
    [
      'non-array options',
      { version: '1.0.0', patches: [{ name: 'Patch', options: 'title' }] },
    ],
    [
      'non-string option title',
      {
        version: '1.0.0',
        patches: [{ name: 'Patch', options: [{ title: 7 }] }],
      },
    ],
    [
      'compatible package without packageName',
      {
        version: '1.0.0',
        patches: [{ name: 'Patch', compatiblePackages: [{}] }],
      },
    ],
  ];

  for (const [label, inventory] of invalidInventories) {
    test(`rejects invalid metadata before writing: ${label}`, async () => {
      const temporary = copyFixture('ordinary');
      let formatCalls = 0;
      try {
        fs.writeFileSync(
          temporary.inventoryPath,
          JSON.stringify(inventory),
          'utf8',
        );
        const result = await runCli(
          [
            REPOSITORY,
            'feature/test',
            temporary.inventoryPath,
            temporary.readmePath,
          ],
          temporary.directory,
          async (content) => {
            formatCalls += 1;
            return content;
          },
        );
        expect(result.code).toBe(1);
        expect(result.stderr).toContain('Invalid patches metadata');
        expect(formatCalls).toBe(0);
        expect(fs.readFileSync(temporary.readmePath, 'utf8')).toBe(
          temporary.readme,
        );
      } finally {
        fs.rmSync(temporary.directory, { recursive: true, force: true });
      }
    });
  }
});

describe('exterior byte preservation and literal insertion', () => {
  test('raw transformation preserves bytes outside markers while substituting template links', () => {
    const input = fixture('crlf', 'readme.md');
    const result = transformReadme({
      readme: input,
      inventory: fixtureInventory('ordinary'),
      repository: REPOSITORY,
      branch: 'main',
    });
    expect(result.ok).toBe(true);
    if (!result.ok) {
      throw new Error(result.message);
    }

    const startIndex = input.indexOf('<!-- PATCHES_START -->');
    const endIndex = input.indexOf(END_MARKER);
    const expectedPrefix = input
      .slice(0, startIndex)
      .split('https://github.com/xyz-user/xyz-patches')
      .join('https://github.com/acme/widgets');
    const expectedSuffix = input.slice(endIndex + END_MARKER.length);

    expect(expectedPrefix).toContain('\r\n');
    expect(
      result.readme.startsWith(`${expectedPrefix}<!-- PATCHES_START -->\n`),
    ).toBe(true);
    expect(result.readme.endsWith(expectedSuffix)).toBe(true);
  });

  test('inserts metadata literally instead of interpreting replacement escapes', () => {
    const result = transformReadme({
      readme: fixture('literal', 'readme.md'),
      inventory: fixtureInventory('literal'),
      repository: REPOSITORY,
      branch: 'main',
    });
    expect(result.ok).toBe(true);
    if (!result.ok) {
      throw new Error(result.message);
    }
    expect(result.version).toBe('\\1.0');
    expect(result.readme).toContain(
      '> **[v\\1.0](https://github.com/acme/widgets/releases/tag/v\\1.0)**',
    );
    expect(result.readme).toContain(
      '| **Backslash \\1 and \\g<0>** | literal \\n, \\t, \\\\, \\q, \\1 and \\g<0> | • \\1 literal title |',
    );
    expect(result.readme).toContain('📦 Literal \\g<0> App');
    expect(result.readme).toContain('| \\1 |');
  });
});

test('executes only the configured release generator against temporary files', () => {
  const root = path.resolve(import.meta.dir, '..');
  const config = JSON.parse(
    fs
      .readFileSync(path.join(root, '.releaserc'), 'utf8')
      .replace(/\\\r?\n/g, ''),
  ) as { plugins: Array<string | [string, { prepareCmd?: string }]> };
  const plugin = config.plugins.find(
    (entry) => Array.isArray(entry) && entry[0] === '@semantic-release/exec',
  );
  if (!Array.isArray(plugin) || !plugin[1].prepareCmd) {
    throw new Error('release generator operation is missing');
  }
  const operations = plugin[1].prepareCmd.split(/\s*&&\s*/);
  const operation = operations.find((entry) =>
    entry.trim().startsWith('bun scripts/generate-patches-readme.ts '),
  );
  if (!operation) throw new Error('release does not invoke the Bun generator');
  const args = operation.trim().split(/\s+/);
  const values: Record<string, string> = {
    $GITHUB_REPOSITORY: REPOSITORY,
    $GITHUB_REF_NAME: 'feature/test',
  };
  const temporary = copyFixture('ordinary');
  try {
    const result = spawnSync(
      process.execPath,
      [
        path.join(root, args[1]),
        ...args.slice(2).map((arg) => values[arg] ?? arg),
      ],
      {
        cwd: temporary.directory,
        encoding: 'utf8',
        stdio: ['ignore', 'pipe', 'pipe'],
      },
    );
    expect(result.status).toBe(0);
    expect(result.stderr).toBe('');
    expect(fs.readFileSync(temporary.readmePath, 'utf8')).toBe(
      fixture('ordinary', 'expected.final.md'),
    );
  } finally {
    fs.rmSync(temporary.directory, { recursive: true, force: true });
  }
});

test('preserves Python Unicode marker whitespace acceptance', () => {
  for (const whitespace of ['\u0085', '\u001c', '\u2003']) {
    const marker = `<!-- PATCHES_START${whitespace}EXPANDED${whitespace}-->`;
    const result = transformReadme({
      readme: `${marker}\n${END_MARKER}`,
      inventory: fixtureInventory('ordinary'),
      repository: REPOSITORY,
      branch: 'main',
    });
    expect(result.ok).toBe(true);
    if (result.ok) expect(result.readme.startsWith(marker)).toBe(true);
  }
});

test('rejects metadata that would introduce ambiguous generated boundaries', async () => {
  const temporary = copyFixture('ordinary');
  try {
    fs.writeFileSync(
      temporary.inventoryPath,
      JSON.stringify({
        version: '1',
        patches: [{ name: 'Boundary', description: END_MARKER }],
      }),
    );
    const result = await runCli(
      [REPOSITORY, 'main', temporary.inventoryPath, temporary.readmePath],
      temporary.directory,
    );
    expect(result.code).toBe(1);
    expect(fs.readFileSync(temporary.readmePath, 'utf8')).toBe(
      temporary.readme,
    );
  } finally {
    fs.rmSync(temporary.directory, { recursive: true, force: true });
  }
});
