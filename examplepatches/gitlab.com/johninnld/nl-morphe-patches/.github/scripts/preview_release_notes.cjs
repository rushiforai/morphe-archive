"use strict";
const fs = require("node:fs");
const {execFileSync} = require("node:child_process");
const {cosmiconfigSync} = require("cosmiconfig");
const semver = require("semver");
const {generateNotes} = require("./branded_release_notes.cjs");
const {verifyNotes} = require("./verify_release_notes.cjs");

async function preview() {
  const git = (...args) => execFileSync("git", args, {encoding:"utf8"}).trim();
  const head = git("rev-parse", "HEAD");
  const flag = process.argv.indexOf("--branch");
  const requested = flag >= 0 ? process.argv[flag + 1] : process.env.GITHUB_BASE_REF || process.env.GITHUB_REF_NAME || git("branch", "--show-current");
  const branch = requested === "dev" ? "dev" : "main";
  const tags = git("tag", "--merged", head).split("\n").filter(tag => {
    const version = semver.valid(tag);
    return version && (!semver.prerelease(version) || branch === "dev" && semver.prerelease(version)[0] === "dev");
  });
  const previous = tags.sort((a, b) => semver.rcompare(semver.valid(a), semver.valid(b)))[0];
  const range = previous ? `${previous}..${head}` : head;
  const parts = git("log", "--no-merges", "--format=%H%x00%B%x00", range).split("\0");
  const commits=[];
  for(let i=0;i+1<parts.length;i+=2) commits.push({hash:parts[i].trim(),message:parts[i+1].trim()});
  const config = cosmiconfigSync("release").search(process.cwd()).config;
  const {analyzeCommits} = await import("@semantic-release/commit-analyzer");
  const rules = config.plugins.find(plugin => Array.isArray(plugin) && plugin[0] === "@semantic-release/commit-analyzer")?.[1] || {};
  const type = await analyzeCommits(rules, {cwd:process.cwd(), commits, logger:{log(){}}}) || "patch";
  const lastRelease = previous ? {version:semver.valid(previous), gitTag:previous, gitHead:git("rev-parse",previous),
    channels:semver.prerelease(semver.valid(previous)) ? ["dev"] : [null]} : {};
  const releaseBranch = {name:branch, type:branch === "dev" ? "prerelease" : "release",
    channel:branch === "dev" ? "dev" : undefined, prerelease:"dev", tags:tags.map(tag => ({version:semver.valid(tag)}))};
  const {default: getNextVersion} = await import("semantic-release/lib/get-next-version.js");
  const version = getNextVersion({branch:releaseBranch, nextRelease:{type,channel:releaseBranch.channel}, lastRelease, logger:{log(){}}});
  const noteConfig = config.plugins.find(plugin => Array.isArray(plugin) && plugin[1].preset === "conventionalcommits")[1];
  const context = {cwd:process.cwd(), env:process.env,
    options:{repositoryUrl:"https://github.com/johninnl/nl-morphe-patches.git"},
    branch:releaseBranch,
    commits, lastRelease,
    nextRelease:{version,gitTag:`v${version}`,gitHead:head}, logger:{log:console.log}};
  context.nextRelease.notes = await generateNotes(noteConfig,context);
  verifyNotes(context);
  fs.mkdirSync("build/release-safety",{recursive:true});
  fs.writeFileSync("build/release-safety/notes-preview.md",context.nextRelease.notes);
  console.log(context.nextRelease.notes);
}
if(require.main===module) preview().catch(error=>{console.error(error);process.exitCode=1;});
module.exports={preview};
