/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;
import java.lang.ref.WeakReference;
import java.util.Locale;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.ResourceUtils;

/** Attaches only to the content returned by the active native engagement-panel model. */
public final class NativeLyricsHost {
    static final String ID="music_watch_lyrics_panel";
    private static final java.util.ArrayList<WeakReference<Object>> controllers=new java.util.ArrayList<>();
    private static final java.util.WeakHashMap<Object,Boolean> nativeRoutes=new java.util.WeakHashMap<>();
    private static final java.util.WeakHashMap<Object,String> prepared=new java.util.WeakHashMap<>();
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static WeakReference<Object> controller=new WeakReference<>(null),panel=new WeakReference<>(null);
    private static WeakReference<BetterLyricsPanelView> renderer=new WeakReference<>(null);
    private static int epoch;
    private static int queuedEpoch=-1;
    private static byte[] nativeLyricsPresentation;
    private static String presentationRecording="";
    private static final ThreadLocal<Boolean> installing=ThreadLocal.withInitial(()->false);
    private static boolean lyrics;
    private NativeLyricsHost(){}
    public static void captureController(Object value){
        controllers.removeIf(ref->ref.get()==null);
        for(var ref:controllers)if(ref.get()==value)return;
        if(controllers.size()>=8)controllers.remove(0);
        controllers.add(new WeakReference<>(value));
        if(!isOpen())controller=new WeakReference<>(value);
    }
    public static void recordingChanged(){BetterLyricsPanelView view=renderer.get();if(view!=null)view.recordingChanged();}
    public static boolean isOpen(){return lyrics&&panel.get()!=null;}
    public static void captureDefinition(Object owner,byte[] bytes){
        if(installing.get()||!Settings.LYRICS_ENABLED.get()||bytes==null||bytes.length>1_000_000)return;
        try{
            String id=new String(new ProtoWire(new ProtoWire(bytes).child(18)).child(3),java.nio.charset.StandardCharsets.UTF_8);
            if(!ID.equals(id))return;
            nativeLyricsPresentation=NativePanelWire.presentation(bytes);presentationRecording=app.morphe.extension.music.shared.VideoInformation.getVideoId();prepared.remove(owner);
            captureController(owner);
        }catch(IllegalArgumentException unrelated){/* Other native panel types are unchanged. */}
    }
    public static boolean prepare(String videoId){
        boolean ready=false;
        for(var reference:new java.util.ArrayList<>(controllers)){
        Object owner=reference.get();if(owner==null)continue;
        try{
            byte[] original=nativeDefinition(owner,ID);
            // Check Music registry readiness only; never copy Related presentation fields.
            if(original==null&&nativeDefinition(owner,"music-related-panel")==null)continue;
            if(original!=null&&videoId.equals(prepared.get(owner))){ready=true;continue;}
            boolean supplied=original!=null&&!prepared.containsKey(owner);
            if(supplied&&original.length<=1_000_000){nativeLyricsPresentation=NativePanelWire.presentation(original);presentationRecording=videoId;}
            byte[] definition=supplied?original:nativeLyricsPresentation!=null&&videoId.equals(presentationRecording)
                ?nativeLyricsPresentation:NativePanelWire.lyricsProfile(ResourceUtils.getString("lyrics_tab_title"));
            installing.set(true);try{registerNative(owner,definition);}finally{installing.set(false);}
            prepared.put(owner,videoId);ready=true;nativeRoutes.put(owner,supplied);
            LyricsDiagnostics.record("Lyrics panel",supplied?"Preserved supplied native Lyrics presentation":"Prepared native Lyrics factory presentation");
        }catch(Exception ex){LyricsDiagnostics.record("Lyrics panel","Native Music setup failed: "+ex.getClass().getSimpleName());}
        }
        if(!ready)LyricsDiagnostics.record("Lyrics panel","Native Music presentation is not ready; retrying without blocking the action model");
        return ready;
    }
    public static void onNativePanelChanged(Object owner,Object value){
        captureController(owner);
        if(owner!=controller.get()&&isOpen()){
            try{if(value==null||!ID.equals(panelId(value)))return;}catch(Exception ignored){return;}
        }
        controller=new WeakReference<>(owner);if(value!=null)app.bdcrusher.ytmusic.common.FeatureDiagnostics.entry(Boolean.TRUE.equals(nativeRoutes.get(owner))?"Native":"Fallback");onNativePanelChanged(value);
    }
    public static void onNativePanelChanged(Object value){
        epoch++;panel=new WeakReference<>(value);lyrics=false;
        try{if(value!=null){String id=panelId(value);lyrics=id!=null&&(ID.equals(id)||id.toLowerCase(Locale.ROOT).contains("lyrics"));}}
        catch(Exception ex){LyricsDiagnostics.record("Lyrics panel","Native identity failed: "+ex.getClass().getSimpleName());}
        BetterLyricsPanelView old=renderer.get();if(old!=null)old.syncOverlay();
        if(lyrics)attach(epoch,0);
    }
    public static void onNativeLayout(){if(isOpen())attach(epoch,0);app.bdcrusher.ytmusic.shaders.ShaderRuntime.onNativeLayout();}
    private static void attach(int expected,int attempt){
        if(queuedEpoch==expected)return;
        queuedEpoch=expected;
        main.postDelayed(()->{
            if(queuedEpoch==expected)queuedEpoch=-1;
            if(expected!=epoch||!isOpen()||!Settings.LYRICS_ENABLED.get())return;
            try{
                View root=panelRoot(panel.get());
                // Never fall back to the activity/decor, a title ancestor, or a guessed container.
                if(!(root instanceof FrameLayout body)){LyricsDiagnostics.record("Lyrics panel","Unsupported native content root");return;}
                if(!body.isAttachedToWindow()){
                    if(attempt<30)attach(expected,attempt+1);
                    return;
                }
                app.bdcrusher.ytmusic.common.PersonalRuntime.lyricsViewport(body);
                BetterLyricsPanelView view=renderer.get();
                if(view!=null&&view.getParent()==body){view.syncOverlay();return;}
                if(view!=null&&view.getParent() instanceof android.view.ViewGroup parent)parent.removeView(view);
                view=new BetterLyricsPanelView(body.getContext());renderer=new WeakReference<>(view);
                body.addView(view,new FrameLayout.LayoutParams(-1,-1));
                view.syncOverlay();
            }catch(Exception ex){LyricsDiagnostics.record("Lyrics panel","Native attachment failed: "+ex.getClass().getSimpleName());}
        },attempt==0?0:32);
    }
    public static boolean owns(View view){
        if(!isOpen()||renderer.get()!=view)return false;
        try{return view.getParent()==panelRoot(panel.get());}catch(Exception ex){return false;}
    }
    // Replaced with typed native calls by the exact-target patch. No reflection or bundled host stubs.
    private static byte[] nativeDefinition(Object owner,String id){return null;}
    private static void registerNative(Object owner,byte[] definition){}
    private static View panelRoot(Object value){return null;}
    private static String panelId(Object value){return null;}
    public static void observeNativeDefinition(Object owner,Object definition){}
}
