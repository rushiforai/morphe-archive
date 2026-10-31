package xyz.urro.transit;

import android.app.Activity;
import android.app.Application;
import android.app.AlertDialog;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.TextWatcher;
import android.text.Editable;
import android.text.InputFilter;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Switch;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.*;
import java.util.regex.*;

/** Exact-version adapter; reflection is limited to public, inspected Transit model APIs. */
public final class TransitHooks {
 private static Application app;
 private static final SharedPreferences.OnSharedPreferenceChangeListener PREF_LISTENER=(p,k)->{if(app!=null){LiveReminders.refresh(app);GoSimulation.refresh();if("activity_spoof".equals(k))GoActivityTransmitter.preferenceChanged();}};
 private static WeakReference<Activity> activity=new WeakReference<>(null);
 private static final ArrayList<WeakReference<Object>> marked=new ArrayList<>();
 private static final Pattern STOPS=Pattern.compile("^Get off in ([0-9]+) stops?[.!]?$",Pattern.CASE_INSENSITIVE);
 private static volatile boolean bikeFeature,motionFeature,activityFeature;
 /** Injected by the Bike mode patch. */
 public static void enableBike(){bikeFeature=true;}
 /** Injected by the Motion Cues automation patch. */
 public static void enableMotion(){enableActivity();}
 public static void enableActivity(){activityFeature=true;motionFeature=false;}
 static boolean activityFeature(){return activityFeature;}
 static boolean bikeFeature(){return bikeFeature;}
 static boolean motionFeature(){return motionFeature;}
 public static void init(Application a){
  if(app!=null)return;app=a;GoActivityTransmitter.init(a);
  if(GoSimulation.enabled)a.getSystemService(android.app.NotificationManager.class).cancel("go-simulation",0x47534d);
  prefs().registerOnSharedPreferenceChangeListener(PREF_LISTENER);
  GoModelDiagnostics.trace("process_start","file_logging_v1 package="+a.getPackageName()+" sdk="+android.os.Build.VERSION.SDK_INT+" overlay="+android.provider.Settings.canDrawOverlays(a)+" usage="+MotionStateListener.usageEnabled(a));
  a.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks(){
   public void onActivityResumed(Activity a){activity=new WeakReference<>(a);if(permissionsPending&&!permissionsDismissed)checkPermissionsPrompt(false);}
   public void onActivityPaused(Activity a){if(activity.get()==a)activity.clear();}
   public void onActivityCreated(Activity a,Bundle b){} public void onActivityStarted(Activity a){}
   public void onActivityStopped(Activity a){} public void onActivitySaveInstanceState(Activity a,Bundle b){}
   public void onActivityDestroyed(Activity a){GoSimulation.close(a);}
  });
 }
 static android.content.Context appContext(){return app;}
 static SharedPreferences prefs(){return app.getSharedPreferences("xyz.urro.transit.go.v1",0);}
 public static void resolverEnter(Object smart){chain("resolver_entry",smart,null);}
 private static void chain(String stage,Object smart,String resolved){
  if(!GoSimulation.state.active)return;
  GoInstruction.Result raw=GoInstruction.classify(GoStateExtractor.raw(smart));
  GoInstruction.Result parsed=GoInstruction.classify(resolved);
  if(raw.kind==GoInstruction.Kind.OTHER&&parsed.kind==GoInstruction.Kind.OTHER)return;
  String value="stage="+stage+" identity="+System.identityHashCode(smart)+" raw_kind="+raw.kind+" raw_stops="+raw.stops+" resolved_kind="+parsed.kind+" marked="+marked(smart)+" bike="+prefs().getBoolean("bike",false)+" feature="+bikeFeature+" template="+(prefs().contains(raw.kind.name())?"custom":"default");
  android.util.Log.i("TransitSimulation",value);GoModelDiagnostics.trace("simulation_chain",value);
 }
 public static synchronized void mark(Object smart){
  if(smart==null)return;
  GoModelDiagnostics.trace("reminder_getter",smart.getClass().getName());
  for(Iterator<WeakReference<Object>> i=marked.iterator();i.hasNext();){Object o=i.next().get();if(o==null)i.remove();else if(o==smart){chain("mark_existing",smart,null);return;}}
  // Bound cache even if the host retains many models. Identity, never value equality.
  if(marked.size()>=512)marked.remove(0);marked.add(new WeakReference<>(smart));chain("mark_registered",smart,null);
 }
 private static synchronized boolean marked(Object smart){for(WeakReference<Object> r:marked)if(r.get()==smart)return true;return false;}
 private static String reminderCaller(){
  StringBuilder out=new StringBuilder();for(StackTraceElement f:Thread.currentThread().getStackTrace()){String c=f.getClassName();if(c.startsWith("xyz.urro.transit.")||c.startsWith("java."))continue;if(out.length()>0)out.append(";");out.append(c).append(".").append(f.getMethodName());if(out.length()>300)break;}return out.toString();
 }
 public static String text(Object smart,String original){
  chain("text_entry",smart,original);
  if(app==null||original==null||!bikeFeature)return original;
  GoInstruction.Result r=GoInstruction.classify(original);
  ReminderFormatter.Event event; int n=r.stops;
  if(r.kind==GoInstruction.Kind.STOPS)event=ReminderFormatter.Event.STOPS;
  else if(r.kind==GoInstruction.Kind.NEXT)event=ReminderFormatter.Event.NEXT;
  else if(r.kind==GoInstruction.Kind.CURRENT)event=ReminderFormatter.Event.CURRENT;
  else return original;
  GoModelDiagnostics.trace("reminder_formatter", "event="+event+" stops="+n+" caller="+reminderCaller()+" marked="+marked(smart)+" bike="+prefs().getBoolean("bike",false)+" model="+(smart==null?"null":smart.getClass().getName()));
  if(!marked(smart))return original;
  GoModelDiagnostics.reminder(event,n);
  String rendered=ReminderFormatter.render(prefs().getBoolean("bike",false),event,n,prefs().getString(event.name(),null),original);
  GoModelDiagnostics.trace("reminder_output", "event="+event+" changed="+!rendered.equals(original)+" caller="+reminderCaller());
  return rendered;
 }
 public static SpannableString styled(Object smart,SpannableString original,TextView view){
  if(original==null)return null;String replacement=text(smart,original.toString());
  LiveReminders.track(view,smart,original,replacement,marked(smart));
  if(view!=null&&marked(smart)&&GoModelDiagnostics.isEnabled(app))view.post(()->LiveReminders.output("in_app","styled_view_after_bind",original.toString(),view.getText().toString()));
  return replacement.equals(original.toString())?original:new SpannableString(replacement);
 }
 static Object get(Object o,String name)throws ReflectiveOperationException{return o.getClass().getMethod(name).invoke(o);}
 static Object[] parts(Object o,int n)throws ReflectiveOperationException{Object[] p=new Object[n];for(int i=0;i<n;i++)p[i]=get(o,"component"+(i+1));return p;}
 static Object copy(Object o,Object[] args)throws ReflectiveOperationException{
  for(Method m:o.getClass().getMethods())if(m.getName().equals("copy")&&m.getParameterTypes().length==args.length)return m.invoke(o,args);
  throw new NoSuchMethodException("copy");
 }
 static Object label(Object old,String title)throws ReflectiveOperationException{Object[] p=parts(old,4);p[3]=title;return copy(old,p);}
 static Object subtitleLabel(Object oldLabel,String text)throws ReflectiveOperationException{
  ClassLoader c=oldLabel.getClass().getClassLoader();
  Object color=Class.forName("com.thetransitapp.droid.shared.model.cpp.Colors",false,c).getField("Q").get(null);
  Object style=Enum.valueOf((Class<Enum>)Class.forName("djinni.java.src.TransitTextStyle",false,c),"Style_14_18_Regular");
  Object lcase=Enum.valueOf((Class<Enum>)Class.forName("djinni.java.src.LetterCase",false,c),"Default");
  return oldLabel.getClass().getConstructor(color.getClass(),style.getClass(),lcase.getClass(),String.class).newInstance(color,style,lcase,text);
 }
 static Object action(ClassLoader c,String key)throws ReflectiveOperationException{
  return Class.forName("com.thetransitapp.droid.shared.model.cpp.UserAction",false,c).getConstructor(String.class,String.class).newInstance("xyz.urro.transit."+key,"");
 }
 static Object rowButton(Object oldToggle,String key,String title,String subtitle)throws ReflectiveOperationException{
  Object[] p=parts(oldToggle,17);ClassLoader c=oldToggle.getClass().getClassLoader();
  Class<?> cType=Class.forName("djinni.java.src.ComponentType",false,c),cWidth=Class.forName("djinni.java.src.ComponentRelativeWidth",false,c),
   cAccess=Class.forName("djinni.java.src.Accessibility",false,c),cLabel=Class.forName("djinni.java.src.Label",false,c),
   cAction=Class.forName("com.thetransitapp.droid.shared.model.cpp.UserAction",false,c),cButton=Class.forName("djinni.java.src.Button",false,c),
   cMenu=Class.forName("djinni.java.src.ContextMenu",false,c),cSmartLabel=Class.forName("djinni.java.src.SmartLabel",false,c);
  Object type=Enum.valueOf((Class<Enum>)cType,"RowButton");
  Object act=action(c,key);
  return Class.forName("djinni.java.src.RowButtonComponent",false,c)
   .getConstructor(String.class,cType,cWidth,Integer.class,boolean.class,boolean.class,int.class,cAccess,cLabel,cAction,cAction,cLabel,cButton,cMenu,Integer.class,cSmartLabel,int.class,int.class,int.class)
   .newInstance("xyz.urro.transit."+key,type,p[2],p[3],false,true,0,null,label(p[8],title),act,null,subtitle==null?null:subtitleLabel(p[8],subtitle),null,null,null,null,0,4,12);
 }
 static Object toggle(Object old,String key,String title,String description,boolean checked)throws ReflectiveOperationException{
  Object[] p=parts(old,17);p[0]="xyz.urro.transit."+key;p[8]=label(p[8],title);
  String rawDesc=p[10]==null?"":String.valueOf(get(p[10],"component1"));
  int endTag=rawDesc.indexOf('>');
  String prefix=(rawDesc.startsWith("<color|")&&endTag>0)?rawDesc.substring(0,endTag+1):"<color|5e7a82/c6c6ca>";
  p[10]=Class.forName("com.thetransitapp.droid.shared.model.cpp.SmartString",false,old.getClass().getClassLoader()).getConstructor(String.class).newInstance(prefix+description);
  p[7]=null;p[13]=checked;p[14]=action(old.getClass().getClassLoader(),key);p[15]=p[14];p[16]=null;
  return copy(old,p);
 }
 /** Return a copy, never mutate an existing immutable model list. Fail closed on unknown layout. */
 /** Patched ProfileBottomSheet.getComponents(): reads the unpatched list, then decorates a copy. */
 public static ArrayList decorate(Object model){
  return decorate(model,components(model));
 }
 static ArrayList components(Object model){
  try{return (ArrayList)get(model,"component3");}catch(ReflectiveOperationException|RuntimeException ignored){}
  try{Field f=model.getClass().getDeclaredField("components");f.setAccessible(true);return (ArrayList)f.get(model);}
  catch(ReflectiveOperationException|RuntimeException e){throw new IllegalStateException("ProfileBottomSheet layout changed",e);}
 }
 static ArrayList decorate(Object model,ArrayList original){
  if(app==null||original==null)return original;
  try{
   Object header=get(model,"getHeader");String title=(String)get(get(header,"getTitle"),"getText");
   String subtitle="";try{Object s=get(header,"getSubtitle");if(s!=null)subtitle=(String)get(s,"getText");}catch(ReflectiveOperationException ignored){}
   boolean go=title.equalsIgnoreCase("GO Settings")&&subtitle.toLowerCase(Locale.ROOT).contains("transit");
   boolean settings=title.equalsIgnoreCase("Settings and accessibility");
   if(!go&&!settings)return original;
   Object template=null, heading=null;int at=-1;boolean reminder=false,rate=false;
   for(int i=0;i<original.size();i++){
    Object o=original.get(i);
    if(o.getClass().getSimpleName().equals("LabelComponent")){
     String text=(String)get(get(o,"getLabel"),"getText");
     if(text.equalsIgnoreCase("ACCESSIBILITY")||text.equalsIgnoreCase("PREFERENCES"))heading=o;
    }
    if(o.getClass().getSimpleName().equals("ToggleComponent")){
     template=o;String text=(String)get(get(o,"getTitle"),"getText");
     if(text.equalsIgnoreCase("Send reminder"))reminder=true;
     if(text.toLowerCase(Locale.ROOT).contains("rate")&&text.toLowerCase(Locale.ROOT).contains("ride")){rate=true;at=i+1;}
    }
    if(String.valueOf(get(o,"getUid")).startsWith("xyz.urro.transit."))return original;
   }
   if(template==null)return original;
   ArrayList out=new ArrayList(original);
   if(go&&reminder&&rate&&bikeFeature){out.add(at,toggle(template,"bike","Bike mode","Specific wording to remind you about your bicycle when traveling.",prefs().getBoolean("bike",false)));}
   else if(settings){
    if(heading==null)return original;
    Object[] h=parts(heading,10);h[0]="xyz.urro.transit.heading";h[7]=null;h[8]=label(h[8],"MORPHE");out.add(copy(heading,h));
    if(bikeFeature)out.add(rowButton(template,"editor","Bike mode settings","Customize reminders; previews and reset to defaults"));
    if(activityFeature)out.add(toggle(template,"activity_spoof","Spoof Physical Activity","Tells patched receiver apps IN_VEHICLE while GO confirms you are aboard",prefs().getBoolean("activity_spoof",false)));
    if(GoSimulation.enabled)out.add(rowButton(template,"simulation","GO Simulation / Developer Testing","Local GO model replay; not real navigation"));
    out.add(rowButton(template,"diagnostics","GO diagnostics","Opt-in troubleshooting traces; no locations or stop names"));
   }
   return out;
  }catch(ReflectiveOperationException|RuntimeException e){android.util.Log.w("TransitMorphe","Unsupported settings model; leaving unchanged");return original;}
 }
 public static boolean action(Object action){
  if(app==null||action==null)return false;
  try{
   String id=(String)action.getClass().getField("a").get(action);
   if(!id.startsWith("xyz.urro.transit."))return false;
   if(id.equals("xyz.urro.transit.bike"))prefs().edit().putBoolean("bike",!prefs().getBoolean("bike",false)).apply();
   else if(id.equals("xyz.urro.transit.activity_spoof"))prefs().edit().putBoolean("activity_spoof",!prefs().getBoolean("activity_spoof",false)).apply();
   else if(id.equals("xyz.urro.transit.editor")){Activity a=activity.get();if(a!=null)a.runOnUiThread(()->editor(a));}
   else if(id.equals("xyz.urro.transit.simulation")){Activity a=activity.get();if(a!=null)a.runOnUiThread(()->GoSimulation.show(a));}
   else if(id.equals("xyz.urro.transit.diagnostics")){Activity a=activity.get();if(a!=null)a.runOnUiThread(()->diagnostics(a));}
   return true;
  }catch(ReflectiveOperationException|RuntimeException e){return false;}
 }
 static volatile boolean permissionsPending, permissionsDismissed;
 static volatile AlertDialog permissionsDialog;
 public static void checkPermissionsPrompt(boolean fromGoStart){
  if(app==null||!motionFeature)return;
  boolean enabled=prefs().getBoolean("automatic",true);
  boolean overlay=android.provider.Settings.canDrawOverlays(app);
  boolean usage=MotionStateListener.usageEnabled(app);
  PermissionCheck.Need need=PermissionCheck.evaluate(enabled,overlay,usage);
  if(need==PermissionCheck.Need.NONE){permissionsPending=false;return;}
  if(fromGoStart)permissionsDismissed=false;
  else if(permissionsDismissed)return;
  Activity a=activity.get();
  if(a==null)return;
  AlertDialog shown=permissionsDialog;
  if(shown!=null&&shown.isShowing())return;
  permissionsPending=true;
  a.runOnUiThread(()->{
   String msg=need==PermissionCheck.Need.BOTH
    ?"Motion Cues when aboard requires Display over other apps (to launch Motion Cues in the background) and Usage Access (to confirm service state)."
    :need==PermissionCheck.Need.OVERLAY
    ?"Motion Cues when aboard requires Display over other apps to launch Motion Cues in the background."
    :"Motion Cues when aboard requires Usage Access to confirm when Motion Cues starts or stops.";
   AlertDialog.Builder b=new AlertDialog.Builder(a).setTitle("Permissions needed for Motion Cues").setMessage(msg).setNegativeButton("Not now",(d,w)->{permissionsDismissed=true;permissionsPending=false;}).setOnCancelListener(d->{permissionsDismissed=true;permissionsPending=false;});
   if(need==PermissionCheck.Need.BOTH||need==PermissionCheck.Need.OVERLAY){
    b.setPositiveButton("Overlay settings",(d,w)->{try{a.startActivity(new android.content.Intent(android.provider.Settings.ACTION_MANAGE_OVERLAY_PERMISSION,android.net.Uri.parse("package:"+a.getPackageName())));}catch(RuntimeException ignored){}});
   }
   if(need==PermissionCheck.Need.BOTH){
    b.setNeutralButton("Usage Access",(d,w)->{try{a.startActivity(new android.content.Intent(android.provider.Settings.ACTION_USAGE_ACCESS_SETTINGS));}catch(RuntimeException ignored){}});
   }else if(need==PermissionCheck.Need.USAGE){
    b.setPositiveButton("Usage Access",(d,w)->{try{a.startActivity(new android.content.Intent(android.provider.Settings.ACTION_USAGE_ACCESS_SETTINGS));}catch(RuntimeException ignored){}});
   }
   permissionsDialog=b.show();
  });
 }
 static void editor(Activity a){
  LinearLayout root=new LinearLayout(a);root.setOrientation(LinearLayout.VERTICAL);root.setPadding(32,16,32,16);
  EditText[] fields=new EditText[3];String[] keys={"STOPS","NEXT","CURRENT"};
  TextView preview=new TextView(a);
  Runnable update=()->preview.setText("N = 1: "+ReminderFormatter.render(true,ReminderFormatter.Event.STOPS,1,fields[0].getText().toString(),"")+"\nN = 2: "+ReminderFormatter.render(true,ReminderFormatter.Event.STOPS,2,fields[0].getText().toString(),""));
  for(int i=0;i<3;i++){fields[i]=new EditText(a);fields[i].setHint(new String[]{"Stops remaining","Next stop","Current stop"}[i]);fields[i].setFilters(new InputFilter[]{new InputFilter.LengthFilter(500)});fields[i].setText(ReminderFormatter.template(ReminderFormatter.Event.valueOf(keys[i]),prefs().getString(keys[i],null)));root.addView(fields[i]);}
  fields[0].addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int st,int c,int f){}public void onTextChanged(CharSequence s,int st,int b,int c){update.run();}public void afterTextChanged(Editable e){}});
  root.addView(preview);update.run();
  new AlertDialog.Builder(a).setTitle("Bike reminder templates").setView(root).setPositiveButton("Save",(d,w)->{SharedPreferences.Editor e=prefs().edit();for(int i=0;i<3;i++)e.putString(keys[i],fields[i].getText().toString());e.apply();})
   .setNeutralButton("Reset to defaults",(d,w)->{SharedPreferences.Editor e=prefs().edit();for(String k:keys)e.remove(k);e.apply();}) .setNegativeButton("Cancel",null).show();
 }
 static void diagnostics(Activity a){
  LinearLayout root=new LinearLayout(a);root.setOrientation(LinearLayout.VERTICAL);root.setPadding(32,16,32,16);
  TextView info=new TextView(a);info.setText("Records GO model types, instruction kinds and Motion Cues decisions. No locations, stop names or trip IDs.");root.addView(info);
  android.widget.Button toggle=new android.widget.Button(a);toggle.setText(GoModelDiagnostics.isEnabled(app)?"Disable diagnostics":"Enable diagnostics");
  toggle.setOnClickListener(v->toggle.setText(GoModelDiagnostics.toggle(app)?"Disable diagnostics":"Enable diagnostics"));root.addView(toggle);
  android.widget.TextView logStatus=new android.widget.TextView(a);logStatus.setText(DiagnosticFiles.status()+"\nFull logs are saved automatically while diagnostics are enabled.");root.addView(logStatus);
  android.widget.Button copy=new android.widget.Button(a);copy.setText("Copy diagnostics preview");
  copy.setOnClickListener(v->a.getSystemService(android.content.ClipboardManager.class).setPrimaryClip(android.content.ClipData.newPlainText("GO diagnostics",GoModelDiagnostics.report())));root.addView(copy);
  android.widget.Button clear=new android.widget.Button(a);clear.setText("Clear preview (keeps files)");clear.setOnClickListener(v->GoModelDiagnostics.clear(app));root.addView(clear);
  new AlertDialog.Builder(a).setTitle("GO diagnostics").setView(root).setPositiveButton("Done",null).show();
 }
}
