// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only
// Builds the site GitHub Pages publishes (.github/workflows/pages.yml):
//   node tools/guide/build.js <out folder>
// - the user guide, index.html: a sidebar listing the patches in docs/patches.md's groups (Fixes, Features, Cleanups), and
//   each patch's page (docs/patches/<patch>.md), what it does only with this repository's patcher
//   (docs/patcher-specific-patches/<patch>.md, if any), and the newest recording of each e2e scenario its page names,
//   played by the e2e player beside its Gherkin and its marks; a patch with no scenario shows its page alone;
// - site/'s other pages (e2e-player.html), and its images (favicon.png, preview.jpg), as they are.
// Each page gets e2e-player.css and e2e-player.js inlined where its "include" comments are, so a published page is one
// file. The recordings are prs-resources' assets; a scenario's newest is the highest PR, then its highest version (the
// VS Code extension's findRecordings). Its Gherkin and marks come from the player link in that PR's post, whose
// fragment carries them (the e2e tool's PlayerLinking): GitHub's downloads let no page read a file, and the post has
// them already. A scenario with no recording, or whose post lost its link, shows its Gherkin from its code, unmarked.
// GITHUB_REPOSITORY names the repository; GITHUB_TOKEN, when set, is sent to GitHub's API. Without network access
// (GUIDE_OFFLINE=1) every scenario shows unrecorded.
'use strict';

const fs = require('node:fs');
const path = require('node:path');
const zlib = require('node:zlib');
const extension = require('../vscode-extension/extension.js');

const RELEASE = 'prs-resources';
const INCLUDE = /\/\* include: ([\w.-]+) \*\/|<!-- include: ([\w.-]+) -->/g;
const PLAYER_LINK = /e2e-player\.html\?v=([A-Za-z0-9.-]+\.mp4)#s=([A-Za-z0-9_-]+)/g;

// ---- Pure: the patch pages ----------------------------------------------------------------------------------------

/** A patch page: its file, name, summary line, scenario classes and the Markdown after its summary. */
function readPage(file, text) {
  const lines = text.replace(/\r\n/g, '\n').split('\n');
  const scenarios = /<!-- scenarios:(.*)-->/.exec(text);
  const title = lines.findIndex((line) => line.startsWith('# '));
  const summaryAt = lines.findIndex((line, at) => at > title && line.trim() !== '');
  return {
    file,
    name: title < 0 ? file : lines[title].slice(2).trim(),
    summary: summaryAt < 0 ? '' : lines[summaryAt].trim(),
    scenarios: scenarios ? scenarios[1].split(',').map((name) => name.trim()).filter((name) => name) : [],
    body: summaryAt < 0 ? '' : lines.slice(summaryAt + 1).join('\n').trim(),
  };
}

/** The pages' files in docs/patches.md's order, each row "| [<name>](patches/<file>) | … |"; the others after them. */
function orderPages(index, files) {
  const listed = [...index.matchAll(/^\| \[[^\]]+\]\(patches\/([\w.-]+\.md)\) \|/gm)].map((row) => row[1]);
  return [...listed.filter((file) => files.includes(file)), ...files.filter((file) => !listed.includes(file)).sort()];
}

function escapeHtml(text) {
  return text.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}

