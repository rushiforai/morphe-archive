"use strict";
process.env.GITLAB_DESTINATION = "gitlab";
const assert = require("node:assert/strict");
const {test} = require("node:test");
const fs = require("node:fs");
const path = require("node:path");
const os = require("node:os");
const crypto = require("node:crypto");
const {execFileSync} = require("node:child_process");
const {loadAll} = require("js-yaml");
const {verifyPublisher} = require("../.gitlab/scripts/identity.cjs");
test("GitLab publisher rejects a different account and missing credentials", async () => {
  await assert.doesNotReject(verifyPublisher({env: {GITLAB_TOKEN: "fixture"}, request: async () => ({username:"johninnld"})}));
  await assert.rejects(verifyPublisher({env: {GITLAB_TOKEN: "fixture"}, request: async () => ({username: "bot"})}), /must belong/);
  await assert.rejects(verifyPublisher({env: {GITLAB_TOKEN: "fixture"}, request: async () => ({username: "JohninNL"})}), /must belong to johninnld/);
  await assert.rejects(verifyPublisher({env: {}}), /JOHNINNL_GITLAB_TOKEN/);
});
test("GitLab mirrors identical signed bytes without competing source commits or tags", async () => {
  const cwd = fs.mkdtempSync(path.join(os.tmpdir(), "gitlab-mirror-")); const previous = process.cwd();
  const {privateKey, publicKey} = crypto.generateKeyPairSync("ed25519");
  const key = Buffer.from(publicKey.export({format: "jwk"}).x, "base64url").toString("base64");
  const zip = Buffer.alloc(22);zip.writeUInt32LE(0x06054b50);
  const sig = crypto.sign(null, Buffer.concat([Buffer.from("MorpheSig1"), crypto.createHash("sha256").update(zip).digest()]), privateKey);
  const comment = Buffer.from(`MorpheSig1 ${key} ${sig.toString("base64")}`);zip.writeUInt16LE(comment.length,20);const bytes=Buffer.concat([zip,comment]);
  const source = "https://codeberg.org/JohninNL/nl-morphe-patches/releases/download/v1.2.3/patches-1.2.3.mpp";
  const env = {...process.env, GIT_AUTHOR_NAME: "johninnl", GIT_COMMITTER_NAME: "johninnl", GIT_AUTHOR_EMAIL: "349981574+johninnl@users.noreply.github.com", GIT_COMMITTER_EMAIL: "349981574+johninnl@users.noreply.github.com"};
  const git = (...args) => execFileSync("git", args, {cwd, env, encoding:"utf8",stdio:["ignore","pipe","pipe"]}).trim();
  try {
    fs.writeFileSync(path.join(cwd,"morphe-signing.pub"),key);
    fs.writeFileSync(path.join(cwd,"patches-bundle.json"),JSON.stringify({version:"1.2.3",download_url:source,public_key:key,description:"Release notes."}));
    git("init","-b","main");git("add",".");git("-c","commit.gpgsign=false","commit","-m","test: source fixture");git("tag","v1.2.3");
    const original=git("rev-parse","HEAD");process.chdir(cwd);
    let stored=null, release=null;const writes=[];
    const request=async(endpoint,options={})=>{
      if(endpoint==="/user")return {username:"johninnld"};
      assert.ok(endpoint.startsWith("/projects/johninnld%2Fnl-morphe-patches"));
      if(endpoint.includes("/packages/generic/")) {
        if(options.method==="PUT"){stored=options.body;writes.push("package");return {message:"created"};}return stored;
      }
      if(options.method==="POST") {writes.push("release");release={...options.body,author:{username:"johninnld"}};return release;}
      return release;
    };
    const fetcher=async(url, options)=>{
      assert.equal(url,"https://codeberg.org/api/v1/repos/JohninNL/nl-morphe-patches/releases/tags/v1.2.3");
      assert.equal(options.headers,undefined,"Never send the GitLab token to the source forge");
      return {ok:true,json:async()=>({tag_name:"v1.2.3",author:{login:"JohninNL"},prerelease:false,draft:false,assets:[{name:"patches-1.2.3.mpp",size:bytes.length}]})};
    };
    const options={env:{GITLAB_TOKEN:"fixture",CI_COMMIT_BRANCH:"main"},request,fetcher,readBundle:async()=>bytes,updateMetadata:false};
    const mirror=require("../.gitlab/scripts/release.cjs").mirrorRelease;
    assert.equal(await mirror(options),true);assert.deepEqual(writes,["package","release"]);
    assert.equal(await mirror(options),true);assert.deepEqual(writes,["package","release"]);
    assert.equal(git("rev-parse","HEAD"),original);assert.equal(git("rev-parse","v1.2.3"),original);
    assert.equal(release.assets.links[0].name,"patches-1.2.3.mpp");
    assert.equal(release.assets.links[0].url,"https://gitlab.com/api/v4/projects/johninnld%2Fnl-morphe-patches/packages/generic/morphe-patches/1.2.3/patches-1.2.3.mpp");
    stored=Buffer.from(bytes);stored[4]^=1;
    await assert.rejects(mirror(options),/signature/);
  } finally {process.chdir(previous);fs.rmSync(cwd,{recursive:true,force:true});}
});
test("GitLab pipeline publishes only protected authoritative main/dev releases", () => {
  const config=loadAll(fs.readFileSync(path.join(__dirname,"../.gitlab-ci.yml"),"utf8")).at(-1);
  assert.equal(config.image,"eclipse-temurin:21-jdk-noble","The pinned documentation tools require Python 3.11+, unavailable in Jammy");
  assert.equal(config.variables.GIT_DEPTH,"0");
  assert.equal(config.variables.GIT_AUTHOR_NAME,"johninnl");
  assert.equal(config.variables.GIT_COMMITTER_EMAIL,"349981574+johninnl@users.noreply.github.com");
  assert.match(config.release.rules[0].if,/CI_COMMIT_REF_PROTECTED/);
  assert.ok(config.release.script.some(s=>s.includes("JOHNINNL_GITLAB_TOKEN")));
  assert.ok(!config.release.script.some(s=>s.includes("semantic-release")));
  assert.equal(config.verify.artifacts.paths[0],"build/docs-site/");
  assert.equal(fs.existsSync(path.join(__dirname,"../.gitlab/release.config.cjs")),false);
});

