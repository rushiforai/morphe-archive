// Public X GIF only; isolated 242 package. Preferences restored after UI verification.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification only');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
 const had=prefs.contains('videoDoubleTapSeconds'),old=prefs.getInt('videoDoubleTapSeconds',10);
 prefs.edit().putInt('videoDoubleTapSeconds',30).commit();
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 function method(o,n,args,types){const m=o.getClass().getDeclaredMethod(n,Java.array('java.lang.Class',types||[]));m.setAccessible(true);return m.invoke(o,Java.array('java.lang.Object',args||[]));}
 Java.scheduleOnMainThread(function(){
  const i=Java.use('android.content.Intent').$new();i.setClassName(app,'app.morphe.extension.chmate.VideoViewerActivity');
  i.setData(Java.use('android.net.Uri').parse('https://video.twimg.com/tweet_video/G51IpxIXsAAZGU0.mp4'));i.addFlags(0x10000000);app.startActivity(i);
 });
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(function(){
  try{
   const activity=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
   if(!activity||String(activity.getClass().getName())!=='app.morphe.extension.chmate.VideoViewerActivity')throw Error('Player not foreground');
   const fallback=field(activity,'gifFallback');if(!fallback)throw Error('GIF fallback not active');
   const controller=Java.cast(field(activity,'controls'),Java.use('app.morphe.extension.chmate.HaiagaruMediaController'));
   const base=Java.use('app.morphe.extension.chmate.HaiagaruMediaController');
   const pf=base.class.getDeclaredField('player');pf.setAccessible(true);
   const player=Java.cast(pf.get(controller),Java.use('android.widget.MediaController$MediaPlayerControl'));
   if(player.getDuration()<=0)throw Error('Control bridge duration invalid');
   player.pause();if(player.isPlaying())throw Error('Pause did not reach GIF player');console.log('PASS GIF controller pause and valid duration='+player.getDuration());
   player.seekTo(1000);player.start();console.log('PASS GIF controller seek/play');
   let target=-1;
   const Fake=Java.registerClass({name:'app.morphe.extension.chmate.TestSeekControl20261022',implements:[Java.use('android.widget.MediaController$MediaPlayerControl')],methods:{start(){},pause(){},getDuration(){return 120000;},getCurrentPosition(){return 45000;},seekTo:[{returnType:'void',argumentTypes:['int'],implementation:function(n){target=n;}}],isPlaying(){return false;},getBufferPercentage(){return 100;},canPause(){return true;},canSeekBackward(){return true;},canSeekForward(){return true;},getAudioSessionId(){return 0;}}});
   const fake=Fake.$new();
   const independent=base.$new(activity);independent.setMediaPlayer(fake);
   const seek=base.class.getDeclaredMethod('seek',Java.array('java.lang.Class',[Java.use('java.lang.Integer').TYPE.value]));seek.setAccessible(true);
   seek.invoke(independent,Java.array('java.lang.Object',[Java.use('java.lang.Integer').valueOf(30)]));if(target!==75000)throw Error('Forward target '+target);
   seek.invoke(independent,Java.array('java.lang.Object',[Java.use('java.lang.Integer').valueOf(-60)]));if(target!==0)throw Error('Backward clamp '+target);console.log('PASS live-position seek and bounds');
   const toolbar=Java.cast(field(activity,'toolbar'),Java.use('android.view.View'));
   const anchor=Java.cast(field(activity,'video'),Java.use('android.view.View'));
   method(activity,'showMenu',[anchor],[Java.use('android.view.View').class]);
   console.log('PASS GIF overflow opens; dismiss with BACK to inspect 30-second controls');
  }catch(e){console.log('FAIL '+e.stack);}
 })),45000);
 setTimeout(()=>Java.perform(function(){const e=prefs.edit();if(had)e.putInt('videoDoubleTapSeconds',old);else e.remove('videoDoubleTapSeconds');e.commit();console.log('SKIP_PREFERENCE_RESTORED');}),85000);
});
