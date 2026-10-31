package z1;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import p1.o1;
import z.b1;
import z.p0;

/* loaded from: classes.dex */
public class b extends f {
    public static final int[] n = new int[0];

    /* renamed from: e, reason: collision with root package name */
    public final Function1 f97892e;

    /* renamed from: f, reason: collision with root package name */
    public final Function1 f97893f;

    /* renamed from: g, reason: collision with root package name */
    public int f97894g;

    /* renamed from: h, reason: collision with root package name */
    public p0 f97895h;

    /* renamed from: i, reason: collision with root package name */
    public ArrayList f97896i;

    /* renamed from: j, reason: collision with root package name */
    public j f97897j;

    /* renamed from: k, reason: collision with root package name */
    public int[] f97898k;

    /* renamed from: l, reason: collision with root package name */
    public int f97899l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f97900m;

    public b(long j11, j jVar, Function1 function1, Function1 function12) {
        super(j11, jVar);
        this.f97892e = function1;
        this.f97893f = function12;
        this.f97897j = j.f97936e;
        this.f97898k = n;
        this.f97899l = 1;
    }

    public final void A(long j11) {
        synchronized (k.f97943c) {
            this.f97897j = this.f97897j.f(j11);
            Unit unit = Unit.f71706a;
        }
    }

    public void B(p0 p0Var) {
        this.f97895h = p0Var;
    }

