"use strict";

const {execFileSync} = require("node:child_process");
const semver = require("semver");
const {releaseNotesContext, appImpact} = require("./branded_release_notes.cjs");
const ROOT = "patches/src/main/kotlin/patches/";
const compact = value => value.replace(/[^\p{L}\p{N}]/gu, "").toLowerCase();

function verifyNotes(context) {
  const git = (...args) => execFileSync("git", args, {cwd: context.cwd, env: context.env, encoding: "utf8", maxBuffer: 16 * 1024 * 1024}).trim();
  const head = context.nextRelease.gitHead;
  const notesContext = releaseNotesContext(context);
  const base = notesContext.lastRelease.gitTag;
  const notes = context.nextRelease.notes;
  if (base && !notes.includes(`/compare/${base}...${context.nextRelease.gitTag}`)) {
    throw new Error(`Release notes must compare against the preceding channel release ${base}`);
  }
  const range = base ? `${base}..${head}` : head;
  const commits = new Set(git("log", "--no-merges", "--format=%H", range).split("\n").filter(Boolean));
  for (const line of notes.split("\n").filter(line => /^\* /.test(line))) {
    const hash = /\/commit\/([a-f0-9]{40,64})/.exec(line)?.[1];
    if (!hash || !commits.has(hash)) throw new Error("Release notes contain a replayed commit outside the channel range");
    if (!/^\* \*\*[^*]+:\*\*/.test(line)) throw new Error("Every release bullet needs an explicit app or General scope");
  }

  const {apps, changed, namesFor, affected: affectedNames} = appImpact(notesContext);
  const affected = new Set(affectedNames);
  const allNames = new Set([...apps.values()].flat());
  const isShared = file => file.startsWith(`${ROOT}shared/`) || file.startsWith("extensions/");
  const authorizedShared = new Map();
  for (const hash of commits) {
    const files = git("diff-tree", "--root", "--no-commit-id", "--name-only", "-r", hash).split("\n")
      .filter(file => changed.includes(file));
    if (!files.some(isShared)) continue;
    const message = git("show", "-s", "--format=%B", hash);
    const declared = /^Release-Apps: (.+)$/mi.exec(message)?.[1].split(",").map(name => name.trim()) || [];
    if (!namesFor(files).length && !declared.length) throw new Error(`Shared-only commit ${hash} needs its own Release-Apps trailer`);
    for (const name of declared) {
      if (!allNames.has(name)) throw new Error(`Unknown Release-Apps name ${name}`);
      const bullet = notes.split("\n").some(line => line.startsWith(`* **${name}:**`) && line.includes(`/commit/${hash}`));
      if (!bullet) throw new Error(`Missing Release-Apps scope ${name} for shared commit ${hash}`);
    }
    authorizedShared.set(hash, new Set(declared));
  }
  const scopes = new Set([...notes.matchAll(/^\* \*\*([^*]+):\*\*/gm)].map(match => match[1]));
  for (const line of notes.split("\n").filter(line => /^\* /.test(line))) {
    const scope = /^\* \*\*([^*]+):\*\*/.exec(line)[1];
    if (["general", "release", "build", "ci", "deps"].includes(scope.toLowerCase())) continue;
    const hash = /\/commit\/([a-f0-9]{40,64})/.exec(line)[1];
    const matches = [...allNames].filter(name => compact(name) === compact(scope));
    if (!matches.length) throw new Error(`Unknown app scope ${scope}; use its Compatibility name or a Release-Apps trailer`);
    if (matches.every(name => !affected.has(name) && !authorizedShared.get(hash)?.has(name))) throw new Error(`Release notes scope ${scope} names an unchanged app`);
  }
  for (const name of affected) {
    if (![...scopes].some(scope => compact(scope) === compact(name))) throw new Error(`Missing release notes scope for changed app ${name}`);
  }

  if (context.branch.type === "prerelease") {
    const stable = git("tag", "--list").split("\n").map(tag => semver.valid(tag))
      .filter(version => version && !semver.prerelease(version)).sort(semver.rcompare)[0];
    if (stable && !semver.gt(context.nextRelease.version, stable)) throw new Error(`Prerelease must be newer than stable ${stable}`);
  }
  context.logger.log("Release notes verified against %s; changed app scopes: %s", base, [...affected].join(", ") || "none");
}

// semantic-release verifies a release before running generateNotes. Generate a
// candidate here rather than reading nextRelease.notes before it exists.
async function verifyRelease(_config, context) {
  const {cosmiconfigSync} = require("cosmiconfig");
  const config = cosmiconfigSync("release").search(context.cwd).config;
  const noteConfig = config.plugins.find(plugin => Array.isArray(plugin) && plugin[1].preset === "conventionalcommits")[1];
  const {generateNotes} = require("./branded_release_notes.cjs");
  const notes = await generateNotes(noteConfig, context);
  verifyNotes({...context, nextRelease: {...context.nextRelease, notes}});
}
module.exports = {verifyRelease, verifyNotes};
