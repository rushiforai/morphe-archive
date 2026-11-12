package app.haiagaru.tests.boards;
import android.app.*;import android.content.*;import android.media.*;import android.net.Uri;import android.os.*;import android.widget.*;
import java.io.*;import java.lang.reflect.*;import java.net.*;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;

/** Production post/render cleanup and VideoView audio focus, isolated prefs and loopback media. */
public final class MediaCleanupInstrumentation extends Instrumentation {
 private ClassLoader loader;private int checks;private Activity viewer;private SharedPreferences prefs;private Map<String,?> saved;private volatile int requests;
 private void ok(boolean b,String label){if(!b)throw new AssertionError(label);checks++;}
 private Field field(Class<?> c,String n)throws Exception{Field f=c.getDeclaredField(n);f.setAccessible(true);return f;}
 private Object stat(String cls,String name,Class<?>[] types,Object...args)throws Exception{Method m=loader.loadClass("app.morphe.extension.chmate."+cls).getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(null,args);}
 private <T>T main(Callable<T> work)throws Exception{FutureTask<T> task=new FutureTask<>(work);runOnMainSync(task);return task.get(20,TimeUnit.SECONDS);}
 private void text()throws Exception{
  ok("⚓".equals(stat("ExternalEmojiPost","prepareBody",new Class<?>[]{String.class,String.class},"https://egg.5ch.io/android/","⚓\ufe0f")),"5ch outgoing post strips selector");
  ok("⚓".equals(stat("ExternalEmojiPost","prepareBody",new Class<?>[]{String.class,String.class},"https://bbs.eddibb.cc/liveedge/","⚓\ufe0f")),"external outgoing post strips selector");
  ok("⚓".equals(stat("StringReplacement","apply",new Class<?>[]{String.class},"⚓\ufe0f�")),"display selector/replacement defaults work with no TXT");
  ok("👩\u200d💻".equals(stat("StringReplacement","apply",new Class<?>[]{String.class},"👩\u200d💻")),"display retains ZWJ sequence");
  for(String url:new String[]{"https://egg.5ch.io/android/","https://bbs.eddibb.cc/liveedge/","https://jbbs.shitaraba.net/computer/45040/","https://kenmo.org/poverty/"})
   ok("前 後\n末尾 ".equals(stat("ExternalEmojiPost","prepareBody",new Class<?>[]{String.class,String.class},url,"前� 後\n末尾� ")),"outgoing replacement glyph removed without trimming spaces/newlines");
  ok("前後".equals(stat("ExternalEmojiPost","prepareBody",new Class<?>[]{String.class,String.class},"https://egg.5ch.io/android/","前&#65533;&#xFFFD;後")),"numeric replacement entities removed from outgoing body");
  ok("前 後".equals(stat("Haiagaru","prepareExternalEmojiBodyFromPostFields",new Class<?>[]{String.class,String.class,String.class,String.class,String.class,String.class,String.class,String.class,String.class},"https://egg.5ch.io/android/","name","mail","title","前� 後","x","y","z","last")),"legacy constructor-field bridge cleans only outgoing body");
  Class<?> cleanup=loader.loadClass("app.morphe.extension.chmate.EmojiTextCleanup");Field enabled=field(cleanup,"enabled");boolean before=enabled.getBoolean(null);
  try{enabled.setBoolean(null,false);ok("⚓\ufe0f".equals(stat("ExternalEmojiPost","prepareBody",new Class<?>[]{String.class,String.class},"https://egg.5ch.io/android/","⚓\ufe0f")),"OFF retains original 5ch posting");ok("⚓\ufe0f ".equals(stat("ExternalEmojiPost","prepareBody",new Class<?>[]{String.class,String.class},"https://egg.5ch.io/android/","⚓\ufe0f� ")),"replacement removal is independent of selector/display setting");}finally{enabled.setBoolean(null,before);}
  String version=getTargetContext().getPackageManager().getPackageInfo(getTargetContext().getPackageName(),0).versionName;
  if(!version.contains("191")){
   Class<?> post=loader.loadClass(version.contains("226")?"o.setBorderWidth":"jp.syoboi.a2chMate.postdata.PostData");
   Constructor<?> ctor=post.getDeclaredConstructor(String.class,String.class,String.class,String.class,String.class,String.class,long.class,long.class,String.class,String.class,String.class);ctor.setAccessible(true);
   Object original=ctor.newInstance("https://egg.5ch.io/android/","name�","mail","title�","前� ⚓\ufe0f\n後�","extra",123L,456L,"a","b","c");
   Object copy=stat("ExternalEmojiPost","prepare",new Class<?>[]{Object.class},original);ok(copy!=original,"outgoing native 5ch post is a separate copy");int changed=0;
   for(Field f:post.getDeclaredFields()){if(Modifier.isStatic(f.getModifiers())||!f.getType().isPrimitive()&&f.getType()!=String.class)continue;f.setAccessible(true);Object a=f.get(original),b=f.get(copy);if(Objects.equals(a,b))continue;ok("前� ⚓\ufe0f\n後�".equals(a)&&"前 ⚓\n後".equals(b),"only native outgoing body changes");changed++;}ok(changed==1,"native constructor retains all non-body values and editor source");
  }
 }
 private void serve(ServerSocket server,byte[] video){new Thread(()->{while(!server.isClosed())try(Socket client=server.accept()){
   requests++;BufferedReader input=new BufferedReader(new InputStreamReader(client.getInputStream(),"US-ASCII"));String first=input.readLine(),line;int start=0,end=video.length-1;boolean partial=false;
   while((line=input.readLine())!=null&&!line.isEmpty())if(line.toLowerCase(Locale.ROOT).startsWith("range: bytes=")){String[] range=line.substring(line.indexOf('=')+1).split("-",-1);start=Integer.parseInt(range[0]);if(range.length>1&&!range[1].isEmpty())end=Math.min(end,Integer.parseInt(range[1]));partial=true;}
   OutputStream out=client.getOutputStream();String header="HTTP/1.1 "+(partial?"206 Partial Content":"200 OK")+"\r\nContent-Type: video/mp4\r\nAccept-Ranges: bytes\r\nContent-Length: "+(end-start+1)+"\r\n"+(partial?"Content-Range: bytes "+start+"-"+end+"/"+video.length+"\r\n":"")+"Connection: close\r\n\r\n";out.write(header.getBytes("US-ASCII"));if(first!=null&&!first.startsWith("HEAD"))out.write(video,start,end-start+1);out.flush();
  }catch(Exception ignored){}} ,"isolated-video-fixture").start();}
 private void test()throws Exception{
  Context app=getTargetContext();loader=app.getClassLoader();text();
  prefs=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);saved=new HashMap<>(prefs.getAll());prefs.edit().putBoolean("videoAutoplay",false).commit();
  Bundle status=new Bundle();status.putString("state","waiting for foreground verification HomeActivity");sendStatus(1,status);
  boolean ready=false;for(int n=0;n<60;n++){ready=main(()->{Activity a=(Activity)stat("Haiagaru","toolbarActivity",new Class<?>[]{Object.class},new Object[]{null});return a!=null&&a.hasWindowFocus();});if(ready)break;Thread.sleep(250);}ok(ready,"foreground verification Activity");
  byte[] video;try(InputStream in=getContext().getAssets().open("report.mp4");ByteArrayOutputStream out=new ByteArrayOutputStream()){byte[] b=new byte[8192];int n;while((n=in.read(b))!=-1)out.write(b,0,n);video=out.toByteArray();}
  AtomicInteger lost=new AtomicInteger();AudioManager audio=(AudioManager)app.getSystemService(Context.AUDIO_SERVICE);AudioManager.OnAudioFocusChangeListener background=change->{if(change<0)lost.incrementAndGet();};
  ok(main(()->audio.requestAudioFocus(background,AudioManager.STREAM_MUSIC,AudioManager.AUDIOFOCUS_GAIN))==AudioManager.AUDIOFOCUS_REQUEST_GRANTED,"background-player focus granted");
  // 127.0.0.1 is reserved by the product for transformed media/gateway URLs.
  // A distinct loopback fixture exercises the normal direct-file viewer path.
  try(ServerSocket server=new ServerSocket(0,4,InetAddress.getByName("127.0.0.2"))){serve(server,video);
   Intent intent=new Intent(Intent.ACTION_VIEW,Uri.parse("http://127.0.0.2:"+server.getLocalPort()+"/report.mp4")).setClassName(app.getPackageName(),"app.morphe.extension.chmate.VideoViewerActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
   ActivityMonitor monitor=addMonitor("app.morphe.extension.chmate.VideoViewerActivity",null,false);try{main(()->{Activity a=(Activity)stat("Haiagaru","toolbarActivity",new Class<?>[]{Object.class},new Object[]{null});a.startActivity(intent);return null;});viewer=waitForMonitorWithTimeout(monitor,15000);}finally{removeMonitor(monitor);}ok(viewer!=null,"production video viewer started");
   boolean prepared=false;for(int n=0;n<100;n++){prepared=main(()->field(viewer.getClass(),"prepared").getBoolean(viewer));if(prepared)break;Thread.sleep(200);}String diagnostic=main(()->{VideoView v=(VideoView)field(viewer.getClass(),"video").get(viewer);return "requests="+requests+" size="+v.getWidth()+"x"+v.getHeight()+" shown="+v.isShown()+" attached="+v.isAttachedToWindow()+" status="+((TextView)field(viewer.getClass(),"status").get(viewer)).getText();});ok(prepared,"real local MP4 prepared; "+diagnostic);
   main(()->{AtomicInteger approved=new AtomicInteger();stat("VideoDownloads","request",new Class<?>[]{Activity.class,String.class,Runnable.class},viewer,"http://127.0.0.2/report.mp4",(Runnable)approved::incrementAndGet);stat("VideoDownloads","request",new Class<?>[]{Activity.class,String.class,Runnable.class},viewer,"http://127.0.0.2/report.gif",(Runnable)approved::incrementAndGet);ok(approved.get()==2,"explicit video/GIF save proceeds immediately without a communication confirmation dialog");return null;});
   ok(lost.get()==0,"opening/preparing autoplay-OFF video does not interrupt background focus");
   main(()->{((Button)field(viewer.getClass(),"muteButton").get(viewer)).performClick();((VideoView)field(viewer.getClass(),"video").get(viewer)).start();return null;});Thread.sleep(300);
   ok(main(()->((VideoView)field(viewer.getClass(),"video").get(viewer)).isPlaying()),"muted playback starts without focus");
   ok(lost.get()==0,"muted start does not interrupt background audio");
   main(()->{((Button)field(viewer.getClass(),"muteButton").get(viewer)).performClick();return null;});Thread.sleep(300);
   ok(lost.get()>0,"unmuting a playing video requests focus before audible playback");
   main(()->{((Button)field(viewer.getClass(),"muteButton").get(viewer)).performClick();Object focus=field(viewer.getClass(),"playbackFocus").get(viewer);ok(!field(focus.getClass(),"held").getBoolean(focus),"muting releases held focus immediately");((AudioManager.OnAudioFocusChangeListener)field(focus.getClass(),"listener").get(focus)).onAudioFocusChange(AudioManager.AUDIOFOCUS_LOSS);return null;});
   ok(main(()->((VideoView)field(viewer.getClass(),"video").get(viewer)).isPlaying()),"late focus loss does not pause muted video");
   ok(main(()->audio.requestAudioFocus(background,AudioManager.STREAM_MUSIC,AudioManager.AUDIOFOCUS_GAIN))==AudioManager.AUDIOFOCUS_REQUEST_GRANTED,"background focus can resume during muted video");
   int mutedLoss=lost.get();
   main(()->{VideoView v=(VideoView)field(viewer.getClass(),"video").get(viewer);v.pause();v.start();return null;});Thread.sleep(300);
   ok(lost.get()==mutedLoss&&main(()->((VideoView)field(viewer.getClass(),"video").get(viewer)).isPlaying()),"muted pause/resume retains background audio focus");
   main(()->{((VideoView)field(viewer.getClass(),"video").get(viewer)).pause();((Button)field(viewer.getClass(),"muteButton").get(viewer)).performClick();return null;});Thread.sleep(100);
   ok(lost.get()==mutedLoss,"unmuting while paused does not request focus");
   main(()->{VideoView v=(VideoView)field(viewer.getClass(),"video").get(viewer);ok(!v.isPlaying(),"autoplay OFF remains paused");v.start();return null;});Thread.sleep(300);
   ok(lost.get()>mutedLoss,"manual audible play requests focus");main(()->{((VideoView)field(viewer.getClass(),"video").get(viewer)).pause();return null;});
  }finally{audio.abandonAudioFocus(background);}
 }
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle result=new Bundle();try{test();result.putString("result","PASS "+checks+" production emoji/post/render/autoplay/audio-focus checks; public network/posts=0");finish(Activity.RESULT_OK,result);}catch(Throwable e){StringWriter out=new StringWriter();e.printStackTrace(new PrintWriter(out));result.putString("error",out.toString());finish(Activity.RESULT_CANCELED,result);}finally{if(viewer!=null)runOnMainSync(()->viewer.finish());if(prefs!=null){SharedPreferences.Editor edit=prefs.edit();if(saved.containsKey("videoAutoplay"))edit.putBoolean("videoAutoplay",(Boolean)saved.get("videoAutoplay"));else edit.remove("videoAutoplay");edit.commit();}}}
}
