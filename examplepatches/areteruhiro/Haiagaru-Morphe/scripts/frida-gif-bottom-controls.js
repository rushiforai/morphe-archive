// Decode a synthetic GIF into the actual controller; does not test networking.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 test package required');
 Java.classFactory.loader=app.getClassLoader();
 const G=Java.use('app.morphe.extension.chmate.GifViewerActivity'),View=Java.use('android.view.View'),Group=Java.use('android.view.ViewGroup'),Button=Java.use('android.widget.Button');
 const bytes=[71,73,70,56,57,97,1,0,1,0,128,0,0,0,0,0,255,255,255];
 [68,76].forEach(pixel=>bytes.push(33,249,4,0,10,0,0,0,44,0,0,0,0,1,0,1,0,0,2,2,pixel,1,0));bytes.push(59);
 const movie=Java.retain(Java.use('android.graphics.Movie').decodeByteArray(Java.array('byte',bytes.map(n=>n>127?n-256:n)),0,bytes.length));
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 G.load.implementation=function(){const canvas=Java.cast(field(this,'image'),Java.use('app.morphe.extension.chmate.GifViewerActivity$GifCanvas'));canvas.setMovie(movie);canvas.setPlaying(true);Java.cast(field(this,'play'),Button).setEnabled(true);Java.cast(field(this,'status'),View).setVisibility(8);};
 let checks=0;function check(ok,name){if(!ok)throw Error(name);checks++;console.log('PASS '+name);}
 Java.scheduleOnMainThread(()=>{const i=Java.use('android.content.Intent').$new();i.setClassName(app,'app.morphe.extension.chmate.GifViewerActivity');i.setData(Java.use('android.net.Uri').parse('https://haiagaru.invalid/controls.gif'));i.addFlags(0x10000000);app.startActivity(i);});
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
  const activity=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);check(activity&&String(activity.getClass().getName()).endsWith('.GifViewerActivity'),'GIF screen foreground');
  const image=Java.cast(field(activity,'image'),View),play=Java.cast(field(activity,'play'),Button),status=Java.cast(field(activity,'status'),View);
  const root=Java.cast(image.getParent(),Group),toolbar=Java.cast(play.getParent(),Group),more=Java.cast(toolbar.getChildAt(2),Button);
  check(movie.duration()===200&&play.isEnabled(),'animated fixture decoded');
  check(root.indexOfChild(toolbar)>root.indexOfChild(image),'controller below image');
  check(toolbar.getChildCount()===3,'only title, play and overflow');check(status.getVisibility()===8,'empty status occupies no space');
  check(more.getWindowToken()!==null,'overflow anchor attached');
  const density=activity.getResources().getDisplayMetrics().density.value;
  check(more.getHeight()>=Math.round(48*density),'density-aware touch target');
  play.performClick();check(String(play.getText())==='再生','pause toggles label');play.performClick();check(String(play.getText())==='一時停止','resume toggles label');
  more.performClick();console.log('GIF_BOTTOM_CONTROLS_READY checks='+checks+' menu open for screenshot');
 }catch(e){console.log('FAIL '+e.stack);}})),4500);
 setTimeout(()=>Java.perform(()=>{G.load.implementation=null;console.log('GIF_FIXTURE_HOOK_REMOVED');}),20000);
});
