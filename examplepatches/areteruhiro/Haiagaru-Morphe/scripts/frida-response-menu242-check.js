// Read-only native menu verification: no hooks, archive writes, or network requests.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.responsearchive242')throw Error('Wrong package');
 let found=0;
 Java.choose('jp.syoboi.a2chMate.fragment.ResMenuDialogFragment',{
  onMatch:function(d){const held=Java.retain(d);Java.scheduleOnMainThread(function(){
   if(!held.isAdded())return;
   const m=Java.cast(held.g(),Java.use('android.view.Menu'));
   const save=m.findItem(0x7e484a01),browse=m.findItem(0x7e484a03),highlight=m.findItem(0x7e484b01);
   if(save===null||browse===null)throw Error('Missing ordinary menu actions');
   if(String(save.getTitle())!=='レスを保存')throw Error('Save label clipped');
   if(String(browse.getTitle())!=='保存済みレスを見る')throw Error('Browse label changed');
   if(highlight!==null&&String(highlight.getTitle())!=='投稿者を強調')throw Error('Highlight label clipped');
   const data=Java.use('org.json.JSONObject').$new(save.getIntent().getStringExtra('haiagaru.response.archive'));
   if(data.getInt('number')<=0)throw Error('Missing selected response');
   found++;console.log('PASS native242 menu labels, unique actions and selected response '+data.getInt('number'));
  });},onComplete:function(){console.log('READ_ONLY_CHECK_SCHEDULED');}
 });
});
