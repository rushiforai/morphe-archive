"use strict";
const fs = require("node:fs");
const path = require("node:path");
const {api, BASE, REPOSITORY, OWNER} = require("./api.cjs");
const {verifyPublisher} = require("./identity.cjs");
const {verifyBundle, download} = require("./bundle.cjs");
const {restorePublicLinks} = require("../../.github/scripts/branded_release_notes.cjs");
async function publish(_config, context, request = api, readBundle = download) {
  if (BASE !== "https://gitlab.com") throw new Error("This publisher is exclusive to GitLab.com");
  await verifyPublisher({env: context.env, request});
  const {version, gitTag, gitHead, notes} = context.nextRelease;
  const branch = context.branch.name;
  const pattern = branch === "dev" ? /^\d+\.\d+\.\d+-dev\.\d+$/ : /^\d+\.\d+\.\d+$/;
  if (!["main", "dev"].includes(branch) || !pattern.test(version) || gitTag !== `v${version}`) throw new Error("Release channel/version mismatch");
  const filename = `patches-${version}.mpp`;
  const bytes = fs.readFileSync(path.join(context.cwd, "patches/build/libs", filename));
  const key = fs.readFileSync(path.join(context.cwd, "morphe-signing.pub"), "utf8").trim();
  const hash = verifyBundle(bytes, key);
  const project = `/projects/${encodeURIComponent(REPOSITORY)}`;
  const packagePath = `${project}/packages/generic/morphe-patches/${version}/${filename}`;
  const options = {token: context.env.GITLAB_TOKEN};
  // Bundle-sized transfers get a size-based timeout instead of the 60 s API default.
  const transfer = {...options, binary: true, expectedBytes: bytes.length};
  let stored = await request(packagePath, transfer);
  if (!stored) {
    await request(packagePath, {...options, method: "PUT", body: bytes});
    stored = await request(packagePath, transfer);
  }
  if (!stored || verifyBundle(stored, key) !== hash) throw new Error("Published GitLab package differs from the signed build");
  const packageUrl = `${BASE}/api/v4${packagePath}`;
  if (verifyBundle(await readBundle(packageUrl, bytes.length), key) !== hash) throw new Error("Public package bytes differ from the signed build");
  const endpoint = `${project}/releases`;
  const link = {name: filename, url: packageUrl, direct_asset_path: `/${filename}`, link_type: "package"};
  let release = await request(`${endpoint}/${gitTag}`, options);
  if (!release) {
    release = await request(endpoint, {...options, method: "POST", body: {
      tag_name: gitTag, ref: gitHead, name: `Dutch App Patches ${version}`,
      description: restorePublicLinks(notes), assets: {links: [link]},
    }});
  }
  if (release.author?.username !== OWNER || release.tag_name !== gitTag || release.commit?.id !== gitHead) throw new Error("Unexpected GitLab release owner or source commit");
  const existing = release.assets?.links?.find(item => item.name === filename);
  if (existing && existing.url !== packageUrl) throw new Error("Existing release asset points to a different package");
  if (!existing) await request(`${endpoint}/${gitTag}/assets/links`, {...options, method: "POST", body: link});
  const permalink = `${BASE}/${REPOSITORY}/-/releases/${gitTag}/downloads/${filename}`;
  if (verifyBundle(await readBundle(permalink, bytes.length), key) !== hash) throw new Error("Release download differs from the signed build");
  return {name: "GitLab release", url: `${BASE}/${REPOSITORY}/-/releases/${gitTag}`};
}
module.exports = {publish};
