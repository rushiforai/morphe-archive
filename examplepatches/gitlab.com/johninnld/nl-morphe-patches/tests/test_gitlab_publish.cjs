"use strict";
process.env.GITLAB_DESTINATION = "gitlab";
const assert = require("node:assert/strict");
const {test} = require("node:test");
const fs = require("node:fs");
const os = require("node:os");
const path = require("node:path");
const crypto = require("node:crypto");
const {fetchManifest} = require("../.gitlab/scripts/discovery.cjs");
const {execFileSync} = require("node:child_process");
const {loadAll} = require("js-yaml");
function signedFixture() {
  const {privateKey, publicKey} = crypto.generateKeyPairSync("ed25519");
  const key = Buffer.from(publicKey.export({format:"jwk"}).x,"base64url").toString("base64");
  const zip = Buffer.alloc(22); zip.writeUInt32LE(0x06054b50);
  const signature = crypto.sign(null,Buffer.concat([Buffer.from("MorpheSig1"),crypto.createHash("sha256").update(zip).digest()]),privateKey);
  const comment = Buffer.from(`MorpheSig1 ${key} ${signature.toString("base64")}`); zip.writeUInt16LE(comment.length,20);
  return {key,bytes:Buffer.concat([zip,comment])};
}
test("GitLab chooses versions with existing source guards and never loads another forge publisher", () => {
  const config=require("../.gitlab/gitlab-com.release.config.cjs");
  assert.equal(config.repositoryUrl,"https://gitlab.com/johninnld/nl-morphe-patches.git");
  assert.deepEqual(config.branches,["main"]);
  const plugins=config.plugins.map(p=>Array.isArray(p)?p[0]:p);
  assert.ok(plugins.includes("./.github/scripts/verify_release_notes.cjs"));
  assert.equal(plugins[plugins.indexOf("./.gitlab/scripts/release_commit.cjs")-1],"./.gitlab/scripts/identity.cjs");
  assert.ok(!plugins.includes("./.github/scripts/public_git.cjs"));
  assert.equal(plugins.at(-1),"./.gitlab/scripts/promote_main.cjs");
  assert.ok(plugins.indexOf("./.gitlab/scripts/publish.cjs")<plugins.indexOf("./.gitlab/scripts/promote_main.cjs"));
  const releaseCommit=config.plugins.find(p=>Array.isArray(p)&&p[0]==="./.gitlab/scripts/release_commit.cjs")[1];
  const sourceCommit=JSON.parse(fs.readFileSync(path.join(__dirname,"../.releaserc"),"utf8")).plugins.find(p=>Array.isArray(p)&&p[0]==="./.github/scripts/public_git.cjs")[1];
  assert.deepEqual(releaseCommit,sourceCommit);
  assert.ok(plugins.includes("./.gitlab/scripts/publish.cjs"));
  assert.ok(plugins.includes("./.gitlab/scripts/changelog.cjs"));
  assert.ok(!plugins.some(p=>p.includes(".forgejo/")||p.includes("public_github")));
  const ci=loadAll(fs.readFileSync(path.join(__dirname,"../.gitlab-ci.yml"),"utf8")).at(-1);
  const commands=ci.release.script.join("\n");
  assert.ok(commands.indexOf("check_secrets.cjs")<commands.indexOf("publish_release.cjs"));
  assert.ok(commands.indexOf("publish_release.cjs")<commands.indexOf("discovery.cjs"));
  assert.deepEqual(ci.release.needs,["verify"]);
});
test("GitLab Pages deploys only the post-release site to its public Pages URL", () => {
  const ci=loadAll(fs.readFileSync(path.join(__dirname,"../.gitlab-ci.yml"),"utf8")).at(-1);
  assert.deepEqual(ci.stages,["verify","release","deploy"]);
  assert.equal(ci.pages.stage,"deploy");
  assert.deepEqual(ci.pages.needs,[{job:"release",artifacts:false}]);
  assert.equal(ci.pages.pages.publish,"public");
  assert.deepEqual(ci.pages.rules,[{if:'$CI_SERVER_HOST == "gitlab.com" && $CI_PIPELINE_SOURCE == "web" && $RUN_CLOUD_CI == "true" && $CI_COMMIT_REF_PROTECTED == "true" && $CI_COMMIT_BRANCH == "main"'}]);
  const commands=ci.pages.script.join("\n");
  assert.match(commands,/apt-get install -y --no-install-recommends git python3 python3-venv/);
  assert.ok(commands.indexOf("apt-get install")<commands.indexOf("git fetch origin"));
  assert.match(commands,/CI_PAGES_URL/);
  assert.match(commands,/GITLAB_REPOSITORY="\$CI_PROJECT_PATH" SITE_URL=/);
  assert.deepEqual(ci.pages.before_script,[]);
  assert.match(commands,/mkdocs build --strict --site-dir public/);
  assert.match(commands,/test -s public\/index\.html/);
  assert.equal(ci.pages.environment.name,"production");
  const mkdocs=fs.readFileSync(path.join(__dirname,"../mkdocs.yml"),"utf8");
  assert.match(mkdocs,/site_url: !ENV \[SITE_URL, 'https:\/\/nl-morphe-patches-ed90fa\.gitlab\.io\/'\]/);
  assert.match(fs.readFileSync(path.join(__dirname,"../scripts/check_docs_site.py"),"utf8"),/os\.environ\.get\('SITE_URL'/);
});
test("GitLab source metadata uses its public release permalink and existing signing key", async () => {
  const cwd=fs.mkdtempSync(path.join(os.tmpdir(),"gitlab-native-notes-"));
  try {
    const {key}=signedFixture();fs.writeFileSync(path.join(cwd,"morphe-signing.pub"),key);
    await require("../.gitlab/scripts/changelog.cjs").prepare({}, {cwd,nextRelease:{version:"1.2.3",notes:"Release notes."}});
    const manifest=JSON.parse(fs.readFileSync(path.join(cwd,"patches-bundle.json")));
    assert.equal(manifest.public_key,key);assert.equal(manifest.version,"1.2.3");
    assert.equal(manifest.download_url,"https://gitlab.com/johninnld/nl-morphe-patches/-/releases/v1.2.3/downloads/patches-1.2.3.mpp");
  } finally {fs.rmSync(cwd,{recursive:true,force:true});}
});
test("GitLab release branding uses its immutable source and restores only known public links", () => {
  const {renderNotes,restorePublicLinks}=require("../.github/scripts/branded_release_notes.cjs");
  const head="c".repeat(40);
  const notes=renderNotes("Release.",{env:{GITLAB_REPOSITORY:"johninnld/nl-morphe-patches",CODEBERG_REPOSITORY:"JohninNL/nl-morphe-patches"},branch:{name:"main"},nextRelease:{version:"1.2.3",gitHead:head}});
  assert.ok(notes.includes(`https://gitlab.com/johninnld/nl-morphe-patches/-/raw/${head}/docs/site/assets/brand/release-banner.png`));
  assert.ok(notes.includes(`https://gitlab.com/johninnld/nl-morphe-patches/-/commit/${head}`));
  assert.ok(!notes.includes("codeberg.org"));
  assert.equal(restorePublicLinks("https://gitlab.com/[secure]d/nl-morphe-patches/-/commit/a token=[secure]"),"https://gitlab.com/johninnld/nl-morphe-patches/-/commit/a token=[secure]");
  assert.equal(restorePublicLinks("https://gitlab.com/[secure]/other-project"),"https://gitlab.com/[secure]/other-project");
});
test("GitLab publishes and verifies exact signed public bytes, retries without overwriting and rejects wrong source", async () => {
  const cwd=fs.mkdtempSync(path.join(os.tmpdir(),"gitlab-native-publish-"));
  const {key,bytes}=signedFixture();
  const hash="a".repeat(40);let stored=null,release=null;const writes=[];
  const context={cwd,env:{GITLAB_TOKEN:"fixture"},branch:{name:"main"},nextRelease:{version:"1.2.3",gitTag:"v1.2.3",gitHead:hash,notes:"Release."}};
  const request=async(endpoint,options={})=>{
    if(endpoint==="/user")return {username:"johninnld"};
    assert.ok(endpoint.startsWith("/projects/johninnld%2Fnl-morphe-patches"));
    if(endpoint.includes("/packages/generic/")){
      if(options.method==="PUT"){stored=options.body;writes.push("package");return {message:"created"};}return stored;
    }
    if(options.method==="POST"){
      writes.push("release");release={...options.body,author:{username:"johninnld"},commit:{id:hash}};return release;
    }
    return release;
  };
  const reads=[];const reader=async(url,size)=>{assert.ok(url.startsWith("https://gitlab.com/"));assert.equal(size,bytes.length);reads.push(url);return stored;};
  try {
    fs.mkdirSync(path.join(cwd,"patches/build/libs"),{recursive:true});
    fs.writeFileSync(path.join(cwd,"patches/build/libs/patches-1.2.3.mpp"),bytes);
    fs.writeFileSync(path.join(cwd,"morphe-signing.pub"),key);
    const publish=require("../.gitlab/scripts/publish.cjs").publish;
    await publish({},context,request,reader);assert.deepEqual(writes,["package","release"]);
    assert.ok(reads[0].includes("/packages/generic/"));assert.ok(reads[1].includes("/-/releases/v1.2.3/downloads/"));
    await publish({},context,request,reader);assert.deepEqual(writes,["package","release"]);
    release.commit.id="b".repeat(40);await assert.rejects(publish({},context,request,reader),/source commit/);
    release.commit.id=hash;stored=Buffer.from(bytes);stored[4]^=1;await assert.rejects(publish({},context,request,reader),/signature/);
    await assert.rejects(publish({}, {...context,branch:{name:"dev"}},request,reader),/channel/);
  } finally {fs.rmSync(cwd,{recursive:true,force:true});}
});
test("GitLab recovery reuses the exact signed upload only at its authoritative release tag", async () => {
  const cwd=fs.mkdtempSync(path.join(os.tmpdir(),"gitlab-native-recovery-"));const previous=process.cwd();
  const {key,bytes}=signedFixture();
  const env={...process.env,GIT_AUTHOR_NAME:"johninnl",GIT_AUTHOR_EMAIL:"349981574+johninnl@users.noreply.github.com",GIT_COMMITTER_NAME:"johninnl",GIT_COMMITTER_EMAIL:"349981574+johninnl@users.noreply.github.com"};
  const git=(...args)=>execFileSync("git",args,{cwd,env,encoding:"utf8",stdio:["ignore","pipe","pipe"]}).trim();
  try {
    fs.writeFileSync(path.join(cwd,"morphe-signing.pub"),key);
    fs.writeFileSync(path.join(cwd,"patches-bundle.json"),JSON.stringify({version:"1.2.3",public_key:key,description:"Release."}));
    git("init","-b","main");git("add",".");git("-c","commit.gpgsign=false","commit","-m","test: recovery fixture");process.chdir(cwd);
    const recover=require("../.gitlab/scripts/publish_release.cjs").recoverTaggedRelease;
    const {verifyCurrentHead}=require("../.gitlab/scripts/publish_release.cjs");
    let requests=0,published=0;
    const options={request:async()=>{requests++;return bytes;},build:()=>{throw new Error("Must reuse signed upload");},publish:async()=>{published++;}};
    assert.equal(await recover("main",options),null);assert.equal(requests,0);
    const source=git("rev-parse","HEAD");
    assert.doesNotThrow(()=>verifyCurrentHead("main",()=>`${source}\trefs/heads/main\n`));
    assert.throws(()=>verifyCurrentHead("main",()=>`${"b".repeat(40)}\trefs/heads/main\n`),/Stale release checkout.*recovery pipeline/);
    git("tag","v1.2.3");assert.deepEqual(await recover("main",options),{version:"1.2.3",branch:"main"});assert.equal(published,1);
    assert.deepEqual(fs.readFileSync("patches/build/libs/patches-1.2.3.mpp"),bytes);
    const bad=Buffer.from(bytes);bad[4]^=1;await assert.rejects(recover("main",{...options,request:async()=>bad}),/signature/);
    await assert.rejects(recover("dev",options),/channel/);
  } finally {process.chdir(previous);fs.rmSync(cwd,{recursive:true,force:true});}
});
test("GitLab anonymous downloads and discovery reject wrong hosts, channels and signing identities", async () => {
  const {key,bytes}=signedFixture();const {download}=require("../.gitlab/scripts/bundle.cjs");
  await assert.rejects(download("https://codeberg.org/asset",bytes.length),/host/);
  assert.deepEqual(await download("https://gitlab.com/asset",bytes.length,async(_url,opts)=>{assert.equal(opts.headers,undefined);return {ok:true,arrayBuffer:async()=>bytes};}),bytes);
  const {verifyDiscovery}=require("../.gitlab/scripts/discovery.cjs");
  const manifest={version:"1.2.3",public_key:key,download_url:"https://gitlab.com/johninnld/nl-morphe-patches/-/releases/v1.2.3/downloads/patches-1.2.3.mpp"};
  const release={tag_name:"v1.2.3",author:{username:"johninnld"},assets:{links:[{name:"patches-1.2.3.mpp",url:"https://gitlab.com/api/v4/projects/johninnld%2Fnl-morphe-patches/packages/generic/morphe-patches/1.2.3/patches-1.2.3.mpp"}]}};
  const options={branch:"main",version:"1.2.3",publicKey:key};
  assert.ok(verifyDiscovery(manifest,release,options).url.includes("gitlab.com"));
  assert.throws(()=>verifyDiscovery(manifest,release,{...options,branch:"dev"}),/channel|Version/);
  assert.throws(()=>verifyDiscovery({...manifest,public_key:signedFixture().key},release,options),/signing/);
  assert.throws(()=>verifyDiscovery(manifest,{...release,author:{username:"bot"}},options),/source/);
});

function publisherFixture(t, branch="main") {
  const cwd=fs.mkdtempSync(path.join(os.tmpdir(),"gitlab-publisher-entry-"));
  t.after(()=>fs.rmSync(cwd,{recursive:true,force:true}));
  execFileSync("git",["init","-b",branch],{cwd,stdio:"pipe"});
  const receipt=()=>JSON.parse(fs.readFileSync(path.join(cwd,"build/release-safety/gitlab-result.json"),"utf8"));
  return {cwd,receipt};
}
test("discovery retries stale CDN manifests with cache-busted fetches", async () => {
  const manifest = {version: "1.2.3", public_key: "key"};
  let served = 0;
  const stale = {ok: true, json: async () => ({version: "1.2.2", public_key: "key"})};
  const fresh = {ok: true, json: async () => manifest};
  const fetcher = async url => {
    assert.ok(url.includes("?t="), "Manifest fetches must be cache busted");
    return ++served === 1 ? stale : fresh;
  };
  const pauses = [];
  const recovered = await fetchManifest("a".repeat(40), {expectedVersion: "1.2.3", fetcher, attempts: 3, pause: ms => {pauses.push(ms); return Promise.resolve();}});
  assert.deepEqual(recovered, manifest);
  assert.deepEqual(pauses, [5000], "Retries back off between attempts");
  // A stale version is retried too, and only reported once every attempt is stale.
  let staleCalls = 0;
  await assert.rejects(fetchManifest("main", {expectedVersion: "1.2.3", fetcher: async () => {staleCalls++; return stale;}, attempts: 3, pause: () => Promise.resolve()}), /still advertises 1\.2\.2/);
  assert.equal(staleCalls, 3, "Every allowed attempt is used before reporting a stale manifest");
  const urls = [];
  await assert.rejects(fetchManifest("main", {fetcher: async url => {urls.push(url); return {ok: false, status: 502};}, attempts: 2, pause: () => Promise.resolve()}), /HTTP 502/);
  assert.equal(urls.length, 2);
});
test("local releases check the remote before running the unchanged signed release configuration", async t => {
  const {main}=require("../.gitlab/scripts/publish_release.cjs");
  for(const branch of ["main"]){
    const {cwd,receipt}=publisherFixture(t,branch);const calls=[];
    const version="1.2.4";
    const result=await main(["--local"],{pending:()=>null,cwd,env:{GITLAB_TOKEN:"fixture"},
      verifyHead:checked=>{assert.equal(checked,branch);calls.push("head");},
      release:async(options,context)=>{
        calls.push("release");assert.equal(options.ci,false);assert.notEqual(options.dryRun,true);
        assert.equal(context.cwd,cwd);assert.equal(context.env.GITLAB_REPOSITORY,"johninnld/nl-morphe-patches");
        assert.deepEqual(options.plugins,require("../.gitlab/gitlab-com.release.config.cjs").plugins);
        return {nextRelease:{version}};
      },recover:async()=>{assert.fail("A selected release must not invoke recovery");}});
    assert.deepEqual(calls,["head","release"]);assert.deepEqual(result,{version,branch});assert.deepEqual(receipt(),result);
  }
});
test("hosted publication retains semantic-release CI defaults", async t => {
  const {main}=require("../.gitlab/scripts/publish_release.cjs");const {cwd}=publisherFixture(t);
  await main([],{pending:()=>null,cwd,env:{GITLAB_TOKEN:"fixture"},verifyHead:()=>{},release:async options=>{
    assert.equal(options.ci,undefined);return {nextRelease:{version:"1.2.4"}};
  },recover:async()=>assert.fail("Unexpected recovery")});
});
test("dry-run records selected and unselected previews without invoking tagged recovery", async t => {
  const {main}=require("../.gitlab/scripts/publish_release.cjs");
  for(const selected of [true,false]){
    const {cwd,receipt}=publisherFixture(t,"main");
    const result=await main(["--local","--dry-run"],{pending:()=>null,cwd,env:{GITLAB_TOKEN:"fixture"},
      verifyHead:()=>assert.fail("Preview must not enter publication guards or recovery"),
      release:async(options)=>{
        assert.equal(options.ci,false);assert.equal(options.dryRun,true);
        return selected?{nextRelease:{version:"1.2.4"}}:false;
      },recover:async()=>assert.fail("A preview must never publish a tagged release")});
    const expected={preview:true,published:false,branch:"main",...(selected?{version:"1.2.4"}:{})};
    assert.deepEqual(result,expected);assert.deepEqual(receipt(),expected);
  }
});
test("dry-run is respected without local mode", async t => {
  const {main}=require("../.gitlab/scripts/publish_release.cjs");const {cwd,receipt}=publisherFixture(t);
  await main(["--dry-run"],{pending:()=>null,cwd,env:{GITLAB_TOKEN:"fixture"},release:async options=>{
    assert.equal(options.dryRun,true);assert.equal(options.ci,undefined);return false;
  },recover:async()=>assert.fail("Dry-run recovery would publish"),verifyHead:()=>assert.fail("Unexpected publication")});
  assert.deepEqual(receipt(),{preview:true,published:false,branch:"main"});
});
test("feature branches and unknown options are refused before release or recovery", async t => {
  const {main}=require("../.gitlab/scripts/publish_release.cjs");const {cwd}=publisherFixture(t,"feature/test");
  const deps={cwd,env:{GITLAB_TOKEN:"fixture"},release:async()=>assert.fail("Feature publication"),recover:async()=>assert.fail("Feature recovery"),verifyHead:()=>assert.fail("Unexpected remote lookup")};
  await assert.rejects(main(["--local"],deps),/Only main/);
  await assert.rejects(main(["--local","--dry-run"],deps),/Only main/);
  await assert.rejects(main(["--preview"],deps),/Unknown option/);
});
test("stale release checkouts fail before semantic-release or tagged recovery", async t => {
  const {main}=require("../.gitlab/scripts/publish_release.cjs");const {cwd}=publisherFixture(t);
  await assert.rejects(main(["--local"],{pending:()=>null,cwd,env:{GITLAB_TOKEN:"fixture"},
    verifyHead:()=>{throw new Error("Stale release checkout");},
    release:async()=>assert.fail("Stale source must not publish"),recover:async()=>assert.fail("Stale source must not recover")}),/Stale release checkout/);
  assert.equal(fs.existsSync(path.join(cwd,"build/release-safety/gitlab-result.json")),false);
});
test("local no-release runs recheck the head before preserving tagged recovery", async t => {
  const {main}=require("../.gitlab/scripts/publish_release.cjs");
  for(const recovered of [true,false]){
    const {cwd,receipt}=publisherFixture(t);const calls=[];
    const result=await main(["--local"],{pending:()=>null,cwd,env:{GITLAB_TOKEN:"fixture"},verifyHead:()=>calls.push("head"),
      release:async()=>{calls.push("release");return false;},
      recover:async branch=>{calls.push("recover");assert.equal(branch,"main");return recovered?{version:"1.2.3",branch}:null;}});
    assert.deepEqual(calls,["head","release","head","recover"]);
    assert.deepEqual(result,recovered?{version:"1.2.3",branch:"main"}:{published:false});assert.deepEqual(receipt(),result);
  }
});
test("a remote advance during no-release analysis blocks recovery publication", async t => {
  const {main}=require("../.gitlab/scripts/publish_release.cjs");const {cwd}=publisherFixture(t);let checks=0;
  await assert.rejects(main(["--local"],{pending:()=>null,cwd,env:{GITLAB_TOKEN:"fixture"},verifyHead:()=>{
    if(++checks===2)throw new Error("Stale release checkout");
  },release:async()=>false,recover:async()=>assert.fail("The remote advanced before recovery")}),/Stale release checkout/);
  assert.equal(checks,2);
});
test("the default local head guard compares the selected checkout to its exact GitLab branch", async t => {
  const {main}=require("../.gitlab/scripts/publish_release.cjs");const {cwd}=publisherFixture(t,"main");
  const env={...process.env,GITLAB_TOKEN:"fixture",GIT_AUTHOR_NAME:"johninnl",GIT_AUTHOR_EMAIL:"349981574+johninnl@users.noreply.github.com",GIT_COMMITTER_NAME:"johninnl",GIT_COMMITTER_EMAIL:"349981574+johninnl@users.noreply.github.com"};
  execFileSync("git",["-c","commit.gpgsign=false","commit","--allow-empty","-m","test: source head fixture"],{cwd,env,stdio:"pipe"});
  const source=execFileSync("git",["rev-parse","HEAD"],{cwd,encoding:"utf8"}).trim();
  let remote=source;const calls=[];
  const exec=(file,args,options)=>{
    if(args[0]==="ls-remote"){
      assert.equal(file,"git");assert.equal(options.cwd,cwd);
      assert.deepEqual(args,["ls-remote","https://gitlab.com/johninnld/nl-morphe-patches.git","refs/heads/main"]);
      calls.push("remote");return `${remote}\trefs/heads/main\n`;
    }
    return execFileSync(file,args,options);
  };
  const release=async()=>{calls.push("release");return {nextRelease:{version:"1.2.4"}};};
  await main(["--local"],{pending:()=>null,cwd,env,exec,release});assert.deepEqual(calls,["remote","release"]);
  remote="b".repeat(40);calls.length=0;
  await assert.rejects(main(["--local"],{pending:()=>null,cwd,env,exec,release}),/Stale release checkout/);assert.deepEqual(calls,["remote"]);
  remote="";
  await assert.rejects(main(["--local"],{pending:()=>null,cwd,env,exec,release}),/Cannot verify the current GitLab source head/);
});
test("local SSH publication safely quotes its key and checks the same SSH remote",async t=>{
  const {main}=require("../.gitlab/scripts/publish_release.cjs"),{cwd}=publisherFixture(t,"main"),head="a".repeat(40);
  const sshUrl="git@gitlab.com:johninnld/nl-morphe-patches.git",key="/private/keys/GitLab user's identity";
  const env={GITLAB_TOKEN:"api-fixture",GITLAB_SSH_KEY:key,GIT_SSH:"inherited-ssh",GIT_SSH_COMMAND:"inherited-command",GIT_CONFIG_COUNT:"1",GIT_CONFIG_KEY_0:"http.https://other.invalid/.extraheader",GIT_CONFIG_VALUE_0:"old-header-fixture"};
  const sshEnv=value=>{
    assert.ok(value.GITLAB_TOKEN==="api-fixture","The publisher API token must remain available");
    assert.equal(value.GIT_SSH_COMMAND,"ssh -i '/private/keys/GitLab user'\\''s identity' -o IdentitiesOnly=yes -o BatchMode=yes -o StrictHostKeyChecking=yes");
    assert.equal(value.GIT_SSH_VARIANT,"ssh");assert.equal(value.GIT_CONFIG_COUNT,"0");
    assert.equal(value.GIT_SSH,undefined);assert.equal(value.GIT_CONFIG_KEY_0,undefined);assert.ok(value.GIT_CONFIG_VALUE_0===undefined,"Unrelated Git authentication must not be inherited");
  };
  const seen=[],exec=(command,args,options)=>{
    assert.equal(command,"git");
    if(args[0]==="branch")return "main\n";
    sshEnv(options.env);if(args[0]==="rev-parse")return head;
    assert.deepEqual(args,["ls-remote",sshUrl,"refs/heads/main"]);seen.push("head");return `${head}\trefs/heads/main\n`;
  };
  await main(["--local"],{pending:()=>null,cwd,env,exec,authenticate:()=>assert.fail("SSH refs must not require HTTPS Git authentication"),release:async(options,context)=>{
    assert.equal(options.repositoryUrl,sshUrl);assert.equal(options.ci,false);sshEnv(context.env);seen.push("release");return {nextRelease:{version:"1.2.4"}};
  }});
  assert.deepEqual(seen,["head","release"]);
});
test("local SSH previews retain the API token without performing a remote head lookup",async t=>{
  const {main}=require("../.gitlab/scripts/publish_release.cjs"),{cwd}=publisherFixture(t);
  await main(["--local","--dry-run"],{pending:()=>null,cwd,env:{GITLAB_SSH_KEY:"/private/key",GITLAB_TOKEN:"api-fixture"},verifyHead:()=>assert.fail("A preview must not publish"),release:async(options,context)=>{
    assert.equal(options.repositoryUrl,"git@gitlab.com:johninnld/nl-morphe-patches.git");assert.equal(options.dryRun,true);
    assert.ok(context.env.GITLAB_TOKEN==="api-fixture","Preview API authentication must remain available");assert.equal(context.env.GIT_SSH_VARIANT,"ssh");return false;
  },recover:()=>assert.fail("A preview must never recover")});
});
test("hosted runs keep HTTPS Git authentication even when a local key path is present",async t=>{
  const {main}=require("../.gitlab/scripts/publish_release.cjs"),{cwd}=publisherFixture(t);let authenticated=false;
  await main([],{pending:()=>null,cwd,env:{GITLAB_SSH_KEY:"/private/key",GITLAB_TOKEN:"api-fixture"},verifyHead:()=>{},authenticate:env=>{authenticated=true;return env;},release:async(options,context)=>{
    assert.equal(options.repositoryUrl,"https://gitlab.com/johninnld/nl-morphe-patches.git");assert.equal(options.ci,undefined);assert.equal(context.env.GIT_SSH_COMMAND,undefined);return {nextRelease:{version:"1.2.4"}};
  }});assert.equal(authenticated,true);
});
test("invalid local SSH key paths fail before any publication or remote check",async t=>{
  const {main}=require("../.gitlab/scripts/publish_release.cjs"),{cwd}=publisherFixture(t);
  for(const key of ["relative-key","/private/key\0invalid"]){
    await assert.rejects(main(["--local"],{pending:()=>null,cwd,env:{GITLAB_TOKEN:"api-fixture",GITLAB_SSH_KEY:key},verifyHead:()=>assert.fail("Invalid SSH path must not reach the remote"),release:()=>assert.fail("Invalid SSH path must not publish")}),/SSH key path/);
  }
});

function holdFixture(t) {
  const root=fs.mkdtempSync(path.join(os.tmpdir(),"gitlab-release-hold-"));t.after(()=>fs.rmSync(root,{recursive:true,force:true}));
  const remote=path.join(root,"remote.git"),cwd=path.join(root,"work");
  const env={...process.env,GIT_AUTHOR_NAME:"johninnl",GIT_AUTHOR_EMAIL:"349981574+johninnl@users.noreply.github.com",GIT_COMMITTER_NAME:"johninnl",GIT_COMMITTER_EMAIL:"349981574+johninnl@users.noreply.github.com",GIT_CONFIG_NOSYSTEM:"1"};
  const git=(dir,...args)=>execFileSync("git",args,{cwd:dir,env,encoding:"utf8",stdio:["pipe","pipe","pipe"]}).trim();
  execFileSync("git",["init","--bare","-b","main",remote],{env,stdio:"pipe"});
  fs.mkdirSync(cwd);git(cwd,"init","-b","main");git(cwd,"config","commit.gpgsign","false");
  const commit=(message,files)=>{for(const [name,text] of Object.entries(files)){fs.mkdirSync(path.dirname(path.join(cwd,name)),{recursive:true});fs.writeFileSync(path.join(cwd,name),text);}git(cwd,"add","-A");git(cwd,"commit","-q","-m",message);return git(cwd,"rev-parse","HEAD");};
  return {cwd,remote,env,git,commit};
}
test("the release commit keeps the metadata local and only promotion moves main", async t => {
  const {cwd,remote,env,git,commit}=holdFixture(t);
  const source=commit("feat(Gboard): source change",{"patches-list.json":"{}\n","src.kt":"a\n"});
  git(cwd,"push","-q",remote,"HEAD:refs/heads/main");
  fs.writeFileSync(path.join(cwd,"patches-list.json"),"{\"version\":\"1.2.3\"}\n");
  fs.writeFileSync(path.join(cwd,"scratch.txt"),"not a release asset\n");
  // A real release workspace holds far more untracked build output than a 1 MB pipe buffer.
  fs.mkdirSync(path.join(cwd,"build"));for(let i=0;i<20000;i++)fs.writeFileSync(path.join(cwd,"build",`output-${"x".repeat(40)}-${i}.class`),"");
  const {prepare}=require("../.gitlab/scripts/release_commit.cjs");const logs=[];
  await prepare({assets:["patches-list.json","README.md"],message:"chore: Release v${nextRelease.version} [skip ci]\n\n${nextRelease.notes}"},
    {cwd,env,branch:{name:"main"},lastRelease:{},nextRelease:{version:"1.2.3",gitTag:"v1.2.3",notes:"Notes."},logger:{log:(...a)=>logs.push(a)}});
  const release=git(cwd,"rev-parse","HEAD");
  assert.equal(git(cwd,"log","-1","--format=%s"),"chore: Release v1.2.3 [skip ci]");
  assert.deepEqual(git(cwd,"diff-tree","--no-commit-id","--name-only","-r","HEAD").split("\n"),["patches-list.json"]);
  assert.equal(git(remote,"rev-parse","main"),source,"preparing must not push the branch");
  await assert.rejects(prepare({assets:["patches-*.json"],message:"m"},{cwd,env,branch:{name:"main"},lastRelease:{},nextRelease:{notes:""},logger:{log(){}}}),/plain file paths/);
  const {promote}=require("../.gitlab/scripts/promote_main.cjs");
  assert.deepEqual(promote({repositoryUrl:remote,branch:"main",release,cwd,env}),{promoted:true,head:release});
  assert.equal(git(remote,"rev-parse","main"),release);
  assert.deepEqual(promote({repositoryUrl:remote,branch:"main",release,cwd,env}),{promoted:false,head:release});
  const next=commit("chore: Release v1.2.4 [skip ci]",{"patches-list.json":"{\"version\":\"1.2.4\"}\n"});
  git(cwd,"push","-q",remote,`${source}:refs/heads/main`,"--force");
  assert.throws(()=>promote({repositoryUrl:remote,branch:"main",release:next,cwd,env}),/moved during the release/);
});
test("a release tagged but never promoted is found and finished instead of released again", async t => {
  const {cwd,remote,env,git,commit}=holdFixture(t);
  const source=commit("feat(Gboard): source change",{"src.kt":"a\n",".releaserc":fs.readFileSync(path.join(__dirname,"../.releaserc"),"utf8"),"patches-list.json":"{\"old\":true}\n"});git(cwd,"push","-q",remote,"HEAD:refs/heads/main");
  const release=commit("chore: Release v1.2.3 [skip ci]",{"patches-list.json":"{}\n"});git(cwd,"tag","v1.2.3");
  git(cwd,"push","-q",remote,"refs/tags/v1.2.3");
  const other=commit("feat(Gboard): not a release",{"src.kt":"b\n"});git(cwd,"tag","v9.9.9");git(cwd,"push","-q",remote,"refs/tags/v9.9.9");
  git(cwd,"checkout","-q","--detach",source);
  const {findPendingRelease,main}=require("../.gitlab/scripts/publish_release.cjs");
  assert.deepEqual(findPendingRelease({cwd,env,repositoryUrl:remote}),{tag:"v1.2.3",commit:release});
  git(cwd,"checkout","-q","--detach",release);assert.equal(findPendingRelease({cwd,env,repositoryUrl:remote}),null);
  assert.ok(other);
  git(cwd,"checkout","-q","-B","main",source);
  // Verification regenerates release-owned files in the release workspace before publication.
  fs.writeFileSync(path.join(cwd,"patches-list.json"),"{\"regenerated\":true}\n");
  const calls=[];
  const outcome=await main(["--local"],{cwd,env:{...env,GITLAB_TOKEN:"fixture"},verifyHead:()=>calls.push("head"),
    pending:()=>findPendingRelease({cwd,env,repositoryUrl:remote}),
    release:async()=>assert.fail("A pending release must not be released again"),
    recover:async branch=>{calls.push("recover");assert.equal(git(cwd,"rev-parse","HEAD"),release);assert.match(git(cwd,"tag","--points-at","HEAD"),/v1\.2\.3/);return {version:"1.2.3",branch};},
    promoteBranch:options=>{calls.push("promote");assert.equal(options.release,release);assert.equal(options.branch,"main");}});
  assert.deepEqual(calls,["head","recover","promote"]);
  assert.deepEqual(outcome,{version:"1.2.3",branch:"main"});
});
test("source commits may not carry release-owned metadata ahead of their release", t => {
  const {releaseOwnedFiles,releaseOwnedChanges,verifyUnpublishedCommits}=require("../.gitlab/scripts/release_owned.cjs");
  const owned=releaseOwnedFiles();
  for(const file of ["patches-bundle.json","patches-list.json","README.md","CHANGELOG.md","docs/site/en/reference/catalogue.md"])assert.ok(owned.includes(file),file);
  const {cwd,env,git,commit}=holdFixture(t);
  const base=commit("chore: Release v1.0.0 [skip ci]",{"patches-list.json":"{}\n"});
  commit("feat(Gboard): editorial docs only",{"docs/site/en/apps/gboard.md":"x\n"});
  assert.deepEqual(verifyUnpublishedCommits({cwd,env,base,owned}),{checked:true});
  const bad=commit("feat(Gboard): also regenerated the list",{"patches-list.json":"{\"a\":1}\n","src.kt":"a\n"});
  commit("chore: Release v1.1.0 [skip ci]",{"patches-list.json":"{\"b\":1}\n"});
  assert.deepEqual(releaseOwnedChanges(`${base}..HEAD`,{cwd,env,owned}).map(c=>[c.hash,c.files]),[[bad,["patches-list.json"]]]);
  assert.throws(()=>verifyUnpublishedCommits({cwd,env,base,owned}),/must not change release-owned files/);
  assert.equal(verifyUnpublishedCommits({cwd,env,base:"f".repeat(40),owned}).checked,false);
  assert.equal(verifyUnpublishedCommits({cwd,env,base:"",owned}).checked,false);
  assert.ok(git(cwd,"rev-parse","HEAD"));
});

test("bundle downloads wait out rate limits and server errors but not other failures", async () => {
  const {download}=require("../.gitlab/scripts/bundle.cjs");const {bytes}=signedFixture();
  const pauses=[];const pause=async ms=>{pauses.push(ms);};
  let calls=0;
  const flaky=async()=>(++calls<3?{ok:false,status:calls===1?429:503,headers:{get:name=>name==="retry-after"&&calls===1?"45":null}}:{ok:true,arrayBuffer:async()=>bytes});
  assert.deepEqual(await download("https://gitlab.com/asset",bytes.length,flaky,{pause}),bytes);
  assert.deepEqual(pauses,[45000,60000]);
  calls=0;await assert.rejects(download("https://gitlab.com/asset",bytes.length,async()=>{calls++;return {ok:false,status:404,headers:{get:()=>null}};},{pause}),/HTTP 404/);assert.equal(calls,1);
  calls=0;await assert.rejects(download("https://gitlab.com/asset",bytes.length,async()=>{calls++;return {ok:false,status:429,headers:{get:()=>"1"}};},{pause,attempts:3}),/HTTP 429/);assert.equal(calls,3);
});
