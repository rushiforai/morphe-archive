package p0;

import g0.d1;
import h6.c1;
import java.util.List;
import kotlin.KotlinNothingValueException;
import z2.i1;

/* loaded from: classes2.dex */
public final class f implements g {

    /* renamed from: a, reason: collision with root package name */
    public final int f81154a;

    /* renamed from: b, reason: collision with root package name */
    public final List f81155b;

    /* renamed from: c, reason: collision with root package name */
    public final long f81156c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f81157d;

    /* renamed from: e, reason: collision with root package name */
    public final b2.j f81158e;

    /* renamed from: f, reason: collision with root package name */
    public final y3.n f81159f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f81160g;

    /* renamed from: h, reason: collision with root package name */
    public final int f81161h;

    /* renamed from: i, reason: collision with root package name */
    public final int[] f81162i;

    /* renamed from: j, reason: collision with root package name */
    public int f81163j;

    /* renamed from: k, reason: collision with root package name */
    public int f81164k;

    public f(int i5, int i11, List list, long j11, Object obj, b2.j jVar, y3.n nVar) {
        d1 d1Var = d1.f56493a;
        this.f81154a = i5;
        this.f81155b = list;
        this.f81156c = j11;
        this.f81157d = obj;
        this.f81158e = jVar;
        this.f81159f = nVar;
        d1 d1Var2 = d1.f56493a;
        this.f81160g = false;
        int size = list.size();
        int iMax = 0;
        for (int i12 = 0; i12 < size; i12++) {
            i1 i1Var = (i1) list.get(i12);
            iMax = Math.max(iMax, !this.f81160g ? i1Var.f98082b : i1Var.f98081a);
        }
        this.f81161h = iMax;
        this.f81162i = new int[this.f81155b.size() * 2];
        this.f81164k = Integer.MIN_VALUE;
    }

    public final void a(int i5) {
        this.f81163j += i5;
        int[] iArr = this.f81162i;
        int length = iArr.length;
        for (int i11 = 0; i11 < length; i11++) {
            boolean z11 = this.f81160g;
            if ((z11 && i11 % 2 == 1) || (!z11 && i11 % 2 == 0)) {
                iArr[i11] = iArr[i11] + i5;
            }
        }
    }

    public final void b(int i5, int i11, int i12) {
        int i13;
        this.f81163j = i5;
        boolean z11 = this.f81160g;
        this.f81164k = z11 ? i12 : i11;
        List list = this.f81155b;
        int size = list.size();
        for (int i14 = 0; i14 < size; i14++) {
            i1 i1Var = (i1) list.get(i14);
            int i15 = i14 * 2;
            int[] iArr = this.f81162i;
            if (z11) {
                iArr[i15] = c1.g(1, this.f81159f != y3.n.f96612a ? 0.0f * (-1) : 0.0f, (i11 - i1Var.f98081a) / 2.0f);
                iArr[i15 + 1] = i5;
                i13 = i1Var.f98082b;
            } else {
                iArr[i15] = i5;
                int i16 = i15 + 1;
                b2.j jVar = this.f81158e;
                if (jVar == null) {
                    j0.b.b("null verticalAlignment");
                    throw new KotlinNothingValueException();
                }
                iArr[i16] = jVar.a(i1Var.f98082b, i12);
                i13 = i1Var.f98081a;
            }
            i5 += i13;
        }
    }
}
