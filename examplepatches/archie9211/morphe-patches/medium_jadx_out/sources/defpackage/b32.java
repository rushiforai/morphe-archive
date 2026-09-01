package defpackage;

import java.util.concurrent.ThreadFactory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b32 {
    public final int a;
    public final c32[] b;
    public long c;

    public b32(int i, ThreadFactory threadFactory) {
        this.a = i;
        this.b = new c32[i];
        for (int i2 = 0; i2 < i; i2++) {
            this.b[i2] = new c32(threadFactory);
        }
    }
}
