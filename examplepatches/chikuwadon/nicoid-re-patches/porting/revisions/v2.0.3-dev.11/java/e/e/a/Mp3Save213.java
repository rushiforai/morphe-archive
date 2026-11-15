package e.e.a;

import android.app.Activity;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.PowerManager;
import android.preference.PreferenceManager;
import android.provider.DocumentsContract;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.ListView;
import android.widget.Toast;
import java.io.*;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

/**
 * True MP3 export using the existing authenticated MP4 queue, followed by
 * PCM decode and Java LAME encoding.  No renaming an AAC/M4A file to .mp3.
 *
 * Bitrate is persisted through the existing Job.height field so the native
 * resume/cancel/storage paths stay backward compatible with saved MP4 jobs.
 */
public final class Mp3Save213 {
 private static final int MENU=18132;
 private static final int MAGIC=1000;
 private static final String PLAYER_TAG="nicoid-save-mp3-213";
 private Mp3Save213(){}

 static boolean isMp3(DownloadJobs115.Job j){
  if(j==null)return false;
  int bitrate=-j.height-MAGIC;
  return bitrate==128||bitrate==192||bitrate==256;
 }
 static int bitrate(DownloadJobs115.Job j){return -j.height-MAGIC;}

 public static void choose(Activity activity,String id,String title){
  if(activity==null||activity.isFinishing())return;
  final int[] rates={128,192,256};
  UiDialogs.show(UiDialogs.builder(PlaybackSession.dialogContext(activity))
   .setTitle(PanelUi.tr(activity,"MP3で保存","Save as MP3","儲存為MP3"))
   .setItems(new String[]{"128 kbps","192 kbps","256 kbps"},(dialog,which)->{
    if(which<0||which>=rates.length)return;
    int marker=-MAGIC-rates[which];
    if(DownloadUi115.prefs(activity).getString(DownloadUi115.TREE,"").isEmpty())
     DownloadUi115.folder(activity,id,title,marker);
    else DownloadUi115.enqueue(activity,id,title,marker);
   }).setNegativeButton(android.R.string.cancel,null).create());
 }

 /** Called before the existing player-menu hook; wait for the MP4 sibling. */
 public static void schedulePlayer(Object owner){
  try{
   View root=(View)Playback214.get(owner,"x1");
   Activity activity=(Activity)Playback214.get(owner,"A1");
   if(root==null||activity==null)return;
   WeakReference<Object> w=new WeakReference<>(owner);
   root.post(()->{
    if(installPlayer(w.get(),activity,root))return;
    ViewTreeObserver viewTree=root.getViewTreeObserver();
    if(!viewTree.isAlive())return;
    ViewTreeObserver.OnGlobalLayoutListener listener=new ViewTreeObserver.OnGlobalLayoutListener(){
     public void onGlobalLayout(){
      Object current=w.get();
      if(current==null||activity.isDestroyed()||!root.isAttachedToWindow()
         ||installPlayer(current,activity,root)){
       if(root.getViewTreeObserver().isAlive())
        root.getViewTreeObserver().removeOnGlobalLayoutListener(this);
      }
     }
    };
    viewTree.addOnGlobalLayoutListener(listener);
   });
  }catch(Exception e){android.util.Log.w("nicoid-mp3","Player menu setup",e);}
 }
 static boolean installPlayer(Object owner,Activity a,View root){
  if(owner==null||root.findViewWithTag(PLAYER_TAG)!=null)return true;
  View existing=root.findViewWithTag(PlayerDownloads116.TAG);
  if(existing==null)return false;
  try{
   if(Playback214.get(owner,"x1")!=root)return true;
   TextView row=PanelUi.text(a,PanelUi.tr(a,"MP3で保存","Save as MP3","儲存為MP3"),16);
   row.setTag(PLAYER_TAG);
   row.setGravity(android.view.Gravity.CENTER_VERTICAL);
   row.setMinHeight(PanelUi.dp(a,48));
   row.setPadding(PanelUi.dp(a,16),PanelUi.dp(a,8),PanelUi.dp(a,16),PanelUi.dp(a,8));
   row.setBackgroundColor(android.graphics.Color.TRANSPARENT);
   WeakReference<Object> weak=new WeakReference<>(owner);
   row.setOnClickListener(view->{
    Object current=weak.get();
    if(current==null)return;
    try{
     String id=HistoryRules.id(String.valueOf(Playback214.get(current,"b0")));
     if(id==null||!id.matches("(?:sm|so|nm|ss)?[0-9]+"))return;
     String title=String.valueOf(Playback214.get(current,"c0"));
     choose(a,id,title.equals("null")||title.isEmpty()?id:title);
    }catch(Exception e){android.util.Log.w("nicoid-mp3","Player MP3 action",e);}
   });
   ViewGroup group=existing.getParent() instanceof ViewGroup?(ViewGroup)existing.getParent():null;
   if(group instanceof ListView){
    ((ListView)group).addFooterView(row,null,false);
   }else if(group instanceof LinearLayout){
    group.addView(row,group.indexOfChild(existing)+1,new LinearLayout.LayoutParams(-1,-2));
   }else return false;
   return true;
  }catch(Exception e){android.util.Log.w("nicoid-mp3","Cannot install MP3 row",e);return true;}
 }

