package defpackage;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ll0 {
    public static final /* synthetic */ AtomicIntegerFieldUpdater b = AtomicIntegerFieldUpdater.newUpdater(ll0.class, "notCompletedCount$volatile");
    public final n33[] a;
    private volatile /* synthetic */ int notCompletedCount$volatile;

    public ll0(n33[] n33VarArr) {
        this.a = n33VarArr;
        this.notCompletedCount$volatile = n33VarArr.length;
    }
}
