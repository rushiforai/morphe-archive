"use strict";
const fs = require("node:fs");
const path = require("node:path");
const config = JSON.parse(fs.readFileSync(path.join(__dirname, "../.releaserc"), "utf8"));
config.repositoryUrl = "https://codeberg.org/JohninNL/nl-morphe-patches.git";
config.plugins = config.plugins.map(entry => {
  const [name, options] = Array.isArray(entry) ? entry : [entry];
  if (name === "./.github/scripts/verify_identity.cjs") return "./.forgejo/scripts/identity.cjs";
  if (name === "./.github/scripts/public_github.cjs") return "./.forgejo/scripts/publish.cjs";
  if (name === "./.github/scripts/public_changelog.cjs") return "./.forgejo/scripts/changelog.cjs";
  return entry;
});
module.exports = config;
