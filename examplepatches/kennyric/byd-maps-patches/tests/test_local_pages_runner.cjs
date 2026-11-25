"use strict";
const {test}=require("node:test");
const assert=require("node:assert/strict");
const fs=require("node:fs"),os=require("node:os"),path=require("node:path");
const script=()=>require("../scripts/local-release/pages-runner.cjs");
const LABEL="nl.johninnl.morphe.pages-runner",TAG="nl-morphe-pages-macos",PROJECT=88427867;
const settings={runner_type:"project_type",project_id:PROJECT,description:"nl-morphe-local-pages",tag_list:[TAG],run_untagged:false,locked:true,access_level:"ref_protected",maximum_timeout:600};
function fixture(t){
  const root=fs.mkdtempSync(path.join(os.tmpdir(),"local-pages-runner-"));t.after(()=>fs.rmSync(root,{recursive:true,force:true}));
  const home=path.join(root,"home"),stateDir=path.join(root,"state"),tools=path.join(stateDir,"tools"),configPath=path.join(root,"config.json");
  fs.mkdirSync(home,{mode:0o700});fs.mkdirSync(tools,{recursive:true,mode:0o700});
  const binary=path.join(tools,"gitlab-runner");fs.writeFileSync(binary,"fixture binary",{mode:0o700});
  const apiKeysFile=path.join(home,".ci");fs.writeFileSync(apiKeysFile,"GITLAB=gitlab-api-fixture\nGITGUD=gitgud-api-fixture\nCODEBERG=codeberg-api-fixture\n",{mode:0o600});
  const config={stateDir,apiKeysFile,environment:{PATH:"/fixture/bin:/usr/bin:/bin",LOCAL_RELEASE_PYTHON:"/private/docs/python",MORPHE_SIGNING_KEY:"must-not-copy-fixture"}};
  fs.writeFileSync(configPath,JSON.stringify(config),{mode:0o600});
  const calls=[],remote={runner:null,runners:[],installed:false};
  const request=async(endpoint,options={})=>{
    calls.push({endpoint,method:options.method||"GET",body:options.body});
    assert.ok(options.token==="gitlab-api-fixture","API authentication must use the GitLab fixture key");
    if(endpoint==="/user")return {id:42,username:"johninnld"};
    if(endpoint.startsWith(`/projects/${PROJECT}/runners?`))return remote.runners;
    if(endpoint==="/user/runners"&&options.method==="POST"){
      assert.deepEqual(options.body,settings);remote.runner={...settings,id:17,projects:[{id:PROJECT}]};remote.runners=[remote.runner];return {id:17,token:"glrt-runner-auth-fixture"};
    }
    if(endpoint==="/runners/17")return remote.runner;
    throw new Error("Unexpected fixture API endpoint");
  };
  const run=(command,args,options)=>{
    calls.push({command,args,options});assert.ok(command!==binary,"Setup must never execute the runner binary directly");
    if(command==="launchctl"&&args[0]==="print")return {status:remote.installed?0:113,stdout:remote.installed?"pid = 123":""};
    if(command==="launchctl"&&args[0]==="bootstrap")remote.installed=true;
    return {status:0,stdout:""};
  };
  const options={configPath,binary,home,platform:"darwin",uid:501,request,run};
  return {root,home,stateDir,configPath,binary,config,remote,calls,request,run,options};
}
test("dry plan fixes the protected project runner and contains no credential values",t=>{
  const f=fixture(t);fs.unlinkSync(f.config.apiKeysFile);
  const plan=script().dryPlan(f.options);assert.deepEqual(plan.registration,settings);
  assert.equal(plan.label,LABEL);assert.equal(plan.tag,TAG);assert.equal(plan.buildsDir,path.join(f.stateDir,"pages-runner/builds"));
  const text=JSON.stringify(plan);for(const secret of ["gitlab-api-fixture","glrt-runner-auth-fixture","must-not-copy-fixture"])assert.ok(!text.includes(secret),"Dry plan must not expose credentials");
  assert.equal(f.calls.length,0);
});
test("setup verifies owner and runner settings before installing a private bounded shell runner",async t=>{
  const f=fixture(t),result=await script().setup(f.options);
  assert.equal(result.runnerId,17);assert.equal(result.label,LABEL);assert.equal(result.tag,TAG);
  const root=path.join(f.stateDir,"pages-runner"),toml=fs.readFileSync(path.join(root,"config.toml"),"utf8"),record=fs.readFileSync(path.join(root,"runner.json"),"utf8");
  assert.equal(fs.statSync(path.join(root,"config.toml")).mode&0o777,0o600);
  assert.match(toml,/concurrent = 1/);assert.match(toml,/limit = 1/);assert.match(toml,/executor = "shell"/);assert.match(toml,/shell = "bash"/);
  assert.match(toml,/\[runners\.custom_build_dir\]\s+enabled = true/);assert.match(toml,/FF_ENABLE_JOB_CLEANUP = true/);
  assert.ok(toml.includes("glrt-runner-auth-fixture"),"Runner authentication must be retained privately");
  assert.ok(toml.includes("LOCAL_RELEASE_CONFIG="+f.configPath),"Runner must receive its private configuration path");
  assert.ok(toml.includes("LOCAL_RELEASE_PYTHON=/private/docs/python"));
  for(const secret of ["gitlab-api-fixture","gitgud-api-fixture","codeberg-api-fixture","must-not-copy-fixture"])assert.ok(!toml.includes(secret),"Only the runner authentication token may enter TOML");
  const config=JSON.parse(fs.readFileSync(f.configPath,"utf8"));assert.deepEqual(config.pages,{runnerId:17,tag:TAG,publicUrl:"https://nl-morphe-patches-ed90fa.gitlab.io/",buildsDir:path.join(root,"builds")});
  const plist=fs.readFileSync(path.join(f.home,"Library/LaunchAgents",LABEL+".plist"),"utf8");
  assert.ok(plist.includes(f.binary));assert.ok(plist.includes("<string>run</string>"));assert.ok(plist.includes("<key>RunAtLoad</key><true/>"));
  for(const text of [JSON.stringify(result),JSON.stringify(config),record,plist])assert.ok(!text.includes("glrt-runner-auth-fixture"),"Runner token must remain only in its private TOML");
  assert.ok(f.calls.findIndex(x=>x.endpoint==="/runners/17")<f.calls.findIndex(x=>x.command==="launchctl"),"Settings readback must precede service installation");
});
test("wrong account and unknown existing runner collisions refuse registration",async t=>{
  for(const failure of ["owner","collision"]){
    const f=fixture(t),request=async(endpoint,options)=>endpoint==="/user"&&failure==="owner"?{username:"other-user"}:f.request(endpoint,options);
    if(failure==="collision")f.remote.runners=[{id:99,description:settings.description,tag_list:[TAG]}];
    await assert.rejects(script().setup({...f.options,request}),/owner|johninnld|existing|collision/i);
    assert.ok(!f.calls.some(x=>x.method==="POST"||x.command),"Refused setup must not register or install anything");
  }
});
test("owned setup is idempotent without resetting or exposing runner authentication",async t=>{
  const f=fixture(t);await script().setup(f.options);const file=path.join(f.stateDir,"pages-runner/config.toml"),before=fs.readFileSync(file,"utf8");
  const result=await script().setup(f.options);assert.equal(result.runnerId,17);
  assert.equal(f.calls.filter(x=>x.method==="POST").length,1);assert.equal(f.calls.filter(x=>x.command==="launchctl"&&x.args[0]==="bootstrap").length,1);
  assert.ok(fs.readFileSync(file,"utf8")===before,"Idempotent setup must retain the existing runner authentication");
});
test("failed settings readback retains owned auth for retry but never starts the runner",async t=>{
  const f=fixture(t),original=f.options.request;let mismatch=true;
  const request=async(endpoint,options)=>{const value=await original(endpoint,options);return endpoint==="/runners/17"&&mismatch?{...value,access_level:"not_protected"}:value;};
  await assert.rejects(script().setup({...f.options,request}),/settings|protected|configuration/i);
  assert.ok(!f.calls.some(x=>x.command),"Invalid settings must not install a service");
  assert.ok(fs.existsSync(path.join(f.stateDir,"pages-runner/config.toml")),"One-time authentication must remain recoverable");
  mismatch=false;await script().setup({...f.options,request});assert.equal(f.calls.filter(x=>x.method==="POST").length,1);
});
test("private config, root, and unowned local runner storage are refused",async t=>{
  for(const failure of ["permissions","root","unowned"]){
    const f=fixture(t);if(failure==="permissions")fs.chmodSync(f.configPath,0o644);
    if(failure==="unowned"){const root=path.join(f.stateDir,"pages-runner");fs.mkdirSync(root);fs.writeFileSync(path.join(root,"keep"),"existing user file");}
    await assert.rejects(script().setup({...f.options,...(failure==="root"?{uid:0}:{})}),/private|root|owned/i);
    assert.equal(f.calls.length,0);
  }
});
test("CLI dry-run is safe by default and rejects conflicting setup modes",async t=>{
  const f=fixture(t);const result=await script().main(["--config",f.configPath,"--binary",f.binary],f.options);
  assert.equal(result.dryRun,true);assert.equal(f.calls.length,0);
  await assert.rejects(script().main(["--config",f.configPath,"--binary",f.binary,"--install","--dry-run"],f.options),/Choose|both|mode/i);
});
test("Pages configuration is committed before the LaunchAgent can start a job",async t=>{
  const f=fixture(t),run=(command,args,options)=>{
    if(command==="launchctl"&&args[0]==="bootstrap")assert.equal(JSON.parse(fs.readFileSync(f.configPath,"utf8")).pages?.runnerId,17);
    return f.run(command,args,options);
  };
  await script().setup({...f.options,run});
});
test("incorrect runner type, tags, protection, timeout or project cannot start a service",async t=>{
  for(const change of [{runner_type:"instance_type"},{tag_list:[TAG,"shared"]},{run_untagged:true},{locked:false},{maximum_timeout:601},{projects:[{id:PROJECT+1}]}]){
    const f=fixture(t),request=async(endpoint,options)=>{const value=await f.request(endpoint,options);return endpoint==="/runners/17"?{...value,...change}:value;};
    await assert.rejects(script().setup({...f.options,request}),/settings|configuration/i);
    assert.ok(!f.calls.some(x=>x.command),"Incorrect runner settings must not start a service");
  }
});
test("setup refuses a concurrent local registration and redacts injected API errors",async t=>{
  const f=fixture(t),directory=path.join(f.stateDir,"pages-runner");fs.mkdirSync(directory,{mode:0o700});fs.mkdirSync(path.join(directory,"setup.lock"),{mode:0o700});
  await assert.rejects(script().setup(f.options),/active/);assert.equal(f.calls.length,0);fs.rmdirSync(path.join(directory,"setup.lock"));
  await assert.rejects(script().setup({...f.options,request:async()=>{throw new Error("gitlab-api-fixture failure");}}),error=>!error.message.includes("gitlab-api-fixture")&&error.message.includes("[REDACTED]"));
});
test("malformed HTTP JSON responses cannot expose unparsed authentication text",async t=>{
  const f=fixture(t);t.mock.method(globalThis,"fetch",async(url,options)=>{
    assert.ok(url.startsWith("https://gitlab.com/api/v4/"));assert.equal(options.redirect,"error");
    assert.ok(options.headers["PRIVATE-TOKEN"]==="gitlab-api-fixture","Default transport must use the GitLab fixture key");
    return {ok:true,status:200,json:async()=>{throw new SyntaxError("unparsed-authentication-fixture");}};
  });
  const options={...f.options};delete options.request;
  await assert.rejects(script().setup(options),error=>!error.message.includes("unparsed-authentication-fixture")&&/API response/.test(error.message));
});
