package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class j1 extends Lambda implements Function3 {

    /* renamed from: k, reason: collision with root package name */
    public static final j1 f73476k;

    /* renamed from: l, reason: collision with root package name */
    public static final j1 f73477l;

    /* renamed from: m, reason: collision with root package name */
    public static final j1 f73478m;
    public static final j1 n;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73479j;

    static {
        int i5 = 3;
        f73476k = new j1(i5, 0);
        f73477l = new j1(i5, 1);
        f73478m = new j1(i5, 2);
        n = new j1(i5, 3);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j1(int i5, int i11) {
        super(i5);
        this.f73479j = i11;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f73479j) {
            case 0:
                p1.o oVar = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    }
                }
                return Unit.f71706a;
            case 1:
                p1.o oVar2 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    }
                }
                return Unit.f71706a;
            case 2:
                z2.t0 t0Var = (z2.t0) obj;
                long j11 = ((y3.a) obj3).f96596a;
                int iMo96roundToPx0680j_4 = t0Var.mo96roundToPx0680j_4(l5.f73584a);
                int i5 = iMo96roundToPx0680j_4 * 2;
                z2.i1 i1VarH = ((z2.q0) obj2).H(y3.b.i(0, i5, j11));
                int i11 = i1VarH.f98082b - i5;
                return t0Var.y(i1VarH.f98081a, i11, b70.h.f17594a, new h5(iMo96roundToPx0680j_4, 0, i1VarH));
            default:
                k2.f fVar = (k2.f) obj;
                fVar.mo81drawCircleVaOC9Bg(((i2.s) obj3).f61148a, fVar.mo102toPx0680j_4(m6.f73647c) / 2.0f, (120 & 4) != 0 ? fVar.mo93getCenterF1C5BW0() : ((h2.b) obj2).f59016a, 1.0f, (120 & 16) != 0 ? k2.j.f70871a : null, null, 3);
                return Unit.f71706a;
        }
    }
}
