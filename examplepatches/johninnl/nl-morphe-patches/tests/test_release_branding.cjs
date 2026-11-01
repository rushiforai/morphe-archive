const assert = require("node:assert/strict");
const fs = require("node:fs");
const path = require("node:path");
const { test, after } = require("node:test");
const { cosmiconfigSync } = require("cosmiconfig");

const root = path.resolve(__dirname, "..");
const pluginPath = path.join(root, ".github/scripts/branded_release_notes.cjs");
const source = "0123456789abcdef0123456789abcdef01234567";
const existing = "## 1.9.0\n\n### 🐛 Bug Fixes\n\n* Retain the exact compatibility check ([abc1234](https://example.test/commit/abc1234))\n";
const releaseConfig = cosmiconfigSync("release").search(root).config;
const noteConfig = [...releaseConfig.plugins.find((plugin) => Array.isArray(plugin) && plugin[1].preset === "conventionalcommits")];
noteConfig[0] = pluginPath;

function plugin() {
  assert.ok(fs.existsSync(pluginPath), "the local release-notes wrapper must exist");
  return require(pluginPath);
}

let brandingRepository;
function brandingFixture() {
  if (brandingRepository) return brandingRepository;
  const dir = fs.mkdtempSync(path.join(require("node:os").tmpdir(), "dap-branding-fixture-"));
  const git = (...args) => require("node:child_process").execFileSync("git", args, {cwd: dir, encoding: "utf8"}).trim();
  git("init", "-b", "main");
  git("config", "user.email", "test@example.test");
  git("config", "user.name", "Test");
  const declarations = path.join(dir, "patches/src/main/kotlin/patches/fixture");
  fs.mkdirSync(declarations, {recursive: true});
  fs.writeFileSync(path.join(declarations, "Compatibility.kt"), 'val fixture = Compatibility(name = "Fixture")\n');
  git("add", ".");
  git("commit", "-m", "feat: fixture baseline");
  git("tag", "v1.8.0");
  const base = git("rev-parse", "HEAD");
  git("commit", "--allow-empty", "-m", "fix(release): retain exact compatibility check");
  fs.copyFileSync(path.join(root, ".releaserc"), path.join(dir, ".releaserc"));
  fs.symlinkSync(path.join(root, "node_modules"), path.join(dir, "node_modules"), "dir");
  brandingRepository = {dir, base, head: git("rev-parse", "HEAD")};
  return brandingRepository;
}
after(() => { if (brandingRepository) fs.rmSync(brandingRepository.dir, {recursive: true, force: true}); });

function context(version = "1.9.0") {
  const fixture = brandingFixture();
  return {
    cwd: fixture.dir,
    env: { GITHUB_REPOSITORY: "johninnl/nl-morphe-patches" },
    options: { repositoryUrl: "https://github.com/johninnl/nl-morphe-patches.git" },
    branch: { name: "main", type: "release" },
    commits: [{ hash: fixture.head, message: "fix(release): retain exact compatibility check" }],
    lastRelease: { version: "1.8.0", gitTag: "v1.8.0", gitHead: fixture.base },
    nextRelease: { version, gitTag: `v${version}`, gitHead: fixture.head },
    logger: { log() {} },
  };
}

