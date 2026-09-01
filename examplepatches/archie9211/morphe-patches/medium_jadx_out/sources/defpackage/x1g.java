package defpackage;

import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x1g {
    public static final x1g b;
    public static final x1g c;
    public final Throwable a;

    static {
        if (ggg.d) {
            c = null;
            b = null;
        } else {
            c = new x1g(null);
            b = new x1g(null);
        }
    }

    public x1g(CancellationException cancellationException) {
        this.a = cancellationException;
    }
}
