"use strict";
const test = require("node:test");
const assert = require("node:assert/strict");
const fs = require("node:fs");
const os = require("node:os");
const path = require("node:path");
const {execFileSync} = require("node:child_process");
const {runFlow, templates, cleanupWorkspace, cleanupPages, readConfig, command, pruneEvidence, workspaceQuiescent, pagesInvocation, ensureApiCredentials} = require("../scripts/local-release/flow.cjs");
const identity = {GIT_AUTHOR_NAME:"johninnl",GIT_AUTHOR_EMAIL:"349981574+johninnl@users.noreply.github.com",GIT_COMMITTER_NAME:"johninnl",GIT_COMMITTER_EMAIL:"349981574+johninnl@users.noreply.github.com"};
// The native workspace proof scans every process of this user. Runs use a recorded
// stand-in by default, so ordinary flow tests do not depend on unrelated machine
// activity; nativeScan:true keeps the real proof for the held-workspace tests.
function fixture(t,{nativeScan=false}={}) {
  const root=fs.mkdtempSync(path.join(os.tmpdir(),"local-release-test-"));
  t.after(()=>fs.rmSync(root,{recursive:true,force:true}));
  const source=path.join(root,"source"),remote=path.join(root,"remote.git"),stateDir=path.join(root,"state");
  fs.mkdirSync(source);
  function git(args,cwd=source){return execFileSync("git",args,{cwd,env:{...process.env,...identity},encoding:"utf8",stdio:["ignore","pipe","pipe"]}).trim();}
  git(["init","-b","main"]);
  for(const file of ["scripts/local-release/verify.cjs","scripts/local-release/mirrors.cjs","scripts/local-release/pages.cjs","scripts/local-release/pages-job.cjs",".gitlab/scripts/publish_release.cjs",".gitlab/scripts/discovery.cjs"]){fs.mkdirSync(path.dirname(path.join(source,file)),{recursive:true});fs.writeFileSync(path.join(source,file),"// admitted test fixture --local --dry-run\n");}
  fs.writeFileSync(path.join(source,"scripts/local-release/templates.json"),JSON.stringify(templates));
  fs.writeFileSync(path.join(source,".releaserc"),JSON.stringify({branches:["main"]}));
  function commit(label){fs.writeFileSync(path.join(source,"fixture.txt"),label);git(["add","."]);git(["commit","-m",label]);return git(["rev-parse","HEAD"]);}
  const initial=commit("initial");git(["clone","--bare",source,remote]);
  function advance(branch,label){git(["checkout",branch]);const sha=commit(label);git(["fetch",source,`+refs/heads/${branch}:refs/heads/${branch}`],remote);return sha;}
  const calls=[];
  const dependencies={allowLocalRemote:true,verifyIdentity:async ctx=>calls.push(["identity",ctx.branch]),verify:async ctx=>calls.push(["verify",ctx.branch]),publish:async ctx=>{calls.push(["publish",ctx.branch,ctx.publish]);return ctx.publish?{version:"1.0.1",branch:ctx.branch}:{published:false,preview:true};},discover:async ctx=>calls.push(["discover",ctx.branch]),mirrorPreflight:async ctx=>calls.push(["mirror-preflight",ctx.branch]),mirrors:async ctx=>{calls.push(["mirrors",ctx.branch]);return {targets:[{target:"codeberg",verified:true},{target:"gitgud",verified:true}]};},cleanupPages:async()=>({cleanupRequired:false}),pages:async ctx=>{calls.push(["pages",ctx.branch]);return {verified:true,status:"verified"};},bootstrap:async()=>{}};
  if(!nativeScan)dependencies.cleanupWorkspace=args=>cleanupWorkspace({...args,quiescent:()=>true});
  const config={stateDir,remoteUrl:remote};
  return {root,source,remote,stateDir,git,advance,initial,calls,dependencies,config};
}
function options(f,more={}){return {config:f.config,dependencies:f.dependencies,...more};}

