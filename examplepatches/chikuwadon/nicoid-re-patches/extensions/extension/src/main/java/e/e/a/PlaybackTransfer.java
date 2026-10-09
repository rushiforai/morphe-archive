package e.e.a;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import java.lang.ref.WeakReference;

/** Retains handoff data before the source player is reset by its lifecycle. */
public final class PlaybackTransfer {
    private PlaybackTransfer() {}
    private static Object get(Object object,String name)throws Exception{return PlaybackSession.get(object,name);}
    private static Object call(Object object,String name,Class<?>[] types,Object... args)throws Exception{return PlaybackSession.call(object,name,types,args);}
    private static void log(Exception error){android.util.Log.w("nicoid-session","Playback transfer failed",error);}
    /** Snapshot before the normal fragment pause/reset, while navigation is still cancellable. */
    public static Runnable capture(Activity activity) {
        try {
            if (!"background".equals(android.preference.PreferenceManager.getDefaultSharedPreferences(activity).getString("app_switch_playback","none"))) return null;
            Object fragment=get(activity,"v");
            if(fragment==null)return null;
            Object player=get(fragment,"a0"), metadata=get(fragment,"g1");
            if(metadata==null || get(metadata,"d")==null ||
                !(Boolean)call(player,"isPlaying",new Class<?>[0]))return null;
            String video=(String)get(fragment,"b0");
            int position=(int)((Number)call(player,"getCurrentPosition",new Class<?>[0])).longValue();
            Class<?> service=Class.forName("com.sauzask.nicoid.NicoidPopupViewService");
            Intent intent=new Intent(activity,service).putExtra("url",video)
                .putExtra("nowpoti",position).putExtra("isBackgroundPlay",true);
            Object playlist=get(fragment,"C1");
            if(playlist!=null)Class.forName("e.e.a.v0").getMethod("a",Intent.class,java.util.ArrayList.class,int.class,boolean.class)
                .invoke(null,intent,playlist,((Number)get(fragment,"D1")).intValue(),true);
            WeakReference<Activity> reference=new WeakReference<>(activity);
            return ()->{
                Activity target=reference.get();
                if(target==null || target.isFinishing() || target.isDestroyed())return;
                try {
                    Object current=get(target,"v");
                    if(current!=fragment || !video.equals(get(current,"b0")) )return;
                    service.getField("t0").setInt(null,position);
                    fragment.getClass().getField("V1").set(null,metadata);
                    Class.forName("e.e.a.v0").getMethod("a",Context.class,Intent.class).invoke(null,target,intent);
                    PlaybackReturn.arm(video);
                    target.finish();
                }catch(Exception error){log(error);}
            };
        }catch(Exception error){log(error);return null;}
    }
}
