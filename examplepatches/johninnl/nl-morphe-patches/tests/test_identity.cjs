"use strict";

const assert = require("node:assert/strict");
const fs = require("node:fs");
const os = require("node:os");
const path = require("node:path");
const {execFileSync, spawnSync} = require("node:child_process");
const {test} = require("node:test");
const {load} = require("js-yaml");
const guard = require("../.github/scripts/verify_identity.cjs");
const root = path.resolve(__dirname, "..");
const script = path.join(root, ".github/scripts/verify_identity.cjs");
const token = "fixture-token";
const identity = {
  GIT_AUTHOR_NAME: guard.NAME, GIT_AUTHOR_EMAIL: guard.EMAIL,
  GIT_COMMITTER_NAME: guard.NAME, GIT_COMMITTER_EMAIL: guard.EMAIL,
};

function repository(run) {
  const cwd = fs.mkdtempSync(path.join(os.tmpdir(), "morphe-identity-"));
  const env = {...process.env, ...identity, GH_TOKEN: token, GITHUB_TOKEN: token};
  // All fixture commits live in disposable repositories outside the checkout.
  const git = (...args) => execFileSync("git", args, {cwd, env, encoding: "utf8", stdio: ["ignore", "pipe", "pipe"]}).trim();
  const commit = (overrides = {}, message = "test: identity fixture") => execFileSync("git", ["-c", "commit.gpgsign=false", "commit", "--allow-empty", "-m", message], {
    cwd, env: {...env, ...overrides}, encoding: "utf8", stdio: ["ignore", "pipe", "pipe"],
  });
  git("init", "-b", "main");
  git("config", "user.name", guard.NAME);
  git("config", "user.email", guard.EMAIL);
  commit();
  try { return run({cwd, env, git, commit}); }
  finally { fs.rmSync(cwd, {recursive: true, force: true}); }
}

test("history and CLI accept exact author and committer identities", () => repository(({cwd, env}) => {
  assert.doesNotThrow(() => guard.verifyHistory({cwd, env}));
  const result = spawnSync(process.execPath, [script, "--history"], {cwd, env, encoding: "utf8"});
  assert.equal(result.status, 0, result.stderr);
}));

for (const role of ["AUTHOR", "COMMITTER"]) {
  for (const field of ["NAME", "EMAIL"]) {
    test(`history rejects a foreign ${role.toLowerCase()} ${field.toLowerCase()}`, () => repository(({cwd, env, commit}) => {
      commit({[`GIT_${role}_${field}`]: field === "NAME" ? "fixture-foreign" : "foreign@example.test"});
      assert.throws(() => guard.verifyHistory({cwd, env}), /author and committer/);
    }));
  }
}

test("audit includes non-current branches and commits behind tags", () => repository(({cwd, env, git, commit}) => {
  git("checkout", "-b", "fixture-other");
  commit({GIT_COMMITTER_NAME: "fixture-foreign"});
  git("tag", "fixture-tag");
  git("checkout", "main");
  git("branch", "-D", "fixture-other");
  assert.throws(() => guard.verifyHistory({cwd, env}), /author and committer/);
}));

test("history rejects coauthor trailers even when Git identities match", () => repository(({cwd, env, commit}) => {
  commit({}, "test: fixture\n\nCo-authored-by: fixture <fixture@example.test>");
  assert.throws(() => guard.verifyHistory({cwd, env}), /co-author trailers/);
}));

test("effective Git identity detects environment overrides", () => repository(({cwd, env}) => {
  assert.doesNotThrow(() => guard.verifyGitIdentity({cwd, env}));
  assert.throws(() => guard.verifyGitIdentity({cwd, env: {...env, GIT_AUTHOR_EMAIL: "foreign@example.test"}}), /author/);
  assert.throws(() => guard.verifyGitIdentity({cwd, env: {...env, GIT_COMMITTER_NAME: "fixture-foreign"}}), /committer/);
}));

test("shallow history fails closed", () => repository(({cwd, env}) => {
  const clone = path.join(cwd, "shallow");
  execFileSync("git", ["clone", "--depth", "1", `file://${cwd}`, clone], {env, stdio: "pipe"});
  assert.throws(() => guard.verifyHistory({cwd: clone, env}), /complete history/);
}));

test("publisher rejects missing/mismatched tokens before calling GitHub", () => {
  const execute = () => assert.fail("must not call GitHub without matching tokens");
  assert.throws(() => guard.verifyPublisher({release: true, env: {}, execute}), /JOHNINNL_RELEASE_TOKEN/);
  assert.throws(() => guard.verifyPublisher({release: true, env: {GH_TOKEN: "one", GITHUB_TOKEN: "two"}, execute}), /matching/);
});

