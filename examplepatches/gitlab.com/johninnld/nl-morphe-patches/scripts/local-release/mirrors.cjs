"use strict";
/** 60 s plus one second per 64 KiB, so bundle uploads survive a slow uplink (~64 KB/s). */
const transferTimeout=bytes=>60000+Math.ceil(Math.max(0,bytes||0)/65536)*1000;
const fs=require("node:fs");
const path=require("node:path");
const os=require("node:os");
const crypto=require("node:crypto");
const {execFileSync}=require("node:child_process");
const {verifyBundle}=require("../../.forgejo/scripts/bundle.cjs");
const {download:downloadCanonical}=require("../../.gitlab/scripts/bundle.cjs");
const TARGETS={
  codeberg:{base:"https://codeberg.org",repository:"JohninNL/nl-morphe-patches",owner:"JohninNL",token:"CODEBERG_TOKEN",api:"/api/v1",sshKey:"CODEBERG_SSH_KEY",ssh:"git@codeberg.org:JohninNL/nl-morphe-patches.git"},
  gitgud:{base:"https://gitgud.io",repository:"JohninNL/nl-morphe-patches",owner:"JohninNL",token:"GITGUD_TOKEN",api:"/api/v4",sshKey:"GITGUD_SSH_KEY",ssh:"git@ssh.gitgud.io:JohninNL/nl-morphe-patches.git"},
};
// GitGud is excluded from automated releases. Its target and helpers remain for
// the legacy manual mirror workflow, but only list it explicitly for tests or a
// deliberate legacy run.
const ENABLED_TARGETS=(process.env.MORPHE_RELEASE_MIRRORS||"codeberg").split(",").map(value=>value.trim()).filter(Boolean);
for(const name of ENABLED_TARGETS)if(!TARGETS[name])throw new Error("Unknown release mirror: "+name);
function enabledTargets(){return ENABLED_TARGETS;}
const CANONICAL={base:"https://gitlab.com",repository:"johninnld/nl-morphe-patches",owner:"johninnld",token:"GITLAB_TOKEN",sshKey:"GITLAB_SSH_KEY",ssh:"git@gitlab.com:johninnld/nl-morphe-patches.git"};
const CODEBERG_RELEASE_LIMIT=5;
const SHA=/^[a-f0-9]{40}$/;
// A destination's network can drop or reset a request for reasons outside the
// release (slow or flapping uplink, proxy resets, 5xx). Name the request and its
// network cause instead of undici's bare "fetch failed", and mark it transient.
const TRANSIENT_STATUS=new Set([408,425,429,500,502,503,504]);
const TRANSIENT_TEXT=/fetch failed|network failure|ECONNRESET|ECONNREFUSED|ECONNABORTED|ETIMEDOUT|EPIPE|EAI_AGAIN|ENOTFOUND|EHOSTUNREACH|ENETUNREACH|UND_ERR_|socket hang up|other side closed|aborted due to timeout|Connection (?:reset|closed|refused|timed out)|Could not resolve host|early EOF|remote end hung up|unexpected disconnect|kex_exchange_identification|Operation timed out/i;
function networkError(label,error){
  let cause=error,code="";
  for(let depth=0;cause&&depth<4&&!code;depth++){
    code=typeof cause.code==="string"?cause.code:cause.name&&!["Error","TypeError"].includes(cause.name)?cause.name:"";cause=cause.cause;
  }
  const wrapped=new Error(`${label}: network failure (${/^[A-Za-z0-9_]+$/.test(code)?code:"unknown"})`);wrapped.transient=true;return wrapped;
}
function transient(error){return error?.transient===true||TRANSIENT_STATUS.has(error?.status)||TRANSIENT_TEXT.test(String(error?.message||"")+" "+String(error?.stderr||""));}
const sleep=milliseconds=>new Promise(resolve=>setTimeout(resolve,milliseconds));
/** Every target step is idempotent, so a transient failure re-runs the whole target. */
async function retryTransient(task,{attempts=3,delays=[20000,60000],pause=sleep}={}){
  for(let attempt=1;;attempt++){
    try{return await task();}
    catch(error){if(attempt>=attempts||!transient(error))throw error;await pause(delays[Math.min(attempt-1,delays.length-1)]);}
  }
}
function target(name){const value=TARGETS[name];if(!value)throw new Error("Unknown release mirror");return value;}
function tokenFor(name,env){const value=env[target(name).token];if(!value||!/^[A-Za-z0-9._-]+$/.test(value))throw new Error(target(name).token+" is required");return value;}
function createRequest({env=process.env,fetcher=fetch}={}) {
  return async(name,endpoint,{method="GET",body,binary=false}={})=>{
    const destination=target(name),token=tokenFor(name,env);
    if(!endpoint.startsWith("/")||endpoint.startsWith("//"))throw new Error("Invalid mirror API path");
    const headers=name==="codeberg"?{Authorization:`token ${token}`,Accept:"application/json"}:{"PRIVATE-TOKEN":token,Accept:"application/json"};
    if(Buffer.isBuffer(body))headers["Content-Type"]="application/octet-stream";
    else if(body&&!(body instanceof FormData)){headers["Content-Type"]="application/json";body=JSON.stringify(body);}
    const size=Buffer.isBuffer(body)?body.length:body instanceof FormData?[...body.values()].reduce((total,value)=>total+(value?.size||0),0):0;
    let response;
    try{response=await fetcher(destination.base+destination.api+endpoint,{method,headers,body,redirect:"error",signal:AbortSignal.timeout(transferTimeout(size))});}
    catch(error){throw networkError(`${name} ${method} ${endpoint.split("?")[0]}`,error);}
    if(response.status===404&&method==="GET")return null;
    if(!response.ok){
      const error=new Error(`${name} ${method} ${endpoint}: HTTP ${response.status}`);error.status=response.status;error.transient=TRANSIENT_STATUS.has(response.status);
      // Keep only the known machine-readable code; response bodies can contain sensitive details.
      try{const detail=await response.json();if(detail?.error==="insufficient_granular_scope")error.errorCode="insufficient_granular_scope";}catch{}
      throw error;
    }
    if(response.status===204)return null;
    return binary?Buffer.from(await response.arrayBuffer()):response.json();
  };
}
function gitRemote(name,env=process.env){
  const destination=name==="gitlab"?CANONICAL:target(name);
  return env[destination.sshKey]?destination.ssh:`${destination.base}/${destination.repository}.git`;
}
function gitEnvironment(name,env=process.env){
  const destination=name==="gitlab"?CANONICAL:target(name),key=env[destination.sshKey];
  const isolated={...env,GIT_TERMINAL_PROMPT:"0",GIT_TRACE:"0",GIT_TRACE_CURL:"0"};
  for(const variable of Object.keys(isolated))if(/TOKEN|PASSWORD|SIGNING_KEY|API_KEY|SECRET|_SSH_KEY$/.test(variable)||/^GIT_(?:SSH|SSH_COMMAND|SSH_VARIANT|DIR|WORK_TREE|INDEX_FILE|COMMON_DIR|OBJECT_DIRECTORY|ALTERNATE_OBJECT_DIRECTORIES|CONFIG.*)$/.test(variable))delete isolated[variable];
  if(key){
    if(typeof key!=="string"||key.includes("\0"))throw new Error("Invalid destination SSH key path");
    const file=key.startsWith("~/")?path.join(os.homedir(),key.slice(2)):key;
    if(!path.isAbsolute(file))throw new Error("Destination SSH key path must be absolute");
    const quoted="'"+file.replace(/'/g,"'\\''")+"'";
    return {...isolated,GIT_CONFIG_COUNT:"0",GIT_SSH_VARIANT:"ssh",GIT_SSH_COMMAND:`ssh -i ${quoted} -o IdentitiesOnly=yes -o BatchMode=yes -o StrictHostKeyChecking=yes`};
  }
  const token=env[destination.token];
  if(!token||!/^[A-Za-z0-9._-]+$/.test(token))throw new Error(destination.token+" is required");
  return {...isolated,GIT_CONFIG_COUNT:"2",GIT_CONFIG_KEY_0:`http.${destination.base}/.extraheader`,GIT_CONFIG_VALUE_0:`Authorization: Basic ${Buffer.from(destination.owner+":"+token).toString("base64")}`,GIT_CONFIG_KEY_1:"http.followRedirects",GIT_CONFIG_VALUE_1:"false"};
}
function defaultGit(args,{cwd=process.cwd(),env=process.env}={}){
  try{return execFileSync("git",["--no-replace-objects",...args],{cwd,env,encoding:"utf8",stdio:["ignore","pipe","pipe"],timeout:120000,maxBuffer:64*1024*1024}).trim();}
  catch{throw new Error("Mirror Git operation failed: "+args[0]);}
}
function redact(message,env){
  let text=String(message);
  for(const [key,value] of Object.entries(env))if(/TOKEN|PASSWORD|SIGNING_KEY|API_KEY|SECRET/.test(key)&&value){
    for(const secret of [value,encodeURIComponent(value),Buffer.from("JohninNL:"+value).toString("base64")])text=text.split(secret).join("[REDACTED]");
  }
  return text;
}
function remoteRefs(name,context,patterns){
  const text=context.git(["ls-remote",gitRemote(name,context.env),...patterns],{cwd:context.cwd,env:gitEnvironment(name,context.env)});
  const refs={};
  for(const line of text.split("\n").filter(Boolean)){
    const [sha,ref]=line.split(/\s+/);if(!SHA.test(sha)||!ref?.startsWith("refs/")||refs[ref])throw new Error("Invalid remote ref response");refs[ref]=sha;
  }
  return refs;
}
function sourceContext({cwd=process.cwd(),env=process.env,git=defaultGit,request,download,canonicalDownload=downloadCanonical,retry}={}){
  const options={cwd,env},branch=git(["branch","--show-current"],options);
  if(branch!=="main")throw new Error("Only main can publish release mirrors");
  const head=git(["rev-parse","HEAD"],options);if(!SHA.test(head))throw new Error("Invalid canonical source head");
  if(git(["rev-parse","--is-shallow-repository"],options)!=="false")throw new Error("Mirror identity audit requires complete, non-shallow history");
  for(const role of ["AUTHOR","COMMITTER"])if(!git(["var",`GIT_${role}_IDENT`],options).startsWith("johninnl <349981574+johninnl@users.noreply.github.com> "))throw new Error("Mirror Git identity must be johninnl");
  const fields=git(["log","--all","HEAD","--format=%H%x00%an%x00%ae%x00%cn%x00%ce%x00%B%x00"],options).split("\0");
  for(let i=0;i+5<fields.length;i+=6)if(fields[i+1]!=="johninnl"||fields[i+2]!=="349981574+johninnl@users.noreply.github.com"||fields[i+3]!=="johninnl"||fields[i+4]!=="349981574+johninnl@users.noreply.github.com"||/^\s*co-authored-by\s*:/im.test(fields[i+5]))throw new Error("Mirror source history must contain only johninnl metadata");
  const context={cwd,env,git,branch,head,canonicalDownload,retry,request:request||createRequest({env}),download:download||createDownload({env})};
  if(remoteRefs("gitlab",context,[`refs/heads/${branch}`])[`refs/heads/${branch}`]!==head)throw new Error("Canonical GitLab branch moved or differs from this checkout");
  return context;
}
function createDownload({env=process.env,fetcher=fetch}={}){
  return async(name,address,size,{authenticated=false}={})=>{
    const destination=target(name);let url=new URL(address),sendToken=authenticated;
    if(url.origin!==destination.base)throw new Error("Unexpected mirror download host");
    for(let redirects=0;redirects<6;redirects++){
      const options={redirect:"manual",signal:AbortSignal.timeout(transferTimeout(size))};
      if(sendToken)options.headers=name==="codeberg"?{Authorization:`token ${tokenFor(name,env)}`}:{"PRIVATE-TOKEN":tokenFor(name,env)};
      let response;
      try{response=await fetcher(url.href,options);}catch(error){throw networkError(`${name} download ${url.pathname}`,error);}
      if(response.status>=300&&response.status<400){const location=response.headers.get("location");if(!location)throw new Error("Mirror download redirect is missing its location");const next=new URL(location,url);if(next.protocol!=="https:")throw new Error("Insecure mirror download redirect");if(next.origin!==destination.base)sendToken=false;url=next;continue;}
      if(!response.ok){const error=new Error(`Mirror download returned HTTP ${response.status}`);error.status=response.status;error.transient=TRANSIENT_STATUS.has(response.status);throw error;}
      const bytes=Buffer.from(await response.arrayBuffer());if(bytes.length!==size||!bytes.length)throw new Error("Mirror download size mismatch");return bytes;
    }
    throw new Error("Too many mirror download redirects");
  };
}
async function checkTarget(name,context){
  const destination=target(name),user=await context.request(name,"/user");
  if((name==="codeberg"?user?.login:user?.username)!==destination.owner)throw new Error(name+" token must belong to JohninNL");
  const project=name==="codeberg"?`/repos/${destination.repository}`:`/projects/${encodeURIComponent(destination.repository)}`;
  const repository=await context.request(name,project);
  if(name==="codeberg"){
    if(repository?.full_name!==destination.repository||repository.owner?.login!==destination.owner||repository.permissions?.push!==true)throw new Error("Codeberg project ownership/write permission mismatch");
  }else{
    const access=Math.max(repository?.permissions?.project_access?.access_level||0,repository?.permissions?.group_access?.access_level||0);
    if(repository?.path_with_namespace!==destination.repository||repository.namespace?.path!==destination.owner||access<40)throw new Error("GitGud project ownership/Maintainer permission mismatch");
    let token,metadataUnavailable=false;
    try{token=await context.request(name,"/personal_access_tokens/self");}
    catch(error){
      // Fine-grained keys need not grant PersonalAccessTokenRead just to publish releases.
      if(error.status!==403||error.errorCode!=="insufficient_granular_scope")throw error;
      metadataUnavailable=true;
    }
    if(!metadataUnavailable){
      const granular=token?.granular===true||token?.granular_scopes!==null&&typeof token?.granular_scopes==="object";
      if(!(granular||Array.isArray(token?.scopes)&&token.scopes.includes("api"))||token.active===false||token.revoked===true)throw new Error("GitGud token requires active api scope or fine-grained metadata");
      if(token.user_id!==undefined&&token.user_id!==user.id)throw new Error("GitGud token metadata belongs to a different user");
    }
  }
  const refs=remoteRefs(name,context,[`refs/heads/${context.branch}`,"refs/tags/*"]);
  const localTags={};for(const line of context.git(["for-each-ref","--format=%(objectname) %(refname)","refs/tags"],{cwd:context.cwd,env:context.env}).split("\n").filter(Boolean)){const [sha,ref]=line.split(/\s+/);localTags[ref]=sha;}
  for(const [ref,sha] of Object.entries(refs))if(!ref.endsWith("^{}")&&ref.startsWith("refs/tags/")&&localTags[ref]&&localTags[ref]!==sha)throw new Error(name+" has a conflicting tag: "+ref);
  const previous=refs[`refs/heads/${context.branch}`];
  if(previous&&previous!==context.head){
    const env=gitEnvironment(name,context.env),remote=gitRemote(name,context.env);
    context.git(["fetch","--no-tags","--no-write-fetch-head",remote,`refs/heads/${context.branch}`],{cwd:context.cwd,env});
    try{context.git(["merge-base","--is-ancestor",previous,context.head],{cwd:context.cwd,env});}catch{throw new Error(name+" branch is not a fast-forward of canonical source");}
  }
  return {refs};
}
async function settledTargets(context,task){
  const names=enabledTargets(),settled=await Promise.allSettled(names.map(name=>retryTransient(()=>task(name),context.retry)));
  const targets={};settled.forEach((row,index)=>{targets[names[index]]=row.status==="fulfilled"?{status:"fulfilled",...row.value}:{status:"rejected",error:redact(row.reason?.message||"Mirror failed",context.env)};});
  return {format:1,branch:context.branch,head:context.head,complete:settled.every(row=>row.status==="fulfilled"),targets};
}
async function preflight(options={}){
  const context=sourceContext(options);
  return settledTargets(context,async name=>{await checkTarget(name,context);return {checked:true};});
}
async function canonicalRelease(context){
  const read=file=>JSON.parse(fs.readFileSync(path.join(context.cwd,file),"utf8"));
  const receipt=read("build/release-safety/gitlab-result.json");
  if(receipt.preview)throw new Error("Preview receipts cannot publish release mirrors");
  if(receipt.published===false)return null;
  const manifest=read("patches-bundle.json"),version=receipt.version;
  if(JSON.stringify(JSON.parse(context.git(["show","HEAD:patches-bundle.json"],{cwd:context.cwd,env:context.env})))!==JSON.stringify(manifest))throw new Error("Canonical manifest differs from committed release metadata");
  if(receipt.branch!==context.branch||!/^\d+\.\d+\.\d+$/.test(version)||manifest.version!==version)throw new Error("Canonical release branch/channel/version mismatch");
  const tag=`v${version}`,filename=`patches-${version}.mpp`,gitOptions={cwd:context.cwd,env:context.env};
  const tagSha=context.git(["rev-parse",`refs/tags/${tag}`],gitOptions);
  if(!SHA.test(tagSha)||context.git(["rev-parse",`refs/tags/${tag}^{commit}`],gitOptions)!==context.head)throw new Error("Canonical release tag is not at this source commit");
  const refs=remoteRefs("gitlab",context,[`refs/tags/${tag}`,`refs/tags/${tag}^{}`]);
  if(refs[`refs/tags/${tag}`]!==tagSha||(refs[`refs/tags/${tag}^{}`]||tagSha)!==context.head)throw new Error("Canonical GitLab release tag differs from the local tag");
  const key=fs.readFileSync(path.join(context.cwd,"morphe-signing.pub"),"utf8").trim();
  if(context.git(["show","HEAD:morphe-signing.pub"],gitOptions).trim()!==key)throw new Error("Canonical signing key differs from committed release metadata");
  if(manifest.public_key?.trim()!==key||manifest.download_url!==`${CANONICAL.base}/${CANONICAL.repository}/-/releases/${tag}/downloads/${filename}`)throw new Error("Canonical release manifest/signing identity mismatch");
  // Mirrors must publish the already released canonical file, never a local
  // rebuild: signing is non-deterministic, so a retry's rebuilt bundle is
  // different valid bytes. Source the artifact from the published URL.
  const bytes=await context.canonicalDownload(manifest.download_url,null),hash=verifyBundle(bytes,key);
  return {version,tag,tagSha,filename,key,bytes,hash,canonicalUrl:manifest.download_url,notes:manifest.description||""};
}
function syncRefs(name,context,release,refs){
  const branchRef=`refs/heads/${context.branch}`,tagRef=`refs/tags/${release.tag}`;
  if(refs[tagRef]&&refs[tagRef]!==release.tagSha)throw new Error(name+" release tag conflicts with canonical source");
  if(refs[branchRef]!==context.head||refs[tagRef]!==release.tagSha){
    if(remoteRefs("gitlab",context,[branchRef])[branchRef]!==context.head)throw new Error("Canonical GitLab branch moved before mirror push");
    context.git(["push","--atomic",gitRemote(name,context.env),`${context.head}:${branchRef}`,`${release.tagSha}:${tagRef}`],{cwd:context.cwd,env:gitEnvironment(name,context.env)});
  }
  const actual=remoteRefs(name,context,[branchRef,tagRef]);
  if(actual[branchRef]!==context.head||actual[tagRef]!==release.tagSha)throw new Error(name+" source refs do not match canonical source");
}
function sameBundle(bytes,release){if(!bytes||verifyBundle(bytes,release.key)!==release.hash)throw new Error("Mirror asset differs from the canonical signed bytes");}
async function pruneCodebergReleases(context,request,currentTag){
  const endpoint=`/repos/${TARGETS.codeberg.repository}/releases?limit=50`;
  const releases=await context.request("codeberg",endpoint);
  if(!Array.isArray(releases))throw new Error("Codeberg release list is invalid");
  const ordered=releases.slice().sort((left,right)=>{
    const leftTime=Date.parse(left.created_at),rightTime=Date.parse(right.created_at);
    return Number.isFinite(leftTime)&&Number.isFinite(rightTime)?leftTime-rightTime:Number(left.id)-Number(right.id);
  });
  const excess=ordered.slice(0,Math.max(0,ordered.length-CODEBERG_RELEASE_LIMIT));
  for(const release of excess){
    if(!release||!Number.isSafeInteger(release.id)||typeof release.tag_name!=="string")throw new Error("Codeberg release list contains an invalid entry");
    if(release.tag_name===currentTag)throw new Error("Codeberg release pruning selected the release being published");
    await request(`/repos/${TARGETS.codeberg.repository}/releases/${release.id}`,{method:"DELETE"});
  }
  return excess.length;
}
async function codebergRelease(context,source){
  const destination=TARGETS.codeberg,endpoint=`/repos/${destination.repository}/releases`,request=(url,options)=>context.request("codeberg",url,options);
  const url=`${destination.base}/${destination.repository}/releases/download/${source.tag}/${source.filename}`;
  let release=await request(`${endpoint}/tags/${encodeURIComponent(source.tag)}`);
  const valid=value=>{if(value?.tag_name!==source.tag||value.author?.login!==destination.owner||value.prerelease!==false)throw new Error("Codeberg release owner/tag/channel mismatch");};
  if(release)valid(release);
  else{release=await request(endpoint,{method:"POST",body:{tag_name:source.tag,target_commitish:context.head,name:`Dutch App Patches ${source.version}`,body:source.notes,draft:true,prerelease:false}});valid(release);}
  const assets=await request(`${endpoint}/${release.id}/assets`),matches=assets.filter(asset=>asset.name===source.filename);
  if(matches.length>1)throw new Error("Codeberg has duplicate conflicting assets");
  let asset=matches[0];
  if(asset){
    // Decide by bytes, not by URL formatting: an identical asset is left
    // untouched, a wrong-byte asset is replaced with the canonical artifact.
    let hosted=null;
    if(asset.size===source.bytes.length){try{hosted=await context.download("codeberg",url,asset.size,{authenticated:release.draft});}catch{hosted=null;}}
    if(!hosted||verifyBundle(hosted,source.key)!==source.hash){
      await request(`${endpoint}/${release.id}/assets/${asset.id}`,{method:"DELETE"});
      asset=null;
    }
  }
  if(!asset){const form=new FormData();form.set("attachment",new Blob([source.bytes],{type:"application/octet-stream"}),source.filename);asset=await request(`${endpoint}/${release.id}/assets?name=${encodeURIComponent(source.filename)}`,{method:"POST",body:form});}
  if(asset.name!==source.filename||asset.size!==source.bytes.length)throw new Error("Codeberg asset metadata conflicts with canonical bundle");
  sameBundle(await context.download("codeberg",url,asset.size,{authenticated:release.draft}),source);
  if(release.draft){release=await request(`${endpoint}/${release.id}`,{method:"PATCH",body:{draft:false}});valid(release);if(release.draft)throw new Error("Codeberg release remained a draft");}
  sameBundle(await context.download("codeberg",url,asset.size),source);
  await pruneCodebergReleases(context,request,source.tag);
  return {url:`${destination.base}/${destination.repository}/releases/tag/${source.tag}`,sha256:source.hash,version:source.version};
}
async function gitgudRelease(context,source){
  const destination=TARGETS.gitgud,project=`/projects/${encodeURIComponent(destination.repository)}`,endpoint=`${project}/releases`,request=(url,options)=>context.request("gitgud",url,options);
  const packagePath=`${project}/packages/generic/morphe-patches/${source.version}/${source.filename}`,packageUrl=destination.base+destination.api+packagePath;
  let release=await request(`${endpoint}/${source.tag}`);
  const valid=value=>{if(value?.tag_name!==source.tag||value.author?.username!==destination.owner||value.commit?.id!==context.head||value.upcoming_release)throw new Error("GitGud release owner/tag/source mismatch");};
  if(release)valid(release);
  const links=release?.assets?.links?.filter(link=>link.name===source.filename)||[];
  if(links.length>1||links.some(link=>link.url!==packageUrl))throw new Error("GitGud release asset link conflicts with canonical bundle");
  let stored=await request(packagePath,{binary:true});
  if(!stored){await request(packagePath,{method:"PUT",body:source.bytes});stored=await request(packagePath,{binary:true});}
  sameBundle(stored,source);sameBundle(await context.download("gitgud",packageUrl,source.bytes.length),source);
  const link={name:source.filename,url:packageUrl,direct_asset_path:`/${source.filename}`,link_type:"package"};
  if(!release){release=await request(endpoint,{method:"POST",body:{tag_name:source.tag,ref:context.head,name:`Dutch App Patches ${source.version}`,description:source.notes,assets:{links:[link]}}});valid(release);}
  else if(!links.length)await request(`${endpoint}/${source.tag}/assets/links`,{method:"POST",body:link});
  release=await request(`${endpoint}/${source.tag}`);valid(release);
  if(!release.assets?.links?.some(value=>value.name===source.filename&&value.url===packageUrl))throw new Error("GitGud release is missing its exact package link");
  const url=`${destination.base}/${destination.repository}/-/releases/${source.tag}/downloads/${source.filename}`;
  sameBundle(await context.download("gitgud",url,source.bytes.length),source);
  return {url:`${destination.base}/${destination.repository}/-/releases/${source.tag}`,sha256:source.hash,version:source.version};
}
function saveResult(cwd,result){
  const directory=path.join(cwd,"build/release-safety");fs.mkdirSync(directory,{recursive:true});
  const file=path.join(directory,"mirrors-result.json"),temporary=file+"."+crypto.randomUUID()+".tmp";
  fs.writeFileSync(temporary,JSON.stringify(result,null,2)+"\n",{mode:0o600,flag:"wx"});fs.renameSync(temporary,file);
}
async function mirrorReleases(options={}){
  let context,source;
  try{
    context=sourceContext(options);source=await canonicalRelease(context);
    // The mirrored bytes are the published canonical artifact itself; a valid
    // local rebuild is never consulted for mirroring.
  }
  catch(error){
    const result={format:1,complete:false,phase:"validation",targets:{}};
    for(const name of enabledTargets())result.targets[name]={status:"rejected",error:redact(error.message,options.env||process.env)};
    saveResult(options.cwd||process.cwd(),result);throw error;
  }
  if(!source){const result={format:1,branch:context.branch,head:context.head,complete:true,skipped:"no-release",targets:{}};saveResult(context.cwd,result);return result;}
  const result=await settledTargets(context,async name=>{
    const {refs}=await checkTarget(name,context);syncRefs(name,context,source,refs);
    return name==="codeberg"?codebergRelease(context,source):gitgudRelease(context,source);
  });
  saveResult(context.cwd,result);return result;
}
async function main(argv=process.argv.slice(2),options={}){
  if(argv.length>1||(argv.length===1&&argv[0]!=="--preflight"))throw new Error("Usage: node mirrors.cjs [--preflight]");
  const result=await(argv[0]==="--preflight"?preflight(options):mirrorReleases(options));console.log(JSON.stringify(result));
  if(!result.complete)throw new Error("Release mirror "+(argv.length?"preflight":"publication")+" failed; inspect per-target results");
  return result;
}
module.exports={TARGETS,createRequest,createDownload,gitRemote,gitEnvironment,preflight,mirrorReleases,main,transient,retryTransient};
if(require.main===module)main().catch(error=>{console.error(redact(error.message,process.env));process.exitCode=1;});
