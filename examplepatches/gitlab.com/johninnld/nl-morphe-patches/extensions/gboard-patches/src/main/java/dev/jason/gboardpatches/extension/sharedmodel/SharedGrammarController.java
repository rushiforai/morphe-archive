package dev.jason.gboardpatches.extension.sharedmodel;
import android.content.*;
import android.os.*;
import app.johninnl.modelhost.api.*;
import org.json.JSONObject;
import java.util.*;
import java.util.concurrent.*;

/** Private grammar channel. Work/debounce is off the UI thread; closing it never stops another client's engine. */
public final class SharedGrammarController {
 public static final int REQUEST_DEADLINE_MS=9_000;
 private static final ScheduledExecutorService WORK=Executors.newSingleThreadScheduledExecutor(r->new Thread(r,"gboard-shared-grammar"));
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static volatile ModelHostClient client;private static HostSession session;
 private static boolean connected;private static Query active;
 private static ScheduledFuture<?> idle,scheduled;
 private static String cachedText;private static List<GrammarEdits.Edit> cached;private static long cachedAt;
 private static final class Query {final Context context;final String text;final CompletableFuture<List<GrammarEdits.Edit>> result=new CompletableFuture<>();RequestHandle handle;Query(Context c,String t){context=c.getApplicationContext();text=t;}}
 private SharedGrammarController(){}
 public static CompletableFuture<List<GrammarEdits.Edit>> check(Context context,String text){
  if(text==null || text.length()<3 || text.length()>1024)return CompletableFuture.completedFuture(Collections.emptyList());
  Query query=new Query(context,text);query.result.whenComplete((v,e)->{if(query.result.isCancelled())WORK.execute(()->{if(query.handle!=null)query.handle.cancel();if(active==query)finish(query,null);});});
  WORK.execute(()->{
   if(active!=null){if(active.handle!=null)active.handle.cancel();active.result.cancel(false);}
   active=query;if(idle!=null)idle.cancel(false);if(scheduled!=null)scheduled.cancel(false);
   if(cached!=null && text.equals(cachedText) && SystemClock.elapsedRealtime()-cachedAt<2000){List<GrammarEdits.Edit> value=cached;active=null;query.result.complete(value);idle=WORK.schedule(()->{if(active==null)closeConnection();},10,TimeUnit.SECONDS);return;}
   scheduled=WORK.schedule(()->connectAndSubmit(query),400,TimeUnit.MILLISECONDS);
  });return query.result;
 }
 private static void connectAndSubmit(Query query){
  if(active!=query || query.result.isDone())return;
  if(client!=null && connected){submit(query);return;}
  if(client!=null)return;
  try{SharedProviderIdentity.verify(query.context);}catch(HostException error){finish(query,null);return;}
  ModelHostClient made=new ModelHostClient(new ComponentName(ModelHostClient.DEFAULT_PACKAGE,ModelHostClient.SERVICE_CLASS),Runnable::run);client=made;
  MAIN.post(()->{if(client!=made)return;try{made.connect(query.context,new ConnectionListener(){
   @Override public void onConnected(HostStatus status,HostCapabilities caps){WORK.execute(()->{if(client!=made)return;connected=true;try{session=made.openSession(new SessionOptions("Gboard grammar",null,2048));if(active!=null)submit(active);}catch(HostException error){if(active!=null)finish(active,null);}});}
   @Override public void onDisconnected(HostException error){WORK.execute(()->{if(client!=made)return;connected=false;session=null;if(active!=null)finish(active,null);closeConnection();});}
  });}catch(RuntimeException error){WORK.execute(()->{if(client==made){if(active!=null)finish(active,null);closeConnection();}});}});
 }
 private static void submit(Query query){
  if(active!=query || query.result.isDone() || session==null)return;
  try{
   if(!client.status().isReady()){finish(query,null);return;}
   query.handle=session.submitText(new TextRequest("proofread",query.text,null,null,null,null,512,REQUEST_DEADLINE_MS),json->{
    try{JSONObject event=new JSONObject(json);if(!event.optBoolean("terminal"))return;String corrected="ok".equals(event.optString("status"))?event.getString("text"):null;WORK.execute(()->finish(query,corrected));}
    catch(Exception error){WORK.execute(()->finish(query,null));}
   });
   if(query.result.isCancelled())query.handle.cancel();
  }catch(Exception error){finish(query,null);}
 }
 private static void finish(Query query,String corrected){
  if(active!=query)return;
  List<GrammarEdits.Edit> edits=corrected==null?Collections.emptyList():GrammarEdits.between(query.text,corrected);
  if(corrected!=null){cachedText=query.text;cached=edits;cachedAt=SystemClock.elapsedRealtime();}
  active=null;query.result.complete(edits);
  if(idle!=null)idle.cancel(false);idle=WORK.schedule(()->{if(active==null)closeConnection();},10,TimeUnit.SECONDS);
 }
 private static void closeConnection(){if(session!=null)session.close();session=null;if(client!=null)client.close();client=null;connected=false;cached=null;cachedText=null;}
 public static boolean onUiThread(){return Looper.myLooper()==Looper.getMainLooper();}
}
