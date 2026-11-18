"use strict";
// Last publish step: fast-forward the release branch to the release commit once its tagged
// GitLab release and bundle are live. Until then the branch keeps the previous metadata.
const {execFileSync} = require("node:child_process");

const SHA = /^[0-9a-f]{40}$/;

/** Fast-forwards `branch` on `repositoryUrl` from `source` to `release`; never forces. */
function promote({repositoryUrl, branch, release, cwd = process.cwd(), env = process.env, run = execFileSync}) {
  const git = args => run("git", args, {cwd, env, encoding: "utf8"}).trim();
  if (!SHA.test(release)) throw new Error("Release commit id is invalid");
  const source = git(["rev-parse", `${release}^1`]);
  const remote = () => (git(["ls-remote", repositoryUrl, `refs/heads/${branch}`]).split(/\s+/)[0] || "");
  const current = remote();
  if (current === release) return {promoted: false, head: release};
  if (current !== source) throw new Error(`${branch} moved during the release; it was not promoted to the release commit`);
  git(["push", repositoryUrl, `${release}:refs/heads/${branch}`]);
  if (remote() !== release) throw new Error(`${branch} does not point to the release commit after promotion`);
  return {promoted: true, head: release};
}

exports.promote = promote;
exports.publish = async (_config, context) => {
  const {cwd, env, branch, nextRelease, options, logger} = context;
  const result = promote({repositoryUrl: options.repositoryUrl, branch: branch.name, release: nextRelease.gitHead, cwd, env});
  logger.log(result.promoted ? "Moved %s to release %s" : "%s already points to release %s", branch.name, nextRelease.gitTag);
  return false;
};
