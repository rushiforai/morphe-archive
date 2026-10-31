package m1;

import c0.h2;
import c0.w1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Lambda;
import l1.h5;
import z2.i1;

/* loaded from: classes2.dex */
public final class a extends Lambda implements Function3 {

    /* renamed from: k, reason: collision with root package name */
    public static final a f75665k;

    /* renamed from: l, reason: collision with root package name */
    public static final a f75666l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f75667j;

    static {
        int i5 = 3;
        f75665k = new a(i5, 0);
        f75666l = new a(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a(int i5, int i11) {
        super(i5);
        this.f75667j = i11;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f75667j) {
            case 0:
                z2.t0 t0Var = (z2.t0) obj;
                long j11 = ((y3.a) obj3).f96596a;
                int iMo96roundToPx0680j_4 = t0Var.mo96roundToPx0680j_4(c.f75671a);
                int i5 = iMo96roundToPx0680j_4 * 2;
                i1 i1VarH = ((z2.q0) obj2).H(y3.b.i(i5, 0, j11));
                return t0Var.y(i1VarH.f98081a - i5, i1VarH.f98082b, b70.h.f17594a, new h5(iMo96roundToPx0680j_4, 1, i1VarH));
            default:
                w1 w1Var = (w1) obj;
                ((Number) obj3).intValue();
                p1.t tVar = (p1.t) ((p1.o) obj2);
                tVar.b0(-1154662212);
                v vVar = v.f75781a;
                v vVar2 = v.f75782b;
                Object objI = w1Var.c(vVar, vVar2) ? c0.f.i(67, 0, c0.b0.f18713d, 2) : (w1Var.c(vVar2, vVar) || w1Var.c(v.f75783c, vVar2)) ? new h2(83, 67, c0.b0.f18713d) : c0.f.h(0.0f, 0.0f, null, 7);
                tVar.p(false);
                return objI;
        }
    }
}
