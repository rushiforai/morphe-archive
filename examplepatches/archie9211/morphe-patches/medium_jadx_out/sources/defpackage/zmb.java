package defpackage;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zmb extends AtomicLong implements ThreadFactory {
    public final String a;
    public final int b;
    public final boolean c;

    public zmb(int i, String str, boolean z) {
        this.a = str;
        this.b = i;
        this.c = z;
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        String str = this.a + '-' + incrementAndGet();
        Thread p90Var = this.c ? new p90(2, runnable, str) : new Thread(runnable, str);
        p90Var.setPriority(this.b);
        p90Var.setDaemon(true);
        return p90Var;
    }

    @Override // java.util.concurrent.atomic.AtomicLong
    public final String toString() {
        return ka1.v(new StringBuilder("RxThreadFactory["), this.a, "]");
    }

    public zmb(String str) {
        this(5, str, false);
    }
}
