"use strict";
const fs = require("node:fs");
const {execFileSync} = require("node:child_process");
const {api, REPOSITORY} = require("./api.cjs");
async function recoverTaggedRelease() {
  const manifest = JSON.parse(fs.readFileSync("patches-bundle.json", "utf8"));
  const branch = execFileSync("git", ["branch", "--show-current"], {encoding: "utf8"}).trim();
  if (!["main", "dev"].includes(branch) || !/^\d+\.\d+\.\d+(?:-dev\.\d+)?$/.test(manifest.version)) return null;
  const tag = `v${manifest.version}`;
  const tags = execFileSync("git", ["tag", "--points-at", "HEAD"], {encoding: "utf8"}).trim().split("\n");
  if (!tags.includes(tag)) return null;
  const release = await api(`/repos/${REPOSITORY}/releases/tags/${tag}`);
  if (release && !release.draft && release.assets?.some(asset => asset.name === `patches-${manifest.version}.mpp` && asset.size > 0)) return {version: manifest.version, branch};
  // A prior run may have pushed its release tag before upload completed. The tag must
  // identify this exact checkout and its manifest before rebuilding or resuming it.
  execFileSync("./gradlew", [":patches:buildAndroid", "--no-daemon", "-Dorg.gradle.jvmargs=-Xmx2g"], {stdio: "inherit"});
  const context = {cwd: process.cwd(), env: process.env, branch: {name: branch}, nextRelease: {
    version: manifest.version, gitTag: tag, gitHead: execFileSync("git", ["rev-parse", "HEAD"], {encoding: "utf8"}).trim(), notes: manifest.description,
  }};
  await require("./publish.cjs").publish({}, context);
  return {version: manifest.version, branch};
}
(async () => {
  process.env.CODEBERG_REPOSITORY = REPOSITORY;
  process.env.GITHUB_REPOSITORY = REPOSITORY; // shared catalogue generator compatibility
  const {default: release} = await import("semantic-release");
  const result = await release(require("../release.config.cjs"));
  const outcome = result ? {version: result.nextRelease.version, branch: execFileSync("git", ["branch", "--show-current"], {encoding: "utf8"}).trim()} : await recoverTaggedRelease() || {published: false};
  fs.mkdirSync("build/release-safety", {recursive: true});
  fs.writeFileSync("build/release-safety/codeberg-result.json", JSON.stringify(outcome));
})().catch(error => {console.error(error.message);process.exitCode = 1;});
