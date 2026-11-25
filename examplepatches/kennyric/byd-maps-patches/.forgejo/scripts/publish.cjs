"use strict";
const fs = require("node:fs");
const path = require("node:path");
const {api, BASE, REPOSITORY} = require("./api.cjs");
const {verifyBundle, download} = require("./bundle.cjs");
const {verifyPublisher} = require("./identity.cjs");
const {restorePublicLinks} = require("../../.github/scripts/branded_release_notes.cjs");
async function publish(_config, context, request = api, getBundle = download) {
  await verifyPublisher({env: context.env, request});
  const {version, gitTag, gitHead, notes} = context.nextRelease;
  const prerelease = context.branch.name === "dev";
  if (context.branch.name !== "main" && !prerelease) throw new Error("Only main/dev can publish");
  if (!(prerelease ? /^\d+\.\d+\.\d+-dev\.\d+$/ : /^\d+\.\d+\.\d+$/).test(version) || gitTag !== `v${version}`) throw new Error("Release channel/version mismatch");
  const filename = `patches-${version}.mpp`;
  const file = path.join(context.cwd, "patches/build/libs", filename);
  if (!fs.existsSync(file) || fs.statSync(file).size === 0) throw new Error("Release bundle is missing or empty");
  const publicKey = fs.readFileSync(path.join(context.cwd, "morphe-signing.pub"), "utf8").trim();
  verifyBundle(fs.readFileSync(file), publicKey);
  const options = {token: context.env.CODEBERG_TOKEN};
  const endpoint = `/repos/${REPOSITORY}/releases`;
  let release = await request(`${endpoint}/tags/${encodeURIComponent(gitTag)}`, options);
  if (!release) release = await request(endpoint, {...options, method: "POST", body: {
    tag_name: gitTag, target_commitish: gitHead, name: `Dutch App Patches ${version}`,
    body: restorePublicLinks(notes), draft: true, prerelease,
  }});
  if (release.author?.login !== "JohninNL" || release.prerelease !== prerelease) throw new Error("Existing release has an unexpected owner or channel");
  const assets = await request(`${endpoint}/${release.id}/assets`, options);
  let asset = assets.find(asset => asset.name === filename);
  if (!asset) {
    const form = new FormData(); form.set("attachment", new Blob([fs.readFileSync(file)], {type: "application/octet-stream"}), filename);
    asset = await request(`${endpoint}/${release.id}/assets?name=${encodeURIComponent(filename)}`, {...options, method: "POST", body: form});
    if (asset.name !== filename || asset.size !== fs.statSync(file).size) throw new Error("Uploaded bundle metadata does not match");
  }
  // Recovery adopts only a correctly signed existing attachment. Never delete or overwrite it.
  const wasDraft = release.draft;
  if (wasDraft) {
    // Draft attachments need the authenticated API to be visible; publication is finalized
    // only after the upload endpoint acknowledged the complete, locally verified bundle.
    release = await request(`${endpoint}/${release.id}`, {...options, method: "PATCH", body: {draft: false}});
  }
  try {
    const bytes = await getBundle(asset.browser_download_url, asset.size);
    verifyBundle(bytes, publicKey);
  } catch (error) {
    if (wasDraft) await request(`${endpoint}/${release.id}`, {...options, method: "PATCH", body: {draft: true}});
    throw error;
  }
  return {name: "Codeberg release", url: release.html_url || `${BASE}/${REPOSITORY}/releases/tag/${gitTag}`};
}
module.exports = {publish};
