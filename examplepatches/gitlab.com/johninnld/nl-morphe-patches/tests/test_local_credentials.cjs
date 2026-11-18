"use strict";
const {test}=require("node:test");
const assert=require("node:assert/strict");
const fs=require("node:fs"),os=require("node:os"),path=require("node:path");
const {execFileSync}=require("node:child_process");
const helper=()=>require("../scripts/local-release/credentials.cjs");
const expected={GITGUD_TOKEN:"gitgud-fixture",GITLAB_TOKEN:"gitlab-fixture",CODEBERG_TOKEN:"codeberg-fixture"};
function assertFixtureKeys(actual){
  assert.deepEqual(Object.keys(actual).sort(),Object.keys(expected).sort());
  for(const key of Object.keys(expected))assert.ok(actual[key]===expected[key],"API token must match its destination fixture");
}
function fixture(t,text){
  const home=fs.mkdtempSync(path.join(os.tmpdir(),"local-api-keys-"));t.after(()=>fs.rmSync(home,{recursive:true,force:true}));
  const file=path.join(home,".ci");fs.writeFileSync(file,text,{mode:0o600});return {home,file};
}
const labelled="GITGUD: gitgud-fixture\nGITLAB = \"gitlab-fixture\"\nCODEBERG: 'codeberg-fixture'\n";
test("central API keys parse each labelled colon/equal value independently",t=>{
  const {file}=fixture(t,labelled);assertFixtureKeys(helper().loadApiKeys(file));
});
test("optional token suffixes, export, whitespace and full-line comments are accepted",t=>{
  const {file}=fixture(t,"# private API tokens\n\nexport GITGUD_TOKEN = gitgud-fixture\r\n GITLAB_TOKEN: 'gitlab-fixture' \nCODEBERG_TOKEN=\"codeberg-fixture\"\n");
  assertFixtureKeys(helper().loadApiKeys(file));
});
test("nested APIKEY wrappers are unwrapped per destination without mixing credentials",t=>{
  const {file}=fixture(t,"GITGUD: APIKEY=gitgud-fixture\nGITLAB=\"APIKEY='gitlab-fixture'\"\nCODEBERG: APIKEY=\"APIKEY=codeberg-fixture\"\n");
  assertFixtureKeys(helper().loadApiKeys(file));
});
test("JSON credentials accept the same labelled names and nested APIKEY wrappers",t=>{
  const {file}=fixture(t,JSON.stringify({GITGUD_TOKEN:"gitgud-fixture",GITLAB:"APIKEY=gitlab-fixture",CODEBERG:"'codeberg-fixture'"}));
  assertFixtureKeys(helper().loadApiKeys(file));
});
test("duplicate labels and aliases are rejected including duplicate JSON properties",t=>{
  for(const text of [labelled+"GITLAB=duplicate-sensitive-value\n",labelled+"GITLAB_TOKEN=duplicate-sensitive-value\n",'{"GITGUD":"gitgud-fixture","GITLAB":"first-sensitive-value","GITLAB":"duplicate-sensitive-value","CODEBERG":"codeberg-fixture"}', '{"GITGUD":"gitgud-fixture","GITLAB":42,"GITLAB":"duplicate-sensitive-value","CODEBERG":"codeberg-fixture"}', '{"GITGUD":"gitgud-fixture","GITLAB":{"nested":"first-sensitive-value"},"GITLAB":"duplicate-sensitive-value","CODEBERG":"codeberg-fixture"}']){
    const {file}=fixture(t,text);assert.throws(()=>helper().loadApiKeys(file),error=>/Duplicate/.test(error.message)&&!error.message.includes("sensitive-value"));
  }
});
test("missing, unknown and malformed entries never expose their values in errors",t=>{
  for(const text of ["", "GITLAB: sensitive-value", labelled+"UNKNOWN=sensitive-value", labelled+"unlabelled-sensitive-value", labelled.replace('"gitlab-fixture"','"sensitive-value'), labelled.replace("gitgud-fixture","sensitive-value invalid"), '{"GITLAB":"sensitive-value", broken}', '{"GITLAB":42,"GITGUD":"sensitive-value","CODEBERG":"codeberg-fixture"}', '["sensitive-value"]']){
    const {file}=fixture(t,text);assert.throws(()=>helper().loadApiKeys(file),error=>!error.message.includes("sensitive-value")&&/API key/.test(error.message));
  }
});
test("another project's PUBLISH_BLOCKLIST entry is skipped without reading its value",t=>{
  for(const text of [labelled+"PUBLISH_BLOCKLIST=First Name, other name\n", '{"GITGUD":"gitgud-fixture","GITLAB":"gitlab-fixture","PUBLISH_BLOCKLIST":"a, b","CODEBERG":"codeberg-fixture"}']){
    const {file}=fixture(t,text),keys=helper().loadApiKeys(file);assertFixtureKeys(keys);assert.equal(Object.hasOwn(keys,"PUBLISH_BLOCKLIST_TOKEN"),false);
  }
  const {file}=fixture(t,labelled+"PUBLISH_BLOCKLIST_EXTRA=sensitive-value\n");
  assert.throws(()=>helper().loadApiKeys(file),error=>/Invalid API key label/.test(error.message)&&!error.message.includes("sensitive-value"));
});
test("SSH private/public key files cannot be loaded as API credentials",t=>{
  for(const text of ["-----BEGIN OPENSSH PRIVATE KEY-----\nsecret-body\n-----END OPENSSH PRIVATE KEY-----", "-----BEGIN RSA PRIVATE KEY-----\nsecret-body\n-----END RSA PRIVATE KEY-----", "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIfixture user@machine"]){
    const {file}=fixture(t,text);assert.throws(()=>helper().loadApiKeys(file),/API key/);assert.throws(()=>helper().loadTokenFile(file),/API token/);
  }
});
test("explicit legacy token files support raw, assigned and APIKEY-wrapped tokens",t=>{
  for(const text of ["legacy-fixture", "APIKEY=legacy-fixture", "export GITLAB_TOKEN='legacy-fixture'", 'GITGUD_TOKEN="APIKEY=legacy-fixture"', 'APIKEY="APIKEY=legacy-fixture"']){
    const {file}=fixture(t,text);assert.ok(helper().loadTokenFile(file)==="legacy-fixture","Legacy API token must match its fixture");
  }
});
test("malformed legacy tokens are rejected without logging their content",t=>{
  for(const text of ["", "APIKEY=", 'APIKEY="sensitive-value', "APIKEY=sensitive-value\nSECOND=other", "sensitive-value with spaces"]){
    const {file}=fixture(t,text);assert.throws(()=>helper().loadTokenFile(file),error=>/API token/.test(error.message)&&!error.message.includes("sensitive-value"));
  }
});
function identityToken(moduleName,home,env={}){
  const root=path.join(__dirname,"..");
  const isolated={PATH:process.env.PATH,HOME:home,GITLAB_TOKEN_FILE:"",GITGUD_TOKEN_FILE:"",CODEBERG_TOKEN_FILE:"",...env};
  return execFileSync(process.execPath,["-e","process.stdout.write(require(process.argv[1]).localToken({home:process.argv[2],env:process.env}));",path.join(root,moduleName),home],{cwd:root,env:isolated,encoding:"utf8",stdio:["ignore","pipe","pipe"]});
}
test("all identity helpers select only their destination API token from the central file",t=>{
  const {home}=fixture(t,labelled);
  assert.ok(identityToken(".gitlab/scripts/identity.cjs",home,{GITLAB_DESTINATION:"gitlab"})===expected.GITLAB_TOKEN,"GitLab API token must match its fixture");
  assert.ok(identityToken(".gitlab/scripts/identity.cjs",home,{GITLAB_DESTINATION:"gitgud"})===expected.GITGUD_TOKEN,"GitGud API token must match its fixture");
  assert.ok(identityToken(".forgejo/scripts/identity.cjs",home)===expected.CODEBERG_TOKEN,"Codeberg API token must match its fixture");
});
test("explicit identity token-file overrides retain legacy compatibility",t=>{
  const {home}=fixture(t,labelled),file=path.join(home,"legacy-token");fs.writeFileSync(file,'APIKEY="legacy-fixture"\n',{mode:0o600});
  assert.ok(identityToken(".gitlab/scripts/identity.cjs",home,{GITLAB_DESTINATION:"gitlab",GITLAB_TOKEN_FILE:file})==="legacy-fixture","GitLab override must match its fixture");
  assert.ok(identityToken(".gitlab/scripts/identity.cjs",home,{GITLAB_DESTINATION:"gitgud",GITGUD_TOKEN_FILE:file})==="legacy-fixture","GitGud override must match its fixture");
  assert.ok(identityToken(".forgejo/scripts/identity.cjs",home,{CODEBERG_TOKEN_FILE:file})==="legacy-fixture","Codeberg override must match its fixture");
});
