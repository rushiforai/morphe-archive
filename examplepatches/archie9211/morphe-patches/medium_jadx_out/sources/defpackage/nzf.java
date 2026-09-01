package defpackage;

import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nzf {
    public static final nzf d = new nzf();
    public final Runnable a;
    public final Executor b;
    public nzf c;

    public nzf() {
        this.a = null;
        this.b = null;
    }

    public nzf(Runnable runnable, Executor executor) {
        this.a = runnable;
        this.b = executor;
    }
}
