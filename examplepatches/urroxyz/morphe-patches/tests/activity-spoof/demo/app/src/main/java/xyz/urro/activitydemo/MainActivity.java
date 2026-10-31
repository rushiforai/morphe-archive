package xyz.urro.activitydemo;
import android.Manifest;
import android.app.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.os.*;
import android.widget.*;
import com.google.android.gms.location.*;
import java.util.*;

public final class MainActivity extends Activity {
 private TextView info;private android.content.SharedPreferences prefs;
 private final android.content.SharedPreferences.OnSharedPreferenceChangeListener changes=(p,k)->runOnUiThread(this::refresh);
 private ActivityRecognitionClient client;
 public void onCreate(Bundle state){super.onCreate(state);client=ActivityRecognition.getClient(this);prefs=getSharedPreferences("demo",0);prefs.registerOnSharedPreferenceChangeListener(changes);
  LinearLayout root=new LinearLayout(this);root.setOrientation(1);root.setPadding(40,60,40,20);
  TextView title=new TextView(this);title.setText(getApplicationInfo().loadLabel(getPackageManager()));title.setTextSize(25);root.addView(title);
  TextView explanation=new TextView(this);explanation.setText("Standard Google Activity Recognition\nSubscriptions shown here belong to this app. Results appear below as callbacks arrive.");root.addView(explanation);
  button(root,"Grant Physical Activity permission",()->requestPermissions(new String[]{Manifest.permission.ACTIVITY_RECOGNITION},10));
  button(root,"Subscribe: sampling + vehicle transitions",this::subscribe);
  button(root,"Unsubscribe",this::unsubscribe);
  button(root,"Clear event history",()->prefs.edit().remove("events").remove("latest_sampling").remove("latest_transition").apply());
  info=new TextView(this);info.setTextSize(17);ScrollView scroll=new ScrollView(this);scroll.addView(info);root.addView(scroll);setContentView(root);refresh();
  if(checkSelfPermission(Manifest.permission.ACTIVITY_RECOGNITION)!=PackageManager.PERMISSION_GRANTED)requestPermissions(new String[]{Manifest.permission.ACTIVITY_RECOGNITION},10);
 }
 private void button(LinearLayout root,String text,Runnable action){Button b=new Button(this);b.setText(text);b.setOnClickListener(v->action.run());root.addView(b);}
 private PendingIntent callback(String action){return PendingIntent.getBroadcast(this,0,new Intent(this,DetectionReceiver.class).setAction(getPackageName()+"."+action),PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_MUTABLE);}
 private void subscribe(){
  if(checkSelfPermission(Manifest.permission.ACTIVITY_RECOGNITION)!=PackageManager.PERMISSION_GRANTED){requestPermissions(new String[]{Manifest.permission.ACTIVITY_RECOGNITION},10);return;}
  client.requestActivityUpdates(5000,callback("SAMPLE")).addOnSuccessListener(v->prefs.edit().putBoolean("sampling",true).putString("status","Sampling registered").apply()).addOnFailureListener(e->status(e.toString()));
  ArrayList<ActivityTransition> transitions=new ArrayList<>();
  for(int type:new int[]{DetectedActivity.IN_VEHICLE,DetectedActivity.WALKING,DetectedActivity.STILL})for(int event:new int[]{0,1})transitions.add(new ActivityTransition.Builder().setActivityType(type).setActivityTransition(event).build());
  client.requestActivityTransitionUpdates(new ActivityTransitionRequest(transitions),callback("TRANSITION")).addOnSuccessListener(v->prefs.edit().putBoolean("transitions",true).putString("status","Transitions registered").apply()).addOnFailureListener(e->status(e.toString()));
 }
 private void unsubscribe(){
  client.removeActivityUpdates(callback("SAMPLE")).addOnSuccessListener(v->prefs.edit().putBoolean("sampling",false).apply()).addOnFailureListener(e->status(e.toString()));
  client.removeActivityTransitionUpdates(callback("TRANSITION")).addOnSuccessListener(v->prefs.edit().putBoolean("transitions",false).apply()).addOnFailureListener(e->status(e.toString()));
 }
 private void status(String text){prefs.edit().putString("status",text).apply();}
 private void refresh(){if(info==null)return;String events=prefs.getString("events","[]").replace("},{","}\n{");info.setText("Permission: "+(checkSelfPermission(Manifest.permission.ACTIVITY_RECOGNITION)==PackageManager.PERMISSION_GRANTED?"granted":"not granted")+"\nSampling (5 s): "+prefs.getBoolean("sampling",false)+"\nTransitions: IN_VEHICLE / WALKING / STILL, ENTER + EXIT: "+prefs.getBoolean("transitions",false)+"\nStatus: "+prefs.getString("status","Not subscribed")+"\n\nLatest sampling: "+prefs.getString("latest_sampling","No result yet")+"\nLatest transition: "+prefs.getString("latest_transition","No result yet")+"\n\n"+events);}
 public void onRequestPermissionsResult(int code,String[] permissions,int[] results){super.onRequestPermissionsResult(code,permissions,results);refresh();}
 protected void onDestroy(){prefs.unregisterOnSharedPreferenceChangeListener(changes);super.onDestroy();}
}
