package defpackage;

import java.util.concurrent.ThreadFactory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ef8 extends oqb {
    public static final zmb b = new zmb(Math.max(1, Math.min(10, Integer.getInteger("rx2.newthread-priority", 5).intValue())), "RxNewThreadScheduler", false);
    public final ThreadFactory a = b;

    @Override // defpackage.oqb
    public final nqb a() {
        return new ff8(this.a);
    }
}
