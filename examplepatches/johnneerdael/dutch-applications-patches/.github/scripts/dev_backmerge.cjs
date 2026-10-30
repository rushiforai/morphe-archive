// Preserve channel-specific generated files without masking source conflicts.
const {execFileSync} = require('node:child_process');
const fs = require('node:fs');
const path = require('node:path');
const retainedPaths = [
  'gradle.properties', 'patches-bundle.json', 'patches-list.json', 'README.md',
  'docs/site/en/index.md', 'docs/site/nl/index.md',
  'docs/site/en/reference/catalogue.md', 'docs/site/nl/reference/catalogue.md',
];
function configureMergeDrivers(cwd, env) {
  const git = (...args) => execFileSync('git', args, {cwd,env,encoding:'utf8'}).trim();
  const attributes = path.resolve(cwd,git('rev-parse','--git-path','info/attributes'));
  const marker = '# Morphe dev release metadata';
  const existing = fs.existsSync(attributes) ? fs.readFileSync(attributes,'utf8') : '';
  if(!existing.includes(marker)) {
    fs.mkdirSync(path.dirname(attributes),{recursive:true});
    fs.writeFileSync(attributes,existing+'\n'+marker+'\n'+
      retainedPaths.map(file=>'/'+file+' merge=morpheKeepDev').join('\n')+
      '\n/CHANGELOG.md merge=union\n');
  }
  git('config','merge.morpheKeepDev.driver','true');
}
async function success(config, context) {
  if(context.branch.name !== 'main') return;
  configureMergeDrivers(context.cwd,context.env);
  const plugin = await import('@cleyrop-org/semantic-release-backmerge');
  await plugin.success({...config,ignorePaths:retainedPaths},context);
}
module.exports = {success,configureMergeDrivers,retainedPaths};
