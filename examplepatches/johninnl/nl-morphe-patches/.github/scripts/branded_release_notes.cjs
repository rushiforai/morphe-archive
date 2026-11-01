"use strict";

const MARKER = "<!-- dap-release-branding:v1 -->";
const REPOSITORY = "johninnl/nl-morphe-patches";
const GUIDE = "https://johninnl.github.io/nl-morphe-patches/en/";

function restorePublicLinks(notes) {
  if (typeof notes !== "string") return notes;
  // semantic-release mistakes GIT_AUTHOR_NAME for a secret. Restore only this
  // repository's known public URL prefixes; retain all other secret masking.
  return notes
    .replace(/https:\/\/github\.com\/\[secure\]\/nl-morphe-patches(?=[/?#\s)"'<>]|$)/g,
      "https://github.com/johninnl/nl-morphe-patches")
    .replaceAll("https://raw.githubusercontent.com/[secure]/nl-morphe-patches/",
      "https://raw.githubusercontent.com/johninnl/nl-morphe-patches/")
    .replaceAll("https://[secure].github.io/nl-morphe-patches/",
      "https://johninnl.github.io/nl-morphe-patches/")
    .replace(/https:\/\/morphe\.software\/add-source\?github=\[secure\]\/nl-morphe-patches(?=[&#\s)"'<>]|$)/g,
      "https://morphe.software/add-source?github=johninnl/nl-morphe-patches");
}

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

  const banner = `https://raw.githubusercontent.com/${repository}/${gitHead}/docs/site/assets/brand/release-banner.png`;
  const source = `https://github.com/${repository}/commit/${gitHead}`;
  return [
    MARKER,
    `![Dutch App Patches. Dutch apps. Your choices.](${banner})`,
    "",
    `**Release · patch bundle v${version}.**`,
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
  const notes = await generator.generateNotes(pluginConfig, {...context, commits: scopeCommits(context.commits, context)});
  return renderNotes(notes, context);
}

const {execFileSync} = require("node:child_process");

function git(context, ...args) {
  return execFileSync("git", args, {cwd: context.cwd, env: context.env, encoding: "utf8", maxBuffer: 16 * 1024 * 1024}).trim();
}

function unreleasedCommitHashes(context) {
  if (context.branch?.name !== "dev" && context.branch?.type !== "prerelease") return null;
  const semver = require("semver");
  const head = context.nextRelease.gitHead;
  const tags = git(context, "tag", "--merged", head).split("\n")
    .filter(tag => semver.valid(tag));
  const hashes = git(context, "rev-list", head, ...(tags.length ? ["--not", ...tags] : []));
  return new Set(hashes.split("\n").filter(Boolean));
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
  const unreleased = unreleasedCommitHashes(context);
  const freshFiles = unreleased && new Set([...unreleased].flatMap(hash =>
    git(context, "diff-tree", "--root", "--no-commit-id", "--name-only", "-r", "-m", "--first-parent", hash).split("\n")));
  const changed = (base ? git(context, "diff", "--name-only", base, head).split("\n") : git(context, "ls-tree", "-r", "--name-only", head).split("\n"))
    .filter(file => !freshFiles || freshFiles.has(file));
  const namesFor = files => [...new Set(files.flatMap(file => {
    const owner = file.startsWith(root) ? file.slice(root.length).split("/")[0]
      : file.startsWith("support/medium/") ? "medium" : null;
    return apps.get(owner) || [];
  }))];
  return {apps, changed, namesFor, affected: namesFor(changed), unreleased};
}

function scopeCommits(commits, context) {
  const impact = context && appImpact(context);
  return commits.flatMap(commit => {
    if (impact?.unreleased && !impact.unreleased.has(commit.hash)) return [];
    const match = /^(\w+)(?:\(([^)]+)\))?(!?): (.*)/.exec(commit.message);
    if (!match) return [commit];
    const apps = /^Release-Apps: (.+)$/mi.exec(commit.message)?.[1].split(",").map(app => app.trim());
    if (!apps && ["general", "release", "build", "ci", "deps"].includes(match[2]?.toLowerCase())) return [commit];
    const files = impact ? git(context, "diff-tree", "--root", "--no-commit-id", "--name-only", "-r", commit.hash).split("\n") : [];
    const relevant = files.filter(file => impact?.changed.includes(file));
    const inferred = impact?.namesFor(relevant) || [];
    // Merging historical commits can leave the current source unchanged.
    // Do not advertise those controls a second time.
    if (impact && impact.namesFor(files).length && !inferred.length &&
        !relevant.some(file => file.startsWith("patches/src/main/kotlin/patches/shared/") || file.startsWith("extensions/"))) return [];
    const shared = relevant.some(file => file.startsWith("patches/src/main/kotlin/patches/shared/") || file.startsWith("extensions/"));
    const direct = impact?.namesFor(files) || [];
    const declared = apps && impact && !shared
      ? apps.filter(app => !direct.includes(app) || inferred.includes(app)) : apps;
    if (apps?.length && declared && !declared.length && inferred.length) throw new Error("Release-Apps omits the remaining changed apps");
    const scopes = declared || (inferred.length ? inferred : [match[2] || "General"]);
    if (scopes.some(scope => !/^[\p{L}\p{N}][\p{L}\p{N} ._&/-]*$/u.test(scope))) throw new Error("Invalid Release-Apps scope");
    return [...new Set(scopes)].map(scope => ({...commit, message: commit.message.replace(match[0], `${match[1]}(${scope})${match[3]}: ${match[4]}`)}));
  });
}

module.exports = { generateNotes, restorePublicLinks, renderNotes, scopeCommits, appImpact, unreleasedCommitHashes };
