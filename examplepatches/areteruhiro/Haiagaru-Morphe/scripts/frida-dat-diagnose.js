setTimeout(()=>Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),D=Java.use('app.morphe.extension.chmate.DroppedThreadStatus');
 const url='https://greta.5ch.io/test/read.cgi/poverty/1792155688/';
 const T=Java.use('app.morphe.extension.chmate.DroppedThreadRules');
 const t=T.thread(url);console.log('thread='+t+' key='+(t===null?'null':t.key.value));
 const p=app.getSharedPreferences('haiagaru-confirmed-dropped-threads',0),key='poverty/1792155688',had=p.contains(key),old=p.getLong(key,0);
 const now=Date.now();console.log('js='+now+' android='+Java.use('java.lang.System').currentTimeMillis());
 try{
  p.edit().putLong(key,now+3600000).commit();console.log('stored='+p.getLong(key,0));
  D.droppedUrl(url);D.results.value.clear();
  console.log('drop='+D.droppedUrl(url));
  const text='<div class="stoplight stopdone">このスレッドは過去ログ倉庫に格納されています</div><div class="post">1</div>';
  console.log('parse archive='+T.archived(text));
 }finally{const e=p.edit();if(had)e.putLong(key,old);else e.remove(key);e.commit();D.results.value.clear();}
}),1000);
