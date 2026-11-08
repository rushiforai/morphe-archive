package e.e.a;
import java.util.*;import java.lang.ref.*;import java.lang.reflect.*;
import org.json.*;import android.os.SystemClock;import android.view.MotionEvent;
public class Behavior141 {
 static int checks,failures;static boolean baseline;
 static void check(boolean yes,String message){checks++;if(!yes){failures++;System.out.println("FAIL "+message);}}
 public static class WithoutCancel {public String d="sm1";public Object modernWatch=new Object();}
 public static class Owner {
  public String d="sm1";public Object modernWatch=new Object();public Boolean a=false;
  int decoded;int failAt=-1;boolean switchOnDecode;
  private void a(String command,Integer[] values,String[] labels){
   decoded++;if(decoded==failAt)throw new IllegalStateException("transient fixture error");
   if(switchOnDecode){modernWatch=new Object();switchOnDecode=false;}
   values[0]=11;values[1]=22;values[2]=33;labels[2]="secondary";
  }
 }
 public static class Job {
  static int currentCalls;
  public final WeakReference<Object> owner;public final String video;public final Object watch;
  Job(Owner o){owner=new WeakReference<Object>(o);video=o.d;watch=o.modernWatch;}
  private boolean current(){currentCalls++;Owner o=(Owner)owner.get();return o!=null&&!o.a&&watch==o.modernWatch&&video.equals(o.d)&&!Thread.currentThread().isInterrupted();}
 }
 static JSONObject comment(int i){return new JSONObject().put("id",String.valueOf(i)).put("no",i).put("body","body"+i).put("vposMs",12340).put("userId","user"+i).put("commands",new JSONArray().put("red").put("ue"));}
 static JSONArray rows(int start,int count){JSONArray a=new JSONArray();for(int i=start;i<start+count;i++)a.put(comment(i));return a;}
 static JSONObject root(JSONArray rows){return new JSONObject().put("data",new JSONObject().put("threads",new JSONArray().put(new JSONObject().put("id","thread").put("fork","main").put("comments",rows))));}
 static void progress(Job j,JSONObject r,int count){Dev121.progress(baseline?j.owner.get():j,r,count);}
 static void done(Job j){Dev121.done(baseline?j.owner.get():j);}
 static Map<?,?> snapshots()throws Exception {Field f=Dev121.class.getDeclaredField("SNAPSHOTS");f.setAccessible(true);return (Map<?,?>)f.get(null);}
 static void reset()throws Exception{snapshots().clear();CommentUi.inputs.clear();Job.currentCalls=0;CommentUi.calls=0;CommentUi.delivered=0;CommentUi.last=null;CommentUi.beforeQueue=null;CommentUi.throwApply=false;CommentUi.queued=null;SystemClock.now=100;Dev114.memory=true;}
 static void retryDecode()throws Exception {
  reset();Owner o=new Owner();o.failAt=2;Job j=new Job(o);JSONObject r=root(rows(0,1000));
  progress(j,r,1000);check(CommentUi.calls==0,"failed batch is not published");
  progress(j,r,1000);check(CommentUi.last!=null&&CommentUi.last.size()==1000,"transient decode retry preserves every comment");done(j);
 }
 static void restartSameVideo()throws Exception {
  reset();Owner o=new Owner();Job first=new Job(o);progress(first,root(rows(0,1000)),1000);
  o.modernWatch=new Object();Job second=new Job(o);progress(second,root(rows(2000,1000)),1000);
  check(CommentUi.calls==2,"same-video new watch gets an independent first batch");
  done(first);check(snapshots().size()==1,"old job completion cannot erase new job state");
  SystemClock.now+=5000;progress(second,root(rows(2000,1500)),1500);
  check(CommentUi.last!=null&&((q)CommentUi.last.get(0)).body.equals("body2000"),"new watch does not mix old comments");done(second);
 }
 static void cancellation()throws Exception {
  reset();Owner o=new Owner();Job j=new Job(o);o.a=true;progress(j,root(rows(0,1000)),1000);
  check(CommentUi.calls==0&&snapshots().isEmpty(),"cancelled jobs cannot publish or allocate snapshots");
  o.a=false;Job old=new Job(o);o.d="sm2";progress(old,root(rows(0,1000)),1000);
  check(CommentUi.calls==0,"old video job is rejected");
  o.d="sm1";Job race=new Job(o);o.switchOnDecode=true;progress(race,root(rows(0,1000)),1000);
  check(CommentUi.calls==0,"video/watch change during decoding cannot publish stale rows");done(race);
 }
 static void thresholds()throws Exception {
  reset();Owner o=new Owner();Job j=new Job(o);JSONArray a=rows(0,999);JSONObject r=root(a);
  progress(j,r,999);check(CommentUi.calls==0&&o.decoded==0,"below threshold performs no decoding");
  check(snapshots().isEmpty(),"under-threshold pages do not allocate snapshot state");
  check(Job.currentCalls==0,"under-threshold pages skip reflective job checks");
  a.put(comment(999));progress(j,r,1000);check(CommentUi.calls==1&&o.decoded==1000,"first thousand flushes once");
  ArrayList<?> displayed=CommentUi.last;
  for(int i=1000;i<2000;i++)a.put(comment(i));SystemClock.now+=2999;progress(j,r,2000);
  check(CommentUi.calls==1,"minimum interval coalesces pages");SystemClock.now++;progress(j,r,2000);
  check(CommentUi.calls==2&&o.decoded==2000,"incremental hydration does not reparse old rows");
  check(displayed.size()==1000&&displayed!=CommentUi.last,"previously displayed list stays independent during next hydration");
  for(int i=2000;i<2500;i++)a.put(comment(i));SystemClock.now+=4999;progress(j,r,2500);
  check(CommentUi.calls==2,"slow batch waits five seconds");SystemClock.now++;progress(j,r,2500);
  check(CommentUi.calls==3&&o.decoded==2500,"slow batch emits after five seconds");
  q row=(q)CommentUi.last.get(0);
  check(row.attributes[0]==1234&&row.attributes[1]==0&&row.attributes[2]==33&&row.attributes[3]==11&&row.attributes[4]==22&&"secondary".equals(row.h)&&"user0".equals(row.c)&&"red ue".equals(row.flags),"legacy decoder attributes, user and commands are retained");
  SystemClock.now+=5000;progress(j,r,2500);check(CommentUi.calls==3,"unchanged counts cannot republish");
  done(j);check(snapshots().isEmpty(),"completion releases snapshot");
  reset();o=new Owner();j=new Job(o);Dev114.memory=false;progress(j,root(rows(0,1000)),1000);
  check(CommentUi.calls==0&&snapshots().isEmpty(),"memory gate avoids hydration allocation");Dev114.memory=true;
 }
 static void queuedDelivery()throws Exception {
  if(baseline)return;
  reset();Owner o=new Owner();ArrayList<Object> list=new ArrayList<>();
  Method update=Dev121.class.getMethod("update",Object.class,ArrayList.class);
  Runnable stale=(Runnable)update.invoke(null,o,list);o.modernWatch=new Object();stale.run();
  check(CommentUi.delivered==0,"queued UI update rejects replaced watch");
  Runnable valid=(Runnable)update.invoke(null,o,list);valid.run();check(CommentUi.delivered==1,"current queued update is delivered");
  Runnable cancelled=(Runnable)update.invoke(null,o,list);o.a=true;cancelled.run();check(CommentUi.delivered==1,"queued UI update rejects cancellation");
  o.a=false;Object captured=Dev121.ticket(o);check(Dev121.valid(captured),"current Cast/UI generation ticket is valid");o.modernWatch=new Object();
  check(!Dev121.valid(captured)&&!Dev121.valid(null),"stale or missing Cast/UI tickets are rejected");
  ((Runnable)update.invoke(null,captured,list)).run();check(CommentUi.delivered==1,"entry ticket survives a change during merge/publish");
  Object legacy=new Object();((Runnable)update.invoke(null,legacy,list)).run();check(CommentUi.delivered==2,"legacy owner without watch keeps existing behavior");
  WithoutCancel variant=new WithoutCancel();((Runnable)update.invoke(null,variant,list)).run();check(CommentUi.delivered==3,"owners without cancellation field remain supported");
  o.a=false;Runnable weak=(Runnable)update.invoke(null,o,list);
  for(Field f:weak.getClass().getDeclaredFields()){f.setAccessible(true);check(f.get(weak)!=o,"queued callback does not strongly retain owner");}
 }
 static void stress()throws Exception {
  if(baseline)return;
  reset();Owner o=new Owner();Job job=new Job(o);JSONArray a=new JSONArray();JSONObject r=root(a);
  long started=System.nanoTime();
  for(int n=0;n<20;n++) {
   for(int i=n*1000;i<(n+1)*1000;i++)a.put(comment(i));
   SystemClock.now+=3000;progress(job,r,(n+1)*1000);
  }
  long elapsed=(System.nanoTime()-started)/1000000L;
  check(o.decoded==20000&&CommentUi.last.size()==20000&&CommentUi.calls==20,"20,000 comments decode once across 20 batches");
  check(CommentUi.inputs.size()==1,"20 publications reuse the producer list without 20 full handoff copies");
  System.out.println("Hydration stress: 20,000 rows / 20 batches / "+elapsed+" ms (JVM doubles, excludes Android UI/Cast/graph)");done(job);
  reset();Owner concurrent=new Owner();Job shared=new Job(concurrent);JSONObject data=root(rows(0,1000));
  java.util.concurrent.ExecutorService pool=java.util.concurrent.Executors.newFixedThreadPool(4);
  try {
   ArrayList<java.util.concurrent.Future<?>> jobs=new ArrayList<>();
   for(int i=0;i<8;i++)jobs.add(pool.submit(()->progress(shared,data,1000)));
   for(java.util.concurrent.Future<?> future:jobs)future.get();
  }finally{pool.shutdownNow();}
  check(CommentUi.calls==1&&concurrent.decoded==1000,"simultaneous calls on one job publish once");done(shared);
  reset();Owner interrupted=new Owner();Job j=new Job(interrupted);
  Thread.currentThread().interrupt();progress(j,root(rows(0,1000)),1000);Thread.interrupted();
  check(CommentUi.calls==0&&snapshots().isEmpty(),"interrupted worker cannot publish or allocate");
  reset();Owner forked=new Owner();Job f=new Job(forked);
  JSONArray threads=new JSONArray();
  for(String fork:new String[]{"main","owner"})threads.put(new JSONObject().put("id","same").put("fork",fork).put("comments",rows(0,1000)));
  progress(f,new JSONObject().put("data",new JSONObject().put("threads",threads)),2000);
  check(CommentUi.last.size()==2000,"identical comment IDs in different forks remain distinct");done(f);
 }
 static void interleaving()throws Exception {
  if(baseline)return;
  reset();final Owner o=new Owner();Job j=new Job(o);
  CommentUi.beforeQueue=()->o.modernWatch=new Object();
  progress(j,root(rows(0,1000)),1000);CommentUi.queued.run();
  check(CommentUi.delivered==0,"job ticket rejects switch between current check and UI enqueue");
  Field context=Dev121.class.getDeclaredField("UPDATE");context.setAccessible(true);
  check(((ThreadLocal<?>)context.get(null)).get()==null,"success releases dispatch ThreadLocal");
  o.modernWatch=new Object();Job failed=new Job(o);CommentUi.throwApply=true;
  progress(failed,root(rows(0,1000)),1000);
  check(((ThreadLocal<?>)context.get(null)).get()==null,"exception releases dispatch ThreadLocal");
  done(j);done(failed);
  reset();Owner zero=new Owner();Job atZero=new Job(zero);SystemClock.now=0;
  progress(atZero,root(rows(0,1000)),1000);SystemClock.now=1;progress(atZero,root(rows(0,2000)),2000);
  check(CommentUi.calls==1,"zero uptime is a valid first publication timestamp");done(atZero);
 }
 public static class Controls {int calls;long delay;public void setHideDelay(long d){calls++;delay=d;}}
 public static class Video extends android.view.View {Controls controls=new Controls();public Controls getVideoControls(){return controls;}}
 public static class Fragment {public Video a0=new Video();}
 public static class Activity extends android.app.Activity {public Fragment v=new Fragment();}
 public static class Service extends android.app.Service {public Video e=new Video();}
 static void controls()throws Exception {
  Activity a=new Activity();Service s=new Service();Video v=new Video();
  Dev121.controls(a);Dev121.controls(s);Dev121.controls(v);Dev121.controls(a);
  check(a.v.a0.controls.calls==1&&a.v.a0.controls.delay==2000&&s.e.controls.delay==2000&&v.controls.delay==2000,"all player variants tune once to 2000ms");
  a.v.a0=new Video();Dev121.controls(a);check(a.v.a0.controls.calls==1,"replacement controls are tuned");
  Fragment f=new Fragment();Dev121.controls(f);if(!baseline)check(f.a0.controls.delay==2000,"fragment creation configures controls before touch");
  Dev121.controls(new Object());Dev121.controls(null);a.v=null;Dev121.controls(a);check(true,"unknown and detached variants are safe");
  if(!baseline){Method touch=Dev121.class.getMethod("controls",Object.class,MotionEvent.class);Video fresh=new Video();touch.invoke(null,fresh,new MotionEvent(MotionEvent.ACTION_MOVE));check(fresh.controls.calls==0,"move events skip control reflection");touch.invoke(null,fresh,new MotionEvent(MotionEvent.ACTION_DOWN));check(fresh.controls.calls==1,"down event configures controls");}
 }
 public static void main(String[] args)throws Exception {
  baseline=args.length>0;retryDecode();restartSameVideo();cancellation();thresholds();queuedDelivery();interleaving();stress();controls();
  System.out.println("Behavior141: "+checks+" assertions, "+failures+" failures"+(baseline?" (unmodified dev.1)":""));if(failures>0)System.exit(1);
 }
}
