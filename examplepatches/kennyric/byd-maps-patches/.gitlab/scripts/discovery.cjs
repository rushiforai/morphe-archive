"use strict";
const fs = require("node:fs");
const {api, BASE, REPOSITORY, OWNER} = require("./api.cjs");
const {verifyBundle, download} = require("./bundle.cjs");
function verifyDiscovery(manifest, release, {branch, version, publicKey}) {
  const pattern = /^\d+\.\d+\.\d+$/;
  if (branch !== "main" || !pattern.test(version)) throw new Error("Version/channel mismatch");
  if (manifest.version !== version || manifest.public_key !== publicKey.trim()) throw new Error("Source version or signing key changed");
  if (!release || release.tag_name !== `v${version}` || release.upcoming_release || release.author?.username !== OWNER) throw new Error("Published release does not match its source");
  const filename = `patches-${version}.mpp`;
  const url = `${BASE}/${REPOSITORY}/-/releases/v${version}/downloads/${filename}`;
  const packageUrl = `${BASE}/api/v4/projects/${encodeURIComponent(REPOSITORY)}/packages/generic/morphe-patches/${version}/${filename}`;
  if (manifest.download_url !== url || !release.assets?.links?.some(link => link.name === filename && link.url === packageUrl)) throw new Error("Source does not point to the published bundle");
  return {url, filename};
}
/** Cache-busted, retried manifest fetch. The raw CDN serves stale copies of
 * freshly pushed files, so a manifest read right after the release commit
 * lands can still describe the previous release. */
async function fetchManifest(ref, {expectedVersion = null, fetcher = fetch, attempts = 3, pause = milliseconds => new Promise(resolve => setTimeout(resolve, milliseconds))} = {}) {
  const address = `${BASE}/${REPOSITORY}/-/raw/${ref}/patches-bundle.json`;
  let lastError = null;
  for (let attempt = 0; attempt < attempts; attempt++) {
    if (attempt) await pause(attempt * 5000);
    try {
      // Cache-busted: the raw CDN serves stale copies of freshly pushed files.
      const response = await fetcher(`${address}?t=${Date.now()}`, {signal: AbortSignal.timeout(30000), headers: {"Cache-Control": "no-cache"}});
      if (!response.ok) throw new Error(`Public source manifest returned HTTP ${response.status}`);
      const manifest = await response.json();
      // A stale copy is a retryable state, not a mismatch: only report the
      // mismatch once every attempt still served a different version.
      if (expectedVersion && manifest.version !== expectedVersion) {
        lastError = new Error(`Public source manifest still advertises ${manifest.version}`);
        continue;
      }
      return manifest;
    } catch (error) { lastError = error; }
  }
  throw lastError;
}
async function main() {
  const result = JSON.parse(fs.readFileSync("build/release-safety/gitlab-result.json", "utf8"));
  if (result.published === false) {console.log("No new release was selected"); return;}
  const {branch, version} = result;
  // The manifest at the release commit is immutable, so it is authoritative;
  // the branch tip is checked afterwards with its own retries for propagation.
  const manifest = await fetchManifest(result.generatedHead || branch, {expectedVersion: version});
  const project = `/projects/${encodeURIComponent(REPOSITORY)}`;
  const release = await api(`${project}/releases/v${version}`);
  const publicKey = fs.readFileSync("morphe-signing.pub", "utf8").trim();
  const {url, filename} = verifyDiscovery(manifest, release, {branch, version, publicKey});
  if (result.generatedHead) {
    await fetchManifest(branch, {expectedVersion: version})
      .catch(error => {throw new Error(`Branch manifest has not propagated: ${error.message}`);});
  }
  const packages = await api(`${project}/packages?package_type=generic&package_name=morphe-patches&package_version=${version}&per_page=100`);
  const pkg = packages?.find(item => item.name === "morphe-patches" && item.version === version);
  if (!pkg) throw new Error("Published package metadata is missing");
  const files = await api(`${project}/packages/${pkg.id}/package_files`);
  const asset = files.find(item => item.file_name === filename && item.size > 0);
  if (!asset) throw new Error("Published bundle file metadata is missing");
  const hash = verifyBundle(await download(url, asset.size), publicKey);
  if (asset.file_sha256 && hash !== asset.file_sha256) throw new Error("Public bundle differs from its package metadata");
  console.log(`PASS public Morphe discovery: ${branch} ${version}; signed bundle SHA-256 ${hash}`);
}
module.exports = {verifyDiscovery, fetchManifest};
if (require.main === module) main().catch(error => {console.error(error.message); process.exitCode = 1;});
