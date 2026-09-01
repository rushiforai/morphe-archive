package defpackage;

import android.app.ForegroundServiceStartNotAllowedException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ql7 {
    public static ForegroundServiceStartNotAllowedException a(IllegalStateException illegalStateException) {
        return (ForegroundServiceStartNotAllowedException) illegalStateException;
    }

    public static boolean b(IllegalStateException illegalStateException) {
        return illegalStateException instanceof ForegroundServiceStartNotAllowedException;
    }
}
