"use strict";
const assert = require("node:assert/strict");
const {test} = require("node:test");
const fs = require("node:fs");
const path = require("node:path");
const os = require("node:os");
const {execFileSync} = require("node:child_process");

const script = path.join(__dirname, "../scripts/local-release/verify.cjs");
function api() {
  assert.ok(fs.existsSync(script), "Shared local/cloud verifier must exist");
  return require(script);
}

const releaseTests = ["release_branding", "preview_release", "identity", "release_discovery", "codeberg", "gitgud", "gitlab", "gitlab_publish", "local_verify", "local_release", "local_release_install", "local_release_mirrors", "local_credentials", "local_pages", "local_pages_runner"].map(name => `tests/test_${name}.cjs`);
// Gradle selects every applicable extension on each branch, including modules
// present only on main; dev must not reference a module absent from its source.
const gradleTasks = [":patches:buildAndroid", ":patches:test", ":patches:generatePatchesList", "testDebugUnitTest"];

test("legacy Forgejo profiles cannot rebuild or release automatically on mirror pushes",()=>{
  const {load}=require("js-yaml");
  for(const name of ["release","checks","pages"]){
    const config=load(fs.readFileSync(path.join(__dirname,`../.forgejo/workflows/${name}.yml`),"utf8"));
    assert.deepEqual(Object.keys(config.on),["workflow_dispatch"]);
  }
});

test("shared verification retains every existing release, Android, Medium and site check", () => {
  assert.deepEqual(api().verificationCommands(), [
    {name: "identity", command: "node", args: [".forgejo/scripts/identity.cjs", "--history"]},
    {name: "node-tests", command: "node", args: ["--test", ...releaseTests]},
    {name: "python-tests", command: ".venv/bin/python", args: ["-m", "unittest", "discover", "-s", "tests"]},
    {name: "android", command: "./gradlew", args: [...gradleTasks, "--no-daemon", "-Dorg.gradle.jvmargs=-Xmx2g"]},
    {name: "medium-bundle", command: ".venv/bin/python", args: ["scripts/medium/check_bundle.py"]},
    {name: "medium-tests", command: ".venv/bin/python", args: ["-m", "unittest", "discover", "-s", "scripts/medium/tests"]},
    {name: "docs-catalog", command: ".venv/bin/python", args: ["scripts/generate_docs_catalog.py"]},
    {name: "docs-pages", command: ".venv/bin/python", args: ["scripts/check_docs_app_pages.py"]},
    {name: "docs-build", command: ".venv/bin/python", args: ["-m", "mkdocs", "build", "--strict"]},
    {name: "docs-site", command: ".venv/bin/python", args: ["scripts/check_docs_site.py"]},
  ]);
});

test("explicit Python and offline Gradle choices affect only their own commands", () => {
  const commands = api().verificationCommands({python: "/private/venv/bin/python", offline: true});
  assert.ok(commands.filter(row => row.name.startsWith("python") || row.name.startsWith("medium") || row.name.startsWith("docs")).every(row => row.command === "/private/venv/bin/python"));
  assert.equal(commands.find(row => row.name === "android").args.filter(arg => arg === "--offline").length, 1);
  assert.ok(!api().verificationCommands().find(row => row.name === "android").args.includes("--offline"));
});

test("verifier awaits each command and preserves the caller's working directory/environment", async () => {
  const calls = [];
  let running = false;
  const env = {PATH: "/fixture/bin", MARKER: "retained"};
  await api().verify({cwd: "/fixture/checkout", env, python: "python-fixture", offline: true, run: async (command, args, options) => {
    assert.equal(running, false);
    running = true;
    await Promise.resolve();
    assert.equal(options.cwd, "/fixture/checkout");
    assert.equal(options.env.MARKER, "retained");
    assert.equal(options.env.SHARED_MAPS_API_KEY, "AIzaSyDOCSGATEPLACEHOLDER00000000000000");
    calls.push({command, args});
    running = false;
  }});
  assert.deepEqual(calls, api().verificationCommands({python: "python-fixture", offline: true}).map(({command, args}) => ({command, args})));
  assert.deepEqual(env, {PATH: "/fixture/bin", MARKER: "retained"});
});

