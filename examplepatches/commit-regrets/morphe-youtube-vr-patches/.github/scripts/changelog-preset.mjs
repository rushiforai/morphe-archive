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
 * 2. Each entry carries a short summary of its commit body (first paragraph, capped — see
 *    formatBody). The conventionalcommits preset's commit
 *    template has no body slot (templates.js commitPartial renders scope+subject+link only),
 *    so the body rides inside `subject` as a hard-break, two-space-indented continuation --
 *    which GitHub-flavored markdown keeps inside the bullet. The preset's own transform runs
 *    first (type filtering, reference formatting); this wrapper only enriches its output.
 *
 * Loaded by .releaserc.js: `config: './.github/scripts/changelog-preset.mjs'`.
 */
import conventionalcommits from 'conventional-changelog-conventionalcommits';

/**
 * Bodies are summarized, not dumped: only the first paragraph rides into the notes, capped so
 * a bullet reads as one to two lines. The v1.29.0 notes rendered whole commit bodies — walls
 * of prose in both GitHub and the Desktop viewer. The full text stays where it belongs: the
 * commit itself (`git show <ref>`), which the commit link points at.
 */
const MAX_BODY_CHARS = 220;

function formatBody(raw) {
  let firstParagraph = raw.trim().split(/\n\s*\n/, 1)[0].trim();
  if (!firstParagraph) return '';
  // A body that *opens* with a markdown list would render its items as a nested list under the
  // release bullet (the indent turns "- item" into a list marker, not a continuation). Bodies
  // are written to lead with a prose sentence; when one does not, promote the first line —
  // minus its marker — to prose and leave the rest out.
  if (/^[-*] |^\d+\. /.test(firstParagraph)) {
    firstParagraph = firstParagraph.split('\n', 1)[0].replace(/^[-*] |^\d+\. /, '');
  }
  let clipped = firstParagraph;
  if (clipped.length > MAX_BODY_CHARS) {
    clipped = clipped.slice(0, MAX_BODY_CHARS);
    // Never split a surrogate pair (an emoji at the cut would render as U+FFFD).
    const tail = clipped.charCodeAt(clipped.length - 1);
    if (tail >= 0xd800 && tail <= 0xdbff) clipped = clipped.slice(0, -1);
    clipped = clipped.replace(/\s+\S*$/, '') + ' …';
  }
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
