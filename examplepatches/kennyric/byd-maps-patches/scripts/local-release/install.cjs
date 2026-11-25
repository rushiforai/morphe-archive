"use strict";
const fs = require("node:fs");
const os = require("node:os");
const path = require("node:path");
const crypto = require("node:crypto");
const {spawnSync} = require("node:child_process");

const LABEL = "nl.johninnl.morphe.local-release";
const FILES = ["flow.cjs", "verify.cjs", "templates.json", "credentials.cjs", "pages.cjs", "pages-job.cjs"];
const xml = value => String(value).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;");

function installationPlan({configPath, config, home = os.homedir(), node = process.execPath, sourceDir = __dirname}) {
  if (!path.isAbsolute(configPath) || !path.isAbsolute(config.stateDir)) throw new Error("Config and state directory paths must be absolute");
  if (!Number.isInteger(config.pollSeconds ?? 120) || (config.pollSeconds ?? 120) < 60) throw new Error("Polling interval must be at least 60 seconds");
  const tooling = path.join(config.stateDir,"tooling");
  const plistPath = path.join(home,"Library/LaunchAgents",`${LABEL}.plist`);
  const command = [node,path.join(tooling,"flow.cjs"),"--config",configPath,"--watch-once"];
  const plist = `<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>Label</key><string>${LABEL}</string>
<key>ProgramArguments</key><array>${command.map(v=>`<string>${xml(v)}</string>`).join("")}</array>
<key>WorkingDirectory</key><string>${xml(tooling)}</string>
<key>RunAtLoad</key><true/>
<key>StartInterval</key><integer>${config.pollSeconds ?? 120}</integer>
<key>ProcessType</key><string>Background</string>
<key>StandardOutPath</key><string>${xml(path.join(config.stateDir,"logs/launchd.stdout.log"))}</string>
<key>StandardErrorPath</key><string>${xml(path.join(config.stateDir,"logs/launchd.stderr.log"))}</string>
</dict></plist>
`;
  return {label:LABEL,configPath,tooling,plistPath,command,plist,
    files:FILES.map(name=>({source:path.join(sourceDir,name),target:path.join(tooling,name)}))};
}

