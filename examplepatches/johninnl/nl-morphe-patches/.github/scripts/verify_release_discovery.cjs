"use strict";

const fs = require("node:fs");
const {execFileSync} = require("node:child_process");

/** Verify what Manager discovers, rather than only the GitHub release flag. */
function verifyDiscovery(manifest, release, {repository, branch, version, publicKey}) {
  if (!["main", "dev"].includes(branch)) throw new Error("Unsupported release branch");
  const prerelease = branch === "dev";
  const validVersion = prerelease ? /^\d+\.\d+\.\d+-dev\.\d+$/ : /^\d+\.\d+\.\d+$/;
  if (!validVersion.test(version)) throw new Error("Version does not match source channel");
  if (manifest.version !== version) throw new Error("Morphe branch manifest advertises a different version");
  if (release.tag_name !== `v${version}` || release.prerelease !== prerelease || release.draft) {
    throw new Error("GitHub release does not match the published source channel");
  }
  if (release.author?.login !== "johninnl") throw new Error("Release publisher must be johninnl");
  if (!publicKey || manifest.public_key !== publicKey.trim()) throw new Error("Source signing key changed or is missing");
  const file = `patches-${version}.mpp`;
  const download = `https://github.com/${repository}/releases/download/v${version}/${file}`;
  if (manifest.download_url !== download) throw new Error("Morphe manifest points to the wrong bundle download");
  if (!release.assets?.some(asset => asset.name === file && asset.browser_download_url === download && asset.state === "uploaded" && asset.size > 0)) {
    throw new Error("Advertised bundle is not an uploaded release asset");
  }
  return download;
}

function main() {
  const args = process.argv.slice(2);
  const branch = args[args.indexOf("--branch") + 1];
  const version = args[args.indexOf("--version") + 1];
  const repository = process.env.GITHUB_REPOSITORY || "johninnl/nl-morphe-patches";
  if (!/^[\w.-]+\/[\w.-]+$/.test(repository) || !args.includes("--branch") || !args.includes("--version")) {
    throw new Error("Usage: verify_release_discovery.cjs --branch main|dev --version VERSION");
  }
  const api = endpoint => JSON.parse(execFileSync("gh", ["api", endpoint], {encoding: "utf8"}));
  const file = api(`repos/${repository}/contents/patches-bundle.json?ref=${encodeURIComponent(branch)}`);
  const manifest = JSON.parse(Buffer.from(file.content, "base64").toString("utf8"));
  const release = api(`repos/${repository}/releases/tags/v${encodeURIComponent(version)}`);
  const download = verifyDiscovery(manifest, release, {
    repository, branch, version, publicKey: fs.readFileSync("morphe-signing.pub", "utf8")
  });
  console.log(`PASS Morphe discovery: ${branch} ${version} → ${download}`);
}

module.exports = {verifyDiscovery};
if (require.main === module) {
  try { main(); } catch (error) { console.error(error.message); process.exitCode = 1; }
}
