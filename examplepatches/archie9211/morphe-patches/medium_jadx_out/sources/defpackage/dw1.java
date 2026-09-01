package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dw1 implements Serializable {
    public final ib2[] a;

    public dw1(ib2[] ib2VarArr) {
        this.a = ib2VarArr;
    }

    private final Object readResolve() {
        ib2[] ib2VarArr = this.a;
        ib2 ib2VarJ0 = zx3.a;
        for (ib2 ib2Var : ib2VarArr) {
            ib2VarJ0 = ib2VarJ0.j0(ib2Var);
        }
        return ib2VarJ0;
    }
}
