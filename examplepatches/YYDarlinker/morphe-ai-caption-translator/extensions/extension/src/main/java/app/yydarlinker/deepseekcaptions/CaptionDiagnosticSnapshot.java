package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** Immutable, already-redacted bounded panel snapshots. No UI caller waits for writer or archive. */
final class CaptionDiagnosticSnapshot {
  private static final Handler MAIN=new Handler(Looper.getMainLooper());
  private static final ThreadPoolExecutor REPORT=new ThreadPoolExecutor(1,1,30,TimeUnit.SECONDS,
      new ArrayBlockingQueue<>(2),r->{Thread t=new Thread(r,"caption-diagnostic-report");t.setDaemon(true);return t;});
  private static final Object LOCK=new Object();
  private static volatile Snapshot latest;
  private static final List<Pending> pending=new ArrayList<>();
  static {REPORT.allowCoreThreadTimeOut(true);}
  interface Callback {void ready(Snapshot snapshot);}
  static final class Key {
    final Context app;
    final long epoch,profile;
    final String locale;
    Key(Context c){Context application=c.getApplicationContext();app=application==null?c:application;
      epoch=CaptionDiagnosticsWriter.epoch();profile=ApiProfiles.revision();locale=CaptionTextResolver.locale(c).toLanguageTag();}
    boolean same(Key other){return app==other.app&&epoch==other.epoch&&profile==other.profile&&locale.equals(other.locale);}
    boolean current(Context c){return same(new Key(c));}
  }
  static final class Snapshot {
    final Key key;
    final String text;
    final long generatedAt;
    Snapshot(Key k,String text){key=k;this.text=text;generatedAt=System.currentTimeMillis();}
  }
  private static final class Pending {
    final Key key;
    final WeakReference<Context> caller;
    final List<WeakReference<Callback>> callbacks=new ArrayList<>();
    Pending(Context c,Key k){key=k;caller=new WeakReference<>(c);}
  }
  private static final class ReportTask implements Runnable {
    final Pending work;ReportTask(Pending work){this.work=work;}
    public void run(){compute(work);}
  }
  private CaptionDiagnosticSnapshot(){}
  static Snapshot peek(Context c){Snapshot value=latest;return value!=null&&value.key.current(c)?value:null;}
  static String peekText(Context c){Snapshot value=peek(c);return value==null?CaptionStrings.settings(c,"diagnostics_loading"):value.text;}
  static void invalidate(){latest=null;}
  static void request(Context c,Callback callback){
    Key key=new Key(c);Pending work;
    synchronized(LOCK){
      for(Pending existing:pending)if(existing.key.same(key)){
        existing.callbacks.removeIf(ref->ref.get()==null);
        if(existing.callbacks.size()>=16)existing.callbacks.remove(0);
        existing.callbacks.add(new WeakReference<>(callback));
        return;
      }
      // Obsolete locale/clear/profile work must not crowd out the only current panel request.
      pending.removeIf(old->!old.key.current(c));
      REPORT.getQueue().removeIf(task->task instanceof ReportTask&&!((ReportTask)task).work.key.current(c));
      if(pending.size()>=2)return;
      work=new Pending(c,key);work.callbacks.add(new WeakReference<>(callback));pending.add(work);
    }
    try{REPORT.execute(new ReportTask(work));}catch(java.util.concurrent.RejectedExecutionException full){
      synchronized(LOCK){pending.remove(work);}
    }
  }
  private static void compute(Pending work){
    Context c=work.caller.get();if(c==null)c=work.key.app;
    Snapshot result=null;
    try{
      if(work.key.current(c)){
        String text=CaptionDiagnostics.reportText(c,true);
        // The formatter itself uses bounded summary/quality/audit fields. Do not publish raw queues,
        // incomplete output, or a formatting result produced while its locale/profile/epoch changed.
        if(text.length()<=64000&&work.key.current(c))result=new Snapshot(work.key,text);
      }
    }finally{
      List<WeakReference<Callback>> callbacks;
      synchronized(LOCK){pending.remove(work);callbacks=new ArrayList<>(work.callbacks);}
      if(result!=null){
        Snapshot safe=result;
        if(work.key.current(c))latest=safe;
        MAIN.post(()->{for(WeakReference<Callback> ref:callbacks){Callback cb=ref.get();if(cb!=null)cb.ready(safe);}});
      }
    }
  }
}
