"use strict";
const fs = require("node:fs");
const os = require("node:os");
const path = require("node:path");
const {execFileSync} = require("node:child_process");
const git = require("../../.github/scripts/verify_identity.cjs");
const {BASE, REPOSITORY, NAME} = require("./api.cjs");
const {verifyPublisher} = require("./identity.cjs");
const REMOTE = `${BASE}/${REPOSITORY}.git`;
async function publishMetadata(manifest, branch, {env = process.env} = {}) {
  if (branch !== "main") throw new Error("Invalid metadata channel");
  await verifyPublisher({env});
  git.verifyGitIdentity({env});
  const temp = fs.mkdtempSync(path.join(os.tmpdir(), `${NAME.toLowerCase()}-source-`));
  const options = {env: {...env, GIT_INDEX_FILE: path.join(temp, "index")}, encoding: "utf8"};
  const run = (args, input) => execFileSync("git", args, {...options, input}).trim();
  try {
    const found = run(["ls-remote", REMOTE, "refs/heads/distribution"]);
    let parent;
    if (found) {
      parent = found.split(/\s+/)[0];
      run(["fetch", "--no-tags", REMOTE, `refs/heads/distribution:refs/remotes/${NAME.toLowerCase()}/distribution`]);
      run(["read-tree", parent]);
    } else run(["read-tree", "--empty"]);
    const blob = run(["hash-object", "-w", "--stdin"], JSON.stringify(manifest, null, 2) + "\n");
    run(["update-index", "--add", "--cacheinfo", `100644,${blob},${branch}/patches-bundle.json`]);
    const tree = run(["write-tree"]);
    if (parent && tree === run(["rev-parse", `${parent}^{tree}`])) return;
    git.verifyHistory({env});
    const commit = run(["commit-tree", tree, ...(parent ? ["-p", parent] : []), "-m", `chore: mirror ${branch} bundle ${manifest.version} [skip ci]`]);
    run(["push", REMOTE, `${commit}:refs/heads/distribution`]);
  } finally {fs.rmSync(temp, {recursive: true, force: true});}
}
module.exports = {publishMetadata};
