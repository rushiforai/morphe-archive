package b20;

import kotlin.Function;
import kotlin.jvm.functions.Function0;
import p1.e1;
import p1.g1;

/* loaded from: classes4.dex */
public final class d implements z {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17062a;

    /* renamed from: b, reason: collision with root package name */
    public final String f17063b;

    /* renamed from: c, reason: collision with root package name */
    public final y20.d f17064c;

    /* renamed from: d, reason: collision with root package name */
    public final Function f17065d;

    public /* synthetic */ d(y20.d dVar, String str, Function function, int i5) {
        this.f17062a = i5;
        this.f17064c = dVar;
        this.f17063b = str;
        this.f17065d = function;
    }

    @Override // b20.z
    public final void a(p1.o oVar) {
        switch (this.f17062a) {
            case 0:
                p1.t tVar = (p1.t) oVar;
                tVar.b0(1816792182);
                p50.i.f(androidx.compose.foundation.layout.d.j(androidx.compose.foundation.layout.e.o(androidx.compose.foundation.c.d(fg.a.g(b2.r.f17024a, s0.h.f86511a), false, null, null, (Function0) this.f17065d, 15), 48), 12), (y20.c) this.f17064c, null, this.f17063b, null, null, tVar, 0, 52);
                tVar.p(false);
                break;
            default:
                p1.t tVar2 = (p1.t) oVar;
                tVar2.b0(-1306702942);
                tVar2.b0(-67796201);
                Object objP = tVar2.P();
                g1 g1Var = p1.n.f81514a;
                if (objP == g1Var) {
                    objP = androidx.compose.runtime.d.k(Boolean.FALSE);
                    tVar2.m0(objP);
                }
                e1 e1Var = (e1) objP;
                tVar2.p(false);
                b2.t tVarG = fg.a.g(b2.r.f17024a, s0.h.f86511a);
                tVar2.b0(-67791218);
                Object objP2 = tVar2.P();
                if (objP2 == g1Var) {
                    objP2 = new a1.h(e1Var, 5);
                    tVar2.m0(objP2);
                }
                tVar2.p(false);
                p50.i.f(androidx.compose.foundation.layout.d.j(androidx.compose.foundation.layout.e.o(androidx.compose.foundation.c.d(tVarG, false, null, null, (Function0) objP2, 15), 48), 12), (y20.b) this.f17064c, null, this.f17063b, null, null, tVar2, 0, 52);
                if (((Boolean) e1Var.getValue()).booleanValue()) {
                    x1.e eVar = (x1.e) this.f17065d;
                    tVar2.b0(-67782905);
                    Object objP3 = tVar2.P();
                    if (objP3 == g1Var) {
                        objP3 = new a1.h(e1Var, 6);
                        tVar2.m0(objP3);
                    }
                    tVar2.p(false);
                    eVar.invoke((Function0) objP3, tVar2, 6);
                }
                tVar2.p(false);
                break;
        }
    }
}