test("GitLab cloud workflows require explicit web opt-in, including main/dev and MR events", () => {
  const config=loadAll(fs.readFileSync(path.join(__dirname,"../.gitlab-ci.yml"),"utf8")).at(-1);
  function allowed(env) {
    for (const rule of config.workflow.rules) {
      const matches = !rule.if || Function(`return (${rule.if.replace(/\$([A-Z_]+)/g, (_match, name) => JSON.stringify(env[name] || ""))});`)();
      if(matches)return rule.when !== "never";
    }
    return false;
  }
  for(const branch of ["main", "feature/example"]){
    for(const source of ["push", "merge_request_event", "schedule", "api"]){
      assert.equal(allowed({CI_SERVER_HOST:"gitlab.com", CI_COMMIT_BRANCH:branch, CI_PIPELINE_SOURCE:source, RUN_CLOUD_CI:"true"}),false,`${source} ${branch}`);
    }
    for(const choice of [undefined, "false", "TRUE"]){
      assert.equal(allowed({CI_SERVER_HOST:"gitlab.com", CI_COMMIT_BRANCH:branch, CI_PIPELINE_SOURCE:"web", RUN_CLOUD_CI:choice}),false);
    }
    assert.equal(allowed({CI_SERVER_HOST:"gitlab.com", CI_COMMIT_BRANCH:branch, CI_PIPELINE_SOURCE:"web", RUN_CLOUD_CI:"true"}),true);
  }
  assert.equal(allowed({CI_SERVER_HOST:"gitgud.io",CI_PIPELINE_SOURCE:"web",RUN_CLOUD_CI:"true"}),false);
  assert.deepEqual(config.verify.script,["node scripts/local-release/verify.cjs"]);
  assert.match(config.release.rules[0].if,/CI_COMMIT_REF_PROTECTED/);
  assert.match(config.pages.rules[0].if,/CI_COMMIT_REF_PROTECTED/);
  assert.match(config.pages.rules[0].if,/CI_COMMIT_BRANCH == "main"/);
});

test("GitLab API and Git credentials stay on the exact destination host", async () => {
  const {api} = require("../.gitlab/scripts/api.cjs");
  await api("/user", {token:"fixture-token", fetcher:async(url, options)=>{
    assert.equal(url,"https://gitlab.com/api/v4/user");
    assert.equal(options.headers["PRIVATE-TOKEN"],"fixture-token");
    assert.equal(options.redirect,"error");
    return {ok:true,status:200,json:async()=>({username:"johninnld"})};
  }});
  await assert.rejects(api("//other.invalid/user",{token:"fixture"}),/Invalid/);
  const env=require("../.gitlab/scripts/release.cjs").gitAuth({GITLAB_TOKEN:"fixture"});
  assert.equal(env.GIT_CONFIG_KEY_0,"http.https://gitlab.com/.extraheader");
  assert.equal(env.GIT_CONFIG_KEY_1,"http.https://gitlab.com/.extraheader");
  assert.equal(env.GIT_CONFIG_VALUE_0,`Authorization: Basic ${Buffer.from("johninnld:fixture").toString("base64")}`);
});
