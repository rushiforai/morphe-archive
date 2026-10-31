package xyz.urro.transit;

import android.app.*;
import android.content.*;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import java.util.*;

/** Local replay of the Android GO presentation boundary, not a replacement navigation engine. */
public final class GoSimulation {
 static final SimulationState state=new SimulationState();
 static boolean delivering,external;
 private static final String TAG="GO simulation — NOT navigation";
 private static final int NOTIFICATION_ID=0x47534d;
 private static final Handler main=new Handler(Looper.getMainLooper());
 private static LinearLayout panel,cardHost;
 private static TextView status;
 private static Object builder;
 private static Activity owner;
 private static MotionSession dry=new MotionSession();
 private static boolean realLive;
 private static final Runnable tick=new Runnable(){public void run(){if(!state.active)return;updateStatus();main.postDelayed(this,1000);}};
 static boolean enabled;
 public static void enable(){enabled=true;}
 static void realModel(Object data){if(!delivering){realLive=data!=null;if(realLive&&state.active)stop();}}
 static long clock(){return SystemClock.elapsedRealtime()+state.advanceMs;}
 static void control(String key,boolean on){
  log("motion_desire", "active="+on+" external="+external);
  if(external){MotionController.get(TransitHooks.appContext()).desire(key,on);return;}
  long token=dry.desire(key,on);MotionSession.Action action=dry.next(token);
  log("dry_decision",dry.decision(token)+" "+dry.diagnostic());
  if(action!=MotionSession.Action.NONE&&dry.dispatched(token,action,clock())){
   log("dry_dispatch",action.name());dry.observe(action==MotionSession.Action.START?MotionSession.State.ON:MotionSession.State.OFF,clock()+1);
   log("dry_confirmation",dry.diagnostic());
  }
 }
 private static void log(String event,String detail){GoModelDiagnostics.trace("simulation_"+event,detail);android.util.Log.i("TransitSimulation",event+" "+detail);}
 private static Class<?> cls(String name)throws Exception{return Class.forName(name,false,TransitHooks.appContext().getClassLoader());}
 private static Object make(String name,Object... args)throws Exception{
  Class<?> c=cls(name.contains(".")?name:"djinni.java.src."+name);
  for(Constructor<?> k:c.getConstructors())if(k.getParameterTypes().length==args.length)return k.newInstance(args);
  throw new NoSuchMethodException(name);
 }
 private static Object color()throws Exception{return cls("com.thetransitapp.droid.shared.model.cpp.Colors").getField("Q").get(null);}
 private static Object smart(String text)throws Exception{return make("com.thetransitapp.droid.shared.model.cpp.SmartString",text);}
 private static Object model()throws Exception{
  Object s=smart(state.instruction());
  Object a=make("Accessibility",smart(TAG),null,new ArrayList<>(),new ArrayList<>());
  Object background=make("Background",make("BackgroundStyle",color(),Enum.valueOf((Class)cls("djinni.java.src.BackgroundEffect"),"Flat_Flat")),make("Padding",0,0,0,0),0,Enum.valueOf((Class)cls("djinni.java.src.BackgroundShape"),"Rectangle"),null);
  Object instruction=make("GOLiveActivityInstruction",null,null,null,null,smart(TAG),s,color());
  Object live=make("GOLiveActivity",instruction,null,null,background,a);
  return make("GOLiveActivityPlatformData",live,false,null,live,null);
 }
 private static Object card()throws Exception{
  Object a=make("Accessibility",smart(TAG),null,new ArrayList<>(),new ArrayList<>());
  return make("TripDetailsBigInstructionCard",new ArrayList<>(),null,smart(state.instruction()),null,a,Long.valueOf(-100-state.generation));
 }
 private static Object unit()throws Exception{return cls("kotlin.Unit").getField("a").get(null);}
 private static Object function(Class<?> type,InvocationHandler h){return Proxy.newProxyInstance(type.getClassLoader(),new Class<?>[]{type},(p,m,args)->{
  if(m.getName().equals("toString"))return "GO simulation callback";
  if(m.getName().equals("hashCode"))return System.identityHashCode(p);
  if(m.getName().equals("equals"))return p==args[0];
  return h.invoke(p,m,args);
 });}
 private static void renderCard()throws Exception{
  // Render the same composable used by the real GO instruction pager; no test TextView formatter.
  final Object card=card();
  Class<?> viewClass=cls("androidx.compose.ui.platform.ComposeView");
  View view=(View)viewClass.getConstructor(Context.class,android.util.AttributeSet.class).newInstance(owner,null);
  Method set=null;for(Method m:viewClass.getMethods())if(m.getName().equals("setContent")&&m.getParameterCount()==1)set=m;
  if(set==null)throw new NoSuchMethodException("ComposeView.setContent");
  Method render=null;for(Method m:cls("com.thetransitapp.droid.trip_details.ui.b").getMethods())if(m.getName().equals("e")&&m.getParameterCount()==6)render=m;
  if(render==null)throw new NoSuchMethodException("GO card renderer");
  final Method r=render;final Object modifier=cls("kl6").getField("a").get(null);
  final Object callback=function(r.getParameterTypes()[2],(p,m,args)->unit());
  Object content=function(set.getParameterTypes()[0],(p,m,args)->{
   if(!m.getName().equals("invoke"))return unit();
   try{r.invoke(null,false,card,callback,modifier,args[0],0);log("card_render","phase="+state.phase+" stops="+state.stops);}
   catch(InvocationTargetException e){log("card_error",e.getCause().toString());throw e.getCause();}
   return unit();
  });
  cardHost.removeAllViews();cardHost.addView(view,new LinearLayout.LayoutParams(-1,-2));set.invoke(view,content);
 }
 private static String readText(View v){StringBuilder out=new StringBuilder();if(v instanceof TextView)out.append(((TextView)v).getText());if(v instanceof ViewGroup)for(int i=0;i<((ViewGroup)v).getChildCount();i++){String text=readText(((ViewGroup)v).getChildAt(i));if(!text.isEmpty())out.append(" | ").append(text);}return out.toString();}
 private static void publish()throws Exception{
  if(builder==null){
   builder=cls("com.thetransitapp.droid.shared.service.GoService").getConstructor().newInstance();
   Method attach=ContextWrapper.class.getDeclaredMethod("attachBaseContext",Context.class);attach.setAccessible(true);attach.invoke(builder,TransitHooks.appContext());
  }
  Object data=model();delivering=true;
  try{
   Notification n=(Notification)builder.getClass().getMethod("a",data.getClass()).invoke(builder,data);
   if(n.contentView!=null){View rendered=n.contentView.apply(TransitHooks.appContext(),null);log("remote_view_final",readText(rendered));}
   n.flags|=Notification.FLAG_ONLY_ALERT_ONCE;n.extras.putString(Notification.EXTRA_SUB_TEXT,TAG);
   TransitHooks.appContext().getSystemService(NotificationManager.class).notify("go-simulation",NOTIFICATION_ID,n);
   log("notification_final","text="+n.extras.getCharSequence(Notification.EXTRA_TITLE)+" stops="+state.stops+" bike="+TransitHooks.prefs().getBoolean("bike",false));
  }finally{delivering=false;}
 }
 static void refresh(){if(state.active)main.post(GoSimulation::emit);}
 private static void emit(){
  if(!state.active)return;
  log("transition","generation="+state.generation+" phase="+state.phase+" aboard="+state.onboard()+" stops="+state.stops+" bike="+TransitHooks.prefs().getBoolean("bike",false));
  try{publish();renderCard();updateStatus();}catch(Exception e){log("error",android.util.Log.getStackTraceString(e));if(status!=null)status.setText("Simulation error: "+e);stop();}
 }
 private static void updateStatus(){if(status!=null)status.setText(TAG+"\n"+state.phase+" · "+state.stops+" stops · "+(external?"REAL Motion Cues commands enabled":"DRY RUN — no external commands")+"\n"+GoMotionAdapter.simulationStatus());}
 private static void start(){
  boolean realNotification=false;for(android.service.notification.StatusBarNotification n:TransitHooks.appContext().getSystemService(NotificationManager.class).getActiveNotifications())if("go_mode".equals(n.getNotification().getChannelId())&&!"go-simulation".equals(n.getTag()))realNotification=true;
  if(realLive||realNotification){new AlertDialog.Builder(owner).setMessage("End the real GO trip before starting simulation.").setPositiveButton("OK",null).show();return;}
  if(state.active)return;
  GoMotionAdapter.stop();state.start();external=false;dry=new MotionSession();dry.observe(MotionSession.State.OFF,clock()-1);
  TransitHooks.prefs().edit().putBoolean("diagnostics",true).apply();
  log("enabled","model replay; external=false");emit();main.removeCallbacks(tick);main.postDelayed(tick,1000);
 }
 public static void stop(){
  if(!state.active)return;
  // Release while external mode still carries the ownership of this session.
  GoMotionAdapter.stopSimulation();state.stop();external=false;main.removeCallbacks(tick);
  TransitHooks.appContext().getSystemService(NotificationManager.class).cancel("go-simulation",NOTIFICATION_ID);
  builder=null;log("disabled","normal GO inputs restored");if(cardHost!=null)cardHost.removeAllViews();updateStatus();
 }
 static void close(Activity a){if(owner==a){stop();if(panel!=null&&panel.getParent() instanceof ViewGroup)((ViewGroup)panel.getParent()).removeView(panel);panel=null;owner=null;}}
 private static void button(LinearLayout group,String label,Runnable action){Button b=new Button(owner);b.setText(label);b.setOnClickListener(v->action.run());group.addView(b,new LinearLayout.LayoutParams(-1,-2));}
 public static void show(Activity a){
  if(panel!=null){if(owner==a)return;close(owner);}owner=a;
  panel=new LinearLayout(a);panel.setOrientation(1);panel.setPadding(20,40,20,20);panel.setBackgroundColor(0xfff5f5f5);
  status=new TextView(a);status.setTextColor(0xff111111);panel.addView(status);
  cardHost=new LinearLayout(a);cardHost.setOrientation(1);panel.addView(cardHost);
  ScrollView scroll=new ScrollView(a);LinearLayout controls=new LinearLayout(a);controls.setOrientation(1);scroll.addView(controls);panel.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
  button(controls,"Start simulation",GoSimulation::start);
  Switch bike=new Switch(a);bike.setText("Bike mode");bike.setChecked(TransitHooks.prefs().getBoolean("bike",false));bike.setOnCheckedChangeListener((v,on)->{TransitHooks.prefs().edit().putBoolean("bike",on).apply();refresh();});controls.addView(bike);
  button(controls,"Wait until departure time",()->transition(SimulationState.Phase.WAIT_TO_LEAVE));
  button(controls,"Walk to bus stop",()->transition(SimulationState.Phase.WALK_TO_STOP));
  button(controls,"Wait at bus stop",()->transition(SimulationState.Phase.WAITING));
  button(controls,"Boarding (not yet confirmed riding)",()->transition(SimulationState.Phase.BOARDING));
  button(controls,"Confirmed riding",()->transition(SimulationState.Phase.RIDING));
  button(controls,"Advance stop",()->{if(state.active){state.remaining(Math.max(0,state.stops-1));emit();}});
  button(controls,"Set remaining stops",()->{EditText n=new EditText(a);n.setInputType(2);n.setText(String.valueOf(state.stops));new AlertDialog.Builder(a).setTitle("Remaining stops (0–99)").setView(n).setPositiveButton("Set",(d,w)->{try{if(state.active){state.remaining(Integer.parseInt(n.getText().toString()));emit();}}catch(IllegalArgumentException e){android.widget.Toast.makeText(a,"Use 0–99",0).show();}}).setNegativeButton("Cancel",null).show();});
  button(controls,"Next stop",()->transition(SimulationState.Phase.NEXT));
  button(controls,"Final stop reminder",()->transition(SimulationState.Phase.CURRENT));
  button(controls,"Destination reached",()->transition(SimulationState.Phase.ARRIVED));
  button(controls,"Alight",()->transition(SimulationState.Phase.ALIGHTED));
  button(controls,"Walk to destination",()->transition(SimulationState.Phase.WALK_TO_DESTINATION));
  button(controls,"Advance test clock by 45 seconds",()->{if(state.active){state.advanceMs+=45000;GoMotionAdapter.simulationTick();updateStatus();}});
  button(controls,"Dry run: manually activate cues",()->{if(state.active&&!external){dry.observe(MotionSession.State.ON,clock()+2);log("dry_manual",dry.diagnostic());}});
  button(controls,"Opt in to REAL Motion Cues commands",()->{
   if(!state.active||external)return;
   new AlertDialog.Builder(a).setTitle("Real external commands").setMessage("This simulated session may open Motion Cues and start cues. Existing ownership checks remain in force. Restart simulation to return to dry run.").setPositiveButton("Enable",(d,w)->{GoMotionAdapter.stopSimulation();external=true;TransitHooks.checkPermissionsPrompt(true);emit();}).setNegativeButton("Cancel",null).show();
  });
  button(controls,"Stop simulation / cancel GO",GoSimulation::stop);
  button(controls,"Close testing panel",()->close(a));
  ((ViewGroup)a.findViewById(android.R.id.content)).addView(panel,new ViewGroup.LayoutParams(-1,-1));updateStatus();if(state.active)emit();
 }
 private static void transition(SimulationState.Phase p){if(state.active){state.phase(p);emit();}}
}