 /** Completes after DownloadActions116 has rebuilt the native long-click menu. */
 public static void scheduleList(Object listener,Object popup){
  DownloadUi115.MAIN.post(()->addList(listener,popup));
 }
 static void addList(Object listener,Object popup){
  try{
   List<ListActions.Action> actions=ListActions.ACTIONS.get(popup);
   if(actions==null)return;
   Object adapter=ListActions.get(listener,"e");
   Activity activity=(Activity)ListActions.get(adapter,"d");
   Object values=ListActions.get(adapter,"b");
   int at=((Number)ListActions.get(listener,"c")).intValue();
   if(!(values instanceof List)||at<0||at>=((List<?>)values).size())return;
   Object row=((List<?>)values).get(at);
   String id=DownloadActions116.videoId(row);
   if(id.isEmpty())return;
   String title=ListActions.value(row,"title");
   Menu menu=(Menu)ListActions.get(popup,"a");
   if(menu==null||menu.findItem(MENU)!=null)return;
   MenuItem original=menu.findItem(DownloadActions116.MP4);
   int order=original==null?5:original.getOrder()+1;
   MenuItem mp3=menu.add(0,MENU,order,
      PanelUi.tr(activity,"MP3で保存","Save as MP3","儲存為MP3"));
   Runnable action=()->choose(activity,id,title);
   mp3.setOnMenuItemClickListener(clicked->{action.run();return true;});
   actions.add(new ListActions.Action(mp3,action));
  }catch(Exception e){android.util.Log.w("nicoid-mp3","Cannot install MP3 list action",e);}
 }

 /** A compiled menu row is recycled by the existing MP4/Cache manager.
  * Set MP3 label only on MP3 jobs; leave all other rows untouched. */
 public static void decorateRow(View view,Object adapter,int index){
  try{
   if(!(adapter instanceof DownloadUi115.Manager)||!(view instanceof ViewGroup))return;
   DownloadUi115.Manager m=(DownloadUi115.Manager)adapter;
   if(index<0||index>=m.rows.size())return;
   DownloadUi115.Row row=m.rows.get(index);
   if(!isMp3(row.job))return;
   View label=((ViewGroup)view).getChildAt(1);
   if(label instanceof TextView){
    String text=((TextView)label).getText().toString();
    if(text.startsWith("MP4"))((TextView)label).setText("MP3"+text.substring(3));
   }
  }catch(Exception e){android.util.Log.w("nicoid-mp3","Cannot update MP3 row",e);}
 }

 /** Preserve native MP4 opening but use the correct MIME for true MP3. */
 public static boolean openIfMp3(Activity activity,DownloadJobs115.Job job,boolean share){
  if(!isMp3(job))return false;
  if(activity==null||job.uri==null||job.uri.isEmpty())return true;
  try{
   Uri uri=Uri.parse(job.uri);
   Intent target=share
       ?new Intent(Intent.ACTION_SEND).setType("audio/mpeg")
          .putExtra(Intent.EXTRA_STREAM,uri)
       :new Intent(Intent.ACTION_VIEW).setDataAndType(uri,"audio/mpeg");
   target.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
   target.setClipData(android.content.ClipData.newRawUri(job.title,uri));
   activity.startActivity(Intent.createChooser(target,
       share?"MP3を共有":"音声アプリで開く"));
  }catch(Exception e){
   Toast.makeText(activity,"MP3を開けませんでした",Toast.LENGTH_LONG).show();
  }
  return true;
 }