test("templates admit only the stable main channel",()=>{
  assert.deepEqual(Object.keys(templates),["main"]);
  assert.equal(templates.main.prerelease,false);
});
test("initial watcher baselines the observed head without executing verification/publication",async t=>{
  const f=fixture(t);const result=await runFlow(options(f,{watchOnce:true}));
  assert.equal(result.status,"baselined");assert.equal(f.calls.length,0);
  assert.equal(JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.observed,f.initial);
});
test("watcher publishes changed approved heads, verifies discovery and removes successful workspace only",async t=>{
  const f=fixture(t);await runFlow(options(f,{watchOnce:true}));
  const original=f.git(["rev-parse","HEAD"]);const sha=f.advance("main","fix: changed main");
  const result=await runFlow(options(f,{watchOnce:true}));
  assert.equal(result.runs[0].head,sha);assert.equal(result.runs[0].status,"published");
  assert.deepEqual(f.calls.map(row=>row[0]),["identity","mirror-preflight","verify","publish","discover","mirrors","pages"]);
  assert.equal(fs.existsSync(result.runs[0].workspace),false);
  assert.equal(fs.existsSync(result.runs[0].receipt),true);
  assert.equal(f.git(["status","--porcelain"]),"");assert.notEqual(original,sha);
  assert.equal((await runFlow(options(f,{watchOnce:true}))).runs.length,0);
});
test("one-shot defaults to preview without publication",async t=>{
  const f=fixture(t);const result=await runFlow(options(f,{branch:"main"}));
  assert.equal(result.runs[0].status,"preview");assert.deepEqual(f.calls.find(row=>row[0]==="publish"),["publish","main",false]);
  assert.equal(f.calls.some(row=>row[0]==="discover"),false);
});
test("no-release completion skips discovery and cleans its owned worktree",async t=>{
  const f=fixture(t);f.dependencies.publish=async()=>({published:false});
  const result=await runFlow(options(f,{branch:"main",publish:true}));
  assert.equal(result.runs[0].status,"no-release");assert.equal(fs.existsSync(result.runs[0].workspace),false);
});
for(const stage of ["verifyIdentity","mirrorPreflight","verify","publish","discover","mirrors","pages"]){
  test(`${stage} failure cleans workspace and unchanged failed head needs explicit retry`,async t=>{
    const f=fixture(t);await runFlow(options(f,{watchOnce:true}));f.advance("main","fix: candidate");
    const original=f.dependencies[stage];f.dependencies[stage]=async()=>{throw new Error("controlled failure");};
    await assert.rejects(runFlow(options(f,{watchOnce:true})),/controlled failure/);
    const state=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json")));const failed=state.branches.main.failed;
    assert.ok(failed.head);assert.equal(fs.existsSync(failed.workspace),false);assert.equal(fs.existsSync(failed.receipt),true);
    assert.equal((await runFlow(options(f,{watchOnce:true}))).runs.length,0);
    f.dependencies[stage]=original;
    const retried=await runFlow(options(f,{watchOnce:true,retryFailed:true}));assert.equal(retried.runs.length,1);
    assert.equal(fs.existsSync(failed.workspace),false);assert.equal(fs.existsSync(failed.receipt),true,"Retry preserves diagnostic receipts");
  });
}
test("a newer head proceeds after failed checkout cleanup while retaining its receipt",async t=>{
  const f=fixture(t);f.dependencies.verify=async()=>{throw new Error("failed head");};
  await assert.rejects(runFlow(options(f,{branch:"main",publish:true})),/failed head/);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed;
  assert.equal(fs.existsSync(failure.workspace),false);const oldReceipt=fs.readFileSync(failure.receipt,"utf8");
  f.advance("main","fix: newer candidate");f.dependencies.verify=async()=>{};
  await runFlow(options(f,{branch:"main",publish:true}));
  assert.equal(fs.readFileSync(failure.receipt,"utf8"),oldReceipt);
});
test("arbitrary branches and stale requested heads are refused",async t=>{
  const f=fixture(t);await assert.rejects(runFlow(options(f,{branch:"feature"})),/main.*dev/);
  await assert.rejects(runFlow(options(f,{branch:"main",head:"a".repeat(40)})),/stale|current remote/i);
  assert.equal(f.calls.length,0);
});
test("remote movement after verification refuses publication and cleans checkout",async t=>{
  const f=fixture(t);f.dependencies.verify=async()=>{f.advance("main","fix: raced source");};
  await assert.rejects(runFlow(options(f,{branch:"main",publish:true})),/stale|changed|current remote/i);
  assert.equal(f.calls.some(row=>row[0]==="publish"),false);
});
test("lock refuses concurrent invocation without touching its owner",async t=>{
  const f=fixture(t);await runFlow(options(f,{watchOnce:true}));fs.mkdirSync(path.join(f.stateDir,"lock"));
  await assert.rejects(runFlow(options(f,{branch:"main"})),/locked|running/i);
  assert.equal(fs.existsSync(path.join(f.stateDir,"lock")),true);
});
test("cleanup refuses unowned paths, including the source checkout",async t=>{
  const f=fixture(t);await runFlow(options(f,{watchOnce:true}));
  await assert.rejects(cleanupWorkspace({stateDir:f.stateDir,workspace:f.source}),/owned|workspace/);
  assert.equal(fs.existsSync(path.join(f.source,"fixture.txt")),true);
});
test("approved source must include matching templates before baselining",async t=>{
  const f=fixture(t);fs.unlinkSync(path.join(f.source,"scripts/local-release/templates.json"));f.git(["add","."]);f.git(["commit","-m","broken template"]);f.git(["fetch",f.source,"+refs/heads/main:refs/heads/main"],f.remote);
  await assert.rejects(runFlow(options(f,{watchOnce:true})),/template|local.release/);
  assert.equal(fs.existsSync(path.join(f.stateDir,"state.json")),false);
});
test("private configuration refuses exposed permissions and never embeds file secrets in receipts",async t=>{
  const f=fixture(t);const file=path.join(f.root,"config.json");fs.writeFileSync(file,JSON.stringify(f.config),{mode:0o644});
  assert.throws(()=>readConfig(file),/private|permission/);fs.chmodSync(file,0o600);assert.equal(readConfig(file).stateDir,f.stateDir);
  const secret=path.join(f.root,"secret");fs.writeFileSync(secret,"MORPHE_SIGNING_KEY=private-test-seed\n",{mode:0o600});f.config.secretFiles={MORPHE_SIGNING_KEY:secret};
  f.dependencies.verify=async context=>{assert.equal(context.env.MORPHE_SIGNING_KEY,"private-test-seed");throw new Error("leaked private-test-seed");};
  await assert.rejects(runFlow(options(f,{branch:"main"})),error=>!error.message.includes("private-test-seed"));
  const all=fs.readdirSync(path.join(f.stateDir,"runs"));for(const id of all)assert.equal(fs.readFileSync(path.join(f.stateDir,"runs",id,"receipt.json"),"utf8").includes("private-test-seed"),false);
});

test("preview does not consume a changed watcher head",async t=>{
  const f=fixture(t);await runFlow(options(f,{watchOnce:true}));f.advance("main","fix: previewed candidate");
  await runFlow(options(f,{branch:"main"}));
  assert.equal((await runFlow(options(f,{watchOnce:true}))).runs.length,1);
});

test("raw base64 signing seeds retain padding and expected assignment wrappers parse",async t=>{
  const f=fixture(t);const raw="a".repeat(43)+"=";const secret=path.join(f.root,"signing-seed");
  fs.writeFileSync(secret,raw+"\n",{mode:0o600});f.config.secretFiles={MORPHE_SIGNING_KEY:secret};
  f.dependencies.verify=async context=>assert.equal(context.env.MORPHE_SIGNING_KEY,raw);
  await runFlow(options(f,{branch:"main"}));
  fs.writeFileSync(secret,"export MORPHE_SIGNING_KEY=\""+raw+"\"\n");
  await runFlow(options(f,{branch:"main"}));
});

test("returning to an older failed SHA still requires explicit retry",async t=>{
  const f=fixture(t);await runFlow(options(f,{watchOnce:true}));const bad=f.advance("main","fix: failed candidate");
  f.dependencies.verify=async()=>{throw new Error("failed candidate");};await assert.rejects(runFlow(options(f,{watchOnce:true})),/failed candidate/);
  f.advance("main","fix: newer successful candidate");f.dependencies.verify=async()=>{};await runFlow(options(f,{watchOnce:true}));
  f.git(["update-ref","refs/heads/main",bad],f.remote);
  assert.equal((await runFlow(options(f,{watchOnce:true}))).runs.length,0);
  assert.equal((await runFlow(options(f,{watchOnce:true,retryFailed:true}))).runs.length,1);
});

test("watcher consumes its own generated release head without swallowing a concurrent push",async t=>{
  const f=fixture(t);await runFlow(options(f,{watchOnce:true}));f.advance("main","fix: release candidate");
  let generated;
  f.dependencies.publish=async context=>{
    fs.writeFileSync(path.join(context.workspace,"generated.txt"),"release metadata");f.git(["add","."],context.workspace);f.git(["commit","-m","chore: Release v1.0.1"],context.workspace);
    generated=f.git(["rev-parse","HEAD"],context.workspace);f.git(["fetch",context.workspace,"+refs/heads/main:refs/heads/main"],f.remote);
    return {version:"1.0.1",branch:"main"};
  };
  await runFlow(options(f,{watchOnce:true}));
  assert.equal(JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.observed,generated);
  assert.equal((await runFlow(options(f,{watchOnce:true}))).runs.length,0);
  f.advance("main","fix: concurrent candidate");
  let concurrent;
  f.dependencies.publish=async()=>{concurrent=f.advance("main","fix: concurrent push");return {version:"1.0.2",branch:"main"};};
  await runFlow(options(f,{watchOnce:true}));
  assert.notEqual(JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.observed,concurrent);
});

