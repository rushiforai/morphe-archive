package xyz.urro.transit;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.service.notification.StatusBarNotification;
import android.text.SpannableString;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;

/** Refresh only tracked GO text views and an already-existing GO notification. */
public final class LiveReminders {
 private static final ArrayList<Entry> views=new ArrayList<>();
 private static volatile WeakReference<Object> service=new WeakReference<>(null),model=new WeakReference<>(null);
 private static final Handler main=new Handler(Looper.getMainLooper());
 private static final class Entry {
  WeakReference<TextView> view;Object smart;SpannableString original;String rendered;
  Entry(TextView view,Object smart,SpannableString original,String rendered){this.view=new WeakReference<>(view);this.smart=smart;this.original=original;this.rendered=rendered;}
 }
 public static synchronized void track(TextView view,Object smart,SpannableString original,String rendered,boolean eligible){
  if(view==null)return;
  for(Iterator<Entry> i=views.iterator();i.hasNext();){Entry e=i.next();if(e.view.get()==null||e.view.get()==view)i.remove();}
  if(eligible){if(views.size()>=128)views.remove(0);views.add(new Entry(view,smart,original,rendered));}
 }
 private static volatile boolean goSessionActive;
 /** GoService.a(GOLiveActivityPlatformData) entry: runs for every GO live update. */
 public static void notification(Object owner,Object data){
  GoSimulation.realModel(data);
  GoModelDiagnostics.trace("notification_builder",data==null?"null":data.getClass().getName());
  boolean started=data!=null&&!goSessionActive;
  goSessionActive=data!=null;
  GoActivityTransmitter.onLive(TransitHooks.appContext(),data);

  GoModelDiagnostics.onLiveModel(data);if(!GoSimulation.delivering){service=new WeakReference<>(owner);model=new WeakReference<>(data);}
 }
 /** Observe the returned notification text, not just entry into its model builder. */
 public static Notification notificationOutput(Notification n){
  if(n==null||n.extras==null||!GoModelDiagnostics.isEnabled(TransitHooks.appContext()))return n;
  Object data=model.get();String raw=GoStateExtractor.mainText(data);
  for(String key:new String[]{Notification.EXTRA_TITLE,Notification.EXTRA_TEXT,Notification.EXTRA_BIG_TEXT}){
   CharSequence value=n.extras.getCharSequence(key);
   if(value!=null)output("notification_"+key,"notification_return",raw,value.toString());
  }
  return n;
 }
 static void output(String surface,String path,String original,String displayed){
  Context c=TransitHooks.appContext();if(c==null||!GoModelDiagnostics.isEnabled(c))return;
  GoInstruction.Result r=GoInstruction.classify(original);
  boolean bike=c.getSharedPreferences("xyz.urro.transit.go.v1",0).getBoolean("bike",false);
  GoInstruction.Result visible=GoInstruction.classify(displayed);
  String expected="unclassified";
  if(r.kind==GoInstruction.Kind.STOPS||r.kind==GoInstruction.Kind.NEXT||r.kind==GoInstruction.Kind.CURRENT){
   ReminderFormatter.Event event=ReminderFormatter.Event.valueOf(r.kind.name());
   String rendered=ReminderFormatter.render(bike,event,r.stops,c.getSharedPreferences("xyz.urro.transit.go.v1",0).getString(event.name(),null),original);
   expected=Boolean.toString(java.util.Objects.equals(rendered,displayed));
  }
  GoModelDiagnostics.trace("reminder_final", "surface="+surface+" path="+path+" event="+r.kind+" stops="+r.stops+" bike="+bike+" stock_visible="+visible.kind+" matches_expected="+expected+" changed="+!java.util.Objects.equals(original,displayed));
 }
 public static void refresh(Context context){main.post(()->refreshNow(context));}
 private static synchronized void refreshNow(Context context){
  GoComposeReminders.refresh();
  for(Iterator<Entry> i=views.iterator();i.hasNext();){
   Entry e=i.next();TextView v=e.view.get();if(v==null){i.remove();continue;}
   // Don't overwrite a recycled or otherwise edited view.
   if(!v.getText().toString().equals(e.rendered)){i.remove();continue;}
   String rendered=TransitHooks.text(e.smart,e.original.toString());
   v.setText(rendered.equals(e.original.toString())?e.original:new SpannableString(rendered));e.rendered=rendered;output("in_app","tracked_view_refresh",e.original.toString(),v.getText().toString());
  }
  Object owner=service.get(),data=model.get();if(owner==null||data==null)return;
  try{
   NotificationManager manager=context.getSystemService(NotificationManager.class);
   StatusBarNotification target=null;
   for(StatusBarNotification n:manager.getActiveNotifications())if("go_mode".equals(n.getNotification().getChannelId())){
    if(target!=null)return;target=n;
   }
   if(target==null)return; // Never recreate a canceled GO notification.
   Notification updated=(Notification)owner.getClass().getMethod("a",data.getClass()).invoke(owner,data);
   updated.flags|=Notification.FLAG_ONLY_ALERT_ONCE;
   manager.notify(target.getTag(),target.getId(),updated);
  }catch(ReflectiveOperationException|RuntimeException error){android.util.Log.w("TransitMorphe","GO preference refresh unavailable");}
 }
}
