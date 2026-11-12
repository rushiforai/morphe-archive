package e.e.a;

import java.io.*;import java.net.*;import java.nio.charset.StandardCharsets;import java.util.*;import java.util.concurrent.*;
import okhttp3.*;import org.json.*;

/** Owns exactly one watch socket and bounded streaming comment reader. No UI or media player. */
public final class NicoliveSession implements Closeable {
 public interface Listener {
  void program(NicoliveData.Program p);void stream(JSONObject stream);void status(String text,boolean terminal);
  void comment(NicoliveData.Chat chat);void commentState(boolean connected);void posted(boolean success,String text);
 }
 final Listener listener;final String id,accountCookie;
 final OkHttpClient client;final ExecutorService workers=Executors.newFixedThreadPool(3);final ScheduledExecutorService timers=Executors.newSingleThreadScheduledExecutor();
 final Set<Call> calls=Collections.synchronizedSet(new HashSet<Call>());
 final LinkedHashMap<String,Boolean> seen=new LinkedHashMap<String,Boolean>();
 volatile boolean closed;volatile int generation;volatile WebSocket socket;volatile NicoliveData.Program program;volatile String preferred="abr";
 volatile Future<?> closeTask;ScheduledFuture<?> seat,retry,postTimeout;Future<?> connectionTask;int commentGeneration=-1;String commentView="";int failures;volatile boolean posting;volatile long serverOffset;
 public NicoliveSession(String id,String cookie,Listener listener){if(NicoliveData.id(id)==null)throw new IllegalArgumentException("Invalid program");this.id=id;this.accountCookie=cookie==null?"":cookie;this.listener=listener;client=new OkHttpClient.Builder().connectTimeout(15,TimeUnit.SECONDS).readTimeout(25,TimeUnit.SECONDS).followRedirects(false).build();}
 boolean active(int token){return !closed&&token==generation;}
 public void start(){connect();}
 synchronized void connect(){if(closed)return;final int token=++generation;NicoliveDiagnostics.record("SOCKET","connect gen="+token);program=null;if(connectionTask!=null){connectionTask.cancel(true);((ThreadPoolExecutor)workers).purge();}final Future<?> retired=cancelTransport(false);listener.status(failures==0?"接続中…":"再接続中…",false);
  connectionTask=workers.submit(new Runnable(){public void run(){try{
   if(retired!=null)retired.get(15,TimeUnit.SECONDS);if(!active(token))return;String html=getText("https://live.nicovideo.jp/watch/"+id,2097152,token);final NicoliveData.Program p=NicoliveData.Program.watch(html,id);if(!active(token))return;program=p;listener.program(p);
   if(p.ended()){listener.status("放送は終了しました",true);return;}
   if(!p.canWatch){listener.status(p.loggedIn?"この番組の視聴条件を確認してください":"この番組の視聴にはログインが必要です",true);return;}
   if(!p.onAir()){listener.status("開演前です",true);return;}
   if(p.socket.length()==0)throw new IOException("SESSION_MISSING");
   Request request=request(p.socket,true);synchronized(NicoliveSession.this){if(!active(token))return;socket=client.newWebSocket(request,new WebSocketListener(){
    @Override public void onOpen(WebSocket ws,Response response){if(!active(token)){ws.cancel();return;}NicoliveDiagnostics.record("SOCKET","opened gen="+token);try{JSONObject data=new JSONObject().put("reconnect",false).put("room",new JSONObject().put("protocol","webSocket").put("commentable",true)).put("stream",new JSONObject().put("protocol","hls").put("quality",preferred).put("latency","high").put("chasePlay",false).put("accessRightMethod","single_cookie"));ws.send(new JSONObject().put("type","startWatching").put("data",data).toString());}catch(JSONException e){failed(token);}}
    @Override public void onMessage(WebSocket ws,String text){if(!active(token))return;try{message(ws,new JSONObject(text),token);}catch(Exception e){listener.status("受信情報を処理できませんでした",false);}}
    @Override public void onFailure(WebSocket ws,Throwable t,Response response){NicoliveDiagnostics.record("SOCKET","failure gen="+token+" error="+(t==null?"unknown":t.getClass().getSimpleName())+" http="+(response==null?-1:response.code()));if(active(token))failed(token);}
    @Override public void onClosed(WebSocket ws,int code,String reason){NicoliveDiagnostics.record("SOCKET","closed gen="+token+" code="+code);if(active(token))failed(token);}
   });}
  }catch(Exception e){if(active(token))failed(token);}}});
 }
 synchronized void message(final WebSocket ws,JSONObject obj,final int token)throws Exception{
  if(!active(token))return;String type=obj.optString("type");JSONObject data=obj.optJSONObject("data");if(data==null)data=new JSONObject();
  if(type.equals("ping")){
   ws.send("{\"type\":\"pong\"}");
   // Renew the viewing seat on each ping, in addition to the periodic timer.
   boolean kept=ws.send("{\"type\":\"keepSeat\"}");
   android.util.Log.d("nicoid-live","WebSocket ping/keepSeat sent="+kept);NicoliveDiagnostics.record("SOCKET","keepSeat ok="+kept);
  }
  else if(type.equals("seat")){if(seat!=null)seat.cancel(false);int seconds=Math.max(1,Math.min(3600,data.optInt("keepIntervalSec",30)));seat=timers.scheduleAtFixedRate(new Runnable(){public void run(){if(active(token))ws.send("{\"type\":\"keepSeat\"}");}},seconds,seconds,TimeUnit.SECONDS);}
  else if(type.equals("serverTime")){String value=data.optString("currentMs");try{long ms=Long.parseLong(value);serverOffset=ms-System.currentTimeMillis();}catch(Exception ignored){try{serverOffset=java.time.Instant.parse(data.optString("currentTime")).toEpochMilli()-System.currentTimeMillis();}catch(Exception ignored2){}}}
  else if(type.equals("stream")){if(!NicoliveData.secureServiceUri(data.optString("uri"),false))throw new IOException("INVALID_STREAM_HOST");failures=0;listener.stream(data);listener.status("LIVE",false);}
  else if(type.equals("messageServer")){final String view=data.optString("viewUri");if(!NicoliveData.secureServiceUri(view,false))throw new IOException("INVALID_COMMENT_HOST");if(commentGeneration!=token||!commentView.equals(view)){commentGeneration=token;commentView=view;workers.execute(new Runnable(){public void run(){try{comments(view,token);}finally{synchronized(NicoliveSession.this){if(commentGeneration==token&&commentView.equals(view))commentGeneration=-1;}}}});}}
  else if(type.equals("postCommentResult")){if(posting){posting=false;if(postTimeout!=null)postTimeout.cancel(false);listener.posted(true,"");}}
  else if(type.equals("error")||type.equals("disconnect")){
   String code=data.optString("code",data.optString("reason","UNKNOWN"));
   if(code.contains("COMMENT_POST")||code.contains("COMMENT_LOCKED")){if(posting){posting=false;if(postTimeout!=null)postTimeout.cancel(false);listener.posted(false,NicoliveData.failure(code));}}
   else if(code.contains("END_PROGRAM")||code.contains("NOT_ON_AIR")||code.contains("NO_PERMISSION")||code.contains("NOT_FOUND")||code.contains("NO_AUTH")){++generation;cancelTransport();listener.status(NicoliveData.failure(code),true);}
   else failed(token);
  }
 }
 synchronized void failed(int token){if(!active(token))return;++generation;cancelTransport();listener.commentState(false);if(failures>=5){listener.status("接続が切れました。再接続をお試しください",true);return;}long wait=NicoliveData.retryDelay(failures++);listener.status("再接続中…",false);retry=timers.schedule(new Runnable(){public void run(){connect();}},wait,TimeUnit.MILLISECONDS);}
 public synchronized void reconnect(){if(closed)return;failures=0;connect();}
 public synchronized boolean quality(String q){if(closed||socket==null)return false;try{preferred=q;return socket.send(new JSONObject().put("type","changeStream").put("data",new JSONObject().put("quality",q).put("protocol","hls").put("latency","high").put("chasePlay",false).put("accessRightMethod","single_cookie")).toString());}catch(Exception e){return false;}}
 public synchronized boolean post(String text,long playbackEpochMs,boolean anonymous){
  if(closed||posting||socket==null||program==null||!program.loggedIn||!program.onAir()||playbackEpochMs<=0||text==null||text.trim().isEmpty()||text.codePointCount(0,text.length())>75)return false;
  try{long vpos=Math.max(0,(playbackEpochMs-program.vposBase*1000)/10);JSONObject d=new JSONObject().put("text",text).put("vpos",vpos);if(anonymous)d.put("isAnonymous",true);posting=true;
   boolean sent=socket.send(new JSONObject().put("type","postComment").put("data",d).toString());if(!sent){posting=false;return false;}
   postTimeout=timers.schedule(new Runnable(){public void run(){synchronized(NicoliveSession.this){if(posting){posting=false;listener.posted(false,"送信結果を確認できませんでした。投稿済みか確認してください");}}}},10,TimeUnit.SECONDS);return true;
  }catch(Exception e){posting=false;return false;}
 }
 Request request(String url,boolean websocket)throws IOException{if(!NicoliveData.secureServiceUri(url,websocket))throw new IOException("INVALID_SERVICE_HOST");Request.Builder b=new Request.Builder().url(url).header("User-Agent",NicoliveData.UA).header("Origin","https://live.nicovideo.jp").header("Referer","https://live.nicovideo.jp/");String host=URI.create(url).getHost();if((host.equals("live.nicovideo.jp")||host.equals("live2.nicovideo.jp")||host.equals("sp.live.nicovideo.jp"))&&!accountCookie.isEmpty())b.header("Cookie",accountCookie);return b.build();}
 synchronized Call tracked(String url,int token)throws IOException{if(!active(token))throw new IOException("SESSION_CLOSED");Call call=client.newCall(request(url,false));calls.add(call);return call;}
 String getText(String url,int max)throws IOException{return getText(url,max,generation);}
 String getText(String url,int max,int token)throws IOException{
  for(int redirect=0;redirect<4;redirect++){Call call=tracked(url,token);try(Response r=call.execute()){
   if(r.code()>=300&&r.code()<400){String location=r.header("Location");if(location==null)throw new IOException("INVALID_REDIRECT");url=URI.create(url).resolve(location).toString();continue;}
   if(!r.isSuccessful()||r.body()==null)throw new IOException("HTTP_"+r.code());InputStream in=r.body().byteStream();ByteArrayOutputStream out=new ByteArrayOutputStream();byte[] buf=new byte[8192];for(int n;(n=in.read(buf))!=-1;){if(out.size()+n>max)throw new IOException("RESPONSE_TOO_LARGE");out.write(buf,0,n);}return new String(out.toByteArray(),StandardCharsets.UTF_8);
  }finally{calls.remove(call);}}
  throw new IOException("TOO_MANY_REDIRECTS");
 }
 void comments(String view,int token){String cursor="now";int errors=0;
  while(active(token)){
   try{Call call=tracked(view+"?at="+cursor,token);try(Response r=call.execute()){
    if(!r.isSuccessful()||r.body()==null)throw new IOException("COMMENT_HTTP");InputStream in=r.body().byteStream();byte[] frame;long[] next={0};
    while(active(token)&&(frame=NicoliveData.frame(in))!=null){String uri=NicoliveData.entry(frame,next);if(uri!=null){if(!NicoliveData.secureServiceUri(uri,false))throw new IOException("INVALID_COMMENT_HOST");segment(uri,token);}if(next[0]>0)cursor=String.valueOf(next[0]);}
   }finally{calls.remove(call);}errors=0;
   }catch(Exception e){if(!active(token))return;listener.commentState(false);if(++errors>5)return;try{Thread.sleep(NicoliveData.retryDelay(errors-1));}catch(InterruptedException interrupted){Thread.currentThread().interrupt();return;}}
  }
 }
 void segment(String url,int token)throws IOException{Call call=tracked(url,token);try(Response r=call.execute()){
  if(!r.isSuccessful()||r.body()==null)throw new IOException("COMMENT_SEGMENT_HTTP");listener.commentState(true);InputStream in=r.body().byteStream();byte[] b;
  while(active(token)&&(b=NicoliveData.frame(in))!=null){NicoliveData.Chat chat=NicoliveData.chat(b);if(chat==null)continue;String key=chat.id.length()>0?chat.id:chat.atMs+":"+chat.user+":"+chat.text;
   synchronized(seen){if(seen.containsKey(key))continue;seen.put(key,true);while(seen.size()>4096)seen.remove(seen.keySet().iterator().next());}if(chat.text.length()>1000)chat.text=chat.text.substring(0,1000);listener.comment(chat);
  }
 }finally{calls.remove(call);}}
 synchronized Future<?> cancelTransport(final boolean dispose){
  if(posting){posting=false;listener.posted(false,"送信結果を確認できませんでした。投稿済みか確認してください");}
  if(seat!=null){seat.cancel(false);seat=null;}if(retry!=null){retry.cancel(false);retry=null;}if(postTimeout!=null){postTimeout.cancel(false);postTimeout=null;}
  final WebSocket oldSocket=socket;socket=null;final ArrayList<Call> oldCalls; synchronized(calls){oldCalls=new ArrayList<Call>(calls);calls.clear();}
  if(!dispose&&oldSocket==null&&oldCalls.isEmpty())return null;
  return NicoliveIo.execute(new Runnable(){public void run(){
   try{if(oldSocket!=null)oldSocket.cancel();}finally{
    try{for(Call call:oldCalls)call.cancel();}finally{if(dispose){client.dispatcher().cancelAll();client.dispatcher().executorService().shutdown();client.connectionPool().evictAll();}}
   }
  }});
 }
 synchronized void cancelTransport(){cancelTransport(false);}
 @Override public synchronized void close(){if(closed)return;closed=true;++generation;posting=false;closeTask=cancelTransport(true);workers.shutdownNow();timers.shutdownNow();synchronized(seen){seen.clear();}}
}