test("partial mirror failure retains both target outcomes and fences its generated release head",async t=>{
  const f=fixture(t);await runFlow(options(f,{watchOnce:true}));f.advance("main","fix: mirrored release");let generated;
  f.dependencies.publish=async context=>{
    fs.writeFileSync(path.join(context.workspace,"generated.txt"),"canonical release metadata");f.git(["add","."],context.workspace);f.git(["commit","-m","chore: Release v1.0.1"],context.workspace);
    generated=f.git(["rev-parse","HEAD"],context.workspace);f.git(["fetch",context.workspace,"+refs/heads/main:refs/heads/main"],f.remote);return {version:"1.0.1",branch:"main"};
  };
  f.dependencies.mirrors=async context=>{context.mirrorResults={targets:[{target:"codeberg",verified:true},{target:"gitgud",verified:false}]};throw Error("one mirror failed");};
  await assert.rejects(runFlow(options(f,{watchOnce:true})),/one mirror failed/);
  const state=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json")));assert.equal(state.branches.main.observed,generated);assert.ok(state.branches.main.failures[generated]);
  const receipt=JSON.parse(fs.readFileSync(state.branches.main.failed.receipt));assert.equal(receipt.mirrors.targets.length,2);assert.equal(fs.existsSync(receipt.workspace),false);assert.equal(receipt.workspaceRemoved,true);
  assert.equal(state.branches.main.pendingMirror.head,generated);
  assert.equal((await runFlow(options(f,{watchOnce:true}))).runs.length,0);
});

function publishGenerated(f,store){
  f.dependencies.publish=async context=>{
    fs.writeFileSync(path.join(context.workspace,"generated.txt"),"canonical release metadata "+Date.now());f.git(["add","."],context.workspace);f.git(["commit","-m","chore: Release v1.0.1"],context.workspace);
    store.generated=f.git(["rev-parse","HEAD"],context.workspace);f.git(["fetch",context.workspace,"+refs/heads/main:refs/heads/main"],f.remote);return {version:"1.0.1",branch:"main"};
  };
}
test("a published release with a failed mirror retries only the mirror after backoff and then completes",async t=>{
  const f=fixture(t);await runFlow(options(f,{watchOnce:true}));const source=f.advance("main","fix: mirrored release"),store={};publishGenerated(f,store);
  f.dependencies.mirrors=async context=>{context.mirrorResults={targets:{codeberg:{status:"rejected",error:"codeberg GET /user: network failure (UND_ERR_SOCKET)"}}};throw new Error("mirror network failure");};
  let clock=Date.parse("2026-11-12T20:00:00Z");const now=()=>clock;
  await assert.rejects(runFlow(options(f,{watchOnce:true,now})),/mirror network failure/);
  let state=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json")));const pending=state.branches.main.pendingMirror;
  assert.equal(pending.head,store.generated);assert.equal(pending.sourceHead,source);assert.equal(pending.version,"1.0.1");assert.equal(pending.attempts,0);
  assert.deepEqual(pending.publication,{version:"1.0.1",branch:"main"});assert.equal(Date.parse(pending.nextAttempt),clock+2*60000);
  assert.equal((await runFlow(options(f,{watchOnce:true,now}))).runs.length,0,"Not due before its backoff");
  clock+=2*60000;f.calls.length=0;let staged;
  f.dependencies.mirrors=async context=>{staged=JSON.parse(fs.readFileSync(path.join(context.workspace,"build/release-safety/gitlab-result.json")));f.calls.push(["mirrors",context.branch]);return {complete:true,targets:{codeberg:{status:"fulfilled"}}};};
  const result=await runFlow(options(f,{watchOnce:true,now}));
  assert.equal(result.runs.length,1);assert.equal(result.runs[0].status,"mirrored");assert.equal(result.runs[0].head,store.generated);assert.equal(result.runs[0].mirrorRetry.attempt,1);
  assert.deepEqual(f.calls,[["identity","main"],["mirrors","main"]],"Mirror retry never re-verifies, rebuilds or republishes");
  assert.deepEqual(staged,{version:"1.0.1",branch:"main"});assert.equal(fs.existsSync(result.runs[0].workspace),false);
  state=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json")));
  assert.equal(state.branches.main.pendingMirror,undefined);assert.equal(state.branches.main.failures?.[source],undefined);assert.equal(state.branches.main.failures?.[store.generated],undefined);
  assert.equal(state.branches.main.failed,undefined);assert.equal(state.branches.main.succeeded,source);assert.equal(state.branches.main.mirrored.version,"1.0.1");
  clock+=24*3600000;assert.equal((await runFlow(options(f,{watchOnce:true,now}))).runs.length,0,"Nothing left to retry");
});
test("failed mirror retries keep backing off without an attempt limit and are not raised",async t=>{
  const f=fixture(t);await runFlow(options(f,{watchOnce:true}));f.advance("main","fix: release");const store={};publishGenerated(f,store);
  let attempts=0;f.dependencies.mirrors=async()=>{attempts++;throw new Error("codeberg POST /repos/x/releases: network failure (ECONNRESET)");};
  let clock=Date.parse("2026-11-12T20:00:00Z");const now=()=>clock;
  await assert.rejects(runFlow(options(f,{watchOnce:true,now})));
  const delays=[2,4,8,16,32,60,60,60];
  for(let index=0;index<delays.length;index++){
    const state=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.pendingMirror;
    clock=Date.parse(state.nextAttempt);
    const result=await runFlow(options(f,{watchOnce:true,now}));
    assert.equal(result.runs.length,1);assert.equal(result.runs[0].status,"failed");assert.equal(result.runs[0].cleanupRequired,false);
    const next=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.pendingMirror;
    assert.equal(next.attempts,index+1);assert.equal(Date.parse(next.nextAttempt)-clock,delays[index+1>=delays.length?delays.length-1:index+1]*60000);
    assert.match(next.lastError,/network failure \(ECONNRESET\)/);
  }
  assert.equal(attempts,delays.length+1);
});
test("a newer head supersedes a pending mirror and releases normally",async t=>{
  const f=fixture(t);await runFlow(options(f,{watchOnce:true}));f.advance("main","fix: first");const store={};publishGenerated(f,store);
  f.dependencies.mirrors=async()=>{throw new Error("mirror network failure");};
  let clock=Date.parse("2026-11-12T20:00:00Z");const now=()=>clock;
  await assert.rejects(runFlow(options(f,{watchOnce:true,now})));
  f.dependencies.mirrors=async ctx=>{f.calls.push(["mirrors",ctx.branch]);return {complete:true,targets:{}};};f.dependencies.publish=async ctx=>{f.calls.push(["publish",ctx.branch,ctx.publish]);return {version:"1.0.2",branch:"main"};};
  const newer=f.advance("main","fix: second");f.calls.length=0;clock+=60000;
  const result=await runFlow(options(f,{watchOnce:true,now}));
  assert.equal(result.runs.length,1);assert.equal(result.runs[0].head,newer);assert.equal(result.runs[0].status,"published");
  assert.ok(f.calls.some(call=>call[0]==="verify"),"The newer head runs the complete release");
  const state=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main;
  assert.equal(state.pendingMirror,undefined);assert.equal(state.supersededMirror.head,store.generated);assert.equal(state.supersededMirror.version,"1.0.1");
});
test("failed jobs archive compact safety JSON and mirror outcomes before cleanup",async t=>{
  const f=fixture(t);f.dependencies.verify=async context=>{
    const safety=path.join(context.workspace,"build/release-safety");fs.mkdirSync(safety,{recursive:true});fs.writeFileSync(path.join(safety,"partial.json"),JSON.stringify({passed:false,stage:"controlled"}));
    context.mirrorResults={targets:[{target:"codeberg",verified:false}]};throw new Error("verification original error");
  };
  await assert.rejects(runFlow(options(f,{branch:"main"})),/verification original error/);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed;
  const receipt=JSON.parse(fs.readFileSync(failure.receipt));assert.equal(receipt.workspaceRemoved,true);assert.equal(receipt.cleanupRequired,false);assert.equal(receipt.mirrors.targets.length,1);
  assert.deepEqual(JSON.parse(fs.readFileSync(path.join(path.dirname(failure.receipt),"safety/partial.json"))),{passed:false,stage:"controlled"});
});

