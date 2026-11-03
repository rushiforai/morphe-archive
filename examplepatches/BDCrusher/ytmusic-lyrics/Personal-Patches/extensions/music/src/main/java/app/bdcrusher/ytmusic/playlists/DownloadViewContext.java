/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;
import android.view.View;
import android.os.Looper;
import android.os.SystemClock;
import java.lang.ref.WeakReference;
import java.util.*;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/** Native presenter ownership; never a global Now Playing or page-text fallback. */
public final class DownloadViewContext {
    public static final String SENDER="com.google.android.libraries.youtube.rendering.elements.sender_view";
    private static final String SNAPSHOT="app.bdcrusher.ytmusic.download.snapshot";
    public interface Owner {View bd_downloadRoot();String bd_downloadVideo();}
    private record Captured(DownloadCommand.Target target){}
    private static final WeakHashMap<Object,DownloadCommand.Target> owners=new WeakHashMap<>();
    private static long epoch,opened;
    private static WeakReference<View> origin=new WeakReference<>(null);
    private static WeakReference<View> opener=new WeakReference<>(null),popup=new WeakReference<>(null);
    private static DownloadCommand.Target menuTarget;
    private DownloadViewContext(){}
    public static synchronized void register(Object value){
        if(!(value instanceof Owner)){Logger.printDebug(()->"Rejected native download owner: "+(value==null?"null":value.getClass().getName()));return;}
        owners.putIfAbsent(value,null);
    }
    public static synchronized void header(Object value,byte[] bytes){
        if(!(value instanceof Owner)){register(value);return;}
        owners.put(value,DownloadIdentity.header(bytes));
    }
    private static boolean main(){return Looper.myLooper()==Looper.getMainLooper();}
    private static synchronized void clearMenu(){epoch++;menuTarget=null;origin.clear();opener.clear();popup.clear();}
    /** Runs before native command mappings can send their map to a worker. Copy immutable maps. */
    public static Map<Object,Object> capture(byte[] bytes,Map<Object,Object> map){
        if(map==null||!main())return map;
        Object sender=map.get(SENDER);
        if(DownloadIdentity.menuOpen(bytes)){
            clearMenu();
            // A verified header/player owner is authoritative; a row menu uses its own payload.
            DownloadCommand.Target bound=resolve(map);
            synchronized(DownloadViewContext.class){
                menuTarget=bound!=null?bound:DownloadIdentity.menuTarget(bytes);opened=SystemClock.uptimeMillis();
                if(sender instanceof View view){opener=new WeakReference<>(view.getRootView());origin=new WeakReference<>(view);}
            }
            Logger.printDebug(()->"Download menu identity captured; found="+(menuTarget!=null));return map;
        }
        boolean download=DownloadCommand.contextual(bytes)||DownloadCommand.target(bytes)!=null;
        if(!download){if(sender instanceof View view&&view.getRootView()==opener.get()&&view!=origin.get())clearMenu();return map;}
        if(map.get(SNAPSHOT) instanceof Captured)return map;
        DownloadCommand.Target target=DownloadCommand.target(bytes);
        if(target==null)target=resolve(map);
        Map<Object,Object> copy=new HashMap<>(map);copy.put(SNAPSHOT,new Captured(target));return copy;
    }
    public static DownloadCommand.Target target(Map<Object,Object> map){
        if(map==null)return null;
        if(map.get(SNAPSHOT) instanceof Captured c)return c.target();
        return main()?resolve(map):NativeDownloadContext.target(map.get(NativeDownloadContext.TAG));
    }
    private static synchronized DownloadCommand.Target resolve(Map<Object,Object> map){
        DownloadCommand.Target tagged=NativeDownloadContext.target(map.get(NativeDownloadContext.TAG));
        if(tagged!=null)return tagged;
        if(!(map.get(SENDER) instanceof View sender)||!sender.isAttachedToWindow())return null;
        View root=sender.getRootView();
        if(menuTarget!=null&&opener.get()!=null&&root!=opener.get()&&Utils.getActivity()!=null&&opener.get()==Utils.getActivity().getWindow().getDecorView()){
            View bound=popup.get();
            if(bound==root)return menuTarget;
            if(bound==null&&SystemClock.uptimeMillis()-opened<=30000){
                popup=new WeakReference<>(root);long token=epoch;
                root.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
                    public void onViewAttachedToWindow(View v){}
                    public void onViewDetachedFromWindow(View v){synchronized(DownloadViewContext.class){if(token==epoch)clearMenu();}v.removeOnAttachStateChangeListener(this);}
                });return menuTarget;
            }
        }
        // A main-window download must never inherit an earlier popup's recording.
        clearMenu();
        List<Object> live=new ArrayList<>(owners.keySet());
        Object node=sender;
        for(int depth=0;node instanceof View view&&depth<64;depth++,node=view.getParent()){
            DownloadCommand.Target found=null;boolean matched=false;
            for(Object value:live){if(!(value instanceof Owner owner)){owners.remove(value);continue;}View area;try{area=owner.bd_downloadRoot();}catch(RuntimeException invalid){owners.remove(value);Logger.printDebug(()->"Removed invalid download owner",invalid);continue;}if(area==null||area!=view||!area.isAttachedToWindow()||!area.isShown())continue;
                String video;try{video=owner.bd_downloadVideo();}catch(RuntimeException invalid){owners.remove(value);Logger.printDebug(()->"Removed invalid download identity owner",invalid);continue;}DownloadCommand.Target candidate=video!=null&&video.matches("[A-Za-z0-9_-]{11}")?new DownloadCommand.Target(video,false):owners.get(owner);
                if(matched&&!Objects.equals(found,candidate))return null;matched=true;found=candidate;
            }
            if(matched){final DownloadCommand.Target result=found;Logger.printDebug(()->"Download presenter identity; found="+(result!=null)+"; playlist="+(result!=null&&result.playlist()));return found;}
        }
        Logger.printDebug(()->"Download sender has no registered presenter; ancestry="+ancestry(sender));return null;
    }
    private static String ancestry(View sender){StringBuilder s=new StringBuilder();Object node=sender;
        for(int d=0;node instanceof View view&&d<12;d++,node=view.getParent()){if(d>0)s.append('/');s.append(view.getClass().getSimpleName()).append('#').append(view.getId());}return s.toString();}
}
