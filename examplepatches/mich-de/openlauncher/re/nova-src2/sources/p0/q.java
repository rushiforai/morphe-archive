package p0;

import g0.d1;
import java.util.List;
import java.util.Map;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import t70.j0;
import z2.s0;

/* loaded from: classes2.dex */
public final class q implements s0 {

    /* renamed from: a, reason: collision with root package name */
    public final List f81189a;

    /* renamed from: b, reason: collision with root package name */
    public final int f81190b;

    /* renamed from: c, reason: collision with root package name */
    public final int f81191c;

    /* renamed from: d, reason: collision with root package name */
    public final int f81192d;

    /* renamed from: e, reason: collision with root package name */
    public final d1 f81193e;

    /* renamed from: f, reason: collision with root package name */
    public final int f81194f;

    /* renamed from: g, reason: collision with root package name */
    public final int f81195g;

    /* renamed from: h, reason: collision with root package name */
    public final int f81196h;

    /* renamed from: i, reason: collision with root package name */
    public final f f81197i;

    /* renamed from: j, reason: collision with root package name */
    public final f f81198j;

    /* renamed from: k, reason: collision with root package name */
    public final float f81199k;

    /* renamed from: l, reason: collision with root package name */
    public final int f81200l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f81201m;
    public final h0.m n;
    public final s0 o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f81202p;

    /* renamed from: q, reason: collision with root package name */
    public final List f81203q;

    /* renamed from: r, reason: collision with root package name */
    public final List f81204r;

    /* renamed from: s, reason: collision with root package name */
    public final j0 f81205s;

    public q(List list, int i5, int i11, int i12, d1 d1Var, int i13, int i14, int i15, f fVar, f fVar2, float f11, int i16, boolean z11, h0.m mVar, s0 s0Var, boolean z12, List list2, List list3, j0 j0Var) {
        this.f81189a = list;
        this.f81190b = i5;
        this.f81191c = i11;
        this.f81192d = i12;
        this.f81193e = d1Var;
        this.f81194f = i13;
        this.f81195g = i14;
        this.f81196h = i15;
        this.f81197i = fVar;
        this.f81198j = fVar2;
        this.f81199k = f11;
        this.f81200l = i16;
        this.f81201m = z11;
        this.n = mVar;
        this.o = s0Var;
        this.f81202p = z12;
        this.f81203q = list2;
        this.f81204r = list3;
        this.f81205s = j0Var;
    }

    @Override // z2.s0
    public final Map a() {
        return this.o.a();
    }

    @Override // z2.s0
    public final void b() {
        this.o.b();
    }

    @Override // z2.s0
    public final Function1 c() {
        return this.o.c();
    }

    public final q d(int i5) {
        int i11;
        int i12 = this.f81190b + this.f81191c;
        if (this.f81202p) {
            return null;
        }
        List list = this.f81189a;
        if (list.isEmpty() || this.f81197i == null || (i11 = this.f81200l - i5) < 0 || i11 >= i12) {
            return null;
        }
        float f11 = this.f81199k - (i12 != 0 ? i5 / i12 : 0.0f);
        if (this.f81198j == null || f11 >= 0.5f || f11 <= -0.5f) {
            return null;
        }
        f fVar = (f) b70.g.W0(list);
        f fVar2 = (f) b70.g.h1(list);
        int i13 = this.f81195g;
        int i14 = this.f81194f;
        if (i5 < 0) {
            if (Math.min((fVar.f81163j + i12) - i14, (fVar2.f81163j + i12) - i13) <= (-i5)) {
                return null;
            }
        } else if (Math.min(i14 - fVar.f81163j, i13 - fVar2.f81163j) <= i5) {
            return null;
        }
        int size = list.size();
        for (int i15 = 0; i15 < size; i15++) {
            ((f) list.get(i15)).a(i5);
        }
        List list2 = this.f81203q;
        int size2 = list2.size();
        for (int i16 = 0; i16 < size2; i16++) {
            ((f) list2.get(i16)).a(i5);
        }
        List list3 = this.f81204r;
        int size3 = list3.size();
        for (int i17 = 0; i17 < size3; i17++) {
            ((f) list3.get(i17)).a(i5);
        }
        return new q(this.f81189a, this.f81190b, this.f81191c, this.f81192d, this.f81193e, this.f81194f, this.f81195g, this.f81196h, this.f81197i, this.f81198j, f11, i11, this.f81201m || i5 > 0, this.n, this.o, this.f81202p, this.f81203q, this.f81204r, this.f81205s);
    }

    public final long e() {
        s0 s0Var = this.o;
        return (s0Var.getWidth() << 32) | (s0Var.getHeight() & 4294967295L);
    }

    @Override // z2.s0
    public final int getHeight() {
        return this.o.getHeight();
    }

    @Override // z2.s0
    public final int getWidth() {
        return this.o.getWidth();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public q(List list, int i5, int i11, int i12, int i13, int i14, int i15, h0.m mVar, s0 s0Var, j0 j0Var) {
        d1 d1Var = d1.f56494b;
        EmptyList emptyList = EmptyList.f71733a;
        this(list, i5, i11, i12, d1Var, i13, i14, i15, null, null, 0.0f, 0, false, mVar, s0Var, false, emptyList, emptyList, j0Var);
    }
}
