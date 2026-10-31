/**
 * Changelog preset wrapper for the release notes generator (@semantic-release/release-notes-generator
 * `config` option). Two jobs, both because this repo's release notes are read by humans twice:
 * on GitHub and in Morphe Desktop's "Patch notes" viewer (morphe-desktop docs/documentation.md --
 * patch sources expand the release changelog before downloading a bundle).
 *
 * 1. Housekeeping stays out of the notes: chore/deps (Dependabot bumps), docs, ci, test,
 *    refactor and style carry `effect: 'hidden'` (the conventionalcommits v10 field name --
 *    `hidden: true` is the v9 spelling and silently KEEPS the entry), so they are
 *    release-note-invisible; release triggering is the commit-analyzer's job and is untouched
 *    in .releaserc.js.
 * 2. Commit bodies are rendered under each entry. The conventionalcommits preset's commit
 *    template has no body slot (templates.js commitPartial renders scope+subject+link only),
 *    so the body rides inside `subject` as a hard-break, two-space-indented continuation --
 *    which GitHub-flavored markdown keeps inside the bullet. The preset's own transform runs
 *    first (type filtering, reference formatting); this wrapper only enriches its output.
 *
 * Loaded by .releaserc.js: `config: './.github/scripts/changelog-preset.mjs'`.
 */
import conventionalcommits from 'conventional-changelog-conventionalcommits';

/** Cap a body so a runaway paragraph cannot flood the Desktop viewer. */
const MAX_BODY_CHARS = 700;

function formatBody(raw) {
  const body = raw.trim();
  if (!body) return '';
  const clipped =
    body.length > MAX_BODY_CHARS
      ? body.slice(0, MAX_BODY_CHARS).replace(/\s+\S*$/, '') + ' …'
      : body;
  // Hard break + two-space indent per line: stays inside the bullet on GitHub.
  return clipped
    .split('\n')
    .map((line) => (line.trim() ? `  ${line.trimEnd()}  ` : '  '))
    .join('\n');
}

export default async () => {
  const opts = await conventionalcommits({
    types: [
      { type: 'fix', section: '🐛 Bug Fixes' },
      { type: 'feat', section: '✨ New Features' },
      { type: 'bump', section: '🚀 Updated App Support' },
      { type: 'perf', section: '🔧 Improvements' },
      { type: 'build', effect: 'hidden' },
      { type: 'chore', effect: 'hidden' },
      { type: 'docs', effect: 'hidden' },
      { type: 'ci', effect: 'hidden' },
      { type: 'test', effect: 'hidden' },
      { type: 'refactor', effect: 'hidden' },
      { type: 'style', effect: 'hidden' },
    ],
  });

  // The preset module exposes its writer under `writer` (release-notes-generator maps
  // `loadedConfig.writer` into its writerOpts); wrap its transform so type filtering,
  // reference formatting and hidden-type handling stay the preset's own.
  const presetTransform = opts.writer.transform;
  opts.writer.transform = (commit, context) => {
    const out = presetTransform(commit, context);
    // The writer awaits a thenable transform. Mutating a Promise would drop the body
    // with no error — the failure this repo has already had from a writer/preset mismatch.
    if (!out || typeof out.then === 'function') return out;
    const body = formatBody(commit.body || '');
    if (body) {
      out.subject = `${out.subject || commit.header || ''}\n${body}`;
    }
    return out;
  };

  return opts;
};
