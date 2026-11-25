"use strict";
const fs=require("node:fs"),path=require("node:path"),crypto=require("node:crypto"),{execFileSync}=require("node:child_process");
const PROJECT_ID=88427867,TAG="nl-morphe-pages-macos",SHA=/^[a-f0-9]{40}$/;
const TERMINAL=new Set(["success","failed","canceled","skipped"]);
function owned(file,directory=false,privateMode=false){const stat=fs.lstatSync(file);if(stat.isSymbolicLink()||stat.uid!==process.getuid()||(directory?!stat.isDirectory():!stat.isFile())||(privateMode&&(stat.mode&0o077)))throw new Error("Pages path must be owned, private and not symlinked");}
function readConfig(file){if(!file||!path.isAbsolute(file))throw new Error("LOCAL_RELEASE_CONFIG must name a private absolute JSON file");owned(file,false,true);return JSON.parse(fs.readFileSync(file,"utf8"));}
function settings(config){
  const pages=config?.pages;
  if(!path.isAbsolute(config?.stateDir||"")||!path.isAbsolute(pages?.buildsDir||"")||!Number.isSafeInteger(pages?.runnerId)||pages.runnerId<=0||pages.tag!==TAG)throw new Error("Invalid local Pages runner configuration");
  const url=new URL(pages.publicUrl);if(url.protocol!=="https:"||url.username||url.password||url.search||url.hash)throw new Error("Invalid public Pages URL");
  const timeoutMs=pages.timeoutMs??900000,pollMs=pages.pollMs??2000;if(!Number.isSafeInteger(timeoutMs)||timeoutMs<=0||!Number.isSafeInteger(pollMs)||pollMs<=0)throw new Error("Invalid Pages polling configuration");
  return {...pages,timeoutMs,pollMs,publicUrl:url.href.replace(/\/?$/,"/")};
}
function directory(config,name){if(!fs.existsSync(config.stateDir))fs.mkdirSync(config.stateDir,{recursive:true,mode:0o700});owned(config.stateDir,true,true);const file=path.join(config.stateDir,name);if(!fs.existsSync(file))fs.mkdirSync(file,{mode:0o700});owned(file,true,true);return file;}
function writeRecord(file,value){const tmp=file+"."+crypto.randomUUID()+".tmp";fs.writeFileSync(tmp,JSON.stringify(value,null,2)+"\n",{mode:0o600,flag:"wx"});fs.renameSync(tmp,file);}
function git(args,{cwd,env}){return execFileSync("git",["--no-replace-objects",...args],{cwd,env,encoding:"utf8",stdio:["ignore","pipe","pipe"]}).trim();}
function tags(value){try{return value.startsWith("[")?JSON.parse(value):value.split(",").map(tag=>tag.trim());}catch{return [];}}
async function buildPages({cwd=process.cwd(),env=process.env,config,run=execFileSync,git:readGit=git}={}){
  const pages=settings(config);
  if(env.CI_SERVER_HOST!=="gitlab.com"||env.CI_PROJECT_ID!==String(PROJECT_ID)||env.CI_PROJECT_PATH!=="johninnld/nl-morphe-patches")throw new Error("Pages job project mismatch");
  if(env.CI_PIPELINE_SOURCE!=="api"||env.RUN_LOCAL_PAGES!=="true"||env.CI_COMMIT_BRANCH!=="main"||env.CI_COMMIT_REF_PROTECTED!=="true")throw new Error("Pages requires an API-triggered protected main checkout");
  if(!SHA.test(env.EXPECTED_PAGES_SHA||"")||env.CI_COMMIT_SHA!==env.EXPECTED_PAGES_SHA)throw new Error("Pages expected SHA mismatch");
  if(env.CI_JOB_NAME!=="pages_local"||env.CI_RUNNER_ID!==String(pages.runnerId)||!tags(env.CI_RUNNER_TAGS||"").includes(TAG)||!/^\d+$/.test(env.CI_JOB_ID||"")||!/^\d+$/.test(env.CI_PIPELINE_ID||""))throw new Error("Pages job runner/tag/identity mismatch");
  owned(pages.buildsDir,true,true);const builds=fs.realpathSync(pages.buildsDir),workspace=path.join(builds,env.CI_JOB_ID);
  if(fs.realpathSync(env.CI_BUILDS_DIR)!==builds||path.resolve(env.CI_PROJECT_DIR||"")!==path.resolve(cwd)||fs.realpathSync(cwd)!==workspace)throw new Error("Pages checkout must be its unique owned runner job directory");
  owned(cwd,true);const buildEnv={...env,...config.environment};
  for(const key of Object.keys(buildEnv))if(/TOKEN|SECRET|PASSWORD|API_KEY|SIGNING_KEY/.test(key)||/^GIT_(?:DIR|WORK_TREE|INDEX_FILE|COMMON_DIR|OBJECT_DIRECTORY|ALTERNATE_OBJECT_DIRECTORIES|CONFIG.*)$/.test(key))delete buildEnv[key];
  if(readGit(["rev-parse","HEAD"],{cwd,env:buildEnv})!==env.EXPECTED_PAGES_SHA||fs.realpathSync(readGit(["rev-parse","--show-toplevel"],{cwd,env:buildEnv}))!==workspace)throw new Error("Pages checkout SHA/root mismatch");
  owned(path.join(cwd,".git"),true);if(fs.realpathSync(path.resolve(cwd,readGit(["rev-parse","--git-common-dir"],{cwd,env:buildEnv})))!==path.join(workspace,".git"))throw new Error("Pages requires an independent Git checkout");
  const manifest=JSON.parse(fs.readFileSync(path.join(cwd,"patches-bundle.json"),"utf8"));if(!/^\d+\.\d+\.\d+$/.test(manifest.version))throw new Error("Production Pages requires a stable main version");
  const stamp={sha:env.EXPECTED_PAGES_SHA,version:manifest.version};
  const record={format:1,projectId:PROJECT_ID,runnerId:pages.runnerId,jobId:Number(env.CI_JOB_ID),pipelineId:Number(env.CI_PIPELINE_ID),...stamp,workspace,buildsDir:builds,nonce:crypto.randomUUID(),pid:process.pid,phase:"building"};
  const file=path.join(directory(config,"pages-jobs"),record.jobId+".json"),marker=path.join(cwd,".local-pages-owner.json");
  if(fs.existsSync(file)||fs.existsSync(marker))throw new Error("Pages job identity was already recorded");
  writeRecord(file,record);writeRecord(marker,record);
  try{
    Object.assign(buildEnv,{GITLAB_REPOSITORY:"johninnld/nl-morphe-patches",SITE_URL:pages.publicUrl,REPOSITORY_URL:"https://gitlab.com/johninnld/nl-morphe-patches",REPOSITORY_NAME:"johninnld/nl-morphe-patches",REPOSITORY_ICON:"simple/gitlab",SOCIAL_IMAGE_URL:pages.publicUrl+"assets/brand/social-card.png"});
    const python=env.LOCAL_RELEASE_PYTHON||config.environment?.LOCAL_RELEASE_PYTHON||".venv/bin/python";
    for(const args of [["scripts/generate_docs_catalog.py"],["scripts/check_docs_app_pages.py"],["-m","mkdocs","build","--strict","--site-dir","public"],["scripts/check_docs_site.py","--site-dir","public"]]){
      const result=await run(python,args,{cwd,env:buildEnv,stdio:"inherit"});if(result?.error)throw result.error;if(result?.signal||(typeof result?.status==="number"&&result.status!==0))throw new Error("Pages documentation command failed");
    }
    if(!fs.statSync(path.join(cwd,"public/index.html")).size)throw new Error("Pages index is empty");
    fs.writeFileSync(path.join(cwd,"public/local-release.json"),JSON.stringify(stamp)+"\n");record.buildSucceeded=true;return stamp;
  }finally{record.phase="script-finished";writeRecord(file,record);}
}
function processAlive(pid){try{process.kill(pid,0);return true;}catch(error){return error.code!=="ESRCH";}}
function isQuiescent(workspace,record){
  if(processAlive(record.pid))return false;
  try{const value=execFileSync("lsof",["-n","-P","+D",workspace],{encoding:"utf8",stdio:["ignore","pipe","pipe"],timeout:30000});return !value.trim();}
  catch(error){return error.status===1&&!String(error.stdout||"").trim()&&!String(error.stderr||"").trim();}
}
function assertJob(job,record,pages){if(job.id!==record.jobId||job.name!=="pages_local"||job.runner?.id!==pages.runnerId||job.ref!=="main"||job.commit?.id!==record.sha||job.pipeline?.id!==record.pipelineId||!job.tag_list?.includes(TAG))throw new Error("Pages cleanup job identity/runner/tag mismatch");}
async function cleanupOwnedJobs({config,request,isQuiescent:quiet=isQuiescent}={}){
  const pages=settings(config),folder=directory(config,"pages-jobs"),result={cleaned:[],pending:[],active:[],terminalPending:[],errors:[]};
  owned(pages.buildsDir,true,true);const builds=fs.realpathSync(pages.buildsDir);
  for(const name of fs.readdirSync(folder)){
    if(!/^\d+\.json$/.test(name))continue;
    const file=path.join(folder,name);let record;
    try{
      owned(file,false,true);record=JSON.parse(fs.readFileSync(file,"utf8"));if(record.phase==="cleaned")continue;
      if(record.format!==1||record.projectId!==PROJECT_ID||record.runnerId!==pages.runnerId||name!==record.jobId+".json"||!Number.isSafeInteger(record.jobId)||record.jobId<=0||record.buildsDir!==builds||record.workspace!==path.join(builds,String(record.jobId)))throw new Error("Unowned Pages workspace record");
      const current=await request(`/projects/${PROJECT_ID}/jobs/${record.jobId}`);assertJob(current,record,pages);
      if(!TERMINAL.has(current.status)){result.pending.push(record.jobId);result.active.push(record.jobId);continue;}
      if(fs.existsSync(record.workspace)){
        owned(record.workspace,true);if(fs.realpathSync(record.workspace)!==record.workspace)throw new Error("Symlinked Pages workspace");
        const marker=path.join(record.workspace,".local-pages-owner.json");owned(marker,false,true);const proof=JSON.parse(fs.readFileSync(marker,"utf8"));
        for(const key of ["projectId","runnerId","jobId","pipelineId","sha","workspace","buildsDir","nonce","pid"])if(proof[key]!==record[key])throw new Error("Pages workspace ownership marker differs");
        if(!await quiet(record.workspace,record)){result.pending.push(record.jobId);result.terminalPending.push(record.jobId);continue;}
        fs.rmSync(record.workspace,{recursive:true});
      }
      record.phase="cleaned";writeRecord(file,record);result.cleaned.push(record.jobId);
    }catch(error){result.errors.push({jobId:record?.jobId||Number(name.slice(0,-5)),error:error.message});}
  }
  result.cleanupRequired=!!(result.pending.length||result.errors.length);result.retryable=result.cleanupRequired&&!result.errors.length&&!result.terminalPending.length;
  return result;
}
async function main(){const config=readConfig(process.env.LOCAL_RELEASE_CONFIG);console.log(JSON.stringify(await buildPages({config})));}
module.exports={PROJECT_ID,TAG,SHA,TERMINAL,settings,owned,readConfig,directory,writeRecord,processAlive,buildPages,cleanupOwnedJobs,isQuiescent};
if(require.main===module)main().catch(error=>{console.error(error.message);process.exitCode=1;});
