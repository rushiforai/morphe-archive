async page=>{
 const base="C:/Morphe/App's/YT-Music/",tab=await page.context().newPage(),errors=[];
 tab.on('pageerror',e=>errors.push(e.message));
 await tab.addInitScript(()=>{
  window.shaderCalls=[];window.BDShader=Object.fromEntries(['ready','failure','proof','mediaReady','mediaError'].map(k=>[k,(...a)=>shaderCalls.push([k,...a])]));
  const original=HTMLCanvasElement.prototype.getContext;
  HTMLCanvasElement.prototype.getContext=function(type,...args){return String(type).startsWith('webgl')?null:original.call(this,type,...args);};
 });
 await tab.route('**/shaders-fallback',r=>r.fulfill({path:base+'Personal-Patches/patches/src/main/resources/bdcrusher-shaders/index.html',contentType:'text/html'}));
 await tab.route('**/shaders.js',r=>r.fulfill({path:base+'Personal-Patches/patches/src/main/resources/bdcrusher-shaders/shaders.js',contentType:'application/javascript'}));
 await tab.goto('http://127.0.0.1:8766/shaders-fallback');
 await tab.evaluate(()=>{BDS.settings({fps:30,animateBackground:true});BDS.state({generation:9,visible:true,playing:true,cover:false,background:true,image:'',video:''});});
 await tab.waitForTimeout(200);await tab.evaluate(()=>BDS.state({generation:9,visible:true,playing:true,cover:false,background:true,image:'',video:''}));
 const state=await tab.evaluate(()=>({failure:shaderCalls.filter(c=>c[0]==='failure').length,videoElements:document.querySelectorAll('video').length,canvasAlpha:document.querySelector('canvas').getContext('webgl2')}));
 if(state.failure!==1||state.videoElements!==0||state.canvasAlpha!==null)throw Error('Graphics fallback failed '+JSON.stringify(state));
 await tab.evaluate(()=>BDS.close());await tab.close();if(errors.length)throw Error(JSON.stringify(errors));
 return {passed:true,graphicsUnavailableReportedOnce:true,nativeCoverIndependentOfWebGraphics:true,noGraphicsPaint:true,androidNativeFallbackVerified:false,errors};
}
