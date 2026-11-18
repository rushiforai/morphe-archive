"use strict";
const fs = require("node:fs");
const os = require("node:os");
const path = require("node:path");
const crypto = require("node:crypto");
const {execFileSync,spawn} = require("node:child_process");
const templates = require("./templates.json");
const IDENTITY = {GIT_AUTHOR_NAME:"johninnl", GIT_AUTHOR_EMAIL:"349981574+johninnl@users.noreply.github.com", GIT_COMMITTER_NAME:"johninnl", GIT_COMMITTER_EMAIL:"349981574+johninnl@users.noreply.github.com"};
const REMOTES = ["git@gitlab.com:johninnld/nl-morphe-patches.git", "https://gitlab.com/johninnld/nl-morphe-patches.git"];
const SHA = /^[a-f0-9]{40}$/;
function privatePath(file, directory = false) {
  const stat=fs.lstatSync(file);
  if (stat.isSymbolicLink() || (directory ? !stat.isDirectory() : !stat.isFile()) || stat.uid!==process.getuid() || (stat.mode&0o077)!==0)
    throw new Error("Local release paths must be private, owned files/directories (no group/other permissions or symlinks)");
}
function readConfig(file) { privatePath(file); return JSON.parse(fs.readFileSync(file,"utf8")); }
function writeJson(file, value) {
  const temporary=file+"."+crypto.randomUUID()+".tmp";
  fs.writeFileSync(temporary,JSON.stringify(value,null,2)+"\n",{mode:0o600,flag:"wx"});
  fs.renameSync(temporary,file);
}
function secretFile(file,key) {
  privatePath(file);
  const prefix=new RegExp("^(?:export )?"+key+"\\s*=\\s*");
  const text=fs.readFileSync(file,"utf8").trim().replace(prefix,"").replace(/^["']|["']$/g,"");
  if (!text) throw new Error("A configured local release secret file is empty");
  return text;
}
function environment(config) {
  const env={...process.env,...config.environment,...IDENTITY,GITLAB_DESTINATION:"gitlab",GIT_TERMINAL_PROMPT:"0",GIT_TRACE:"0",GIT_TRACE_CURL:"0"};
  // Do not inherit another checkout or caller's injected Git configuration.
  for (const key of Object.keys(env)) if (/^GIT_(?:DIR|WORK_TREE|INDEX_FILE|COMMON_DIR|OBJECT_DIRECTORY|ALTERNATE_OBJECT_DIRECTORIES|CONFIG.*)$/.test(key)) delete env[key];
  if(config.apiKeysFile)Object.assign(env,require("./credentials.cjs").loadApiKeys(config.apiKeysFile));
  for (const [key,file] of Object.entries(config.secretFiles||{})) {
    if (!/^[A-Z_][A-Z0-9_]*$/.test(key)) throw new Error("Invalid secret environment variable name");
    env[key]=secretFile(file,key);
  }
  if (config.gitlabTokenFile) env.GITLAB_TOKEN=secretFile(config.gitlabTokenFile,"GITLAB_TOKEN");
  return {...env,...IDENTITY,GITLAB_DESTINATION:"gitlab"};
}
/** Defer default-file access until actual identity verification, preserving explicit overrides. */
function ensureApiCredentials(context,{home=os.homedir(),loadApiKeys=require("./credentials.cjs").loadApiKeys}={}) {
  const keys=["GITLAB_TOKEN","CODEBERG_TOKEN","GITGUD_TOKEN"];
  if(keys.every(key=>context.env[key]))return;
  const file=context.config?.apiKeysFile||path.join(home,".ci");privatePath(file);
  const loaded=loadApiKeys(file);
  for(const key of keys)if(!context.env[key])context.env[key]=loaded[key];
}
function redactor(env) {
  const keys=Object.keys(env).filter(key=>/(TOKEN|PASSWORD|SIGNING_KEY|API_KEY|SECRET)/i.test(key));
  const values=keys.map(key=>env[key]).filter(Boolean);
  if(env.GITLAB_TOKEN) values.push(Buffer.from("johninnld:"+env.GITLAB_TOKEN).toString("base64"));
  for(const key of ["CODEBERG_TOKEN","GITGUD_TOKEN"])if(env[key])values.push(Buffer.from("JohninNL:"+env[key]).toString("base64"));
  const secrets=[...new Set(values.flatMap(value=>[value,encodeURIComponent(value),...value.split(/\r?\n/).filter(Boolean)]))].sort((a,b)=>b.length-a.length);
  return text=>secrets.reduce((value,secret)=>value.split(secret).join("[REDACTED]"),String(text));
}
function git(args,{cwd,env}={}) {
  try {return execFileSync("git",["--no-replace-objects",...args],{cwd,env,encoding:"utf8",stdio:["ignore","pipe","pipe"],timeout:120000,maxBuffer:64*1024*1024}).trim();}
  catch(error){const failure=new Error("Local release Git operation failed: "+args[0]);if(error.code==="ETIMEDOUT")failure.cleanupRequired=true;throw failure;}
}
function stateRoot(config,allowLocalRemote) {
  if (!path.isAbsolute(config.stateDir||"")) throw new Error("stateDir must be an absolute private directory");
  if (!REMOTES.includes(config.remoteUrl) && !(allowLocalRemote && path.isAbsolute(config.remoteUrl||""))) throw new Error("Only the approved johninnld GitLab release repository is allowed");
  let stateDir=path.resolve(config.stateDir);
  if (!fs.existsSync(stateDir)) fs.mkdirSync(stateDir,{recursive:true,mode:0o700});
  privatePath(stateDir,true);stateDir=fs.realpathSync(stateDir);
  privatePath(stateDir,true);
  const marker=path.join(stateDir,"owner.json");
  if (!fs.existsSync(marker)) {
    // Installer tooling/config may already live here, but never adopt unmarked build data.
    if (["cache.git","workspaces","runs","state.json","lock"].some(name=>fs.existsSync(path.join(stateDir,name)))) throw new Error("Refuse to adopt unowned release state");
    try{fs.writeFileSync(marker,JSON.stringify({format:1,id:crypto.randomUUID(),remoteUrl:config.remoteUrl})+"\n",{mode:0o600,flag:"wx"});}
    catch(error){if(error.code!=="EEXIST")throw error;}
  }
  const owner=JSON.parse(fs.readFileSync(marker,"utf8"));
  if(owner.format!==1 || !owner.id || owner.remoteUrl!==config.remoteUrl) throw new Error("Local release state ownership or remote mismatch");
  for(const name of ["workspaces","runs"]) {
    const target=path.join(stateDir,name);if(!fs.existsSync(target))fs.mkdirSync(target,{mode:0o700});privatePath(target,true);
  }
  return {stateDir,owner};
}
function remoteHead(config,branch,env) {
  const lines=git(["ls-remote","--heads",config.remoteUrl,`refs/heads/${branch}`],{env}).split("\n");
  if(lines.length!==1) throw new Error("Cannot verify current remote head for "+branch);
  const [head,ref]=lines[0].split(/\s+/);
  if(!SHA.test(head)||ref!==`refs/heads/${branch}`)throw new Error("Cannot verify current remote head for "+branch);
  return head;
}
function requireCurrent(config,branch,head,env) {
  if(remoteHead(config,branch,env)!==head)throw new Error("Stale checkout: current remote head changed for "+branch);
}
function refreshCache(config,stateDir,env) {
  const cache=path.join(stateDir,"cache.git");
  if(!fs.existsSync(cache)) git(["clone","--bare",config.remoteUrl,cache],{env});
  else {
    if(fs.lstatSync(cache).isSymbolicLink() || git(["rev-parse","--is-bare-repository"],{cwd:cache,env})!=="true" || git(["config","remote.origin.url"],{cwd:cache,env})!==config.remoteUrl)throw new Error("Unowned or unexpected bare cache");
  }
  git(["fetch","--prune","--tags","origin","+refs/heads/main:refs/heads/main"],{cwd:cache,env});
  return cache;
}
function sourceTemplates(cache,head,env,branch) {
  function content(file){try{return git(["show",`${head}:${file}`],{cwd:cache,env});}catch{throw new Error("Approved source lacks local-release tooling/templates: "+file);}}
  let source;
  try{source=JSON.parse(content("scripts/local-release/templates.json"));}catch(error){throw new Error("Approved source needs valid local-release templates: "+error.message);}
  if(JSON.stringify(source)!==JSON.stringify(templates))throw new Error("Approved source local-release templates differ from installed driver");
  content("scripts/local-release/verify.cjs");content("scripts/local-release/mirrors.cjs");content(".gitlab/scripts/discovery.cjs");
  if(branch==="main"){content("scripts/local-release/pages.cjs");content("scripts/local-release/pages-job.cjs");}
  const publisher=content(".gitlab/scripts/publish_release.cjs");
  if(!publisher.includes("--local")||!publisher.includes("--dry-run"))throw new Error("Approved source needs the local/preview publisher entry point");
  const branches=JSON.parse(content(".releaserc")).branches;
  if(!branches.includes("main")||branches.some(branch=>branch.name==="dev"))throw new Error("Source semantic-release branches do not match the maintained main-only templates");
}
function checkout({cache,stateDir,owner,branch,head,id,env}) {
  const directory=path.join(stateDir,"workspaces",id);fs.mkdirSync(directory,{mode:0o700});
  const repository=path.join(directory,"repository.git"),workspace=path.join(directory,"checkout");
  writeJson(path.join(directory,"owner.json"),{format:1,owner:owner.id,id,branch,head,workspace,repository});
  // Local hardlinks preserve independent objects and refs, unlike GC-sensitive alternates.
  git(["clone","--bare","--local",cache,repository],{env});
  git(["config","remote.origin.url",owner.remoteUrl],{cwd:repository,env});
  git(["update-ref",`refs/heads/${branch}`,head],{cwd:repository,env});
  git(["worktree","add",workspace,branch],{cwd:repository,env});
  if(git(["rev-parse","HEAD"],{cwd:workspace,env})!==head)throw new Error("Isolated checkout head differs from requested remote head");
  return workspace;
}
async function cleanupWorkspace({stateDir,workspace,env=process.env,quiescent=workspaceQuiescent}) {
  const root=path.resolve(stateDir),directory=path.dirname(path.resolve(workspace)),id=path.basename(directory);
  if(!/^[a-f0-9-]{36}$/.test(id)||path.dirname(directory)!==path.join(root,"workspaces")||path.basename(workspace)!=="checkout")throw new Error("Refuse cleanup of unowned workspace");
  for(const target of [root,path.join(root,"workspaces"),directory])if(fs.lstatSync(target).isSymbolicLink())throw new Error("Refuse symlinked workspace cleanup");
  const owner=JSON.parse(fs.readFileSync(path.join(root,"owner.json"),"utf8"));
  const marker=JSON.parse(fs.readFileSync(path.join(directory,"owner.json"),"utf8"));
  const repository=path.join(directory,"repository.git");
  if(marker.owner!==owner.id||marker.id!==id||marker.workspace!==workspace||marker.repository!==repository)throw new Error("Refuse cleanup without exact owned workspace marker");
  if(fs.existsSync(repository)&&fs.lstatSync(repository).isSymbolicLink())throw new Error("Workspace Git ownership mismatch");
  if(fs.existsSync(workspace)){
    if(fs.lstatSync(workspace).isSymbolicLink()||path.resolve(workspace,git(["rev-parse","--git-common-dir"],{cwd:workspace,env}))!==repository)throw new Error("Workspace Git ownership mismatch");
    let proofFailure;
    if(!quiescent(workspace,{stateDir:root,env,onFailure:reason=>{proofFailure=reason;}}))throw new Error("Owned workspace quiescence is unproved: "+(proofFailure||"live cwd/open handles or incomplete scan")+"; cleanup pending");
    git(["worktree","remove","--force",workspace],{cwd:repository,env});
  }
  // Only remove the marked run container; populated worktrees also prove their Git common directory.
  fs.rmSync(directory,{recursive:true});
}
// Darwin sys/proc_info.h ABI: vnode_info_path=1176, proc_vnodepathinfo=2352,
// vnode_fdinfowithpath=1200, proc_regionwithpathinfo=1272 (64-bit macOS).
// Inspect the job owner's processes directly, without lsof's global mount scan.
// Command groups are checked separately; detached cwd, fd and mmap holders also
// prevent deletion. Unknown/short reads and permission failures remain failures.
const MAC_WORKSPACE_PROOF=String.raw`
import ctypes, errno, os, struct, sys, time
lib=ctypes.CDLL('/usr/lib/libproc.dylib',use_errno=True)
lib.proc_listpids.argtypes=[ctypes.c_uint32,ctypes.c_uint32,ctypes.c_void_p,ctypes.c_int]
lib.proc_pidinfo.argtypes=[ctypes.c_int,ctypes.c_int,ctypes.c_uint64,ctypes.c_void_p,ctypes.c_int]
lib.proc_pidfdinfo.argtypes=[ctypes.c_int,ctypes.c_int,ctypes.c_int,ctypes.c_void_p,ctypes.c_int]
lib.proc_pidpath.argtypes=[ctypes.c_int,ctypes.c_void_p,ctypes.c_uint32]
system=ctypes.CDLL(None,use_errno=True)
root=os.fsencode(os.path.realpath(sys.argv[1])).rstrip(b'/')
if ctypes.sizeof(ctypes.c_void_p)!=8 or not root or not os.path.isdir(root):
    print('workspace-proof: invalid workspace root',file=sys.stderr);sys.exit(2)
def within(value):
    path=value.split(b'\0',1)[0]
    if len(path)==1024:raise RuntimeError('truncated path')
    return path==root or path.startswith(root+b'/')
def pids():
    values=(ctypes.c_int*65536)()
    n=lib.proc_listpids(4,os.getuid(),values,ctypes.sizeof(values))
    if n<=0 or n>=ctypes.sizeof(values) or n%4:raise RuntimeError('incomplete process list')
    return set(pid for pid in values[:n//4] if pid>0)
def info(pid,flavor,size,arg=0):
    value=ctypes.create_string_buffer(size);ctypes.set_errno(0)
    n=lib.proc_pidinfo(pid,flavor,arg,value,size)
    return n,value.raw,ctypes.get_errno()
def walk_ancestors(parent,read,owned):
    found=set()
    while parent>1 and parent not in found:
        found.add(parent)
        n,bsd,error=read(parent)
        if n!=136:
            # Another user's ancestor, such as root's /usr/bin/login above a
            # Terminal session, cannot be an owned job descendant and is never
            # enumerated by the uid-scoped scan. Stop the walk there. An
            # unreadable process of this user still fails closed.
            if error==errno.EPERM and parent not in owned():break
            print('workspace-proof: unreadable ancestor',file=sys.stderr);sys.exit(2)
        parent=struct.unpack_from('=I',bsd,16)[0]
    return found
ancestors=walk_ancestors(os.getppid(),lambda pid:info(pid,3,136),pids)
def protected_system_service(pid):
    # Sealed Apple platform services launched by launchd are not owned job
    # descendants. Do not mistake their protected internal fds for incomplete
    # observation of a user job. Never exempt an arbitrary EPERM/user binary.
    # The pre-existing invoking application can also have kernel-protected
    # credential fds. Its accessible cwd/fds/mappings are still checked. It is
    # an ancestor of the scan, never a detached descendant of an owned command.
    if pid in ancestors:return True
    executable=ctypes.create_string_buffer(4096)
    if lib.proc_pidpath(pid,executable,4096)<=0 or not executable.value.startswith((b'/System/Library/',b'/usr/libexec/')):return False
    n,bsd,error=info(pid,3,136)
    if n!=136 or struct.unpack_from('=I',bsd,16)[0]!=1:return False
    flags=ctypes.c_uint32()
    return system.csops(pid,0,ctypes.byref(flags),4)==0 and bool(flags.value&0x04000000)
def inspect(pid):
    n,data,error=info(pid,9,2352)
    if n==0 and error==errno.ESRCH:return False
    if n!=2352:raise RuntimeError('incomplete cwd scan')
    if within(data[152:1176]) or within(data[1328:2352]):return True
    n,data,error=info(pid,1,1048576)
    if n==0 and error==errno.ESRCH:return False
    if n<0 or n>=1048576 or n%8 or (n==0 and error):raise RuntimeError('incomplete fd list')
    for fd,kind in struct.iter_unpack('=iI',data[:n]):
        if kind!=1:continue
        value=ctypes.create_string_buffer(1200);ctypes.set_errno(0)
        size=lib.proc_pidfdinfo(pid,fd,2,value,1200);error=ctypes.get_errno()
        if size==0 and error in (errno.EBADF,errno.ESRCH,errno.ENOENT):continue
        if size==0 and error==errno.EPERM and protected_system_service(pid):continue
        if size!=1200:raise RuntimeError('incomplete fd scan')
        if within(value.raw[176:1200]):return True
    address=0
    for _ in range(65536):
        # A process can change its mappings between two native reads. Retry
        # briefly instead of declaring the whole workspace uncleanable.
        for attempt in range(4):
            n,data,error=info(pid,8,1272,address)
            if n==1272:break
            if n==0 and (error==errno.ESRCH or (error==errno.EINVAL and address>0)):break
            if attempt==3:raise RuntimeError('incomplete mapping scan')
            time.sleep(0.05)
        # XNU proc_pidregionpathinfo returns EINVAL after the final region.
        # Only accept it after at least one complete, advancing region read.
        if n==0 and (error==errno.ESRCH or (error==errno.EINVAL and address>0)):break
        if n!=1272:raise RuntimeError('incomplete mapping scan')
        if within(data[248:1272]):return True
        start,length=struct.unpack_from('=QQ',data,80)
        following=start+length
        if following<=address or following>2**64-1:raise RuntimeError('invalid mapping range')
        address=following
    else:raise RuntimeError('mapping scan exceeded bound')
    return False
try:
    # Scan one complete snapshot of this user's processes, then every process
    # that appeared during that pass. Do not wait for a moment without new
    # processes: unrelated sessions (builds, shells, ps) may never provide one,
    # and waiting adds no protection. A process born later can only hold the
    # workspace by opening it after its ancestor was scanned, the same race
    # that exists for any process the instant after a quiescent result.
    seen=set()
    for _ in range(2):
        current=pids()
        for pid in current-seen:
            if inspect(pid):print('BUSY');sys.exit(0)
        seen.update(current)
    print('QUIESCENT');sys.exit(0)
except Exception as problem:
    reason=str(problem) if isinstance(problem,RuntimeError) else type(problem).__name__
    print('workspace-proof: '+reason[:120],file=sys.stderr)
    sys.exit(2)
`;
// A full pass reads every mapping of every process of this user. Large build JVMs and
// emulators from unrelated sessions make that take tens of seconds under load (~7s idle),
// so the bound only catches a genuinely stuck scan; any incomplete scan still fails closed.
const WORKSPACE_PROOF_TIMEOUT_MS=120000;
/** A command group can exit while a detached descendant still holds the checkout. */
function workspaceQuiescent(workspace,{stateDir=path.dirname(workspace),env=process.env,inspect=execFileSync,platform=process.platform,onFailure=()=>{}}={}) {
  try{
    const mac=platform==="darwin";
    const output=inspect(mac?"/usr/bin/python3":"lsof",mac?["-c",MAC_WORKSPACE_PROOF,workspace]:["-n","-P","+D",workspace],{
      cwd:stateDir,env:{PATH:env.PATH,HOME:stateDir,LANG:"C",LC_ALL:"C"},encoding:"utf8",stdio:["ignore","pipe","pipe"],timeout:WORKSPACE_PROOF_TIMEOUT_MS,maxBuffer:2*1024*1024,
    });
    const quiet=mac?String(output).trim()==="QUIESCENT":!String(output).trim();
    if(!quiet)onFailure(String(output).trim()==="BUSY"?"live workspace holder":"unexpected native scan output");
    return quiet;
  }catch(error){
    if(platform!=="darwin"&&error.status===1&&!String(error.stdout||"").trim()&&!String(error.stderr||"").trim())return true;
    const reason=/^workspace-proof: ([a-zA-Z0-9 _:-]{1,120})\s*$/.exec(String(error.stderr||""));
    onFailure(error.code==="ETIMEDOUT"?"native scan timed out":reason?reason[1]:"native scan unavailable");
    return false;
  }
}
const delay=milliseconds=>new Promise(resolve=>setTimeout(resolve,milliseconds));
function groupQuiescent(group) {
  try{process.kill(-group,0);}catch(error){if(error.code==="ESRCH")return true;return false;}
  try{
    // Zombies cannot execute or write. Do not mistake delayed orphan reaping for live output.
    const rows=execFileSync("ps",["-axo","pgid=,stat="],{encoding:"utf8",timeout:5000});
    return !rows.split("\n").some(row=>{const [pgid,status]=row.trim().split(/\s+/);return Number(pgid)===group&&!status?.startsWith("Z");});
  }catch{return false;}
}
async function stopGroup(group,timeoutMs) {
  if(groupQuiescent(group))return true;
  for(const signal of ["SIGTERM","SIGKILL"]){
    try{process.kill(-group,signal);}catch(error){if(error.code==="ESRCH")return true;if(error.code!=="EPERM")return false;}
    const until=Date.now()+timeoutMs;
    while(Date.now()<until){if(groupQuiescent(group))return true;await delay(50);}
  }
  return groupQuiescent(group);
}
async function command(context,label,args,{timeoutMs=2*60*60*1000,stopTimeoutMs=3000}={}) {
  if(!/^[a-z][a-z0-9-]*$/.test(label))throw new Error("Invalid owned command log label");
  const log=path.join(context.runDir,label+".log"),limit=2*1024*1024;
  context.logFiles??=[];if(!context.logFiles.includes(label+".log"))context.logFiles.push(label+".log");
  let output="",stdout="",stdoutTruncated=false,truncated=false,discardLine=false,timer,child,group,groupRecord,result,quiet=true,failure;
  const append=chunk=>{
    let text=chunk.toString();if(discardLine){const end=text.indexOf("\n");if(end<0)return;text=text.slice(end+1);discardLine=false;}
    output+=text;
    if(output.length>limit){const end=output.indexOf("\n",output.length-limit);truncated=true;if(end<0){output="";discardLine=true;}else output=output.slice(end+1);}
  };
  try {
    child=spawn(args[0],args.slice(1),{cwd:context.workspace,env:context.env,detached:true,stdio:["ignore","pipe","pipe"]});
    group=child.pid;
    if(group){context.processGroups??=[];groupRecord={id:group,stage:label,quiescent:false};context.processGroups.push(groupRecord);}
    child.stdout.on("data",chunk=>{append(chunk);stdout+=chunk.toString();if(stdout.length>limit){stdout=stdout.slice(-limit);stdoutTruncated=true;}});child.stderr.on("data",append);
    const closed=new Promise(resolve=>child.once("close",resolve));
    const exited=new Promise(resolve=>{child.once("error",error=>resolve({error}));child.once("exit",(code,signal)=>resolve({code,signal}));});
    const timeout=new Promise(resolve=>{timer=setTimeout(()=>resolve({timedOut:true}),timeoutMs);});
    result=await Promise.race([exited,timeout]);clearTimeout(timer);
    if(group)quiet=await stopGroup(group,stopTimeoutMs);
    if(groupRecord)groupRecord.quiescent=quiet;
    if(!quiet)context.cleanupBlocked=true;
    if(quiet){let drainTimer;await Promise.race([closed,new Promise(resolve=>{drainTimer=setTimeout(resolve,1000);})]);clearTimeout(drainTimer);}
    if(!quiet)throw new Error(label+" process group could not be proved stopped; cleanup pending");
    if(result.timedOut)throw new Error(label+" timed out; owned process group stopped; see private run log");
    if(result.error||result.code!==0)throw new Error(label+" failed; see private run log");
  } catch(error){failure=error;} finally {
    clearTimeout(timer);child?.stdout?.destroy();child?.stderr?.destroy();child?.unref();
    try{fs.writeFileSync(log,(truncated?"[Earlier output omitted; retained final 2 MiB]\n":"")+context.redact(output),{mode:0o600});}
    catch(error){failure=new Error([failure?.message,"diagnostic log write failed"].filter(Boolean).join("; "));}
  }
  const captured={stdout:context.redact(stdout),stdoutTruncated};
  if(failure){Object.assign(failure,captured);throw failure;}
  return captured;
}
function pagesInvocation(script,args=[]) {
  const source=`const {workspaceQuiescent}=require(${JSON.stringify(__filename)});
const {processAlive}=require(${JSON.stringify(path.join(path.dirname(script),"pages-job.cjs"))});
require(${JSON.stringify(script)}).main(process.argv.slice(1),{
  isQuiescent:(workspace,record)=>!processAlive(record.pid)&&workspaceQuiescent(workspace)
}).catch(error=>{console.error(error.message);process.exitCode=1;});`;
  return [process.execPath,"-e",source,"--",...args];
}
async function cleanupPages(context,{script=path.join(__dirname,"pages.cjs")}={}) {
  let captured,failure,result;
  const invocation=script===path.join(__dirname,"pages.cjs")?pagesInvocation(script,["--cleanup"]):[process.execPath,script,"--cleanup"];
  try{captured=await command(context,"pages-cleanup",invocation);}
  catch(error){failure=error;captured=error;}
  try{
    if(captured.stdoutTruncated)throw new Error("Pages cleanup result exceeded its diagnostic bound");
    result=JSON.parse(captured.stdout);
    if(!result||Array.isArray(result)||typeof result.cleanupRequired!=="boolean")throw new Error("Pages cleanup returned no structured result");
  }catch(error){result={cleanupRequired:true,retryable:false,error:"Pages cleanup returned no valid structured result"};failure??=new Error(result.error);}
  context.pagesCleanupResult=result;writeJson(path.join(context.runDir,"pages-cleanup-result.json"),result);
  if(failure)throw failure;
  return result;
}
function archiveSafety(context) {
  const source=path.join(context.workspace,"build/release-safety"),destination=path.join(context.runDir,"safety");
  const summary={files:[],omitted:[]};let bytes=0;
  if(!fs.existsSync(source))return summary;
  if(fs.lstatSync(source).isSymbolicLink())throw new Error("Refuse symlinked release-safety archive source");
  function walk(directory,relative="",depth=0){
    if(depth>4){summary.omitted.push({path:relative,reason:"depth limit"});return;}
    for(const entry of fs.readdirSync(directory,{withFileTypes:true})){
      const name=path.join(relative,entry.name),file=path.join(directory,entry.name);
      if(entry.isSymbolicLink()){summary.omitted.push({path:name,reason:"symlink"});continue;}
      if(entry.isDirectory()){walk(file,name,depth+1);continue;}
      if(!entry.isFile()||!entry.name.endsWith(".json"))continue;
      const size=fs.statSync(file).size;
      if(summary.files.length>=64||size>2*1024*1024||bytes+size>8*1024*1024){summary.omitted.push({path:name,bytes:size,reason:"compact archive size limit"});continue;}
      let value;try{value=JSON.parse(context.redact(fs.readFileSync(file,"utf8")));}catch{summary.omitted.push({path:name,bytes:size,reason:"invalid JSON"});continue;}
      const target=path.join(destination,name);fs.mkdirSync(path.dirname(target),{recursive:true,mode:0o700});writeJson(target,value);
      bytes+=size;summary.files.push({path:name,bytes:size});
    }
  }
  walk(source);return summary;
}
/** Bound finished-job diagnostics only. Receipts, unknown files and reusable caches stay intact. */
function pruneEvidence({stateDir,now=Date.now(),maxAgeDays=30,maxBytes=512*1024*1024}) {
  if(!Number.isFinite(now)||!Number.isFinite(maxAgeDays)||maxAgeDays<0||!Number.isSafeInteger(maxBytes)||maxBytes<0)throw new Error("Invalid diagnostic evidence retention policy");
  const root=path.resolve(stateDir);privatePath(root,true);
  const owner=JSON.parse(fs.readFileSync(path.join(root,"owner.json"),"utf8")),runs=path.join(root,"runs");privatePath(runs,true);
  const candidates=[];
  for(const entry of fs.readdirSync(runs,{withFileTypes:true})){
    if(!entry.isDirectory()||!/^[-a-f0-9]{36}$/.test(entry.name))continue;
    const directory=path.join(runs,entry.name),file=path.join(directory,"receipt.json");let receipt;
    try{privatePath(directory,true);privatePath(file);receipt=JSON.parse(fs.readFileSync(file,"utf8"));}catch{continue;}
    const finished=Date.parse(receipt.finished);
    if(receipt.format!==1||receipt.owner!==owner.id||receipt.id!==entry.name||!Number.isFinite(finished)||finished>now||
        !["failed","published","no-release","preview","mirrored"].includes(receipt.status)||receipt.cleanupRequired!==false||
        !Array.isArray(receipt.processGroups)||receipt.processGroups.some(group=>!group.quiescent))continue;
    const declared=[...(Array.isArray(receipt.logFiles)?receipt.logFiles:[]).filter(name=>typeof name==="string"&&/^[a-z][a-z0-9-]*\.log$/.test(name)),
      ...(Array.isArray(receipt.diagnosticArchive?.files)?receipt.diagnosticArchive.files:[]).map(value=>typeof value?.path==="string"?"safety/"+value.path:""),
      ...(Array.isArray(receipt.resultFiles)?receipt.resultFiles:[]).filter(name=>["mirrors-result.json","pages-result.json"].includes(name))];
    for(const relative of new Set(declared)){
      const parts=relative.split(path.sep);
      if(!parts.length||parts.some(part=>!part||part==="."||part===".."||!/^[A-Za-z0-9_.-]+$/.test(part)))continue;
      if(parts.length>1&&(parts[0]!=="safety"||!relative.endsWith(".json")))continue;
      const target=path.join(directory,...parts);
      try{
        for(let index=1;index<parts.length;index++)if(fs.lstatSync(path.join(directory,...parts.slice(0,index))).isSymbolicLink())throw new Error("symlink");
        privatePath(target);const stat=fs.lstatSync(target);candidates.push({file:target,bytes:stat.size,finished});
      }catch{/* Missing, exposed, symlinked or undeclared files are never adopted for pruning. */}
    }
  }
  candidates.sort((a,b)=>a.finished-b.finished||a.file.localeCompare(b.file));
  let remaining=candidates.reduce((sum,item)=>sum+item.bytes,0),removed=0,removedBytes=0;
  const cutoff=now-maxAgeDays*86400000;
  for(const item of candidates){
    if(item.finished>cutoff&&remaining<=maxBytes)continue;
    fs.unlinkSync(item.file);remaining-=item.bytes;removed++;removedBytes+=item.bytes;
  }
  return {maxAgeDays,maxBytes,filesRemoved:removed,bytesRemoved:removedBytes,bytesRemaining:remaining};
}
const defaults={
  cleanupWorkspace,
  cleanupPages,
  bootstrap:async context=>command(context,"dependencies",["npm","ci","--ignore-scripts","--no-audit","--no-fund"]),
  verifyIdentity:async context=>{
    ensureApiCredentials(context);
    context.redact=redactor(context.env);
    const identity=require(path.join(context.workspace,".github/scripts/verify_identity.cjs"));
    identity.verifyGitIdentity({cwd:context.workspace,env:context.env});identity.verifyHistory({cwd:context.workspace,env:context.env});
    const response=await fetch("https://gitlab.com/api/v4/user",{headers:{"PRIVATE-TOKEN":context.env.GITLAB_TOKEN},redirect:"error",signal:AbortSignal.timeout(30000)});
    if(!response.ok||(await response.json()).username!=="johninnld")throw new Error("GitLab release token must belong to johninnld");
    await command(context,"secrets-preflight",[process.execPath,".gitlab/scripts/check_secrets.cjs"]);
  },
  verify:async context=>command(context,"verification",[process.execPath,"scripts/local-release/verify.cjs"]),
  mirrorPreflight:async context=>command(context,"mirror-preflight",[process.execPath,"scripts/local-release/mirrors.cjs","--preflight"]),
  publish:async context=>{
    await command(context,"publication",[process.execPath,".gitlab/scripts/publish_release.cjs","--local",...(context.publish?[]:["--dry-run"])]);
    return JSON.parse(fs.readFileSync(path.join(context.workspace,"build/release-safety/gitlab-result.json"),"utf8"));
  },
  discover:async context=>command(context,"discovery",[process.execPath,".gitlab/scripts/discovery.cjs"]),
  pages:async context=>{
    const file=path.join(context.workspace,"build/release-safety/pages-result.json");
    try{await command(context,"pages",pagesInvocation(path.join(context.workspace,"scripts/local-release/pages.cjs")));}
    finally{
      if(fs.existsSync(file)){
        context.pagesResults=JSON.parse(context.redact(fs.readFileSync(file,"utf8")));
        writeJson(path.join(context.runDir,"pages-result.json"),context.pagesResults);context.resultFiles??=[];context.resultFiles.push("pages-result.json");
      }
    }
    if(context.pagesResults?.cleanupRequired)throw new Error("Pages cleanup remains required");
    if(context.pagesResults?.verified!==true)throw new Error("Pages deployment produced no verified retained result");
    return context.pagesResults;
  },
  mirrors:async context=>{
    const file=path.join(context.workspace,"build/release-safety/mirrors-result.json");
    try{await command(context,"mirrors",[process.execPath,"scripts/local-release/mirrors.cjs"]);}
    finally{
      if(fs.existsSync(file)){
        context.mirrorResults=JSON.parse(context.redact(fs.readFileSync(file,"utf8")));
        writeJson(path.join(context.runDir,"mirrors-result.json"),context.mirrorResults);context.resultFiles??=[];context.resultFiles.push("mirrors-result.json");
      }
    }
    if(!context.mirrorResults)throw new Error("Mirror publication produced no retained destination results");
    return context.mirrorResults;
  },
};
async function resolveWorkspaceCleanups(state,stateDir,owner,env,deps,redact){
  // Watch ticks re-attempt pending owned-workspace cleanup so a transient
  // holder (for example an orphaned build daemon that later exits) self-
  // resolves, matching the documented watcher behaviour. A workspace that is
  // already gone is stamped resolved without touching the filesystem.
  for(const branchState of Object.values(state.branches)){
    for(const failure of Object.values(branchState.failures||{})){
      if(!failure?.cleanupRequired)continue;
      const file=failure.receipt,run=path.dirname(file),id=path.basename(run);
      if(!/^[a-f0-9-]{36}$/.test(id)||run!==path.join(stateDir,"runs",id)||path.basename(file)!=="receipt.json")throw new Error("Refuse unowned cleanup receipt");
      privatePath(file);
      let receipt;try{receipt=JSON.parse(fs.readFileSync(file,"utf8"));}catch{continue;}
      if(receipt.owner!==owner.id||receipt.id!==id||receipt.status!=="failed")continue;
      const workspace=failure.workspace||receipt.workspace;
      let note;
      if(!workspace||!fs.existsSync(workspace)){note="workspace already absent";}
      else{
        try{await deps.cleanupWorkspace({stateDir,workspace,env});note="workspace cleanup completed";}
        catch(error){failure.cleanupReason=redact(error.message);continue;}
      }
      const stamp=new Date().toISOString();
      failure.cleanupRequired=false;failure.workspaceCleanupRequired=false;failure.cleanupResolvedAt=stamp;failure.cleanupResolution=note;
      receipt.cleanupRequired=false;receipt.workspaceCleanupRequired=false;receipt.cleanupResolvedAt=stamp;receipt.cleanupResolution=note;receipt.workspaceRemoved=true;
      writeJson(file,receipt);
    }
  }
}
function resolvePagesCleanup(state,stateDir,owner) {
  const resolved=new Set();
  for(const branch of Object.values(state.branches))for(const failure of [branch.failed,...Object.values(branch.failures||{})]){
    if(!failure?.pagesCleanupRequired||failure.workspaceCleanupRequired!==false)continue;
    const file=failure.receipt,run=path.dirname(file),id=path.basename(run);
    if(!/^[a-f0-9-]{36}$/.test(id)||run!==path.join(stateDir,"runs",id)||path.basename(file)!=="receipt.json")throw new Error("Refuse unowned Pages cleanup receipt");
    if(!resolved.has(file)){
      privatePath(file);const receipt=JSON.parse(fs.readFileSync(file,"utf8"));
      if(receipt.owner!==owner.id||receipt.id!==id||receipt.status!=="failed"||receipt.workspaceCleanupRequired!==false||receipt.workspaceRemoved!==true||!Array.isArray(receipt.processGroups)||receipt.processGroups.some(group=>!group.quiescent)||!Array.isArray(receipt.cleanupErrors)||receipt.cleanupErrors.some(error=>error!=="Pages cleanup remains required"))continue;
      if(receipt.pagesCleanupRequired===true&&receipt.cleanupRequired===true){
        receipt.pagesCleanupRequired=false;receipt.cleanupRequired=false;receipt.pagesCleanupResolvedAt=new Date().toISOString();writeJson(file,receipt);
      }else if(receipt.pagesCleanupRequired!==false||receipt.cleanupRequired!==false||!Number.isFinite(Date.parse(receipt.pagesCleanupResolvedAt)))continue;
      // Recover an interrupted checkpoint after the owned receipt was already resolved.
      resolved.add(file);
    }
    failure.pagesCleanupRequired=false;failure.cleanupRequired=false;
  }
}
/** Mirror-only retries back off 2, 4, 8, 16, 32 minutes, then hourly, without an attempt limit. */
function mirrorBackoff(attempts){return Math.min(60,2*2**Math.max(0,attempts))*60000;}
async function runFlow({config,branch,publish=false,watchOnce=false,retryFailed=false,head,dependencies={},now=()=>Date.now()}) {
  if((watchOnce&&branch)||(!watchOnce&&!Object.hasOwn(templates,branch)))throw new Error("Select --branch main|dev or --watch-once");
  if(head&&!SHA.test(head))throw new Error("Requested head must be a full commit SHA");
  const env=environment(config),redact=redactor(env),deps={...defaults,...dependencies};
  const {stateDir,owner}=stateRoot(config,dependencies.allowLocalRemote===true),lock=path.join(stateDir,"lock");
  try{fs.mkdirSync(lock,{mode:0o700});}catch(error){if(error.code==="EEXIST")throw new Error("Local release driver is locked; another run is active or needs manual lock review");throw error;}
  let state;
  const stateFile=path.join(stateDir,"state.json");
  try {
    writeJson(path.join(lock,"owner.json"),{pid:process.pid,started:new Date().toISOString()});
    state=fs.existsSync(stateFile)?JSON.parse(fs.readFileSync(stateFile,"utf8")):{format:1,branches:{}};
    if(state.format!==1||!state.branches)throw new Error("Invalid local release state");
    if(watchOnce&&config.pages?.runnerId){
      const cleanupFile=path.join(stateDir,"pages-cleanup-status.json");
      const previous=fs.existsSync(cleanupFile)?JSON.parse(fs.readFileSync(cleanupFile,"utf8")):null;
      if(previous?.cleanupRequired&&previous.processGroups?.some(group=>!groupQuiescent(group.id)))throw new Error("Previous Pages cleanup controller remains active; cleanup pending");
      const cleanupContext={workspace:stateDir,runDir:stateDir,env,redact};
      try{
        const result=await deps.cleanupPages(cleanupContext);
        cleanupContext.pagesCleanupResult=result==null?null:JSON.parse(redactor(env)(JSON.stringify(result)));
        if(cleanupContext.pagesCleanupResult?.cleanupRequired!==false||cleanupContext.cleanupBlocked||cleanupContext.processGroups?.some(group=>!group.quiescent))throw new Error("Pages cleanup remains required; no completed structured cleanup proof");
        writeJson(cleanupFile,{finished:new Date().toISOString(),cleanupRequired:false,result:cleanupContext.pagesCleanupResult,processGroups:cleanupContext.processGroups||[]});resolvePagesCleanup(state,stateDir,owner);writeJson(stateFile,state);
      }catch(error){writeJson(cleanupFile,{finished:new Date().toISOString(),failure:redactor(env)(error.message),cleanupRequired:true,retryable:cleanupContext.pagesCleanupResult?.retryable===true,result:cleanupContext.pagesCleanupResult||null,processGroups:cleanupContext.processGroups||[]});throw error;}
    }
    if(Object.values(state.branches).some(value=>Object.values(value.failures||{}).some(failure=>failure.cleanupRequired))){
      // Only watch ticks sweep; explicit runs keep failing fast for an operator.
      if(!watchOnce)throw new Error("Previous run requires explicit owned-workspace/process cleanup before another release job");
      await resolveWorkspaceCleanups(state,stateDir,owner,env,deps,redact);writeJson(stateFile,state);
      if(Object.values(state.branches).some(value=>Object.values(value.failures||{}).some(failure=>failure.cleanupRequired)))throw new Error("Previous run requires explicit owned-workspace/process cleanup before another release job");
    }
    const cache=refreshCache(config,stateDir,env),branches=watchOnce?Object.keys(templates):[branch],heads={};
    for(const name of branches){heads[name]=remoteHead(config,name,env);sourceTemplates(cache,heads[name],env,name);}
    if(watchOnce&&!state.initialized) {
      for(const name of branches)state.branches[name]={...state.branches[name],observed:heads[name]};
      state.initialized=true;writeJson(stateFile,state);return {status:"baselined",heads,runs:[]};
    }
    const runs=[];
    for(const name of branches) {
      const prior=state.branches[name]||{};
      // A published release whose mirror failed keeps a pending mirror. Watch ticks
      // retry only that mirror, with backoff and no attempt limit, while the release
      // commit is still the branch head; a newer head supersedes it.
      let pending=watchOnce&&!head?prior.pendingMirror:null;
      if(pending&&pending.head!==heads[name]){
        prior.supersededMirror={head:pending.head,version:pending.version,attempts:pending.attempts||0,at:new Date(now()).toISOString()};
        delete prior.pendingMirror;pending=null;writeJson(stateFile,state);
      }
      const mirrorOnly=Boolean(pending&&now()>=Date.parse(pending.nextAttempt));
      const sourceHead=mirrorOnly?pending.head:head||heads[name];
      if(sourceHead!==heads[name])throw new Error("Requested stale head differs from current remote head");
      const failed=prior.failures?.[sourceHead]||(prior.failed?.head===sourceHead?prior.failed:null);
      if(!mirrorOnly){
        if(watchOnce&&sourceHead===prior.observed&&!(retryFailed&&failed))continue;
        if(failed&&!retryFailed) {
          if(watchOnce)continue;
          throw new Error("This head failed previously; inspect retained diagnostics and use --retry-failed explicitly");
        }
      }
      const id=crypto.randomUUID(),runDir=path.join(stateDir,"runs",id),receiptFile=path.join(runDir,"receipt.json");fs.mkdirSync(runDir,{mode:0o700});
      const context={id,branch:name,head:sourceHead,publish:watchOnce||publish,env,runDir,redact,config};
      const receipt={format:1,owner:owner.id,id,branch:name,head:sourceHead,publish:context.publish,started:new Date().toISOString(),status:"started"};
      state.branches[name]={...prior,...(context.publish?{observed:sourceHead}:{})};
      let failure=null;
      context.workspace=path.join(stateDir,"workspaces",id,"checkout");
      try {
        context.workspace=checkout({cache,stateDir,owner,branch:name,head:sourceHead,id,env});receipt.workspace=context.workspace;
        if(mirrorOnly)receipt.mirrorRetry={release:pending.receipt,version:pending.version,attempt:(pending.attempts||0)+1};
        writeJson(receiptFile,receipt);
        await deps.verifyIdentity(context);
        // The default token loader may have introduced a new secret after initial config loading.
        context.redact=redactor(env);
        release:{
        if(mirrorOnly){
          // The release is already published: mirror its canonical bytes from the saved receipt only.
          const safety=path.join(context.workspace,"build/release-safety");fs.mkdirSync(safety,{recursive:true});
          writeJson(path.join(safety,"gitlab-result.json"),pending.publication);
          let result;
          try{result=await deps.mirrors(context);}
          catch(error){receipt.poststeps={mirrors:{status:"rejected",error:context.redact(error.message||String(error))}};throw error;}
          if(result==null){receipt.poststeps={mirrors:{status:"rejected",error:"mirrors produced no verified result"}};throw new Error("mirrors produced no verified result");}
          receipt.mirrors=JSON.parse(context.redact(JSON.stringify(result)));receipt.poststeps={mirrors:{status:"fulfilled",result:receipt.mirrors}};
          receipt.status="mirrored";break release;
        }
        await deps.mirrorPreflight(context);await deps.bootstrap(context);await deps.verify(context);
        requireCurrent(config,name,sourceHead,env);
        const outcome=await deps.publish(context);
        if(!outcome||typeof outcome!=="object")throw new Error("Publisher produced no release receipt");
        if(context.publish&&outcome.preview)throw new Error("Publisher returned a preview for an actual release");
        if(outcome.version&&outcome.branch!==name)throw new Error("Publisher receipt branch mismatch");
        receipt.publication=JSON.parse(redactor(env)(JSON.stringify(outcome)));writeJson(receiptFile,receipt);
        const published=context.publish&&outcome.published!==false;
        if(published) {
          if(!outcome.version||!/^\d+\.\d+\.\d+$/.test(outcome.version))throw new Error("Publisher receipt version/channel mismatch");
          await deps.discover(context);
        }
        const poststeps=[];
        if(published)poststeps.push({name:"mirrors",run:()=>deps.mirrors(context)});
        if(context.publish&&name==="main")poststeps.push({name:"pages",run:()=>deps.pages(context)});
        const completed=await Promise.allSettled(poststeps.map(step=>Promise.resolve().then(step.run)));
        receipt.poststeps={};const postErrors=[];
        for(let index=0;index<poststeps.length;index++){
          const target=poststeps[index].name,result=completed[index];
          if(result.status==="fulfilled"){
            const retained=result.value==null?null:JSON.parse(context.redact(JSON.stringify(result.value)));
            receipt[target]=retained;
            if(retained==null||target==="pages"&&(retained.verified!==true||retained.cleanupRequired)){
              const error=target==="pages"&&retained?.cleanupRequired?"pages cleanup remains required":target+" produced no verified result";receipt.poststeps[target]={status:"rejected",error,result:retained};postErrors.push(error);
            }else receipt.poststeps[target]={status:"fulfilled",result:retained};
          }else{
            const error=context.redact(result.reason?.message||String(result.reason));receipt.poststeps[target]={status:"rejected",error};postErrors.push(target+": "+error);
          }
        }
        if(postErrors.length)throw new Error(postErrors.join("; "));
        if(context.publish) {
          const finalHead=git(["rev-parse","HEAD"],{cwd:context.workspace,env});
          // Consume only this run's exact generated release commit, never a concurrent source push.
          if(finalHead!==sourceHead&&remoteHead(config,name,env)===finalHead)state.branches[name].observed=finalHead;
        }
        receipt.status=!context.publish?"preview":outcome.published===false?"no-release":"published";
        }
      } catch(error) {
        failure=redactor(env)(error.message||"Local release failed");
        if(error.cleanupRequired)context.cleanupBlocked=true;
        receipt.workspace=context.workspace;
        if(context.publish&&context.workspace&&fs.existsSync(context.workspace))try{
          const generated=git(["rev-parse","HEAD"],{cwd:context.workspace,env});
          if(generated!==sourceHead&&remoteHead(config,name,env)===generated){receipt.generatedHead=generated;state.branches[name].observed=generated;}
        }catch{/* Keep the original failure if the remote/generated head cannot be proved. */}
      } finally {
        const cleanupErrors=[];
        if(context.mirrorResults)receipt.mirrors=context.mirrorResults;
        if(context.pagesResults)receipt.pages=context.pagesResults;
        receipt.processGroups=context.processGroups||[];receipt.logFiles=context.logFiles||[];receipt.resultFiles=context.resultFiles||[];
        try{receipt.diagnosticArchive=archiveSafety(context);}catch(error){cleanupErrors.push("diagnostic archive: "+redactor(env)(error.message));}
        receipt.workspaceRemoved=false;receipt.cleanupRequired=false;receipt.workspaceCleanupRequired=false;receipt.pagesCleanupRequired=receipt.pages?.cleanupRequired===true;
        if(context.cleanupBlocked||receipt.processGroups.some(group=>!group.quiescent)){
          receipt.workspaceCleanupRequired=true;cleanupErrors.push("Owned process quiescence is unproved; workspace cleanup pending");
        }else if(fs.existsSync(path.dirname(context.workspace))){
          try{await deps.cleanupWorkspace({stateDir,workspace:context.workspace,env});receipt.workspaceRemoved=true;}
          catch(error){receipt.workspaceCleanupRequired=true;cleanupErrors.push("workspace cleanup: "+redactor(env)(error.message));}
        }else receipt.workspaceRemoved=true;
        receipt.cleanupRequired=receipt.workspaceCleanupRequired||receipt.pagesCleanupRequired;
        if(receipt.pagesCleanupRequired)cleanupErrors.push("Pages cleanup remains required");
        receipt.cleanupErrors=cleanupErrors;
        if(cleanupErrors.length)failure=[failure,...cleanupErrors].filter(Boolean).join("; ");
        receipt.finished=new Date().toISOString();
        const branchState=state.branches[name],stamp=new Date(now()).toISOString();
        if(mirrorOnly&&!failure){
          // The mirror landed: the release is complete, so its fences are lifted.
          const done=branchState.pendingMirror;delete branchState.pendingMirror;
          for(const key of [done.sourceHead,done.head]){if(branchState.failures)delete branchState.failures[key];if(branchState.failed?.head===key)delete branchState.failed;}
          branchState.succeeded=done.sourceHead;branchState.mirrored={head:done.head,version:done.version,attempts:(done.attempts||0)+1,at:stamp};
        }else if(mirrorOnly){
          receipt.status="failed";receipt.failure=failure;
          const attempts=(branchState.pendingMirror.attempts||0)+1;
          branchState.pendingMirror={...branchState.pendingMirror,attempts,lastAttempt:stamp,lastError:failure.slice(0,300),lastReceipt:receiptFile,nextAttempt:new Date(now()+mirrorBackoff(attempts)).toISOString()};
          if(receipt.cleanupRequired){
            branchState.failed={head:sourceHead,workspace:context.workspace,receipt:receiptFile,cleanupRequired:true,pagesCleanupRequired:receipt.pagesCleanupRequired,workspaceCleanupRequired:receipt.workspaceCleanupRequired};
            branchState.failures={...branchState.failures,[sourceHead]:branchState.failed};
          }
        }else if(failure){
          receipt.status="failed";receipt.failure=failure;
          state.branches[name].failed={head:sourceHead,workspace:context.workspace,receipt:receiptFile,cleanupRequired:receipt.cleanupRequired,pagesCleanupRequired:receipt.pagesCleanupRequired,workspaceCleanupRequired:receipt.workspaceCleanupRequired};
          state.branches[name].failures={...state.branches[name].failures,[sourceHead]:state.branches[name].failed};
          if(receipt.generatedHead)state.branches[name].failures[receipt.generatedHead]={...state.branches[name].failed,head:receipt.generatedHead};
          // Published but not mirrored: later watch ticks retry the mirror alone.
          if(context.publish&&receipt.publication?.version&&receipt.poststeps?.mirrors?.status==="rejected"&&receipt.generatedHead)
            state.branches[name].pendingMirror={head:receipt.generatedHead,sourceHead,version:receipt.publication.version,publication:receipt.publication,receipt:receiptFile,attempts:0,since:stamp,nextAttempt:new Date(now()+mirrorBackoff(0)).toISOString()};
        }else if(context.publish){
          state.branches[name].succeeded=sourceHead;
          if(state.branches[name].failed?.head===sourceHead)delete state.branches[name].failed;
          if(state.branches[name].failures)delete state.branches[name].failures[sourceHead];
        }
        writeJson(receiptFile,receipt);writeJson(stateFile,state);
        try{receipt.evidencePruning=pruneEvidence({stateDir});}
        catch(error){
          const message="diagnostic evidence cleanup: "+redactor(env)(error.message);cleanupErrors.push(message);
          failure=[failure,message].filter(Boolean).join("; ");receipt.status="failed";receipt.failure=failure;receipt.cleanupRequired=true;
          state.branches[name].failed={head:sourceHead,workspace:context.workspace,receipt:receiptFile,cleanupRequired:true};
          state.branches[name].failures={...state.branches[name].failures,[sourceHead]:state.branches[name].failed};
          if(receipt.generatedHead)state.branches[name].failures[receipt.generatedHead]={...state.branches[name].failed,head:receipt.generatedHead};
        }
        writeJson(receiptFile,receipt);writeJson(stateFile,state);
      }
      // A failed mirror-only retry is expected to recur; it is recorded and retried, not raised.
      if(failure&&!(mirrorOnly&&!receipt.cleanupRequired))throw new Error(failure);
      runs.push({...receipt,receipt:receiptFile});
    }
    return {status:"complete",runs};
  }catch(error){throw new Error(redactor(env)(error.message||"Local release failed"));}
  finally{fs.rmSync(lock,{recursive:true,force:true});}
}
async function main(argv=process.argv.slice(2)) {
  const {parseArgs}=require("node:util");
  const {values}=parseArgs({args:argv,options:{config:{type:"string"},branch:{type:"string"},publish:{type:"boolean"},"watch-once":{type:"boolean"},"retry-failed":{type:"boolean"},help:{type:"boolean"}}});
  if(values.help){console.log("Usage: node flow.cjs --config PRIVATE.json (--branch main|dev [--publish] | --watch-once) [--retry-failed]\nBranch runs default to preview. First watcher invocation only baselines approved remote heads.");return;}
  if(!values.config)throw new Error("--config PRIVATE.json is required");
  const config=readConfig(values.config);config.environment={...config.environment,LOCAL_RELEASE_CONFIG:path.resolve(values.config)};
  const result=await runFlow({config,branch:values.branch,publish:values.publish,watchOnce:values["watch-once"],retryFailed:values["retry-failed"]});
  console.log(JSON.stringify(result));
}
module.exports={templates,readConfig,environment,ensureApiCredentials,runFlow,cleanupWorkspace,cleanupPages,workspaceQuiescent,pagesInvocation,command,pruneEvidence,main};
if(require.main===module)main().catch(error=>{console.error(error.message);process.exitCode=1;});
