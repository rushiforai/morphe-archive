package e.e.a;
import android.content.*;import android.graphics.*;import android.os.*;import android.util.LruCache;import android.widget.*;import java.io.*;import java.net.*;import java.util.*;import java.util.concurrent.*;

class NicoliveBrowser {
 final ThreadPoolExecutor work=new ThreadPoolExecutor(1,1,0,TimeUnit.MILLISECONDS,new ArrayBlockingQueue<Runnable>(1),new ThreadPoolExecutor.DiscardOldestPolicy());final ExecutorService imageWork=new ThreadPoolExecutor(2,2,0,TimeUnit.MILLISECONDS,new ArrayBlockingQueue<Runnable>(32),new ThreadPoolExecutor.AbortPolicy());final Handler main=new Handler(Looper.getMainLooper());final Set<HttpURLConnection> requests=Collections.synchronizedSet(new HashSet<HttpURLConnection>());volatile boolean closed,imagesPaused;volatile HttpURLConnection feedConnection;
 // Reservation writes must survive feed cancellation and are serialized.
 final ExecutorService reservationWork=new ThreadPoolExecutor(1,1,0,TimeUnit.MILLISECONDS,
   new ArrayBlockingQueue<Runnable>(8),new ThreadPoolExecutor.AbortPolicy());
 volatile int generation,imageGeneration;Future<?> loading;
 static final class Feed {final String html;final long at=System.currentTimeMillis();Feed(String s){html=s;}}
 final LinkedHashMap<String,Feed> feeds=new LinkedHashMap<String,Feed>();
 final HashMap<String,ArrayList<java.lang.ref.WeakReference<ImageView>>> pending=new HashMap<String,ArrayList<java.lang.ref.WeakReference<ImageView>>>();
 static final LruCache<String,Bitmap> images=new LruCache<String,Bitmap>(8*1024*1024){protected int sizeOf(String key,Bitmap value){return value.getByteCount();}};
 interface Result {void done(String html);void error();}
 static String cookie(Context c){try{return SessionCookies194.cookie(c,null);}catch(Exception e){return "";}}
 void load(final String url,final String cookie,final Result result){
  if(closed)return;if(loading!=null)loading.cancel(true);work.getQueue().clear();HttpURLConnection previous=feedConnection;if(previous!=null)NicoliveIo.execute(()->previous.disconnect());
  final int token=++generation;final String key=url+"\n"+cookie;Feed cached=feeds.get(key);
  if(cached!=null&&System.currentTimeMillis()-cached.at<30000){main.post(()->{if(!closed&&token==generation)result.done(cached.html);});return;}
  loading=work.submit(()->{if(closed||token!=generation)return;try{final String html=new String(bytes(url,cookie,2097152,true),"UTF-8");main.post(()->{if(!closed&&token==generation){feeds.put(key,new Feed(html));while(feeds.size()>3)feeds.remove(feeds.keySet().iterator().next());result.done(html);}});}catch(Exception e){main.post(()->{if(!closed&&token==generation)result.error();});}});
 }
 private static final String RESERVATION_API="https://live2.nicovideo.jp/api/v2/";
 void cancelReservation(String id,String cookie,Result result){
  mutateReservation(id,cookie,"DELETE","timeshift/reservations?programIds="+id,result);
 }
 void reserve(String id,String cookie,Result result){
  mutateReservation(id,cookie,"POST","programs/"+id+"/timeshift/reservation",result);
 }
 HttpURLConnection openReservationConnection(String url)throws IOException{
  return (HttpURLConnection)new URL(url).openConnection();
 }
 private void mutateReservation(String id,String cookie,String method,String path,Result result){
  if(closed||id==null||!id.matches("lv[0-9]+")||cookie==null||cookie.isEmpty()){result.error();return;}
  try{
   reservationWork.execute(()->{
    HttpURLConnection request=null;
    try{
     request=openReservationConnection(RESERVATION_API+path);
     request.setInstanceFollowRedirects(false);
     request.setConnectTimeout(15000);request.setReadTimeout(15000);
     request.setRequestMethod(method);
     request.setRequestProperty("Cookie",cookie);
     request.setRequestProperty("User-Agent",NicoliveData.UA);
     request.setRequestProperty("X-Frontend-Id","9");
     request.setRequestProperty("Origin","https://live.nicovideo.jp");
     request.setRequestProperty("Accept","application/json");
     int status=request.getResponseCode();
     main.post(()->{if(closed)return;if(status>=200&&status<300){refresh();result.done("");}else result.error();});
    }catch(IOException failure){main.post(()->{if(!closed)result.error();});}
    finally{if(request!=null)request.disconnect();}
   });
  }catch(RejectedExecutionException full){result.error();}
 }
 void refresh(){feeds.clear();}
 byte[] bytes(String original,String cookie,int max,boolean feed)throws IOException{
  String url=original;for(int redirect=0;redirect<4;redirect++){if(closed||Thread.currentThread().isInterrupted()||(!feed&&imagesPaused))throw new IOException("CANCELLED");URI u;try{u=URI.create(url);}catch(Exception e){throw new IOException("INVALID_URI");}String host=u.getHost();if(!"https".equalsIgnoreCase(u.getScheme())||host==null||!(host.equals("nicovideo.jp")||host.endsWith(".nicovideo.jp")||host.equals("nimg.jp")||host.endsWith(".nimg.jp")))throw new IOException("INVALID_HOST");
   HttpURLConnection c=(HttpURLConnection)new URL(url).openConnection();synchronized(requests){if(closed||(!feed&&imagesPaused))throw new IOException("CANCELLED");requests.add(c);}if(feed)feedConnection=c;try{c.setInstanceFollowRedirects(false);c.setConnectTimeout(15000);c.setReadTimeout(20000);c.setRequestProperty("User-Agent",NicoliveData.UA);c.setRequestProperty("Accept-Encoding","gzip");if((host.equals("live.nicovideo.jp")||host.equals("live2.nicovideo.jp"))&&cookie!=null&&!cookie.isEmpty())c.setRequestProperty("Cookie",cookie);int status=c.getResponseCode();if(status>=300&&status<400){String location=c.getHeaderField("Location");if(location==null)throw new IOException("REDIRECT");url=u.resolve(location).toString();continue;}if(status!=200)throw new IOException("HTTP_"+status);try(InputStream in="gzip".equalsIgnoreCase(c.getContentEncoding())?new java.util.zip.GZIPInputStream(c.getInputStream()):c.getInputStream()){ByteArrayOutputStream out=new ByteArrayOutputStream();byte[] buf=new byte[8192];for(int n;(n=in.read(buf))!=-1;){if(closed||Thread.currentThread().isInterrupted()||(!feed&&imagesPaused))throw new IOException("CANCELLED");if(out.size()+n>max)throw new IOException("TOO_LARGE");out.write(buf,0,n);}return out.toByteArray();}}finally{requests.remove(c);if(feedConnection==c)feedConnection=null;c.disconnect();}
  }throw new IOException("REDIRECT_LIMIT");
 }
 void image(String url,ImageView view){image(url,url,null,view);}
 void historyImage(NicoliveData.Program program,ImageView view){
  if(program.programThumbnail){image(program.thumbnail,view);return;}
  image("history:"+program.id,program.thumbnail,program.id,view);
 }
 private Bitmap decodeImage(String url)throws IOException{
  if(url==null||url.isEmpty())return null;
  byte[] bytes=bytes(url,"",2097152,false);
  BitmapFactory.Options options=new BitmapFactory.Options();
  options.inJustDecodeBounds=true;
  BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);
  if(options.outWidth<=0||options.outHeight<=0)return null;
  options.inSampleSize=1;
  while(options.outWidth/options.inSampleSize>384||options.outHeight/options.inSampleSize>216)options.inSampleSize*=2;
  options.inJustDecodeBounds=false;
  return BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);
 }
 private void image(final String key,final String fallback,final String programId,final ImageView view){
  view.setTag(key);Bitmap cached=key==null?null:images.get(key);if(cached!=null){view.setImageBitmap(cached);return;}view.setImageDrawable(null);if(key==null||key.isEmpty()||imagesPaused||closed)return;
  ArrayList<java.lang.ref.WeakReference<ImageView>> waiting=pending.get(key);
  if(waiting!=null){for(java.lang.ref.WeakReference<ImageView> ref:waiting)if(ref.get()==view)return;if(waiting.size()<16)waiting.add(new java.lang.ref.WeakReference<ImageView>(view));return;}
  final ArrayList<java.lang.ref.WeakReference<ImageView>> listeners=new ArrayList<>();
  listeners.add(new java.lang.ref.WeakReference<ImageView>(view));pending.put(key,listeners);
  final int token=imageGeneration;
  try{imageWork.execute(()->{
   Bitmap decoded=null;
   try{
    if(token!=imageGeneration)return;
    if(programId!=null){
     try{
      byte[] html=bytes("https://live.nicovideo.jp/watch/"+programId,"",2097152,false);
      decoded=decodeImage(NicoliveData.historyThumbnail(new String(html,java.nio.charset.StandardCharsets.UTF_8),programId));
     }catch(Exception ignored){}
    }
    if(decoded==null&&token==imageGeneration)decoded=decodeImage(fallback);
    if(decoded!=null)images.put(key,decoded);
   }catch(Exception ignored){}finally{
    final Bitmap bitmap=decoded;
    main.post(()->{
     if(pending.get(key)==listeners)pending.remove(key);
     if(closed||imagesPaused||token!=imageGeneration||bitmap==null)return;
     for(java.lang.ref.WeakReference<ImageView> ref:listeners){
      ImageView target=ref.get();
      if(target!=null&&key.equals(target.getTag()))target.setImageBitmap(bitmap);
     }
    });
   }
  });}catch(RejectedExecutionException e){pending.remove(key);}
 }
 void disconnectRequests(){final ArrayList<HttpURLConnection> closing;synchronized(requests){closing=new ArrayList<HttpURLConnection>(requests);}if(closing.isEmpty())return;NicoliveIo.execute(()->{for(HttpURLConnection c:closing)c.disconnect();});}
 void pauseImages(){imagesPaused=true;++imageGeneration;++generation;if(loading!=null)loading.cancel(true);work.getQueue().clear();pending.clear();((ThreadPoolExecutor)imageWork).getQueue().clear();disconnectRequests();}
 void resumeImages(){imagesPaused=false;}
 void close(){closed=true;++generation;++imageGeneration;pending.clear();feeds.clear();main.removeCallbacksAndMessages(null);disconnectRequests();work.shutdownNow();imageWork.shutdownNow();reservationWork.shutdown();}
}
