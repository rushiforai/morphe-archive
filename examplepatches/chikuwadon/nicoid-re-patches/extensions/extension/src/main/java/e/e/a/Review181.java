package e.e.a;

import android.app.*;
import android.content.*;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.net.Uri;
import android.preference.*;
import android.view.*;
import android.widget.*;
import org.json.*;
import java.util.*;

/** Settings and playback interactions added in the next development build. */
public final class Review181 {
    private static final WeakHashMap<Activity,Taps> TAPS=new WeakHashMap<>();
    private static final class Taps { long up; float x,y; int side; boolean valid,second,cancelling; }
    static String tr(Context c,String j,String e,String z){return PanelUi.tr(c,j,e,z);}
    static Object field(Object o,String name)throws Exception{return o.getClass().getField(name).get(o);}
    static View named(Activity a,String name){int id=a.getResources().getIdentifier(name,"id",a.getPackageName());return id==0?null:a.findViewById(id);}
    public static void settings(PreferenceActivity a){
        PreferenceGroup group=a.getPreferenceScreen();
        Preference p=a.findPreference("gesture_volume");
        if(p!=null){PreferenceGroup found=parent(group,p);if(found!=null)group=found;}
        Preference existing=a.findPreference("double_tap_seek_seconds");
        if(existing!=null){PreferenceGroup oldParent=parent(a.getPreferenceScreen(),existing);if(oldParent!=null)oldParent.removePreference(existing);}
        Preference seek=new Preference(a);seek.setKey("double_tap_seek_seconds");
        seek.setTitle(tr(a,"ダブルタップでシーク","Double tap to seek","輕觸兩次跳轉"));
        seekSummary(a,seek);
        seek.setOnPreferenceClickListener(clicked->{seekSlider(a,seek);return true;});group.addPreference(seek);
        int position=a.getIntent().getIntExtra("nicoid_settings_position",-1),offset=a.getIntent().getIntExtra("nicoid_settings_offset",0);
        a.getIntent().removeExtra("nicoid_settings_position");
        if(position>=0)a.getListView().post(()->a.getListView().setSelectionFromTop(position,offset));
    }
    private static int seekSeconds(Context c){try{return Integer.parseInt(PreferenceManager.getDefaultSharedPreferences(c).getString("double_tap_seek_seconds","10"));}catch(Exception e){return 10;}}
    private static String seekLabel(Context c,int seconds){return seconds==0?tr(c,"無効","Off","關閉"):seconds+tr(c,"秒"," s"," 秒");}
    private static void seekSummary(Context c,Preference p){p.setSummary(seekLabel(c,seekSeconds(c))+"："+tr(c,"右側で早送り、左側で巻き戻し","Right to skip forward, left to rewind","右側快轉，左側倒轉"));}
    private static void seekSlider(PreferenceActivity a,Preference pref){Context c=PlaybackSession.dialogContext(a);LinearLayout box=PanelUi.column(c);int pad=PanelUi.dp(c,24);box.setPadding(pad,pad,pad,pad);TextView label=PanelUi.text(c,"",22);label.setGravity(Gravity.CENTER);box.addView(label);SeekBar bar=new SeekBar(c);bar.setMax(60);box.addView(bar,new LinearLayout.LayoutParams(-1,-2));bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onProgressChanged(SeekBar b,int p,boolean user){label.setText(seekLabel(c,SeekRules.seconds(p)));}public void onStartTrackingTouch(SeekBar b){}public void onStopTrackingTouch(SeekBar b){}});bar.setProgress(SeekRules.progress(seekSeconds(a)));label.setText(seekLabel(c,SeekRules.seconds(bar.getProgress())));AlertDialog d=new AlertDialog.Builder(c).setTitle(pref.getTitle()).setView(box).setPositiveButton(tr(c,"OK","OK","確定"),(x,w)->{PreferenceManager.getDefaultSharedPreferences(a).edit().putString(pref.getKey(),Integer.toString(SeekRules.seconds(bar.getProgress()))).apply();seekSummary(a,pref);}).setNegativeButton(tr(c,"キャンセル","Cancel","取消"),null).setNeutralButton(tr(c,"デフォルトに戻す","Reset to default","還原預設值"),null).create();UiDialogs.show(d);d.getButton(-3).setOnClickListener(v->bar.setProgress(10));}
    private static PreferenceGroup parent(PreferenceGroup group,Preference target){for(int n=0;n<group.getPreferenceCount();n++){Preference p=group.getPreference(n);if(p==target)return group;if(p instanceof PreferenceGroup){PreferenceGroup result=parent((PreferenceGroup)p,target);if(result!=null)return result;}}return null;}
    public static boolean language(Object listener,Preference pref,Object value){try{
        PreferenceActivity a=(PreferenceActivity)field(listener,"a");String choice=String.valueOf(value);
        pref.getSharedPreferences().edit().putString(pref.getKey(),choice).commit();UiStrings.selectLanguage(choice);
        Locale locale="0".equals(choice)?Locale.JAPAN:"1".equals(choice)?Locale.US:"2".equals(choice)?Locale.TAIWAN:Locale.getDefault();
        Configuration config=new Configuration(a.getResources().getConfiguration());config.setLocale(locale);
        a.getResources().updateConfiguration(config,a.getResources().getDisplayMetrics());
        ListView list=a.getListView();a.getIntent().putExtra("nicoid_settings_position",list.getFirstVisiblePosition()).putExtra("nicoid_settings_offset",list.getChildCount()==0?0:list.getChildAt(0).getTop());
        a.getWindow().getDecorView().post(a::recreate);return true;
    }catch(Exception e){android.util.Log.w("nicoid-settings","Unable to update language",e);return false;}}
    private static boolean control(View v,float x,float y,View video){if(!v.isShown())return false;Rect r=new Rect();if(!v.getGlobalVisibleRect(r)||!r.contains((int)x,(int)y))return false;if(v instanceof Button||v instanceof ImageButton||v instanceof SeekBar||v instanceof EditText||v instanceof TextView&&v.isClickable()&&v!=video)return true;if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int n=g.getChildCount()-1;n>=0;n--)if(control(g.getChildAt(n),x,y,video))return true;}return false;}
    public static boolean seekTouch(Activity a,MotionEvent e){
        Taps s=TAPS.get(a);if(s==null){s=new Taps();TAPS.put(a,s);}if(s.cancelling)return false;
        try{Object fragment=field(a,"v"),player=field(fragment,"a0");View video=(View)player;Rect rect=new Rect();
            int action=e.getActionMasked();
            if(action==MotionEvent.ACTION_DOWN){
                s.valid=false;s.second=false;
                if(!video.isShown()||!video.getGlobalVisibleRect(rect)||!rect.contains((int)e.getRawX(),(int)e.getRawY())||control(a.getWindow().getDecorView(),e.getRawX(),e.getRawY(),video))return false;
                int seconds=Integer.parseInt(PreferenceManager.getDefaultSharedPreferences(a).getString("double_tap_seek_seconds","10"));if(seconds<=0)return false;
                int side=e.getRawX()<rect.exactCenterX()?-1:1;
                s.second=e.getEventTime()-s.up<=ViewConfiguration.getDoubleTapTimeout()&&s.up!=0&&s.side==side&&Math.hypot(e.getRawX()-s.x,e.getRawY()-s.y)<ViewConfiguration.get(a).getScaledDoubleTapSlop();
                s.x=e.getRawX();s.y=e.getRawY();s.side=side;s.valid=true;
                if(s.second){long current=((Number)player.getClass().getMethod("getCurrentPosition").invoke(player)).longValue(),duration=((Number)player.getClass().getMethod("getDuration").invoke(player)).longValue();if(duration<=0){s.valid=false;s.second=false;return false;}long target=SeekRules.target(current,duration,side,seconds);player.getClass().getMethod("seekTo",long.class).invoke(player,target);Toast.makeText(a,(side>0?"+":"−")+seconds+" s",0).show();s.up=0;
                    MotionEvent cancel=MotionEvent.obtain(e);cancel.setAction(MotionEvent.ACTION_CANCEL);s.cancelling=true;try{a.dispatchTouchEvent(cancel);}finally{s.cancelling=false;cancel.recycle();}return true;
                }return false;
            }
            if(e.getPointerCount()>1||action==MotionEvent.ACTION_CANCEL||action==MotionEvent.ACTION_MOVE&&Math.hypot(e.getRawX()-s.x,e.getRawY()-s.y)>ViewConfiguration.get(a).getScaledTouchSlop()){s.valid=false;s.up=0;}
            boolean consumed=s.second;
            if(action==MotionEvent.ACTION_UP){if(s.valid&&!s.second&&e.getEventTime()-e.getDownTime()<ViewConfiguration.getTapTimeout())s.up=e.getEventTime();else s.up=0;s.second=false;s.valid=false;}
            return consumed;
        }catch(Exception ignored){s.up=0;s.second=false;return false;}
    }
    public static void restorePosition(Object fragment){try{Activity a=(Activity)field(fragment,"A1");if(!a.getIntent().hasExtra("nicoid_resume_position"))return;Object player=field(fragment,"a0");long duration=((Number)player.getClass().getMethod("getDuration").invoke(player)).longValue();if(duration<=0)return;long position=Math.max(0,Math.min(duration,a.getIntent().getLongExtra("nicoid_resume_position",0)));fragment.getClass().getField("k0").setInt(fragment,(int)Math.min(Integer.MAX_VALUE,position));player.getClass().getMethod("seekTo",long.class).invoke(player,position);a.getIntent().removeExtra("nicoid_resume_position");}catch(Exception e){android.util.Log.w("nicoid-player","Unable to restore playback position",e);}}
    static JSONObject latest(){try{return (JSONObject)Class.forName("e.e.a.ModernPlayback").getField("latestWatch").get(null);}catch(Exception e){return null;}}
    public static boolean portraitFullscreen(Object fragment){try{
        Activity a=(Activity)field(fragment,"A1");JSONObject watch=latest(),video=watch==null?null:watch.optJSONObject("video");String id=HistoryRules.id(String.valueOf(field(fragment,"b0")));
        boolean vertical=id.startsWith("ss")||ModernShorts.active(a);
        if(!vertical&&video!=null&&DetailData.matchesWatch(watch,id)){JSONObject resolution=video.optJSONObject("resolution");if(resolution!=null)vertical=resolution.optInt("height")>resolution.optInt("width")&&resolution.optInt("width")>0;}
        if(!vertical&&watch!=null&&video!=null&&DetailData.matchesWatch(watch,id)){JSONObject media=watch.optJSONObject("media"),domand=media==null?null:media.optJSONObject("domand");JSONArray streams=domand==null?null:domand.optJSONArray("videos");if(streams!=null)for(int n=0;n<streams.length();n++){JSONObject stream=streams.optJSONObject(n);if(stream!=null&&stream.optBoolean("isAvailable",true)&&stream.optInt("width")>0){vertical=stream.optInt("height")>stream.optInt("width");break;}}}
        if(!vertical)return false;
        if(!ModernShorts.active(a)&&id.startsWith("ss")){a.getIntent().removeExtra("nicoid_disable_shorts");a.getIntent().putExtra("nicoid_re_shorts",true);a.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);ModernShorts.attach(a);return true;}

        boolean full=!fragment.getClass().getField("B0").getBoolean(fragment);fragment.getClass().getField("B0").setBoolean(fragment,full);fragment.getClass().getField("C0").setBoolean(fragment,full);
        a.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);fragment.getClass().getMethod("i",int.class).invoke(fragment,full?2:4);return true;
    }catch(Exception e){return false;}}
    public static void shortTap(Activity a,MotionEvent e) {
        if(!ModernShorts.active(a)||e.getActionMasked()!=MotionEvent.ACTION_UP||e.getPointerCount()!=1
                ||e.getEventTime()-e.getDownTime()>ViewConfiguration.getTapTimeout())return;
        try {
            Object fragment=field(a,"v"),player=field(fragment,"a0");View video=(View)player;Rect bounds=new Rect();
            if(!video.isShown()||!video.getGlobalVisibleRect(bounds)||!bounds.contains((int)e.getRawX(),(int)e.getRawY())
                    ||control(a.getWindow().getDecorView(),e.getRawX(),e.getRawY(),video))return;
            if(!((Boolean)player.getClass().getMethod("isPlaying").invoke(player)))player.getClass().getMethod("start").invoke(player);
        }catch(Exception ex){android.util.Log.w("nicoid-player","Unable to resume tapped short",ex);}
    }
    public static void shortControls(Activity a,int visibility,float alpha) {
        View content=a.findViewById(android.R.id.content);
        View overlay=content==null?null:content.findViewWithTag("nicoid_short_metadata");
        if(overlay==null)return;
        if(overlay.getVisibility()!=visibility)overlay.setVisibility(visibility);
        if(overlay.getAlpha()!=alpha)overlay.setAlpha(alpha);
    }
    public static void shortOverlay(Activity a){
        FrameLayout root=(FrameLayout)a.findViewById(android.R.id.content);if(root.findViewWithTag("nicoid_short_metadata")!=null)return;
        FrameLayout overlay=new FrameLayout(a);overlay.setTag("nicoid_short_metadata");root.addView(overlay,new FrameLayout.LayoutParams(-1,-1));overlay.setVisibility(View.GONE);
        LinearLayout info=PanelUi.column(a);info.setPadding(PanelUi.dp(a,16),PanelUi.dp(a,12),PanelUi.dp(a,16),PanelUi.dp(a,12));info.setBackground(new android.graphics.drawable.GradientDrawable(android.graphics.drawable.GradientDrawable.Orientation.TOP_BOTTOM,new int[]{0x00000000,0xb3000000}));
        LinearLayout owner=new LinearLayout(a);owner.setGravity(Gravity.CENTER_VERTICAL);TextView name=overlayText(a,"",14);owner.addView(name,new LinearLayout.LayoutParams(0,-2,1));info.addView(owner);
        TextView title=overlayText(a,"",16);title.setMaxLines(2);info.addView(title);
        TextView input=overlayText(a,tr(a,"コメントを入力…","Enter a comment…","輸入留言…"),13);input.setPadding(PanelUi.dp(a,18),PanelUi.dp(a,12),PanelUi.dp(a,18),PanelUi.dp(a,12));android.graphics.drawable.GradientDrawable oval=PanelUi.round(a,0x55000000,28);oval.setStroke(PanelUi.dp(a,1),0x66ffffff);input.setBackground(oval);input.setOnClickListener(v->compose(a));LinearLayout.LayoutParams ip=new LinearLayout.LayoutParams(-1,-2);ip.topMargin=PanelUi.dp(a,12);info.addView(input,ip);
        FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM);lp.bottomMargin=PanelUi.dp(a,124);overlay.addView(info,lp);
        Runnable update=new Runnable(){int tries;public void run(){if(a.isFinishing()||overlay.getParent()==null)return;JSONObject watch=latest(),video=watch==null?null:watch.optJSONObject("video");try{String id=HistoryRules.id(String.valueOf(field(field(a,"v"),"b0")));if(video!=null&&DetailData.matchesWatch(watch,id)){JSONObject o=watch.optJSONObject("owner");if(o==null)o=watch.optJSONObject("channel");name.setText(o==null?"":o.optString("nickname",o.optString("name")));title.setText(video.optString("title"));bindLike(overlay,watch,a);VideoDetails.bindOwner(owner,watch);for(int n=1;n<owner.getChildCount();n++){View action=owner.getChildAt(n);action.setAlpha(.65f);if(action instanceof VideoDetails.FollowIcon)((VideoDetails.FollowIcon)action).shortStyle();}return;}}catch(Exception ignored){}if(++tries<60)overlay.postDelayed(this,500);}};overlay.post(update);
        overlay.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){public void onViewAttachedToWindow(View v){}public void onViewDetachedFromWindow(View v){overlay.removeCallbacks(update);}});
    }
    private static void bindLike(FrameLayout root,JSONObject watch,Activity a){try{JSONObject video=watch.getJSONObject("video"),count=video.optJSONObject("count");android.os.Bundle data=new android.os.Bundle();data.putString("videoId",video.getString("id"));data.putString("likeCount",Long.toString(count==null?0:count.optLong("like")));Class<?> extras=Class.forName("e.e.a.VideoExtras");extras.getMethod("capture",JSONObject.class,android.os.Bundle.class).invoke(null,watch,data);Button bridge=new Button(a);bridge.setTag("nicoid_like");ImageButton icon=new ImageButton(a);icon.setBackgroundColor(android.graphics.Color.TRANSPARENT);icon.setAlpha(.65f);icon.setPadding(PanelUi.dp(a,10),PanelUi.dp(a,10),PanelUi.dp(a,10),PanelUi.dp(a,10));FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(PanelUi.dp(a,56),PanelUi.dp(a,56),Gravity.END|Gravity.BOTTOM);lp.bottomMargin=PanelUi.dp(a,280);lp.rightMargin=PanelUi.dp(a,12);root.addView(icon,lp);java.lang.reflect.Method toggle=extras.getDeclaredMethod("toggle",Button.class,android.os.Bundle.class,View.class,String.class);toggle.setAccessible(true);icon.setOnClickListener(v->{try{toggle.invoke(null,bridge,data,root,video.getString("id"));}catch(Exception e){android.util.Log.w("nicoid-like","Unable to change like",e);}});root.getViewTreeObserver().addOnPreDrawListener(new android.view.ViewTreeObserver.OnPreDrawListener(){Boolean shown;public boolean onPreDraw(){boolean liked=data.getBoolean("nicoid_liked");if(shown==null||shown!=liked){shown=liked;icon.setImageDrawable(new Heart(liked?UiDialogs.accent(a):0xffffffff,liked));icon.setContentDescription(tr(a,liked?"いいね済み":"いいね",liked?"Liked":"Like",liked?"已喜歡":"喜歡"));}icon.setEnabled(bridge.isEnabled());return true;}});}catch(Exception e){android.util.Log.w("nicoid-like","Unable to prepare like action",e);}}
    private static final class Heart extends android.graphics.drawable.Drawable {final int color;final boolean fill;Heart(int c,boolean f){color=c;fill=f;}public void draw(android.graphics.Canvas canvas){android.graphics.Rect b=getBounds();canvas.save();canvas.translate(b.left,b.top);canvas.scale(b.width()/24f,b.height()/24f);android.graphics.Paint paint=new android.graphics.Paint(3);paint.setColor(color);paint.setStyle(fill?android.graphics.Paint.Style.FILL:android.graphics.Paint.Style.STROKE);paint.setStrokeWidth(1.8f);android.graphics.Path p=new android.graphics.Path();p.moveTo(12,21);p.cubicTo(10,19,2,13,2,7);p.cubicTo(2,1,10,1,12,6);p.cubicTo(14,1,22,1,22,7);p.cubicTo(22,13,14,19,12,21);p.close();canvas.drawPath(p,paint);canvas.restore();}public void setAlpha(int a){}public void setColorFilter(android.graphics.ColorFilter f){}public int getOpacity(){return android.graphics.PixelFormat.TRANSLUCENT;}}
    static TextView overlayText(Activity a,String text,int size){TextView view=new TextView(a);view.setText(text);view.setTextSize(size);view.setTextColor(0xffffffff);view.setShadowLayer(3,0,1,0xff000000);return view;}
    static Button overlayButton(Activity a,String text,String description){Button b=new Button(a);b.setText(text);b.setTextColor(0xffffffff);b.setBackgroundTintList(android.content.res.ColorStateList.valueOf(0x55000000|(ThemeChoice.accent(a)&0xffffff)));b.setContentDescription(description);b.setMinWidth(0);b.setMinimumWidth(0);return b;}
    private static void compose(Activity a){Context c=PlaybackSession.dialogContext(a);EditText input=new EditText(c);input.setHint(tr(a,"コメントを入力","Enter a comment","輸入留言"));input.setTextColor(PanelUi.ink(c));input.setBackgroundTintList(android.content.res.ColorStateList.valueOf(ThemeChoice.accent(c)));AlertDialog d=new AlertDialog.Builder(c).setTitle(tr(a,"コメント投稿","Post comment","發送留言")).setView(input).setPositiveButton(tr(a,"投稿","Post","發送"),(x,w)->{try{ModernPosting.comment(field(a,"v"),input.getText().toString(),"184");}catch(Exception ignored){}}).setNegativeButton(tr(a,"キャンセル","Cancel","取消"),null).create();PlaybackSession.showForm(d);}
}
