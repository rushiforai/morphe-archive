/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.common;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import java.util.WeakHashMap;

/** Terminal disposal on the UI thread, after the current framework attach/detach traversal. */
public final class ViewDisposal {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final WeakHashMap<View,Boolean> retired=new WeakHashMap<>();
    private ViewDisposal(){}
    /** Call on the UI thread. Quiesce resources first; never mutate a sibling array in detach. */
    public static void dispose(View view,Runnable release){
        if(retired.put(view,Boolean.TRUE)!=null)return;
        view.setVisibility(View.INVISIBLE);
        // Use a process UI handler, not View.post (detached views can retain its run queue),
        // nor an owner's handler whose callbacks are canceled during detach.
        MAIN.post(()->{
            try{if(view.getParent() instanceof ViewGroup parent)parent.removeView(view);}
            catch(RuntimeException failure){FeatureDiagnostics.record("View-disposal","Detach failed: "+failure.getClass().getSimpleName());}
            finally{try{release.run();}catch(RuntimeException failure){FeatureDiagnostics.record("View-disposal","Release failed: "+failure.getClass().getSimpleName());}}
        });
    }
}
