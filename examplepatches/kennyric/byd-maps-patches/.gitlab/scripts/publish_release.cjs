"use strict";
process.env.GITLAB_DESTINATION = "gitlab";
const fs = require("node:fs");
const path = require("node:path");
const {execFileSync} = require("node:child_process");
const {api, REPOSITORY} = require("./api.cjs");
const {gitAuth} = require("./release.cjs");
const {verifyBundle} = require("./bundle.cjs");
const {promote} = require("./promote_main.cjs");
const {RELEASE_COMMIT, releaseOwnedFiles} = require("./release_owned.cjs");
const HTTPS_URL=`https://gitlab.com/${REPOSITORY}.git`,SSH_URL=`git@gitlab.com:${REPOSITORY}.git`;
function localSshAuth(env) {
  const value=env.GITLAB_SSH_KEY;
  if(typeof value!=="string"||/[\0\r\n]/.test(value))throw new Error("Invalid local SSH key path");
  const key=value.startsWith("~/")?path.join(require("node:os").homedir(),value.slice(2)):value;
  if(!path.isAbsolute(key))throw new Error("Local SSH key path must be absolute");
  const isolated={...env,GIT_TERMINAL_PROMPT:"0",GIT_TRACE:"0",GIT_TRACE_CURL:"0"};
  for(const name of Object.keys(isolated))if(/^GIT_CONFIG/.test(name)||name==="GIT_SSH")delete isolated[name];
  const quoted="'"+key.replace(/'/g,"'\\''")+"'";
  return {...isolated,GIT_CONFIG_COUNT:"0",GIT_SSH_VARIANT:"ssh",GIT_SSH_COMMAND:`ssh -i ${quoted} -o IdentitiesOnly=yes -o BatchMode=yes -o StrictHostKeyChecking=yes`};
}
async function recoverTaggedRelease(branch, {cwd = process.cwd(), env = process.env, exec = execFileSync, request = api,
  build = () => exec("./gradlew", [":patches:buildAndroid", "--no-daemon", "-Dorg.gradle.jvmargs=-Xmx2g"], {cwd, env, stdio: "inherit"}),
  publish = require("./publish.cjs").publish} = {}) {
  const manifest = JSON.parse(fs.readFileSync(path.join(cwd, "patches-bundle.json"), "utf8"));
  const pattern = /^\d+\.\d+\.\d+$/;
  if (branch !== "main" || !pattern.test(manifest.version)) throw new Error("Tagged source channel/version mismatch");
  const tag = `v${manifest.version}`;
  const tags = exec("git", ["tag", "--points-at", "HEAD"], {cwd, env, encoding: "utf8"}).trim().split("\n");
  if (!tags.includes(tag)) return null;
  // Resume the exact signed upload if the tag was pushed before publication finished.
  const filename = `patches-${manifest.version}.mpp`;
  const stored = await request(`/projects/${encodeURIComponent(REPOSITORY)}/packages/generic/morphe-patches/${manifest.version}/${filename}`, {binary: true, token: env.GITLAB_TOKEN, expectedBytes: 64 * 1024 * 1024});
  if (stored) {
    verifyBundle(stored, fs.readFileSync(path.join(cwd, "morphe-signing.pub"), "utf8").trim());
    fs.mkdirSync(path.join(cwd, "patches/build/libs"), {recursive: true});
    fs.writeFileSync(path.join(cwd, "patches/build/libs", filename), stored);
  } else build();
  await publish({}, {cwd, env, branch: {name: branch}, nextRelease: {
    version: manifest.version, gitTag: tag, gitHead: exec("git", ["rev-parse", "HEAD"], {cwd, env, encoding: "utf8"}).trim(), notes: manifest.description,
  }});
  return {version: manifest.version, branch};
}
function verifyCurrentHead(branch, readRemote, {cwd = process.cwd(), env = process.env, exec = execFileSync, repositoryUrl = HTTPS_URL} = {}) {
  const local = exec("git", ["rev-parse", "HEAD"], {cwd, env, encoding: "utf8"}).trim();
  const remote = (readRemote ? readRemote() : exec("git", ["ls-remote", repositoryUrl, `refs/heads/${branch}`], {cwd, env, encoding: "utf8"})).trim().split(/\s+/)[0];
  if (!/^[a-f0-9]{40}$/.test(remote)) throw new Error("Cannot verify the current GitLab source head");
  if (local !== remote) throw new Error("Stale release checkout: start a recovery pipeline at the current GitLab release tag or branch head");
}
/**
 * A release whose tag was pushed but whose branch move never happened (the run stopped between
 * publishing and promotion): its release commit sits directly on top of the current branch head.
 */
function findPendingRelease({cwd = process.cwd(), env = process.env, exec = execFileSync, repositoryUrl = HTTPS_URL} = {}) {
  const git = args => exec("git", args, {cwd, env, encoding: "utf8"}).trim();
  const head = git(["rev-parse", "HEAD"]);
  const direct = {}, peeled = {};
  for (const line of git(["ls-remote", "--tags", repositoryUrl]).split("\n").filter(Boolean)) {
    const [sha, ref] = line.split(/\s+/);
    if (ref.endsWith("^{}")) peeled[ref.slice(0, -3)] = sha; else direct[ref] = sha;
  }
  const pending = [];
  for (const ref of Object.keys(direct).filter(ref => /^refs\/tags\/v\d+\.\d+\.\d+$/.test(ref))) {
    const commit = peeled[ref] || direct[ref];
    if (commit === head) continue;
    try { git(["cat-file", "-e", `${commit}^{commit}`]); } catch { git(["fetch", "--no-tags", "--quiet", repositoryUrl, ref]); }
    let parent;
    try { parent = git(["rev-parse", `${commit}^1`]); } catch { continue; }
    if (parent !== head || !RELEASE_COMMIT.test(git(["log", "-1", "--format=%s", commit]))) continue;
    pending.push({tag: ref.slice("refs/tags/".length), commit});
  }
  if (pending.length > 1) throw new Error(`More than one pending release on top of the branch: ${pending.map(item => item.tag).join(", ")}`);
  return pending[0] || null;
}
async function main(argv = process.argv.slice(2), {cwd = process.cwd(), env = process.env, exec = execFileSync,
  release, recover = recoverTaggedRelease, verifyHead, authenticate = gitAuth, pending = findPendingRelease, promoteBranch = promote} = {}) {
  for (const option of argv) if (!["--local", "--dry-run"].includes(option)) throw new Error(`Unknown option: ${option}`);
  const local = argv.includes("--local"), preview = argv.includes("--dry-run");
  const baseEnv={...env,GITLAB_REPOSITORY:REPOSITORY,GITHUB_REPOSITORY:REPOSITORY,GITLAB_DESTINATION:"gitlab"},ssh=local&&!!env.GITLAB_SSH_KEY;
  const sshEnv=ssh?localSshAuth(baseEnv):null;
  const branch = exec("git", ["branch", "--show-current"], {cwd, env:sshEnv||env, encoding: "utf8"}).trim();
  if (branch !== "main") throw new Error("Only main can publish");
  const releaseEnv = sshEnv||authenticate(baseEnv);
  const options = {...require("../gitlab-com.release.config.cjs"), ...(local ? {ci: false} : {}), ...(preview ? {dryRun: true} : {}), ...(ssh?{repositoryUrl:SSH_URL}:{})};
  const checkHead = verifyHead || (() => verifyCurrentHead(branch, undefined, {cwd, env: releaseEnv, exec,repositoryUrl:options.repositoryUrl}));
  if (!preview) await checkHead(branch);
  const repositoryUrl = options.repositoryUrl || HTTPS_URL;
  const waiting = preview ? null : pending({cwd, env: releaseEnv, exec, repositoryUrl});
  let outcome;
  if (waiting) {
    // Finish the interrupted release: publish (idempotently) at its tag, then move the branch.
    const tagRef = `refs/tags/${waiting.tag}`;
    try { exec("git", ["rev-parse", "--verify", "--quiet", tagRef], {cwd, env: releaseEnv, encoding: "utf8"}); }
    catch { exec("git", ["fetch", "--no-tags", "--quiet", repositoryUrl, `${tagRef}:${tagRef}`], {cwd, env: releaseEnv}); }
    // Verification regenerated the release-owned files in this workspace; the release commit
    // carries its own copies, so drop those regenerations (and nothing else) before switching.
    const regenerated = exec("git", ["diff", "--name-only", "--", ...releaseOwnedFiles(cwd)], {cwd, env: releaseEnv, encoding: "utf8"})
      .split("\n").filter(Boolean);
    if (regenerated.length) exec("git", ["checkout", "--quiet", "--", ...regenerated], {cwd, env: releaseEnv});
    exec("git", ["checkout", "--quiet", "--detach", waiting.commit], {cwd, env: releaseEnv});
    outcome = await recover(branch, {cwd, env: releaseEnv, exec});
    if (!outcome) throw new Error(`Pending release ${waiting.tag} could not be recovered`);
    promoteBranch({repositoryUrl, branch, release: waiting.commit, cwd, env: releaseEnv, run: exec});
  } else {
    const runRelease = release || (await import("semantic-release")).default;
    const result = await runRelease(options, {cwd, env: releaseEnv});
    if (preview) outcome = {preview: true, published: false, branch, ...(result ? {version: result.nextRelease.version} : {})};
    else if (result) outcome = {version: result.nextRelease.version, branch};
    else {
      await checkHead(branch);
      outcome = await recover(branch, {cwd, env: releaseEnv, exec});
      if (!outcome) outcome = {published: false};
    }
  }
  const directory = path.join(cwd, "build/release-safety");
  fs.mkdirSync(directory, {recursive: true});
  fs.writeFileSync(path.join(directory, "gitlab-result.json"), JSON.stringify(outcome));
  return outcome;
}
module.exports = {main, recoverTaggedRelease, verifyCurrentHead, findPendingRelease};
if (require.main === module) main().catch(error => {console.error(error.message); process.exitCode = 1;});
