package defpackage;

import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kh8 extends a1 implements va6 {
    public static final kh8 b = new kh8(cd7.g);

    @Override // defpackage.va6
    public final yh3 A0(boolean z, boolean z2, k0 k0Var) {
        return lh8.a;
    }

    @Override // defpackage.va6
    public final mzb B() {
        return my3.a;
    }

    @Override // defpackage.va6
    public final gl1 D(db6 db6Var) {
        return lh8.a;
    }

    @Override // defpackage.va6
    public final CancellationException L() {
        throw new IllegalStateException("This job is always active");
    }

    @Override // defpackage.va6
    public final yh3 R(x45 x45Var) {
        return lh8.a;
    }

    @Override // defpackage.va6
    public final boolean f() {
        return true;
    }

    @Override // defpackage.va6
    public final boolean isCancelled() {
        return false;
    }

    @Override // defpackage.va6
    public final boolean start() {
        return false;
    }

    public final String toString() {
        return "NonCancellable";
    }

    @Override // defpackage.va6
    public final Object z0(p92 p92Var) {
        throw new UnsupportedOperationException("This job is always active");
    }

    @Override // defpackage.va6
    public final void m(CancellationException cancellationException) {
    }
}
