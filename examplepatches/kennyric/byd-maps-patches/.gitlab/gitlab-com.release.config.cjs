"use strict";
const fs = require("node:fs");
const path = require("node:path");
const config = JSON.parse(fs.readFileSync(path.join(__dirname, "../.releaserc"), "utf8"));
config.repositoryUrl = "https://gitlab.com/johninnld/nl-morphe-patches.git";
config.plugins = config.plugins.map(entry => {
  const [name] = Array.isArray(entry) ? entry : [entry];
  if (name === "./.github/scripts/verify_identity.cjs") return "./.gitlab/scripts/identity.cjs";
  if (name === "./.github/scripts/public_changelog.cjs") return "./.gitlab/scripts/changelog.cjs";
  if (name === "./.github/scripts/public_github.cjs") return "./.gitlab/scripts/publish.cjs";
  // Commit the regenerated metadata without pushing the branch; only the tag goes out first.
  if (name === "./.github/scripts/public_git.cjs") return ["./.gitlab/scripts/release_commit.cjs", entry[1]];
  return entry;
});
// Last: move main to the release commit once its bundle is downloadable.
config.plugins.push("./.gitlab/scripts/promote_main.cjs");
module.exports = config;