function atomicWrite(file,bytes,mode=0o600) {
  const temporary=file+"."+crypto.randomUUID()+".tmp";let created=false,descriptor;
  try{descriptor=fs.openSync(temporary,"wx",mode);created=true;fs.writeFileSync(descriptor,bytes);fs.closeSync(descriptor);descriptor=undefined;fs.renameSync(temporary,file);created=false;}
  finally{try{if(descriptor!==undefined)fs.closeSync(descriptor);}finally{if(created)fs.rmSync(temporary,{force:true});}}
}
function install({configPath, home = os.homedir(), node = process.execPath, sourceDir = __dirname,
                  platform = process.platform, uid = process.getuid?.(), run = spawnSync,replaceFile=atomicWrite} = {}) {
  if (platform !== "darwin" || !Number.isInteger(uid) || uid <= 0) throw new Error("Install as the signed-in macOS user, never root");
  const config = JSON.parse(fs.readFileSync(configPath,"utf8"));
  const plan = installationPlan({configPath,config,home,node,sourceDir});
  const configuration=fs.lstatSync(configPath);
  if(!configuration.isFile()||configuration.isSymbolicLink()||configuration.uid!==process.getuid()||(configuration.mode&0o077)!==0)throw new Error("Private local configuration must be owned and mode 600");
  for(const file of plan.files){const stat=fs.lstatSync(file.source);if(!stat.isFile()||stat.isSymbolicLink())throw new Error(`Missing reviewed automation template: ${path.basename(file.source)}`);}
  const marker=path.join(plan.tooling,".installed.json");
  function checkTooling(){
    if(fs.existsSync(plan.tooling)){
      if(fs.lstatSync(plan.tooling).isSymbolicLink()||!fs.statSync(plan.tooling).isDirectory())throw new Error("Refuse to overwrite an unowned tooling directory");
      if(fs.readdirSync(plan.tooling).length&&(!fs.existsSync(marker)||JSON.parse(fs.readFileSync(marker,"utf8")).label!==LABEL))throw new Error("Refuse to overwrite an unowned tooling directory");
    }
  }
  checkTooling();
  fs.mkdirSync(config.stateDir,{recursive:true,mode:0o700});
  const state=fs.lstatSync(config.stateDir);
  if(state.isSymbolicLink()||!state.isDirectory()||state.uid!==process.getuid()||(state.mode&0o077)!==0)throw new Error("Use a private owned state directory");
  const lock=path.join(config.stateDir,"lock"),service=`gui/${uid}/${LABEL}`;
  let held=false,stage,unloaded=false,writing=false,bootstrapAttempted=false,oldLoaded=false;
  const backups=new Map();
  const active=result=>result.status===0&&(/\bpid = \d+/.test(result.stdout||"")||/\bstate = running\b/.test(result.stdout||""));
  const inspect=()=>{
    const result=run("launchctl",["print",service],{encoding:"utf8"});
    if(![0,113].includes(result.status))throw new Error("Cannot establish whether the LaunchAgent is idle");
    return result;
  };
  const unlock=()=>{if(held){fs.rmSync(lock,{recursive:true});held=false;}};
  try{
    try{fs.mkdirSync(lock,{mode:0o700});held=true;}catch(error){if(error.code==="EEXIST")throw new Error("Local release is running or its lock needs review");throw error;}
    fs.writeFileSync(path.join(lock,"owner.json"),JSON.stringify({pid:process.pid,operation:"install"})+"\n",{mode:0o600});
    checkTooling();
    const observed=inspect();if(active(observed))throw new Error("Local release is running; update automation after it finishes");oldLoaded=observed.status===0;
    const proposedStage=path.join(config.stateDir,".install-"+crypto.randomUUID());fs.mkdirSync(proposedStage,{mode:0o700});stage=proposedStage;
    const stagedTooling=path.join(stage,"tooling");fs.mkdirSync(stagedTooling,{mode:0o700});
    const hashes={};
    for(const file of plan.files){
      const name=path.basename(file.source),bytes=fs.readFileSync(file.source);fs.writeFileSync(path.join(stagedTooling,name),bytes,{mode:0o600,flag:"wx"});hashes[name]=crypto.createHash("sha256").update(bytes).digest("hex");
    }
    fs.writeFileSync(path.join(stagedTooling,".installed.json"),JSON.stringify({label:LABEL,hashes},null,2)+"\n",{mode:0o600,flag:"wx"});
    const stagedPlist=path.join(stage,`${LABEL}.plist`);fs.writeFileSync(stagedPlist,plan.plist,{mode:0o600,flag:"wx"});
    const templates=JSON.parse(fs.readFileSync(path.join(stagedTooling,"templates.json"),"utf8"));
    if(Object.keys(templates).sort().join(",")!=="main"||templates.main?.branch!=="main"||templates.main?.prerelease!==false||templates.main?.channel!==null)throw new Error("Staged templates must declare only the main release channel");
    JSON.parse(fs.readFileSync(path.join(stagedTooling,".installed.json"),"utf8"));
    for(const name of FILES.filter(name=>name.endsWith(".cjs")))if(run(node,["--check",path.join(stagedTooling,name)],{encoding:"utf8"}).status!==0)throw new Error("Staged JavaScript validation failed: "+name);
    if(run("plutil",["-lint",stagedPlist],{encoding:"utf8"}).status!==0)throw new Error("Generated LaunchAgent failed plist validation");
    const replacements=[...plan.files.map(file=>({target:file.target,source:path.join(stagedTooling,path.basename(file.source))})),{target:marker,source:path.join(stagedTooling,".installed.json")},{target:plan.plistPath,source:stagedPlist}];
    for(const item of replacements){
      if(fs.existsSync(item.target)){
        const stat=fs.lstatSync(item.target);if(!stat.isFile()||stat.isSymbolicLink())throw new Error("Refuse to replace an unowned installation file");
        backups.set(item.target,{bytes:fs.readFileSync(item.target),mode:stat.mode&0o777});
      }else backups.set(item.target,null);
    }
    for(const folder of [plan.tooling,path.join(config.stateDir,"logs"),path.dirname(plan.plistPath)])if(fs.existsSync(folder)){
      const stat=fs.lstatSync(folder);if(stat.isSymbolicLink()||!stat.isDirectory())throw new Error("Refuse symlinked or unowned installation directory");
    }
    // Validation is complete; the shared flow lock also closes the idle-check/start race.
    const current=inspect();if(active(current))throw new Error("Local release became active; installation refused");
    if(current.status===0){
      const result=run("launchctl",["bootout",`gui/${uid}`,plan.plistPath],{encoding:"utf8"});
      if(result.status!==0)throw new Error("Existing idle LaunchAgent could not be unloaded");unloaded=true;
    }
    writing=true;
    for(const folder of [plan.tooling,path.join(config.stateDir,"logs"),path.dirname(plan.plistPath)]){
      fs.mkdirSync(folder,{recursive:true,mode:0o700});if(fs.lstatSync(folder).isSymbolicLink())throw new Error("Refuse symlinked installation directory");
    }
    for(const item of replacements)replaceFile(item.target,fs.readFileSync(item.source),0o600);
    unlock();bootstrapAttempted=true;
    const started=run("launchctl",["bootstrap",`gui/${uid}`,plan.plistPath],{encoding:"utf8"});
    if(started.status!==0)throw new Error("LaunchAgent bootstrap was not confirmed; installed tooling preserved for review");
    return {label:LABEL,plistPath:plan.plistPath,tooling:plan.tooling,pollSeconds:config.pollSeconds??120,hashes};
  }catch(error){
    let message=error.message;
    if(writing&&!bootstrapAttempted){
      let safe=false;
      try{safe=!active(inspect());}catch{message+="; cannot establish idle state for rollback";}
      if(safe){
        let restored=true;
        for(const [file,backup] of backups)try{if(backup)atomicWrite(file,backup.bytes,backup.mode);else fs.rmSync(file,{force:true});}catch{restored=false;}
        if(!restored)message+="; previous installation could not be fully restored";
        if(restored&&oldLoaded&&unloaded){
          // Restore only the known old idle job after old bytes are back and publication is unlocked.
          unlock();
          try{if(run("launchctl",["bootstrap",`gui/${uid}`,plan.plistPath],{encoding:"utf8"}).status!==0)message+="; old LaunchAgent restoration was not confirmed";}
          catch{message+="; old LaunchAgent restoration was not confirmed";}
        }
      }else message+="; active or ambiguous service prevents rollback; installed files preserved";
    }
    // A failed/ambiguous bootstrap may already have a live new worker. Never kill or overwrite it.
    throw new Error(message);
  }finally{
    try{if(stage)fs.rmSync(stage,{recursive:true,force:true});}finally{unlock();}
  }
}

function main(argv=process.argv.slice(2)) {
  const configIndex=argv.indexOf("--config"),configPath=argv[configIndex+1];
  if(configIndex<0 || !configPath || argv.some((v,i)=>i!==configIndex && i!==configIndex+1 && !["--install","--dry-run"].includes(v))) throw new Error("Usage: node scripts/local-release/install.cjs --config /private/config.json [--dry-run|--install]");
  if(argv.includes("--install") && argv.includes("--dry-run")) throw new Error("Choose installation or dry-run, not both");
  if(argv.includes("--install")) return install({configPath:path.resolve(configPath)});
  const config=JSON.parse(fs.readFileSync(configPath,"utf8"));
  const {plist,...plan}=installationPlan({configPath:path.resolve(configPath),config});
  return {...plan,dryRun:true};
}
module.exports={LABEL,FILES,installationPlan,install,main};
if(require.main===module)try{console.log(JSON.stringify(main()));}catch(error){console.error(error.message);process.exitCode=1;}
