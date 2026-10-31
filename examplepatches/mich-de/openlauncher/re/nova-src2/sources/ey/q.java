package ey;

import c3.z1;
import i2.r0;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import l1.g9;
import l1.s1;
import m3.p0;

/* loaded from: classes4.dex */
public final class q implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final q f53175b = new q(0);

    /* renamed from: c, reason: collision with root package name */
    public static final q f53176c = new q(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53177a;

    public /* synthetic */ q(int i5) {
        this.f53177a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0036  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0083  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f53177a) {
            case 0:
                ((Number) obj).intValue();
                p1.o oVar = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        p1.t tVar2 = (p1.t) oVar;
                        tVar2.b0(-102216776);
                        float fMo97toDpGaN1DYA = ((y3.c) tVar2.j(z1.f19497h)).mo97toDpGaN1DYA(((p0) tVar2.j(g9.f73360a)).f75956a.f75884b);
                        tVar2.p(false);
                        k0.p.a(androidx.compose.foundation.a.b(fg.a.g(androidx.compose.foundation.layout.e.t(androidx.compose.foundation.layout.e.g(b2.r.f17024a, fMo97toDpGaN1DYA), 80), s0.h.f86511a), i2.s.b(0.1f, ((i2.s) tVar2.j(s1.f73932a)).f61148a), r0.f61135a), tVar2, 0);
                    }
                }
                break;
            default:
                float f11 = ((y3.f) obj).f96602a;
                p1.o oVar2 = (p1.o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p1.t) oVar2).c(f11) ? 4 : 2;
                }
                if ((iIntValue & 19) == 18) {
                    p1.t tVar3 = (p1.t) oVar2;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        p1.t tVar4 = (p1.t) oVar2;
                        k0.p.a(androidx.compose.foundation.a.b(fg.a.g(androidx.compose.foundation.layout.e.o(b2.r.f17024a, f11), s0.h.f86511a), i2.s.b(0.1f, ((i2.s) tVar4.j(s1.f73932a)).f61148a), r0.f61135a), tVar4, 0);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
