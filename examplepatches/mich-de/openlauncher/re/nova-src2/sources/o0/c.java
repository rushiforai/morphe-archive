package o0;

import e1.a1;
import k0.p1;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import t0.t0;

/* loaded from: classes.dex */
public final /* synthetic */ class c implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78719a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f78720b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f78721c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f78722d;

    public /* synthetic */ c(b2.t tVar, a1 a1Var, x1.e eVar, int i5) {
        this.f78720b = tVar;
        this.f78721c = a1Var;
        this.f78722d = eVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5;
        switch (this.f78719a) {
            case 0:
                p1 p1Var = (p1) this.f78720b;
                a0 a0Var = (a0) this.f78721c;
                k0.h hVar = (k0.h) this.f78722d;
                y3.c cVar = (y3.c) obj;
                y3.a aVar = (y3.a) obj2;
                if (y3.a.h(aVar.f96596a) == Integer.MAX_VALUE) {
                    j0.b.a("LazyVerticalStaggeredGrid's width should be bound by parent.");
                }
                y3.n nVar = y3.n.f96612a;
                int iH = y3.a.h(aVar.f96596a) - cVar.mo96roundToPx0680j_4(androidx.compose.foundation.layout.d.d(p1Var, nVar) + androidx.compose.foundation.layout.d.e(p1Var, nVar));
                int iMo96roundToPx0680j_4 = cVar.mo96roundToPx0680j_4(hVar.a());
                int iMax = Math.max((iH + iMo96roundToPx0680j_4) / (cVar.mo96roundToPx0680j_4(a0Var.f78707a) + iMo96roundToPx0680j_4), 1);
                int i11 = iH - ((iMax - 1) * iMo96roundToPx0680j_4);
                int i12 = i11 / iMax;
                int i13 = i11 % iMax;
                int[] iArr = new int[iMax];
                int i14 = 0;
                while (i14 < iMax) {
                    if (i12 < 0) {
                        i5 = 0;
                    } else {
                        i5 = (i14 < i13 ? 1 : 0) + i12;
                    }
                    iArr[i14] = i5;
                    i14++;
                }
                int[] iArr2 = new int[iMax];
                hVar.k(cVar, iH, iArr, y3.n.f96612a, iArr2);
                return new x7.e(iArr2, iArr);
            default:
                ((Integer) obj2).getClass();
                t0.i((b2.t) this.f78720b, (a1) this.f78721c, (x1.e) this.f78722d, (p1.o) obj, p1.a0.l(385));
                return Unit.f71706a;
        }
    }

    public /* synthetic */ c(p1 p1Var, a0 a0Var, k0.h hVar) {
        this.f78720b = p1Var;
        this.f78721c = a0Var;
        this.f78722d = hVar;
    }
}
