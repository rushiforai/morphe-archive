/* Execute the actual host clock under virtual display/transport schedules. */
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
(async()=>{
 const home=path.resolve(__dirname,'..'),source=fs.readFileSync(path.join(home,'Personal-Patches/web/src/playback-clock.js'),'utf8');
 const {PlaybackClock}=await import('data:text/javascript;base64,'+Buffer.from(source).toString('base64'));
 const cases=[];
 for(const hz of [60,90,120])for(const rate of [.5,1,1.5,2]){
  const clock=new PlaybackClock();let old,previous,oldPrevious,reverse=0,oldReverse=0,maxError=0,maxSpeed=0,nextSample=0;
  const base=10000,wall=1800000000000;
  for(let frame=0;frame<hz*120;frame++){
   const now=frame*1000/hz;
   if(now>=nextSample){
    const jitter=frame===0?0:(Math.round(now/100)%2?45:-45);
    const queueAge=(frame%9)*9;
    const sample={position:base+(now-queueAge)*rate+jitter,playing:true,rate,revision:1,sampledAt:wall+now-queueAge};
    clock.accept(sample,now,wall+now);old={position:sample.position+queueAge*rate,at:now};nextSample=now+100;
   }
   const actual=clock.read(now),legacy=old.position+(now-old.at)*rate;
   if(previous!==undefined){const step=actual-previous;if(step<-.001)reverse++;if(legacy-oldPrevious<-.001)oldReverse++;maxSpeed=Math.max(maxSpeed,step/(1000/hz));}
   maxError=Math.max(maxError,Math.abs(actual-(base+now*rate)));previous=actual;oldPrevious=legacy;
  }
  assert.equal(reverse,0);assert(oldReverse>0);assert(maxError<60);assert(maxSpeed<=rate*1.081);
  cases.push({hz,rate,seconds:120,reverseSteps:reverse,legacyReverseSteps:oldReverse,maxErrorMs:+maxError.toFixed(2),maximumRate:+maxSpeed.toFixed(3)});
 }
 let c=new PlaybackClock();c.accept({position:1000,playing:true,rate:1,revision:1},0,0);
 c.accept({position:1200,playing:true,rate:1,revision:2},500,500);assert.equal(c.read(500),1200);
 c.accept({position:1100,playing:false,rate:1,revision:3},600,600);assert.equal(c.read(5000),1100);
 c.accept({position:1100,playing:true,rate:2,revision:4},5000,5000);assert.equal(c.read(5500),2100);
 c.accept({position:70000,playing:true,rate:2,revision:5},5600,5600);assert.equal(c.read(5600),70000);
 c=new PlaybackClock();c.accept({position:10000,playing:true,rate:1,sampledAt:1000},1000,1000);c.accept({position:10100,playing:true,rate:1,sampledAt:1100},1100,3601100);assert.equal(c.read(1100),10100);
 c.reset();assert.equal(c.initialized,false);c.accept({position:3000,playing:true,rate:1,sampledAt:1000},1100,1100);assert.equal(c.read(1100),3100);
 c=new PlaybackClock();c.accept({position:10000,playing:true,rate:1},0,0);
 for(let now=250;now<=6000;now+=250)c.accept({position:10000+now+90,playing:true,rate:1},now,now);
 assert(Math.abs(c.read(6000)-16090)<9);
 c.accept({position:16000,playing:true,rate:1},6000,6000);assert(c.read(6010)>c.read(6000));
 const report={passed:true,checks:57,virtualCases:cases,seeksPauseResumeRateAndWallClock:true,phoneVerified:false};
 fs.writeFileSync(path.join(home,'Verification/revision30-clock.json'),JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));
})().catch(error=>{console.error(error);process.exitCode=1;});
