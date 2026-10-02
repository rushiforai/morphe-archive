package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.*;
import android.os.*;
import android.preference.*;
import android.provider.Settings;
import android.view.ContextThemeWrapper;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Playback policies for the verified 6.49 target. All calls run on the main thread. */
public final class PlaybackSession {
    public static final float[] SPEEDS = PlaybackRules.SPEEDS;
    public static final String[] LABELS = {"0.5×","0.75×","1.0×","1.15×","1.25×","1.4×","1.5×","1.75×","2.0×"};
    private static final WeakHashMap<Object, Session> SESSIONS = new WeakHashMap<>();
    private static String speedVideo;
    private static class Session {
        Context context; BroadcastReceiver receiver; String video; boolean switching, unplugged;
        Handler handler = new Handler(Looper.getMainLooper()); Runnable tick;
    }
    static Object get(Object o,String n) throws Exception { return o.getClass().getField(n).get(o); }
    static Object call(Object o,String n,Class<?>[] t,Object... a) throws Exception { return o.getClass().getMethod(n,t).invoke(o,a); }
    static SharedPreferences prefs(Context c) { return PreferenceManager.getDefaultSharedPreferences(c); }
    static void log(Exception e) { android.util.Log.w("nicoid-session","Playback policy failed",e); }
    public static int metadataVersion(Bundle b) {
        return PlaybackRules.version(b.get("nicovideo_version"));
    }
    public static Context dialogContext(Context c) {
        boolean night = false;
        try { night = (Boolean)Class.forName("e.e.a.DynamicTheme").getMethod("isNight",Context.class).invoke(null,c); } catch(Exception e) { log(e); }
        return new ContextThemeWrapper(c,night ? android.R.style.Theme_Material_Dialog_Alert : android.R.style.Theme_Material_Light_Dialog_Alert);
    }
    public static void styleDialog(AlertDialog d) {
        try {
            Context c=d.getContext();
            boolean dynamic=Build.VERSION.SDK_INT>=31 && prefs(c).getBoolean("material_you_mode",false);
            if (!dynamic) return;
            boolean night=(Boolean)Class.forName("e.e.a.DynamicTheme").getMethod("isNight",Context.class).invoke(null,c);
            int id=c.getResources().getIdentifier(night?"system_accent1_200":"system_accent1_600","color","android");
            int color=c.getResources().getColor(id,c.getTheme());
            int surface=c.getResources().getIdentifier(night?"system_neutral1_900":"system_neutral1_50","color","android");
            android.graphics.drawable.GradientDrawable background=new android.graphics.drawable.GradientDrawable();
            background.setColor(c.getResources().getColor(surface,c.getTheme()));
            background.setCornerRadius(24*c.getResources().getDisplayMetrics().density);
            d.getWindow().setBackgroundDrawable(background);
            android.content.res.ColorStateList tint=android.content.res.ColorStateList.valueOf(color);
            d.getButton(-2).setTextColor(color);
            android.widget.ListView list=d.getListView();
            if(list!=null) {
                android.widget.AbsListView.OnScrollListener listener=new android.widget.AbsListView.OnScrollListener(){
                    public void onScrollStateChanged(android.widget.AbsListView v,int s){}
                    public void onScroll(android.widget.AbsListView v,int f,int count,int total){
                        for(int i=0;i<v.getChildCount();i++) {
                            android.view.View child=v.getChildAt(i);
                            if(child instanceof android.widget.CheckedTextView) ((android.widget.CheckedTextView)child).setCheckMarkTintList(tint);
                        }
                    }
                };
                list.setOnScrollListener(listener);
                list.post(()->listener.onScroll(list,0,list.getChildCount(),list.getCount()));
            }
        } catch(Exception e) { log(e); }
    }
    public static void normalChoose(Object fragment,int mode) {
        interaction(fragment,false);
        try {
            Activity a=(Activity)get(fragment,"A1");
            String[] labels=LABELS;
            if(mode==0) {
                labels=new String[3];
                for(int i=0;i<3;i++) labels[i]=(String)Class.forName("e.e.a.ModernControls").getMethod("qualityOption",int.class).invoke(null,i);
            }
            int selected=2;
            float current=Class.forName("e.e.a.ModernControls").getField("speed").getFloat(null);
            if(mode==1) for(int i=0;i<SPEEDS.length;i++) if(SPEEDS[i]==current) selected=i;
            if(mode==0) { int q=(Integer)get(get(fragment,"h1"),"e"); selected=q==4?2:q==3?1:0; }
            AlertDialog d=new AlertDialog.Builder(dialogContext(a)).setTitle(mode==1?"再生速度":"画質")
                .setSingleChoiceItems(labels,selected,(dialog,index)->{
                    dialog.dismiss();
                    try {
                        if(mode==1) {
                            setSpeed(get(fragment,"a0"),SPEEDS[index]);
                            Class.forName("e.e.a.ModernControls").getMethod("update",fragment.getClass()).invoke(null,fragment);
                        } else {
                            Class<?> cls=Class.forName("e.e.a.ModernControls$Choice");
                            ((DialogInterface.OnClickListener)cls.getConstructor(fragment.getClass(),int.class).newInstance(fragment,0)).onClick(dialog,index);
                        }
                    } catch(Exception e) { log(e); }
                }).setNegativeButton("キャンセル",null).create();
            d.show(); styleDialog(d);
        } catch(Exception e) { log(e); }
    }
    public static void setSpeed(Object player,float speed) throws Exception {
        Class.forName("e.e.a.ModernControls").getField("speed").setFloat(null,speed);
        call(player,"setPlaybackSpeed",new Class<?>[]{float.class},speed);
    }
    public static void interaction(Object owner,boolean popup) {
        try {Session s=SESSIONS.get(owner);if(s!=null && (Boolean)call(get(owner,popup?"e":"a0"),"isPlaying",new Class<?>[0]))s.unplugged=false;}catch(Exception e){log(e);}
    }
    public static void settings(PreferenceActivity a) {
        PreferenceGroup group=(PreferenceGroup)a.findPreference("player");
        if(group==null || a.findPreference("default_playback_speed")!=null) return;
        String[] values=new String[SPEEDS.length]; for(int i=0;i<values.length;i++) values[i]=Float.toString(SPEEDS[i]);
        list(a,group,"default_playback_speed","デフォルトの再生速度",LABELS,values,"1.0");
        String[] policies={"何もしない（従来の動作）","バックグラウンド再生","ポップアップ再生"};
        String[] keys={"none","background","popup"};
        list(a,group,"app_switch_playback","アプリ切替時の動作",policies,keys,"none");
        list(a,group,"back_playback","再生中に戻る場合の動作",policies,keys,"none");
        CheckBoxPreference save=new CheckBoxPreference(a); save.setKey("save_playback_position");
        save.setTitle("再生位置の保存"); save.setSummary("動画ごとに再生位置を保存し、次回の再生時に再開します"); save.setDefaultValue(false); group.addPreference(save);
    }
    private static void list(Context c,PreferenceGroup group,String key,String title,String[] entries,String[] values,String def) {
        ListPreference p=new ListPreference(c);p.setKey(key);p.setTitle(title);p.setEntries(entries);p.setEntryValues(values);p.setDefaultValue(def);p.setSummary("%s");group.addPreference(p);
    }
    public static void prepared(Object owner,boolean popup) {
        try {
            Context context=popup?(Context)owner:(Context)get(owner,"A1");
            Object player=get(owner,popup?"e":"a0"); String video=(String)get(owner,popup?"f":"b0");
            if(video==null || player==null) return;
            Session s=SESSIONS.get(owner);
            boolean newSession=s==null;
            long initialPosition=((Number)call(player,"getCurrentPosition",new Class<?>[0])).longValue();
            long explicitSeek=popup?Class.forName("com.sauzask.nicoid.NicoidPopupViewService").getField("t0").getInt(null):((Number)get(owner,"k0")).longValue();
            if(s==null) {
                s=new Session(); s.context=context; SESSIONS.put(owner,s);
                WeakReference<Object> ref=new WeakReference<>(owner);
                Session state=s;
                s.receiver=new BroadcastReceiver(){ public void onReceive(Context c,Intent i){
                    Object o=ref.get(); if(o==null) return;
                    state.unplugged=true;
                    try { call(get(o,popup?"e":"a0"),"pause",new Class<?>[0]);
                        if(popup) ModernEnhancements.noisy(o);
                        save(o,popup);
                    } catch(Exception e){ log(e); }
                }};
                IntentFilter filter=new IntentFilter("android.media.AUDIO_BECOMING_NOISY");
                if(Build.VERSION.SDK_INT>=33) context.registerReceiver(s.receiver,filter,Context.RECEIVER_NOT_EXPORTED);
                else context.registerReceiver(s.receiver,filter);
                s.tick=()->{ Object o=ref.get();if(o==null){state.handler.removeCallbacks(state.tick);return;} save(o,popup);state.handler.postDelayed(state.tick,5000); };
                s.handler.postDelayed(s.tick,5000);
            }
            if(!video.equals(speedVideo) || (newSession && initialPosition<1000 && explicitSeek<=0)) {
                setSpeed(player,PlaybackRules.defaultSpeed(prefs(context).getString("default_playback_speed","1.0")));speedVideo=video;
            }
            if(!video.equals(s.video)) {
                s.unplugged=false;
                s.video=video;
                long current=((Number)call(player,"getCurrentPosition",new Class<?>[0])).longValue();
                long transfer=popup?Class.forName("com.sauzask.nicoid.NicoidPopupViewService").getField("t0").getInt(null):((Number)get(owner,"k0")).longValue();
                if(prefs(context).getBoolean("save_playback_position",false) && current<1000 && transfer<=0) {
                    long position=context.getSharedPreferences("nicoid-resume",0).getLong(video,0);
                    long duration=((Number)call(player,"getDuration",new Class<?>[0])).longValue();
                    if(PlaybackRules.canRestore(position,duration,current,transfer)) call(player,"seekTo",new Class<?>[]{long.class},position);
                }
            }
            if(s.unplugged)call(player,"pause",new Class<?>[0]);
            if(popup)Class.forName("com.sauzask.nicoid.NicoidPopupViewService").getField("t0").setInt(null,0);
        }catch(Exception e){log(e);}
    }
    public static boolean allowRetry(Object owner) {
        Session s=SESSIONS.get(owner);return s==null || !s.unplugged;
    }
    public static void save(Object owner,boolean popup) {
        try {
            Session s=SESSIONS.get(owner);if(s==null || s.video==null || !prefs(s.context).getBoolean("save_playback_position",false))return;
            Object p=get(owner,popup?"e":"a0");
            if(!s.video.equals(get(owner,popup?"f":"b0")))return;
            if(s.unplugged && (Boolean)call(p,"isPlaying",new Class<?>[0]))s.unplugged=false;
            long position=((Number)call(p,"getCurrentPosition",new Class<?>[0])).longValue();
            long duration=((Number)call(p,"getDuration",new Class<?>[0])).longValue();
            if(position<=0 && duration<=0)return; // released/unprepared player must not erase the last checkpoint
            position=PlaybackRules.checkpoint(position,duration);
            if(position>=0)s.context.getSharedPreferences("nicoid-resume",0).edit().putLong(s.video,position).apply();
        }catch(Exception e){log(e);}
    }
    public static void destroy(Object owner,boolean popup) {
        save(owner,popup);Session s=SESSIONS.remove(owner);if(s==null)return;
        s.handler.removeCallbacksAndMessages(null);try{s.context.unregisterReceiver(s.receiver);}catch(RuntimeException ignored){}
    }
    public static void activitySave(Object activity,boolean destroy) {
        try {Object f=get(activity,"v");if(f!=null){if(destroy)destroy(f,false);else save(f,false);}}catch(Exception e){log(e);}
    }
    public static boolean leave(Object activity,boolean back) {
        try {
            Activity a=(Activity)activity;Object f=get(activity,"v");if(f==null || a.isFinishing())return false;
            Session s=SESSIONS.get(f);if(s==null || s.switching)return false;
            String policy=prefs(a).getString(back?"back_playback":"app_switch_playback","none");
            if("none".equals(policy) || !(Boolean)call(get(f,"a0"),"isPlaying",new Class<?>[0]))return false;
            if("popup".equals(policy) && Build.VERSION.SDK_INT>=23 && !Settings.canDrawOverlays(a)) {
                android.widget.Toast.makeText(a,"ポップアップ再生には他のアプリの上に表示する権限が必要です",0).show();return false;
            }
            if(get(f,"g1")==null || get(get(f,"g1"),"d")==null)return false;
            save(f,false);s.switching=true;
            try {call(f,"popup".equals(policy)?"n":"p",new Class<?>[0]);}catch(Exception e){s.switching=false;throw e;}
            return a.isFinishing();
        }catch(Exception e){log(e);return false;}
    }
}