test("publisher checks the authenticated GitHub user and propagates API failure", () => {
  const env = {GH_TOKEN: token, GITHUB_TOKEN: token};
  const execute = (command, args, options) => {
    assert.equal(command, "gh");
    assert.deepEqual(args, ["api", "--hostname", "github.com", "user", "--jq", ".login"]);
    assert.equal(options.env, env);
    return "johninnl\n";
  };
  assert.doesNotThrow(() => guard.verifyPublisher({release: true, env, execute}));
  assert.throws(() => guard.verifyPublisher({release: true, env, execute: () => "fixture-foreign"}), /must belong to johninnl/);
  assert.throws(() => guard.verifyPublisher({release: true, env, execute: () => {throw new Error("API unavailable");}}), /API unavailable/);
});

test("semantic-release checks identity before its commit/push prepare hook", () => {
  const config = JSON.parse(fs.readFileSync(path.join(root, ".releaserc"), "utf8"));
  const plugins = config.plugins.map(value => Array.isArray(value) ? value[0] : value);
  assert.equal(plugins[plugins.indexOf("./.github/scripts/public_git.cjs") - 1], "./.github/scripts/verify_identity.cjs");
  assert.deepEqual(Object.keys(require("../.github/scripts/public_git.cjs")).sort(), ["prepare", "verifyConditions"]);
  assert.equal(guard.verifyConditions, guard.prepare);
  assert.throws(() => guard.prepare({}, {cwd: root, env: {}}), /JOHNINNL_RELEASE_TOKEN/);
  assert.throws(() => guard.verifyMessage("\nco-AUTHORED-by: fixture <fixture@example.test>", "Release notes"), /Release notes/);
});

test("parsed publishing workflow binds checkout, release and Git metadata to johninnl", () => {
  const workflow = load(fs.readFileSync(path.join(root, ".github/workflows/release.yml"), "utf8"));
  const job = workflow.jobs.release;
  const secret = "${{ secrets.JOHNINNL_RELEASE_TOKEN }}";
  assert.equal(job.env.GH_TOKEN, secret);
  assert.equal(job.env.GITHUB_TOKEN, secret);
  for (const [key, value] of Object.entries(identity)) assert.equal(job.env[key], value);
  const checkout = job.steps.find(step => step.uses?.startsWith("actions/checkout@"));
  assert.equal(checkout.with.token, secret);
  assert.equal(checkout.with["ssh-key"], undefined);
  assert.equal(checkout.with["fetch-depth"], 0);
  const publisher = job.steps.find(step => step.name === "Verify release publisher before checkout");
  assert.ok(job.steps.indexOf(publisher) < job.steps.indexOf(checkout));
  // Exercise the actual workflow's shell preflight, including empty/wrong tokens.
  const bin = fs.mkdtempSync(path.join(os.tmpdir(), "morphe-publisher-"));
  try {
    fs.writeFileSync(path.join(bin, "gh"), '#!/bin/sh\nprintf "%s\\n" "$FIXTURE_LOGIN"\n', {mode: 0o755});
    for (const [credential, login, expected] of [["", "johninnl", 1], [token, "fixture-foreign", 1], [token, "johninnl", 0]]) {
      const result = spawnSync("bash", ["-e", "-c", publisher.run], {
        env: {...process.env, PATH: `${bin}${path.delimiter}${process.env.PATH}`, GH_TOKEN: credential, FIXTURE_LOGIN: login}, encoding: "utf8",
      });
      assert.equal(result.status, expected, result.stderr);
    }
  } finally { fs.rmSync(bin, {recursive: true, force: true}); }
  const check = job.steps.find(step => step.run === "node .github/scripts/verify_identity.cjs --release");
  const release = job.steps.find(step => step.uses?.includes("semantic-release-action"));
  assert.ok(job.steps.indexOf(check) > job.steps.indexOf(checkout));
  assert.ok(job.steps.indexOf(check) < job.steps.indexOf(release));
  for (const step of job.steps) {
    assert.equal(step.env?.GH_TOKEN, undefined, "inherit the verified release token");
    assert.equal(step.env?.GITHUB_TOKEN, undefined, "inherit the verified release token");
  }
});

test("parsed CI workflow audits actual candidate history on every branch", () => {
  const workflow = load(fs.readFileSync(path.join(root, ".github/workflows/release-safety.yml"), "utf8"));
  assert.deepEqual(workflow.on.push.branches, ["**"]);
  assert.deepEqual(workflow.on.pull_request.branches, ["main"]);
  const steps = workflow.jobs["release-notes"].steps;
  const checkout = steps.find(step => step.uses?.startsWith("actions/checkout@"));
  assert.equal(checkout.with.ref, "${{ github.event.pull_request.head.sha || github.sha }}");
  assert.equal(checkout.with["fetch-depth"], 0);
  const check = steps.find(step => step.run === "node .github/scripts/verify_identity.cjs --history");
  assert.ok(steps.indexOf(check) > steps.indexOf(checkout));
  assert.ok(steps.some(step => step.run?.includes("tests/test_identity.cjs")));
  assert.equal(fs.existsSync(path.join(root, ".github/dependabot.yml")), false);
});