    public b C(Function1 function1, Function1 function12) throws Throwable {
        if (this.f97921c) {
            o1.a("Cannot use a disposed snapshot");
        }
        if (this.f97900m && this.f97922d < 0) {
            o1.b("Unsupported operation on a disposed or applied snapshot");
        }
        A(g());
        Object obj = k.f97943c;
        synchronized (obj) {
            try {
                long j11 = k.f97945e;
                long j12 = 1;
                k.f97945e = j11 + j12;
                k.f97944d = k.f97944d.f(j11);
                j jVarD = d();
                r(jVarD.f(j11));
                try {
                    c cVar = new c(j11, k.e(jVarD, g() + j12, j11), k.l(function1, e(), true), k.b(function12, i()), this);
                    if (this.f97900m || this.f97921c) {
                        return cVar;
                    }
                    long jG = g();
                    synchronized (obj) {
                        long j13 = k.f97945e;
                        k.f97945e = j13 + j12;
                        s(j13);
                        k.f97944d = k.f97944d.f(g());
                        Unit unit = Unit.f71706a;
                    }
                    r(k.e(d(), jG + j12, g()));
                    return cVar;
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    @Override // z1.f
    public final void b() {
        k.f97944d = k.f97944d.c(g()).b(this.f97897j);
    }

    @Override // z1.f
    public void c() {
        if (this.f97921c) {
            return;
        }
        super.c();
        l();
    }

    @Override // z1.f
    public boolean f() {
        return false;
    }

    @Override // z1.f
    public int h() {
        return this.f97894g;
    }

    @Override // z1.f
    public Function1 i() {
        return this.f97893f;
    }

    @Override // z1.f
    public void k() {
        this.f97899l++;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x008c  */
    @Override // z1.f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void l() {
        if (this.f97899l <= 0) {
            o1.a("no pending nested snapshots");
        }
        int i5 = this.f97899l - 1;
        this.f97899l = i5;
        if (i5 != 0 || this.f97900m) {
            return;
        }
        p0 p0VarX = x();
        if (p0VarX != null) {
            if (this.f97900m) {
                o1.b("Unsupported operation on a snapshot that has been applied");
            }
            B(null);
            long jG = g();
            Object[] objArr = p0VarX.f97741b;
            long[] jArr = p0VarX.f97740a;
            int length = jArr.length - 2;
            if (length >= 0) {
                int i11 = 0;
                while (true) {
                    long j11 = jArr[i11];
                    if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                        int i12 = 8 - ((~(i11 - length)) >>> 31);
                        for (int i13 = 0; i13 < i12; i13++) {
                            if ((255 & j11) < 128) {
                                for (b0 b0VarD = ((z) objArr[(i11 << 3) + i13]).d(); b0VarD != null; b0VarD = b0VarD.f97902b) {
                                    long j12 = b0VarD.f97901a;
                                    if (j12 == jG || b70.g.O0(this.f97897j, Long.valueOf(j12))) {
                                        t70.a0 a0Var = k.f97941a;
                                        b0VarD.f97901a = 0L;
                                    }
                                }
                            }
                            j11 >>= 8;
                        }
                        if (i12 != 8) {
                            break;
                        } else if (i11 == length) {
                            break;
                        } else {
                            i11++;
                        }
                    }
                }
            }
        }
        a();
    }

    @Override // z1.f
    public void m() {
        if (this.f97900m || this.f97921c) {
            return;
        }
        v();
    }

    @Override // z1.f
    public void n(z zVar) {
        p0 p0VarX = x();
        if (p0VarX == null) {
            p0 p0Var = b1.f97745a;
            p0VarX = new p0();
            B(p0VarX);
        }
        p0VarX.d(zVar);
    }

    @Override // z1.f
    public final void p() {
        int length = this.f97898k.length;
        for (int i5 = 0; i5 < length; i5++) {
            k.u(this.f97898k[i5]);
        }
        o();
    }

    @Override // z1.f
    public void t(int i5) {
        this.f97894g = i5;
    }

    @Override // z1.f
    public f u(Function1 function1) throws Throwable {
        if (this.f97921c) {
            o1.a("Cannot use a disposed snapshot");
        }
        if (this.f97900m && this.f97922d < 0) {
            o1.b("Unsupported operation on a disposed or applied snapshot");
        }
        long jG = g();
        A(g());
        Object obj = k.f97943c;
        synchronized (obj) {
            try {
                long j11 = k.f97945e;
                long j12 = 1;
                k.f97945e = j11 + j12;
                k.f97944d = k.f97944d.f(j11);
                try {
                    d dVar = new d(j11, k.e(d(), jG + j12, j11), k.l(function1, e(), true), this);
                    if (this.f97900m || this.f97921c) {
                        return dVar;
                    }
                    long jG2 = g();
                    synchronized (obj) {
                        long j13 = k.f97945e;
                        k.f97945e = j13 + j12;
                        s(j13);
                        k.f97944d = k.f97944d.f(g());
                        Unit unit = Unit.f71706a;
                    }
                    r(k.e(d(), jG2 + j12, g()));
                    return dVar;
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    public final void v() {
        long j11;
        A(g());
        Unit unit = Unit.f71706a;
        if (this.f97900m || this.f97921c) {
            return;
        }
        long jG = g();
        synchronized (k.f97943c) {
            long j12 = k.f97945e;
            j11 = 1;
            k.f97945e = j12 + j11;
            s(j12);
            k.f97944d = k.f97944d.f(g());
        }
        r(k.e(d(), jG + j11, g()));
    }

    /* JADX WARN: Removed duplicated region for block: B:59:0x010f  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x014e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public w.b w() {
        HashMap mapC;
        List list;
        p0 p0Var;
        long j11;
        long j12;
        p0 p0VarX = x();
        if (p0VarX != null) {
            long j13 = k.f97950j.f97920b;
            mapC = k.c(j13, this, k.f97944d.c(j13));
        } else {
            mapC = null;
        }
        EmptyList emptyList = EmptyList.f71733a;
        synchronized (k.f97943c) {
            try {
                k.d(this);
                if (p0VarX == null || p0VarX.f97743d == 0) {
                    b();
                    a aVar = k.f97950j;
                    p0 p0Var2 = aVar.f97895h;
                    k.v(aVar, k.f97941a);
                    if (p0Var2 == null || !p0Var2.c()) {
                        list = emptyList;
                        p0Var = null;
                    } else {
                        list = k.f97948h;
                        p0Var = p0Var2;
                    }
                } else {
                    a aVar2 = k.f97950j;
                    w.b bVarZ = z(k.f97945e, p0VarX, mapC, k.f97944d.c(aVar2.f97920b));
                    if (!bVarZ.equals(h.f97929d)) {
                        return bVarZ;
                    }
                    b();
                    p0Var = aVar2.f97895h;
                    k.v(aVar2, k.f97941a);
                    B(null);
                    aVar2.f97895h = null;
                    list = k.f97948h;
                }
                Unit unit = Unit.f71706a;
                this.f97900m = true;
                if (p0Var != null) {
                    r1.h hVar = new r1.h(p0Var);
                    if (!p0Var.b()) {
                        int size = list.size();
                        for (int i5 = 0; i5 < size; i5++) {
                            ((Function2) list.get(i5)).invoke(hVar, this);
                        }
                    }
                }
                if (p0VarX != null && p0VarX.c()) {
                    r1.h hVar2 = new r1.h(p0VarX);
                    int size2 = list.size();
                    for (int i11 = 0; i11 < size2; i11++) {
                        ((Function2) list.get(i11)).invoke(hVar2, this);
                    }
                }
                synchronized (k.f97943c) {
                    try {
                        p();
                        k.g();
                        if (p0Var != null) {
                            Object[] objArr = p0Var.f97741b;
                            long[] jArr = p0Var.f97740a;
                            int length = jArr.length - 2;
                            if (length >= 0) {
                                int i12 = 0;
                                j11 = 128;
                                while (true) {
                                    long j14 = jArr[i12];
                                    j12 = 255;
                                    if ((((~j14) << 7) & j14 & (-9187201950435737472L)) != -9187201950435737472L) {
                                        int i13 = 8 - ((~(i12 - length)) >>> 31);
                                        for (int i14 = 0; i14 < i13; i14++) {
                                            if ((j14 & 255) < 128) {
                                                k.q((z) objArr[(i12 << 3) + i14]);
                                            }
                                            j14 >>= 8;
                                        }
                                        if (i13 != 8) {
                                            break;
                                        }
                                        if (i12 == length) {
                                            break;
                                        }
                                        i12++;
                                    }
                                }
                            } else {
                                j11 = 128;
                                j12 = 255;
                            }
                        }
                        if (p0VarX != null) {
                            Object[] objArr2 = p0VarX.f97741b;
                            long[] jArr2 = p0VarX.f97740a;
                            int length2 = jArr2.length - 2;
                            if (length2 >= 0) {
                                int i15 = 0;
                                while (true) {
                                    long j15 = jArr2[i15];
                                    if ((((~j15) << 7) & j15 & (-9187201950435737472L)) != -9187201950435737472L) {
                                        int i16 = 8 - ((~(i15 - length2)) >>> 31);
                                        for (int i17 = 0; i17 < i16; i17++) {
                                            if ((j15 & j12) < j11) {
                                                k.q((z) objArr2[(i15 << 3) + i17]);
                                            }
                                            j15 >>= 8;
                                        }
                                        if (i16 != 8) {
                                            break;
                                        }
                                        if (i15 == length2) {
                                            break;
                                        }
                                        i15++;
                                    }
                                }
                            }
                        }
                        ArrayList arrayList = this.f97896i;
                        if (arrayList != null) {
                            int size3 = arrayList.size();
                            for (int i18 = 0; i18 < size3; i18++) {
                                k.q((z) arrayList.get(i18));
                            }
                        }
                        this.f97896i = null;
                        Unit unit2 = Unit.f71706a;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return h.f97929d;
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }

    public p0 x() {
        return this.f97895h;
    }

    @Override // z1.f
    /* renamed from: y, reason: merged with bridge method [inline-methods] */
    public Function1 e() {
        return this.f97892e;
    }

    public final w.b z(long j11, p0 p0Var, HashMap map, j jVar) {
        ArrayList arrayList;
        ArrayList arrayListT1;
        ArrayList arrayList2;
        j jVar2;
        Object[] objArr;
        long[] jArr;
        j jVar3;
        Object[] objArr2;
        long[] jArr2;
        int i5;
        long j12;
        ArrayList arrayList3;
        b0 b0VarE;
        j jVarE = d().f(g()).e(this.f97897j);
        Object[] objArr3 = p0Var.f97741b;
        long[] jArr3 = p0Var.f97740a;
        int length = jArr3.length - 2;
        if (length >= 0) {
            int i11 = 0;
            arrayList2 = null;
            arrayListT1 = null;
            while (true) {
                long j13 = jArr3[i11];
                if ((((~j13) << 7) & j13 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i12 = 8 - ((~(i11 - length)) >>> 31);
                    int i13 = 0;
                    while (i13 < i12) {
                        if ((j13 & 255) < 128) {
                            objArr2 = objArr3;
                            z zVar = (z) objArr3[(i11 << 3) + i13];
                            jArr2 = jArr3;
                            b0 b0VarD = zVar.d();
                            i5 = i13;
                            ArrayList arrayList4 = arrayList2;
                            b0 b0VarS = k.s(b0VarD, j11, jVar);
                            if (b0VarS == null) {
                                jVar3 = jVarE;
                                arrayList3 = arrayListT1;
                                j12 = j13;
                            } else {
                                arrayList3 = arrayListT1;
                                j12 = j13;
                                b0 b0VarS2 = k.s(b0VarD, g(), jVarE);
                                if (b0VarS2 == null) {
                                    jVar3 = jVarE;
                                } else {
                                    jVar3 = jVarE;
                                    if (b0VarS2.f97901a != 1 && !b0VarS.equals(b0VarS2)) {
                                        b0 b0VarS3 = k.s(b0VarD, g(), d());
                                        if (b0VarS3 == null) {
                                            k.r();
                                            throw null;
                                        }
                                        if (map == null || (b0VarE = (b0) map.get(b0VarS)) == null) {
                                            b0VarE = zVar.e(b0VarS2, b0VarS, b0VarS3);
                                        }
                                        if (b0VarE == null) {
                                            return new g(this);
                                        }
                                        if (!b0VarE.equals(b0VarS3)) {
                                            if (b0VarE.equals(b0VarS)) {
                                                ArrayList arrayList5 = arrayList4 == null ? new ArrayList() : arrayList4;
                                                arrayList5.add(new Pair(zVar, b0VarS.b(g())));
                                                arrayListT1 = arrayList3 == null ? new ArrayList() : arrayList3;
                                                arrayListT1.add(zVar);
                                                arrayList2 = arrayList5;
                                            } else {
                                                arrayList2 = arrayList4 == null ? new ArrayList() : arrayList4;
                                                arrayList2.add(!b0VarE.equals(b0VarS2) ? new Pair(zVar, b0VarE) : new Pair(zVar, b0VarS2.b(g())));
                                            }
                                        }
                                        arrayListT1 = arrayList3;
                                    }
                                }
                            }
                            arrayList2 = arrayList4;
                            arrayListT1 = arrayList3;
                        } else {
                            jVar3 = jVarE;
                            objArr2 = objArr3;
                            jArr2 = jArr3;
                            i5 = i13;
                            j12 = j13;
                        }
                        j13 = j12 >> 8;
                        i13 = i5 + 1;
                        jArr3 = jArr2;
                        objArr3 = objArr2;
                        jVarE = jVar3;
                    }
                    jVar2 = jVarE;
                    objArr = objArr3;
                    jArr = jArr3;
                    if (i12 != 8) {
                        break;
                    }
                } else {
                    jVar2 = jVarE;
                    objArr = objArr3;
                    jArr = jArr3;
                }
                if (i11 == length) {
                    arrayList = arrayList2;
                    break;
                }
                i11++;
                jArr3 = jArr;
                objArr3 = objArr;
                jVarE = jVar2;
            }
        } else {
            arrayList = null;
            arrayListT1 = null;
        }
        arrayList2 = arrayList;
        if (arrayList2 != null) {
            v();
            int size = arrayList2.size();
            for (int i14 = 0; i14 < size; i14++) {
                Pair pair = (Pair) arrayList2.get(i14);
                z zVar2 = (z) pair.f71683a;
                b0 b0Var = (b0) pair.f71684b;
                b0Var.f97901a = j11;
                synchronized (k.f97943c) {
                    b0Var.f97902b = zVar2.d();
                    zVar2.f(b0Var);
                    Unit unit = Unit.f71706a;
                }
            }
        }
        if (arrayListT1 != null) {
            int size2 = arrayListT1.size();
            for (int i15 = 0; i15 < size2; i15++) {
                p0Var.l((z) arrayListT1.get(i15));
            }
            ArrayList arrayList6 = this.f97896i;
            if (arrayList6 != null) {
                arrayListT1 = b70.g.t1(arrayListT1, arrayList6);
            }
            this.f97896i = arrayListT1;
        }
        return h.f97929d;
    }
}