/** One line of the pages' Markdown: `code`, **bold**, [links](…), escaped. */
function renderInline(text) {
  return escapeHtml(text)
    .replace(/`([^`]+)`/g, '<code>$1</code>')
    .replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>')
    .replace(/\[([^\]]+)\]\((https?:\/\/[^)\s]+)\)/g, '<a href="$2">$1</a>');
}

/**
 * The pages' Markdown (AGENTS.md, "Patch pages"): paragraphs and bullet lists, a bullet going on in its indented lines;
 * HTML comments are left out.
 */
function renderMarkdown(text) {
  const blocks = [];
  let list = null;
  let paragraph = null;
  const close = () => {
    if (paragraph) blocks.push(`<p>${renderInline(paragraph.join(' '))}</p>`);
    if (list) blocks.push(`<ul>${list.map((item) => `<li>${renderInline(item.join(' '))}</li>`).join('')}</ul>`);
    paragraph = null;
    list = null;
  };
  for (const line of text.replace(/<!--[\s\S]*?-->/g, '').split('\n')) {
    if (line.trim() === '') {
      close();
    } else if (/^- /.test(line)) {
      if (paragraph) close();
      list = list ?? [];
      list.push([line.slice(2).trim()]);
    } else if (list && /^\s+\S/.test(line)) {
      list[list.length - 1].push(line.trim());
    } else {
      if (list) close();
      paragraph = paragraph ?? [];
      paragraph.push(line.trim());
    }
  }
  close();
  return blocks.join('\n');
}

/** "fix-slide-show.md" → "fix-slide-show": a patch section's id, its page's name. */
function toAnchor(file) {
  return file.replace(/\.md$/, '');
}

/**
 * The index's groups of patches (docs/patches.md: "## 🔧 Fixes", then a table with a row per patch: "| [<name>](…) | … |"),
 * in its order: [{ title, names }]. The guide's sidebar lists the patches so, and a patch in none comes under "More".
 */
function readGroups(index) {
  const groups = [];
  for (const line of index.replace(/\r\n/g, '\n').split('\n')) {
    const heading = /^## (.+)$/.exec(line);
    const row = /^\| \[([^\]]+)\]\(/.exec(line);
    if (heading) {
      groups.push({ title: heading[1].trim(), names: [] });
    } else if (row && groups.length > 0) {
      groups[groups.length - 1].names.push(row[1].trim());
    }
  }
  return groups.filter((group) => group.names.length > 0);
}

/** The pages in the index's groups, each group in its order; those in no group come last, under "More". */
function groupPages(groups, pages) {
  const byName = new Map(pages.map((page) => [page.name, page]));
  const grouped = groups
    .map((group) => ({ title: group.title, pages: group.names.filter((name) => byName.has(name)).map((name) => byName.get(name)) }))
    .filter((group) => group.pages.length > 0);
  const listed = new Set(grouped.flatMap((group) => group.pages.map((page) => page.name)));
  const rest = pages.filter((page) => !listed.has(page.name));
  return rest.length > 0 ? [...grouped, { title: 'More', pages: rest }] : grouped;
}

// ---- Pure: the recordings ------------------------------------------------------------------------------------------

/** The player data of each MP4 the posts link to, by its name: {"g": Gherkin, "m": marks}. */
function readPlayerData(bodies) {
  const found = {};
  for (const body of bodies) {
    for (const link of body.matchAll(PLAYER_LINK)) {
      try {
        found[link[1]] = JSON.parse(zlib.inflateRawSync(Buffer.from(link[2].replace(/-/g, '+').replace(/_/g, '/'), 'base64')).toString('utf8'));
      } catch {
        // A link whose data isn't the player's: the scenario shows unmarked.
      }
    }
  }
  return found;
}

/** A scenario's newest recording on one screen: { pr, version, screen, mp4 } of the newest version that has its MP4; or null. */
function pickNewest(recordings, screen) {
  const newest = recordings.find((recording) => recording.runs[screen]?.mp4);
  return newest ? { pr: newest.pr, version: newest.version, screen, mp4: newest.runs[screen].mp4 } : null;
}

// ---- Pure: the page ------------------------------------------------------------------------------------------------

/** One scenario's block: its title, the recording it plays (or that it has none), and the player's data. */
function renderScenario(repository, scenario) {
  const data = scenario.data ?? { g: scenario.gherkin, m: [] };
  const recorded = scenario.recording
    ? `Recorded in <a href="https://github.com/${repository}/pull/${scenario.recording.pr}">PR #${scenario.recording.pr}</a> · V${scenario.recording.version}`
    : 'No recording yet.';
  const src = scenario.recording ? `https://github.com/${repository}/releases/download/${RELEASE}/${scenario.recording.mp4}` : '';
  return `<figure class="scenario">
<figcaption><h3>${escapeHtml(scenario.title)}</h3><p class="meta">${recorded}</p></figcaption>
<div class="recording" data-src="${escapeHtml(src)}"><script type="application/json">${JSON.stringify(data).replace(/</g, '\\u003c')}</script></div>
</figure>`;
}

