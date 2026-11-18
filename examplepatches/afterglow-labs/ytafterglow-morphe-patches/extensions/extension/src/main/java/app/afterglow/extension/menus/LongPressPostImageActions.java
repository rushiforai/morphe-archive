package app.afterglow.extension.menus;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.Toast;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.navigation.MorpheFallbackAlbumCovers;
import app.afterglow.extension.settings.AfterglowPrefs;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/** Clipboard-only adapter to Morphe's original post identity and visible-image resolver. */
public final class LongPressPostImageActions {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"Afterglow post image");t.setDaemon(true);return t;});
    private static final AtomicBoolean fetching=new AtomicBoolean();
    interface Resolver {String[] current(View root);}
    static Resolver resolver=LongPressPostImageActions::currentImage;
    private LongPressPostImageActions() {}

    /** Replaced by the patch with the original enabled resolver; no parser or UI is enabled here. */
    private static String[] currentImage(View root){return null;}

    /** Caller supplies its verified current post root, never an arbitrary ancestor or text match. */
    public static Runnable copyAction(Activity activity,View root) {
        try {
            if(!validRoot(activity,root))return null;
            String[] current=resolver.current(root);
            if(current==null||current.length!=2||current[0]==null||current[0].isEmpty()
                    ||AvatarPhotoPolicy.largeUrl(current[1])==null)return null;
            // Own the identity/URL snapshot: upstream cache entries can later be replaced.
            String[] selected=current.clone();
            WeakReference<Activity> owner=new WeakReference<>(activity);WeakReference<View> host=new WeakReference<>(root);
            return ()->{
                Activity live=owner.get();View attached=host.get();
                try {
                    if(!validRoot(live,attached)||!Arrays.equals(selected,resolver.current(attached))) {
                        if(live!=null)Toast.makeText(live,"This post image has changed. Open its menu again.",Toast.LENGTH_SHORT).show();
                        return;
                    }
                    copy(live,selected[1]);
                }catch(Throwable error){DebugLog.write("long-press","Post image selection failed: "+error.getClass().getSimpleName());}
            };
        }catch(Throwable error){DebugLog.write("long-press","Post image is unavailable: "+error.getClass().getSimpleName());return null;}
    }

    private static boolean validRoot(Activity activity,View root) {
        return InstalledTweaks.has("long-press-tools")&&AfterglowPrefs.getBool("postManager")
            &&activity!=null&&activity==Afterglow.mainActivity()&&!activity.isFinishing()&&!activity.isDestroyed()
            &&root!=null&&root.isAttachedToWindow()&&root.isShown()&&root.isEnabled()
            &&activity.getWindow()!=null&&root.getRootView()==activity.getWindow().getDecorView().getRootView();
    }

    private static void copy(Activity activity,String url) {
        if(!fetching.compareAndSet(false,true)){Toast.makeText(activity,"A post image is already loading.",Toast.LENGTH_SHORT).show();return;}
        WeakReference<Activity> owner=new WeakReference<>(activity);
        WORKER.execute(()->{
            try {
                byte[] bytes=AvatarPhotoSource.read(MorpheFallbackAlbumCovers.overrideImageURL(url));
                BitmapFactory.Options options=new BitmapFactory.Options();options.inJustDecodeBounds=true;
                BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);
                if(options.outWidth<=0||options.outHeight<=0||(long)options.outWidth*options.outHeight>64L*1024*1024)
                    throw new IllegalStateException("Invalid image dimensions");
                options.inJustDecodeBounds=false;options.inSampleSize=1;
                while(Math.max(options.outWidth,options.outHeight)/options.inSampleSize>2048)options.inSampleSize*=2;
                Bitmap image=BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);
                if(image==null)throw new IllegalStateException("Image could not be decoded");
                MAIN.post(()->{Activity live=owner.get();if(live!=null&&!live.isFinishing()&&!live.isDestroyed())LongPressImageProvider.copy(live,image);else image.recycle();});
            }catch(Throwable error){
                DebugLog.write("long-press","Post image request failed: "+error.getClass().getSimpleName());
                MAIN.post(()->{Activity live=owner.get();if(live!=null&&!live.isFinishing()&&!live.isDestroyed())Toast.makeText(live,"Could not load this post image.",Toast.LENGTH_SHORT).show();});
            }finally{fetching.set(false);}
        });
    }
}
