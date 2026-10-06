package n36;
import android.content.*;import java.util.concurrent.*;import org.json.*;
/** Test-package-only commands/acks: edits run in the IME process through its real InputConnection. */
public final class N37ImeBridge {
 private static Context context;private static volatile long sequence;private static volatile CountDownLatch latch;
 private static volatile Intent answer;private static final JSONArray events=new JSONArray();
 private static final BroadcastReceiver receiver=new BroadcastReceiver(){public void onReceive(Context c,Intent i){
   if(i.getLongExtra("id",-1)!=sequence)return;answer=i;CountDownLatch wait=latch;if(wait!=null)wait.countDown();}};
 public static void init(Context c){context=c;if(android.os.Build.VERSION.SDK_INT>=33)c.registerReceiver(receiver,new IntentFilter("morphe.n37.TEST_IME_ACK"),Context.RECEIVER_EXPORTED);else c.registerReceiver(receiver,new IntentFilter("morphe.n37.TEST_IME_ACK"));}
 public static synchronized Intent call(String kind,String text,int before,int after){
   long id=++sequence;answer=null;latch=new CountDownLatch(1);
   Intent command=new Intent("morphe.n37.TEST_IME_COMMAND").setPackage("app.morphe.n36.probe");
   command.putExtra("test_only",true).putExtra("id",id).putExtra("kind",kind).putExtra("text",text).putExtra("before",before).putExtra("after",after);
   context.sendBroadcast(command);
   try{if(!latch.await(5,TimeUnit.SECONDS))throw new IllegalStateException("IME acknowledgement missing: "+kind);}
   catch(InterruptedException e){Thread.currentThread().interrupt();throw new IllegalStateException(e);}
   Intent ack=answer;
   try{events.put(new JSONObject().put("id",id).put("kind",kind).put("ok",ack.getBooleanExtra("ok",false)).put("served",ack.getBooleanExtra("served",false)).put("field",ack.getIntExtra("field",-1)).put("ime_pid",ack.getIntExtra("pid",-1)).put("host_pid",android.os.Process.myPid()).put("text",ack.getStringExtra("text")));}catch(Exception e){throw new IllegalStateException(e);}
   return ack;
 }
 public static boolean connected(){return call("status","",0,0).getBooleanExtra("served",false);}
 public static boolean commit(String t){return call("commit",t,0,0).getBooleanExtra("ok",false);}
 public static boolean setComposing(String t){return call("compose",t,0,0).getBooleanExtra("ok",false);}
 public static boolean finishComposing(){return call("finish","",0,0).getBooleanExtra("ok",false);}
 public static boolean deleteSurrounding(int a,int b){return call("delete","",a,b).getBooleanExtra("ok",false);}
 public static String composingText(){return call("status","",0,0).getStringExtra("text");}
 public static JSONArray operations(){return events;}
 public static void close(){if(context!=null)context.unregisterReceiver(receiver);context=null;}
}