test("cleanup failure preserves original error and explicitly requires cleanup",async t=>{
  const f=fixture(t);f.dependencies.verify=async()=>{throw new Error("original verification failure");};f.dependencies.cleanupWorkspace=async()=>{throw new Error("controlled cleanup failure");};
  await assert.rejects(runFlow(options(f,{branch:"main"})),/original verification failure.*controlled cleanup failure/);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed;const receipt=JSON.parse(fs.readFileSync(failure.receipt));
  assert.equal(receipt.status,"failed");assert.equal(receipt.cleanupRequired,true);assert.equal(receipt.workspaceRemoved,false);assert.match(receipt.failure,/original verification failure/);assert.equal(fs.existsSync(receipt.workspace),true);
});

test("owned command timeout quiesces its child group before failed workspace cleanup",async t=>{
  const f=fixture(t);const pidFile=path.join(f.root,"child.pid");
  f.dependencies.verify=async context=>command(context,"controlled-timeout",[process.execPath,"-e",`const {spawn}=require('node:child_process');const fs=require('node:fs');const child=spawn(process.execPath,['-e','process.on(\"SIGTERM\",()=>{});setInterval(()=>{},1000)'],{stdio:'ignore'});process.on('SIGTERM',()=>{});fs.writeFileSync(${JSON.stringify(pidFile)},String(child.pid));setInterval(()=>{},1000);`],{timeoutMs:1000,stopTimeoutMs:200});
  await assert.rejects(runFlow(options(f,{branch:"main"})),/timed out/);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed;const receipt=JSON.parse(fs.readFileSync(failure.receipt));
  assert.equal(receipt.cleanupRequired,false);assert.equal(receipt.workspaceRemoved,true);assert.equal(fs.existsSync(receipt.workspace),false);
  const pid=Number(fs.readFileSync(pidFile,"utf8"));
  try {process.kill(pid,0);const status=execFileSync("ps",["-p",String(pid),"-o","stat="],{encoding:"utf8"}).trim();assert.match(status,/^Z/,"Owned child still runs after timeout cleanup");}catch(error){if(error.code!=="ESRCH")throw error;}
});

test("a held workspace keeps its named reason and blocks, then a watch tick sweeps it once free",async t=>{
  const cleanups=[],f=fixture({after:callback=>cleanups.push(callback)},{nativeScan:true}),pidFile=path.join(f.root,"detached.pid");let pid;
  t.after(()=>{if(pid)try{process.kill(-pid,"SIGKILL");}catch{}for(const cleanup of cleanups)cleanup();});
  f.config.environment={HOME:f.root};
  await runFlow(options(f,{watchOnce:true}));
  f.dependencies.verify=async context=>{
    const nested=path.join(context.workspace,"nested");fs.mkdirSync(nested);
    const code=`const fs=require('node:fs'),{spawn}=require('node:child_process');const child=spawn(process.execPath,['-e','setInterval(()=>{},1000)'],{detached:true,stdio:'ignore',cwd:${JSON.stringify(nested)}});fs.writeFileSync(${JSON.stringify(pidFile)},String(child.pid));child.unref();`;
    const {spawn}=require('node:child_process');const outer=spawn(process.execPath,['-e',code],{detached:true,stdio:'ignore'});outer.unref();await new Promise(resolve=>setTimeout(resolve,300));pid=Number(fs.readFileSync(pidFile,'utf8'));
    context.processGroups=[{id:123456,stage:"controlled",quiescent:false}];throw new Error("original active-group failure");
  };
  await assert.rejects(runFlow(options(f,{branch:"main"})),/original active-group failure/);
  const state=()=>JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json")));
  const failure=state().branches.main.failed;
  await assert.rejects(runFlow(options(f,{branch:"main"})),/requires explicit.*cleanup/);
  await assert.rejects(runFlow(options(f,{watchOnce:true})),/requires explicit.*cleanup/);
  const held=state().branches.main.failures[failure.head];
  assert.ok(held.cleanupReason,"A held workspace keeps its named reason for the operator");
  process.kill(-pid,"SIGKILL");await new Promise(resolve=>setTimeout(resolve,300));
  const result=await runFlow(options(f,{watchOnce:true}));
  assert.equal(result.status,"complete");
  const entry=state().branches.main.failures[failure.head];
  assert.equal(entry.cleanupRequired,false);assert.equal(entry.cleanupResolution,"workspace cleanup completed");
  const receipt=JSON.parse(fs.readFileSync(failure.receipt));
  assert.equal(receipt.cleanupRequired,false);assert.equal(receipt.workspaceRemoved,true);
});
test("a watch tick resolves pending cleanup once the workspace is already gone",async t=>{
  const f=fixture(t);await runFlow(options(f,{watchOnce:true}));
  f.dependencies.verify=async context=>{context.processGroups=[{id:123456,stage:"controlled",quiescent:false}];throw new Error("original active-group failure");};
  await assert.rejects(runFlow(options(f,{branch:"main"})),/original active-group failure/);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed;
  fs.rmSync(failure.workspace,{recursive:true,force:true});
  const result=await runFlow(options(f,{watchOnce:true}));
  assert.equal(result.status,"complete");
  const state=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json")));
  const entry=state.branches.main.failures[failure.head];
  assert.equal(entry.cleanupRequired,false);assert.equal(entry.cleanupResolution,"workspace already absent");assert.ok(entry.cleanupResolvedAt);
  const receipt=JSON.parse(fs.readFileSync(failure.receipt));
  assert.equal(receipt.cleanupRequired,false);assert.equal(receipt.cleanupResolution,"workspace already absent");
});
test("a watch tick sweeps a present quiescent workspace and proceeds",async t=>{
  const f=fixture(t);await runFlow(options(f,{watchOnce:true}));
  f.dependencies.verify=async context=>{context.processGroups=[{id:123456,stage:"controlled",quiescent:false}];throw new Error("original active-group failure");};
  await assert.rejects(runFlow(options(f,{branch:"main"})),/original active-group failure/);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed;
  assert.equal(fs.existsSync(failure.workspace),true);
  const result=await runFlow(options(f,{watchOnce:true}));
  assert.equal(result.status,"complete");
  assert.equal(fs.existsSync(failure.workspace),false);
  const receipt=JSON.parse(fs.readFileSync(failure.receipt));
  assert.equal(receipt.cleanupRequired,false);assert.equal(receipt.workspaceRemoved,true);assert.equal(receipt.cleanupResolution,"workspace cleanup completed");
});

