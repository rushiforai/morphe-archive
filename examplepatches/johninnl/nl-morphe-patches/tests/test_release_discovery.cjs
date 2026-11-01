"use strict";
const {test} = require("node:test");
const assert = require("node:assert/strict");
const {verifyDiscovery} = require("../.github/scripts/verify_release_discovery.cjs");

function fixture(branch = "dev") {
  const version = branch === "dev" ? "1.2.0-dev.1" : "1.1.0";
  const repository = "johninnl/nl-morphe-patches";
  const download = `https://github.com/${repository}/releases/download/v${version}/patches-${version}.mpp`;
  return {
    options: {repository, branch, version, publicKey: "fixture-public-key"},
    manifest: {version, download_url: download, public_key: "fixture-public-key"},
    release: {tag_name: `v${version}`, prerelease: branch === "dev", draft: false,
      author: {login: "johninnl"}, assets: [{name: `patches-${version}.mpp`, browser_download_url: download, state: "uploaded", size: 123}]}
  };
}

test("both source channels resolve their own signed-bundle metadata", () => {
  for (const branch of ["main", "dev"]) {
    const f = fixture(branch);
    assert.equal(verifyDiscovery(f.manifest, f.release, f.options), f.manifest.download_url);
  }
});
test("publishing a prerelease without advancing its dev manifest is rejected", () => {
  const f = fixture(); f.manifest.version = "1.1.0";
  assert.throws(() => verifyDiscovery(f.manifest, f.release, f.options), /different version/);
});
test("a dev manifest cannot silently download the stable bundle", () => {
  const f = fixture(); f.manifest.download_url = fixture("main").manifest.download_url;
  assert.throws(() => verifyDiscovery(f.manifest, f.release, f.options), /wrong bundle/);
});
test("wrong publisher, channel, key, draft and incomplete upload are rejected", () => {
  for (const mutate of [f => f.release.author.login = "someone-else", f => f.release.prerelease = false,
    f => f.release.draft = true, f => f.manifest.public_key = "changed", f => f.release.assets[0].state = "new",
    f => f.release.assets[0].size = 0]) {
    const f = fixture(); mutate(f);
    assert.throws(() => verifyDiscovery(f.manifest, f.release, f.options));
  }
});
