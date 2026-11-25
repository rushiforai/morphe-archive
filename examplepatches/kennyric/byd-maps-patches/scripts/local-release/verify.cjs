"use strict";
const {execFileSync} = require("node:child_process");
const fs=require("node:fs"),os=require("node:os"),path=require("node:path");

function testEnvironment(env,home){
  const clean={...env};
  for(const name of Object.keys(clean))if(/TOKEN|PASSWORD|SECRET|SIGNING_KEY|API_KEY|SSH_KEY/i.test(name)||/^CI(?:_|$)/.test(name)||/^GIT_(?:SSH|SSH_COMMAND|SSH_VARIANT|DIR|WORK_TREE|INDEX_FILE|COMMON_DIR|OBJECT_DIRECTORY|ALTERNATE_OBJECT_DIRECTORIES|CONFIG.*)$/.test(name))delete clean[name];
  for(const name of ["SITE_URL","SOCIAL_IMAGE_URL","GITLAB_REPOSITORY","GITHUB_REPOSITORY","GITLAB_DESTINATION","REPOSITORY_URL","REPOSITORY_NAME","REPOSITORY_ICON","LOCAL_RELEASE_CONFIG","LOCAL_CI_CREDENTIALS_FILE"])delete clean[name];
  return {...clean,HOME:home,XDG_CONFIG_HOME:path.join(home,".config"),GIT_TERMINAL_PROMPT:"0",SHARED_MAPS_API_KEY:"AIzaSyDOCSGATEPLACEHOLDER00000000000000"};
}

/** Keep local automation and the explicitly requested cloud fallback on identical checks. */
function verificationCommands({python = ".venv/bin/python", offline = false} = {}) {
  const nodeTests = ["release_branding", "preview_release", "identity", "release_discovery", "codeberg", "gitgud", "gitlab", "gitlab_publish", "local_verify", "local_release", "local_release_install", "local_release_mirrors", "local_credentials", "local_pages", "local_pages_runner"];
  return [
    {name: "identity", command: "node", args: [".forgejo/scripts/identity.cjs", "--history"]},
    {name: "node-tests", command: "node", args: ["--test", ...nodeTests.map(name => `tests/test_${name}.cjs`)]},
    {name: "python-tests", command: python, args: ["-m", "unittest", "discover", "-s", "tests"]},
    {name: "android", command: "./gradlew", args: [":patches:buildAndroid", ":patches:test", ":patches:generatePatchesList", "testDebugUnitTest", "--no-daemon", "-Dorg.gradle.jvmargs=-Xmx2g", ...(offline ? ["--offline"] : [])]},
    {name: "medium-bundle", command: python, args: ["scripts/medium/check_bundle.py"]},
    {name: "medium-tests", command: python, args: ["-m", "unittest", "discover", "-s", "scripts/medium/tests"]},
    {name: "docs-catalog", command: python, args: ["scripts/generate_docs_catalog.py"]},
    {name: "docs-pages", command: python, args: ["scripts/check_docs_app_pages.py"]},
    {name: "docs-build", command: python, args: ["-m", "mkdocs", "build", "--strict"]},
    {name: "docs-site", command: python, args: ["scripts/check_docs_site.py"]},
  ];
}

async function verify({cwd = process.cwd(), env = process.env, python = env.LOCAL_RELEASE_PYTHON || ".venv/bin/python", offline = env.LOCAL_RELEASE_GRADLE_OFFLINE === "true", run = execFileSync} = {}) {
  const verificationEnv = {...env, SHARED_MAPS_API_KEY: env.SHARED_MAPS_API_KEY || "AIzaSyDOCSGATEPLACEHOLDER00000000000000"};
  if (env.CI_SERVER_HOST === "gitlab.com") {
    verificationEnv.GITLAB_REPOSITORY = env.CI_PROJECT_PATH;
    verificationEnv.SITE_URL = env.CI_PAGES_URL || "https://nl-morphe-patches-ed90fa.gitlab.io/";
  }
  const commands = verificationCommands({python, offline});
  for (const {name, command, args} of commands) {
    const testHome=name.endsWith("-tests")?fs.mkdtempSync(path.join(os.tmpdir(),"morphe-test-home-")):null;
    try{
      const result = await run(command, args, {cwd, env: testHome?testEnvironment(verificationEnv,testHome):verificationEnv, stdio: "inherit"});
      if (result && result.error) throw result.error;
      if (result && (result.signal || (typeof result.status === "number" && result.status !== 0))) {
        throw new Error(`Verification ${name} failed: ${result.signal || `exit ${result.status}`}`);
      }
    }finally{if(testHome)fs.rmSync(testHome,{recursive:true,force:true});}
  }
  return commands;
}

module.exports = {verificationCommands, verify, testEnvironment};
if (require.main === module) {
  verify().catch(error => {
    console.error(`Verification failed: ${error.message}`);
    process.exitCode = 1;
  });
}
