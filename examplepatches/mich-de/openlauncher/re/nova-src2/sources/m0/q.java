package m0;

import g0.d1;
import java.util.List;
import java.util.Map;
import kotlin.jvm.functions.Function1;
import t70.j0;
import z2.s0;

/* loaded from: classes.dex */
public final class q implements s0 {

    /* renamed from: a, reason: collision with root package name */
    public final r f75466a;

    /* renamed from: b, reason: collision with root package name */
    public final int f75467b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f75468c;

    /* renamed from: d, reason: collision with root package name */
    public final float f75469d;

    /* renamed from: e, reason: collision with root package name */
    public final s0 f75470e;

    /* renamed from: f, reason: collision with root package name */
    public final float f75471f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f75472g;

    /* renamed from: h, reason: collision with root package name */
    public final j0 f75473h;

    /* renamed from: i, reason: collision with root package name */
    public final y3.c f75474i;

    /* renamed from: j, reason: collision with root package name */
    public final long f75475j;

    /* renamed from: k, reason: collision with root package name */
    public final List f75476k;

    /* renamed from: l, reason: collision with root package name */
    public final int f75477l;

    /* renamed from: m, reason: collision with root package name */
    public final int f75478m;
    public final int n;
    public final d1 o;

    /* renamed from: p, reason: collision with root package name */
    public final int f75479p;

    /* renamed from: q, reason: collision with root package name */
    public final int f75480q;

    public q(r rVar, int i5, boolean z11, float f11, s0 s0Var, float f12, boolean z12, j0 j0Var, y3.c cVar, long j11, List list, int i11, int i12, int i13, d1 d1Var, int i14, int i15) {
        this.f75466a = rVar;
        this.f75467b = i5;
        this.f75468c = z11;
        this.f75469d = f11;
        this.f75470e = s0Var;
        this.f75471f = f12;
        this.f75472g = z12;
        this.f75473h = j0Var;
        this.f75474i = cVar;
        this.f75475j = j11;
        this.f75476k = list;
        this.f75477l = i11;
        this.f75478m = i12;
        this.n = i13;
        this.o = d1Var;
        this.f75479p = i14;
        this.f75480q = i15;
    }

    @Override // z2.s0
    public final Map a() {
        return this.f75470e.a();
    }

    @Override // z2.s0
    public final void b() {
        this.f75470e.b();
    }

    @Override // z2.s0
    public final Function1 c() {
        return this.f75470e.c();
    }

    public final q d(int i5, boolean z11) {
        r rVar;
        int i11;
        int i12;
        int i13;
        if (this.f75472g) {
            return null;
        }
        List list = this.f75476k;
        if (list.isEmpty() || (rVar = this.f75466a) == null) {
            return null;
        }
        int i14 = rVar.f75495q;
        int i15 = this.f75467b - i5;
        if (i15 < 0 || i15 >= i14) {
            return null;
        }
        r rVar2 = (r) b70.g.W0(list);
        r rVar3 = (r) b70.g.h1(list);
        if (rVar2.f75497s || rVar3.f75497s) {
            return null;
        }
        int i16 = this.f75478m;
        int i17 = this.f75477l;
        if (i5 < 0) {
            if (Math.min((rVar2.o + rVar2.f75495q) - i17, (rVar3.o + rVar3.f75495q) - i16) <= (-i5)) {
                return null;
            }
        } else if (Math.min(i17 - rVar2.o, i16 - rVar3.o) <= i5) {
            return null;
        }
        int size = list.size();
        int i18 = 0;
        while (i18 < size) {
            r rVar4 = (r) list.get(i18);
            boolean z12 = rVar4.f75483c;
            int[] iArr = rVar4.f75501w;
            if (!rVar4.f75497s) {
                rVar4.o += i5;
                int length = iArr.length;
                for (int i19 = 0; i19 < length; i19++) {
                    int i21 = i19 & 1;
                    if ((z12 && i21 != 0) || (!z12 && i21 == 0)) {
                        iArr[i19] = iArr[i19] + i5;
                    }
                }
                if (z11) {
                    int size2 = rVar4.f75482b.size();
                    int i22 = 0;
                    while (i22 < size2) {
                        n0.t tVarA = rVar4.f75493m.a(i22, rVar4.f75491k);
                        if (tVarA != null) {
                            long j11 = tVarA.f77500l;
                            if (z12) {
                                i11 = i18;
                                i12 = (int) (j11 >> 32);
                                i13 = ((int) (j11 & 4294967295L)) + i5;
                            } else {
                                i11 = i18;
                                i12 = ((int) (j11 >> 32)) + i5;
                                i13 = (int) (j11 & 4294967295L);
                            }
                            tVarA.f77500l = (i13 & 4294967295L) | (i12 << 32);
                        } else {
                            i11 = i18;
                        }
                        i22++;
                        i18 = i11;
                    }
                }
            }
            i18++;
        }
        return new q(this.f75466a, i15, this.f75468c || i5 > 0, i5, this.f75470e, this.f75471f, this.f75472g, this.f75473h, this.f75474i, this.f75475j, this.f75476k, this.f75477l, this.f75478m, this.n, this.o, this.f75479p, this.f75480q);
    }

    public final long e() {
        s0 s0Var = this.f75470e;
        return (s0Var.getWidth() << 32) | (s0Var.getHeight() & 4294967295L);
    }

    @Override // z2.s0
    public final int getHeight() {
        return this.f75470e.getHeight();
    }

    @Override // z2.s0
    public final int getWidth() {
        return this.f75470e.getWidth();
    }
}
