package o0;

import com.google.android.gms.internal.measurement.v6;
import g0.d1;
import java.util.List;
import java.util.Map;
import kotlin.jvm.functions.Function1;
import t70.j0;
import z2.s0;

/* loaded from: classes.dex */
public final class p implements s0 {

    /* renamed from: a, reason: collision with root package name */
    public final int[] f78775a;

    /* renamed from: b, reason: collision with root package name */
    public final int[] f78776b;

    /* renamed from: c, reason: collision with root package name */
    public final float f78777c;

    /* renamed from: d, reason: collision with root package name */
    public final s0 f78778d;

    /* renamed from: e, reason: collision with root package name */
    public final float f78779e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f78780f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f78781g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f78782h;

    /* renamed from: i, reason: collision with root package name */
    public final x7.e f78783i;

    /* renamed from: j, reason: collision with root package name */
    public final v6 f78784j;

    /* renamed from: k, reason: collision with root package name */
    public final y3.c f78785k;

    /* renamed from: l, reason: collision with root package name */
    public final int f78786l;

    /* renamed from: m, reason: collision with root package name */
    public final List f78787m;
    public final long n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f78788p;

    /* renamed from: q, reason: collision with root package name */
    public final int f78789q;

    /* renamed from: r, reason: collision with root package name */
    public final int f78790r;

    /* renamed from: s, reason: collision with root package name */
    public final int f78791s;

    /* renamed from: t, reason: collision with root package name */
    public final j0 f78792t;

    /* renamed from: u, reason: collision with root package name */
    public final d1 f78793u;

    public p(int[] iArr, int[] iArr2, float f11, s0 s0Var, float f12, boolean z11, boolean z12, boolean z13, x7.e eVar, v6 v6Var, y3.c cVar, int i5, List list, long j11, int i11, int i12, int i13, int i14, int i15, j0 j0Var) {
        this.f78775a = iArr;
        this.f78776b = iArr2;
        this.f78777c = f11;
        this.f78778d = s0Var;
        this.f78779e = f12;
        this.f78780f = z11;
        this.f78781g = z12;
        this.f78782h = z13;
        this.f78783i = eVar;
        this.f78784j = v6Var;
        this.f78785k = cVar;
        this.f78786l = i5;
        this.f78787m = list;
        this.n = j11;
        this.o = i11;
        this.f78788p = i12;
        this.f78789q = i13;
        this.f78790r = i14;
        this.f78791s = i15;
        this.f78792t = j0Var;
        this.f78793u = z12 ? d1.f56493a : d1.f56494b;
    }

    @Override // z2.s0
    public final Map a() {
        return this.f78778d.a();
    }

    @Override // z2.s0
    public final void b() {
        this.f78778d.b();
    }

    @Override // z2.s0
    public final Function1 c() {
        return this.f78778d.c();
    }

    public final p d(int i5, boolean z11) {
        n0.t tVar;
        int i11;
        if (this.f78782h) {
            return null;
        }
        List list = this.f78787m;
        if (list.isEmpty()) {
            return null;
        }
        int[] iArr = this.f78775a;
        if (iArr.length == 0) {
            return null;
        }
        int[] iArr2 = this.f78776b;
        if (iArr2.length == 0) {
            return null;
        }
        int i12 = this.f78790r;
        int i13 = this.f78788p;
        int i14 = i13 - i12;
        List list2 = list;
        int size = list2.size();
        for (int i15 = 0; i15 < size; i15++) {
            s sVar = (s) list.get(i15);
            boolean z12 = sVar.f78810r;
            int i16 = sVar.n;
            if (z12) {
                return null;
            }
            if ((sVar.l() <= 0) != (sVar.l() + i5 <= 0)) {
                return null;
            }
            int iL = sVar.l();
            int i17 = this.o;
            if (iL <= i17) {
                if (i5 < 0) {
                    if ((sVar.l() + i16) - i17 <= (-i5)) {
                        return null;
                    }
                } else if (i17 - sVar.l() <= i5) {
                    return null;
                }
            }
            if (sVar.l() + i16 >= i14) {
                if (i5 < 0) {
                    if ((sVar.l() + i16) - i13 <= (-i5)) {
                        return null;
                    }
                } else if (i13 - sVar.l() <= i5) {
                    return null;
                }
            }
        }
        int size2 = list2.size();
        for (int i18 = 0; i18 < size2; i18++) {
            s sVar2 = (s) list.get(i18);
            boolean z13 = sVar2.f78798d;
            if (!sVar2.f78810r) {
                long j11 = sVar2.f78812t;
                sVar2.f78812t = ((z13 ? ((int) (j11 & 4294967295L)) + i5 : (int) (j11 & 4294967295L)) & 4294967295L) | ((z13 ? (int) (j11 >> 32) : ((int) (j11 >> 32)) + i5) << 32);
                if (z11) {
                    int size3 = sVar2.f78797c.size();
                    for (int i19 = 0; i19 < size3; i19++) {
                        n0.t tVarA = sVar2.f78804j.a(i19, sVar2.f78796b);
                        if (tVarA != null) {
                            long j12 = tVarA.f77500l;
                            if (z13) {
                                tVar = tVarA;
                                i11 = (int) (j12 >> 32);
                            } else {
                                tVar = tVarA;
                                i11 = ((int) (j12 >> 32)) + i5;
                            }
                            tVar.f77500l = ((z13 ? ((int) (j12 & 4294967295L)) + i5 : (int) (j12 & 4294967295L)) & 4294967295L) | (i11 << 32);
                        }
                    }
                }
            }
        }
        int length = iArr2.length;
        int[] iArr3 = new int[length];
        for (int i21 = 0; i21 < length; i21++) {
            iArr3[i21] = iArr2[i21] - i5;
        }
        return new p(iArr, iArr3, i5, this.f78778d, this.f78779e, this.f78780f || i5 > 0, this.f78781g, this.f78782h, this.f78783i, this.f78784j, this.f78785k, this.f78786l, this.f78787m, this.n, this.o, this.f78788p, this.f78789q, this.f78790r, this.f78791s, this.f78792t);
    }

    @Override // z2.s0
    public final int getHeight() {
        return this.f78778d.getHeight();
    }

    @Override // z2.s0
    public final int getWidth() {
        return this.f78778d.getWidth();
    }
}