test("normal owned commands retain final diagnostic output before cleanup",async t=>{
  const f=fixture(t);f.dependencies.verify=async context=>command(context,"diagnostic-command",[process.execPath,"-e","console.log('final diagnostic line')"]);
  const result=await runFlow(options(f,{branch:"main"}));const run=result.runs[0];
  assert.match(fs.readFileSync(path.join(path.dirname(run.receipt),"diagnostic-command.log"),"utf8"),/final diagnostic line/);
  assert.equal(run.processGroups[0].quiescent,true);assert.equal(run.workspaceRemoved,true);
});

function evidenceFixture(t){
  const stateDir=fs.mkdtempSync(path.join(os.tmpdir(),"local-evidence-policy-"));t.after(()=>fs.rmSync(stateDir,{recursive:true,force:true}));
  fs.writeFileSync(path.join(stateDir,"owner.json"),JSON.stringify({id:"private-state-owner"}),{mode:0o600});fs.mkdirSync(path.join(stateDir,"runs"),{mode:0o700});
  const now=Date.UTC(2026,10,3);
  function run(id,age,{pending=false,active=false,bytes=8,unknown=false}={}){
    const name=id.toString(16).padStart(8,"0")+"-0000-4000-8000-000000000000",folder=path.join(stateDir,"runs",name);fs.mkdirSync(folder,{mode:0o700});fs.mkdirSync(path.join(folder,"safety"),{mode:0o700});
    const receipt={format:1,owner:"private-state-owner",id:name,status:active?"started":"failed",finished:active?undefined:new Date(now-age*86400000).toISOString(),cleanupRequired:pending,processGroups:active?[{id:99,quiescent:false}]:[],logFiles:["verification.log"],diagnosticArchive:{files:[{path:"partial.json"}]}};
    fs.writeFileSync(path.join(folder,"receipt.json"),JSON.stringify(receipt),{mode:0o600});fs.writeFileSync(path.join(folder,"verification.log"),"x".repeat(bytes),{mode:0o600});fs.writeFileSync(path.join(folder,"safety/partial.json"),"{}",{mode:0o600});if(unknown)fs.writeFileSync(path.join(folder,"operator-note.txt"),"preserve");return folder;
  }
  return {stateDir,now,run};
}

test("evidence age pruning removes declared logs and safety JSON while preserving receipts and unknown files",t=>{
  const f=evidenceFixture(t),old=f.run(1,31,{unknown:true}),recent=f.run(2,2);
  const file=path.join(old,"receipt.json"),receipt=JSON.parse(fs.readFileSync(file));receipt.resultFiles=["pages-result.json"];fs.writeFileSync(file,JSON.stringify(receipt));fs.writeFileSync(path.join(old,"pages-result.json"),"{}",{mode:0o600});
  const result=pruneEvidence({stateDir:f.stateDir,now:f.now});assert.equal(result.filesRemoved,3);assert.equal(fs.existsSync(path.join(old,"pages-result.json")),false);
  assert.equal(fs.existsSync(path.join(old,"verification.log")),false);assert.equal(fs.existsSync(path.join(old,"safety/partial.json")),false);
  assert.equal(fs.existsSync(path.join(old,"receipt.json")),true);assert.equal(fs.readFileSync(path.join(old,"operator-note.txt"),"utf8"),"preserve");assert.equal(fs.existsSync(path.join(recent,"verification.log")),true);
});

test("evidence budget pruning is oldest first and preserves active, pending and unowned runs",t=>{
  const f=evidenceFixture(t),old=f.run(1,4),newer=f.run(2,2),active=f.run(3,99,{active:true}),pending=f.run(4,99,{pending:true}),unknown=f.run(5,99);
  const file=path.join(unknown,"receipt.json"),receipt=JSON.parse(fs.readFileSync(file));receipt.owner="another-owner";fs.writeFileSync(file,JSON.stringify(receipt));
  const result=pruneEvidence({stateDir:f.stateDir,now:f.now,maxBytes:10});assert.equal(result.bytesRemaining,10);assert.equal(fs.existsSync(path.join(old,"verification.log")),false);assert.equal(fs.existsSync(path.join(newer,"verification.log")),true);
  for(const folder of [old,newer,active,pending,unknown])assert.equal(fs.existsSync(path.join(folder,"receipt.json")),true);
  for(const folder of [active,pending,unknown])assert.equal(fs.existsSync(path.join(folder,"verification.log")),true);
});

test("evidence pruning refuses symlink paths and leaves undeclared JSON alone",t=>{
  const f=evidenceFixture(t),old=f.run(1,31),external=path.join(f.stateDir,"external.log");fs.writeFileSync(external,"outside");fs.unlinkSync(path.join(old,"verification.log"));fs.symlinkSync(external,path.join(old,"verification.log"));fs.writeFileSync(path.join(old,"safety/operator.json"),"{}");
  pruneEvidence({stateDir:f.stateDir,now:f.now,maxBytes:0});assert.equal(fs.readFileSync(external,"utf8"),"outside");assert.equal(fs.lstatSync(path.join(old,"verification.log")).isSymbolicLink(),true);assert.equal(fs.existsSync(path.join(old,"safety/operator.json")),true);
});

test("diagnostic log failure does not erase the original command error",async t=>{
  const root=fs.mkdtempSync(path.join(os.tmpdir(),"local-command-log-"));t.after(()=>fs.rmSync(root,{recursive:true,force:true}));
  await assert.rejects(command({workspace:root,runDir:path.join(root,"missing"),env:process.env,redact:value=>value},"controlled-logfailure",[process.execPath,"-e","process.exit(7)"]),/controlled-logfailure failed.*diagnostic log write failed/);
});

test("actual main no-release still deploys production Pages exactly once",async t=>{
  const f=fixture(t);f.dependencies.publish=async()=>({published:false});
  const main=await runFlow(options(f,{branch:"main",publish:true}));assert.equal(main.runs[0].pages.verified,true);assert.equal(f.calls.filter(row=>row[0]==="pages").length,1);assert.equal(f.calls.some(row=>row[0]==="mirrors"),false);
  await runFlow(options(f,{branch:"main"}));assert.equal(f.calls.filter(row=>row[0]==="pages").length,1);
});

