"use strict";
const fs = require("node:fs");
const crypto = require("node:crypto");
const {execFileSync} = require("node:child_process");
const {api, REPOSITORY, SOURCE_REPOSITORY, BASE, OWNER, NAME} = require("./api.cjs");
const {verifyPublisher} = require("./identity.cjs");
const {verifyBundle, download} = require("../../.forgejo/scripts/bundle.cjs");
const {verifyDiscovery} = require("../../.forgejo/scripts/discovery.cjs");
function git(args, options = {}) {return execFileSync("git", args, {encoding: "utf8", ...options}).trim();}
function gitAuth(env = process.env) {
  return {...env, GIT_TRACE: "0", GIT_TRACE_CURL: "0", GIT_CONFIG_COUNT: "2",
    GIT_CONFIG_KEY_0: `http.${BASE}/.extraheader`, GIT_CONFIG_VALUE_0: `Authorization: Basic ${Buffer.from(`${OWNER}:${env.GITLAB_TOKEN}`).toString("base64")}`,
    GIT_CONFIG_KEY_1: `http.${BASE}/.extraheader`, GIT_CONFIG_VALUE_1: `PRIVATE-TOKEN: ${env.GITLAB_TOKEN}`};
}
async function mirrorRelease({env = process.env, request = api, fetcher = fetch, readBundle = download, updateMetadata = true} = {}) {
  await verifyPublisher({env, request});
  const branch = env.CI_COMMIT_BRANCH || git(["branch", "--show-current"]);
  if (!["main", "dev"].includes(branch)) throw new Error("Only main/dev releases can be mirrored");
  const manifest = JSON.parse(fs.readFileSync("patches-bundle.json", "utf8"));
  const version = manifest.version;
  if (!(branch === "dev" ? /^\d+\.\d+\.\d+-dev\.\d+$/ : /^\d+\.\d+\.\d+$/).test(version)) throw new Error("Source channel/version mismatch");
  const tag = `v${version}`;
  if (!git(["tag", "--points-at", "HEAD"]).split("\n").includes(tag)) {
    console.log("No authoritative release tag at this source commit; source mirror only"); return false;
  }
  const publicKey = fs.readFileSync("morphe-signing.pub", "utf8").trim();
  const response = await fetcher(`https://codeberg.org/api/v1/repos/${SOURCE_REPOSITORY}/releases/tags/${tag}`, {signal: AbortSignal.timeout(30000)});
  if (!response.ok) throw new Error("Authoritative Codeberg release is unavailable");
  const sourceRelease = await response.json();
  const {url, asset} = verifyDiscovery(manifest, sourceRelease, {branch, version, publicKey});
  const bytes = await readBundle(url, asset.size);
  const hash = verifyBundle(bytes, publicKey);
  const project = `/projects/${encodeURIComponent(REPOSITORY)}`;
  const filename = `patches-${version}.mpp`;
  const packagePath = `${project}/packages/generic/morphe-patches/${version}/${filename}`;
  let stored = await request(packagePath, {token: env.GITLAB_TOKEN, binary: true});
  if (!stored) {
    await request(packagePath, {token: env.GITLAB_TOKEN, method: "PUT", body: bytes});
    stored = await request(packagePath, {token: env.GITLAB_TOKEN, binary: true});
  }
  if (!stored || verifyBundle(stored, publicKey) !== hash) throw new Error(`${NAME} package differs from the authoritative signed bundle`);
  const permalink = `${BASE}/${REPOSITORY}/-/releases/${tag}/downloads/${filename}`;
  const link = {name: filename, url: `${BASE}/api/v4${packagePath}`, direct_asset_path: `/${filename}`, link_type: "package"};
  let release = await request(`${project}/releases/${tag}`, {token: env.GITLAB_TOKEN});
  if (!release) release = await request(`${project}/releases`, {token: env.GITLAB_TOKEN, method: "POST", body: {
    tag_name: tag, name: `Dutch App Patches ${version}`, description: manifest.description,
    assets: {links: [link]},
  }});
  if (release.author?.username !== OWNER || release.tag_name !== tag) throw new Error(`Unexpected ${NAME} release owner or tag`);
  if (!release.assets?.links?.some(item => item.name === filename && item.url === link.url))
    throw new Error(`${NAME} release is missing the exact mirrored package link`);
  if (updateMetadata) {
    const {publishMetadata} = require("./source.cjs");
    await publishMetadata({...manifest, download_url: permalink}, branch, {env: gitAuth(env)});
  }
  console.log(`Verified ${NAME} mirror: ${tag}, SHA-256 ${hash}`);
  return true;
}
module.exports = {mirrorRelease, gitAuth};
if (require.main === module) {
  if (!process.env.GITLAB_TOKEN) process.env.GITLAB_TOKEN = require("./identity.cjs").localToken();
  mirrorRelease().catch(error => {console.error(error.message);process.exitCode = 1;});
}
