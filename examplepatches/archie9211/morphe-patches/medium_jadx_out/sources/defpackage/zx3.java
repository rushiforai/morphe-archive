package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zx3 implements ib2, Serializable {
    public static final zx3 a = new zx3();

    private final Object readResolve() {
        return a;
    }

    @Override // defpackage.ib2
    public final ib2 T(hb2 hb2Var) {
        hb2Var.getClass();
        return this;
    }

    public final int hashCode() {
        return 0;
    }

    @Override // defpackage.ib2
    public final ib2 j0(ib2 ib2Var) {
        ib2Var.getClass();
        return ib2Var;
    }

    @Override // defpackage.ib2
    public final gb2 o0(hb2 hb2Var) {
        hb2Var.getClass();
        return null;
    }

    public final String toString() {
        return "EmptyCoroutineContext";
    }

    @Override // defpackage.ib2
    public final Object N(b55 b55Var, Object obj) {
        return obj;
    }
}