test("mirror rejection does not prevent Pages and both destination outcomes survive cleanup",async t=>{
  const f=fixture(t);let pagesAttempted=false;
  f.dependencies.mirrors=async context=>{context.mirrorResults={targets:[{target:"codeberg",verified:false}]};throw new Error("controlled mirror failure");};
  f.dependencies.pages=async context=>{pagesAttempted=true;const file=path.join(context.workspace,"build/release-safety/pages-result.json");fs.mkdirSync(path.dirname(file),{recursive:true});fs.writeFileSync(file,JSON.stringify({verified:true,jobId:42}));return {verified:true,jobId:42};};
  await assert.rejects(runFlow(options(f,{branch:"main",publish:true})),/controlled mirror failure/);assert.equal(pagesAttempted,true);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed,receipt=JSON.parse(fs.readFileSync(failure.receipt));
  assert.equal(receipt.poststeps.mirrors.status,"rejected");assert.equal(receipt.poststeps.pages.status,"fulfilled");assert.equal(receipt.pages.verified,true);assert.equal(receipt.mirrors.targets[0].verified,false);assert.equal(receipt.workspaceRemoved,true);
  assert.equal(JSON.parse(fs.readFileSync(path.join(path.dirname(failure.receipt),"safety/pages-result.json"))).jobId,42);
});

test("Pages rejection preserves successful mirrors and its partial diagnostic result",async t=>{
  const f=fixture(t);f.dependencies.pages=async context=>{context.pagesResults={verified:false,jobId:43,cleanupPending:true};throw new Error("controlled Pages failure");};
  await assert.rejects(runFlow(options(f,{branch:"main",publish:true})),/controlled Pages failure/);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed,receipt=JSON.parse(fs.readFileSync(failure.receipt));
  assert.equal(receipt.poststeps.mirrors.status,"fulfilled");assert.equal(receipt.poststeps.pages.status,"rejected");assert.equal(receipt.pages.jobId,43);assert.equal(receipt.mirrors.targets.length,2);assert.equal(receipt.status,"failed");assert.equal(receipt.workspaceRemoved,true);
});

test("configured Pages cleanup runs on initial and unchanged watcher ticks without a release",async t=>{
  const f=fixture(t);f.config.pages={runnerId:17};let attempts=0;f.dependencies.cleanupPages=async()=>{attempts++;return {cleanupRequired:false};};
  await runFlow(options(f,{watchOnce:true}));await runFlow(options(f,{watchOnce:true}));assert.equal(attempts,2);assert.equal(f.calls.length,0);
});

test("Pages must return verified evidence even when its hook resolves",async t=>{
  const f=fixture(t);f.dependencies.pages=async()=>({verified:false,error:"not deployed"});
  await assert.rejects(runFlow(options(f,{branch:"main",publish:true})),/pages.*verified/i);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed,receipt=JSON.parse(fs.readFileSync(failure.receipt));assert.equal(receipt.poststeps.mirrors.status,"fulfilled");assert.equal(receipt.pages.verified,false);assert.equal(receipt.status,"failed");
});

for(const holding of ["cwd","open-handle","mapped-file"])test(`detached descendants with ${holding} keep the exact owned workspace until test teardown stops them`,async t=>{
  const cleanups=[],f=fixture({after:callback=>cleanups.push(callback)},{nativeScan:true}),pidFile=path.join(f.root,"detached.pid");let pid;
  t.after(()=>{if(pid)try{process.kill(-pid,"SIGKILL");}catch{}for(const cleanup of cleanups)cleanup();});
  f.config.environment={HOME:f.root};
  f.dependencies.verify=async context=>{
    const nested=path.join(context.workspace,"nested");fs.mkdirSync(nested);
    const childCode=holding==="cwd"?"setInterval(()=>{},1000)":`require('node:fs').openSync(${JSON.stringify(path.join(context.workspace,"fixture.txt"))},'r');setInterval(()=>{},1000)`;
    const executable=holding==="mapped-file"?(process.platform==="darwin"?"/usr/bin/python3":"python3"):process.execPath;
    const args=holding==="mapped-file"?["-c",`import mmap,time;f=open(${JSON.stringify(path.join(context.workspace,"fixture.txt"))},'rb');mapping=mmap.mmap(f.fileno(),0,access=mmap.ACCESS_READ);f.close();time.sleep(120)`]:["-e",childCode];
    const code=`const fs=require('node:fs'),{spawn}=require('node:child_process');const child=spawn(${JSON.stringify(executable)},${JSON.stringify(args)},{detached:true,stdio:'ignore',cwd:${JSON.stringify(holding==="cwd"?nested:f.root)}});fs.writeFileSync(${JSON.stringify(pidFile)},String(child.pid));child.unref();`;
    await command(context,"detached-fixture",[process.execPath,"-e",code]);pid=Number(fs.readFileSync(pidFile,"utf8"));
  };
  await assert.rejects(runFlow(options(f,{branch:"main"})),/quiescence|active|handles|cleanup/i);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed,receipt=JSON.parse(fs.readFileSync(failure.receipt));
  assert.equal(receipt.processGroups[0].quiescent,true);assert.equal(receipt.workspaceRemoved,false);assert.equal(receipt.cleanupRequired,true);assert.equal(fs.existsSync(receipt.workspace),true);
  assert.doesNotThrow(()=>process.kill(pid,0),"Cleanup must never kill a process outside its known command group");
});

test("workspace native proof is bounded, fail-closed and receives no credentials",()=>{
  assert.equal(typeof workspaceQuiescent,"function");
  let seen;
  const result=workspaceQuiescent("/private/owned/checkout",{platform:"darwin",stateDir:"/private/owned",env:{PATH:"/usr/bin",GITLAB_TOKEN:"must-not-forward"},inspect:(file,args,options)=>{seen={file,args,options};return "QUIESCENT\n";}});
  assert.equal(result,true);assert.equal(seen.file,"/usr/bin/python3");assert.ok(seen.args[1].includes("proc_pidfdinfo"));assert.ok(seen.args[1].includes("info(pid,8,1272,address)"));assert.ok(seen.args.includes("/private/owned/checkout"));assert.equal(seen.options.timeout,120000);assert.equal(seen.options.env.HOME,"/private/owned");assert.equal(seen.options.env.GITLAB_TOKEN,undefined);
  for(const inspect of [()=>"BUSY\n",()=>"",()=>"unexpected output",()=>{throw Object.assign(new Error("unavailable"),{code:"ENOENT"});},()=>{throw Object.assign(new Error("timeout"),{code:"ETIMEDOUT"});},()=>{throw Object.assign(new Error("partial scan"),{status:1,stdout:"",stderr:""});}])assert.equal(workspaceQuiescent("/private/owned/checkout",{platform:"darwin",stateDir:"/private/owned",inspect}),false);
  assert.equal(workspaceQuiescent("/private/owned/checkout",{platform:"linux",inspect:()=>{throw Object.assign(new Error("no handles"),{status:1,stdout:"",stderr:""});}}),true);
});

