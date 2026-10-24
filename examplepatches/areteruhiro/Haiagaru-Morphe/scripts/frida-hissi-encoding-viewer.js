// One live Hissi page in the actual viewer. Restore checker selection and close test screen.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.settingsfix191')throw Error('191 verification only');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='hissiCheckerMode',had=p.contains(key),old=p.getInt(key,0);
 let host=null,web=null,done=false;
 function field(o,k){const f=o.getClass().getDeclaredField(k);f.setAccessible(true);return f.get(o);}
 function cleanup(){if(done)return;done=true;const e=p.edit();if(had)e.putInt(key,old);else e.remove(key);e.commit();if(host)host.finish();console.log('CHECKER_PREFERENCE_RESTORED');}
 Java.scheduleOnMainThread(function(){p.edit().putInt(key,1).commit();
  const intent=Java.use('android.content.Intent').$new(app,Java.use('app.morphe.extension.chmate.HissiMenuActivity').class);
  intent.setData(Java.use('android.net.Uri').parse('http://hissi.org/read.php/android/'));intent.addFlags(0x10000000);app.startActivity(intent);
 });
 const Callback=Java.registerClass({name:'org.haiagaru.test.HissiEncodingCallback',implements:[Java.use('android.webkit.ValueCallback')],methods:{onReceiveValue:function(value){
  try{const data=JSON.parse(JSON.parse(String(value)));console.log('HISSI_WEBVIEW='+JSON.stringify(data));
   if(!/utf-8/i.test(data.encoding)||!data.title.includes('必死チェッカーもどき')||!data.text.includes('トップページ'))throw Error('Hissi Japanese DOM/charset mismatch');
   console.log('PASS actual viewer DOM Japanese title/body decoded before WebView');
  }catch(e){console.log('FAIL '+e.stack);}finally{cleanup();}
 }}});
 let attempts=0;
 const timer=setInterval(()=>Java.perform(()=>Java.scheduleOnMainThread(function(){if(done){clearInterval(timer);return;}try{
  if(!host)Java.choose('app.morphe.extension.chmate.HissiMenuActivity',{onMatch:a=>{if(!a.isFinishing())host=Java.retain(a);},onComplete(){}});
  if(host&&!web){const c=field(host,'controller');if(c){const w=field(c,'viewerWebView');if(w)web=Java.retain(Java.cast(w,Java.use('android.webkit.WebView')));}}
  if(web&&String(web.getUrl()).startsWith('http://hissi.org/read.php/android/')&&web.getProgress()===100){clearInterval(timer);web.evaluateJavascript('JSON.stringify({encoding:document.characterSet,title:document.title,text:document.body.innerText.slice(0,4000)})',Callback.$new());return;}
  if(++attempts>=25){clearInterval(timer);throw Error('Viewer timed out');}
 }catch(e){console.log('FAIL '+e.stack);cleanup();}})),1000);
});
