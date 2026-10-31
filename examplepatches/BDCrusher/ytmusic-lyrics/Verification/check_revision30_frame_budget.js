const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict'),crypto=require('node:crypto');
(async()=>{
 const home=path.resolve(__dirname,'..'),file=path.join(home,'Personal-Patches/web/src/frame-budget.js'),source=fs.readFileSync(file,'utf8');
 const {FrameBudget}=await import('data:text/javascript;base64,'+Buffer.from(source).toString('base64'));let checks=0;
 for(const hz of [60,90,120]){
  const budget=new FrameBudget(),reports=[];for(let i=0;i<hz*70;i++){const report=budget.sample(i*1000/hz,true);if(report)reports.push(report);}
  assert.equal(reports.length,0);checks++;
 }
 const budget=new FrameBudget(),reports=[];let now=0;
 for(let i=0;i<4000;i++){now+=1000/60;if(i===1650)now+=150;const report=budget.sample(now,true);if(report)reports.push(report);}
 assert.equal(reports.length,1);checks++;assert(reports[0].includes('worst 166.7 ms'));checks++;assert(reports[0].length<240);checks++;
 budget.sample(now,false);assert.equal(budget.sample(now+20000,true),undefined);checks++;
 budget.reset(now+20000);assert.equal(budget.frames,0);assert.equal(budget.late,0);checks++;
 fs.writeFileSync(path.join(home,'Verification/revision30-frame-budget.json'),JSON.stringify({passed:true,checks,actualSourceSha256:{'web/src/frame-budget.js':crypto.createHash('sha256').update(source).digest('hex')},phoneVerified:false},null,2)+'\n');console.log('PASS: '+checks+' bounded frame diagnostic checks');
})().catch(error=>{console.error(error);process.exitCode=1;});
