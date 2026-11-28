package app.sharklatan.youtube.airplay;
import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.*;
import android.util.Log;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.ref.WeakReference;
import java.net.*;
import java.util.*;

/** Hides YouTube's local video surface while the TV plays and puts the video thumbnail in its
 *  place. Every view operation runs on the main thread and the restore is idempotent, because the
 *  disconnect can arrive from the TV side without AirPlayActivity.onDisconnected() being called. */
final class RemoteScreen {
    private static final String TAG="YouTubeAirPlay";
    private static final Map<View,Integer> hidden=new HashMap<>();
    private static final Map<String,Bitmap> cache=new LinkedHashMap<String,Bitmap>(4,0.75f,true){
        protected boolean removeEldestEntry(Map.Entry<String,Bitmap> eldest){return size()>4;}
    };
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static WeakReference<Activity> target=new WeakReference<>(null);
    private static final Map<View,Float> alphas=new HashMap<>();
    private static ViewGroup pictureHost;
    private static android.graphics.drawable.BitmapDrawable picture;
    private static void clearPicture(){if(pictureHost!=null&&picture!=null)pictureHost.getOverlay().remove(picture);picture=null;pictureHost=null;}
    private static ImageView overlay;
    private static ViewGroup overlayHost;
    private static String wanted="",shown="";
    private static boolean active,loading;
    private static long lastMiss;

    static boolean active(){return active;}

    /** Suppress the local surface and show the thumbnail of {@code videoId}. */
    static void show(Activity host,String videoId){
        target=new WeakReference<>(host);active=!NativeRemote.audioOnly;
        if(videoId!=null&&!videoId.isEmpty())wanted=videoId;
        run(host,()->{if(!wanted.isEmpty())load(host,wanted);apply(host);});
    }
    /** Re-applies on every UI tick: YouTube recreates the surface after rotation or quality changes. */
    static void refresh(Activity host){
        target=new WeakReference<>(host);
        if(!active)return;
        run(host,()->{
            if(wanted.isEmpty()){String id=resolveId(host);if(!id.isEmpty()){wanted=id;load(host,id);}}
            apply(host);
        });
    }
    /** Restores the local surface. Safe to call repeatedly. */
    static void hide(Activity host){
        active=false;wanted="";
        restore(host);
    }
    /** Safety net for disconnects that never reach onDisconnected(): restores while inactive. */
    static void ensureRestored(Activity host){
        if(!active&&(picture!=null||overlay!=null||!hidden.isEmpty()||!alphas.isEmpty()))restore(host);
    }

    private static void restore(Activity host){
        run(host,()->{
            boolean changed=false;
            for(Map.Entry<View,Integer> entry:hidden.entrySet())
                try{entry.getKey().setVisibility(entry.getValue());changed=true;}catch(RuntimeException ignored){}
            hidden.clear();
            for(Map.Entry<View,Float> entry:alphas.entrySet())entry.getKey().setAlpha(entry.getValue());
            alphas.clear();clearPicture();
            if(overlay!=null&&overlayHost!=null)try{overlayHost.removeView(overlay);changed=true;}catch(RuntimeException ignored){}
            overlay=null;overlayHost=null;shown="";
            if(changed)Log.i(TAG,"RemoteScreen: vídeo local restaurado.");
        });
    }

    private static void run(Activity host,Runnable task){
        if(host==null||host.isDestroyed())return;
        if(Looper.myLooper()==Looper.getMainLooper())task.run();
        else main.post(task);
    }

