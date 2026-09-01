package defpackage;

import android.content.ContentProviderClient;
import android.content.res.TypedArray;
import android.drm.DrmManagerClient;
import android.media.MediaDrm;
import android.media.MediaMetadataRetriever;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class dq8 {
    public boolean b;
    public final ArrayList a = new ArrayList();
    public final CopyOnWriteArrayList c = new CopyOnWriteArrayList();

    public dq8(boolean z) {
        this.b = z;
    }

    public abstract void b();

    public final void e() {
        CopyOnWriteArrayList copyOnWriteArrayList = this.c;
        Iterator it2 = copyOnWriteArrayList.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            AutoCloseable autoCloseable = (AutoCloseable) it2.next();
            if (autoCloseable instanceof AutoCloseable) {
                autoCloseable.close();
            } else if (autoCloseable instanceof ExecutorService) {
                cm0.i((ExecutorService) autoCloseable);
            } else if (autoCloseable instanceof TypedArray) {
                ((TypedArray) autoCloseable).recycle();
            } else if (autoCloseable instanceof MediaMetadataRetriever) {
                ((MediaMetadataRetriever) autoCloseable).release();
            } else if (autoCloseable instanceof MediaDrm) {
                ((MediaDrm) autoCloseable).release();
            } else if (autoCloseable instanceof DrmManagerClient) {
                ((DrmManagerClient) autoCloseable).release();
            } else {
                if (!(autoCloseable instanceof ContentProviderClient)) {
                    lg8.r();
                    return;
                }
                ((ContentProviderClient) autoCloseable).release();
            }
        }
        copyOnWriteArrayList.clear();
        ArrayList arrayList = this.a;
        Iterator it3 = arrayList.iterator();
        while (it3.hasNext()) {
            ((cq8) it3.next()).e();
        }
        arrayList.clear();
    }

    public final void f(boolean z) {
        this.b = z;
        for (cq8 cq8Var : this.a) {
            cq8Var.f(cq8Var.e && z);
        }
    }

    public void a() {
    }

    public void c(sl0 sl0Var) {
    }

    public void d(sl0 sl0Var) {
    }
}
