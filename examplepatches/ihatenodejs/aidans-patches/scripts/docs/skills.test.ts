import { describe, expect, test } from 'bun:test';
import * as fs from 'node:fs';
import * as path from 'node:path';

const REPO_ROOT = path.resolve(__dirname, '../..');
const SKILL_ROOT = path.join(REPO_ROOT, '.agents', 'skills', 'morphe-patches');

function readSkillFiles(): Map<string, string> {
  const files = new Map<string, string>();
  const walk = (dir: string) => {
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
      const full = path.join(dir, entry.name);
      if (entry.isDirectory()) {
        walk(full);
      } else if (entry.name.endsWith('.md')) {
        files.set(
          path.relative(SKILL_ROOT, full),
          fs.readFileSync(full, 'utf8'),
        );
      }
    }
  };
  walk(SKILL_ROOT);
  return files;
}

function fencedBlocks(
  markdown: string,
): { language: string; content: string }[] {
  const blocks: { language: string; content: string }[] = [];
  let language: string | null = null;
  let buffer: string[] = [];

  for (const line of markdown.split('\n')) {
    const fence = line.match(/^\s*```(\S*)\s*$/);
    if (fence && language === null) {
      language = fence[1] || 'text';
      buffer = [];
    } else if (fence && language !== null) {
      blocks.push({ language, content: buffer.join('\n') });
      language = null;
    } else if (language !== null) {
      buffer.push(line);
    }
  }
  return blocks;
}

function logicalCommands(content: string): string[] {
  const commands: string[] = [];
  let current = '';
  for (const raw of content.split('\n')) {
    const line = raw.trim();
    if (!line || line.startsWith('#')) continue;
    current = current ? `${current} ${line}` : line;
    if (current.endsWith('\\')) {
      current = current.slice(0, -1).trim();
    } else {
      commands.push(current);
      current = '';
    }
  }
  if (current) commands.push(current);
  return commands;
}

const skillFiles = readSkillFiles();
const bashCommands = [...skillFiles.values()]
  .flatMap((content) => fencedBlocks(content))
  .filter((block) => block.language === 'bash')
  .flatMap((block) => logicalCommands(block.content));
const codeBlocks = [...skillFiles.values()]
  .flatMap((content) => fencedBlocks(content))
  .filter((block) => ['kotlin', 'java', 'xml'].includes(block.language));

describe('Morphe patches skill contract', () => {
  test('uses the supported validate-smali interface', () => {
    for (const command of bashCommands.filter((line) =>
      line.includes('validate-smali'),
    )) {
      expect(command).toContain('--snippet');
      expect(command).not.toContain('--smali');
    }
  });

  test('uses class selection for inspect-code and no removed asm flags', () => {
    for (const command of bashCommands.filter((line) =>
      line.includes('apk-lab inspect-code'),
    )) {
      expect(command).toContain('--class');
      expect(command).not.toContain('--symbol');
    }
    for (const command of bashCommands.filter((line) =>
      line.includes('apk-lab asm'),
    )) {
      expect(command).not.toContain('--arch');
      expect(command).not.toContain('--disasm');
    }
  });

  test('does not pass a wildcard --mpp path', () => {
    for (const command of bashCommands) {
      expect(command).not.toMatch(/--mpp\s+\S*\*/);
    }
  });

  test('deploy commands select patches and a bundle source', () => {
    for (const command of bashCommands.filter((line) =>
      line.includes('apk-lab deploy'),
    )) {
      expect(command).toMatch(/--mpp|--build/);
      expect(command).toMatch(/--all|-e\s/);
    }
  });

  test('21c instructions are never documented as 22c', () => {
    for (const [file, content] of skillFiles) {
      for (const line of content.split('\n')) {
        if (!/\b22c\b/.test(line) || !/check-cast|new-instance/.test(line)) {
          continue;
        }
        const is22cTableRow = /^\|\s*`22c`/.test(line.trim());
        const alsoMentions21c = /\b21c\b/.test(line);
        expect(
          is22cTableRow || !alsoMentions21c,
          `${file} misclassifies a 21c instruction as 22c: ${line.trim()}`,
        ).toBe(false);
      }
    }
  });

  test('code examples do not enable android:debuggable', () => {
    for (const block of codeBlocks) {
      expect(block.content).not.toMatch(
        /android:debuggable["']?\s*,\s*["']true/i,
      );
      expect(block.content).not.toMatch(/android:debuggable\s*=\s*["']true/i);
    }
  });

  test('code examples do not use the overflow-prone bounds condition', () => {
    for (const block of codeBlocks) {
      expect(block.content).not.toMatch(/bytes\.size\s*<=\s*offset\s*\+/);
    }
  });

  test('Hermes v98 constants use the observed opcode bytes', () => {
    const hermes = skillFiles.get('references/binary-assets-hermes.md') ?? '';
    expect(hermes).toMatch(/LoadConstFalse.*0x96/);
    expect(hermes).toMatch(/LoadConstTrue.*0x95/);
  });

  test('documents --all as every compatible patch', () => {
    const skill = skillFiles.get('SKILL.md') ?? '';
    expect(skill).toContain(
      '--all selects every compatible patch, including patches declared with default = false',
    );
    expect(skill).not.toContain(
      '--all selects every compatible patch with default = true',
    );
    expect(skill).toContain('Use --patch only for explicit selection');
  });
});
