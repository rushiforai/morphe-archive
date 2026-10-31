/* Android background host for Shaders 1.5.1; GPL-3.0. Kawarp/ALTCHA notices apply. */
import Kawarp from '@kawarp/core';
import {solveChallenge} from 'altcha-lib';
import {deriveKey} from 'altcha-lib/algorithms/web/pbkdf2';
const native=window.BDShader,canvas=document.querySelector('canvas');
let engine,config={},state={},generation=-1,lastImage='',lastPaint=0,imageEpoch=0,closed=false,graphicsFailed=false;
function fail(error){native?.failure(String(error?.message||error).slice(0,160));}
function create(){
 if(engine||closed||graphicsFailed||!state.background||!state.image)return;
 engine=new Kawarp(canvas,{warpIntensity:1,blurPasses:8,animationSpeed:1,transitionDuration:1000,saturation:1.5,dithering:.008});
 const render=engine.renderLoop;
 if(typeof render!=='function')throw new Error('Pinned Kawarp scheduling contract missing');
 engine.renderLoop=timestamp=>{if(!engine.isPlaying)return;const interval=1000/(config.fps||30),delta=timestamp-lastPaint;if(delta>=interval){lastPaint=timestamp-(delta%interval);render(timestamp);}else engine.animationId=requestAnimationFrame(engine.renderLoop);};
}
function visibility(){
 if(!engine)return;
 const motion=state.visible&&state.playing&&config.animateBackground&&!config.reducedMotion&&!document.hidden;
 engine.animationSpeed=motion?(config.speed??1):0;
 if(state.background&&motion)engine.start();else{engine.stop();engine.renderFrame();}
}
function update(){
 try{
  canvas.hidden=!state.background||!state.image;canvas.style.opacity=String(Math.max(0,Math.min(1,config.opacity??.75)));canvas.style.filter=`brightness(${1-(config.dimming??.3)})`;
  try{create();}catch(error){graphicsFailed=true;fail(error);}
  engine?.setOptions({warpIntensity:config.strength??1,saturation:config.saturation??1.5,transitionDuration:state.frame?250:(config.transition??1000),animationSpeed:config.animateBackground?(config.speed??1):0,blurPasses:8,dithering:.008});
  if(engine&&state.image&&state.image!==lastImage){const epoch=++imageEpoch;lastImage=state.image;if(!state.frame)canvas.style.visibility='hidden';const img=new Image();img.onload=()=>{if(closed||epoch!==imageEpoch)return;try{engine.loadImageElement(img);canvas.style.visibility='visible';visibility();}catch(e){fail(e);}};img.onerror=()=>{if(epoch===imageEpoch){lastImage='';fail(new Error('Artwork image unavailable; native background retained'));}};img.src=state.image;}
  visibility();
 }catch(error){fail(error);}
}
canvas.addEventListener('webglcontextlost',event=>{event.preventDefault();engine?.stop();native?.failure('Graphics context lost; native artwork retained');});
canvas.addEventListener('webglcontextrestored',()=>{engine?.dispose();engine=undefined;graphicsFailed=false;lastImage='';update();});
document.addEventListener('visibilitychange',visibility);
const sizeObserver=new ResizeObserver(entries=>{for(const entry of entries){const rect=entry.contentRect;if(rect.width<=0||rect.height<=0)continue;const scale=Math.min(1,960/Math.max(rect.width,rect.height)),width=Math.max(1,Math.round(rect.width*scale)),height=Math.max(1,Math.round(rect.height*scale));if(canvas.width!==width||canvas.height!==height){canvas.width=width;canvas.height=height;engine?.resize();engine?.renderFrame();}}});sizeObserver.observe(canvas);
window.BDS={
 settings(next){config=next;update();},
 state(next){if(next.generation!==generation){generation=next.generation;lastImage='';imageEpoch++;canvas.style.visibility='hidden';}state=next;update();},
 async solve(id,challenge){try{const solution=await solveChallenge({challenge,deriveKey,timeout:60000});native?.proof(id,solution?JSON.stringify(solution):'');}catch{native?.proof(id,'');}},
 close(){closed=true;sizeObserver.disconnect();engine?.dispose();engine=undefined;}
};
native?.ready();