test("release banner is pinned to the full source commit and generated notes remain intact", () => {
  const ctx = context(); ctx.nextRelease.gitHead = source;
  const result = plugin().renderNotes(existing, ctx);
  assert.match(result, new RegExp(`https://raw\\.githubusercontent\\.com/johninnl/nl-morphe-patches/${source}/docs/site/assets/brand/release-banner\\.png`));
  assert.ok(result.endsWith(existing), "generated Markdown must be retained byte for byte");
  assert.match(result, /Release · patch bundle v1\.9\.0/);
  assert.match(result, /https:\/\/morphe\.software\/add-source\?github=johninnl\/nl-morphe-patches/);
  assert.match(result, /https:\/\/johninnl\.github\.io\/nl-morphe-patches\/en\//);
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
  const generated = await generateNotes(noteConfig[1], {...ctx, commits: wrapper.scopeCommits(ctx.commits,ctx)});
  assert.match(generated, /🐛 Bug Fixes/);
  const decorated = await wrapper.generateNotes(noteConfig[1], ctx);
  assert.ok(decorated.endsWith(generated));
  ctx.nextRelease.notes = decorated;
  assert.equal(await wrapper.generateNotes(noteConfig[1], ctx), decorated);
  assert.equal(decorated.match(/retain exact compatibility check/g).length, wrapper.scopeCommits(ctx.commits,ctx).length);
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
  assert.equal(notes.match(/retain exact compatibility check/g).length, plugin().scopeCommits(ctx.commits,ctx).length);
  assert.match(notes, /🐛 Bug Fixes/);
});

test("public-link restoration is confined to this repository and preserves other masked values", () => {
  const urls = [
    "https://github.com/johninnl/nl-morphe-patches/compare/v1.0.0...v1.0.1",
    "https://raw.githubusercontent.com/johninnl/nl-morphe-patches/abc/banner.png",
    "https://johninnl.github.io/nl-morphe-patches/en/",
    "https://morphe.software/add-source?github=johninnl/nl-morphe-patches",
  ];
  const protectedText = [
    "secret: [secure]", "author: [secure]", "https://example.test/[secure]/",
    "https://github.com/[secure]/another-repo/",
    "https://github.com/[secure]/nl-morphe-patches-private/",
    "https://raw.githubusercontent.com/[secure]/another-repo/main/file",
    "https://[secure].github.io/another-repo/",
    "https://morphe.software/add-source?github=[secure]/nl-morphe-patches-private",
  ].join("\n");
  const original = urls.join("\n") + "\n" + protectedText;
  const masked = urls.join("\n").replaceAll("johninnl", "[secure]") + "\n" + protectedText;
  assert.equal(plugin().restorePublicLinks(masked), original);
  assert.equal(plugin().restorePublicLinks(original), original);
  assert.equal(plugin().restorePublicLinks(undefined), undefined);
});

test("real semantic-release pipeline restores public links for writers and post-commit publishing without revealing secrets", async () => {
  const {default: buildPlugins} = await import("semantic-release/lib/plugins/index.js");
  const cwd = fs.mkdtempSync(path.join(require("node:os").tmpdir(), "morphe-masked-notes-"));
  const secret = "fixture-authorization-secret-7823";
  const env = {...process.env, GITHUB_REPOSITORY: "johninnl/nl-morphe-patches",
    GIT_AUTHOR_NAME: "johninnl", GIT_COMMITTER_NAME: "johninnl",
    GIT_AUTHOR_EMAIL: "349981574+johninnl@users.noreply.github.com",
    GIT_COMMITTER_EMAIL: "349981574+johninnl@users.noreply.github.com",
    GH_TOKEN: secret, GITHUB_TOKEN: secret};
  const git = (...args) => require("node:child_process").execFileSync("git", args, {cwd, env, encoding: "utf8"}).trim();
  try {
    git("init", "-b", "main");
    const declarations = path.join(cwd, "patches/src/main/kotlin/patches/fixture");
    fs.mkdirSync(declarations, {recursive: true});
    fs.writeFileSync(path.join(declarations, "Compatibility.kt"), 'val app = Compatibility(name = "Fixture")\n');
    git("add", "."); git("-c", "commit.gpgsign=false", "commit", "-m", "feat(Fixture): initial support");
    const base = git("rev-parse", "HEAD"); git("tag", "v1.0.0");
    const message = `fix(release): keep ${secret} masked`;
    git("-c", "commit.gpgsign=false", "commit", "--allow-empty", "-m", message);
    const head = git("rev-parse", "HEAD");
    const ctx = {...context("1.0.1"), cwd, env,
      lastRelease: {version: "1.0.0", gitTag: "v1.0.0", gitHead: base},
      nextRelease: {version: "1.0.1", gitTag: "v1.0.1", gitHead: head},
      commits: [{hash: head, message}],
      logger: {log(){}, success(){}, warn(){}, error(){}, scope(){return this;}}};
    const assertRestored = notes => {
      assert.match(notes, /https:\/\/github\.com\/johninnl\/nl-morphe-patches\//);
      assert.match(notes, /https:\/\/raw\.githubusercontent\.com\/johninnl\/nl-morphe-patches\//);
      assert.match(notes, /https:\/\/johninnl\.github\.io\/nl-morphe-patches\/en\//);
      assert.match(notes, /https:\/\/morphe\.software\/add-source\?github=johninnl\/nl-morphe-patches/);
      assert.match(notes, /keep \[secure\] masked/);
      assert.ok(!notes.includes(secret), "real secrets must remain masked");
    };
    let published;
    const writerConfig = releaseConfig.plugins.find(value => Array.isArray(value) && value[0] === "./.github/scripts/public_changelog.cjs");
    const writer = [path.join(root, writerConfig[0]), writerConfig[1]];
    const gitConfig = releaseConfig.plugins.find(value => Array.isArray(value) && value[0] === "./.github/scripts/public_git.cjs")[1];
    const releaseCommit = {prepare(config, input) {
      return require("../.github/scripts/public_git.cjs").prepare(config, input, async name => {
        assert.equal(name, "@semantic-release/git", "delegate to the original Git plugin");
        return {prepare(actualConfig, actualContext) {
          assert.equal(actualConfig.message, gitConfig.message);
          assert.deepEqual(actualConfig.assets, gitConfig.assets);
          assert.equal(actualContext.env.GIT_AUTHOR_NAME, "johninnl");
          assert.equal(actualContext.env.GH_TOKEN, secret);
          assertRestored(actualContext.nextRelease.notes);
          git("add", "CHANGELOG.md", "patches-bundle.json");
          git("-c", "commit.gpgsign=false", "commit", "-m", `chore: generated release fixture\n\n${actualContext.nextRelease.notes}`);
          assertRestored(git("log", "-1", "--format=%B"));
        }};
      });
    }};
    const githubConfig = releaseConfig.plugins.find(value => Array.isArray(value) && value[0] === "./.github/scripts/public_github.cjs")[1];
    const publisher = require("../.github/scripts/public_github.cjs").createHooks(async name => {
      assert.equal(name, "@semantic-release/github", "delegate to the original GitHub plugin");
      return {publish(actualConfig, input) {
        assert.deepEqual(actualConfig.assets, githubConfig.assets);
        assert.equal(actualConfig.successComment, false);
        assert.equal(input.env.GH_TOKEN, secret);
        assert.equal(input.env.GIT_AUTHOR_NAME, "johninnl");
        published = input.nextRelease.notes;
        assertRestored(published);
        return {name: "offline fixture publisher"};
      }};
    });
    ctx.options = {...ctx.options, plugins: [noteConfig, writer, [releaseCommit, gitConfig], [publisher, githubConfig]]};
    const pipeline = await buildPlugins(ctx, {});
    ctx.nextRelease.notes = await pipeline.generateNotes(ctx);
    assert.match(ctx.nextRelease.notes, /https:\/\/\[secure\]\.github\.io/);
    assert.match(ctx.nextRelease.notes, /keep \[secure\] masked/);
    await pipeline.prepare(ctx);
    assert.notEqual(ctx.nextRelease.gitHead, head, "the real prepare pipeline must detect the fixture commit");
    assert.match(ctx.nextRelease.notes, /https:\/\/\[secure\]\.github\.io/,
      "core must regenerate and mask notes again after the prepare commit");
    assertRestored(fs.readFileSync(path.join(cwd, "CHANGELOG.md"), "utf8"));
    assertRestored(JSON.parse(fs.readFileSync(path.join(cwd, "patches-bundle.json"), "utf8")).description);
    await pipeline.publish(ctx);
    assertRestored(published);
  } finally { fs.rmSync(cwd, {recursive: true, force: true}); }
});

const os = require("node:os");
const { execFileSync } = require("node:child_process");

function releaseRepository(run) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "dap-release-notes-"));
  const git = (...args) => execFileSync("git", args, {cwd: dir, encoding: "utf8"}).trim();
  git("init", "-b", "main");
  git("config", "user.email", "test@example.test");
  git("config", "user.name", "Test");
  const commit = message => { git("commit", "--allow-empty", "-m", message); return git("rev-parse", "HEAD"); };
  try { return run({dir, git, commit}); } finally { fs.rmSync(dir, {recursive: true, force: true}); }
}

test("multi-app notes use one explicit Morphe scope per app", () => {
  const commits = plugin().scopeCommits([{hash: source,
    message: "feat(news): promote newspaper controls\n\nRelease-Apps: Tubantia, HBVL"}]);
  assert.deepEqual(commits.map(c => c.message.split("\n")[0]), [
    "feat(Tubantia): promote newspaper controls", "feat(HBVL): promote newspaper controls"
  ]);
});

function partialPromotion(run) {
  return releaseRepository(({dir, git, commit}) => {
    const files = Object.fromEntries(['A', 'B'].map(name => [name, `patches/src/main/kotlin/patches/${name.toLowerCase()}/Compatibility.kt`]));
    const write = (name, revision) => {
      const file = path.join(dir, files[name]); fs.mkdirSync(path.dirname(file), {recursive: true});
      fs.writeFileSync(file, `val app = Compatibility(name = "${name}", packageName = "example.${name}")\n// ${revision}\n`);
    };
    write('A', 'old'); write('B', 'old'); git('add', '.'); commit('feat: baseline'); git('tag', 'v1.0.0');
    git('switch', '-c', 'dev'); write('A', 'new'); write('B', 'new'); git('add', '.');
    const message = 'feat: add both controls\n\nRelease-Apps: A, B'; const combined = commit(message); git('tag', 'v1.1.0-dev.1');
    write('B', 'fixed'); git('add', '.'); const fixMessage = 'fix(B): repair the remaining control'; const fix = commit(fixMessage);
    git('switch', 'main'); write('A', 'new'); git('add', '.'); const stable = commit('feat(A): approved control'); git('tag', 'v1.1.0');
    git('switch', 'dev'); git('merge', '--no-edit', 'main');
    const ctx = context('1.2.0-dev.1'); ctx.cwd = dir; ctx.branch = {name: 'dev', type: 'prerelease'};
    ctx.lastRelease = {version: '1.1.0', gitTag: 'v1.1.0', gitHead: stable};
    ctx.nextRelease.gitHead = git('rev-parse', 'HEAD');
    ctx.commits = [{hash: combined, message}, {hash: fix, message: fixMessage}];
    return run({ctx, combined, fix, git, write, commit});
  });
}

test('partial promotion announces only the app still changed for stable', () => partialPromotion(({ctx, combined}) => {
  ctx.branch = {name: 'main', type: 'release'};
  const notes = plugin().scopeCommits(ctx.commits.filter(c => c.hash === combined), ctx);
  assert.deepEqual(notes.map(c => c.message.split('\n')[0]), ['feat(B): add both controls']);
}));

test('dev notes exclude commits already in any published ancestor release', () => partialPromotion(({ctx, combined, fix, git, write, commit}) => {
  const notes = plugin().scopeCommits(ctx.commits, ctx);
  assert.deepEqual(notes.map(c => c.hash), [fix]);
  const guard = require('../.github/scripts/verify_release_notes.cjs');
  const header = '## [1.2.0-dev.1](https://github.com/test/repo/compare/v1.1.0...v1.2.0-dev.1)\n\n';
  const bullet = hash => `* **B:** repair ([${hash.slice(0, 7)}](https://github.com/test/repo/commit/${hash}))\n`;
  ctx.nextRelease.notes = header + bullet(fix);
  assert.doesNotThrow(() => guard.verifyNotes(ctx));
  ctx.nextRelease.notes += bullet(combined);
  assert.throws(() => guard.verifyNotes(ctx), /replayed|previously released|outside/);
  const publishedHead = ctx.nextRelease.gitHead;
  git('tag', 'v1.2.0-dev.1');
  assert.deepEqual(plugin().scopeCommits(ctx.commits, ctx), [], 'An existing release tag cannot be announced again');
  write('B', 'next fix'); git('add', '.'); const next = commit('fix(B): next dev correction');
  ctx.lastRelease = {version: '1.2.0-dev.1', gitTag: 'v1.2.0-dev.1', gitHead: publishedHead};
  ctx.nextRelease = {version: '1.2.0-dev.2', gitTag: 'v1.2.0-dev.2', gitHead: next};
  ctx.commits.push({hash: next, message: 'fix(B): next dev correction'});
  assert.deepEqual(plugin().scopeCommits(ctx.commits, ctx).map(c => c.hash), [next]);
  ctx.nextRelease.notes = '## [1.2.0-dev.2](https://github.com/test/repo/compare/v1.2.0-dev.1...v1.2.0-dev.2)\n\n' + bullet(next);
  assert.doesNotThrow(() => guard.verifyNotes(ctx));
  ctx.nextRelease.notes += bullet(fix);
  assert.throws(() => guard.verifyNotes(ctx), /replayed|previously released|outside/);
}));

test('new source changes made during a merge still require an app scope', () => partialPromotion(({ctx, git, write}) => {
  const published = ctx.nextRelease.gitHead; git('tag', 'v1.2.0-dev.1');
  ctx.lastRelease = {version:'1.2.0-dev.1', gitTag:'v1.2.0-dev.1', gitHead:published};
  write('A', 'new merge resolution'); git('add', '.');
  const tree = git('write-tree');
  const merged = git('commit-tree', tree, '-p', published, '-p', git('rev-parse', 'v1.1.0'), '-m', 'Merge with a new source resolution');
  git('update-ref', 'HEAD', merged);
  ctx.nextRelease = {version:'1.2.0-dev.2',gitTag:'v1.2.0-dev.2',gitHead:merged};
  ctx.commits = [];
  ctx.nextRelease.notes = '## [1.2.0-dev.2](https://github.com/test/repo/compare/v1.2.0-dev.1...v1.2.0-dev.2)\n\n';
  assert.throws(() => require('../.github/scripts/verify_release_notes.cjs').verifyNotes(ctx), /Missing release notes scope.*A/);
}));

test("unscoped general notes cannot match common quoted patch names in Morphe", () => {
  const [commit] = plugin().scopeCommits([{hash: source, message: "fix: correct `Hide ads` reporting"}]);
  assert.equal(commit.message, "fix(General): correct `Hide ads` reporting");
});

test("release guard rejects replayed bullets and missing app scopes before publication", () => releaseRepository(({dir, git, commit}) => {
  const write = (file, content) => { fs.mkdirSync(path.dirname(path.join(dir, file)), {recursive:true}); fs.writeFileSync(path.join(dir,file),content); };
  write("patches/src/main/kotlin/patches/old/Compatibility.kt", 'val app = Compatibility( name = "Old App", packageName = "example.old")');
  git("add", "."); const old = commit("feat(Old App): original support"); git("tag", "v1.27.0");
  write("patches/src/main/kotlin/patches/tubantia/Compatibility.kt", 'val app = Compatibility( name = "Tubantia", packageName = "example.tubantia")');
  git("add", "."); const head = commit("feat(Tubantia): add controls");
  const ctx = context("1.28.0"); ctx.cwd=dir; ctx.lastRelease={version:"1.27.0",gitTag:"v1.27.0",gitHead:old}; ctx.nextRelease.gitHead=head;
  ctx.commits=[{hash:head,message:"feat(Tubantia): add controls"}];
  const header="## [1.28.0](https://github.com/test/repo/compare/v1.27.0...v1.28.0) (2026-10-30)\n\n";
  const bullet=(scope,hash)=>`* **${scope}:** controls ([${hash.slice(0,7)}](https://github.com/test/repo/commit/${hash}))`;
  const guard=require("../.github/scripts/verify_release_notes.cjs");
  ctx.nextRelease.notes=header+bullet("Tubantia",head);
  assert.doesNotThrow(()=>guard.verifyNotes(ctx));
  ctx.nextRelease.notes=header+bullet("Old App",old);
  assert.throws(()=>guard.verifyNotes(ctx),/replayed|outside/i);
  ctx.nextRelease.notes=header+bullet("news",head);
  assert.throws(()=>guard.verifyNotes(ctx),/scope|Tubantia/i);
  ctx.nextRelease.notes=header+bullet("Old App",head);
  assert.throws(()=>guard.verifyNotes(ctx),/unchanged|scope/i);
}));

test("stable publication stays on main and dev publishes prereleases", () => {
  const {load} = require("js-yaml");
  assert.deepEqual(releaseConfig.branches, ["main", {name: "dev", prerelease: "dev", channel: "dev"}]);
  const release = load(fs.readFileSync(path.join(root, ".github/workflows/release.yml"), "utf8"));
  assert.deepEqual(release.on.push.branches, ["main", "dev"]);
  assert.equal(release.jobs.release.if, "github.ref == 'refs/heads/main' || github.ref == 'refs/heads/dev'");
  const safety = load(fs.readFileSync(path.join(root, ".github/workflows/release-safety.yml"), "utf8"));
  assert.deepEqual(safety.on.pull_request.branches, ["main"]);
  assert.equal(fs.existsSync(path.join(root, ".github/dependabot.yml")), false,
    "dependency updates must be committed by the repository owner");
  const plugins = releaseConfig.plugins.map(item => Array.isArray(item) ? item[0] : item);
  assert.deepEqual(plugins.filter(name => name.startsWith("./.github/scripts/")), [
    "./.github/scripts/branded_release_notes.cjs", "./.github/scripts/public_changelog.cjs",
    "./.github/scripts/verify_release_notes.cjs", "./.github/scripts/verify_identity.cjs", "./.github/scripts/public_git.cjs",
    "./.github/scripts/public_github.cjs"
  ]);
});

test("release safety guards stay wired into publishing and pull requests", () => {
  assert.ok(releaseConfig.plugins.includes("./.github/scripts/verify_release_notes.cjs"));
  const workflow=fs.readFileSync(path.join(root,".github/workflows/release-safety.yml"),"utf8");
  assert.match(workflow,/pull_request:/);
  assert.match(workflow,/node \.github\/scripts\/preview_release_notes\.cjs/);
  assert.match(workflow,/test_release_branding\.cjs/);
});

test("semantic-release verifyRelease succeeds before nextRelease.notes exists", async () => {
  const {default: buildPlugins}=await import("semantic-release/lib/plugins/index.js");
  const ctx=context("1.28.0");
  const logger={log(){},success(){},warn(){},error(){},scope(){return this;}};
  ctx.logger=logger;
  ctx.options.plugins=[noteConfig,path.join(root,".github/scripts/verify_release_notes.cjs")];
  const parts=execFileSync("git",["log","--no-merges","--format=%H%x00%B%x00",`${ctx.lastRelease.gitTag}..${ctx.nextRelease.gitHead}`],{cwd:ctx.cwd,encoding:"utf8"}).trim().split("\0");
  ctx.commits=[];
  for(let i=0;i+1<parts.length;i+=2) ctx.commits.push({hash:parts[i].trim(),message:parts[i+1].trim()});
  const pipeline=await buildPlugins(ctx,{});
  assert.equal(ctx.nextRelease.notes,undefined);
  await pipeline.verifyRelease(ctx);
  const notes=await pipeline.generateNotes(ctx);
  assert.match(notes,/1\.28\.0/);
});

test("each shared-only commit requires its own affected-app declaration", () => releaseRepository(({dir,git,commit}) => {
  const file="patches/src/main/kotlin/patches/paper/Compatibility.kt";
  fs.mkdirSync(path.dirname(path.join(dir,file)),{recursive:true});
  fs.writeFileSync(path.join(dir,file),'val app = Compatibility( name = "Paper", packageName = "example.paper")');
  git("add", "."); const base=commit("feat(Paper): original app"); git("tag", "v1.0.0");
  fs.appendFileSync(path.join(dir,file),"\n// Changed control");git("add", ".");const direct=commit("fix(Paper): direct change");
  const shared="patches/src/main/kotlin/patches/shared/Helper.kt";
  fs.mkdirSync(path.dirname(path.join(dir,shared)),{recursive:true});fs.writeFileSync(path.join(dir,shared),"fun helper() = true");
  git("add", ".");const indirect=commit("fix: shared change");
  const ctx=context("1.1.0");ctx.cwd=dir;ctx.lastRelease={version:"1.0.0",gitTag:"v1.0.0",gitHead:base};ctx.nextRelease.gitHead=indirect;
  const bullet=(scope,hash)=>`* **${scope}:** changed ([${hash.slice(0,7)}](https://github.com/test/repo/commit/${hash}))`;
  ctx.nextRelease.notes="## [1.1.0](https://github.com/test/repo/compare/v1.0.0...v1.1.0) (2026-10-30)\n"+bullet("Paper",direct)+"\n"+bullet("General",indirect);
  const guard=require("../.github/scripts/verify_release_notes.cjs");
  assert.throws(()=>guard.verifyNotes(ctx),/shared.*Release-Apps/i);
  git("commit","--amend","-m","fix: shared change\n\nRelease-Apps: Paper");
  const declared=git("rev-parse","HEAD");ctx.nextRelease.gitHead=declared;
  ctx.nextRelease.notes="## [1.1.0](https://github.com/test/repo/compare/v1.0.0...v1.1.0) (2026-10-30)\n"+bullet("Paper",direct)+"\n"+bullet("Paper",declared);
  assert.doesNotThrow(()=>guard.verifyNotes(ctx));
}));


test("Medium vendor dependency fixes are announced only for Medium", () => releaseRepository(({dir, git, commit}) => {
  for (const name of ["Medium", "Other"]) {
    const file = path.join(dir, `patches/src/main/kotlin/patches/${name.toLowerCase()}/Compatibility.kt`);
    fs.mkdirSync(path.dirname(file), {recursive: true});
    fs.writeFileSync(file, `val app = Compatibility(name = "${name}")\n`);
  }
  git("add", "."); const base = commit("feat: fixture baseline"); git("tag", "v1.0.0");
  const vendor = path.join(dir, "support/medium/vendor/build.gradle.kts");
  fs.mkdirSync(path.dirname(vendor), {recursive: true});
  fs.writeFileSync(vendor, 'dependencies { implementation("com.google.re2j:re2j:1.8") }\n');
  git("add", "."); const message = "fix(Medium): package the isolated regex dependency"; const head = commit(message);
  const ctx = {...context("1.0.1"), cwd: dir, commits: [{hash: head, message}],
    lastRelease: {version: "1.0.0", gitTag: "v1.0.0", gitHead: base},
    nextRelease: {version: "1.0.1", gitTag: "v1.0.1", gitHead: head}};
  assert.deepEqual(plugin().appImpact(ctx).affected, ["Medium"]);
  assert.deepEqual(plugin().scopeCommits(ctx.commits, ctx).map(c => c.message.split("\n")[0]), [message]);
  ctx.nextRelease.notes = `## [1.0.1](https://github.com/test/repo/compare/v1.0.0...v1.0.1)\n\n* **Medium:** complete dependency ([${head.slice(0, 7)}](https://github.com/test/repo/commit/${head}))\n`;
  assert.doesNotThrow(() => require("../.github/scripts/verify_release_notes.cjs").verifyNotes(ctx));
}));
