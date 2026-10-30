// SPDX-License-Identifier: GPL-3.0-only
package local.maps.gsa;
import android.app.*;import android.content.*;import android.content.res.ColorStateList;import android.graphics.*;import android.graphics.drawable.*;import android.os.*;import android.util.Log;import android.view.*;import android.widget.*;import java.lang.ref.WeakReference;import java.lang.reflect.*;import java.util.*;
/** Private car Live capsule, driven by the SAME native Live controller. */
public final class CarLivePanel {
 private static final String FLOATY="com.google.android.apps.search.assistant.surfaces.voice.robin.ui.floaty.activity.FloatyActivity";
 private static final String VM="com.google.android.apps.search.assistant.surfaces.voice.robin.ui.floaty.ui.content.lrlive.LrFloatyLiveViewModel";
 private static final String GLOW="com.google.android.apps.search.assistant.surfaces.voice.robin.car.ui.batglow.BatGlowView";
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static volatile WeakReference<Object> model=new WeakReference<>(null);
 private static final Map<Activity,Panel> panels=new WeakHashMap<>();
 private static Context context;private static boolean installed;private static volatile String current="NONE",mic="UNKNOWN";private static volatile boolean matched,attached,audioObserved;private static volatile int modelCount,promptCount;
 public static void modelCreated(Object object){try{if(object!=null&&VM.equals(object.getClass().getName())){model=new WeakReference<>(object);modelCount++;}}catch(Exception|LinkageError ignored){}}
 private static boolean enabled(){return context!=null&&context.getSharedPreferences("maps_car_live_lab",0).getBoolean("enabled",true);}
 public static void setEnabled(boolean on){if(context!=null)context.getSharedPreferences("maps_car_live_lab",0).edit().putBoolean("enabled",on).apply();MAIN.post(()->{if(!on)for(Panel p:new ArrayList<>(panels.values()))p.hide();});}
 public static boolean labControl(String action){if(!"mute".equals(action)&&!"end".equals(action))return false;MAIN.post(()->{for(Panel p:new ArrayList<>(panels.values()))if(p.outer!=null){if("mute".equals(action))p.mute();else p.finishNative();break;}});return attached;}
 public static Bundle status(){Bundle b=new Bundle();b.putBoolean("enabled",enabled());b.putBoolean("attached",attached);b.putBoolean("same_native_chat",matched);b.putString("state",current);b.putString("microphone",mic);b.putBoolean("audio_level_observed",audioObserved);b.putInt("model_count",modelCount);b.putInt("lab_prompt_count",promptCount);return b;}
 /** Existing private lab test caller only; no new routing or authentication. */
 public static boolean labPrompt(String text){if(!enabled()||text==null||!(text.equals("What is two plus two?")||text.equals("Navigate by car to Berlin Hauptbahnhof")))return false;Object m=model.get();if(m==null)return false;MAIN.post(()->{try{Object s=field(m,"r");if(s!=null){invoke(s,"h",new Class<?>[]{String.class},text);promptCount++;}}catch(Exception|LinkageError e){Log.i("GsaCarPanel","lab_prompt=UNAVAILABLE");}});return true;}
 private static Object field(Object o,String name)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}
 private static Object invoke(Object o,String name,Class<?>[] types,Object...args)throws Exception{Method m=o.getClass().getMethod(name,types);m.setAccessible(true);return m.invoke(o,args);}
 private static Object value(Object flow)throws Exception{return invoke(flow,"b",new Class<?>[0]);}
 private static Class<?> type(Activity a,String name)throws Exception{return Class.forName(name,true,a.getClassLoader());}
 private static Object en(Activity a,String cls,String name)throws Exception{return Enum.valueOf((Class)type(a,cls),name);}
 private static String micState(Object m)throws Exception{Object v=value(field(m,"C"));return CarStatePolicy.microphone(v);}
 private static boolean conversation(Activity a){try{Intent i=a.getIntent();if(i==null)return false;i.setExtrasClassLoader(a.getClassLoader());Parcelable route=i.getParcelableExtra("robin_router_args");return route!=null&&route.getClass().getName().endsWith("$Floaty$ConversationMode");}catch(RuntimeException|LinkageError unavailable){return false;}}
 private static boolean sameChat(Activity a,Object m)throws Exception{
  Intent intent=a.getIntent();if(intent==null)return false;intent.setExtrasClassLoader(a.getClassLoader());Parcelable route=intent.getParcelableExtra("robin_router_args");if(route==null||!route.getClass().getName().endsWith("$Floaty$ConversationMode"))return false;
  Class<?> idType=type(a,"com.google.android.apps.search.assistant.surfaces.voice.robin.data.ChatControllerId");Object expected=null;
  for(Method getter:route.getClass().getMethods())if(getter.getParameterTypes().length==0&&getter.getReturnType()==idType){expected=getter.invoke(route);break;}
  Object s=field(m,"r");if(s==null||expected==null)return false;
  // Native current session's ChatControllerId; compared in memory, never read/stringified/exported.
  Object actual=field(field(field(field(s,"f"),"t"),"b"),"a");return expected.equals(actual);
 }
 private static void prepare(Activity a){if(!FLOATY.equals(a.getClass().getName())||!enabled()||!conversation(a))return;Panel p=panels.get(a);if(p==null||p.closed){p=new Panel(a);panels.put(a,p);}p.start();}
 public static void install(Application app){if(installed)return;installed=true;context=app.getApplicationContext();app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks(){
  // Post-created runs after the complete native onCreate and before the first window draw.
  public void onActivityPostCreated(Activity a,Bundle b){prepare(a);}
  public void onActivityResumed(Activity a){prepare(a);}
  public void onActivityPaused(Activity a){Panel p=panels.remove(a);if(p!=null)p.close();}
  public void onActivityDestroyed(Activity a){Panel p=panels.remove(a);if(p!=null)p.close();}
  public void onActivityCreated(Activity a,Bundle b){}public void onActivityStarted(Activity a){}public void onActivityStopped(Activity a){}public void onActivitySaveInstanceState(Activity a,Bundle b){}
 });}
 private static final class Panel implements Runnable,ViewTreeObserver.OnPreDrawListener{
  final Activity a;final LiveAudioFocus audioFocus;final long began=SystemClock.uptimeMillis();boolean closed,firstDraw;FrameLayout outer;View glow,original,guardDecor;int originalVisibility;TextView label;Control mute,end;LevelView levels;Object bound,glowPeer;String previous="";
  Panel(Activity a){this.a=a;audioFocus=new LiveAudioFocus(a);}
  int dp(float n){return (int)(n*a.getResources().getDisplayMetrics().density+.5f);}
  void concealOriginal(){View content=a.findViewById(android.R.id.content);if(content==null||content==outer)return;if(original!=content){if(original!=null)original.setVisibility(originalVisibility);original=content;originalVisibility=content.getVisibility();}original.setVisibility(View.INVISIBLE);}
  void start(){if(closed)return;if(guardDecor==null){guardDecor=a.getWindow().getDecorView();guardDecor.getViewTreeObserver().addOnPreDrawListener(this);}concealOriginal();MAIN.removeCallbacks(this);run();}
  public boolean onPreDraw(){if(!closed){concealOriginal();if(!firstDraw){firstDraw=true;Log.i("GsaCarPanel","startup_first_draw="+(outer==null?"WAIT":"CAPSULE")+" native_hidden="+(original!=null&&original.getVisibility()==View.INVISIBLE));}}return true;}
  void originalView(){close();}
  void menu(View anchor){PopupMenu p=new PopupMenu(a,anchor);p.getMenu().add("Standard interface for this session").setOnMenuItemClickListener(item->{originalView();return true;});p.show();}
  void show(Object m)throws Exception{
   ViewGroup decor=(ViewGroup)a.getWindow().getDecorView();int width=Math.min(dp(240),a.getResources().getDisplayMetrics().widthPixels-dp(32));if(width<dp(208))throw new IllegalStateException("Capsule touch targets do not fit");
   outer=new FrameLayout(a);outer.setTag("maps-car-live-14");GradientDrawable bg=new GradientDrawable();bg.setColor(0xff151a25);bg.setCornerRadius(dp(28));outer.setBackground(bg);outer.setClipToOutline(true);outer.setElevation(dp(8));
   glow=(View)type(a,GLOW).getConstructor(Context.class).newInstance(a);glow.setClickable(false);glow.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);outer.addView(glow,new FrameLayout.LayoutParams(-1,-1));invoke(glow,"c",new Class<?>[0]);glowPeer=field(glow,"a");
   LinearLayout content=new LinearLayout(a);content.setGravity(Gravity.CENTER_VERTICAL);content.setPadding(dp(14),dp(4),dp(6),dp(4));levels=new LevelView(a);content.addView(levels,new LinearLayout.LayoutParams(dp(24),dp(28)));
   label=new TextView(a);label.setText("Live");label.setTextSize(20);label.setTextColor(Color.WHITE);label.setPadding(dp(8),0,0,0);label.setGravity(Gravity.CENTER_VERTICAL);content.addView(label,new LinearLayout.LayoutParams(0,-1,1));
   mute=new Control(a,false);end=new Control(a,true);mute.setContentDescription("Pause Gemini Live microphone");end.setContentDescription("End Gemini Live");content.addView(mute,new LinearLayout.LayoutParams(dp(48),dp(48)));content.addView(end,new LinearLayout.LayoutParams(dp(48),dp(48)));outer.addView(content,new FrameLayout.LayoutParams(-1,-1));
   FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(width,dp(56),Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL);android.view.WindowInsets wi=decor.getRootWindowInsets();int bottom=wi==null?0:wi.getInsets(android.view.WindowInsets.Type.systemBars()).bottom;lp.bottomMargin=dp(16)+bottom;decor.addView(outer,lp);
   // Keep native composition/lifecycle in place. Only its presentation is covered while this matching session is ready.
   concealOriginal();
   bound=m;attached=true;mute.setOnClickListener(v->mute());end.setOnClickListener(v->finishNative());label.setContentDescription("Gemini Live. Long press for standard interface");label.setOnLongClickListener(v->{menu(v);return true;});outer.setOnLongClickListener(v->{menu(v);return true;});Log.i("GsaCarPanel","panel=ATTACHED same_chat=true presentation=CAPSULE width="+width+" height="+dp(56));
  }
  void mute(){try{Object m=bound;if(m==null||!sameChat(a,m))return;String state=micState(m);if(!state.equals("MIC_OPEN")&&!state.equals("MIC_CLOSED")&&!state.equals("MIC_MUTED"))return;Object s=field(m,"r");invoke(s,"i",new Class<?>[]{type(a,"apfh")},en(a,"apfh",state.equals("MIC_OPEN")?"MIC_MUTED":"MIC_OPEN"));}catch(Exception|LinkageError e){hide();}}
  void finishNative(){try{Object m=bound;if(m!=null&&sameChat(a,m))invoke(m,"b",new Class<?>[0]);}catch(Exception|LinkageError e){hide();}}
  public void run(){if(closed)return;if(a.isFinishing()||a.isDestroyed()){close();return;}try{
    if(!enabled()||!conversation(a)){close();return;}
    Object m=model.get();if(m==null||!sameChat(a,m)){
     matched=false;
     // Hide only presentation while the native matching model starts; never leave a blank window indefinitely.
     if(outer==null&&SystemClock.uptimeMillis()-began<2000)concealOriginal();
     else{close();Log.i("GsaCarPanel","panel=FALLBACK reason=MODEL_NOT_READY");return;}
    }else{
     matched=true;Object s=value(field(m,"G"));String microphone=micState(m);String state=s==null?"UNSUPPORTED":CarStatePolicy.state(s.getClass().getName(),microphone);mic=microphone;current=state;
     if("UNSUPPORTED".equals(state)||"ENDED".equals(state)||"ERROR".equals(state)){close();return;}else{
      if(outer==null||bound!=m){removeOverlay();show(m);}audioFocus.update(state,microphone);mute.setEnabled(!state.equals("ENDED")&&!state.equals("ERROR")&&!microphone.equals("UNKNOWN"));mute.paused=!microphone.equals("MIC_OPEN");mute.setContentDescription(mute.paused?"Resume Gemini Live microphone":"Pause Gemini Live microphone");mute.invalidate();
      invoke(glow,"b",new Class<?>[]{type(a,"anes")},en(a,"anes",CarStatePolicy.glow(state)));
      Object level=value(field(m,"t"));if(level instanceof Number){float f=((Number)level).floatValue();if(!Float.isNaN(f)&&!Float.isInfinite(f)){audioObserved|=f>0;int n=(int)Math.max(0,Math.min(100,f<=1?f*100:f));invoke(glowPeer,"e",new Class<?>[]{int.class},n);levels.level=microphone.equals("MIC_OPEN")?n:0;levels.invalidate();}}
      if(!previous.equals(state)){previous=state;outer.setContentDescription("Gemini Live. "+CarStatePolicy.title(state));Log.i("GsaCarPanel","state="+state+" mic="+microphone);}
     }
    }
   }catch(Exception|LinkageError e){hide();Log.i("GsaCarPanel","panel=FALLBACK type="+e.getClass().getSimpleName());closed=true;return;}
   if(!closed)MAIN.postDelayed(this,outer==null?16:120);
  }
  void removeOverlay(){if(outer!=null){ViewParent parent=outer.getParent();if(parent instanceof ViewGroup)((ViewGroup)parent).removeView(outer);outer=null;}bound=null;glow=null;glowPeer=null;levels=null;attached=false;}
  void hide(){audioFocus.close();removeOverlay();if(guardDecor!=null){ViewTreeObserver observer=guardDecor.getViewTreeObserver();if(observer.isAlive())observer.removeOnPreDrawListener(this);guardDecor=null;}if(original!=null){original.setVisibility(originalVisibility);original=null;}}
  void close(){closed=true;MAIN.removeCallbacks(this);hide();}
 }
 /** Drawn controls keep 48dp circular touch/ripple targets without a large button row. */
 private static final class Control extends View{
  final Paint paint=new Paint(3);final boolean close;boolean paused;
  Control(Context c,boolean close){super(c);this.close=close;setFocusable(true);setClickable(true);GradientDrawable mask=new GradientDrawable();mask.setShape(GradientDrawable.OVAL);mask.setColor(Color.WHITE);setBackground(new RippleDrawable(ColorStateList.valueOf(0x446b8fff),null,mask));}
  @Override public CharSequence getAccessibilityClassName(){return Button.class.getName();}
  protected void onDraw(Canvas c){super.onDraw(c);float d=getResources().getDisplayMetrics().density,x=getWidth()/2f,y=getHeight()/2f;paint.setColor(isEnabled()?Color.WHITE:0xff858a99);paint.setStrokeWidth(2*d);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStyle(Paint.Style.STROKE);
   if(close){c.drawLine(x-5*d,y-5*d,x+5*d,y+5*d,paint);c.drawLine(x+5*d,y-5*d,x-5*d,y+5*d,paint);}else if(paused){Path p=new Path();p.moveTo(x-4*d,y-7*d);p.lineTo(x+6*d,y);p.lineTo(x-4*d,y+7*d);p.close();paint.setStyle(Paint.Style.FILL);c.drawPath(p,paint);}else{paint.setStrokeWidth(3*d);c.drawLine(x-3*d,y-6*d,x-3*d,y+6*d,paint);c.drawLine(x+3*d,y-6*d,x+3*d,y+6*d,paint);}
  }
 }
 /** Level comes only from the current native Live model; no synthetic animation timer. */
 private static final class LevelView extends View{
  final Paint paint=new Paint(3);int level;
  LevelView(Context c){super(c);setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);}
  protected void onDraw(Canvas c){float d=getResources().getDisplayMetrics().density;paint.setColor(Color.WHITE);paint.setStrokeWidth(2*d);paint.setStrokeCap(Paint.Cap.ROUND);float x=getWidth()/2f,y=getHeight()/2f;for(int i=0;i<4;i++){float h=(2+((i==1||i==2)?3:0)+level/25f)*d;c.drawLine(x+(i-1.5f)*4*d,y-h,x+(i-1.5f)*4*d,y+h,paint);}}
 }
}
