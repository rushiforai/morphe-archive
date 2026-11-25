"use strict";
const fs=require("node:fs"),os=require("node:os"),path=require("node:path"),crypto=require("node:crypto");
const {spawnSync}=require("node:child_process");
const {loadApiKeys}=require("./credentials.cjs");
const LABEL="nl.johninnl.morphe.pages-runner",TAG="nl-morphe-pages-macos",PROJECT=88427867;
const PUBLIC_URL="https://nl-morphe-patches-ed90fa.gitlab.io/";
const REGISTRATION={runner_type:"project_type",project_id:PROJECT,description:"nl-morphe-local-pages",tag_list:[TAG],run_untagged:false,locked:true,access_level:"ref_protected",maximum_timeout:600};
const xml=value=>String(value).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;");
function privatePath(file,directory=false){
  const stat=fs.lstatSync(file);
  if(stat.isSymbolicLink()||(directory?!stat.isDirectory():!stat.isFile())||stat.uid!==process.getuid()||(stat.mode&0o077)!==0)throw new Error("Use private owned Pages runner files and directories");
}
function readJson(file){try{return JSON.parse(fs.readFileSync(file,"utf8"));}catch{throw new Error("Invalid private Pages runner configuration");}}
function atomicWrite(file,text){
  const temporary=file+"."+crypto.randomUUID()+".tmp";
  fs.writeFileSync(temporary,text,{mode:0o600,flag:"wx"});fs.renameSync(temporary,file);
}
function dryPlan({configPath,binary,home=os.homedir()}={}){
  if(!path.isAbsolute(configPath||"")||!path.isAbsolute(binary||"")||!path.isAbsolute(home))throw new Error("Provide absolute config, binary and home paths");
  privatePath(configPath);const config=readJson(configPath);
  if(!path.isAbsolute(config.stateDir||""))throw new Error("Use an absolute private state directory");
  if(typeof config.environment?.PATH!=="string"||!config.environment.PATH||/[\r\n\0]/.test(config.environment.PATH))throw new Error("Private configuration must provide the runner PATH");
  const directory=path.join(config.stateDir,"pages-runner");
  return {dryRun:true,label:LABEL,tag:TAG,registration:{...REGISTRATION,tag_list:[TAG]},configPath,binary,directory,
    configFile:path.join(directory,"config.toml"),recordFile:path.join(directory,"runner.json"),buildsDir:path.join(directory,"builds"),
    plistPath:path.join(home,"Library/LaunchAgents",LABEL+".plist"),publicUrl:PUBLIC_URL};
}
async function apiRequest(endpoint,{token,method="GET",body}={}){
  if(!endpoint.startsWith("/")||endpoint.startsWith("//"))throw new Error("Invalid Pages runner API endpoint");
  const response=await fetch("https://gitlab.com/api/v4"+endpoint,{method,headers:{"PRIVATE-TOKEN":token,...(body?{"Content-Type":"application/json"}:{})},body:body?JSON.stringify(body):undefined,redirect:"error",signal:AbortSignal.timeout(60000)});
  if(!response.ok)throw new Error("GitLab Pages runner API failed: HTTP "+response.status);
  try{return await response.json();}catch{throw new Error("Invalid GitLab Pages runner API response");}
}
async function projectRunners(request,token){
  const runners=[];
  for(let page=1;page<=100;page++){
    const values=await request(`/projects/${PROJECT}/runners?page=${page}&per_page=100`,{token});
    if(!Array.isArray(values))throw new Error("Invalid project runner readback");
    runners.push(...values);if(values.length<100)return runners;
  }
  throw new Error("Project runner enumeration exceeded its safety bound");
}
function verifyRunner(runner,id){
  if(runner?.id!==id||runner.runner_type!=="project_type"||runner.description!==REGISTRATION.description||
      !Array.isArray(runner.tag_list)||runner.tag_list.length!==1||runner.tag_list[0]!==TAG||runner.run_untagged!==false||runner.locked!==true||
      runner.access_level!=="ref_protected"||runner.maximum_timeout!==600||runner.paused===true||!runner.projects?.some(project=>project.id===PROJECT))throw new Error("Pages runner settings do not match the protected project configuration");
}
function storedToken(file){
  privatePath(file);const values=fs.readFileSync(file,"utf8").match(/^\s*token\s*=\s*"[A-Za-z0-9._-]+"\s*$/gm);
  if(values?.length!==1)throw new Error("Invalid stored runner authentication");
  return values[0].slice(values[0].indexOf("=")+1).trim().slice(1,-1);
}
function runnerToml(plan,config,token,id){
  const environment=["PATH="+config.environment.PATH,"LOCAL_RELEASE_CONFIG="+plan.configPath];
  for(const key of ["LOCAL_RELEASE_PYTHON","JAVA_HOME","ANDROID_HOME","ANDROID_SDK_ROOT"])if(typeof config.environment[key]==="string")environment.push(key+"="+config.environment[key]);
  return `concurrent = 1\ncheck_interval = 3\n\n[[runners]]\n  name = ${JSON.stringify(REGISTRATION.description)}\n  url = "https://gitlab.com/"\n  id = ${id}\n  token = ${JSON.stringify(token)}\n  executor = "shell"\n  shell = "bash"\n  limit = 1\n  builds_dir = ${JSON.stringify(plan.buildsDir)}\n  environment = ${JSON.stringify(environment)}\n  [runners.custom_build_dir]\n    enabled = true\n  [runners.feature_flags]\n    FF_ENABLE_JOB_CLEANUP = true\n`;
}
function runnerPlist(plan){
  const command=[plan.binary,"run","--working-directory",plan.directory,"--config",plan.configFile];
  return `<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">\n<plist version="1.0"><dict>\n<key>Label</key><string>${LABEL}</string>\n<key>ProgramArguments</key><array>${command.map(value=>`<string>${xml(value)}</string>`).join("")}</array>\n<key>WorkingDirectory</key><string>${xml(plan.directory)}</string>\n<key>RunAtLoad</key><true/>\n<key>KeepAlive</key><true/>\n<key>ThrottleInterval</key><integer>10</integer>\n<key>ProcessType</key><string>Background</string>\n<key>StandardOutPath</key><string>${xml(path.join(plan.directory,"runner.stdout.log"))}</string>\n<key>StandardErrorPath</key><string>${xml(path.join(plan.directory,"runner.stderr.log"))}</string>\n</dict></plist>\n`;
}
async function setup({configPath,binary,home=os.homedir(),platform=process.platform,uid=process.getuid?.(),request=apiRequest,run=spawnSync}={}){
  if(platform!=="darwin"||!Number.isInteger(uid)||uid<=0)throw new Error("Set up the Pages runner as the signed-in macOS user, never root");
  const plan=dryPlan({configPath,binary,home}),config=readJson(configPath);
  const executable=fs.lstatSync(binary);if(!executable.isFile()||executable.isSymbolicLink())throw new Error("Use the provided runner binary file");fs.accessSync(binary,fs.constants.X_OK);
  fs.mkdirSync(config.stateDir,{recursive:true,mode:0o700});privatePath(config.stateDir,true);
  fs.mkdirSync(plan.directory,{mode:0o700,recursive:true});privatePath(plan.directory,true);
  const lock=path.join(plan.directory,"setup.lock");let locked=false,keys={},authentication;
  try{
    try{fs.mkdirSync(lock,{mode:0o700});locked=true;}catch(error){if(error.code==="EEXIST")throw new Error("Pages runner setup is already active");throw error;}
    let record;
    if(fs.existsSync(plan.recordFile)){
      privatePath(plan.recordFile);record=readJson(plan.recordFile);
      if(record.format!==1||record.label!==LABEL||record.projectId!==PROJECT||record.owner!=="johninnld"||!Number.isSafeInteger(record.runnerId)||record.runnerId<=0)throw new Error("Refuse an unowned local Pages runner record");
      if(config.pages?.runnerId&&config.pages.runnerId!==record.runnerId)throw new Error("Private configuration refers to a different Pages runner");
      authentication=storedToken(plan.configFile);
    }else if(config.pages?.runnerId||fs.readdirSync(plan.directory).some(name=>name!=="setup.lock")||fs.existsSync(plan.plistPath))throw new Error("Refuse existing unowned Pages runner configuration");
    const keyFile=config.apiKeysFile||path.join(home,".ci");privatePath(keyFile);keys=loadApiKeys(keyFile);
    const owner=await request("/user",{token:keys.GITLAB_TOKEN});if(owner?.username!=="johninnld")throw new Error("Pages runner owner must be johninnld");
    const runners=await projectRunners(request,keys.GITLAB_TOKEN);
    if(runners.some(runner=>(runner.description===REGISTRATION.description||runner.tag_list?.includes(TAG))&&runner.id!==record?.runnerId))throw new Error("Refuse an existing unknown Pages runner collision");
    if(!record){
      const created=await request("/user/runners",{token:keys.GITLAB_TOKEN,method:"POST",body:{...REGISTRATION,tag_list:[TAG]}});
      if(!Number.isSafeInteger(created?.id)||created.id<=0||typeof created.token!=="string"||!/^[A-Za-z0-9._-]+$/.test(created.token))throw new Error("Invalid new Pages runner authentication response");
      authentication=created.token;record={format:1,label:LABEL,projectId:PROJECT,owner:"johninnld",runnerId:created.id};
      // Persist the one-time authentication before readback so a failed verification can be retried.
      atomicWrite(plan.configFile,runnerToml(plan,config,authentication,record.runnerId));atomicWrite(plan.recordFile,JSON.stringify(record,null,2)+"\n");
    }
    verifyRunner(await request(`/runners/${record.runnerId}`,{token:keys.GITLAB_TOKEN}),record.runnerId);
    config.pages={...config.pages,runnerId:record.runnerId,tag:TAG,publicUrl:PUBLIC_URL,buildsDir:plan.buildsDir};
    atomicWrite(configPath,JSON.stringify(config,null,2)+"\n");
    const toml=runnerToml(plan,config,authentication,record.runnerId),plist=runnerPlist(plan),options={encoding:"utf8",env:{PATH:config.environment.PATH,HOME:home},stdio:["ignore","pipe","pipe"]};
    const service=`gui/${uid}/${LABEL}`,observed=run("launchctl",["print",service],options);
    if(observed.status===0){
      if(!fs.existsSync(plan.plistPath))throw new Error("Refuse an unknown loaded Pages runner service");
      privatePath(plan.plistPath);
      if(fs.readFileSync(plan.plistPath,"utf8")!==plist||fs.readFileSync(plan.configFile,"utf8")!==toml)throw new Error("Existing Pages runner is loaded; stop it before changing configuration");
    }else{
      for(const directory of [plan.buildsDir,path.dirname(plan.plistPath)])fs.mkdirSync(directory,{recursive:true,mode:0o700});
      atomicWrite(plan.configFile,toml);atomicWrite(plan.plistPath,plist);
      if(run("plutil",["-lint",plan.plistPath],options).status!==0)throw new Error("Pages runner LaunchAgent failed plist validation");
      if(run("launchctl",["bootstrap",`gui/${uid}`,plan.plistPath],options).status!==0)throw new Error("Pages runner LaunchAgent bootstrap failed");
    }
    return {installed:true,label:LABEL,runnerId:record.runnerId,tag:TAG,publicUrl:PUBLIC_URL,buildsDir:plan.buildsDir,configFile:plan.configFile,plistPath:plan.plistPath};
  }catch(error){
    let message=error.message||"Pages runner setup failed";for(const value of [...Object.values(keys),authentication].filter(Boolean))message=message.split(value).join("[REDACTED]");throw new Error(message);
  }finally{if(locked)fs.rmSync(lock,{recursive:true});}
}
async function main(argv=process.argv.slice(2),options={}){
  const {values}=require("node:util").parseArgs({args:argv,options:{config:{type:"string"},binary:{type:"string"},"dry-run":{type:"boolean"},install:{type:"boolean"}}});
  if(!values.config||!values.binary)throw new Error("Use --config PRIVATE --binary ABS [--dry-run|--install]");
  if(values.install&&values["dry-run"])throw new Error("Choose one setup mode, not both");
  const selected={...options,configPath:values.config,binary:values.binary};
  return values.install?setup(selected):dryPlan(selected);
}
module.exports={setup,dryPlan,main};
if(require.main===module)main().then(value=>console.log(JSON.stringify(value))).catch(error=>{console.error(error.message);process.exitCode=1;});
