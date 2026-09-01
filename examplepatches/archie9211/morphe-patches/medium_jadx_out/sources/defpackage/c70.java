package defpackage;

import android.os.Looper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c70 extends hp7 {
    public static volatile c70 g;
    public static final b70 h = new b70(0);
    public final j23 f = new j23();

    public static c70 N() {
        if (g != null) {
            return g;
        }
        synchronized (c70.class) {
            try {
                if (g == null) {
                    g = new c70();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return g;
    }

    public final void O(Runnable runnable) {
        j23 j23Var = this.f;
        if (j23Var.h == null) {
            synchronized (j23Var.f) {
                try {
                    if (j23Var.h == null) {
                        j23Var.h = j23.N(Looper.getMainLooper());
                    }
                } finally {
                }
            }
        }
        j23Var.h.post(runnable);
    }
}
