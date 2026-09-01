package defpackage;

import androidx.work.impl.WorkDatabase;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g7f {
    public final q7f a;
    public final i2a b;
    public final g8f c;

    static {
        d87.k("WMFgUpdater");
    }

    public g7f(WorkDatabase workDatabase, i2a i2aVar, q7f q7fVar) {
        this.b = i2aVar;
        this.a = q7fVar;
        this.c = workDatabase.x();
    }
}
