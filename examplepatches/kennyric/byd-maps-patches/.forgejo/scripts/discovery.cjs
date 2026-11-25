"use strict";
const fs = require("node:fs");
const {api, BASE, REPOSITORY} = require("./api.cjs");
const {verifyBundle, download} = require("./bundle.cjs");
function verifyDiscovery(manifest, release, {branch, version, publicKey}) {
  const prerelease = branch === "dev";
  if (branch !== "main" && !prerelease) throw new Error("Unexpected source branch");
  if (!(prerelease ? /^\d+\.\d+\.\d+-dev\.\d+$/ : /^\d+\.\d+\.\d+$/).test(version)) throw new Error("Version/channel mismatch");
  if (manifest.version !== version || manifest.public_key !== publicKey.trim()) throw new Error("Source version or signing key changed");
  if (!release || release.tag_name !== `v${version}` || release.draft || release.prerelease !== prerelease || release.author?.login !== "JohninNL") throw new Error("Published release does not match its source");
  const filename = `patches-${version}.mpp`;
  const url = `${BASE}/${REPOSITORY}/releases/download/v${version}/${filename}`;
  const asset = release.assets?.find(item => item.name === filename && item.size > 0);
  if (manifest.download_url !== url || !asset) throw new Error("Source does not point to an uploaded bundle");
  return {url, asset};
}
async function main() {
  const result = JSON.parse(fs.readFileSync("build/release-safety/codeberg-result.json", "utf8"));
  if (result.published === false) { console.log("No release was selected by semantic-release"); return; }
  const {branch, version} = result;
  const response = await fetch(`${BASE}/${REPOSITORY}/raw/branch/${branch}/patches-bundle.json`, {signal: AbortSignal.timeout(30000)});
  if (!response.ok) throw new Error(`Public source manifest returned HTTP ${response.status}`);
  const manifest = await response.json();
  const release = await api(`/repos/${REPOSITORY}/releases/tags/v${version}`);
  const publicKey = fs.readFileSync("morphe-signing.pub", "utf8").trim();
  const {url, asset} = verifyDiscovery(manifest, release, {branch, version, publicKey});
  const hash = verifyBundle(await download(url, asset.size), publicKey);
  console.log(`PASS public Morphe discovery: ${branch} ${version}; signed bundle SHA-256 ${hash}`);
}
module.exports = {verifyDiscovery};
if (require.main === module) main().catch(error => {console.error(error.message);process.exitCode = 1;});
