// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

// The guide builder's pure functions: node --test tools/guide/test/*.test.js (no dependencies).
'use strict';

const test = require('node:test');
const assert = require('node:assert/strict');
const zlib = require('node:zlib');
const guide = require('../build.js');

const PAGE = `<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- scenarios: FixSlideShowTests, OtherTests -->

# Fix slide show

The Slide Show View fits the screen again.

- Each post fits between the toolbar and the bottom bar,
  its border included.
- Its text **scrolls**, see \`Settings\`.

No settings.
`;

test('a page reads as its name, summary, scenarios and the rest', () => {
  const page = guide.readPage('fix-slide-show.md', PAGE);
  assert.equal(page.name, 'Fix slide show');
  assert.equal(page.summary, 'The Slide Show View fits the screen again.');
  assert.deepEqual(page.scenarios, ['FixSlideShowTests', 'OtherTests']);
  assert.ok(page.body.startsWith('- Each post fits'));
});

test('the Markdown renders as paragraphs and lists, a bullet going on in its indented lines, escaped', () => {
  assert.equal(
    guide.renderMarkdown(guide.readPage('a.md', PAGE).body),
    '<ul><li>Each post fits between the toolbar and the bottom bar, its border included.</li>'
      + '<li>Its text <strong>scrolls</strong>, see <code>Settings</code>.</li></ul>\n<p>No settings.</p>');
  assert.equal(guide.renderInline('a <b> & "c"'), 'a &lt;b&gt; &amp; &quot;c&quot;');
  assert.equal(guide.renderInline('[the README](https://example.com/x)'), '<a href="https://example.com/x">the README</a>');
});

test('the pages come in the index\'s order, the others after them', () => {
  const index = '| [B](patches/b.md) | b |\n| [A](patches/a.md) | a |\n';
  assert.deepEqual(guide.orderPages(index, ['a.md', 'c.md', 'b.md']), ['b.md', 'a.md', 'c.md']);
});

test('a post\'s player links give each MP4\'s Gherkin and marks; a broken one gives nothing', () => {
  const data = { g: 'Scenario: x', m: [[1, 2.5, 0]] };
  const packed = zlib.deflateRawSync(Buffer.from(JSON.stringify(data))).toString('base64').replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
  const body = `[▶ Play MP4](https://o.github.io/r/e2e-player.html?v=pr-1-v2-a-phone.mp4#s=${packed}) [x](https://o.github.io/r/e2e-player.html?v=pr-1-v2-b-phone.mp4#s=AAAA)`;
  assert.deepEqual(guide.readPlayerData([body]), { 'pr-1-v2-a-phone.mp4': data });
});

test('a scenario\'s newest recording is the first version with its MP4 on that screen', () => {
  const recordings = [
    { pr: 9, version: 2, runs: { phone: { gif: { name: 'g' } } } },
    { pr: 9, version: 1, runs: { phone: { mp4: { name: 'pr-9-v1-a-phone.mp4' } } } },
  ];
  assert.deepEqual(guide.pickNewest(recordings, 'phone'), { pr: 9, version: 1, screen: 'phone', mp4: { name: 'pr-9-v1-a-phone.mp4' } });
  assert.equal(guide.pickNewest(recordings, 'desktop'), null);
});

test('a scenario without a recording shows its Gherkin, unmarked, and says so', () => {
  const html = guide.renderScenario('O/r', { title: 'T', gherkin: 'Scenario: T', recording: null, data: null });
  assert.match(html, /No recording yet\./);
  assert.match(html, /data-src=""/);
  assert.match(html, /\{"g":"Scenario: T","m":\[\]\}/);
});

test('a scenario\'s data can\'t close its script element', () => {
  const html = guide.renderScenario('O/r', { title: 'T', gherkin: '</script><b>', recording: null, data: null });
  assert.doesNotMatch(html, /<\/script><b>/);
});

test('a page\'s include comments become the files they name; an unknown one stays', () => {
  const html = '<style>/* include: a.css */</style><script>/* include: a.js */</script><!-- include: b.js -->';
  assert.equal(guide.inline(html, { 'a.css': 'C', 'a.js': 'J' }), '<style>C</style><script>J</script><!-- include: b.js -->');
});

test('the index\'s groups list their patches in its order, its header rows left out', () => {
  const index = '# Patches\n\n## 🔧 Fixes\n\nWhat broke.\n\n| Patch | What it does |\n|---|---|\n| [Fix A](patches/fix-a.md) | a |\n'
    + '| [Fix B](patches/fix-b.md) | b |\n\n## ✨ Features\n\n| Patch | What it does |\n|---|---|\n| [Show C](patches/show-c.md) | c |\n\n## Nothing\n';
  assert.deepEqual(guide.readGroups(index), [{ title: '🔧 Fixes', names: ['Fix A', 'Fix B'] }, { title: '✨ Features', names: ['Show C'] }]);
});

test('the pages come in their groups; a page in none comes under "More"', () => {
  const pages = ['Fix B', 'Show C', 'Fix A', 'Extra'].map((name) => ({ name }));
  const grouped = guide.groupPages([{ title: 'Fixes', names: ['Fix A', 'Fix B', 'Gone'] }, { title: 'Features', names: ['Show C'] }], pages);
  assert.deepEqual(grouped.map((group) => [group.title, group.pages.map((page) => page.name)]),
    [['Fixes', ['Fix A', 'Fix B']], ['Features', ['Show C']], ['More', ['Extra']]]);
});

test('the guide is its sidebar\'s links and its sections, in the same order', () => {
  const page = (name, file) => ({ name, file, summary: 's', body: '', scenarioBlocks: [] });
  const guideHtml = guide.renderGuide('O/r', [{ title: 'Fixes', pages: [page('Fix A', 'fix-a.md')] }, { title: 'More', pages: [page('Extra', 'extra.md')] }]);
  assert.equal(guideHtml.nav, '<h2>Fixes</h2>\n<ul><li><a href="#fix-a">Fix A</a></li></ul>\n<h2>More</h2>\n<ul><li><a href="#extra">Extra</a></li></ul>');
  assert.ok(guideHtml.sections.indexOf('id="fix-a"') < guideHtml.sections.indexOf('id="extra"'));
});

test('a patch with no scenario shows its page and no recording; one with a patcher-specific page shows it as a note', () => {
  const page = { name: 'Disable feedback popup', file: 'disable-feedback-popup.md', summary: 's', body: '', scenarioBlocks: [] };
  assert.match(guide.renderPatch('O/baconreader-reseam-patches', page), /No recording: this patch has no e2e test yet\./);
  const html = guide.renderPatch('O/baconreader-morphe-patches', { ...page, patcherSpecific: '- A row in **Links**.' });
  assert.match(html, /<aside class="patcher-note"><h3>Only in Morphe<\/h3>\n<ul><li>A row in <strong>Links<\/strong>\.<\/li><\/ul><\/aside>/);
  assert.equal(guide.toPatcher('JoanComasFdz/baconreader-reseam-patches'), 'Reseam');
});
