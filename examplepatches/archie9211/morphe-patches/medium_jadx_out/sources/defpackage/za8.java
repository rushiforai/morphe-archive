package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class za8 extends q62 {
    public final tc8 f;
    public final ArrayList g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public za8(tc8 tc8Var) {
        super(tc8Var.b(gq7.w(cb8.class)), (String) null);
        tc8Var.getClass();
        this.g = new ArrayList();
        this.f = tc8Var;
    }

    public final ya8 g() {
        ya8 ya8Var = (ya8) super.a();
        jl1 jl1Var = ya8Var.g;
        jl1Var.getClass();
        for (va8 va8Var : this.g) {
            if (va8Var != null) {
                jl1Var.a(va8Var);
            }
        }
        jl1Var.N("main_route");
        return ya8Var;
    }
}
