"use strict";
const {test}=require("node:test");
const assert=require("node:assert/strict");
const fs=require("node:fs"),os=require("node:os"),path=require("node:path");
const {LABEL,FILES,installationPlan,install}=require("../scripts/local-release/install.cjs");

function writeSources(directory,label){
  for(const file of FILES)fs.writeFileSync(path.join(directory,file),file.endsWith(".json")?JSON.stringify({main:{branch:"main",channel:null,prerelease:false}}):`"use strict"; // ${label}\n`);
}
function fixture(t){
  const root=fs.mkdtempSync(path.join(os.tmpdir(),"local-installer-transaction-"));t.after(()=>fs.rmSync(root,{recursive:true,force:true}));
  const sourceDir=path.join(root,"source"),stateDir=path.join(root,"state"),home=path.join(root,"home"),configPath=path.join(root,"config.json");fs.mkdirSync(sourceDir);writeSources(sourceDir,"old");fs.writeFileSync(configPath,JSON.stringify({stateDir}),{mode:0o600});
  const calls=[],run=(command,args)=>{calls.push([command,...args]);return {status:command==="launchctl"&&args[0]==="print"?113:0,stdout:""};};
  const options={configPath,home,sourceDir,platform:"darwin",uid:501,node:"/fake-node",run};
  const installed=install(options);writeSources(sourceDir,"new");calls.length=0;
  const before=new Map([...FILES,".installed.json"].map(file=>[path.join(installed.tooling,file),fs.readFileSync(path.join(installed.tooling,file))]));before.set(installed.plistPath,fs.readFileSync(installed.plistPath));
  return {root,stateDir,calls,options,installed,before};
}
function assertUnchanged(f){for(const [file,bytes] of f.before)assert.deepEqual(fs.readFileSync(file),bytes,file);}
function assertNoStaging(f){assert.deepEqual(fs.readdirSync(f.stateDir).filter(name=>name.startsWith(".install-")),[]);assert.equal(fs.existsSync(path.join(f.stateDir,"lock")),false);}

test("LaunchAgent uses stable tooling, private config and a bounded one-shot watch",()=>{
  const plan=installationPlan({configPath:"/private/config & local.json",config:{stateDir:"/private/release state",pollSeconds:120,secretFiles:{MORPHE_SIGNING_KEY:"/private/key"}},home:"/home/operator",node:"/tools/node"});
  assert.deepEqual(plan.command,["/tools/node","/private/release state/tooling/flow.cjs","--config","/private/config & local.json","--watch-once"]);
  assert.match(plan.plist,/config &amp; local\.json/);assert.match(plan.plist,/<integer>120<\/integer>/);
  assert.ok(!plan.plist.includes("MORPHE_SIGNING_KEY"));assert.ok(!plan.plist.includes("/private/key"));
  assert.equal(plan.plistPath,`/home/operator/Library/LaunchAgents/${LABEL}.plist`);
  assert.throws(()=>installationPlan({configPath:"relative",config:{stateDir:"/state"}}),/absolute/);
  assert.throws(()=>installationPlan({configPath:"/config",config:{stateDir:"/state",pollSeconds:10}}),/60/);
});

test("the maintained channel template agrees with release configuration and AGENTS",()=>{
  const root=path.join(__dirname,"..");
  const templates=JSON.parse(fs.readFileSync(path.join(root,"scripts/local-release/templates.json"),"utf8"));
  const release=JSON.parse(fs.readFileSync(path.join(root,".releaserc"),"utf8"));
  const instructions=fs.readFileSync(path.join(root,"AGENTS.md"),"utf8");
  assert.deepEqual(Object.keys(templates).sort(),["main"]);
  assert.ok(release.branches.includes("main"));
  assert.ok(!release.branches.some(value=>typeof value==="object"&&value.name==="dev"));
  for(const branch of Object.keys(templates)){assert.equal(templates[branch].branch,branch);assert.ok(fs.readFileSync(path.join(root,"PUBLISHING.md"),"utf8").includes(`--branch ${branch}`));}
  assert.equal(templates.main.prerelease,false);
});

