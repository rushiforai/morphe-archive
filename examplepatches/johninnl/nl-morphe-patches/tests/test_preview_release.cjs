"use strict";
const assert = require("node:assert/strict");
const fs = require("node:fs");
const os = require("node:os");
const path = require("node:path");
const {execFileSync, spawnSync} = require("node:child_process");
const {test} = require("node:test");
const previewScript = path.resolve(__dirname, "../.github/scripts/preview_release_notes.cjs");

function repository(run) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "dap-first-release-"));
  const git = (...args) => execFileSync("git", args, {cwd: dir, encoding: "utf8"}).trim();
  git("init", "-b", "main");
  git("config", "user.email", "test@example.test");
  git("config", "user.name", "Test");
  fs.writeFileSync(path.join(dir, ".releaserc"), JSON.stringify({plugins: [["unused", {preset: "conventionalcommits"}]]}));
  const declarations = path.join(dir, "patches/src/main/kotlin/patches/fixture");
  fs.mkdirSync(declarations, {recursive: true});
  fs.writeFileSync(path.join(declarations, "Compatibility.kt"), 'val app = Compatibility(name = "Fixture")\n');
  git("add", ".");
  git("commit", "-m", "feat(Fixture): add initial controls");
  try { run({dir, git}); } finally { fs.rmSync(dir, {recursive: true, force: true}); }
}

test("preview first release without tags includes the initial commit", () => repository(({dir}) => {
  const result = spawnSync(process.execPath, ["-e", `require(${JSON.stringify(previewScript)}).preview().catch(e=>{console.error(e);process.exitCode=1})`], {cwd: dir, encoding: "utf8", timeout: 30000});
  assert.equal(result.status, 0, result.stderr);
  const notes = fs.readFileSync(path.join(dir, "build/release-safety/notes-preview.md"), "utf8");
  assert.ok(notes.includes("patch bundle v1.0.0"), notes);
  assert.match(notes, /\* \*\*Fixture:\*\* add initial controls/);
  assert.doesNotMatch(notes, /undefined|null/);
}));

for (const [stable, dev, message, expected, releaseType] of [
  ['v1.2.0', 'v1.2.1-dev.1', 'feat(Fixture): add another control', '1.3.0-dev.1'],
  ['v1.1.0', 'v1.2.0-dev.1', 'feat(Fixture): change interface', '2.0.0-dev.1', 'major'],
]) {
  test(`dev preview follows semantic-release release type after ${dev}`, () => repository(({dir, git}) => {
    git('tag', stable); git('tag', dev);
    if (releaseType) {
      const file = path.join(dir, '.releaserc'); const config = JSON.parse(fs.readFileSync(file, 'utf8'));
      config.plugins.unshift(['@semantic-release/commit-analyzer', {releaseRules:[{type:'feat',release:releaseType}]}]);
      fs.writeFileSync(file, JSON.stringify(config));
    }
    fs.appendFileSync(path.join(dir, 'patches/src/main/kotlin/patches/fixture/Compatibility.kt'), '// new change\n');
    git('add', '.'); git('commit', '-m', message);
    const result = spawnSync(process.execPath, [previewScript, '--branch', 'dev'], {cwd: dir, encoding: 'utf8', timeout: 30000});
    assert.equal(result.status, 0, result.stderr);
    const notes = fs.readFileSync(path.join(dir, 'build/release-safety/notes-preview.md'), 'utf8');
    assert.ok(notes.includes(`patch bundle v${expected}`), notes);
  }));
}
