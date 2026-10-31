package e4;

import io.sentry.e3;
import java.util.ArrayList;
import java.util.Arrays;
import mg.l;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: q, reason: collision with root package name */
    public static boolean f52134q = false;

    /* renamed from: d, reason: collision with root package name */
    public final e f52138d;

    /* renamed from: m, reason: collision with root package name */
    public final l f52147m;

    /* renamed from: p, reason: collision with root package name */
    public b f52148p;

    /* renamed from: a, reason: collision with root package name */
    public int f52135a = 1000;

    /* renamed from: b, reason: collision with root package name */
    public boolean f52136b = false;

    /* renamed from: c, reason: collision with root package name */
    public int f52137c = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f52139e = 32;

    /* renamed from: f, reason: collision with root package name */
    public int f52140f = 32;

    /* renamed from: h, reason: collision with root package name */
    public boolean f52142h = false;

    /* renamed from: i, reason: collision with root package name */
    public boolean[] f52143i = new boolean[32];

    /* renamed from: j, reason: collision with root package name */
    public int f52144j = 1;

    /* renamed from: k, reason: collision with root package name */
    public int f52145k = 0;

    /* renamed from: l, reason: collision with root package name */
    public int f52146l = 32;
    public f[] n = new f[1000];
    public int o = 0;

    /* renamed from: g, reason: collision with root package name */
    public b[] f52141g = new b[32];

    public c() {
        s();
        l lVar = new l(25, false);
        lVar.f76309b = new d();
        lVar.f76310c = new d();
        lVar.f76311d = new f[32];
        this.f52147m = lVar;
        e eVar = new e(lVar);
        eVar.f52151f = new f[128];
        eVar.f52152g = new f[128];
        eVar.f52153h = 0;
        eVar.f52154i = new e3(eVar, 10);
        this.f52138d = eVar;
        this.f52148p = new b(lVar);
    }

    public static int n(Object obj) {
        f fVar = ((g4.c) obj).f57081i;
        if (fVar != null) {
            return (int) (fVar.f52159e + 0.5f);
        }
        return 0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v0, types: [java.lang.Object[]] */
    /* JADX WARN: Type inference failed for: r4v0 */
    public final f a(int i5) {
        d dVar = (d) this.f52147m.f76310c;
        int i11 = dVar.f52150b;
        f fVar = null;
        if (i11 > 0) {
            int i12 = i11 - 1;
            ?? r32 = dVar.f52149a;
            ?? r42 = r32[i12];
            r32[i12] = 0;
            dVar.f52150b = i12;
            fVar = r42;
        }
        f fVar2 = fVar;
        if (fVar2 == null) {
            fVar2 = new f(i5);
            fVar2.f52166l = i5;
        } else {
            fVar2.c();
            fVar2.f52166l = i5;
        }
        int i13 = this.o;
        int i14 = this.f52135a;
        if (i13 >= i14) {
            int i15 = i14 * 2;
            this.f52135a = i15;
            this.n = (f[]) Arrays.copyOf(this.n, i15);
        }
        f[] fVarArr = this.n;
        int i16 = this.o;
        this.o = i16 + 1;
        fVarArr[i16] = fVar2;
        return fVar2;
    }

    public final void b(f fVar, f fVar2, int i5, float f11, f fVar3, f fVar4, int i11, int i12) {
        b bVarL = l();
        if (fVar2 == fVar3) {
            bVarL.f52132d.g(fVar, 1.0f);
            bVarL.f52132d.g(fVar4, 1.0f);
            bVarL.f52132d.g(fVar2, -2.0f);
        } else if (f11 == 0.5f) {
            bVarL.f52132d.g(fVar, 1.0f);
            bVarL.f52132d.g(fVar2, -1.0f);
            bVarL.f52132d.g(fVar3, -1.0f);
            bVarL.f52132d.g(fVar4, 1.0f);
            if (i5 > 0 || i11 > 0) {
                bVarL.f52130b = (-i5) + i11;
            }
        } else if (f11 <= 0.0f) {
            bVarL.f52132d.g(fVar, -1.0f);
            bVarL.f52132d.g(fVar2, 1.0f);
            bVarL.f52130b = i5;
        } else if (f11 >= 1.0f) {
            bVarL.f52132d.g(fVar4, -1.0f);
            bVarL.f52132d.g(fVar3, 1.0f);
            bVarL.f52130b = -i11;
        } else {
            float f12 = 1.0f - f11;
            bVarL.f52132d.g(fVar, f12 * 1.0f);
            bVarL.f52132d.g(fVar2, f12 * (-1.0f));
            bVarL.f52132d.g(fVar3, (-1.0f) * f11);
            bVarL.f52132d.g(fVar4, 1.0f * f11);
            if (i5 > 0 || i11 > 0) {
                bVarL.f52130b = (i11 * f11) + ((-i5) * f12);
            }
        }
        if (i12 != 8) {
            bVarL.a(this, i12);
        }
        c(bVarL);
    }

    /* JADX WARN: Removed duplicated region for block: B:120:0x01ae  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x01b3  */
    /* JADX WARN: Removed duplicated region for block: B:156:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00f8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(b bVar) {
        boolean z11;
        boolean z12;
        f fVar;
        f fVarF;
        if (this.f52145k + 1 >= this.f52146l || this.f52144j + 1 >= this.f52140f) {
            o();
        }
        if (bVar.f52133e) {
            z11 = false;
        } else {
            ArrayList arrayList = bVar.f52131c;
            if (this.f52141g.length != 0) {
                boolean z13 = false;
                while (!z13) {
                    int iD = bVar.f52132d.d();
                    for (int i5 = 0; i5 < iD; i5++) {
                        f fVarE = bVar.f52132d.e(i5);
                        if (fVarE.f52157c != -1 || fVarE.f52160f) {
                            arrayList.add(fVarE);
                        }
                    }
                    int size = arrayList.size();
                    if (size > 0) {
                        for (int i11 = 0; i11 < size; i11++) {
                            f fVar2 = (f) arrayList.get(i11);
                            if (fVar2.f52160f) {
                                bVar.h(this, fVar2, true);
                            } else {
                                bVar.i(this, this.f52141g[fVar2.f52157c], true);
                            }
                        }
                        arrayList.clear();
                    } else {
                        z13 = true;
                    }
                }
                if (bVar.f52129a != null && bVar.f52132d.d() == 0) {
                    bVar.f52133e = true;
                    this.f52136b = true;
                }
            }
            if (bVar.e()) {
                return;
            }
            float f11 = bVar.f52130b;
            float f12 = 0.0f;
            if (f11 < 0.0f) {
                bVar.f52130b = f11 * (-1.0f);
                a aVar = bVar.f52132d;
                int i12 = aVar.f52126h;
                for (int i13 = 0; i12 != -1 && i13 < aVar.f52119a; i13++) {
                    float[] fArr = aVar.f52125g;
                    fArr[i12] = fArr[i12] * (-1.0f);
                    i12 = aVar.f52124f[i12];
                }
            }
            int iD2 = bVar.f52132d.d();
            float f13 = 0.0f;
            float f14 = 0.0f;
            f fVar3 = null;
            f fVar4 = null;
            int i14 = 0;
            boolean z14 = false;
            boolean z15 = false;
            while (i14 < iD2) {
                float f15 = bVar.f52132d.f(i14);
                f fVarE2 = bVar.f52132d.e(i14);
                float f16 = f12;
                if (fVarE2.f52166l == 1) {
                    if (fVar3 == null) {
                        z14 = fVarE2.f52165k <= 1;
                    } else if (f13 > f15) {
                        if (fVarE2.f52165k <= 1) {
                        }
                    } else if (z14 || fVarE2.f52165k > 1) {
                    }
                    fVar3 = fVarE2;
                    f13 = f15;
                } else if (fVar3 == null && f15 < f16) {
                    if (fVar4 == null) {
                        z15 = fVarE2.f52165k <= 1;
                    } else if (f14 > f15) {
                        if (fVarE2.f52165k <= 1) {
                        }
                    } else if (z15 || fVarE2.f52165k > 1) {
                    }
                    fVar4 = fVarE2;
                    f14 = f15;
                }
                i14++;
                f12 = f16;
            }
            float f17 = f12;
            if (fVar3 == null) {
                fVar3 = fVar4;
            }
            if (fVar3 == null) {
                z12 = true;
            } else {
                bVar.g(fVar3);
                z12 = false;
            }
            if (bVar.f52132d.d() == 0) {
                bVar.f52133e = true;
            }
            if (z12) {
                if (this.f52144j + 1 >= this.f52140f) {
                    o();
                }
                f fVarA = a(3);
                int i15 = this.f52137c + 1;
                this.f52137c = i15;
                this.f52144j++;
                fVarA.f52156b = i15;
                l lVar = this.f52147m;
                ((f[]) lVar.f76311d)[i15] = fVarA;
                bVar.f52129a = fVarA;
                int i16 = this.f52145k;
                h(bVar);
                if (this.f52145k == i16 + 1) {
                    b bVar2 = this.f52148p;
                    bVar2.f52129a = null;
                    bVar2.f52132d.b();
                    for (int i17 = 0; i17 < bVar.f52132d.d(); i17++) {
                        bVar2.f52132d.a(bVar.f52132d.e(i17), bVar.f52132d.f(i17), true);
                    }
                    r(this.f52148p);
                    if (fVarA.f52157c == -1) {
                        if (bVar.f52129a == fVarA && (fVarF = bVar.f(null, fVarA)) != null) {
                            bVar.g(fVarF);
                        }
                        if (!bVar.f52133e) {
                            bVar.f52129a.g(this, bVar);
                        }
                        ((d) lVar.f76309b).b(bVar);
                        this.f52145k--;
                    }
                    z11 = true;
                }
                fVar = bVar.f52129a;
                if (fVar != null) {
                }
            } else {
                z11 = false;
                fVar = bVar.f52129a;
                if (fVar != null) {
                    return;
                }
                if (fVar.f52166l != 1 && bVar.f52130b < f17) {
                    return;
                }
            }
        }
        if (z11) {
            return;
        }
        h(bVar);
    }

    public final void d(f fVar, int i5) {
        int i11 = fVar.f52157c;
        if (i11 == -1) {
            fVar.d(this, i5);
            for (int i12 = 0; i12 < this.f52137c + 1; i12++) {
                f fVar2 = ((f[]) this.f52147m.f76311d)[i12];
            }
            return;
        }
        if (i11 == -1) {
            b bVarL = l();
            bVarL.f52129a = fVar;
            float f11 = i5;
            fVar.f52159e = f11;
            bVarL.f52130b = f11;
            bVarL.f52133e = true;
            c(bVarL);
            return;
        }
        b bVar = this.f52141g[i11];
        if (bVar.f52133e) {
            bVar.f52130b = i5;
            return;
        }
        if (bVar.f52132d.d() == 0) {
            bVar.f52133e = true;
            bVar.f52130b = i5;
            return;
        }
        b bVarL2 = l();
        if (i5 < 0) {
            bVarL2.f52130b = i5 * (-1);
            bVarL2.f52132d.g(fVar, 1.0f);
        } else {
            bVarL2.f52130b = i5;
            bVarL2.f52132d.g(fVar, -1.0f);
        }
        c(bVarL2);
    }

    public final void e(f fVar, f fVar2, int i5, int i11) {
        if (i11 == 8 && fVar2.f52160f && fVar.f52157c == -1) {
            fVar.d(this, fVar2.f52159e + i5);
            return;
        }
        b bVarL = l();
        boolean z11 = false;
        if (i5 != 0) {
            if (i5 < 0) {
                i5 *= -1;
                z11 = true;
            }
            bVarL.f52130b = i5;
        }
        if (z11) {
            bVarL.f52132d.g(fVar, 1.0f);
            bVarL.f52132d.g(fVar2, -1.0f);
        } else {
            bVarL.f52132d.g(fVar, -1.0f);
            bVarL.f52132d.g(fVar2, 1.0f);
        }
        if (i11 != 8) {
            bVarL.a(this, i11);
        }
        c(bVarL);
    }

    public final void f(f fVar, f fVar2, int i5, int i11) {
        b bVarL = l();
        f fVarM = m();
        fVarM.f52158d = 0;
        bVarL.b(fVar, fVar2, fVarM, i5);
        if (i11 != 8) {
            bVarL.f52132d.g(j(i11), (int) (bVarL.f52132d.c(fVarM) * (-1.0f)));
        }
        c(bVarL);
    }

    public final void g(f fVar, f fVar2, int i5, int i11) {
        b bVarL = l();
        f fVarM = m();
        fVarM.f52158d = 0;
        bVarL.c(fVar, fVar2, fVarM, i5);
        if (i11 != 8) {
            bVarL.f52132d.g(j(i11), (int) (bVarL.f52132d.c(fVarM) * (-1.0f)));
        }
        c(bVarL);
    }

    public final void h(b bVar) {
        int i5;
        if (bVar.f52133e) {
            bVar.f52129a.d(this, bVar.f52130b);
        } else {
            b[] bVarArr = this.f52141g;
            int i11 = this.f52145k;
            bVarArr[i11] = bVar;
            f fVar = bVar.f52129a;
            fVar.f52157c = i11;
            this.f52145k = i11 + 1;
            fVar.g(this, bVar);
        }
        if (this.f52136b) {
            int i12 = 0;
            while (i12 < this.f52145k) {
                if (this.f52141g[i12] == null) {
                    System.out.println("WTF");
                }
                b bVar2 = this.f52141g[i12];
                if (bVar2 != null && bVar2.f52133e) {
                    bVar2.f52129a.d(this, bVar2.f52130b);
                    ((d) this.f52147m.f76309b).b(bVar2);
                    this.f52141g[i12] = null;
                    int i13 = i12 + 1;
                    int i14 = i13;
                    while (true) {
                        i5 = this.f52145k;
                        if (i13 >= i5) {
                            break;
                        }
                        b[] bVarArr2 = this.f52141g;
                        int i15 = i13 - 1;
                        b bVar3 = bVarArr2[i13];
                        bVarArr2[i15] = bVar3;
                        f fVar2 = bVar3.f52129a;
                        if (fVar2.f52157c == i13) {
                            fVar2.f52157c = i15;
                        }
                        i14 = i13;
                        i13++;
                    }
                    if (i14 < i5) {
                        this.f52141g[i14] = null;
                    }
                    this.f52145k = i5 - 1;
                    i12--;
                }
                i12++;
            }
            this.f52136b = false;
        }
    }

    public final void i() {
        for (int i5 = 0; i5 < this.f52145k; i5++) {
            b bVar = this.f52141g[i5];
            bVar.f52129a.f52159e = bVar.f52130b;
        }
    }

    public final f j(int i5) {
        if (this.f52144j + 1 >= this.f52140f) {
            o();
        }
        f fVarA = a(4);
        float[] fArr = fVarA.f52162h;
        int i11 = this.f52137c + 1;
        this.f52137c = i11;
        this.f52144j++;
        fVarA.f52156b = i11;
        fVarA.f52158d = i5;
        ((f[]) this.f52147m.f76311d)[i11] = fVarA;
        e eVar = this.f52138d;
        eVar.f52154i.f67208b = fVarA;
        Arrays.fill(fArr, 0.0f);
        fArr[fVarA.f52158d] = 1.0f;
        eVar.j(fVarA);
        return fVarA;
    }

    public final f k(Object obj) {
        if (obj == null) {
            return null;
        }
        if (this.f52144j + 1 >= this.f52140f) {
            o();
        }
        if (!(obj instanceof g4.c)) {
            return null;
        }
        g4.c cVar = (g4.c) obj;
        f fVar = cVar.f57081i;
        if (fVar == null) {
            cVar.k();
            fVar = cVar.f57081i;
        }
        int i5 = fVar.f52156b;
        l lVar = this.f52147m;
        if (i5 != -1 && i5 <= this.f52137c && ((f[]) lVar.f76311d)[i5] != null) {
            return fVar;
        }
        if (i5 != -1) {
            fVar.c();
        }
        int i11 = this.f52137c + 1;
        this.f52137c = i11;
        this.f52144j++;
        fVar.f52156b = i11;
        fVar.f52166l = 1;
        ((f[]) lVar.f76311d)[i11] = fVar;
        return fVar;
    }

    public final b l() {
        Object obj;
        l lVar = this.f52147m;
        d dVar = (d) lVar.f76309b;
        int i5 = dVar.f52150b;
        if (i5 > 0) {
            int i11 = i5 - 1;
            Object[] objArr = dVar.f52149a;
            obj = objArr[i11];
            objArr[i11] = null;
            dVar.f52150b = i11;
        } else {
            obj = null;
        }
        b bVar = (b) obj;
        if (bVar == null) {
            return new b(lVar);
        }
        bVar.f52129a = null;
        bVar.f52132d.b();
        bVar.f52130b = 0.0f;
        bVar.f52133e = false;
        return bVar;
    }

    public final f m() {
        if (this.f52144j + 1 >= this.f52140f) {
            o();
        }
        f fVarA = a(3);
        int i5 = this.f52137c + 1;
        this.f52137c = i5;
        this.f52144j++;
        fVarA.f52156b = i5;
        ((f[]) this.f52147m.f76311d)[i5] = fVarA;
        return fVarA;
    }

    public final void o() {
        int i5 = this.f52139e * 2;
        this.f52139e = i5;
        this.f52141g = (b[]) Arrays.copyOf(this.f52141g, i5);
        l lVar = this.f52147m;
        lVar.f76311d = (f[]) Arrays.copyOf((f[]) lVar.f76311d, this.f52139e);
        int i11 = this.f52139e;
        this.f52143i = new boolean[i11];
        this.f52140f = i11;
        this.f52146l = i11;
    }

    public final void p() {
        e eVar = this.f52138d;
        if (eVar.e()) {
            i();
            return;
        }
        if (!this.f52142h) {
            q(eVar);
            return;
        }
        for (int i5 = 0; i5 < this.f52145k; i5++) {
            if (!this.f52141g[i5].f52133e) {
                q(eVar);
                return;
            }
        }
        i();
    }

    public final void q(e eVar) {
        int i5 = 0;
        while (true) {
            if (i5 >= this.f52145k) {
                break;
            }
            b bVar = this.f52141g[i5];
            int i11 = 1;
            if (bVar.f52129a.f52166l != 1) {
                float f11 = 0.0f;
                if (bVar.f52130b < 0.0f) {
                    boolean z11 = false;
                    int i12 = 0;
                    while (!z11) {
                        i12 += i11;
                        float f12 = Float.MAX_VALUE;
                        int i13 = -1;
                        int i14 = -1;
                        int i15 = 0;
                        int i16 = 0;
                        while (i15 < this.f52145k) {
                            b bVar2 = this.f52141g[i15];
                            if (bVar2.f52129a.f52166l != i11 && !bVar2.f52133e && bVar2.f52130b < f11) {
                                int iD = bVar2.f52132d.d();
                                int i17 = 0;
                                while (i17 < iD) {
                                    f fVarE = bVar2.f52132d.e(i17);
                                    float fC = bVar2.f52132d.c(fVarE);
                                    if (fC > f11) {
                                        for (int i18 = 0; i18 < 9; i18++) {
                                            float f13 = fVarE.f52161g[i18] / fC;
                                            if ((f13 < f12 && i18 == i16) || i18 > i16) {
                                                i16 = i18;
                                                i14 = fVarE.f52156b;
                                                i13 = i15;
                                                f12 = f13;
                                            }
                                        }
                                    }
                                    i17++;
                                    f11 = 0.0f;
                                }
                            }
                            i15++;
                            f11 = 0.0f;
                            i11 = 1;
                        }
                        if (i13 != -1) {
                            b bVar3 = this.f52141g[i13];
                            bVar3.f52129a.f52157c = -1;
                            bVar3.g(((f[]) this.f52147m.f76311d)[i14]);
                            f fVar = bVar3.f52129a;
                            fVar.f52157c = i13;
                            fVar.g(this, bVar3);
                        } else {
                            z11 = true;
                        }
                        if (i12 > this.f52144j / 2) {
                            z11 = true;
                        }
                        f11 = 0.0f;
                        i11 = 1;
                    }
                }
            }
            i5++;
        }
        r(eVar);
        i();
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0092 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void r(b bVar) {
        boolean z11;
        int i5 = 0;
        for (int i11 = 0; i11 < this.f52144j; i11++) {
            this.f52143i[i11] = false;
        }
        boolean z12 = false;
        int i12 = 0;
        while (!z12) {
            int i13 = 1;
            i12++;
            if (i12 >= this.f52144j * 2) {
                return;
            }
            f fVar = bVar.f52129a;
            if (fVar != null) {
                this.f52143i[fVar.f52156b] = true;
            }
            f fVarD = bVar.d(this.f52143i);
            if (fVarD != null) {
                boolean[] zArr = this.f52143i;
                int i14 = fVarD.f52156b;
                if (zArr[i14]) {
                    return;
                } else {
                    zArr[i14] = true;
                }
            }
            if (fVarD != null) {
                float f11 = Float.MAX_VALUE;
                int i15 = i5;
                int i16 = -1;
                while (i15 < this.f52145k) {
                    b bVar2 = this.f52141g[i15];
                    if (bVar2.f52129a.f52166l != i13 && !bVar2.f52133e) {
                        a aVar = bVar2.f52132d;
                        int i17 = aVar.f52126h;
                        if (i17 == -1) {
                            z11 = false;
                            if (!z11) {
                                float fC = bVar2.f52132d.c(fVarD);
                                if (fC < 0.0f) {
                                    float f12 = (-bVar2.f52130b) / fC;
                                    if (f12 < f11) {
                                        f11 = f12;
                                        i16 = i15;
                                    }
                                }
                            }
                        } else {
                            for (int i18 = 0; i17 != -1 && i18 < aVar.f52119a; i18++) {
                                if (aVar.f52123e[i17] == fVarD.f52156b) {
                                    z11 = true;
                                    break;
                                }
                                i17 = aVar.f52124f[i17];
                            }
                            z11 = false;
                            if (!z11) {
                            }
                        }
                    }
                    i15++;
                    i13 = 1;
                }
                if (i16 > -1) {
                    b bVar3 = this.f52141g[i16];
                    bVar3.f52129a.f52157c = -1;
                    bVar3.g(fVarD);
                    f fVar2 = bVar3.f52129a;
                    fVar2.f52157c = i16;
                    fVar2.g(this, bVar3);
                }
            } else {
                z12 = true;
            }
            i5 = 0;
        }
    }

    public final void s() {
        for (int i5 = 0; i5 < this.f52145k; i5++) {
            b bVar = this.f52141g[i5];
            if (bVar != null) {
                ((d) this.f52147m.f76309b).b(bVar);
            }
            this.f52141g[i5] = null;
        }
    }

    public final void t() {
        l lVar;
        int i5 = 0;
        while (true) {
            lVar = this.f52147m;
            f[] fVarArr = (f[]) lVar.f76311d;
            if (i5 >= fVarArr.length) {
                break;
            }
            f fVar = fVarArr[i5];
            if (fVar != null) {
                fVar.c();
            }
            i5++;
        }
        d dVar = (d) lVar.f76310c;
        f[] fVarArr2 = this.n;
        int length = this.o;
        dVar.getClass();
        if (length > fVarArr2.length) {
            length = fVarArr2.length;
        }
        for (int i11 = 0; i11 < length; i11++) {
            f fVar2 = fVarArr2[i11];
            int i12 = dVar.f52150b;
            Object[] objArr = dVar.f52149a;
            if (i12 < objArr.length) {
                objArr[i12] = fVar2;
                dVar.f52150b = i12 + 1;
            }
        }
        this.o = 0;
        Arrays.fill((f[]) lVar.f76311d, (Object) null);
        this.f52137c = 0;
        e eVar = this.f52138d;
        eVar.f52153h = 0;
        eVar.f52130b = 0.0f;
        this.f52144j = 1;
        for (int i13 = 0; i13 < this.f52145k; i13++) {
            b bVar = this.f52141g[i13];
        }
        s();
        this.f52145k = 0;
        this.f52148p = new b(lVar);
    }
}
