"use strict";
// Creates the release commit like @semantic-release/git, but does not push it to the branch.
// semantic-release then pushes only its tag; promote_main.cjs moves the branch to the release
// commit after the bundle is published, so Morphe never reads metadata for a missing download.
const {execFileSync} = require("node:child_process");
const {restorePublicLinks} = require("../../.github/scripts/branded_release_notes.cjs");

exports.verifyConditions = async (config, context, load = name => import(name)) =>
  (await load("@semantic-release/git")).verifyConditions(config, context);

exports.prepare = async (config, context, {load = name => import(name), run = execFileSync} = {}) => {
  const {cwd, env, branch, lastRelease, logger} = context;
  const nextRelease = {...context.nextRelease, notes: restorePublicLinks(context.nextRelease.notes)};
  const assets = (config.assets || []).map(asset => typeof asset === "string" ? asset : asset.path);
  if (!assets.length || assets.some(asset => typeof asset !== "string" || /[*?[\]{}!]/.test(asset))) {
    throw new Error("Release commit assets must be plain file paths");
  }
  const git = (args, input) => run("git", args, {cwd, env, encoding: "utf8", maxBuffer: 16 * 1024 * 1024, ...(input === undefined ? {} : {input})});
  // Only ask about the release assets: a release workspace holds thousands of untracked build files.
  const modified = new Set(git(["ls-files", "-m", "-o", "--", ...assets]).split("\n").filter(Boolean));
  const files = assets.filter(asset => modified.has(asset));
  if (!files.length) throw new Error("The release produced no metadata changes to commit");
  git(["add", "--force", "--ignore-errors", "--", ...files]);
  const {template} = await load("lodash-es");
  git(["commit", "-F", "-"], template(config.message)({branch: branch.name, lastRelease, nextRelease}));
  logger.log("Prepared release commit %s locally; %s moves to it after publication", nextRelease.gitTag, branch.name);
};
