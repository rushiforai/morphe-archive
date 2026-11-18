"use strict";
const fs=require("node:fs"),path=require("node:path"),os=require("node:os"),{execFileSync}=require("node:child_process");
const {PROJECT_ID,TAG,SHA,TERMINAL,settings,owned,readConfig,directory,writeRecord,processAlive,cleanupOwnedJobs}=require("./pages-job.cjs");
function createRequest({env=process.env,fetcher=fetch}={}){
  if(!env.GITLAB_TOKEN||!/^[A-Za-z0-9._-]+$/.test(env.GITLAB_TOKEN))throw new Error("A separate GitLab API token is required for Pages");
  return async(endpoint,{method="GET",body}={})=>{
    if(!endpoint.startsWith(`/projects/${PROJECT_ID}/`))throw new Error("Unexpected Pages API project/path");
    const headers={"PRIVATE-TOKEN":env.GITLAB_TOKEN,Accept:"application/json"};if(body){headers["Content-Type"]="application/json";body=JSON.stringify(body);}
    const response=await fetcher("https://gitlab.com/api/v4"+endpoint,{method,headers,body,redirect:"error",signal:AbortSignal.timeout(30000)});
    if(!response.ok)throw new Error(`Pages API ${method} returned HTTP ${response.status}`);return response.status===204?null:response.json();
  };
}
function safe(message,env){let value=String(message);for(const [key,secret] of Object.entries(env||{}))if(/TOKEN|SECRET|PASSWORD|API_KEY/.test(key)&&secret)value=value.split(secret).join("[REDACTED]");return value;}
function readGit(args,{cwd,env}){const clean={...env};for(const name of Object.keys(clean))if(/^GIT_(?:DIR|WORK_TREE|INDEX_FILE|COMMON_DIR|OBJECT_DIRECTORY|ALTERNATE_OBJECT_DIRECTORIES|CONFIG.*)$/.test(name))delete clean[name];return execFileSync("git",["--no-replace-objects",...args],{cwd,env:clean,encoding:"utf8",stdio:["ignore","pipe","pipe"]}).trim();}
async function readPublicStamp(url){const response=await fetch(url,{headers:{"Cache-Control":"no-cache"},redirect:"error",signal:AbortSignal.timeout(30000)});if(!response.ok)return null;return response.json();}
function assertPipeline(pipeline,record){if(pipeline.id!==record.pipelineId||pipeline.sha!==record.sha||pipeline.ref!=="main"||(pipeline.source&&pipeline.source!=="api"))throw new Error("Pages pipeline SHA/ref/source mismatch");}
function assertSingleJob(jobs,record,pages){
  if(!Array.isArray(jobs)||jobs.length>1)throw new Error("Pages pipeline selected unexpected jobs");if(!jobs.length)return null;
  const job=jobs[0];
  if(job.name!=="pages_local"||job.ref!=="main"||job.commit?.id!==record.sha||job.pipeline?.id!==record.pipelineId||!job.tag_list?.includes(TAG))throw new Error("Pages job SHA/name/tag mismatch");
  if(job.runner&&job.runner.id!==pages.runnerId)throw new Error("Pages job was assigned to an unexpected runner");
  if(!Number.isSafeInteger(job.id)||job.id<=0)throw new Error("Invalid Pages job ID");return job;
}
function cleanupFailure(message){const error=new Error(message);error.cleanupRequired=true;return error;}
async function cleanupJobs({config,request,isQuiescent,env={}}={}){
  const pages=settings(config),folder=directory(config,"pages-pipelines"),result={active:[],activeJobs:[],cancelling:[],cleaned:[],pending:[],terminalPending:[],errors:[]};
  for(const name of fs.readdirSync(folder)){
    if(!/^\d+\.json$/.test(name))continue;
    let record;
    try{
      const file=path.join(folder,name);owned(file,false,true);record=JSON.parse(fs.readFileSync(file,"utf8"));
      if(record.projectId!==PROJECT_ID||record.runnerId!==pages.runnerId||name!==record.pipelineId+".json"||!SHA.test(record.sha))throw new Error("Unowned Pages pipeline record");
      const pipeline=await request(`/projects/${PROJECT_ID}/pipelines/${record.pipelineId}`);assertPipeline(pipeline,record);
      if(!TERMINAL.has(pipeline.status)){
        if(record.status==="failed"||!processAlive(record.pid)){
          await request(`/projects/${PROJECT_ID}/pipelines/${record.pipelineId}/cancel`,{method:"POST"});result.cancelling.push(record.pipelineId);
        }else result.active.push(record.pipelineId);
      }
      record.remoteStatus=pipeline.status;writeRecord(file,record);
    }catch(error){result.errors.push({pipelineId:record?.pipelineId,error:safe(error.message,env)});}
  }
  const jobs=await cleanupOwnedJobs({config,request,isQuiescent});for(const key of ["cleaned","pending","terminalPending"])result[key].push(...jobs[key]);
  result.activeJobs=jobs.active;result.errors.push(...jobs.errors.map(row=>({...row,error:safe(row.error,env)})));
  result.cleanupRequired=!!(result.active.length||result.cancelling.length||result.pending.length||result.errors.length);
  result.retryable=result.cleanupRequired&&!result.errors.length&&!result.terminalPending.length;return result;
}
async function deployPages({cwd=process.cwd(),env=process.env,config,request,isQuiescent,readStamp=readPublicStamp,sleep=ms=>new Promise(resolve=>setTimeout(resolve,ms)),now=Date.now,git=readGit}={}){
  const pages=settings(config),api=request||createRequest({env}),receiptFile=path.join(cwd,"build/release-safety/pages-result.json");
  fs.mkdirSync(path.dirname(receiptFile),{recursive:true});
  const receipt={format:1,projectId:PROJECT_ID,runnerId:pages.runnerId,pid:process.pid,verified:false,deploymentVerified:false,cleanupRequired:false,status:"starting"};let external;
  function save(){writeRecord(receiptFile,receipt);if(external)writeRecord(external,receipt);}
  save();
  const start=now();
  try{
    if(git(["branch","--show-current"],{cwd,env})!=="main")throw new Error("Only main can update production Pages");
    receipt.sha=git(["rev-parse","HEAD"],{cwd,env});if(!SHA.test(receipt.sha))throw new Error("Invalid Pages source SHA");
    receipt.version=JSON.parse(fs.readFileSync(path.join(cwd,"patches-bundle.json"),"utf8")).version;if(!/^\d+\.\d+\.\d+$/.test(receipt.version))throw new Error("Production Pages requires a stable version");
    const prior=await cleanupJobs({config,request:api,isQuiescent,env});
    if(prior.cleanupRequired){receipt.cleanup=prior;receipt.cleanupRequired=true;throw cleanupFailure("Previous owned Pages pipeline or job cleanup remains pending");}
    const pipeline=await api(`/projects/${PROJECT_ID}/pipeline`,{method:"POST",body:{ref:"main",inputs:{run_local_pages:"true",expected_pages_sha:receipt.sha}}});
    if(!Number.isSafeInteger(pipeline?.id)||pipeline.id<=0)throw new Error("Invalid Pages pipeline ID");
    receipt.pipelineId=pipeline.id;receipt.status="running";external=path.join(directory(config,"pages-pipelines"),pipeline.id+".json");save();assertPipeline(pipeline,receipt);
    let job;
    for(;;){
      const current=await api(`/projects/${PROJECT_ID}/pipelines/${receipt.pipelineId}`);assertPipeline(current,receipt);
      job=assertSingleJob(await api(`/projects/${PROJECT_ID}/pipelines/${receipt.pipelineId}/jobs?per_page=100`),receipt,pages);
      if(job){receipt.jobId=job.id;save();}
      if(job&&TERMINAL.has(job.status)&&job.status!=="success")throw new Error("Pages job failed: "+job.status);
      if(TERMINAL.has(current.status)&&current.status!=="success")throw new Error("Pages pipeline failed: "+current.status);
      if(current.status==="success"&&job?.status==="success"){
        if(job.runner?.id!==pages.runnerId)throw new Error("Successful Pages job has no verified local runner");break;
      }
      if(now()-start>=pages.timeoutMs)throw new Error("Pages pipeline timeout");await sleep(pages.pollMs);
    }
    for(;;){
      let stamp;try{stamp=await readStamp(pages.publicUrl+`local-release.json?sha=${receipt.sha}&check=${now()}`);}catch{stamp=null;}
      if(stamp?.sha===receipt.sha&&stamp?.version===receipt.version)break;
      if(now()-start>=pages.timeoutMs)throw new Error("Public Pages stamp verification timeout");await sleep(pages.pollMs);
    }
    receipt.deploymentVerified=true;receipt.verified=true;receipt.status="deployed";receipt.cleanupRequired=true;save();
    receipt.cleanup=await cleanupJobs({config,request:api,isQuiescent,env});receipt.cleanupRequired=receipt.cleanup.cleanupRequired;save();
    if(receipt.cleanupRequired)throw cleanupFailure("Public Pages deployment is verified, but owned cleanup remains pending");
    return receipt;
  }catch(error){
    receipt.verified=receipt.deploymentVerified;receipt.status="failed";receipt.error=safe(error.message,env);receipt.cleanupRequired||=!!error.cleanupRequired;
    if(receipt.pipelineId&&!receipt.deploymentVerified){try{await api(`/projects/${PROJECT_ID}/pipelines/${receipt.pipelineId}/cancel`,{method:"POST"});receipt.cancelRequested=true;}catch(cancelError){receipt.cancelError=safe(cancelError.message,env);}}
    if(!receipt.cleanup)try{receipt.cleanup=await cleanupJobs({config,request:api,isQuiescent,env});receipt.cleanupRequired||=receipt.cleanup.cleanupRequired;}catch(cleanupError){receipt.cleanupRequired=true;receipt.cleanupError=safe(cleanupError.message,env);}
    let persistenceError;try{save();}catch(saveError){persistenceError=safe(saveError.message,env);}
    const failure=new Error(receipt.error+(persistenceError?"; Pages receipt persistence also failed":""));failure.cleanupRequired=receipt.cleanupRequired;
    if(persistenceError)failure.receiptPersistenceError=persistenceError;throw failure;
  }
}
async function main(argv=process.argv.slice(2),options={}){
  if(argv.length>1||(argv.length===1&&argv[0]!=="--cleanup"))throw new Error("Usage: node pages.cjs [--cleanup]");
  let env=options.env||process.env;const config=options.config||readConfig(env.LOCAL_RELEASE_CONFIG);
  if(!options.request){const file=config.apiKeysFile||path.join(os.homedir(),".ci");owned(file,false,true);env={...env,...require("./credentials.cjs").loadApiKeys(file)};}
  const request=options.request||createRequest({env});
  if(argv.length){
    let result;try{result=await cleanupJobs({...options,config,env,request});}catch(error){throw cleanupFailure(safe(error.message,env));}
    console.log(JSON.stringify(result));
    if(result.errors.length||result.terminalPending.length)throw cleanupFailure("Owned terminal Pages cleanup remains unresolved");return result;
  }
  const result=await deployPages({...options,config,env,request});console.log(JSON.stringify(result));return result;
}
module.exports={createRequest,deployPages,cleanupJobs,main};
if(require.main===module)main().catch(error=>{console.error(error.message);process.exitCode=1;});
