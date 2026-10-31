"use strict";
const fs = require("node:fs");
const {execFileSync} = require("node:child_process");
const {cosmiconfigSync} = require("cosmiconfig");
const semver = require("semver");
const {generateNotes} = require("./branded_release_notes.cjs");
const {verifyNotes} = require("./verify_release_notes.cjs");

async function preview(channel = process.env.RELEASE_CHANNEL || "main") {
  if (!["main", "dev"].includes(channel)) throw new Error("Expected main or dev release channel");
  const git = (...args) => execFileSync("git", args, {encoding:"utf8"}).trim();
  const head = git("rev-parse", "HEAD");
  const tags = git("tag", "--merged", head).split("\n").filter(tag => semver.valid(tag));
  const stable = tags.filter(tag => !semver.prerelease(tag)).sort((a,b)=>semver.rcompare(semver.valid(a),semver.valid(b)))[0];
  const previous = tags.filter(tag => channel === "main" ? !semver.prerelease(tag) : semver.prerelease(tag)?.[0] === "dev")
    .sort((a,b)=>semver.rcompare(semver.valid(a),semver.valid(b)))[0] || stable;
  const version = channel === "main" ? semver.inc(stable, "minor") : semver.gt(previous,stable) ? semver.inc(previous,"prerelease","dev") : semver.inc(stable,"preminor","dev");
  const parts = git("log", "--no-merges", "--format=%H%x00%B%x00", `${previous}..${head}`).split("\0");
  const commits=[];
  for(let i=0;i+1<parts.length;i+=2) commits.push({hash:parts[i].trim(),message:parts[i+1].trim()});
  const config = cosmiconfigSync("release").search(process.cwd()).config;
  const noteConfig = config.plugins.find(plugin => Array.isArray(plugin) && plugin[1].preset === "conventionalcommits")[1];
  const context = {cwd:process.cwd(), env:process.env,
    options:{repositoryUrl:"https://github.com/johnneerdael/dutch-applications-patches.git"},
    branch:channel === "main" ? {name:"main",type:"release"} : {name:"dev",type:"prerelease",prerelease:"dev"},
    commits, lastRelease:{version:semver.valid(previous),gitTag:previous,gitHead:git("rev-parse",previous)},
    nextRelease:{version,gitTag:`v${version}`,gitHead:head}, logger:{log:console.log}};
  context.nextRelease.notes = await generateNotes(noteConfig,context);
  verifyNotes(context);
  fs.mkdirSync("build/release-safety",{recursive:true});
  fs.writeFileSync("build/release-safety/notes-preview.md",context.nextRelease.notes);
  console.log(context.nextRelease.notes);
}
if(require.main===module) preview().catch(error=>{console.error(error);process.exitCode=1;});
module.exports={preview};
