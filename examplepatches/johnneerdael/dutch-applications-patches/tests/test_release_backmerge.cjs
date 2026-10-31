const assert = require('node:assert/strict');
const {test} = require('node:test');
const {execFileSync} = require('node:child_process');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const {success, configureMergeDrivers, retainedPaths} = require('../.github/scripts/dev_backmerge.cjs');

async function repository(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'morphe-backmerge-'));
  const git = (...args) => execFileSync('git', args, {cwd:dir, encoding:'utf8', stdio:['ignore','pipe','pipe']}).trim();
  const write = (file, text) => {fs.mkdirSync(path.dirname(path.join(dir,file)),{recursive:true});fs.writeFileSync(path.join(dir,file),text);};
  try {
    git('init','-b','main');git('config','user.name','Test');git('config','user.email','test@example.invalid');
    write('source.kt','original\n');write('CHANGELOG.md','## old\n');
    for(const file of retainedPaths) write(file,'base\n');
    git('add','.');git('commit','-m','base');git('branch','dev');
    for(const file of retainedPaths) write(file,'stable\n');
    write('CHANGELOG.md','## stable\n\nstable notes\n\n## old\n');write('new-source.kt','new main feature\n');
    git('add','.');git('commit','-m','stable');git('switch','dev');
    for(const file of retainedPaths) write(file,'preview\n');
    write('CHANGELOG.md','## preview\n\npreview notes\n\n## old\n');
    git('add','.');git('commit','-m','preview');
    configureMergeDrivers(dir, process.env);
    await fn({dir,git,write});
  } finally {fs.rmSync(dir,{recursive:true,force:true});}
}
test('keeps conflicting dev release files and imports real main changes',()=>repository(({dir,git})=>{
  git('merge','main','--no-edit');
  for(const file of retainedPaths.filter(file=>file!=='CHANGELOG.md')) assert.equal(fs.readFileSync(path.join(dir,file),'utf8'),'preview\n');
  assert.equal(fs.readFileSync(path.join(dir,'new-source.kt'),'utf8'),'new main feature\n');
  const history=fs.readFileSync(path.join(dir,'CHANGELOG.md'),'utf8');
  for(const heading of ['## preview','## old']) assert.equal(history.split(heading).length-1,1);
  assert.ok(!history.includes('## stable'));
}));
test('source conflicts still fail instead of silently choosing a branch',()=>repository(({git,write})=>{
  git('switch','main');write('source.kt','main change\n');git('add','.');git('commit','-m','main source');
  git('switch','dev');write('source.kt','dev change\n');git('add','.');git('commit','-m','dev source');
  assert.throws(()=>git('merge','main','--no-edit'));
  assert.equal(git('diff','--name-only','--diff-filter=U'),'source.kt');
}));
test('driver setup is idempotent',()=>repository(({dir,git})=>{
  configureMergeDrivers(dir,process.env);
  const attrs=fs.readFileSync(path.resolve(dir,git('rev-parse','--git-path','info/attributes')),'utf8');
  assert.equal(attrs.split('# Morphe dev release metadata').length-1,1);
}));

test('real plugin preserves channel files on its pushed dev merge',()=>repository(async({dir,git,write})=>{
  const remote=fs.mkdtempSync(path.join(os.tmpdir(),'morphe-backmerge-remote-'));
  try {
    execFileSync('git',['init','--bare',remote],{stdio:'ignore'});
    // A clean (nonconflicting) metadata change must also stay channel-specific.
    write('README.md','base\n');git('add','.');git('commit','-m','retain dev baseline');
    git('switch','main');write('README.md','new stable readme\n');git('add','.');git('commit','-m','stable readme');
    git('remote','add','origin',remote);git('push','origin','main','dev');
    await success({backmergeBranches:[{from:'main',to:'dev'}],backmergeStrategy:'merge',clearWorkspace:true},
      {cwd:dir,env:process.env,branch:{name:'main'},lastRelease:{},nextRelease:{version:'1.0.0'},
       options:{repositoryUrl:remote},logger:{log(){},error(){},success(){}}});
    git('fetch','origin');
    assert.equal(git('show','origin/dev:new-source.kt'),'new main feature');
    for(const file of retainedPaths.filter(file=>file!=='CHANGELOG.md')) assert.equal(git('show','origin/dev:'+file),file==='README.md'?'base':'preview');
    assert.ok(!git('show','origin/dev:CHANGELOG.md').includes('## stable'));
  } finally {fs.rmSync(remote,{recursive:true,force:true});}
}));

test('nested documentation conflicts are never covered by release-file drivers',()=>repository(({git,write})=>{
  const files=['docs/privacy/tvgids-nl/README.md','nested/CHANGELOG.md','nested/gradle.properties'];
  git('switch','main');for(const file of files) write(file,'main doc\n');git('add','.');git('commit','-m','main docs');
  git('switch','dev');for(const file of files) write(file,'dev doc\n');git('add','.');git('commit','-m','dev docs');
  assert.throws(()=>git('merge','main','--no-edit'));
  assert.deepEqual(git('diff','--name-only','--diff-filter=U').split('\n').sort(),files.sort());
}));

test('a stable promotion does not enter the dev changelog again',()=>repository(({git})=>{
  git('merge','main','--no-edit');
  const history=git('show','HEAD:CHANGELOG.md');
  assert.ok(history.includes('## preview'));
  assert.ok(!history.includes('## stable'));
}));

test('managed driver configuration migrates old changelog union settings',()=>repository(({dir,git})=>{
  const attrs=path.resolve(dir,git('rev-parse','--git-path','info/attributes'));
  fs.writeFileSync(attrs,'# unrelated\n/custom merge=custom\n# Morphe dev release metadata\n/README.md merge=morpheKeepDev\n/CHANGELOG.md merge=union\n/after merge=custom\n');
  configureMergeDrivers(dir,process.env);
  const updated=fs.readFileSync(attrs,'utf8');
  assert.ok(updated.includes('/custom merge=custom'));
  assert.ok(updated.includes('/after merge=custom'));
  assert.ok(updated.includes('/CHANGELOG.md merge=morpheKeepDev'));
  assert.ok(!updated.includes('merge=union'));
  configureMergeDrivers(dir,process.env);
  assert.equal(fs.readFileSync(attrs,'utf8'),updated);
}));