test("installation copies reviewed templates and validates before bootstrap",()=>{
  const root=fs.mkdtempSync(path.join(os.tmpdir(),"local-release-install-"));
  try{
    const sourceDir=path.join(root,"source"),stateDir=path.join(root,"state"),home=path.join(root,"home"),configPath=path.join(root,"config.json");fs.mkdirSync(sourceDir);
    writeSources(sourceDir,"old");
    fs.writeFileSync(configPath,JSON.stringify({stateDir}),{mode:0o600});const calls=[];
    const run=(command,args)=>{calls.push([command,...args]);return {status:command==="launchctl"&&args[0]==="print"?113:0,stdout:""};};
    const result=install({configPath,home,sourceDir,platform:"darwin",uid:501,node:"/node",run});
    assert.equal(result.label,LABEL);assert.ok(fs.existsSync(path.join(stateDir,"tooling/flow.cjs")));
    assert.ok(calls.findIndex(x=>x[0]==="plutil")<calls.findIndex(x=>x[1]==="bootstrap"));
    assert.equal(fs.statSync(result.plistPath).mode&0o777,0o600);
    assert.throws(()=>install({configPath,home,sourceDir,platform:"darwin",uid:501,run:()=>({status:0,stdout:"pid = 123"})}),/running/);
    fs.mkdirSync(path.join(stateDir,"lock"));
    assert.throws(()=>install({configPath,home,sourceDir,platform:"darwin",uid:501,run:()=>{throw Error("must not inspect service while locked");}}),/running or its lock/);
    fs.rmdirSync(path.join(stateDir,"lock"));
    assert.throws(()=>install({configPath,home,sourceDir,platform:"darwin",uid:0,run}),/never root/);
  }finally{fs.rmSync(root,{recursive:true,force:true});}
});

test("idle agent is unloaded under the flow lock before its tooling changes",()=>{
  const root=fs.mkdtempSync(path.join(os.tmpdir(),"local-release-update-"));
  try{
    const sourceDir=path.join(root,"source"),stateDir=path.join(root,"state"),configPath=path.join(root,"config.json");fs.mkdirSync(sourceDir);
    writeSources(sourceDir,"old");
    fs.writeFileSync(configPath,JSON.stringify({stateDir}),{mode:0o600});
    install({configPath,home:root,sourceDir,platform:"darwin",uid:501,run:(c,a)=>({status:c==="launchctl"&&a[0]==="print"?113:0,stdout:""})});
    writeSources(sourceDir,"new");
    let unloaded=false;
    install({configPath,home:root,sourceDir,platform:"darwin",uid:501,run:(command,args)=>{
      if(args[0]==="bootout"){assert.ok(fs.existsSync(path.join(stateDir,"lock")));assert.equal(fs.readFileSync(path.join(stateDir,"tooling/flow.cjs"),"utf8"),'"use strict"; // old\n');unloaded=true;}
      if(args[0]==="bootstrap"){assert.ok(unloaded);assert.ok(!fs.existsSync(path.join(stateDir,"lock")));assert.equal(fs.readFileSync(path.join(stateDir,"tooling/flow.cjs"),"utf8"),'"use strict"; // new\n');}
      return {status:0,stdout:""};
    }});
  }finally{fs.rmSync(root,{recursive:true,force:true});}
});

test("installation refuses an unrelated tooling directory",()=>{
  const root=fs.mkdtempSync(path.join(os.tmpdir(),"local-release-unowned-"));
  try{
    const stateDir=path.join(root,"state"),configPath=path.join(root,"config.json"),sourceDir=path.join(root,"source");fs.mkdirSync(path.join(stateDir,"tooling"),{recursive:true});fs.writeFileSync(path.join(stateDir,"tooling/keep"),"user file");fs.mkdirSync(sourceDir);
    writeSources(sourceDir,"old");
    fs.writeFileSync(configPath,JSON.stringify({stateDir}),{mode:0o600});
    assert.throws(()=>install({configPath,home:root,sourceDir,platform:"darwin",uid:501,run:()=>{throw Error("must not run");}}),/unowned/);
    assert.equal(fs.readFileSync(path.join(stateDir,"tooling/keep"),"utf8"),"user file");
  }finally{fs.rmSync(root,{recursive:true,force:true});}
});

test("invalid staged plist preserves old tooling and service without bootout",t=>{
  const f=fixture(t);const calls=[];
  assert.throws(()=>install({...f.options,run:(command,args)=>{calls.push([command,...args]);if(command==="plutil")return {status:1,stdout:"invalid staged plist"};return {status:0,stdout:""};}}),/plist validation/);
  assertUnchanged(f);assertNoStaging(f);assert.equal(calls.some(row=>row[1]==="bootout"),false);
  assert.ok(calls.find(row=>row[0]==="plutil")[2].includes(".install-"));
});

