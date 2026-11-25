"use strict";
const os = require("node:os");
const path = require("node:path");
const {execFileSync} = require("node:child_process");
const {api, OWNER, NAME, TOKEN_KEY, TOKEN_FILE_ENV, REPOSITORY} = require("./api.cjs");
const {verifyUnpublishedCommits} = require("./release_owned.cjs");
const {loadApiKeys,loadTokenFile} = require("../../scripts/local-release/credentials.cjs");
const git = require("../../.github/scripts/verify_identity.cjs");
function localToken({env=process.env,home=os.homedir()}={}) {
  if(env[TOKEN_FILE_ENV])return loadTokenFile(env[TOKEN_FILE_ENV]);
  return loadApiKeys(path.join(home,".ci"))[NAME.toUpperCase()+"_TOKEN"];
}
async function verifyPublisher({env = process.env, request = api} = {}) {
  if (!env.GITLAB_TOKEN) throw new Error(`${TOKEN_KEY} must supply GITLAB_TOKEN`);
  const user = await request("/user", {token: env.GITLAB_TOKEN});
  if (user.username !== OWNER) throw new Error(`${NAME} publishing must belong to ${OWNER}`);
}
async function verify(_config, context) {
  await verifyPublisher({env: context.env});
  git.verifyGitIdentity({cwd: context.cwd, env: context.env});
  git.verifyHistory({cwd: context.cwd, env: context.env});
  git.verifyMessage(context.nextRelease?.notes, "Release notes");
}
module.exports = {verifyConditions: verify, prepare: verify, verifyPublisher, localToken};
if (require.main === module) (async () => {
  if (!process.env.GITLAB_TOKEN) process.env.GITLAB_TOKEN = localToken();
  await verify({}, {cwd: process.cwd(), env: process.env});
  console.log(`${NAME} publisher and exact Git identity checks passed`);
  // Run before every push: source commits must leave the release-owned metadata to the release.
  const base = execFileSync("git", ["ls-remote", `https://gitlab.com/${REPOSITORY}.git`, "refs/heads/main"], {encoding: "utf8"}).split(/\s+/)[0];
  const owned = verifyUnpublishedCommits({cwd: process.cwd(), env: process.env, base});
  console.log(owned.checked ? "Unpublished source commits leave release metadata to the release"
    : `Release metadata check skipped: ${owned.reason}`);
})().catch(error => {console.error(error.message);process.exitCode = 1;});
