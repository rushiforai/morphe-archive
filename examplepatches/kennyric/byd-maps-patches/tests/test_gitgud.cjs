"use strict";
process.env.GITLAB_DESTINATION = "gitgud";
const assert = require("node:assert/strict");
const {test} = require("node:test");
const fs = require("node:fs");
const path = require("node:path");
const os = require("node:os");
const crypto = require("node:crypto");
const {execFileSync} = require("node:child_process");
const {loadAll} = require("js-yaml");
const {verifyPublisher} = require("../.gitlab/scripts/identity.cjs");
test("GitGud publisher rejects a different account and missing credentials", async () => {
  await assert.doesNotReject(verifyPublisher({env: {GITLAB_TOKEN: "fixture"}, request: async () => ({username: "JohninNL"})}));
  await assert.rejects(verifyPublisher({env: {GITLAB_TOKEN: "fixture"}, request: async () => ({username: "bot"})}), /must belong/);
  await assert.rejects(verifyPublisher({env: {}}), /JOHNINNL_GITGUD_TOKEN/);
});
test("GitGud mirrors identical signed bytes without competing source commits or tags", async () => {
  const cwd = fs.mkdtempSync(path.join(os.tmpdir(), "gitgud-mirror-")); const previous = process.cwd();
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
      if(endpoint==="/user")return {username:"JohninNL"};
      if(endpoint.includes("/packages/generic/")) {
        if(options.method==="PUT"){stored=options.body;writes.push("package");return {message:"created"};}return stored;
      }
      if(options.method==="POST") {writes.push("release");release={...options.body,author:{username:"JohninNL"}};return release;}
      return release;
    };
    const fetcher=async()=>({ok:true,json:async()=>({tag_name:"v1.2.3",author:{login:"JohninNL"},prerelease:false,draft:false,assets:[{name:"patches-1.2.3.mpp",size:bytes.length}]})});
    const options={env:{GITLAB_TOKEN:"fixture",CI_COMMIT_BRANCH:"main"},request,fetcher,readBundle:async()=>bytes,updateMetadata:false};
    const mirror=require("../.gitlab/scripts/release.cjs").mirrorRelease;
    assert.equal(await mirror(options),true);assert.deepEqual(writes,["package","release"]);
    assert.equal(await mirror(options),true);assert.deepEqual(writes,["package","release"]);
    assert.equal(git("rev-parse","HEAD"),original);assert.equal(git("rev-parse","v1.2.3"),original);
    assert.equal(release.assets.links[0].name,"patches-1.2.3.mpp");
    stored=Buffer.from(bytes);stored[4]^=1;
    await assert.rejects(mirror(options),/signature/);
  } finally {process.chdir(previous);fs.rmSync(cwd,{recursive:true,force:true});}
});
test("GitLab pipeline publishes only protected authoritative main/dev releases", () => {
  const config=loadAll(fs.readFileSync(path.join(__dirname,"../.gitlab-ci.yml"),"utf8")).at(-1);
  assert.equal(config.variables.GIT_DEPTH,"0");
  assert.equal(config.variables.GIT_AUTHOR_NAME,"johninnl");
  assert.equal(config.variables.GIT_COMMITTER_EMAIL,"349981574+johninnl@users.noreply.github.com");
  assert.match(config.release.rules[0].if,/CI_COMMIT_REF_PROTECTED/);
  assert.ok(config.release.script.some(s=>s.includes("JOHNINNL_GITGUD_TOKEN")));
  assert.ok(!config.release.script.some(s=>s.includes("semantic-release")));
  assert.equal(config.verify.artifacts.paths[0],"build/docs-site/");
  assert.equal(fs.existsSync(path.join(__dirname,"../.gitlab/release.config.cjs")),false);
});