test("native scan failures retain a bounded reason without trusting arbitrary stderr",()=>{
  for(const [inspect,expected] of [
    [()=>"BUSY\n","live workspace holder"],
    [()=>"unexpected output","unexpected native scan output"],
    [()=>{throw Object.assign(new Error("scan failed"),{status:2,stderr:"workspace-proof: incomplete cwd scan\n"});},"incomplete cwd scan"],
    [()=>{throw Object.assign(new Error("scan failed"),{status:2,stderr:"workspace-proof: unstable process list\n"});},"unstable process list"],
    [()=>{throw Object.assign(new Error("scan failed"),{status:2,stderr:"workspace-proof: incomplete fd scan\n"});},"incomplete fd scan"],
    [()=>{throw Object.assign(new Error("scan failed"),{status:2,stderr:"workspace-proof: incomplete mapping scan\n"});},"incomplete mapping scan"],
    [()=>{throw Object.assign(new Error("timed out"),{code:"ETIMEDOUT"});},"native scan timed out"],
    [()=>{throw Object.assign(new Error("scan failed"),{status:2,stderr:"workspace-proof: "+"x".repeat(121)});},"native scan unavailable"],
    [()=>{throw Object.assign(new Error("scan failed"),{status:2,stderr:"workspace-proof: incomplete fd scan\nprivate diagnostic content"});},"native scan unavailable"],
  ]){
    const reasons=[];
    assert.equal(workspaceQuiescent("/private/owned/checkout",{platform:"darwin",inspect,onFailure:reason=>reasons.push(reason)}),false);
    assert.deepEqual(reasons,[expected]);
  }
});

test("native enumeration scans each observed process once, ignores unrelated churn and refuses unknown scans",()=>{
  let script;
  workspaceQuiescent("/private/owned/checkout",{platform:"darwin",inspect:(_file,args)=>{script=args[1];return "QUIESCENT";}});
  const body=script.slice(script.indexOf("try:\n    # Scan one complete snapshot"));
  assert.ok(body.startsWith("try:\n"));
  assert.ok(!script.includes("unstable process list"),"Unrelated process churn cannot fail the proof");
  const prefix="import sys\nclass Clock:\n    tick=0\n    def monotonic(self):\n        self.tick+=1\n        return self.tick\ntime=Clock()\ncalls=0\ndef pids():\n    global calls\n    calls+=1\n    return set(range(1,LIMIT+1 if calls>LIMIT else calls+1))\n";
  const python=process.platform==="darwin"?"/usr/bin/python3":"python3";
  // Churn never settles at LIMIT=1000; it is scanned once and cannot fail the proof.
  for(const [limit,inspection,expected] of [[8,"return False","QUIESCENT"],[8,"return True","BUSY"],[1000,"return False","QUIESCENT"],[1000,"return pid>1","BUSY"],[8,"raise RuntimeError('incomplete fd scan')","incomplete fd scan"]]){
    const source=prefix.replaceAll("LIMIT",String(limit))+"def inspect(pid):\n    "+inspection+"\n"+body;
    if(expected==="QUIESCENT"||expected==="BUSY")assert.equal(execFileSync(python,["-c",source],{encoding:"utf8"}).trim(),expected);
    else assert.throws(()=>execFileSync(python,["-c",source],{encoding:"utf8",stdio:["ignore","pipe","pipe"]}),error=>error.status===2&&String(error.stderr).trim()==="workspace-proof: "+expected);
  }
});

test("native proof stops at another user's unreadable ancestor and fails closed for this user's",()=>{
  let script;
  workspaceQuiescent("/private/owned/checkout",{platform:"darwin",inspect:(_file,args)=>{script=args[1];return "QUIESCENT";}});
  const walk=script.slice(script.indexOf("def walk_ancestors"),script.indexOf("ancestors=walk_ancestors"));
  assert.ok(walk.startsWith("def walk_ancestors(parent,read,owned):"));
  // Terminal chain: 40 zsh -> 30 claude -> 20 zsh -> 10 root-owned login (EPERM) -> launchd.
  const prefix="import errno,struct,sys\nPARENTS={40:30,30:20,20:10,10:1}\nUNREADABLE=@BLOCKED@\nOWNED=@MINE@\ndef read(pid):\n    if pid in UNREADABLE:return 0,b'',UNREADABLE[pid]\n    return 136,b'\\0'*16+struct.pack('=I',PARENTS[pid])+b'\\0'*116,0\n";
  const run=(unreadable,owned)=>execFileSync(process.platform==="darwin"?"/usr/bin/python3":"python3",["-c",prefix.replace("@BLOCKED@",unreadable).replace("@MINE@",owned)+walk+"print(sorted(walk_ancestors(40,read,lambda:OWNED)))\n"],{encoding:"utf8",stdio:["ignore","pipe","pipe"]}).trim();
  assert.equal(run("{}","{40,30,20,10}"),"[10, 20, 30, 40]","A readable chain reaches launchd");
  assert.equal(run("{10:errno.EPERM}","{40,30,20}"),"[10, 20, 30, 40]","Root's login ends the walk instead of the scan");
  for(const [unreadable,owned] of [["{10:errno.EPERM}","{40,30,20,10}"],["{20:errno.ESRCH}","{40,30,20}"]])
    assert.throws(()=>run(unreadable,owned),error=>error.status===2&&String(error.stderr).trim()==="workspace-proof: unreadable ancestor");
});

test("Pages reuses the native proof and keeps its live-owner PID guard",()=>{
  const script=path.resolve(__dirname,"../scripts/local-release/pages.cjs"),invocation=pagesInvocation(script,["--cleanup"]);
  assert.equal(invocation[0],process.execPath);assert.equal(invocation[1],"-e");assert.deepEqual(invocation.slice(3),["--","--cleanup"]);
  let passed,alive=true,quiet=false,calls=0;
  require("node:vm").runInNewContext(invocation[2],{process:{argv:[process.execPath,"--cleanup"]},console,require:file=>{
    if(file===script)return {main:(args,options)=>{passed={args:Array.from(args),options};return Promise.resolve();}};
    if(file.endsWith("pages-job.cjs"))return {processAlive:()=>alive};
    assert.equal(file,path.resolve(__dirname,"../scripts/local-release/flow.cjs"));return {workspaceQuiescent:()=>{calls++;return quiet;}};
  }});
  assert.deepEqual(passed.args,["--cleanup"]);
  assert.equal(passed.options.isQuiescent("/owned/checkout",{pid:42}),false);assert.equal(calls,0);
  alive=false;assert.equal(passed.options.isQuiescent("/owned/checkout",{pid:42}),false);assert.equal(calls,1);
  quiet=true;assert.equal(passed.options.isQuiescent("/owned/checkout",{pid:42}),true);assert.equal(calls,2);
});

test("default credential fallback loads three labelled APIs only when needed and keeps explicit overrides",t=>{
  assert.equal(typeof ensureApiCredentials,"function");
  const home=fs.mkdtempSync(path.join(os.tmpdir(),"local-default-credentials-"));t.after(()=>fs.rmSync(home,{recursive:true,force:true}));
  const file=path.join(home,".ci"),tokens={GITLAB_TOKEN:"gitlab-from-fixture",GITGUD_TOKEN:"gitgud-from-fixture",CODEBERG_TOKEN:"codeberg-from-fixture"};fs.writeFileSync(file,"fixture only",{mode:0o600});
  const context={env:{GITLAB_TOKEN:"explicit-override"},config:{}};let called=0;
  ensureApiCredentials(context,{home,loadApiKeys:source=>{called++;assert.equal(source,file);return tokens;}});
  assert.deepEqual(context.env,{GITLAB_TOKEN:"explicit-override",GITGUD_TOKEN:tokens.GITGUD_TOKEN,CODEBERG_TOKEN:tokens.CODEBERG_TOKEN});assert.equal(called,1);
  ensureApiCredentials(context,{home,loadApiKeys:()=>{throw new Error("Complete explicit environment must not read credentials");}});
  const override=path.join(home,"configured-api-file");fs.writeFileSync(override,"fixture only",{mode:0o600});
  ensureApiCredentials({env:{},config:{apiKeysFile:override}},{home,loadApiKeys:source=>{assert.equal(source,override);return tokens;}});
});

