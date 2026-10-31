// Decode the user's exact sample through Android MediaPlayer, without launching a URL intent.
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const Player=Java.use('android.media.MediaPlayer'),State=Java.use('app.morphe.extension.chmate.VideoSeekState');
 const player=Player.$new(),state=State.$new();let stage=0,legacy,finished=false;const checks=[];
 function end(error){if(finished)return;finished=true;try{player.release();}finally{if(error)reject(Error(String(error)));else resolve({checks,legacyFiveSecondPosition:legacy});}}
 function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 const prepared=Java.registerClass({name:'app.haiagaru.audit.Prepared'+Date.now(),implements:[Java.use('android.media.MediaPlayer$OnPreparedListener')],methods:{onPrepared(p){try{
  check(player.getDuration()>20000,'reported sample decoded');player.seekTo.overload('int').call(player,5000);
 }catch(e){end(e);}}}});
 const complete=Java.registerClass({name:'app.haiagaru.audit.Seek'+Date.now(),implements:[Java.use('android.media.MediaPlayer$OnSeekCompleteListener')],methods:{onSeekComplete(p){try{
  if(stage===0){legacy=player.getCurrentPosition();stage=1;player.seekTo.overload('long','int').call(player,5000,3);return;}
  if(stage===1){check(Math.abs(player.getCurrentPosition()-5000)<150,'precise five-second seek');stage=2;const first=state.request(10000);state.request(15000);state.request(20000);player.seekTo.overload('long','int').call(player,first,3);return;}
  const next=state.completed();if(next>=0){player.seekTo.overload('long','int').call(player,next,3);return;}
  check(Math.abs(player.getCurrentPosition()-20000)<150,'repeated seeks accumulate to requested time');end();
 }catch(e){end(e);}}}});
 const error=Java.registerClass({name:'app.haiagaru.audit.Error'+Date.now(),implements:[Java.use('android.media.MediaPlayer$OnErrorListener')],methods:{onError(p,what,extra){end('MediaPlayer '+what+'/'+extra);return true;}}});
 try{player.setOnPreparedListener(prepared.$new());player.setOnSeekCompleteListener(complete.$new());player.setOnErrorListener(error.$new());player.setDataSource.overload('java.lang.String').call(player,'http://127.0.0.1:18763/report.mp4');player.prepareAsync();}catch(e){end(e);}
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>end('seek test timeout'))),30000);
})));}};
