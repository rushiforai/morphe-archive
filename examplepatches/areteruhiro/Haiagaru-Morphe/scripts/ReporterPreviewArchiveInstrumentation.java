package app.haiagaru.tests.regression;

import android.app.*;import android.content.*;import android.graphics.*;import android.os.*;import android.view.*;import android.widget.*;
import java.io.*;import java.lang.reflect.*;import java.net.*;import java.util.*;import java.util.concurrent.*;

/** Isolated metadata file, two generated images and archive fixtures; no public requests/posts. */
public final class ReporterPreviewArchiveInstrumentation extends Instrumentation {
 private Context app;private ClassLoader loader;private int checks;private Activity viewer;private ActivityMonitor monitor;
 private ServerSocket server;private int previousThumbnailPort;private Class<?> policy;private SharedPreferences temp;
 private Class<?> history;private Field cache,writes;private Object oldCache,oldWrites;private String tempName;
 private SharedPreferences config;private final Map<String,Boolean> previous=new HashMap<>();
 private SharedPreferences nativePrefs;private boolean hadBack;private int oldBack;
 private void configuration(){config=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);SharedPreferences.Editor edit=config.edit();for(String key:new String[]{"edgeReporterId","videoViewerEnabled","mediaSwipeNavigation"}){previous.put(key,config.contains(key)?config.getBoolean(key,true):null);edit.putBoolean(key,true);}edit.commit();}
 private final List<Socket> sockets=Collections.synchronizedList(new ArrayList<>());
 private void ok(boolean value,String text){checks++;if(!value)throw new AssertionError(text);}
 private Method method(Class<?> type,String name,Class<?>...args)throws Exception{Method m=type.getDeclaredMethod(name,args);m.setAccessible(true);return m;}
 private Field field(Class<?> type,String name)throws Exception{Field f=type.getDeclaredField(name);f.setAccessible(true);return f;}
 private void metadata()throws Exception{
  history=loader.loadClass("app.morphe.extension.chmate.EdgeReporterHistory");cache=field(history,"cache");writes=field(history,"writes");oldCache=cache.get(null);oldWrites=writes.get(null);
  tempName="haiagaru.tests.reporter-memory."+System.nanoTime();temp=app.getSharedPreferences(tempName,0);temp.edit().putString("1234567890","[old★]").commit();cache.set(null,temp);writes.set(null,null);
  Method title=method(history,"historyTitle",long.class,Object.class,String.class),resolve=method(history,"resolveTitle",Object.class,String.class);
  String board="bbs.eddibb.cc%2Fliveedge",plain="履歴テスト",full=plain+" [old★]";
  ok(full.equals(title.invoke(null,1234567890L,board,plain)),"legacy metadata restores without a direct preference write");
  ExecutorService readers=Executors.newFixedThreadPool(6);List<Future<?>> tasks=new ArrayList<>();
  for(int t=0;t<6;t++)tasks.add(readers.submit(()->{try{for(int n=0;n<2000&&!Thread.currentThread().isInterrupted();n++){Object actual=title.invoke(null,1234567890L,board,n%2==0?plain:full);if(!full.equals(actual))throw new AssertionError("history mismatch: "+actual+" cache="+(cache.get(null)==temp)+" config="+config.getBoolean("edgeReporterId",false));}}catch(Exception e){throw new RuntimeException(e);}}));
  try{for(Future<?> task:tasks)task.get(30,TimeUnit.SECONDS);}finally{readers.shutdownNow();readers.awaitTermination(10,TimeUnit.SECONDS);}ok(true,"12000 parallel history reads preserve metadata");
  String alias=(String)method(history,"titleKey",String.class).invoke(null,plain);for(int n=0;n<100&&!"[old★]".equals(temp.getString(alias,null));n++)Thread.sleep(20);
  ok("[old★]".equals(temp.getString(alias,null)),"new title alias is eventually persisted");ok(full.equals(resolve.invoke(null,board,plain)),"NG menu resolves queued/persisted alias");
  ok("履歴テスト".equals(title.invoke(null,1234567890L,"other",plain)),"unrelated boards stay unchanged");
  String kenmo="kenmo.org%2Fpoverty";String kenmoTitle=plain+" [KenmoFixture★]";
  ok(kenmoTitle.equals(title.invoke(null,1234567890L,kenmo,kenmoTitle)),"kenmo reporter metadata acquired");
  ok(kenmoTitle.equals(title.invoke(null,1234567890L,kenmo,plain)),"plain DAT title restores kenmo reporter");
  ok(kenmoTitle.equals(resolve.invoke(null,kenmo,plain)),"kenmo NG menu restores reporter metadata");
  ok(full.equals(title.invoke(null,1234567890L,board,plain)),"same numeric thread remains isolated from Edge");
  ok(plain.equals(title.invoke(null,1234567890L,"kenmo.org%2Foperate",plain)),"same numeric thread remains isolated across kenmo boards");
 }
 private void archive()throws Exception{
  Class<?> importer=loader.loadClass("app.morphe.extension.chmate.ArchivedThreadImporter"),info=loader.loadClass(importer.getName()+"$ThreadInfo");
  Object target=method(info,"parse",String.class).invoke(null,"https://egg.5ch.io/test/read.cgi/android/1781461086/");ok(target!=null,"original dropped-thread URL parsed");
  String text="𝕏の設定画面 😀 ☺️ 🧑‍💻 𠮷";
  String html="<h1 id=\"threadtitle\">題名𝕏</h1><div id=\"1\" class=\"post\"><span class=\"postusername\"><b>名前&#120143;</b></span><span class=\"date\">2026/06/15</span><span class=\"uid\">ID:test</span></details><section class=\"post-content\">"+text+"<br>二行目</section></div>";
  byte[] raw=(byte[])method(importer,"convertKakoHtml",info,String.class).invoke(null,target,html);String dat=new String(raw,"MS932");
  ok(dat.contains("&#120143;の設定画面"),"kako conversion preserves X code point as a DAT entity");ok(dat.contains("&#128512;")&&dat.contains("&#65039;")&&dat.contains("&#8205;"),"kako conversion preserves emoji/variation/joiner");
  ok(dat.contains("<br>二行目"),"archive line breaks preserved");ok(!dat.contains("�"),"archive conversion introduces no replacement character");
  String json="{\"thread\":[0,0,0,0,0,\"題名𝕏\"],\"comments\":[[1,\"名前\",\"\",\"2026/06/15\",\"test\",\"\",\""+text+"\"]]}";
  String itest=new String((byte[])method(importer,"convertItestJson",String.class).invoke(null,json),"MS932");ok(itest.contains("&#120143;の設定画面")&&itest.contains("&#128512;"),"itest archive preserves Unicode too");
  ok(android.text.Html.fromHtml("&#120143;").toString().equals("𝕏"),"Android decodes generated DAT entity losslessly");
  try(InputStream input=getContext().getAssets().open("reported-archive-thread.raw")){
   ByteArrayOutputStream source=new ByteArrayOutputStream();byte[] buffer=new byte[4096];int n;while((n=input.read(buffer))!=-1)source.write(buffer,0,n);
   Class<?> route=loader.loadClass(importer.getName()+"$RouteFormat");Object kako=Enum.valueOf((Class)route,"KAKO");
   byte[] converted=(byte[])method(importer,"convertRouteResponse",route,info,byte[].class).invoke(null,kako,target,source.toByteArray());
   ok(new String(converted,"MS932").contains("&#120143;"),"reported real post retains its X entity through archive conversion");
  }catch(FileNotFoundException absent){/* Optional captured public page; synthetic fixtures always run. */}
 }
 private byte[] png(int width,int height,int color,String label)throws Exception{
  Bitmap bitmap=Bitmap.createBitmap(width,height,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(bitmap);canvas.drawColor(color);Paint paint=new Paint();paint.setColor(Color.WHITE);paint.setTextSize(72);canvas.drawText(label,80,height/2,paint);ByteArrayOutputStream out=new ByteArrayOutputStream();bitmap.compress(Bitmap.CompressFormat.PNG,100,out);bitmap.recycle();return out.toByteArray();
 }
 private void images()throws Exception{
  nativePrefs=android.preference.PreferenceManager.getDefaultSharedPreferences(app);hadBack=nativePrefs.contains("gestureBack");oldBack=nativePrefs.getInt("gestureBack",0);nativePrefs.edit().putInt("gestureBack",0).commit();
  byte[][] images={png(1074,426,Color.BLUE,"FIRST"),png(1079,496,Color.RED,"SECOND")};server=new ServerSocket();server.bind(new InetSocketAddress("127.0.0.1",0));
  Thread serving=new Thread(()->{while(!server.isClosed())try{Socket socket=server.accept();sockets.add(socket);new Thread(()->{try(Socket client=socket){client.setSoTimeout(5000);BufferedReader reader=new BufferedReader(new InputStreamReader(client.getInputStream(),"ISO-8859-1"));String first=reader.readLine(),line;while((line=reader.readLine())!=null&&!line.isEmpty()){}byte[] image=images[first!=null&&first.contains("second.png")?1:0];OutputStream out=client.getOutputStream();out.write(("HTTP/1.1 200 OK\r\nContent-Type: image/png\r\nContent-Length: "+image.length+"\r\nConnection: close\r\n\r\n").getBytes("US-ASCII"));out.write(image);}catch(Exception ignored){}finally{sockets.remove(socket);}},"Fixture-image").start();}catch(IOException closed){break;}},"Fixture-listener");serving.setDaemon(true);serving.start();
  policy=loader.loadClass("app.morphe.extension.chmate.HttpsTransport");previousThumbnailPort=field(policy,"thumbnailServerPort").getInt(null);method(policy,"registerThumbnailServerPort",int.class).invoke(null,server.getLocalPort());
  monitor=addMonitor("jp.syoboi.a2chMate.activity.ImagesViewer2Activity",null,false);
  ArrayList<String> links=new ArrayList<>(Arrays.asList("http://127.0.0.1:"+server.getLocalPort()+"/first.png","http://127.0.0.1:"+server.getLocalPort()+"/second.png"));
  viewer=startActivitySync(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.ImagesViewer2Activity").putStringArrayListExtra("links",links).putExtra("index",0).putExtra("forwardTabletHome",false).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
  ok(viewer!=null,"native uploaded-image preview opens");waitPage("1/2");
  boolean modern;try{loader.loadClass("jp.syoboi.a2chMate.activity.ImagesViewerViewModel");modern=true;}catch(ClassNotFoundException legacy){modern=false;}
  for(int n=0;n<3;n++){page(false,"2/2",modern);page(true,"1/2",modern);}
  ok(monitor.getHits()==(modern?1:7),modern?"paging never restarts the native preview Activity":"legacy gallery routing remains available in both directions");
 }
 private void page(boolean right,String wanted,boolean modern)throws Exception{Activity before=viewer;swipe(right);if(!modern){for(int n=0;n<60;n++){Activity last=monitor.getLastActivity();if(last!=null&&last!=before){viewer=last;break;}Thread.sleep(100);}ok(viewer!=before,"legacy gallery opened destination");}waitPage(wanted);ok(!viewer.isFinishing()&&!viewer.isDestroyed(),"destination remains active");if(modern)ok(viewer==before,"modern native pager keeps same Activity");}
 private boolean text(View root,String wanted){if(root instanceof TextView&&wanted.equals(((TextView)root).getText().toString().replaceAll("\\s+","")))return true;if(root instanceof android.view.ViewGroup){android.view.ViewGroup group=(android.view.ViewGroup)root;for(int i=0;i<group.getChildCount();i++)if(text(group.getChildAt(i),wanted))return true;}return false;}
 private void waitPage(String page)throws Exception{for(int n=0;n<60;n++){FutureTask<Boolean> visible=new FutureTask<>(()->text(viewer.getWindow().getDecorView(),page));runOnMainSync(visible);if(visible.get(5,TimeUnit.SECONDS)){ok(true,"native preview page "+page);Thread.sleep(300);return;}Thread.sleep(100);}throw new AssertionError("native preview did not show "+page);}
 private void swipe(boolean right)throws Exception{
  FutureTask<int[]> size=new FutureTask<>(()->new int[]{viewer.getWindow().getDecorView().getWidth(),viewer.getWindow().getDecorView().getHeight()});runOnMainSync(size);int[] bounds=size.get();float from=bounds[0]*(right?.2f:.8f),to=bounds[0]*(right?.8f:.2f),y=bounds[1]*.5f;long down=SystemClock.uptimeMillis();
  for(int n=0;n<=20;n++){int action=n==0?MotionEvent.ACTION_DOWN:n==20?MotionEvent.ACTION_UP:MotionEvent.ACTION_MOVE;MotionEvent event=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,from+(to-from)*n/20,y,0);event.setSource(android.view.InputDevice.SOURCE_TOUCHSCREEN);FutureTask<Boolean> dispatch=new FutureTask<>(()->viewer.dispatchTouchEvent(event));runOnMainSync(dispatch);dispatch.get(5,TimeUnit.SECONDS);event.recycle();SystemClock.sleep(16);}waitForIdleSync();
 }
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle result=new Bundle();int code=Activity.RESULT_CANCELED;try{app=getTargetContext();loader=app.getClassLoader();app.startActivity(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(2000);waitForIdleSync();configuration();metadata();archive();images();result.putString("result","PASS "+checks+" reporter/read-burst/archive-Unicode/native-preview checks; public requests/posts=0");code=Activity.RESULT_OK;}catch(Throwable error){result.putInt("checksCompleted",checks);result.putString("error",android.util.Log.getStackTraceString(error));}finally{
  try{if(viewer!=null)runOnMainSync(viewer::finish);if(monitor!=null)removeMonitor(monitor);if(server!=null)server.close();synchronized(sockets){for(Socket s:sockets)s.close();}if(policy!=null)method(policy,"registerThumbnailServerPort",int.class).invoke(null,previousThumbnailPort);if(cache!=null)cache.set(null,oldCache);if(writes!=null)writes.set(null,oldWrites);if(temp!=null)temp.edit().clear().commit();if(nativePrefs!=null){SharedPreferences.Editor restore=nativePrefs.edit();if(hadBack)restore.putInt("gestureBack",oldBack);else restore.remove("gestureBack");restore.commit();}if(config!=null){SharedPreferences.Editor restore=config.edit();for(Map.Entry<String,Boolean> row:previous.entrySet())if(row.getValue()==null)restore.remove(row.getKey());else restore.putBoolean(row.getKey(),row.getValue());restore.commit();}}catch(Exception error){result.putString("cleanupError",error.toString());code=Activity.RESULT_CANCELED;}
 }finish(code,result);}
}
