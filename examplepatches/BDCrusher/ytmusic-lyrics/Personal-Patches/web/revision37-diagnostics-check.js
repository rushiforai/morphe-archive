async page=>{
 await page.route('**/diagnostics-fixture.js',r=>r.fulfill({path:"C:/Morphe/App's/YT-Music/Personal-Patches/web/src/render-diagnostics.js",contentType:'application/javascript'}));
 const result=await page.evaluate(async()=>{
  const {RenderDiagnostics}=await import('/diagnostics-fixture.js');let checks=0;const assert=(b,m)=>{checks++;if(!b)throw Error(m);};const logs=[];const d=new RenderDiagnostics((...e)=>logs.push(e));d.lines([{time:0},{time:2},{time:4}]);
  for(let n=1;n<=120;n++)d.sample(n*41.6667,n/24,0.8,true);assert(logs.length===0,'debug disabled must remain silent');
  d.enable(true);for(let n=1;n<=120;n++)d.sample(n*41.6667,n/24,0.8,true);
  const cadence=logs.filter(e=>e[0]==='Renderer-cadence');assert(cadence.length===2,'cadence summaries are bounded to two seconds');assert(cadence.every(e=>e[1].includes('estimatedFps=24.0')),'24fps callback cadence recognized');assert(cadence.every(e=>e[1].includes('not a dropped-frame count')),'cadence distinguished from Android deadlines');assert(!logs.some(e=>/stall/i.test(e[0])),'stable24Hz is not false stall spam');assert(logs.filter(e=>e[0]==='Line-transition').length===3,'line boundary markers present');
  d.pause();d.sample(20000,6,0.6,true);assert(d.gapMax===0,'hidden/pause gap excluded');d.sample(20041.7,6.04,1.4,true);assert(d.gapMax<42,'resumed cadence local');d.enable(false);const count=logs.length;d.sample(30000,8,2,true);assert(logs.length===count,'switch off stops samples');d.enable(true);d.sample(50000,9,1,true);assert(d.gapMax===0,'debug restart excludes inactive interval');
  return {passed:true,checks,cadence,normalDebugBridge:typeof BDC.debug==='function',phoneVerified:false};
 });await page.unroute('**/diagnostics-fixture.js');return result;
}
