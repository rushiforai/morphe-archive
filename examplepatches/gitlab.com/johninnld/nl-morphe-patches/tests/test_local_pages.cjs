"use strict";
const assert=require("node:assert/strict"),{test}=require("node:test"),fs=require("node:fs"),path=require("node:path"),os=require("node:os");
const {loadAll}=require("js-yaml");
function controller(){const file=path.join(__dirname,"../scripts/local-release/pages.cjs");assert.ok(fs.existsSync(file),"Local Pages controller is required");return require(file);}
function job(){const file=path.join(__dirname,"../scripts/local-release/pages-job.cjs");assert.ok(fs.existsSync(file),"Independent local Pages job is required");return require(file);}
const SHA="a".repeat(40),TAG="nl-morphe-pages-macos";
function fixture(t){
  const root=fs.mkdtempSync(path.join(os.tmpdir(),"local-pages-"));t.after(()=>fs.rmSync(root,{recursive:true,force:true}));
  const stateDir=path.join(root,"state"),buildsDir=path.join(root,"builds"),cwd=path.join(root,"release");for(const file of [stateDir,buildsDir,cwd])fs.mkdirSync(file,{mode:0o700});
  const config={stateDir,pages:{runnerId:7,tag:TAG,publicUrl:"https://nl-morphe-patches-ed90fa.gitlab.io/",buildsDir,pollMs:1,timeoutMs:30},environment:{LOCAL_RELEASE_PYTHON:"/private/docs/python"}};
  fs.writeFileSync(path.join(cwd,"patches-bundle.json"),JSON.stringify({version:"1.2.3"}));
  const calls=[];let clock=0;
  const request=async(endpoint,options={})=>{
    calls.push({endpoint,...options});
    if(endpoint.endsWith("/pipeline"))return {id:55,sha:SHA,ref:"main",source:"api",status:"pending"};
    if(endpoint.includes("/jobs")){const value={id:66,name:"pages_local",status:"success",ref:"main",commit:{id:SHA},pipeline:{id:55},tag_list:[TAG],runner:{id:7}};return /\/jobs\/\d+$/.test(endpoint)?value:[value];}
    if(endpoint.endsWith("/cancel"))return {id:55,status:"canceled"};
    return {id:55,sha:SHA,ref:"main",source:"api",status:"success"};
  };
  const git=(args)=>args[0]==="branch"?"main":SHA;
  const readStamp=async()=>({sha:SHA,version:"1.2.3"});
  return {root,stateDir,buildsDir,cwd,config,calls,request,git,readStamp,now:()=>clock,sleep:async ms=>{clock+=ms;},env:{GITLAB_TOKEN:"fixture-secret"}};
}
function options(f,extra={}){return {cwd:f.cwd,config:f.config,request:f.request,git:f.git,readStamp:f.readStamp,now:f.now,sleep:f.sleep,env:f.env,...extra};}
function ciFixture(f){
  const cwd=path.join(f.buildsDir,"66");fs.mkdirSync(cwd,{mode:0o700});fs.mkdirSync(path.join(cwd,".git"));fs.writeFileSync(path.join(cwd,"patches-bundle.json"),JSON.stringify({version:"1.2.3"}));
  const env={CI_SERVER_HOST:"gitlab.com",CI_PROJECT_ID:"88427867",CI_PROJECT_PATH:"johninnld/nl-morphe-patches",CI_PIPELINE_SOURCE:"api",RUN_LOCAL_PAGES:"true",CI_COMMIT_BRANCH:"main",CI_COMMIT_REF_PROTECTED:"true",CI_COMMIT_SHA:SHA,EXPECTED_PAGES_SHA:SHA,CI_JOB_NAME:"pages_local",CI_JOB_ID:"66",CI_PIPELINE_ID:"55",CI_RUNNER_ID:"7",CI_RUNNER_TAGS:JSON.stringify([TAG]),CI_PROJECT_DIR:cwd,CI_BUILDS_DIR:f.buildsDir};
  const calls=[],run=async(command,args,options)=>{calls.push({command,args,options});if(args.includes("mkdocs")){fs.mkdirSync(path.join(cwd,"public"));fs.writeFileSync(path.join(cwd,"public/index.html"),"site");}};
  const git=(args)=>args.includes("--show-toplevel")?cwd:args.includes("--git-common-dir")?".git":SHA;
  return {cwd,env,config:f.config,run,git,calls};
}
test("API Pages pipelines select only the protected tagged local job; cloud jobs require web opt-in",()=>{
  const config=loadAll(fs.readFileSync(path.join(__dirname,"../.gitlab-ci.yml"),"utf8")).at(-1);
  function allowed(rules,env){for(const rule of rules||[]){if(!rule.if||Function(`return (${rule.if.replace(/\$([A-Z_]+)/g,(_m,key)=>JSON.stringify(env[key]||""))});`)())return rule.when!=="never";}return false;}
  const env={CI_SERVER_HOST:"gitlab.com",CI_PIPELINE_SOURCE:"api",CI_COMMIT_BRANCH:"main",CI_COMMIT_REF_PROTECTED:"true",RUN_LOCAL_PAGES:"true"};
  assert.equal(allowed(config.workflow.rules,env),true);assert.equal(allowed(config.pages_local?.rules,env),true);
  for(const name of ["verify","release","pages"])assert.equal(allowed(config[name].rules,env),false,name);
  for(const change of [{CI_COMMIT_BRANCH:"dev"},{CI_COMMIT_REF_PROTECTED:"false"},{CI_PIPELINE_SOURCE:"push"},{RUN_LOCAL_PAGES:"false"}])assert.equal(allowed(config.pages_local?.rules,{...env,...change}),false);
  assert.deepEqual(config.pages_local.tags,[TAG]);assert.deepEqual(config.pages_local.before_script,[]);assert.equal(config.pages_local.variables.GIT_DEPTH,"1");assert.equal(config.pages_local.variables.GIT_STRATEGY,"clone");assert.equal(config.pages_local.variables.GIT_CLONE_PATH,"$CI_BUILDS_DIR/$CI_JOB_ID");assert.equal(config.pages_local.variables.FF_ENABLE_JOB_CLEANUP,"true");assert.deepEqual(config.pages_local.pages,{publish:"public"});
});
test("pipeline inputs validate explicit opt-ins and SHA without permitting variable overrides",()=>{
  const docs=loadAll(fs.readFileSync(path.join(__dirname,"../.gitlab-ci.yml"),"utf8"));assert.equal(docs.length,2);
  const inputs=docs[0].spec.inputs,config=docs[1];
  for(const name of ["run_local_pages","run_cloud_ci"]){assert.equal(inputs[name].type,"string");assert.equal(inputs[name].default,"false");assert.deepEqual(inputs[name].options,["false","true"]);}
  assert.equal(inputs.expected_pages_sha.type,"string");assert.equal(inputs.expected_pages_sha.default,"");
  const pattern=new RegExp(inputs.expected_pages_sha.regex);assert.equal(pattern.test(SHA),true);assert.equal(pattern.test(""),true);assert.equal(pattern.test("main"),false);assert.equal(pattern.test('" || true'),false);
  assert.equal(config.variables.RUN_LOCAL_PAGES,"$[[ inputs.run_local_pages ]]");assert.equal(config.variables.RUN_CLOUD_CI,"$[[ inputs.run_cloud_ci ]]");assert.equal(config.variables.EXPECTED_PAGES_SHA,"$[[ inputs.expected_pages_sha ]]");
});
test("controller creates only validated flag/SHA inputs, verifies runner and public stamp, persists receipt",async t=>{
  const f=fixture(t),result=await controller().deployPages(options(f));assert.equal(result.verified,true);assert.equal(result.sha,SHA);assert.equal(result.version,"1.2.3");
  const created=f.calls.find(call=>call.method==="POST"&&call.endpoint.endsWith("/pipeline"));
  assert.deepEqual(created.body,{ref:"main",inputs:{run_local_pages:"true",expected_pages_sha:SHA}});assert.equal(Object.hasOwn(created.body,"variables"),false);
  assert.ok(f.calls.every(call=>call.endpoint.startsWith("/projects/88427867/")));assert.ok(!JSON.stringify(created).includes("fixture-secret"));
  assert.equal(JSON.parse(fs.readFileSync(path.join(f.cwd,"build/release-safety/pages-result.json"))).verified,true);
});
test("Pages creation succeeds when the project forbids pipeline-variable overrides",async t=>{
  const f=fixture(t),request=async(endpoint,options)=>{
    if(endpoint.endsWith("/pipeline")&&Object.hasOwn(options.body,"variables"))throw Error("Insufficient permissions to set pipeline variables");
    return f.request(endpoint,options);
  };
  assert.equal((await controller().deployPages(options(f,{request}))).verified,true);
});
test("wrong pipeline SHA, wrong runner, extra jobs and wrong tags cancel rather than verify",async t=>{
  for(const variant of ["sha","runner","extra","tags"]){const f=fixture(t);const request=async(endpoint,options)=>{const value=await f.request(endpoint,options);if(endpoint.endsWith("/pipeline")&&variant==="sha")value.sha="b".repeat(40);if(endpoint.includes("/jobs")){if(variant==="runner")value[0].runner.id=8;if(variant==="extra")value.push({...value[0],id:67,name:"verify"});if(variant==="tags")value[0].tag_list=["shared-linux"];}return value;};
    await assert.rejects(controller().deployPages(options(f,{request})),/SHA|runner|job|tag/i);
    assert.ok(f.calls.some(call=>call.endpoint.endsWith("/cancel")));assert.equal(JSON.parse(fs.readFileSync(path.join(f.cwd,"build/release-safety/pages-result.json"))).verified,false);
  }
});
test("timeout and failed jobs preserve failed receipts and cancel owned pipelines",async t=>{
  for(const status of ["running","failed"]){const f=fixture(t);const request=async(endpoint,options)=>{const value=await f.request(endpoint,options);if(endpoint.includes("/jobs"))value[0].status=status;else if(!endpoint.endsWith("/cancel"))value.status=status;return value;};
    await assert.rejects(controller().deployPages(options(f,{request})),/timeout|failed/i);assert.ok(f.calls.some(call=>call.endpoint.endsWith("/cancel")));
  }
});
test("a stale public marker never satisfies deployment verification",async t=>{
  const f=fixture(t);await assert.rejects(controller().deployPages(options(f,{readStamp:async()=>({sha:SHA,version:"1.2.2"})})),/stamp|timeout/i);
});
test("independent job builds only strict site checks and stamps its own approved checkout",async t=>{
  const f=fixture(t),c=ciFixture(f),result=await job().buildPages(c);assert.deepEqual(result,{sha:SHA,version:"1.2.3"});
  assert.equal(c.calls.length,4);assert.ok(c.calls.every(call=>call.command==="/private/docs/python"));
  assert.deepEqual(c.calls[2].args,["-m","mkdocs","build","--strict","--site-dir","public"]);assert.deepEqual(c.calls[3].args,["scripts/check_docs_site.py","--site-dir","public"]);
  assert.deepEqual(JSON.parse(fs.readFileSync(path.join(c.cwd,"public/local-release.json"))),result);
  assert.ok(fs.existsSync(path.join(f.stateDir,"pages-jobs/66.json")));assert.ok(fs.existsSync(path.join(c.cwd,".local-pages-owner.json")));
});
test("job rejects unprotected/wrong-SHA/wrong-project and arbitrary checkout before building",async t=>{
  for(const changes of [{CI_COMMIT_REF_PROTECTED:"false"},{EXPECTED_PAGES_SHA:"b".repeat(40)},{CI_PROJECT_ID:"1"},{CI_PROJECT_DIR:"/arbitrary/source"}]){const f=fixture(t),c=ciFixture(f);await assert.rejects(job().buildPages({...c,env:{...c.env,...changes}}),/protected|SHA|project|checkout/i);assert.equal(c.calls.length,0);}
});
test("cleanup keeps active or nonquiescent owned jobs and deletes only exact terminal owned workspaces",async t=>{
  const f=fixture(t),c=ciFixture(f);await job().buildPages(c);
  const request=async(endpoint,options)=>{const value=await f.request(endpoint,options);if(endpoint.includes("/jobs"))(Array.isArray(value)?value[0]:value).status="running";return value;};
  await controller().cleanupJobs({config:f.config,request,isQuiescent:()=>true});assert.ok(fs.existsSync(c.cwd));
  await controller().cleanupJobs({config:f.config,request:f.request,isQuiescent:()=>false});assert.ok(fs.existsSync(c.cwd));
  const result=await controller().cleanupJobs({config:f.config,request:f.request,isQuiescent:()=>true});assert.ok(result.cleaned.includes(66));assert.equal(fs.existsSync(c.cwd),false);assert.ok(fs.existsSync(f.cwd));
});
test("tampered markers and symlinked workspaces cannot authorize cleanup",async t=>{
  const f=fixture(t),c=ciFixture(f);await job().buildPages(c);
  const marker=path.join(c.cwd,".local-pages-owner.json");const value=JSON.parse(fs.readFileSync(marker));value.nonce="wrong-owner";fs.writeFileSync(marker,JSON.stringify(value));
  await controller().cleanupJobs({config:f.config,request:f.request,isQuiescent:()=>true});assert.ok(fs.existsSync(c.cwd));
});

