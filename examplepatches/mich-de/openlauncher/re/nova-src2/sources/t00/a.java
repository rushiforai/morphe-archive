package t00;

import kotlin.jvm.functions.Function3;
import z2.i1;
import z2.q0;
import z2.t0;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ float f88318a;

    public /* synthetic */ a(float f11) {
        this.f88318a = f11;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        t0 t0Var = (t0) obj;
        i1 i1VarH = ((q0) obj2).H(y3.a.a(((y3.a) obj3).f96596a, 0, 0, 0, t0Var.mo96roundToPx0680j_4(this.f88318a), 7));
        return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new d1.k(i1VarH, 6));
    }
}