/** "JoanComasFdz/baconreader-morphe-patches" → "Morphe": the patcher a repository's patches are for. */
function toPatcher(repository) {
  const name = /baconreader-(\w+)-patches/.exec(repository)?.[1] ?? '';
  return name.charAt(0).toUpperCase() + name.slice(1);
}

/**
 * A patch's section: its name, summary, page, what it does only with this repository's patcher (its page in
 * docs/patcher-specific-patches/, if any) and its scenarios; a patch with none has no recording to show.
 */
function renderPatch(repository, page) {
  const scenarios = page.scenarioBlocks.length > 0
    ? page.scenarioBlocks.map((scenario) => renderScenario(repository, scenario)).join('\n')
    : '<p class="meta">No recording: this patch has no e2e test yet.</p>';
  const only = page.patcherSpecific
    ? `<aside class="patcher-note"><h3>Only in ${escapeHtml(toPatcher(repository))}</h3>\n${renderMarkdown(page.patcherSpecific)}</aside>\n`
    : '';
  return `<section id="${toAnchor(page.file)}">
<h2>${escapeHtml(page.name)}</h2>
<p class="summary">${renderInline(page.summary)}</p>
${renderMarkdown(page.body)}
${only}${scenarios}
</section>`;
}

/** The guide: its sidebar, the groups' patches as links, and its content, each patch's section in the sidebar's order. */
function renderGuide(repository, groups) {
  const nav = groups.map((group) => `<h2>${renderInline(group.title)}</h2>\n<ul>${group.pages
    .map((page) => `<li><a href="#${toAnchor(page.file)}">${escapeHtml(page.name)}</a></li>`).join('')}</ul>`).join('\n');
  const sections = groups.flatMap((group) => group.pages.map((page) => renderPatch(repository, page))).join('\n');
  return { nav, sections };
}

/** A page with its include comments replaced by the files they name, from `files` (name → text). */
function inline(html, files) {
  return html.replace(INCLUDE, (whole, css, comment) => files[css ?? comment] ?? whole);
}

// ---- Shell: GitHub, the repository's files ------------------------------------------------------------------------

async function callGitHub(url) {
  const headers = { Accept: 'application/vnd.github+json', 'User-Agent': 'baconreader-patches-guide' };
  if (process.env.GITHUB_TOKEN) headers.Authorization = `Bearer ${process.env.GITHUB_TOKEN}`;
  const answer = await fetch(url, { headers });
  if (!answer.ok) throw new Error(`${url}: ${answer.status} ${await answer.text()}`);
  return answer.json();
}

// Every page of a list, 100 a page, asked by number: GitHub's "next" links name the repository by its numeric id.
async function callGitHubPages(url) {
  const items = [];
  for (let page = 1; ; page++) {
    const found = await callGitHub(`${url}${url.includes('?') ? '&' : '?'}per_page=100&page=${page}`);
    items.push(...found);
    if (found.length < 100) return items;
  }
}

async function readAssets(repository) {
  const releases = await callGitHubPages(`https://api.github.com/repos/${repository}/releases`);
  const release = releases.find((found) => found.tag_name === RELEASE);
  return release ? callGitHubPages(`https://api.github.com/repos/${repository}/releases/${release.id}/assets`) : [];
}

async function readComments(repository, pr) {
  const comments = await callGitHubPages(`https://api.github.com/repos/${repository}/issues/${pr}/comments`);
  return comments.map((comment) => comment.body ?? '');
}

/** The app's scenario files, by class name. */
function findScenarioFiles(root) {
  const found = {};
  const walk = (folder) => {
    for (const entry of fs.readdirSync(folder, { withFileTypes: true })) {
      const full = path.join(folder, entry.name);
      if (entry.isDirectory() && !['bin', 'obj', 'node_modules'].includes(entry.name)) walk(full);
      else if (entry.isFile() && entry.name.endsWith('Tests.cs')) found[entry.name.slice(0, -3)] = full;
    }
  };
  // The app's scenarios only: the VS Code extension's e2e project holds copies of some as its fixtures.
  walk(path.join(root, 'tests', 'BaconReader.E2E', 'Scenarios'));
  return found;
}

