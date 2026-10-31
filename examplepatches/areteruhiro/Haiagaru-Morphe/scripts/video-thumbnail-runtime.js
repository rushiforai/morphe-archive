rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication(),T=Java.use('app.morphe.extension.chmate.VideoFrameThumbnail'),X=Java.use('app.morphe.extension.chmate.XMediaAttachments'),p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),keys=['videoFrameThumbnailsEnabled','videoPreviewFour','urlVideoFetchMode'],saved={};
 for(const key of keys)saved[key]={has:p.contains(key),value:key==='urlVideoFetchMode'?p.getInt(key,1):p.getBoolean(key,key==='videoFrameThumbnailsEnabled')};
 const checks=[];let attempts,failedKey,variant,finished=false;
 function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
 function end(error){if(finished)return;finished=true;T.connection.implementation=null;const e=p.edit();for(const key of keys){const old=saved[key];if(!old.has)e.remove(key);else if(key==='urlVideoFetchMode')e.putInt(key,old.value);else e.putBoolean(key,old.value);}e.commit();if(attempts&&failedKey)attempts.remove(Java.use('java.lang.String').$new(failedKey));if(error)reject(Error(String(error.stack||error)));else resolve({checks});}
 function later(action,ms=500){setTimeout(()=>Java.perform(()=>{try{action();}catch(e){end(e);}}),ms);}
 try{
  p.edit().putBoolean('videoFrameThumbnailsEnabled',true).putBoolean('videoPreviewFour',false).putInt('urlVideoFetchMode',1).commit();variant=String(T.currentVariant());const f=T.class.getDeclaredField('ATTEMPTED');f.setAccessible(true);const gate=f.get(null),history=gate.getClass().getDeclaredField('attempts');history.setAccessible(true);attempts=Java.cast(history.get(gate),Java.use('java.util.Map'));
  const failed='https://i.imgur.com/missing'+Date.now()+'.mp4';failedKey=variant+':'+failed;
  const connection=T.connection.overload('android.content.Context','java.lang.String','boolean');
  connection.implementation=function(context,url,four){const value=String(url);if(value!==failed&&value!=='https://i.imgur.com/EivpeMG.mp4')return connection.call(this,context,url,four);return Java.cast(Java.use('java.net.URL').$new(value===failed?'http://127.0.0.1:18763/missing.mp4':'http://127.0.0.1:18763/report.mp4').openConnection(),Java.use('java.net.HttpURLConnection'));};
  T.request(failed);
  later(()=>{const key=Java.use('java.lang.String').$new(failedKey);check(attempts.containsKey(key),'failed thumbnail attempt retained for cooldown');const before=String(attempts.get(key));T.request(failed);check(String(attempts.get(key))===before,'cooldown suppresses duplicate downloads');const expired=Java.use('android.os.SystemClock').elapsedRealtime()-61000;attempts.put(key,Java.use('app.morphe.extension.chmate.MediaAttemptGate$Attempt').$new(false,expired));T.request(failed);const attempt=attempts.get(key),time=attempt.getClass().getDeclaredField('time');time.setAccessible(true);check(time.getLong(attempt)>expired,'failed thumbnail retried after cooldown');
   const url='https://i.imgur.com/EivpeMG.mp4';T.request(url);const deadline=Date.now()+25000;
   function poll(){if(X.hasFramePoster(url,variant)){check(true,'reported MP4 thumbnail decoded and published');end();}else if(Date.now()>deadline)end(Error('thumbnail decoder timeout'));else later(poll);}
   later(poll);
  });
 }catch(e){end(e);}
}));}};
