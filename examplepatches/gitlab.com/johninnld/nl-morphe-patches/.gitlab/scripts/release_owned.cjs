"use strict";
// Morphe reads the bundle metadata (patches-bundle.json, patches-list.json) from main. Those and
// the other generated release files may only change in the release commit, which reaches main
// after its bundle is downloadable. Source commits may reach main earlier, without them.
const fs = require("node:fs");
const path = require("node:path");
const {execFileSync} = require("node:child_process");

const RELEASE_COMMIT = /^chore: Release v\d+\.\d+\.\d+(?:-[\w.]+)? \[skip ci\]$/;

/** The files the release commit owns: exactly the assets it commits. */
function releaseOwnedFiles(root = path.join(__dirname, "../..")) {
  const config = JSON.parse(fs.readFileSync(path.join(root, ".releaserc"), "utf8"));
  const entry = config.plugins.find(plugin => Array.isArray(plugin) && plugin[0] === "./.github/scripts/public_git.cjs");
  const assets = entry?.[1]?.assets;
  if (!Array.isArray(assets) || !assets.length || assets.some(asset => typeof asset !== "string")) {
    throw new Error("Release commit assets must be a list of file paths");
  }
  return assets;
}

/** Source commits in `range` that change a release-owned file, as {hash, subject, files}. */
function releaseOwnedChanges(range, {cwd = process.cwd(), env = process.env, owned = releaseOwnedFiles(cwd)} = {}) {
  const git = (...args) => execFileSync("git", args, {cwd, env, encoding: "utf8", maxBuffer: 16 * 1024 * 1024}).trim();
  const offending = [];
  for (const line of git("log", "--no-merges", "--format=%H%x09%s", range).split("\n").filter(Boolean)) {
    const [hash, subject] = line.split("\t");
    if (RELEASE_COMMIT.test(subject)) continue;
    const files = git("diff-tree", "--root", "--no-commit-id", "--name-only", "-r", hash).split("\n")
      .filter(file => owned.includes(file));
    if (files.length) offending.push({hash, subject, files});
  }
  return offending;
}

/**
 * Refuse to push source commits that carry release metadata. `base` is the published main head;
 * when it is not in the local history the check cannot be made and says so.
 */
function verifyUnpublishedCommits({cwd = process.cwd(), env = process.env, base, owned} = {}) {
  if (!base) return {checked: false, reason: "no published main head"};
  try {
    execFileSync("git", ["cat-file", "-e", `${base}^{commit}`], {cwd, env, stdio: "ignore"});
  } catch {
    return {checked: false, reason: "published main head is not in local history; fetch first"};
  }
  const offending = releaseOwnedChanges(`${base}..HEAD`, {cwd, env, ...(owned ? {owned} : {})});
  if (offending.length) {
    const list = offending.map(({hash, subject, files}) => `${hash.slice(0, 8)} ${subject}: ${files.join(", ")}`).join("\n");
    throw new Error(`Source commits must not change release-owned files; the release commit regenerates them:\n${list}`);
  }
  return {checked: true};
}

module.exports = {RELEASE_COMMIT, releaseOwnedFiles, releaseOwnedChanges, verifyUnpublishedCommits};