test("staged JSON and JavaScript validation precede unloading",t=>{
  const f=fixture(t);fs.writeFileSync(path.join(f.options.sourceDir,"templates.json"),"not JSON");let bootout=false;
  assert.throws(()=>install({...f.options,run:(command,args)=>{if(args[0]==="bootout")bootout=true;return {status:0,stdout:""};}}),/JSON|template/);
  assertUnchanged(f);assertNoStaging(f);assert.equal(bootout,false);
});

test("bootout failure preserves old files and removes staging",t=>{
  const f=fixture(t);
  assert.throws(()=>install({...f.options,run:(command,args)=>({status:args[0]==="bootout"?5:0,stdout:""})}),/could not be unloaded/);
  assertUnchanged(f);assertNoStaging(f);
});

test("write failure rolls back all old bytes and cautiously restores idle old service",t=>{
  const f=fixture(t);let replacements=0,restored=false;
  assert.throws(()=>install({...f.options,replaceFile:(file,bytes,mode)=>{if(++replacements===2)throw new Error("controlled write failure");fs.writeFileSync(file,bytes,{mode});},run:(command,args)=>{if(args[0]==="bootstrap")restored=true;return {status:0,stdout:""};}}),/controlled write failure/);
  assertUnchanged(f);assertNoStaging(f);assert.equal(restored,true);
});

test("successful staging is removed and every reviewed script is installed",t=>{
  const f=fixture(t);const result=install(f.options);assertNoStaging(f);
  for(const file of FILES)assert.equal(fs.existsSync(path.join(result.tooling,file)),true);
});

test("existing flow lock is never removed or inspected past acquisition",t=>{
  const f=fixture(t),lock=path.join(f.stateDir,"lock");fs.mkdirSync(lock);fs.writeFileSync(path.join(lock,"owner.json"),"existing owner");
  assert.throws(()=>install({...f.options,run:()=>{throw new Error("must not contact service");}}),/running or its lock/);assertUnchanged(f);assert.equal(fs.readFileSync(path.join(lock,"owner.json"),"utf8"),"existing owner");
});

test("ambiguous bootstrap with a live worker never kills it or overwrites new tooling",t=>{
  const f=fixture(t);let bootstrapped=false,bootouts=0;
  assert.throws(()=>install({...f.options,run:(command,args)=>{if(args[0]==="print")return {status:0,stdout:bootstrapped?"pid = 4321":""};if(args[0]==="bootout")bootouts++;if(args[0]==="bootstrap"){bootstrapped=true;return {status:5,stdout:"ambiguous"};}return {status:0,stdout:""};}}),/bootstrap/);
  assert.equal(bootouts,1);assert.equal(fs.readFileSync(path.join(f.installed.tooling,"flow.cjs"),"utf8"),'"use strict"; // new\n');assertNoStaging(f);
});

test("staged JavaScript failure preserves the old job without bootout",t=>{
  const f=fixture(t);let bootout=false;
  assert.throws(()=>install({...f.options,run:(command,args)=>{if(args[0]==="bootout")bootout=true;return {status:args[0]==="--check"?1:0,stdout:""};}}),/JavaScript validation/);
  assertUnchanged(f);assertNoStaging(f);assert.equal(bootout,false);
});

test("all staged syntax and plist checks complete before idle bootout",t=>{
  const f=fixture(t);let checked=0,linted=false;
  install({...f.options,run:(command,args)=>{
    if(args[0]==="--check"){assert.ok(args[1].includes(".install-"));checked++;}
    if(command==="plutil"){assert.equal(checked,FILES.filter(file=>file.endsWith(".cjs")).length);linted=true;}
    if(args[0]==="bootout"){assert.equal(linted,true);assertUnchanged(f);}
    return {status:0,stdout:""};
  }});assertNoStaging(f);
});

test("a worker starting during staged validation prevents unload and live-file writes",t=>{
  const f=fixture(t);let prints=0,bootout=false;
  assert.throws(()=>install({...f.options,run:(command,args)=>{if(args[0]==="print")return {status:0,stdout:++prints===1?"":"pid = 7654"};if(args[0]==="bootout")bootout=true;return {status:0,stdout:""};}}),/became active/);
  assertUnchanged(f);assertNoStaging(f);assert.equal(bootout,false);
});
