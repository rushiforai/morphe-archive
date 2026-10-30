// SPDX-License-Identifier: GPL-3.0-only
package local.maps.gsa;
import android.app.*;import android.os.*;import android.content.*;import android.graphics.*;import android.graphics.drawable.*;import android.util.Log;import android.view.*;import android.widget.*;import java.lang.reflect.*;import java.util.*;import java.lang.ref.WeakReference;
/** Ordinary voice input presentation only. Native response cards and Maps actions stay intact. */
public final class CarVoiceStrip {
 private static final String FLOATY="com.google.android.apps.search.assistant.surfaces.voice.robin.ui.floaty.activity.FloatyActivity";
 private static final String ROOT="com.google.android.apps.search.assistant.surfaces.voice.robin.ui.floaty.ui.";
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static final Map<Activity,Strip> strips=new WeakHashMap<>();
 private static final Map<Activity,Models> ownedModels=new WeakHashMap<>();private static WeakReference<Activity> nativeOwner=new WeakReference<>(null);private static WeakReference<Activity> lastFloaty=new WeakReference<>(null);private static volatile int finishCount;private static volatile long finishAt;
 private static final class Models{WeakReference<Object> input=new WeakReference<>(null),page=new WeakReference<>(null);}
 /** Constructor-only observer. Bind native instances to their actual current Floaty lifecycle owner. */
 public static void modelCreated(Object model){if(model==null||Looper.myLooper()!=Looper.getMainLooper())return;Activity owner=nativeOwner.get();if(owner==null||owner.isDestroyed()||!FLOATY.equals(owner.getClass().getName()))return;String name=model.getClass().getName();boolean input=(ROOT+"common.input.FloatyInputViewModel").equals(name),page=(ROOT+"content.host.FloatyPageContainerViewModel").equals(name);if(!input&&!page)return;Models m=ownedModels.get(owner);if(m==null){m=new Models();ownedModels.put(owner,m);}if(input)m.input=new WeakReference<>(model);else m.page=new WeakReference<>(model);Log.i("GsaVoiceStrip","native_model="+(input?"INPUT":"PAGE")+" owner=FLOATY");}
 private static void owner(Activity a){boolean own=FLOATY.equals(a.getClass().getName());nativeOwner=new WeakReference<>(own?a:null);if(own)lastFloaty=new WeakReference<>(a);}
 private static Application app;private static boolean installed;private static volatile String last="NONE";private static volatile boolean attached,responseRestored;private static volatile long at;
 private static boolean enabled(){return app!=null&&app.getSharedPreferences("maps_car_live_lab",0).getBoolean("enabled",true);}
 public static void modeApplied(Activity a,String mode){if(!FLOATY.equals(a.getClass().getName()))return;Strip old=strips.remove(a);if(old!=null)old.close();if(!"microphone".equals(mode)||!enabled())return;Strip s=new Strip(a);strips.put(a,s);Log.i("GsaVoiceStrip","mode_armed=MICROPHONE window_id="+System.identityHashCode(a));MAIN.post(()->{if(nativeOwner.get()==a&&a.hasWindowFocus())s.start();});}
 /** Private same-lab-signer teardown: finish only this app's last Floaty Activity, never a global assistant API. */
 public static boolean labEnd(){Activity a=lastFloaty.get();if(a==null||a.isDestroyed()||a.isFinishing()||!FLOATY.equals(a.getClass().getName()))return false;MAIN.post(()->{if(a.isDestroyed()||a.isFinishing())return;Strip s=strips.remove(a);if(s!=null)s.close();a.finish();finishCount++;finishAt=SystemClock.elapsedRealtime();Log.i("GsaVoiceStrip","lab_end=FINISH_OWN_FLOATY");});return true;}
 public static Bundle status(){Bundle b=new Bundle();b.putBoolean("voice_strip_attached",attached);b.putString("voice_strip_state",last);b.putBoolean("voice_native_response_restored",responseRestored);b.putLong("voice_strip_at",at);b.putInt("voice_finish_count",finishCount);b.putLong("voice_finish_at",finishAt);return b;}
 public static void install(Application a){if(installed)return;installed=true;app=a;a.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks(){
  void start(Activity a){Strip s=strips.get(a);if(s!=null)s.start();}
  public void onActivityPreCreated(Activity a,Bundle b){owner(a);}public void onActivityPostCreated(Activity a,Bundle b){owner(a);start(a);}public void onActivityResumed(Activity a){owner(a);start(a);}
  public void onActivityPaused(Activity a){if(nativeOwner.get()==a)nativeOwner.clear();Strip s=strips.get(a);if(s!=null)s.suspend();}public void onActivityDestroyed(Activity a){if(nativeOwner.get()==a)nativeOwner.clear();Strip s=strips.remove(a);if(s!=null)s.close();ownedModels.remove(a);}
  public void onActivityCreated(Activity a,Bundle b){}public void onActivityStarted(Activity a){}public void onActivityStopped(Activity a){}public void onActivitySaveInstanceState(Activity a,Bundle b){}
 });}
 private static Object field(Object o,String name)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}
 private static Object call(Object o,String name,Class<?>[] types,Object...args)throws Exception{Method m=o.getClass().getMethod(name,types);m.setAccessible(true);return m.invoke(o,args);}
 private static Object value(Object o)throws Exception{return call(o,"b",new Class<?>[0]);}
 private static boolean conversation(Activity a){Intent i=a.getIntent();if(i==null)return false;i.setExtrasClassLoader(a.getClassLoader());Parcelable route=i.getParcelableExtra("robin_router_args");return route!=null&&route.getClass().getName().endsWith("$Floaty$ConversationMode");}
 private static final class Strip implements Runnable,ViewTreeObserver.OnPreDrawListener {
  final Activity a;final long armedAt=SystemClock.uptimeMillis();long began;boolean started,closed,firstDraw;View original,decor;int visibility;FrameLayout overlay;TextView label;Glow glow;String previous="";int previousModels=-1;
  Strip(Activity a){this.a=a;}
  int dp(float n){return Math.round(n*a.getResources().getDisplayMetrics().density);}
  void start(){if(started||closed)return;try{if(!enabled()||conversation(a)||SystemClock.uptimeMillis()-armedAt>30000){close();return;}started=true;began=SystemClock.uptimeMillis();Log.i("GsaVoiceStrip","lifecycle=START window_id="+System.identityHashCode(a));responseRestored=false;decor=a.getWindow().getDecorView();decor.getViewTreeObserver().addOnPreDrawListener(this);conceal();run();}catch(Exception|LinkageError e){fallback(e.getClass().getSimpleName());}}
  void conceal(){View v=a.findViewById(android.R.id.content);if(v==null||v==overlay)return;if(original!=v){if(original!=null)original.setVisibility(visibility);original=v;visibility=v.getVisibility();}v.setVisibility(View.INVISIBLE);}
  public boolean onPreDraw(){if(!closed){conceal();if(!firstDraw){firstDraw=true;Log.i("GsaVoiceStrip","first_draw=STRIP_OR_WAIT native_hidden="+(original!=null&&original.getVisibility()==View.INVISIBLE));}}return true;}
  String[] nativeState()throws Exception{
   Models models=ownedModels.get(a);Object input=models==null?null:models.input.get(),page=models==null?null:models.page.get();
   int found=(input==null?0:1)+(page==null?0:1);if(found!=previousModels){previousModels=found;Log.i("GsaVoiceStrip","native_models="+found+" owner_scope=true");}
   String mic="UNKNOWN",name="UNKNOWN";
   if(input!=null){Object controls=value(field(input,"Q"));Object m=field(controls,"b");mic=m==null?"UNKNOWN":m.getClass().getName();}
   if(page!=null){Object nav=value(field(field(page,"g"),"a"));if(nav!=null){int code=((Number)field(nav,"c")).intValue();Method enumMethod=Class.forName("bnjf",true,a.getClassLoader()).getMethod("a",int.class);enumMethod.setAccessible(true);Object en=enumMethod.invoke(null,code);if(en instanceof Enum)name=((Enum<?>)en).name();}}
   return new String[]{name,mic};
  }
  void show(){if(overlay!=null)return;ViewGroup root=(ViewGroup)decor;int width=Math.min(dp(560),root.getWidth()-dp(48));if(width<dp(240))width=Math.min(dp(560),a.getResources().getDisplayMetrics().widthPixels-dp(48));if(width<dp(240))throw new IllegalStateException("Voice strip does not fit");
   overlay=new FrameLayout(a);overlay.setTag("maps-car-voice-strip-18");LinearLayout chip=new LinearLayout(a);chip.setGravity(Gravity.CENTER_VERTICAL);chip.setPadding(dp(16),0,0,0);GradientDrawable bg=new GradientDrawable();bg.setColor(0xef161a23);bg.setCornerRadius(dp(24));chip.setBackground(bg);label=new TextView(a);label.setTextColor(Color.WHITE);label.setTextSize(18);label.setMaxLines(1);label.setText("Starting microphone…");chip.addView(label,new LinearLayout.LayoutParams(-2,dp(48)));
   Close close=new Close(a);close.setContentDescription("Close Gemini voice input");close.setOnClickListener(v->a.onBackPressed());chip.addView(close,new LinearLayout.LayoutParams(dp(48),dp(48)));FrameLayout.LayoutParams ch=new FrameLayout.LayoutParams(-2,dp(48),Gravity.TOP|Gravity.CENTER_HORIZONTAL);overlay.addView(chip,ch);glow=new Glow(a);FrameLayout.LayoutParams gl=new FrameLayout.LayoutParams(-1,dp(22),Gravity.BOTTOM);overlay.addView(glow,gl);
   FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(width,dp(82),Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL);WindowInsets wi=root.getRootWindowInsets();lp.bottomMargin=dp(10)+(wi==null?0:wi.getInsets(WindowInsets.Type.systemBars()).bottom);root.addView(overlay,lp);attached=true;overlay.setContentDescription("Gemini voice input");chip.setOnLongClickListener(v->{close();return true;});Log.i("GsaVoiceStrip","panel=ATTACHED presentation=THIN_STRIP width="+width+" height="+dp(82));
  }
  public void run(){if(closed)return;if(a.isFinishing()||a.isDestroyed()||!enabled()){close();return;}try{if(conversation(a)){close();return;}String[] n=nativeState();String state=VoiceStripPolicy.state(n[0],n[1],SystemClock.uptimeMillis()-began);last=state;at=SystemClock.elapsedRealtime();
   if(!previous.equals(state)){previous=state;Log.i("GsaVoiceStrip","state="+state+" native_page="+n[0]+" native_mic="+n[1]);}
   if("RESPONSE".equals(state)){responseRestored=true;close();Log.i("GsaVoiceStrip","native_response=RESTORED native_cards_and_actions=UNCHANGED");return;}
   if("NATIVE".equals(state)||"FALLBACK".equals(state)){close();return;}
   show();label.setText("LISTENING".equals(state)?"Listening…":"PROCESSING".equals(state)?"Thinking…":"Starting microphone…");glow.processing="PROCESSING".equals(state);glow.invalidate();conceal();MAIN.postDelayed(this,"STARTING".equals(state)?16:80);
  }catch(Exception|LinkageError e){fallback(e.getClass().getSimpleName());}}
  void fallback(String reason){Log.i("GsaVoiceStrip","panel=FALLBACK type="+reason);last="FALLBACK";at=SystemClock.elapsedRealtime();close();}
  void suspend(){if(closed)return;Log.i("GsaVoiceStrip","lifecycle=PAUSE window_id="+System.identityHashCode(a));started=false;clearPresentation();}
  void close(){closed=true;clearPresentation();}
  void clearPresentation(){MAIN.removeCallbacks(this);if(decor!=null){ViewTreeObserver o=decor.getViewTreeObserver();if(o.isAlive())o.removeOnPreDrawListener(this);decor=null;}if(overlay!=null){ViewParent p=overlay.getParent();if(p instanceof ViewGroup)((ViewGroup)p).removeView(overlay);overlay=null;}if(original!=null){original.setVisibility(visibility);original=null;}attached=false;}
 }
 private static final class Glow extends View{final Paint p=new Paint(3);boolean processing;Glow(Context c){super(c);setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);setLayerType(LAYER_TYPE_SOFTWARE,null);}protected void onDraw(Canvas c){float d=getResources().getDisplayMetrics().density,y=getHeight()/2f;int color=processing?0xff797cff:0xff4d9cff;p.setShader(new LinearGradient(0,0,getWidth(),0,new int[]{0x004d9cff,color,0xffc7e1ff,color,0x004d9cff},new float[]{0,.2f,.5f,.8f,1},Shader.TileMode.CLAMP));p.setStrokeCap(Paint.Cap.ROUND);p.setStrokeWidth(3*d);p.setShadowLayer(7*d,0,0,color);c.drawLine(8*d,y,getWidth()-8*d,y,p);}}
 private static final class Close extends View{final Paint p=new Paint(3);Close(Context c){super(c);setFocusable(true);setClickable(true);GradientDrawable mask=new GradientDrawable();mask.setShape(GradientDrawable.OVAL);mask.setColor(Color.WHITE);setBackground(new RippleDrawable(android.content.res.ColorStateList.valueOf(0x447799cc),null,mask));}public CharSequence getAccessibilityClassName(){return Button.class.getName();}protected void onDraw(Canvas c){float d=getResources().getDisplayMetrics().density,x=getWidth()/2f,y=getHeight()/2f;p.setColor(Color.WHITE);p.setStrokeWidth(2*d);p.setStrokeCap(Paint.Cap.ROUND);c.drawLine(x-5*d,y-5*d,x+5*d,y+5*d,p);c.drawLine(x+5*d,y-5*d,x-5*d,y+5*d,p);}}
}
