"use strict";

const MARKER = "<!-- dap-release-branding:v1 -->";
const REPOSITORY = "johnneerdael/dutch-applications-patches";
const GUIDE = "https://morphe-patches.neerdael.nl/en/";

function renderNotes(notes, context) {
  if (notes.startsWith(`${MARKER}\n`)) return notes;

  const repository = context.env?.GITHUB_REPOSITORY || REPOSITORY;
  const { version, gitHead } = context.nextRelease;
  if (!/^[a-f0-9]{40}(?:[a-f0-9]{24})?$/i.test(gitHead || "")) {
    throw new Error("Release branding requires the full source commit, never a mutable ref.");
  }
  if (!/^[a-z0-9][a-z0-9_.-]*\/[a-z0-9][a-z0-9_.-]*$/i.test(repository)) {
    throw new Error("Release branding requires an owner/repository GitHub repository name.");
  }

  const prerelease = version.split("+", 1)[0].includes("-");
  const channel = prerelease ? "Development prerelease" : "Stable release";
  const banner = `https://raw.githubusercontent.com/${repository}/${gitHead}/docs/site/assets/brand/release-banner.png`;
  const source = `https://github.com/${repository}/commit/${gitHead}`;
  return [
    MARKER,
    `![Dutch App Patches. Dutch apps. Your choices.](${banner})`,
    "",
    `**${channel} · patch bundle v${version}.**`,
    "",
    `[Add to Morphe](https://morphe.software/add-source?github=${REPOSITORY}) · [User guide](${GUIDE})`,
    "",
    `Source: [${gitHead.slice(0, 12)}](${source}). Check each app's target versions in the user guide before patching.`,
    "",
    "---",
    "",
    notes,
  ].join("\n");
}

async function generateNotes(pluginConfig, context) {
  // semantic-release joins every generateNotes return. Delegate here instead of
  // adding a second generator that would return the previous notes a second time.
  // Regeneration after a prepare commit must start from commits, not nextRelease.notes.
  const generator = await import("@semantic-release/release-notes-generator");
  const notesContext = releaseNotesContext(context);
  const notes = await generator.generateNotes(pluginConfig, {...notesContext, commits: scopeCommits(notesContext.commits, notesContext)});
  return renderNotes(notes, context);
}

const {execFileSync} = require("node:child_process");
const semver = require("semver");

function git(context, ...args) {
  return execFileSync("git", args, {cwd: context.cwd, env: context.env, encoding: "utf8", maxBuffer: 16 * 1024 * 1024}).trim();
}

// semantic-release's stable baseline is appropriate for version selection, but
// prerelease notes must continue from the preceding release on the same channel.
function releaseNotesContext(context) {
  if (context.branch.type !== "prerelease") return context;
  const channel = context.branch.prerelease === true ? context.branch.name : context.branch.prerelease;
  const tags = git(context, "tag", "--merged", context.nextRelease.gitHead).split("\n");
  const previous = tags.filter(tag => {
    const version = semver.valid(tag);
    return version && semver.lt(version, context.nextRelease.version) && semver.prerelease(version)?.[0] === channel;
  }).sort((a, b) => semver.rcompare(semver.valid(a), semver.valid(b)))[0];
  if (!previous) return context;
  const lastRelease = {version: semver.valid(previous), gitTag: previous, gitHead: git(context, "rev-parse", previous)};
  const parts = git(context, "log", "--no-merges", "--format=%H%x00%B%x00", `${previous}..${context.nextRelease.gitHead}`).split("\0");
  const commits = [];
  for (let i = 0; i + 1 < parts.length; i += 2) commits.push({hash: parts[i].trim(), message: parts[i + 1].trim()});
  return {...context, lastRelease, commits};
}

// Every public bullet is scoped: Morphe treats unscoped quoted patch names
// such as `Hide ads` as applicable to every app carrying that patch name.
// Explicit trailers cover changes to shared code and scopes naming multiple apps.
function appImpact(context) {
  const root = "patches/src/main/kotlin/patches/";
  const apps = new Map();
  const head = context.nextRelease.gitHead;
  const declarations = git(context, "grep", "-l", "Compatibility(", head, "--", root).split("\n");
  for (const entry of declarations) {
    const file = entry.slice(entry.indexOf(":") + 1);
    const names = [...git(context, "show", `${head}:${file}`).matchAll(/Compatibility\(\s*name\s*=\s*"([^"\n]+)"/g)].map(match => match[1]);
    if (names.length) apps.set(file.slice(root.length).split("/")[0], names);
  }
  const base = context.lastRelease.gitTag;
  const changed = base ? git(context, "diff", "--name-only", base, head).split("\n") : git(context, "ls-tree", "-r", "--name-only", head).split("\n");
  const namesFor = files => [...new Set(files.filter(file => file.startsWith(root))
    .flatMap(file => apps.get(file.slice(root.length).split("/")[0]) || []))];
  return {apps, changed, namesFor, affected: namesFor(changed)};
}

function scopeCommits(commits, context) {
  const impact = context && appImpact(context);
  return commits.flatMap(commit => {
    const match = /^(\w+)(?:\(([^)]+)\))?(!?): (.*)/.exec(commit.message);
    if (!match) return [commit];
    const apps = /^Release-Apps: (.+)$/mi.exec(commit.message)?.[1].split(",").map(app => app.trim());
    if (!apps && ["general", "release", "build", "ci", "deps"].includes(match[2]?.toLowerCase())) return [commit];
    const files = impact ? git(context, "diff-tree", "--root", "--no-commit-id", "--name-only", "-r", commit.hash).split("\n") : [];
    const relevant = files.filter(file => impact?.changed.includes(file));
    const inferred = impact?.namesFor(relevant) || [];
    // A squash promotion or backmerge can introduce old commits without changing
    // their app's current source. Do not advertise those controls a second time.
    if (impact && impact.namesFor(files).length && !inferred.length &&
        !relevant.some(file => file.startsWith("patches/src/main/kotlin/patches/shared/") || file.startsWith("extensions/"))) return [];
    const scopes = apps || (inferred.length ? inferred : [match[2] || "General"]);
    if (scopes.some(scope => !/^[\p{L}\p{N}][\p{L}\p{N} ._&/-]*$/u.test(scope))) throw new Error("Invalid Release-Apps scope");
    return [...new Set(scopes)].map(scope => ({...commit, message: commit.message.replace(match[0], `${match[1]}(${scope})${match[3]}: ${match[4]}`)}));
  });
}

module.exports = { generateNotes, renderNotes, releaseNotesContext, scopeCommits, appImpact };
