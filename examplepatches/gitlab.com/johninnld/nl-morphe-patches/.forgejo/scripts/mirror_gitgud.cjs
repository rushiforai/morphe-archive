"use strict";
const fs = require("node:fs");
const {execFileSync} = require("node:child_process");
const {api, REPOSITORY} = require("../../.gitlab/scripts/api.cjs");
const {verifyPublisher} = require("../../.gitlab/scripts/identity.cjs");
const {gitAuth} = require("../../.gitlab/scripts/release.cjs");
(async () => {
  if (!process.env.GITGUD_TOKEN) throw new Error("JOHNINNL_GITGUD_TOKEN is required for release mirroring");
  const env = {...process.env, GITLAB_TOKEN: process.env.GITGUD_TOKEN};
  await verifyPublisher({env});
  require("../../.github/scripts/verify_identity.cjs").verifyGitIdentity({env});
  require("../../.github/scripts/verify_identity.cjs").verifyHistory({env});
  const result = JSON.parse(fs.readFileSync("build/release-safety/codeberg-result.json", "utf8"));
  const branch = result.branch || execFileSync("git", ["branch", "--show-current"], {encoding: "utf8"}).trim();
  if (!["main", "dev"].includes(branch)) throw new Error("Only main/dev are release mirrors");
  const refs = [`HEAD:refs/heads/${branch}`];
  if (result.version) {
    if (!/^\d+\.\d+\.\d+(?:-dev\.\d+)?$/.test(result.version)) throw new Error("Invalid release version");
    refs.push(`refs/tags/v${result.version}:refs/tags/v${result.version}`);
  }
  execFileSync("git", ["push", "--atomic", "https://gitgud.io/JohninNL/nl-morphe-patches.git", ...refs], {env: gitAuth(env), stdio: "inherit"});
  if (result.version) {
    const pipeline = await api(`/projects/${encodeURIComponent(REPOSITORY)}/pipeline`, {token: env.GITLAB_TOKEN, method: "POST", body: {ref: branch}});
    console.log(`GitGud source/tag mirror verified; pipeline ${pipeline.id} requested`);
  }
})().catch(error => {console.error(error.message);process.exitCode = 1;});
