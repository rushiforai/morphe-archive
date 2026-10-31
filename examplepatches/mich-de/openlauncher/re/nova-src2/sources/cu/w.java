package cu;

import kotlin.NoWhenBranchMatchedException;
import t70.j0;
import t70.m0;
import w70.n1;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final ru.d f47968a;

    /* renamed from: b, reason: collision with root package name */
    public final xu.f f47969b;

    /* renamed from: c, reason: collision with root package name */
    public final uw.c f47970c;

    /* renamed from: d, reason: collision with root package name */
    public final t1 f47971d;

    /* renamed from: e, reason: collision with root package name */
    public final n1 f47972e;

    public w(j0 j0Var, v vVar, ru.d dVar) {
        xu.f fVar = new xu.f(j0Var, vVar, false, new com.instabridge.mobilesdk.internal.data.api.a(28));
        this.f47968a = dVar;
        this.f47969b = fVar;
        uw.c cVar = fVar.f96342g;
        this.f47970c = cVar;
        t1 t1VarB = u1.b(1, 0, null, 6);
        this.f47971d = t1VarB;
        this.f47972e = new n1(t1VarB);
        v vVar2 = (v) cVar.f91586b.invoke();
        if (vVar2 instanceof t) {
            ru.a aVar = (ru.a) dVar;
            ru.a.i(aVar, new ru.k(aVar.f86337a, 4));
        } else {
            if (!(vVar2 instanceof u)) {
                throw new NoWhenBranchMatchedException();
            }
            ru.a.i((ru.a) dVar, new ru.m(4));
        }
    }

    public final void a(p pVar) {
        boolean z11 = pVar instanceof q;
        ru.d dVar = this.f47968a;
        t1 t1Var = this.f47971d;
        uw.c cVar = this.f47970c;
        xu.f fVar = this.f47969b;
        if (z11) {
            v vVar = (v) cVar.f91586b.invoke();
            if (!(vVar instanceof t)) {
                if (!(vVar instanceof u)) {
                    throw new NoWhenBranchMatchedException();
                }
                ru.a aVar = (ru.a) dVar;
                aVar.getClass();
                ru.a.i(aVar, new ru.m(3));
            }
            if (fVar.a()) {
                fVar.b();
                return;
            } else {
                t1Var.c(null);
                return;
            }
        }
        if (pVar instanceof r) {
            v vVar2 = (v) cVar.f91586b.invoke();
            if (!(vVar2 instanceof t)) {
                if (!(vVar2 instanceof u)) {
                    throw new NoWhenBranchMatchedException();
                }
                ru.a aVar2 = (ru.a) dVar;
                aVar2.getClass();
                ru.a.i(aVar2, new ru.m(3));
            }
            t1Var.c(Boolean.valueOf(((r) pVar).f47964b));
            return;
        }
        if (!(pVar instanceof s)) {
            throw new NoWhenBranchMatchedException();
        }
        u uVar = ((s) pVar).f47965b;
        fVar.getClass();
        s10.s sVar = new s10.s(13, fVar, uVar);
        if (!fVar.f96340e.getAndSet(true)) {
            m0.t(fVar.f96336a, null, null, new xu.e(sVar, fVar, null), 3);
        }
        ru.a aVar3 = (ru.a) dVar;
        aVar3.getClass();
        ru.a.i(aVar3, new ru.m(4));
    }
}
