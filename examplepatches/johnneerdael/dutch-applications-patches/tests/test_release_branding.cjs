const assert = require("node:assert/strict");
const fs = require("node:fs");
const path = require("node:path");
const { test } = require("node:test");
const { cosmiconfigSync } = require("cosmiconfig");

const root = path.resolve(__dirname, "..");
const pluginPath = path.join(root, ".github/scripts/branded_release_notes.cjs");
const source = "0123456789abcdef0123456789abcdef01234567";
const existing = "## 1.9.0\n\n### 🐛 Bug Fixes\n\n* Retain the exact compatibility check ([abc1234](https://example.test/commit/abc1234))\n";
const releaseConfig = cosmiconfigSync("release").search(root).config;
const noteConfig = releaseConfig.plugins.find((plugin) => Array.isArray(plugin) && plugin[1].preset === "conventionalcommits");

function plugin() {
  assert.ok(fs.existsSync(pluginPath), "the local release-notes wrapper must exist");
  return require(pluginPath);
}

function context(version = "1.9.0") {
  return {
    cwd: root,
    env: { GITHUB_REPOSITORY: "johnneerdael/dutch-applications-patches" },
    options: { repositoryUrl: "https://github.com/johnneerdael/dutch-applications-patches.git" },
    branch: { name: "main", type: "release" },
    commits: [{ hash: "abc1234abc1234abc1234abc1234abc1234abc1234a", message: "fix: retain exact compatibility check" }],
    lastRelease: { version: "1.8.0", gitTag: "v1.8.0", gitHead: "1111111111111111111111111111111111111111" },
    nextRelease: { version, gitTag: `v${version}`, gitHead: source },
    logger: { log() {} },
  };
}

test("release banner is pinned to the full source commit and generated notes remain intact", () => {
  const result = plugin().renderNotes(existing, context());
  assert.match(result, new RegExp(`https://raw\\.githubusercontent\\.com/johnneerdael/dutch-applications-patches/${source}/docs/site/assets/brand/release-banner\\.png`));
  assert.ok(result.endsWith(existing), "generated Markdown must be retained byte for byte");
  assert.match(result, /Stable release · patch bundle v1\.9\.0/);
  assert.match(result, /https:\/\/morphe\.software\/add-source\?github=johnneerdael\/dutch-applications-patches/);
  assert.match(result, /https:\/\/morphe-patches\.neerdael\.nl\/en\//);
});

test("development versions have an explicit prerelease label", () => {
  const ctx = context("1.9.0-dev.1");
  ctx.branch = { name: "dev", type: "prerelease", prerelease: "dev" };
  const result = plugin().renderNotes(existing, ctx);
  assert.match(result, /Development prerelease · patch bundle v1\.9\.0-dev\.1/);
  assert.doesNotMatch(result, /Stable release/);
});

test("reapplying branding does not duplicate the banner or changelog", () => {
  const first = plugin().renderNotes(existing, context());
  assert.equal(plugin().renderNotes(first, context()), first);
  assert.equal(first.match(/release-banner\.png/g).length, 1);
  assert.equal(first.match(/Retain the exact compatibility check/g).length, 1);
});

test("mutable refs and unsafe repository names cannot enter the source banner URL", () => {
  const ctx = context();
  ctx.nextRelease.gitHead = "main";
  assert.throws(() => plugin().renderNotes(existing, ctx), /source commit/);
  ctx.nextRelease.gitHead = source;
  ctx.env.GITHUB_REPOSITORY = "owner/repo/../../main";
  assert.throws(() => plugin().renderNotes(existing, ctx), /repository/);
});

test("wrapper delegates to the existing conventional generator and ignores accumulated notes on regeneration", async () => {
  const wrapper = plugin();
  const { generateNotes } = await import("@semantic-release/release-notes-generator");
  const ctx = context();
  const generated = await generateNotes(noteConfig[1], ctx);
  assert.match(generated, /🐛 Bug Fixes/);
  const decorated = await wrapper.generateNotes(noteConfig[1], ctx);
  assert.ok(decorated.endsWith(generated));
  ctx.nextRelease.notes = decorated;
  assert.equal(await wrapper.generateNotes(noteConfig[1], ctx), decorated);
  assert.equal(decorated.match(/retain exact compatibility check/g).length, 1);
});

test("configured semantic-release generateNotes pipeline emits one complete branded changelog", async () => {
  plugin();
  const { default: buildPlugins } = await import("semantic-release/lib/plugins/index.js");
  const logger = { log() {}, success() {}, warn() {}, error() {}, scope() { return this; } };
  const ctx = context();
  ctx.options.plugins = [releaseConfig.plugins[0], noteConfig];
  ctx.logger = logger;
  const pipeline = await buildPlugins(ctx, {});
  const notes = await pipeline.generateNotes(ctx);
  assert.equal(notes.match(/release-banner\.png/g).length, 1);
  assert.equal(notes.match(/retain exact compatibility check/g).length, 1);
  assert.match(notes, /🐛 Bug Fixes/);
});
