package defpackage;

import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ypc extends n2 {
    public final AtomicReference a = new AtomicReference(null);

    @Override // defpackage.n2
    public final boolean a(m2 m2Var) {
        AtomicReference atomicReference = this.a;
        if (atomicReference.get() != null) {
            return false;
        }
        atomicReference.set(vv2.k);
        return true;
    }

    @Override // defpackage.n2
    public final n92[] b(m2 m2Var) {
        this.a.set(null);
        return k40.a;
    }
}
