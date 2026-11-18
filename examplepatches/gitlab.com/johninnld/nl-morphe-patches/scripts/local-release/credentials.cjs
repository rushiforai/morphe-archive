"use strict";
const fs=require("node:fs");
const LABELS=["GITLAB","GITGUD","CODEBERG"];
// Shared ~/.ci entries owned by other local projects (DriveDeck/Gearslip release notes). Skipped unread.
const FOREIGN_LABELS=["PUBLISH_BLOCKLIST"];

function read(file,kind){
  try{return fs.readFileSync(file,"utf8").trim();}
  catch{throw new Error(`Cannot read ${kind} file`);}
}
function token(raw,kind){
  let value=raw.trim();
  // Saved files may wrap an assignment in quotes, or contain APIKEY= inside that value.
  for(let depth=0;depth<8;depth++){
    if(/^["']/.test(value)){
      if(!["'",'"'].includes(value[0])||value.at(-1)!==value[0]||value.length<2)throw new Error(`Invalid ${kind} value`);
      value=value.slice(1,-1).trim();continue;
    }
    const wrapper=/^APIKEY\s*[:=]\s*/i.exec(value);
    if(wrapper){value=value.slice(wrapper[0].length).trim();continue;}
    break;
  }
  if(!/^[A-Za-z0-9._-]+$/.test(value))throw new Error(`Invalid ${kind} value`);
  return value;
}
function jsonEntries(text){
  let object;
  try{object=JSON.parse(text);}catch{throw new Error("Invalid API key JSON format");}
  if(!object||Array.isArray(object)||typeof object!=="object"||Object.values(object).some(value=>typeof value!=="string"))throw new Error("Invalid API key JSON format");
  // Preserve original keys: JSON.parse alone silently discards duplicate properties.
  const tokens=text.match(/"(?:\\.|[^"\\])*"|[{}\[\],]/g),entries=[];
  let depth=0,keyExpected=false;
  for(const item of tokens){
    if(item==="{"||item==="["){depth++;if(depth===1)keyExpected=true;}
    else if(item==="}"||item==="]")depth--;
    else if(depth===1&&item===",")keyExpected=true;
    else if(depth===1&&keyExpected){const key=JSON.parse(item);entries.push([key,object[key]]);keyExpected=false;}
  }
  return entries;
}
/** Read only labelled API credentials; SSH key files are never a fallback. */
function loadApiKeys(file){
  const text=read(file,"API key");
  const entries=text.startsWith("{")?jsonEntries(text):text.split(/\r?\n/).filter(line=>line.trim()&&!line.trim().startsWith("#")).map(line=>{
    const match=/^\s*(?:export\s+)?([A-Za-z_][A-Za-z0-9_]*)\s*[:=]\s*(.*?)\s*$/.exec(line);
    if(!match)throw new Error("Invalid API key labelled format");
    return [match[1],match[2]];
  });
  const result={};
  for(const [label,value] of entries){
    if(FOREIGN_LABELS.includes(label.toUpperCase()))continue;
    if(!/^(?:GITLAB|GITGUD|CODEBERG)(?:_TOKEN)?$/i.test(label))throw new Error("Invalid API key label");
    const key=label.toUpperCase().replace(/_TOKEN$/,"")+"_TOKEN";
    if(Object.hasOwn(result,key))throw new Error("Duplicate API key label");
    result[key]=token(value,"API key");
  }
  if(LABELS.some(label=>!Object.hasOwn(result,label+"_TOKEN")))throw new Error("Missing required API key label");
  return result;
}
/** Explicit legacy overrides may still name a single raw or assigned API token file. */
function loadTokenFile(file){
  const text=read(file,"API token");
  const assignment=/^(?:export\s+)?[A-Za-z_][A-Za-z0-9_]*\s*[:=]\s*/.exec(text);
  return token(assignment?text.slice(assignment[0].length):text,"API token");
}
module.exports={loadApiKeys,loadTokenFile};