 /** Entry hook in DownloadWorker115.start before the MP4-only implementation. */
 public static boolean start(Object owner,Intent intent){
  if(!(owner instanceof Service)||intent==null)return false;
  DownloadJobs115.init((Service)owner);
  DownloadJobs115.Job job=DownloadJobs115.find(intent.getStringExtra("nicoid_mp4_job115"));
  if(!isMp3(job))return false;
  Service s=(Service)owner;
  if(job.paused||job.cancelled||!"キュー待ち".equals(job.phase)){
   DownloadWorker115.finish(s);
   return true;
  }
  try{
   DownloadWorker115.service=s;
   DownloadWorker115.destroyed=false;
   DownloadWorker115.active=job;
   job.started=android.os.SystemClock.elapsedRealtime();
   job.phase="音声情報を取得中";
   CacheProgress.stop();
   try{
    android.os.Handler handler=(android.os.Handler)Playback214.get(s,"i");
    handler.removeCallbacks((Runnable)Playback214.get(s,"l"));
   }catch(Exception ignored){}
   s.getClass().getField("t").set(null,job.id);
   Object model=Class.forName("e.e.a.d0").getConstructor(Context.class).newInstance(s);
   MultiTabs227.set(model,"r",Boolean.TRUE);
   MultiTabs227.set(model,"n",Boolean.valueOf(VideoDetails.cookie().contains("user_session=")));
   MultiTabs227.set(model,"I",Class.forName("e.e.a.v0").getField("b").get(null));
   Mp4Transfer115 task=new Mp4Transfer115(s,job);
   DownloadWorker115.transfer=task;
   DownloadWorker115.publish(s,job);
   DownloadJobs115.changed(s);
   DownloadWorker115.worker=new Thread(()->run(s,job,task,model),
       "nicoid-mp3-save");
   DownloadWorker115.worker.start();
  }catch(Exception e){
   job.phase="エラー";job.error="MP3保存の準備に失敗しました";
   DownloadWorker115.active=null;
   DownloadJobs115.changed(s);
   DownloadWorker115.finish(s);
  }
  return true;
 }

 static void run(Service s,DownloadJobs115.Job job,Mp4Transfer115 task,Object model){
  PowerManager.WakeLock lock=null;
  try{
   PowerManager pm=(PowerManager)s.getSystemService(Context.POWER_SERVICE);
   if(pm!=null){lock=pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK,"nicoid:mp3-save");lock.acquire(6*60*60*1000L);}
   // The existing authenticated finite-HLS acquisition is reused unchanged.
   // Working MP4 is temporary; only the encoded MP3 reaches SAF storage.
   File mp4=task.run(model);
   task.check();
   job.phase="MP3変換中";
   job.quality="MP3 "+bitrate(job)+"kbps";
   DownloadJobs115.changed(s);
   File mp3=new File(task.folder,"complete.mp3");
   Mp3Transcode213.convert(task,mp4,mp3,bitrate(job));
   task.check();
   export(s,job,mp3);
  }catch(Exception e){
   job.phase=job.cancelled?"キャンセル":job.paused?"一時停止":"エラー";
   job.error=job.cancelled?"":job.paused?"再開時は取得をやり直します":
       e instanceof IOException?String.valueOf(e.getMessage()):
       "MP3保存に失敗しました ("+e.getClass().getSimpleName()+")";
   android.util.Log.w("nicoid-mp3","MP3 save failed",e);
  }finally{
   task.clean();
   if(lock!=null&&lock.isHeld())lock.release();
   DownloadJobs115.changed(s);
   DownloadWorker115.MAIN.post(()->{
    if(DownloadWorker115.active==job){
     DownloadWorker115.active=null;
     DownloadWorker115.transfer=null;
     DownloadWorker115.worker=null;
     if(!DownloadWorker115.destroyed&&DownloadWorker115.service==s)
      DownloadWorker115.finish(s);
    }
   });
  }
 }

 static void export(Context context,DownloadJobs115.Job job,File output)throws Exception{
  job.phase="保存中";
  Uri tree=Uri.parse(job.tree);
  String filename=Mp4Playlist115.filename(job.title,job.id).replaceFirst("\\.mp4$",".mp3");
  Uri document=null;
  boolean committed=false;
  try{
   document=DocumentsContract.createDocument(context.getContentResolver(),
        DownloadJobs115.document(tree),"audio/mpeg",filename+".part");
   if(document==null)throw new IOException("MP3保存先を作成できません");
   try(InputStream in=new BufferedInputStream(new FileInputStream(output));
       OutputStream out=context.getContentResolver().openOutputStream(document,"wt")){
    if(out==null)throw new IOException("MP3保存先を開けません");
    byte[] buf=new byte[65536];int n;
    while((n=in.read(buf))!=-1){
     if(job.cancelled||job.paused||Thread.currentThread().isInterrupted())
      throw new InterruptedIOException();
     out.write(buf,0,n);
    }
   }
   if(job.cancelled||job.paused)throw new InterruptedIOException();
   Uri renamed=DocumentsContract.renameDocument(context.getContentResolver(),document,filename);
   if(renamed==null)throw new IOException("MP3保存を確定できません");
   document=renamed;
   job.uri=document.toString();
   job.bytes=output.length();
   job.savedAt=System.currentTimeMillis();
   job.phase="保存済み";
   committed=true;
  }finally{
   if(!committed&&document!=null)
    try{DocumentsContract.deleteDocument(context.getContentResolver(),document);}
    catch(Exception e){android.util.Log.w("nicoid-mp3","Cannot remove partial MP3 document",e);}
  }
 }
}