package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class y extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f74273j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ int f74274k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f74275l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ k0.h f74276m;
    public final /* synthetic */ long n;
    public final /* synthetic */ z2.i1 o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ z2.t0 f74277p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ k0.j f74278q;

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ int f74279r;

    /* renamed from: s, reason: collision with root package name */
    public final /* synthetic */ int f74280s;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(z2.i1 i1Var, int i5, z2.i1 i1Var2, k0.h hVar, long j11, z2.i1 i1Var3, z2.t0 t0Var, k0.j jVar, int i11, int i12) {
        super(1);
        this.f74273j = i1Var;
        this.f74274k = i5;
        this.f74275l = i1Var2;
        this.f74276m = hVar;
        this.n = j11;
        this.o = i1Var3;
        this.f74277p = t0Var;
        this.f74278q = jVar;
        this.f74279r = i11;
        this.f74280s = i12;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int iH;
        int iH2;
        z2.h1 h1Var = (z2.h1) obj;
        z2.i1 i1Var = this.f74273j;
        int i5 = i1Var.f98082b;
        int i11 = this.f74274k;
        int iMax = 0;
        z2.h1.m(h1Var, i1Var, 0, (i11 - i5) / 2);
        k0.f fVar = k0.k.f70659e;
        k0.h hVar = this.f74276m;
        boolean zB = Intrinsics.b(hVar, fVar);
        z2.i1 i1Var2 = this.o;
        z2.i1 i1Var3 = this.f74275l;
        long j11 = this.n;
        if (zB) {
            int iH3 = y3.a.h(j11);
            int i12 = i1Var3.f98081a;
            iH = (iH3 - i12) / 2;
            int i13 = i1Var.f98081a;
            if (iH < i13) {
                iH2 = i13 - iH;
            } else if (i12 + iH > y3.a.h(j11) - i1Var2.f98081a) {
                iH2 = (y3.a.h(j11) - i1Var2.f98081a) - (i1Var3.f98081a + iH);
            }
            iH += iH2;
        } else {
            iH = Intrinsics.b(hVar, k0.k.f70656b) ? (y3.a.h(j11) - i1Var3.f98081a) - i1Var2.f98081a : Math.max(this.f74277p.mo96roundToPx0680j_4(i0.f73418d), i1Var.f98081a);
        }
        k0.j jVar = this.f74278q;
        if (Intrinsics.b(jVar, fVar)) {
            iMax = (i11 - i1Var3.f98082b) / 2;
        } else if (Intrinsics.b(jVar, k0.k.f70658d)) {
            int i14 = this.f74279r;
            if (i14 == 0) {
                iMax = i11 - i1Var3.f98082b;
            } else {
                int i15 = i1Var3.f98082b;
                int iG = i14 - (i15 - this.f74280s);
                int i16 = i15 + iG;
                if (i16 > y3.a.g(j11)) {
                    iG -= i16 - y3.a.g(j11);
                }
                iMax = (i11 - i1Var3.f98082b) - Math.max(0, iG);
            }
        }
        z2.h1.m(h1Var, i1Var3, iH, iMax);
        z2.h1.m(h1Var, i1Var2, y3.a.h(j11) - i1Var2.f98081a, (i11 - i1Var2.f98082b) / 2);
        return Unit.f71706a;
    }
}
