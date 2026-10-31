/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.music.shared.VideoInformation;

/** Availability bridge for both server and client-generated native action models. */
public final class LyricsEntryButton {
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static final ArrayList<Presentation> presentations=new ArrayList<>();
    private static WeakReference<LyricsEntryButton> active=new WeakReference<>(null);
    private static final class Presentation {
        final WeakReference<Object> owner;
        String video="",modelVideo="";
        Object original;
        boolean replaying,currentModel;
        int mode;
        Presentation(Object value){owner=new WeakReference<>(value);}
    }
    private volatile boolean available,pending,unavailable,restoring;
    private volatile String identity="",videoId="";
    public LyricsEntryButton(){active=new WeakReference<>(this);}
    private static synchronized Presentation presentation(Object owner){
        presentations.removeIf(p->p.owner.get()==null);
        for(Presentation p:presentations)if(p.owner.get()==owner)return p;
        Presentation p=new Presentation(owner);
        if(presentations.size()>=8)presentations.remove(0);
        presentations.add(p);return p;
    }
    public static void capturePresenter(Object owner){presentation(owner);}
    private static synchronized ArrayList<Presentation> snapshot(){return new ArrayList<>(presentations);}
    /** The actual native b/c/e video argument, including the no-response path. */
    public static void captureIdentity(Object owner,String id){
        if(owner==null||id==null||id.isEmpty())return;
        Presentation p=presentation(owner);
        if(!id.equals(p.video)){p.video=id;if(!id.equals(p.modelVideo)){p.original=null;p.currentModel=false;}p.mode=0;}
        main.post(()->{LyricsEntryButton entry=active.get();if(entry!=null&&(entry.available||entry.pending||entry.unavailable))entry.refresh();});
    }
    /** Retain the unmodified native model, never a personal view or tap handler. */
    public static void captureModel(Object owner,Object original,byte[] bytes){
        Presentation p=presentation(owner);
        if(p.replaying){p.currentModel=true;return;}
        if(bytes==null||bytes.length>2_000_000){p.currentModel=false;return;}
        String recording=NativeActionModel.recording(bytes);
        p.modelVideo=recording==null?VideoInformation.getVideoId():recording;
        p.currentModel=p.modelVideo!=null&&p.modelVideo.equals(VideoInformation.getVideoId());p.mode=0;
        if(p.currentModel)p.original=original;
        else LyricsDiagnostics.record("Lyrics action model","Ignored native action row for a different recording");
    }
    public static Object originalModel(Object owner){return presentation(owner).original;}
    public static byte[] rewrite(Object owner,byte[] element){
        LyricsEntryButton entry=active.get();
        Presentation p=presentation(owner);
        if(!Settings.LYRICS_ENABLED.get()||!p.currentModel||!p.video.equals(VideoInformation.getVideoId())||p.video.isEmpty()||entry!=null&&entry.restoring)return element;
        boolean decided=entry!=null&&entry.isCurrent()&&entry.videoId.equals(p.video);
        int mode=decided&&entry.available?2:decided&&entry.unavailable?3:1;
        byte[] result=mode==2?NativeActionModel.enable(element):mode==3?NativeActionModel.orderUnavailable(element):NativeActionModel.orderWhilePending(element);
        p.mode=mode;
        return result;
    }
    void update(Activity activity,String key){
        if(!key.equals(identity))trackChanged(key);
        if(!isCurrent())return;
        // Panel definitions can be registered after provider results arrive.
        NativeLyricsHost.prepare(videoId);
        pending=false;unavailable=false;available=true;refresh();
    }
    void orderWhilePending(String key){if(!key.equals(identity))trackChanged(key);if(!isCurrent())return;pending=true;available=false;unavailable=false;refresh();}
    void notFound(String key){if(!key.equals(identity))trackChanged(key);if(!isCurrent())return;pending=false;available=false;unavailable=true;refresh();}
    private void refresh(){
        if(!videoId.equals(VideoInformation.getVideoId()))return;
        if((available||pending||unavailable)&&!isCurrent())return;
        int desired=available?2:unavailable?3:pending?1:0;
        for(Presentation p:snapshot()){
            Object owner=p.owner.get();
            if(owner==null||p.original==null||p.replaying||!videoId.equals(p.video))continue;
            if(desired==p.mode)continue;
            try{p.replaying=true;refreshNative(owner);p.mode=desired;}
            catch(Exception ex){LyricsDiagnostics.record("Lyrics action model","Native model replay failed: "+ex.getClass().getSimpleName());}
            finally{p.replaying=false;}
        }
    }
    private boolean isCurrent(){
        String id=VideoInformation.getVideoId();
        return Settings.LYRICS_ENABLED.get()&&id!=null&&LyricsRepository.current(id)&&identity.equals(id);
    }
    void hideButton(){available=false;pending=false;unavailable=false;restoring=true;try{refresh();}finally{restoring=false;}}
    void trackChanged(String key){hideButton();identity=key;String id=VideoInformation.getVideoId();videoId=id==null?"":id;}
    void clear(){hideButton();identity="";videoId="";}
    // Replays the remembered model through the presenter's own renderer at patch time.
    private static void refreshNative(Object owner){}
    public static Object rewriteNative(Object owner,Object element){return element;}
}
