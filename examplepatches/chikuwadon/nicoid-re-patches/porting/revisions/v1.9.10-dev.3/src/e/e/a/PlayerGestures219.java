package e.e.a;
import android.app.*;import android.content.*;import android.content.pm.ActivityInfo;import android.graphics.Rect;import android.os.*;import android.preference.*;import android.view.*;import android.widget.*;import java.lang.ref.WeakReference;import java.lang.reflect.*;import java.util.WeakHashMap;
/** Own only optional gestures; replay a confirmed single tap to the unchanged native listener. */
public final class PlayerGestures219 {
 public static final String QUIET="gesture_quiet_controls",MINI="gesture_swipe_background",POPUP="gesture_swipe_popup",FULL="gesture_swipe_fullscreen",EXIT="gesture_swipe_exit_fullscreen";
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static final WeakHashMap<Activity,State> STATES=new WeakHashMap<Activity,State>();
 private static final class State{WeakReference<Activity> activity;WeakReference<Object> owner,player;MotionEvent down,up;Runnable single;float x,y;long time,lastUp;String id;int side;boolean quiet,candidate,claimed,doubleTap,held,holding,replaying;boolean portrait,upEnabled,downEnabled;}
 private PlayerGestures219(){}
 static Object ref(WeakReference<Object> value){return value==null?null:value.get();}
 static Object get(Object o,String n)throws Exception{return Playback214.get(o,n);}
 static View video(Object owner)throws Exception{return (View)get(owner,"a0");}
 static boolean flag(Object owner,String n){try{return Boolean.TRUE.equals(get(owner,n));}catch(Exception e){return false;}}
 static State state(Activity a){State s=STATES.get(a);if(s==null){s=new State();s.activity=new WeakReference<Activity>(a);STATES.put(a,s);}return s;}
 static boolean pref(Activity a,String k){SharedPreferences p=PreferenceManager.getDefaultSharedPreferences(a);return MINI.equals(k)?PlaybackDefaults229.mini(p):p.getBoolean(k,false);}
 static boolean interactive(View view,float x,float y){if(!view.isShown())return false;Rect r=new Rect();if(!view.getGlobalVisibleRect(r)||!r.contains((int)x,(int)y))return false;
  if(view instanceof Button||view instanceof ImageButton||view instanceof SeekBar||view instanceof EditText||view instanceof TextView&&view.isClickable())return true;
  if(view instanceof ViewGroup){ViewGroup g=(ViewGroup)view;for(int i=g.getChildCount()-1;i>=0;i--)if(interactive(g.getChildAt(i),x,y))return true;}return false;
 }
 static void recycle(State s){if(s.down!=null){s.down.recycle();s.down=null;}if(s.up!=null){s.up.recycle();s.up=null;}}
 static void cancelSingle(State s){if(s.single!=null){MAIN.removeCallbacks(s.single);s.single=null;}if(s.up!=null){s.up.recycle();s.up=null;}}
 public static boolean touch(Activity a,MotionEvent e){if(HorizontalSeek233.touch(a,e))return true;State s=STATES.get(a);if(s==null){if(e.getActionMasked()!=MotionEvent.ACTION_DOWN)return legacy(a,e);SharedPreferences p=PreferenceManager.getDefaultSharedPreferences(a);if(!MiniSession225.wasExpanded(a)&&!p.getBoolean(QUIET,false)&&!PlaybackDefaults229.mini(p)&&!p.getBoolean(POPUP,false)&&!p.getBoolean(FULL,false)&&!p.getBoolean(EXIT,false))return legacy(a,e);s=state(a);}if(s.replaying)return false;
  try{if(HoldSpeed.cancelling(a))return false;if(ModernShorts.active(a)||PlaybackTransfer221.retaining(a))return legacy(a,e);
   int action=e.getActionMasked();float density=a.getResources().getDisplayMetrics().density;
   if(action==MotionEvent.ACTION_DOWN){
    Object owner=get(a,"v");View video=owner==null?null:video(owner);Rect r=new Rect();
    boolean eligible=!flag(owner,"x0")&&video!=null&&video.isShown()&&video.getGlobalVisibleRect(r)&&r.contains((int)e.getRawX(),(int)e.getRawY())&&GestureRules219.start(e.getRawX()-r.left,e.getRawY()-r.top,r.width(),r.height(),density)&&!interactive(a.getWindow().getDecorView(),e.getRawX(),e.getRawY());
    if(!eligible){flush(s);s.candidate=false;s.quiet=false;return legacy(a,e);}
    boolean portrait=a.getResources().getConfiguration().orientation==1&&!flag(owner,"B0");
    boolean landscape=a.getResources().getConfiguration().orientation==2&&(flag(owner,"B0")||!flag(owner,"r0"));
    boolean up=portrait&&pref(a,FULL),down=portrait&&(MiniSession225.wasExpanded(a)||pref(a,MINI)||pref(a,POPUP))||landscape&&pref(a,EXIT);
    boolean quiet=pref(a,QUIET)&&!PlayerControlsDock.enabled(a);
    int side=e.getRawX()<r.exactCenterX()?-1:1;
    boolean second=quiet&&seekEnabled(a)&&s.single!=null&&validOwner(s,a)&&ref(s.owner)==owner&&ref(s.player)==video&&e.getEventTime()-s.lastUp<=ViewConfiguration.getDoubleTapTimeout()&&s.side==side&&Math.hypot(e.getRawX()-s.x,e.getRawY()-s.y)<ViewConfiguration.get(a).getScaledDoubleTapSlop();
    if(second){cancelSingle(s);recycle(s);s.doubleTap=seek(a,video,side);s.time=e.getDownTime();s.quiet=true;s.candidate=false;s.held=false;HoldSpeed.stop(a);return true;}
    flush(s);recycle(s);s.owner=new WeakReference<Object>(owner);s.player=new WeakReference<Object>(video);s.id=String.valueOf(get(owner,"b0"));s.x=e.getRawX();s.y=e.getRawY();s.time=e.getDownTime();s.side=side;s.portrait=portrait;s.upEnabled=up;s.downEnabled=down;s.candidate=(up||down)&&GestureRules219.center(s.x-r.left,r.width());s.claimed=false;s.doubleTap=false;s.held=false;s.quiet=quiet;
    if(quiet){s.down=MotionEvent.obtain(e);HoldSpeed.touch(a,e);return true;}
    boolean handled=legacy(a,e);if(handled)s.candidate=false;return handled;
   }
   if(e.getDownTime()!=s.time&&!s.doubleTap)return legacy(a,e);
   if(action==MotionEvent.ACTION_POINTER_DOWN||e.getPointerCount()>1||action==MotionEvent.ACTION_CANCEL){boolean owned=s.quiet||s.claimed;cancelSingle(s);recycle(s);s.quiet=false;s.candidate=false;s.claimed=false;s.doubleTap=false;HoldSpeed.stop(a);return owned||legacy(a,e);}
   float dx=e.getRawX()-s.x,dy=e.getRawY()-s.y;
   if(action==MotionEvent.ACTION_MOVE&&s.candidate&&!s.held){boolean enabled=dy<0?s.upEnabled:s.downEnabled;
    if(Math.abs(dx)>Math.max(24*density,Math.abs(dy))||!enabled&&Math.abs(dy)>24*density){s.candidate=false;}
    else if(enabled&&Math.abs(dy)>Math.max(12*density,ViewConfiguration.get(a).getScaledTouchSlop()*2f)&&Math.abs(dy)>Math.abs(dx)*1.6f&&!s.claimed){s.claimed=true;cancelSingle(s);HoldSpeed.stop(a);cancelNative(a,s,e);}
   }
   if(s.claimed){if(action==MotionEvent.ACTION_UP){View v=(View)ref(s.player);int direction=GestureRules219.direction(dx,dy,Math.max(1,v.getHeight()),density);boolean allowed=direction<0?s.upEnabled:direction>0&&s.downEnabled;s.claimed=false;s.candidate=false;s.quiet=false;recycle(s);if(allowed&&validOwner(s,a)){if(s.portrait&&direction>0){boolean background=pref(a,MINI)||MiniSession225.wasExpanded(a)&&!pref(a,POPUP);if(!background||!MiniSession225.minimize(ref(s.owner)))PlaybackTransfer221.popup(ref(s.owner),background);}else fullscreen(a,ref(s.owner),direction<0);}}return true;}
   if(s.quiet){
    if(action==MotionEvent.ACTION_MOVE&&s.candidate&&!s.held){HoldSpeed.touch(a,e);return true;}
    if(action==MotionEvent.ACTION_MOVE&&Math.hypot(dx,dy)>ViewConfiguration.get(a).getScaledTouchSlop()&&!s.doubleTap&&!holding(a)){MotionEvent initial=s.down==null?null:MotionEvent.obtain(s.down);cancelSingle(s);recycle(s);s.quiet=false;s.candidate=false;HoldSpeed.stop(a);if(initial!=null){replay(a,s,initial);initial.recycle();}return legacy(a,e);}
    boolean holding=holding(a);if(holding)s.held=true;
    HoldSpeed.touch(a,e);
    if(action==MotionEvent.ACTION_UP){if(s.doubleTap||s.held||e.getEventTime()-e.getDownTime()>ViewConfiguration.getTapTimeout()){recycle(s);s.quiet=false;s.doubleTap=false;s.held=false;}
     else{s.up=MotionEvent.obtain(e);s.lastUp=e.getEventTime();final State pending=s;cancelCallback(s);s.single=new Runnable(){public void run(){Activity owner=pending.activity.get();if(owner!=null&&!owner.isFinishing())flush(pending);else{recycle(pending);pending.single=null;}}};MAIN.postDelayed(s.single,ViewConfiguration.getDoubleTapTimeout());}}
    return true;
   }
   return legacy(a,e);
  }catch(Exception error){cancelSingle(s);recycle(s);s.quiet=false;s.candidate=false;s.claimed=false;android.util.Log.w("nicoid-gesture","Player gesture failed",error);return legacy(a,e);}
 }
 public static void startedHold(Object hold){try{Activity a=(Activity)((WeakReference<?>)get(hold,"activity")).get();State s=STATES.get(a);if(s!=null){s.held=true;s.holding=true;cancelSingle(s);}}catch(Exception e){android.util.Log.w("nicoid-gesture","Cannot track hold gesture",e);}}
 public static void stoppedHold(Object hold){try{Activity a=(Activity)((WeakReference<?>)get(hold,"activity")).get();State s=STATES.get(a);if(s!=null)s.holding=false;}catch(Exception e){android.util.Log.w("nicoid-gesture","Cannot finish hold gesture",e);}}
 static boolean holding(Activity a){State s=STATES.get(a);return s!=null&&s.holding;}
 static boolean seekEnabled(Activity a){try{return Integer.parseInt(PreferenceManager.getDefaultSharedPreferences(a).getString("double_tap_seek_seconds","10"))>0;}catch(Exception e){return true;}}
 static boolean seek(Activity a,Object player,int side)throws Exception{int seconds;try{seconds=Integer.parseInt(PreferenceManager.getDefaultSharedPreferences(a).getString("double_tap_seek_seconds","10"));}catch(NumberFormatException e){seconds=10;}if(seconds<=0)return false;long before=((Number)player.getClass().getMethod("getCurrentPosition").invoke(player)).longValue(),duration=((Number)player.getClass().getMethod("getDuration").invoke(player)).longValue();if(duration<=0)return false;long target=SeekFeedback219.target(before,duration,side,seconds);player.getClass().getMethod("seekTo",long.class).invoke(player,target);SeekFeedback219.toast(a,"",Toast.LENGTH_SHORT).show();return true;}
 static boolean legacy(Activity a,MotionEvent e){return Review181.seekTouchLegacy(a,e);}
 static void cancelCallback(State s){if(s.single!=null){MAIN.removeCallbacks(s.single);s.single=null;}}
 static void flush(State s){cancelCallback(s);Activity a=s.activity.get();MotionEvent down=s.down,up=s.up;s.down=null;s.up=null;s.quiet=false;if(a!=null&&down!=null&&up!=null&&validOwner(s,a)&&!a.isFinishing()){replay(a,s,down);replay(a,s,up);}if(down!=null)down.recycle();if(up!=null)up.recycle();}
 static boolean validOwner(State s,Activity a){try{Object current=get(a,"v");return current==ref(s.owner)&&get(current,"a0")==ref(s.player)&&java.util.Objects.equals(s.id,String.valueOf(get(current,"b0")));}catch(Exception e){return false;}}
 static Object owner(Activity a){try{return get(a,"v");}catch(Exception e){return null;}}
 static void replay(Activity a,State s,MotionEvent e){s.replaying=true;try{a.dispatchTouchEvent(e);}finally{s.replaying=false;}}
 static void cancelNative(Activity a,State s,MotionEvent e){MotionEvent cancel=MotionEvent.obtain(e);cancel.setAction(MotionEvent.ACTION_CANCEL);try{replay(a,s,cancel);}finally{cancel.recycle();}}
 public static void fullscreen(Activity a,Object owner,boolean full)throws Exception{owner.getClass().getField("B0").setBoolean(owner,full);owner.getClass().getField("C0").setBoolean(owner,full);a.setRequestedOrientation(full?ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE:ActivityInfo.SCREEN_ORIENTATION_SENSOR_PORTRAIT);}
 public static void destroy(Activity a){State s=STATES.remove(a);if(s!=null){cancelSingle(s);recycle(s);}SeekFeedback219.clear(a);FeedbackHud219.clear(a);HoldSpeed.stop(a);}
 public static void settings(PreferenceActivity a){PreferenceGroup root=a.getPreferenceScreen();if(root==null)return;Preference anchor=a.findPreference("gesture_volume");PreferenceGroup group=findParent(root,anchor);if(group==null)group=root;
  add(a,group,QUIET,"ジェスチャー中に操作部を表示しない","Keep controls hidden during gestures","手勢操作時不顯示控制項","ダブルタップと長押し倍速では操作部を開かず、単タップで開閉します","Double taps and hold-to-speed preserve controls; single taps toggle them","連點與長按加速保留控制項狀態，單點開關控制項");
  for(String key:new String[]{"gesture_swipe_mini",POPUP,FULL,EXIT}){Preference old=a.findPreference(key);PreferenceGroup parent=findParent(root,old);if(parent!=null)parent.removePreference(old);}
  if(a.findPreference("gesture_vertical_options")==null){final Preference entry=new Preference(a);entry.setKey("gesture_vertical_options");entry.setTitle(PanelUi.tr(a,"上下スワイプ","Vertical swipes","上下滑動"));entry.setSummary(PanelUi.tr(a,"バックグラウンド再生・ポップアップ・全画面への切り替え","Background playback, popup playback and fullscreen","背景播放、懸浮播放與切換全螢幕"));entry.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener(){public boolean onPreferenceClick(Preference p){swipeOptions(a);return true;}});group.addPreference(entry);}
 }
 static void swipeOptions(final PreferenceActivity a){VerticalSwipe226.show(a);}
 static void add(PreferenceActivity a,PreferenceGroup group,String key,String ja,String en,String zh,String js,String es,String zs){if(a.findPreference(key)!=null)return;CheckBoxPreference p=new CheckBoxPreference(a);p.setKey(key);p.setTitle(PanelUi.tr(a,ja,en,zh));p.setSummary(PanelUi.tr(a,js,es,zs));p.setDefaultValue(false);group.addPreference(p);}
 static PreferenceGroup findParent(PreferenceGroup group,Preference target){if(target==null)return null;for(int i=0;i<group.getPreferenceCount();i++){Preference p=group.getPreference(i);if(p==target)return group;if(p instanceof PreferenceGroup){PreferenceGroup g=findParent((PreferenceGroup)p,target);if(g!=null)return g;}}return null;}
}