test("a Pages job cannot depend on another checkout's shared Git directory",async t=>{
  const f=fixture(t),c=ciFixture(f),git=args=>args.includes("--git-common-dir")?f.cwd:c.git(args);
  await assert.rejects(job().buildPages({...c,git}),/independent|Git|checkout/i);assert.equal(c.calls.length,0);
});
test("cleanup refuses symlinked job paths and preserves arbitrary unmarked directories",async t=>{
  const f=fixture(t),c=ciFixture(f);await job().buildPages(c);
  const saved=c.cwd+"-saved";fs.renameSync(c.cwd,saved);fs.symlinkSync(f.cwd,c.cwd,"dir");
  await controller().cleanupJobs({config:f.config,request:f.request,isQuiescent:()=>true});assert.ok(fs.lstatSync(c.cwd).isSymbolicLink());assert.ok(fs.existsSync(saved));assert.ok(fs.existsSync(path.join(f.cwd,"patches-bundle.json")));
});
test("controller API transport confines its token to the exact GitLab project",async()=>{
  const request=controller().createRequest({env:{GITLAB_TOKEN:"pages-only"},fetcher:async(url,options)=>{assert.equal(url,"https://gitlab.com/api/v4/projects/88427867/pipelines/55");assert.ok(options.headers["PRIVATE-TOKEN"]==="pages-only","Pages API authentication must match its fixture");assert.equal(options.redirect,"error");return {ok:true,status:200,json:async()=>({id:55})};}});
  assert.deepEqual(await request("/projects/88427867/pipelines/55"),{id:55});await assert.rejects(request("//elsewhere.invalid/user"),/project|path/);await assert.rejects(request("/projects/1/pipeline"),/project|path/);
});
test("failed cancellation of a previous pipeline blocks creation of another deployment",async t=>{
  const f=fixture(t),folder=path.join(f.stateDir,"pages-pipelines");fs.mkdirSync(folder,{mode:0o700});
  fs.writeFileSync(path.join(folder,"55.json"),JSON.stringify({projectId:88427867,runnerId:7,pipelineId:55,sha:SHA,pid:process.pid,status:"failed"}),{mode:0o600});
  let created=0;const request=async(endpoint,options={})=>{
    if(endpoint.endsWith("/cancel"))throw Error("controlled cancellation failure");
    if(endpoint.endsWith("/pipeline")){created++;return f.request(endpoint,options);}
    const value=await f.request(endpoint,options);return endpoint.endsWith("/pipelines/55")?{...value,status:"running"}:value;
  };
  await assert.rejects(controller().deployPages(options(f,{request})),/cleanup|previous|pipeline/i);assert.equal(created,0);
  const receipt=JSON.parse(fs.readFileSync(path.join(f.cwd,"build/release-safety/pages-result.json")));assert.equal(receipt.cleanupRequired,true);assert.equal(receipt.verified,false);
});
test("cleanup CLI fails on terminal ownership errors and reports cleanupRequired",async t=>{
  const output=[];t.mock.method(console,"log",value=>output.push(value));
  for(const variant of ["marker","quiescence"]){
    const f=fixture(t),c=ciFixture(f);await job().buildPages(c);
    if(variant==="marker"){const marker=path.join(c.cwd,".local-pages-owner.json"),proof=JSON.parse(fs.readFileSync(marker));proof.nonce="wrong-owner";fs.writeFileSync(marker,JSON.stringify(proof));}
    await assert.rejects(controller().main(["--cleanup"],{config:f.config,env:f.env,request:f.request,isQuiescent:()=>false}),error=>error.cleanupRequired===true);
    const result=JSON.parse(output.at(-1));assert.equal(result.cleanupRequired,true);assert.ok(variant==="marker"?result.errors.length>0:result.terminalPending.includes(66));assert.ok(fs.existsSync(c.cwd));
  }
});
test("public deployment remains verified but CLI fails until terminal cleanup is quiescent",async t=>{
  t.mock.method(console,"log",()=>{});
  for(const variant of ["marker","quiescence"]){
    const f=fixture(t),c=ciFixture(f);let recorded=false,observedCleanupIntent=false;
    const request=async(endpoint,options)=>{
      const value=await f.request(endpoint,options);
      if(endpoint.includes("/pipelines/55/jobs")&&!recorded){
        recorded=true;await job().buildPages(c);
        if(variant==="marker"){const marker=path.join(c.cwd,".local-pages-owner.json"),proof=JSON.parse(fs.readFileSync(marker));proof.nonce="wrong-owner";fs.writeFileSync(marker,JSON.stringify(proof));}
      }
      if(endpoint.endsWith("/jobs/66")){const receipt=JSON.parse(fs.readFileSync(path.join(f.cwd,"build/release-safety/pages-result.json")));observedCleanupIntent=receipt.deploymentVerified===true&&receipt.cleanupRequired===true;}
      return value;
    };
    await assert.rejects(controller().main([],options(f,{request,isQuiescent:()=>false})),error=>error.cleanupRequired===true);
    assert.ok(observedCleanupIntent,"Verified deployment must persist cleanup-required intent before cleanup starts");
    for(const file of [path.join(f.cwd,"build/release-safety/pages-result.json"),path.join(f.stateDir,"pages-pipelines/55.json")]){
      const receipt=JSON.parse(fs.readFileSync(file));assert.equal(receipt.verified,true);assert.equal(receipt.deploymentVerified,true);assert.equal(receipt.cleanupRequired,true);assert.equal(receipt.status,"failed");
      assert.ok(variant==="marker"?receipt.cleanup.errors.length>0:receipt.cleanup.terminalPending.includes(66));
    }
    assert.ok(fs.existsSync(c.cwd));
  }
});
test("active job cleanup is explicitly pending and retryable without deleting its workspace",async t=>{
  const f=fixture(t),c=ciFixture(f);await job().buildPages(c);
  const request=async(endpoint,options)=>{const value=await f.request(endpoint,options);if(endpoint.includes("/jobs/"))value.status="running";return value;};
  t.mock.method(console,"log",()=>{});
  const result=await controller().main(["--cleanup"],{config:f.config,env:f.env,request,isQuiescent:()=>true});
  assert.equal(result.cleanupRequired,true);assert.equal(result.retryable,true);assert.ok(result.pending.includes(66));assert.deepEqual(result.terminalPending,[]);assert.ok(fs.existsSync(c.cwd));
});
test("cleanup and cancellation failures do not replace the original deployment error",async t=>{
  const f=fixture(t);let registered=false;
  const request=async(endpoint,options)=>{
    if(endpoint.endsWith("/pipeline")){registered=true;return f.request(endpoint,options);}
    if(registered){if(endpoint.endsWith("/cancel"))throw Error("secondary cancellation failure");throw Error("primary deployment failure");}
    return f.request(endpoint,options);
  };
  await assert.rejects(controller().deployPages(options(f,{request})),error=>error.message==="primary deployment failure"&&error.cleanupRequired===true);
  const receipt=JSON.parse(fs.readFileSync(path.join(f.cwd,"build/release-safety/pages-result.json")));assert.equal(receipt.error,"primary deployment failure");assert.equal(receipt.cleanupRequired,true);
});
