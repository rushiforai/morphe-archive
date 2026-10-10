package e.e.a;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.MediaMetadata;
import android.media.session.MediaSession;
import android.os.Handler;
import android.os.Looper;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Read downloaded artwork before attempting the legacy network loader. */
public final class CachedMediaArtwork {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();
    private static final Map<MediaSession,Object> CURRENT = new WeakHashMap<>();
    private static final Map<String,Bitmap> ART = new LinkedHashMap<String,Bitmap>(8,.75f,true) {
        @Override protected boolean removeEldestEntry(Map.Entry<String,Bitmap> entry) { return size()>8; }
    };

    public static void request(MediaSession session, MediaMetadata metadata, Object owner, String url) {
        Object token=new Object();
        synchronized(CURRENT){CURRENT.put(session,token);}
        if(metadata.getBitmap(MediaMetadata.METADATA_KEY_ART)!=null)return;
        String path=null;
        try {
            Context context=owner instanceof Context?(Context)owner:(Context)field(owner,"A1");
            String video=String.valueOf(field(owner,owner instanceof Context?"f":"b0"));
            if(video.matches("(?:sm|so|nm|ss)[0-9]+"))path=CacheFolders.root(context)+"/nicoid/nicoid_cache/"+video+".thm";
        } catch(Exception ignored) { }
        String cachedPath=path;
        WORKER.execute(()->{
            Bitmap bitmap=cachedPath==null?null:read(cachedPath);
            if(bitmap!=null){
                Bitmap artwork=bitmap;
                MAIN.post(()->{
                    synchronized(CURRENT){if(CURRENT.get(session)!=token)return;}
                    try {
                        MediaMetadata updated=new MediaMetadata.Builder(metadata)
                            .putBitmap(MediaMetadata.METADATA_KEY_ART,artwork)
                            .putBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART,artwork).build();
                        session.setMetadata(updated);
                    }catch(RuntimeException ignored){ }
                });
            }else if(url!=null&&!url.isEmpty()){
                synchronized(CURRENT){if(CURRENT.get(session)!=token)return;}
                // Preserve the existing online loader, its bitmap cache and stale-video check.
                try {
                    Method load=Class.forName("e.e.a.FeedbackMedia").getDeclaredMethod("lambda$apply$1",String.class,MediaSession.class,MediaMetadata.class);
                    load.setAccessible(true);load.invoke(null,url,session,metadata);
                }catch(Exception ignored){ }
            }
        });
    }

    private static Object field(Object owner,String name)throws Exception {return owner.getClass().getField(name).get(owner);}
    static Bitmap read(String path) {
        synchronized(ART){Bitmap found=ART.get(path);if(found!=null&&!found.isRecycled())return found;}
        try(InputStream input=new CacheInputStream(new CacheFile(path))){
            Bitmap bitmap=BitmapFactory.decodeStream(input);if(bitmap==null)return null;
            int largest=Math.max(bitmap.getWidth(),bitmap.getHeight());
            if(largest>640){float scale=640f/largest;bitmap=Bitmap.createScaledBitmap(bitmap,Math.max(1,Math.round(bitmap.getWidth()*scale)),Math.max(1,Math.round(bitmap.getHeight()*scale)),true);}
            synchronized(ART){ART.put(path,bitmap);}return bitmap;
        }catch(Exception ignored){return null;}
    }
}