test("a failed command immediately stops verification", async () => {
  const calls = [];
  await assert.rejects(api().verify({env: {}, run: async command => {
    calls.push(command);
    if (calls.length === 3) throw new Error("fixture failure");
  }}), /fixture failure/);
  assert.equal(calls.length, 3);
});

test("test stages cannot inherit operator credentials, deployment settings or HOME",async()=>{
  const homes=[];let android;
  const env={HOME:"/operator",GITLAB_TOKEN:"private-fixture",MORPHE_SIGNING_KEY:"private-signing-fixture",GITLAB_SSH_KEY:"/private/key",SITE_URL:"https://deployment.invalid",GITLAB_REPOSITORY:"operator/project",LOCAL_RELEASE_CONFIG:"/private/config",CI_SERVER_HOST:"gitlab.com",CI_PROJECT_PATH:"operator/project"};
  await api().verify({env,run:(command,args,options)=>{
    if(args.includes("--test")||args.includes("unittest")){
      homes.push(options.env.HOME);assert.ok(fs.existsSync(options.env.HOME));assert.notEqual(options.env.HOME,env.HOME);
      for(const key of ["GITLAB_TOKEN","MORPHE_SIGNING_KEY","GITLAB_SSH_KEY","SITE_URL","GITLAB_REPOSITORY","LOCAL_RELEASE_CONFIG","CI_SERVER_HOST"])assert.equal(options.env[key],undefined);
    }
    if(command==="./gradlew")android=options.env;
  }});
  assert.equal(homes.length,3);assert.ok(homes.every(home=>!fs.existsSync(home)));
  assert.ok(android.GITLAB_TOKEN===env.GITLAB_TOKEN,"Build environment was unexpectedly changed");
  let failedHome;
  await assert.rejects(api().verify({env,run:(_command,args,options)=>{if(args.includes("--test")){failedHome=options.env.HOME;throw Error("fixturetestfailure");}}}),/fixturetestfailure/);
  assert.ok(!fs.existsSync(failedHome));
});

test("nonzero subprocess results cannot be mistaken for successful verification", async () => {
  let calls = 0;
  await assert.rejects(api().verify({env: {}, run: () => {calls++;return {status: 7};}}), /identity.*7/);
  assert.equal(calls, 1);
});

test("GitLab documentation defaults match the former cloud setup without overriding local values", async () => {
  let actual;
  await api().verify({env: {CI_SERVER_HOST: "gitlab.com", CI_PROJECT_PATH: "owner/project", CI_PAGES_URL: "https://pages.invalid/project/"}, run: (_command, _args, options) => {actual = options.env;}});
  assert.equal(actual.GITLAB_REPOSITORY, "owner/project");
  assert.equal(actual.SITE_URL, "https://pages.invalid/project/");
  await api().verify({env: {GITLAB_REPOSITORY: "local/project", SITE_URL: "https://local.invalid/", SHARED_MAPS_API_KEY: "own-key"}, run: (_command, _args, options) => {actual = options.env;}});
  assert.equal(actual.GITLAB_REPOSITORY, "local/project");
  assert.equal(actual.SITE_URL, "https://local.invalid/");
  assert.equal(actual.SHARED_MAPS_API_KEY, "own-key");
});

test("CLI selects Python and offline mode from the explicit local environment", () => {
  api();
  const folder = fs.mkdtempSync(path.join(os.tmpdir(), "local-verify-cli-"));
  try {
    const preload = path.join(folder, "preload.cjs");
    const output = path.join(folder, "commands.jsonl");
    fs.writeFileSync(preload, 'const fs=require("node:fs");require("node:child_process").execFileSync=(command,args)=>fs.appendFileSync(process.env.VERIFY_FIXTURE_OUTPUT,JSON.stringify({command,args})+"\\n");');
    execFileSync(process.execPath, ["--require", preload, script], {cwd: folder, env: {...process.env, LOCAL_RELEASE_PYTHON: "/fixture/python", LOCAL_RELEASE_GRADLE_OFFLINE: "true", VERIFY_FIXTURE_OUTPUT: output}, stdio: "pipe"});
    const commands = fs.readFileSync(output, "utf8").trim().split("\n").map(line => JSON.parse(line));
    assert.deepEqual(commands, api().verificationCommands({python: "/fixture/python", offline: true}).map(({command, args}) => ({command, args})));
  } finally {fs.rmSync(folder, {recursive: true, force: true});}
});