async function build(root, out, repository, offline) {
  const docs = path.join(root, 'docs', 'patches');
  const index = fs.readFileSync(path.join(root, 'docs', 'patches.md'), 'utf8');
  const files = orderPages(index, fs.readdirSync(docs).filter((file) => file.endsWith('.md')));
  const pages = files.map((file) => readPage(file, fs.readFileSync(path.join(docs, file), 'utf8')));
  // What a patch does only with this repository's patcher: docs/patcher-specific-patches/<patch>.md, after its title.
  for (const page of pages) {
    const only = path.join(root, 'docs', 'patcher-specific-patches', page.file);
    if (fs.existsSync(only)) {
      const lines = fs.readFileSync(only, 'utf8').replace(/<!--[\s\S]*?-->/g, '').split('\n');
      page.patcherSpecific = lines.filter((line) => !line.startsWith('# ')).join('\n').trim();
    }
  }
  const scenarioFiles = findScenarioFiles(root);
  const assets = offline ? [] : await readAssets(repository);
  const comments = {};
  for (const page of pages) {
    page.scenarioBlocks = [];
    for (const className of page.scenarios) {
      const source = scenarioFiles[className];
      const scenarios = source ? extension.findScenarios(fs.readFileSync(source, 'utf8')) : [];
      for (const scenario of scenarios) {
        const digests = await extension.digestScreens?.(scenario) ?? Object.fromEntries(await Promise.all(scenario.screens.map(async (screen) =>
          [screen, await extension.digestText(extension.toGifPath(scenario.domain, extension.toGifName(scenario.method, screen)))])));
        const recordings = extension.findRecordings(scenario, assets, digests);
        for (const screen of scenario.screens) {
          const newest = pickNewest(recordings, screen);
          let data = null;
          if (newest) {
            comments[newest.pr] = comments[newest.pr] ?? readPlayerData(await readComments(repository, newest.pr));
            data = comments[newest.pr][newest.mp4.name] ?? null;
          }
          page.scenarioBlocks.push({
            title: scenario.title,
            gherkin: scenario.gherkin,
            recording: newest ? { pr: newest.pr, version: newest.version, mp4: newest.mp4.name } : null,
            data,
          });
        }
      }
    }
  }

  const site = path.join(root, 'site');
  const includes = Object.fromEntries(['e2e-player.css', 'e2e-player.js'].map((name) => [name, fs.readFileSync(path.join(site, name), 'utf8')]));
  fs.mkdirSync(out, { recursive: true });
  for (const name of fs.readdirSync(site)) {
    if (name in includes) continue;
    if (!name.endsWith('.html')) {
      fs.copyFileSync(path.join(site, name), path.join(out, name));
      continue;
    }

    let text = fs.readFileSync(path.join(site, name), 'utf8');
    if (name === 'index.html') {
      const guide = renderGuide(repository, groupPages(readGroups(index), pages));
      text = text.replace('<!-- guide-nav -->', () => guide.nav).replace('<!-- guide -->', () => guide.sections);
    }
    fs.writeFileSync(path.join(out, name), inline(text, includes));
  }
  return pages;
}

if (require.main === module) {
  const out = process.argv[2];
  const repository = process.env.GITHUB_REPOSITORY;
  if (!out || !repository) {
    console.error('Usage: GITHUB_REPOSITORY=<owner>/<repo> node tools/guide/build.js <out folder>');
    process.exit(2);
  }
  build(path.resolve(__dirname, '..', '..'), path.resolve(out), repository, process.env.GUIDE_OFFLINE === '1').then((pages) => {
    const scenarios = pages.flatMap((page) => page.scenarioBlocks);
    console.log(`${pages.length} patches, ${scenarios.length} scenarios: ${scenarios.filter((s) => s.recording).length} recorded, `
      + `${scenarios.filter((s) => s.data?.m?.length).length} with marks.`);
  }, (error) => {
    console.error(error.message);
    process.exit(1);
  });
}

module.exports = { readPage, orderPages, readGroups, groupPages, toPatcher, renderInline, renderMarkdown, toAnchor, readPlayerData, pickNewest, renderScenario, renderPatch, renderGuide, inline };