    private static void apply(Activity host){
        try{
            /* A surface we already hid is INVISIBLE, so a "visible only" search would never find it
             * again and the thumbnail was lost on the next layout pass. Look for it either way. */
            View video=video(host.getWindow().getDecorView(),null,new int[]{0},true);
            if(video==null)video=video(host.getWindow().getDecorView(),null,new int[]{0},false);
            if(video==null){
                long now=SystemClock.elapsedRealtime();
                if(now-lastMiss>10000){lastMiss=now;Log.i(TAG,"RemoteScreen: sin superficie de vídeo todavía.");}
                return;
            }
            ViewGroup parent=video.getParent() instanceof ViewGroup?(ViewGroup)video.getParent():null;
            if(parent==null)return;
            Bitmap bitmap;synchronized(cache){bitmap=cache.get(wanted);}
            if(bitmap==null)return;
            if(pictureHost!=parent){clearPicture();pictureHost=parent;}
            if(picture==null||!wanted.equals(shown)){
                if(picture!=null)parent.getOverlay().remove(picture);
                picture=new android.graphics.drawable.BitmapDrawable(host.getResources(),bitmap);
                picture.setGravity(android.view.Gravity.FILL);parent.getOverlay().add(picture);shown=wanted;
            }
            picture.setBounds(video.getLeft(),video.getTop(),video.getRight(),video.getBottom());
            if(!alphas.containsKey(video))alphas.put(video,video.getAlpha());
            video.setAlpha(0f);
        }catch(RuntimeException e){Log.e(TAG,"RemoteScreen: no se pudo aplicar",e);}
    }

    /** Largest video surface on screen; hidden ones are accepted on the second pass. */
    private static View video(View view,View best,int[] area,boolean visibleOnly){
        if(view==null)return best;
        if(visibleOnly&&view.getVisibility()!=View.VISIBLE)return best;
        if(view instanceof SurfaceView||view instanceof TextureView){
            int size=view.getWidth()*view.getHeight();
            if(size>area[0]){area[0]=size;return view;}
            return best;
        }
        if(view instanceof ViewGroup){
            ViewGroup group=(ViewGroup)view;
            for(int i=0;i<group.getChildCount();i++)best=video(group.getChildAt(i),best,area,visibleOnly);
        }
        return best;
    }

    private static void setBitmap(){
        if(overlay==null)return;
        Bitmap bitmap;
        synchronized(cache){bitmap=cache.get(wanted);}
        if(bitmap!=null&&!wanted.equals(shown)){
            overlay.setImageBitmap(bitmap);shown=wanted;
            Log.i(TAG,"RemoteScreen: miniatura mostrada para "+wanted+".");
        }
    }

    private static void load(final Activity host,final String id){
        Bitmap cached;
        synchronized(cache){cached=cache.get(id);}
        if(cached!=null){setBitmap();return;}
        if(loading)return;
        loading=true;
        new Thread(()->{
            Bitmap bitmap=download("https://i.ytimg.com/vi/"+id+"/maxresdefault.jpg");
            if(bitmap==null)bitmap=download("https://i.ytimg.com/vi/"+id+"/hqdefault.jpg");
            loading=false;
            if(bitmap==null){Log.i(TAG,"RemoteScreen: no se pudo descargar la miniatura de "+id+".");return;}
            Log.i(TAG,"RemoteScreen: miniatura descargada para "+id+" ("+bitmap.getWidth()+"x"+bitmap.getHeight()+").");
            synchronized(cache){cache.put(id,bitmap);}
            main.post(()->{if(id.equals(wanted)){setBitmap();Activity current=target.get();if(active&&current!=null)apply(current);}});
        },"airplay-thumbnail").start();
    }

    private static String resolveId(Activity host){
        try{return String.valueOf(host.getClassLoader().loadClass("app.morphe.extension.youtube.patches.VideoInformation").getMethod("getVideoId").invoke(null));}
        catch(Exception e){return "";}
    }

    private static Bitmap download(String address){
        HttpURLConnection connection=null;
        try{
            connection=(HttpURLConnection)new URL(address).openConnection();
            connection.setConnectTimeout(4000);connection.setReadTimeout(6000);
            connection.setInstanceFollowRedirects(true);
            if(connection.getResponseCode()!=200)return null;
            try(InputStream input=connection.getInputStream()){return BitmapFactory.decodeStream(input);}
        }catch(Exception e){Log.i(TAG,"RemoteScreen: miniatura "+address+" falló ("+e+").");return null;}
        finally{if(connection!=null)connection.disconnect();}
    }
}