test("Pages cleanup-required evidence prevents a published claim without retaining a quiet root checkout",async t=>{
  const f=fixture(t);f.dependencies.pages=async()=>({verified:true,cleanupRequired:true,jobId:77});
  await assert.rejects(runFlow(options(f,{branch:"main",publish:true})),/pages.*cleanup/i);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed,receipt=JSON.parse(fs.readFileSync(failure.receipt));
  assert.equal(receipt.status,"failed");assert.equal(receipt.cleanupRequired,true);assert.equal(receipt.pagesCleanupRequired,true);assert.equal(receipt.workspaceRemoved,true);assert.equal(fs.existsSync(receipt.workspace),false);
});

test("a later successful Pages cleanup clears only Pages-only pending cleanup flags",async t=>{
  const f=fixture(t);f.config.pages={runnerId:17};f.dependencies.pages=async context=>{context.pagesResults={verified:false,cleanupRequired:true,jobId:78};throw new Error("Pages job cleanup pending");};
  await assert.rejects(runFlow(options(f,{branch:"main",publish:true})),/Pages job cleanup pending/);
  const first=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed,initial=JSON.parse(fs.readFileSync(first.receipt));assert.equal(initial.pagesCleanupRequired,true);
  f.dependencies.pages=async()=>({verified:true});await runFlow(options(f,{watchOnce:true}));
  const state=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))),receipt=JSON.parse(fs.readFileSync(first.receipt));assert.equal(state.branches.main.failures[first.head].cleanupRequired,false);assert.equal(receipt.cleanupRequired,false);assert.equal(receipt.status,"failed");assert.ok(receipt.pagesCleanupResolvedAt);
});

test("Pages cleanup success alone cannot clear an unproved root workspace; the sweep proves it independently",async t=>{
  const f=fixture(t);f.config.pages={runnerId:17};
  f.dependencies.pages=async context=>{context.pagesResults={verified:false,cleanupRequired:true};context.processGroups=[{id:123456,quiescent:false}];throw new Error("Pages pending and root activity unproved");};
  await assert.rejects(runFlow(options(f,{branch:"main",publish:true})),/root activity unproved/);
  await assert.rejects(runFlow(options(f,{branch:"main"})),/requires explicit.*cleanup/);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed;
  assert.equal(JSON.parse(fs.readFileSync(failure.receipt)).cleanupRequired,true);
  f.advance("main","fix: advance after the failed release");
  // The first watch tick sweeps the root workspace with its own quiescence
  // proof instead of trusting the Pages result; because the watcher was not
  // yet initialized it baselines, and the next tick processes the new head.
  const first=await runFlow(options(f,{watchOnce:true}));
  assert.equal(first.status,"baselined");
  const result=await runFlow(options(f,{watchOnce:true}));
  assert.equal(result.status,"complete");
  const receipt=JSON.parse(fs.readFileSync(failure.receipt));
  assert.equal(receipt.cleanupRequired,false);assert.equal(receipt.workspaceRemoved,true);assert.equal(receipt.workspaceCleanupRequired,false);
});

test("Pages cleanup resolution recovers when its receipt was saved before the state checkpoint",async t=>{
  const f=fixture(t);f.config.pages={runnerId:17};f.dependencies.pages=async()=>({verified:true,cleanupRequired:true});
  await assert.rejects(runFlow(options(f,{branch:"main",publish:true})),/pages.*cleanup/i);
  const failure=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed,receipt=JSON.parse(fs.readFileSync(failure.receipt));
  receipt.pagesCleanupRequired=false;receipt.cleanupRequired=false;receipt.pagesCleanupResolvedAt=new Date().toISOString();fs.writeFileSync(failure.receipt,JSON.stringify(receipt));
  await runFlow(options(f,{watchOnce:true}));assert.equal(JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed.cleanupRequired,false);
});

test("default Pages cleanup parses actual CLI stdout and retains active-only retryable evidence",async t=>{
  assert.equal(typeof cleanupPages,"function");
  const root=fs.mkdtempSync(path.join(os.tmpdir(),"local-pages-cleanup-cli-"));t.after(()=>fs.rmSync(root,{recursive:true,force:true}));
  const script=path.join(root,"fixture.cjs"),expected={cleanupRequired:true,retryable:true,active:[55]};
  fs.writeFileSync(script,`console.error('fixture stderr diagnostic');console.log(${JSON.stringify(JSON.stringify(expected))});`);
  const context={workspace:root,runDir:root,env:{PATH:process.env.PATH,HOME:root},redact:value=>value};
  assert.deepEqual(await cleanupPages(context,{script}),expected);
  assert.deepEqual(JSON.parse(fs.readFileSync(path.join(root,"pages-cleanup-result.json"))),expected);
  assert.match(fs.readFileSync(path.join(root,"pages-cleanup.log"),"utf8"),/stderr diagnostic/);
});

test("active-only Pages cleanup cannot resolve prior pending cleanup merely by exiting zero",async t=>{
  const f=fixture(t);f.config.pages={runnerId:17};f.dependencies.pages=async()=>({verified:true,cleanupRequired:true});
  await assert.rejects(runFlow(options(f,{branch:"main",publish:true})),/pages.*cleanup/i);
  const first=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))).branches.main.failed;
  f.dependencies.cleanupPages=async()=>({cleanupRequired:true,retryable:true,active:[55]});
  await assert.rejects(runFlow(options(f,{watchOnce:true})),/Pages cleanup.*required/i);
  const state=JSON.parse(fs.readFileSync(path.join(f.stateDir,"state.json"))),receipt=JSON.parse(fs.readFileSync(first.receipt)),status=JSON.parse(fs.readFileSync(path.join(f.stateDir,"pages-cleanup-status.json")));
  assert.equal(state.branches.main.failed.cleanupRequired,true);assert.equal(receipt.pagesCleanupRequired,true);assert.equal(status.cleanupRequired,true);assert.equal(status.retryable,true);assert.deepEqual(status.result.active,[55]);
});

test("missing structured Pages cleanup evidence blocks watcher baselining",async t=>{
  const f=fixture(t);f.config.pages={runnerId:17};f.dependencies.cleanupPages=async()=>undefined;
  await assert.rejects(runFlow(options(f,{watchOnce:true})),/Pages cleanup.*required|structured/i);
  assert.equal(JSON.parse(fs.readFileSync(path.join(f.stateDir,"pages-cleanup-status.json"))).cleanupRequired,true);
});
