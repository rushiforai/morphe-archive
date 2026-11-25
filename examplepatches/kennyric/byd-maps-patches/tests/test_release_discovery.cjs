"use strict";
const {test} = require("node:test");
const assert = require("node:assert/strict");
const {verifyDiscovery} = require("../.github/scripts/verify_release_discovery.cjs");

function fixture() {
  const branch = "main";
  const version = "1.1.0";
  const repository = "johninnl/nl-morphe-patches";
  const download = `https://github.com/${repository}/releases/download/v${version}/patches-${version}.mpp`;
  return {
    options: {repository, branch, version, publicKey: "fixture-public-key"},
    manifest: {version, download_url: download, public_key: "fixture-public-key"},
    release: {tag_name: `v${version}`, prerelease: false, draft: false,
      author: {login: "johninnl"}, assets: [{name: `patches-${version}.mpp`, browser_download_url: download, state: "uploaded", size: 123}]}
  };
}

test("the main channel resolves its own signed-bundle metadata", () => {
  const f = fixture("main");
  assert.equal(verifyDiscovery(f.manifest, f.release, f.options), f.manifest.download_url);
});
test("a manifest version that differs from the release is rejected", () => {
  const f = fixture(); f.manifest.version = "1.2.0";
  assert.throws(() => verifyDiscovery(f.manifest, f.release, f.options), /different version/);
});
test("a manifest cannot silently download another bundle", () => {
  const f = fixture(); f.manifest.download_url = f.manifest.download_url.replace("1.1.0", "1.1.1");
  assert.throws(() => verifyDiscovery(f.manifest, f.release, f.options), /wrong bundle|does not point/);
});
test("wrong publisher, channel, key, draft and incomplete upload are rejected", () => {
  for (const mutate of [f => f.release.author.login = "someone-else", f => f.release.prerelease = true,
    f => f.release.draft = true, f => f.manifest.public_key = "changed", f => f.release.assets[0].state = "new",
    f => f.release.assets[0].size = 0]) {
    const f = fixture(); mutate(f);
    assert.throws(() => verifyDiscovery(f.manifest, f.release, f.options));
  }
});
