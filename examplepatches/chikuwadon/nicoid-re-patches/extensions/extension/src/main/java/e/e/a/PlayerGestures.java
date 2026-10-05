package e.e.a;

import android.app.Activity;
import android.graphics.Rect;
import android.media.AudioManager;
import android.preference.*;
import android.provider.Settings;
import android.view.*;
import android.widget.*;
import android.util.TypedValue;
import java.util.WeakHashMap;

/** Vertical gestures start only on the video surface, leaving controls and Shorts intact. */
public final class PlayerGestures {
    private static final WeakHashMap<Activity,State> states=new WeakHashMap<>();
    private static final WeakHashMap<View,Float> gains=new WeakHashMap<>();
    private static class State {float x,y,start,height;int target;boolean active,rejected,cancelling;View video;TextView hud;Runnable hide;}
    public static void settings(PreferenceActivity a,PreferenceGroup group) {
        toggle(a,group,"gesture_volume","スワイプで音量調整","上下スワイプで音量を調整します。輝度調整もONの場合は動画の右側で操作します");
        toggle(a,group,"gesture_brightness","スワイプで輝度調整","上下スワイプで再生画面の輝度を調整します。音量調整もONの場合は動画の左側で操作します");
    }
    private static void toggle(PreferenceActivity a,PreferenceGroup g,String key,String title,String summary) {
        if(a.findPreference(key)!=null)return;CheckBoxPreference p=new CheckBoxPreference(a);p.setKey(key);p.setTitle(UiStrings.translate(title));p.setSummary(UiStrings.translate(summary));p.setDefaultValue(false);g.addPreference(p);
    }
    public static boolean touch(Activity a,MotionEvent event) {
        State previous=states.get(a);if(previous!=null&&previous.cancelling)return false;
        if(ModernShorts.active(a))return shorts(a,event);
        try {
            Object fragment=a.getClass().getField("v").get(a);
            View video=fragment==null?null:(View)fragment.getClass().getField("a0").get(fragment);
            android.content.SharedPreferences p=PreferenceManager.getDefaultSharedPreferences(a);
            boolean volume=p.getBoolean("gesture_volume",false),brightness=p.getBoolean("gesture_brightness",false);
            State s=states.get(a);if(s==null){s=new State();states.put(a,s);}
            int action=event.getActionMasked();
            if(action==MotionEvent.ACTION_DOWN) {
                s.active=false;s.rejected=false;s.target=0;s.video=video;
                if(video==null||!video.isShown()||(!volume&&!brightness))return shorts(a,event);
                Rect r=new Rect();if(!video.getGlobalVisibleRect(r)||!r.contains((int)event.getRawX(),(int)event.getRawY()))return shorts(a,event);
                // Buttons/seekbars laid over the video remain available.
                if(!GestureRules.startArea(event.getRawX()-r.left,event.getRawY()-r.top,r.width(),r.height(),a.getResources().getDisplayMetrics().density)||controlAt(a.getWindow().getDecorView(),event.getRawX(),event.getRawY(),video))return shorts(a,event);
                s.x=event.getRawX();s.y=event.getRawY();s.height=r.height();
                s.target=GestureRules.target(volume,brightness,s.x-r.left,r.width());
                AudioManager audio=(AudioManager)a.getSystemService(Activity.AUDIO_SERVICE);
                s.start=s.target==1?Math.round(audio.getStreamVolume(AudioManager.STREAM_MUSIC)*100f/Math.max(1,audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC))*(gains.containsKey(video)?gains.get(video):1)):a.getWindow().getAttributes().screenBrightness;
                if(s.target==2&&s.start<0)s.start=Settings.System.getInt(a.getContentResolver(),Settings.System.SCREEN_BRIGHTNESS,128)/255f;
                return shorts(a,event);
            }
            if(event.getPointerCount()>1||action==MotionEvent.ACTION_POINTER_DOWN){s.rejected=true;s.target=0;return s.active;}
            if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL){boolean consumed=s.active;s.active=false;s.target=0;return consumed||shorts(a,event);}
            if(action!=MotionEvent.ACTION_MOVE||s.target==0||s.rejected)return shorts(a,event);
            float dx=event.getRawX()-s.x,dy=event.getRawY()-s.y;
            if(!s.active){
                float slop=Math.max(24*a.getResources().getDisplayMetrics().density,ViewConfiguration.get(a).getScaledTouchSlop()*2f);
                if(Math.abs(dx)>slop&&Math.abs(dx)>Math.abs(dy)){s.rejected=true;return shorts(a,event);}
                if(!GestureRules.vertical(dx,dy,slop))return shorts(a,event);
                // Cancel the original child/Shorts recognizers once we own the vertical drag.
                MotionEvent cancel=MotionEvent.obtain(event);cancel.setAction(MotionEvent.ACTION_CANCEL);s.cancelling=true;try{a.dispatchTouchEvent(cancel);shorts(a,cancel);}finally{s.cancelling=false;cancel.recycle();}s.active=true;s.y=event.getRawY();dy=0;
            }
            if(s.target==1){
                AudioManager audio=(AudioManager)a.getSystemService(Activity.AUDIO_SERVICE);int max=audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
                int percent=Math.round(GestureRules.value(s.start,dy,s.height,0,100));int step=(int)Math.ceil(percent*max/100f);float gain=step==0?0:percent*max/(100f*step);
                s.video.getClass().getMethod("setVolume",float.class).invoke(s.video,gain);gains.put(s.video,gain);
                if(step!=audio.getStreamVolume(AudioManager.STREAM_MUSIC))audio.setStreamVolume(AudioManager.STREAM_MUSIC,step,0);
                hud(a,s,percent);
            }else{
                float value=GestureRules.value(s.start,dy,s.height,.02f,1);WindowManager.LayoutParams lp=a.getWindow().getAttributes();lp.screenBrightness=value;a.getWindow().setAttributes(lp);
                hud(a,s,Math.round(value*100));
            }
            return true;
        }catch(Exception e){android.util.Log.w("nicoid-gesture","Gesture failed",e);return shorts(a,event);}
    }
    public static void destroy(Activity a){State s=states.remove(a);if(s!=null&&s.hud!=null){s.hud.removeCallbacks(s.hide);android.view.ViewParent p=s.hud.getParent();if(p instanceof ViewGroup)((ViewGroup)p).removeView(s.hud);}}
    private static boolean shorts(Activity a,MotionEvent e) {
        try{return (Boolean)Class.forName("e.e.a.ModernShorts").getMethod("touch",Activity.class,MotionEvent.class).invoke(null,a,e);}catch(Exception ignored){return false;}
    }
    private static boolean controlAt(View v,float x,float y,View video) {
        if(!v.isShown())return false;Rect r=new Rect();if(!v.getGlobalVisibleRect(r))return false;
        boolean control=v instanceof SeekBar||v instanceof Button||v instanceof ImageButton||v instanceof EditText;
        if(control){int margin=Math.round(12*v.getResources().getDisplayMetrics().density);r.inset(-margin,-margin);}
        if(!r.contains((int)x,(int)y))return false;
        if(control)return true;
        if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=g.getChildCount()-1;i>=0;i--)if(controlAt(g.getChildAt(i),x,y,video))return true;}
        return false;
    }
    private static void position(State s){if(s.hud==null||s.video==null||!(s.hud.getParent() instanceof View))return;Rect r=new Rect();if(!s.video.getGlobalVisibleRect(r)){s.hud.setVisibility(View.GONE);return;}int[] origin=new int[2];((View)s.hud.getParent()).getLocationOnScreen(origin);s.hud.setX(r.exactCenterX()-origin[0]-s.hud.getWidth()/2f);s.hud.setY(r.exactCenterY()-origin[1]-s.hud.getHeight()/2f);}
    private static void hud(Activity a,State s,int percent) {
        if(s.hud==null){
            FrameLayout root=(FrameLayout)a.findViewById(android.R.id.content);s.hud=new TextView(a);s.hud.setTextSize(18);s.hud.setGravity(Gravity.CENTER);float density=a.getResources().getDisplayMetrics().density;s.hud.setPadding(Math.round(16*density),Math.round(10*density),Math.round(16*density),Math.round(10*density));s.hud.setCompoundDrawablePadding(Math.round(10*density));
            TypedValue color=new TypedValue();a.getTheme().resolveAttribute(0x7f03005e,color,true);int accent=color.resourceId==0?color.data:a.getResources().getColor(color.resourceId);
            android.graphics.drawable.GradientDrawable bg=new android.graphics.drawable.GradientDrawable();bg.setColor(0x99000000 | ((accent & 0xfcfcfc) >>> 2));bg.setCornerRadius(8*a.getResources().getDisplayMetrics().density);s.hud.setBackground(bg);s.hud.setTextColor(android.graphics.Color.WHITE);
            root.addView(s.hud,new FrameLayout.LayoutParams(-2,-2,Gravity.TOP|Gravity.LEFT));s.hide=()->s.hud.setVisibility(View.GONE);
        }
        android.graphics.drawable.Drawable icon=PlayerIcons.gestureIcon(s.target);int side=Math.round(26*a.getResources().getDisplayMetrics().density);icon.setBounds(0,0,side,side);s.hud.setCompoundDrawables(icon,null,null,null);s.hud.setText(percent+"%");s.hud.setContentDescription(UiStrings.translate(s.target==1?"音量":"輝度")+" "+percent+"%");s.hud.post(()->position(s));s.hud.setVisibility(View.VISIBLE);s.hud.removeCallbacks(s.hide);s.hud.postDelayed(s.hide,700);
    }
}
