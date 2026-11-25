"use strict";
const fs = require("node:fs");
const path = require("node:path");
const {BASE, REPOSITORY} = require("./api.cjs");
const {restorePublicLinks} = require("../../.github/scripts/branded_release_notes.cjs");
async function prepare(_config, context) {
  const {version, notes} = context.nextRelease;
  if (!notes?.trim()) throw new Error("Release notes must not be empty");
  const text = restorePublicLinks(notes).trim();
  const file = path.join(context.cwd, "CHANGELOG.md");
  const previous = fs.existsSync(file) ? fs.readFileSync(file, "utf8").trim() : "";
  fs.writeFileSync(file, text + "\n" + (previous ? "\n" + previous + "\n" : ""));
  const key = fs.readFileSync(path.join(context.cwd, "morphe-signing.pub"), "utf8").trim();
  if (Buffer.from(key, "base64").length !== 32) throw new Error("Invalid Morphe public signing key");
  fs.writeFileSync(path.join(context.cwd, "patches-bundle.json"), JSON.stringify({
    created_at: new Date().toISOString().replace(/\.\d{3}Z$/, ""), description: text,
    download_url: `${BASE}/${REPOSITORY}/releases/download/v${version}/patches-${version}.mpp`,
    signature_download_url: "", version, public_key: key,
  }, null, 2) + "\n");
}
module.exports = {prepare};
