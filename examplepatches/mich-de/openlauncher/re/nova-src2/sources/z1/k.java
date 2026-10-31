package z1;

import java.util.HashMap;
import java.util.List;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import z.p0;

/* loaded from: classes.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final t70.a0 f97941a = new t70.a0(7);

    /* renamed from: b, reason: collision with root package name */
    public static final x7.u f97942b = new x7.u(13);

    /* renamed from: c, reason: collision with root package name */
    public static final Object f97943c = new Object();

    /* renamed from: d, reason: collision with root package name */
    public static j f97944d;

    /* renamed from: e, reason: collision with root package name */
    public static long f97945e;

    /* renamed from: f, reason: collision with root package name */
    public static final fa0.d f97946f;

    /* renamed from: g, reason: collision with root package name */
    public static final c30.c f97947g;

    /* renamed from: h, reason: collision with root package name */
    public static List f97948h;

    /* renamed from: i, reason: collision with root package name */
    public static List f97949i;

    /* renamed from: j, reason: collision with root package name */
    public static final a f97950j;

    /* renamed from: k, reason: collision with root package name */
    public static final x1.a f97951k;

    static {
        j jVar = j.f97936e;
        f97944d = jVar;
        long j11 = 1;
        f97945e = j11 + j11;
        fa0.d dVar = new fa0.d();
        dVar.f54578c = new long[16];
        dVar.f54579d = new int[16];
        int[] iArr = new int[16];
        int i5 = 0;
        while (i5 < 16) {
            int i11 = i5 + 1;
            iArr[i5] = i11;
            i5 = i11;
        }
        dVar.f54580e = iArr;
        f97946f = dVar;
        c30.c cVar = new c30.c((char) 0, 8);
        cVar.f19533c = new int[16];
        cVar.f19534d = new x1.o[16];
        f97947g = cVar;
        EmptyList emptyList = EmptyList.f71733a;
        f97948h = emptyList;
        f97949i = emptyList;
        long j12 = f97945e;
        f97945e = j11 + j12;
        a aVar = new a(j12, jVar, null, new t70.a0(6));
        f97944d = f97944d.f(aVar.f97920b);
        f97950j = aVar;
        f97951k = new x1.a(0);
    }

    public static final void a() {
        f(f97941a);
    }

    public static final Function1 b(Function1 function1, Function1 function12) {
        return (function1 == null || function12 == null || function1 == function12) ? function1 == null ? function12 : function1 : new c50.f(function1, function12, 2);
    }

    public static final HashMap c(long j11, b bVar, j jVar) {
        long[] jArr;
        j jVar2;
        long[] jArr2;
        j jVar3;
        int i5;
        b0 b0VarS;
        long j12 = j11;
        p0 p0VarX = bVar.x();
        if (p0VarX != null) {
            j jVarE = bVar.d().f(bVar.g()).e(bVar.f97897j);
            Object[] objArr = p0VarX.f97741b;
            long[] jArr3 = p0VarX.f97740a;
            int length = jArr3.length - 2;
            if (length >= 0) {
                int i11 = 0;
                HashMap map = null;
                while (true) {
                    long j13 = jArr3[i11];
                    if ((((~j13) << 7) & j13 & (-9187201950435737472L)) != -9187201950435737472L) {
                        int i12 = 8;
                        int i13 = 8 - ((~(i11 - length)) >>> 31);
                        int i14 = 0;
                        while (i14 < i13) {
                            if ((j13 & 255) < 128) {
                                z zVar = (z) objArr[(i11 << 3) + i14];
                                b0 b0VarD = zVar.d();
                                jArr2 = jArr3;
                                i5 = i12;
                                b0 b0VarS2 = s(b0VarD, j12, jVar);
                                if (b0VarS2 == null || (b0VarS = s(b0VarD, j12, jVarE)) == null || b0VarS2.equals(b0VarS)) {
                                    jVar3 = jVarE;
                                } else {
                                    jVar3 = jVarE;
                                    b0 b0VarS3 = s(b0VarD, bVar.g(), bVar.d());
                                    if (b0VarS3 == null) {
                                        r();
                                        throw null;
                                    }
                                    b0 b0VarE = zVar.e(b0VarS, b0VarS2, b0VarS3);
                                    if (b0VarE == null) {
                                        return null;
                                    }
                                    if (map == null) {
                                        map = new HashMap();
                                    }
                                    map.put(b0VarS2, b0VarE);
                                    map = map;
                                }
                            } else {
                                jArr2 = jArr3;
                                jVar3 = jVarE;
                                i5 = i12;
                            }
                            j13 >>= i5;
                            i14++;
                            j12 = j11;
                            i12 = i5;
                            jArr3 = jArr2;
                            jVarE = jVar3;
                        }
                        jArr = jArr3;
                        jVar2 = jVarE;
                        if (i13 != i12) {
                            return map;
                        }
                    } else {
                        jArr = jArr3;
                        jVar2 = jVarE;
                    }
                    if (i11 == length) {
                        return map;
                    }
                    i11++;
                    j12 = j11;
                    jArr3 = jArr;
                    jVarE = jVar2;
                }
            }
        }
        return null;
    }

    public static final void d(f fVar) {
        long j11;
        if (f97944d.d(fVar.g())) {
            return;
        }
        StringBuilder sb2 = new StringBuilder("Snapshot is not open: snapshotId=");
        sb2.append(fVar.g());
        sb2.append(", disposed=");
        sb2.append(fVar.f97921c);
        sb2.append(", applied=");
        b bVar = fVar instanceof b ? (b) fVar : null;
        sb2.append(bVar != null ? Boolean.valueOf(bVar.f97900m) : "read-only");
        sb2.append(", lowestPin=");
        synchronized (f97943c) {
            fa0.d dVar = f97946f;
            j11 = dVar.f54576a > 0 ? ((long[]) dVar.f54578c)[0] : -1L;
        }
        sb2.append(j11);
        throw new IllegalStateException(sb2.toString().toString());
    }

    public static final j e(j jVar, long j11, long j12) {
        while (Intrinsics.i(j11, j12) < 0) {
            jVar = jVar.f(j11);
            j11++;
        }
        return jVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0091  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object f(Function1 function1) {
        p0 p0Var;
        Object objV;
        a aVar = f97950j;
        synchronized (f97943c) {
            try {
                p0Var = aVar.f97895h;
                if (p0Var != null) {
                    f97951k.addAndGet(1);
                }
                objV = v(aVar, function1);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (p0Var != null) {
            try {
                List list = f97948h;
                int size = list.size();
                for (int i5 = 0; i5 < size; i5++) {
                    ((Function2) list.get(i5)).invoke(new r1.h(p0Var), aVar);
                }
            } finally {
                f97951k.addAndGet(-1);
            }
        }
        synchronized (f97943c) {
            try {
                g();
                if (p0Var != null) {
                    Object[] objArr = p0Var.f97741b;
                    long[] jArr = p0Var.f97740a;
                    int length = jArr.length - 2;
                    if (length >= 0) {
                        int i11 = 0;
                        while (true) {
                            long j11 = jArr[i11];
                            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                                int i12 = 8 - ((~(i11 - length)) >>> 31);
                                for (int i13 = 0; i13 < i12; i13++) {
                                    if ((255 & j11) < 128) {
                                        q((z) objArr[(i11 << 3) + i13]);
                                    }
                                    j11 >>= 8;
                                }
                                if (i12 != 8) {
                                    break;
                                }
                                if (i11 == length) {
                                    break;
                                }
                                i11++;
                            }
                        }
                    }
                    Unit unit = Unit.f71706a;
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return objV;
    }

    public static final void g() {
        c30.c cVar = f97947g;
        int i5 = cVar.f19532b;
        int i11 = 0;
        int i12 = 0;
        while (true) {
            if (i11 >= i5) {
                break;
            }
            x1.o oVar = ((x1.o[]) cVar.f19534d)[i11];
            Object obj = oVar != null ? oVar.get() : null;
            if (obj != null && p((z) obj)) {
                if (i12 != i11) {
                    ((x1.o[]) cVar.f19534d)[i12] = oVar;
                    int[] iArr = (int[]) cVar.f19533c;
                    iArr[i12] = iArr[i11];
                }
                i12++;
            }
            i11++;
        }
        for (int i13 = i12; i13 < i5; i13++) {
            ((x1.o[]) cVar.f19534d)[i13] = null;
            ((int[]) cVar.f19533c)[i13] = 0;
        }
        if (i12 != i5) {
            cVar.f19532b = i12;
        }
    }

    public static final f h(f fVar, Function1 function1, boolean z11) {
        boolean z12 = fVar instanceof b;
        if (z12 || fVar == null) {
            return new e0(z12 ? (b) fVar : null, function1, null, false, z11);
        }
        return new f0(fVar, function1, false, z11);
    }

    public static final b0 i(b0 b0Var) {
        b0 b0VarS;
        f fVarK = k();
        b0 b0VarS2 = s(b0Var, fVarK.g(), fVarK.d());
        if (b0VarS2 != null) {
            return b0VarS2;
        }
        synchronized (f97943c) {
            f fVarK2 = k();
            b0VarS = s(b0Var, fVarK2.g(), fVarK2.d());
        }
        if (b0VarS != null) {
            return b0VarS;
        }
        r();
        throw null;
    }

    public static final b0 j(b0 b0Var, f fVar) {
        b0 b0VarS;
        b0 b0VarS2 = s(b0Var, fVar.g(), fVar.d());
        if (b0VarS2 != null) {
            return b0VarS2;
        }
        synchronized (f97943c) {
            b0VarS = s(b0Var, fVar.g(), fVar.d());
        }
        if (b0VarS != null) {
            return b0VarS;
        }
        r();
        throw null;
    }

    public static final f k() {
        f fVar = (f) f97942b.h();
        return fVar == null ? f97950j : fVar;
    }

    public static final Function1 l(Function1 function1, Function1 function12, boolean z11) {
        if (!z11) {
            function12 = null;
        }
        return (function1 == null || function12 == null || function1 == function12) ? function1 == null ? function12 : function1 : new c50.f(function1, function12, 1);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0044, code lost:
    
        r3 = r0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final b0 m(b0 b0Var, z zVar) {
        b0 b0VarD = zVar.d();
        long j11 = f97945e;
        fa0.d dVar = f97946f;
        if (dVar.f54576a > 0) {
            j11 = ((long[]) dVar.f54578c)[0];
        }
        long j12 = j11 - 1;
        b0 b0Var2 = null;
        b0 b0Var3 = null;
        while (true) {
            if (b0VarD == null) {
                break;
            }
            long j13 = b0VarD.f97901a;
            if (j13 == 0) {
                break;
            }
            if (j13 != 0 && Intrinsics.i(j13, j12) <= 0 && !j.f97936e.d(j13)) {
                if (b0Var3 == null) {
                    b0Var3 = b0VarD;
                } else {
                    if (Intrinsics.i(b0VarD.f97901a, b0Var3.f97901a) < 0) {
                        break;
                    }
                    b0Var2 = b0Var3;
                }
            }
            b0VarD = b0VarD.f97902b;
        }
        if (b0Var2 != null) {
            b0Var2.f97901a = Long.MAX_VALUE;
            return b0Var2;
        }
        b0 b0VarB = b0Var.b(Long.MAX_VALUE);
        b0VarB.f97902b = zVar.d();
        zVar.f(b0VarB);
        return b0VarB;
    }

    public static final void n(f fVar, z zVar) {
        fVar.t(fVar.h() + 1);
        Function1 function1I = fVar.i();
        if (function1I != null) {
            function1I.invoke(zVar);
        }
    }

    public static final b0 o(b0 b0Var, a0 a0Var, f fVar, b0 b0Var2) {
        b0 b0VarM;
        if (fVar.f()) {
            fVar.n(a0Var);
        }
        long jG = fVar.g();
        if (b0Var2.f97901a == jG) {
            return b0Var2;
        }
        synchronized (f97943c) {
            b0VarM = m(b0Var, a0Var);
        }
        b0VarM.f97901a = jG;
        if (b0Var2.f97901a != 1) {
            fVar.n(a0Var);
        }
        return b0VarM;
    }

    public static final boolean p(z zVar) {
        b0 b0Var;
        long j11 = f97945e;
        fa0.d dVar = f97946f;
        if (dVar.f54576a > 0) {
            j11 = ((long[]) dVar.f54578c)[0];
        }
        b0 b0Var2 = null;
        b0 b0VarD = null;
        int i5 = 0;
        for (b0 b0VarD2 = zVar.d(); b0VarD2 != null; b0VarD2 = b0VarD2.f97902b) {
            long j12 = b0VarD2.f97901a;
            if (j12 != 0) {
                if (Intrinsics.i(j12, j11) >= 0) {
                    i5++;
                } else if (b0Var2 == null) {
                    i5++;
                    b0Var2 = b0VarD2;
                } else {
                    if (Intrinsics.i(b0VarD2.f97901a, b0Var2.f97901a) < 0) {
                        b0Var = b0Var2;
                        b0Var2 = b0VarD2;
                    } else {
                        b0Var = b0VarD2;
                    }
                    if (b0VarD == null) {
                        b0VarD = zVar.d();
                        b0 b0Var3 = b0VarD;
                        while (true) {
                            if (b0VarD == null) {
                                b0VarD = b0Var3;
                                break;
                            }
                            if (Intrinsics.i(b0VarD.f97901a, j11) >= 0) {
                                break;
                            }
                            if (Intrinsics.i(b0Var3.f97901a, b0VarD.f97901a) < 0) {
                                b0Var3 = b0VarD;
                            }
                            b0VarD = b0VarD.f97902b;
                        }
                    }
                    b0Var2.f97901a = 0L;
                    b0Var2.a(b0VarD);
                    b0Var2 = b0Var;
                }
            }
        }
        return i5 > 1;
    }

    public static final void q(z zVar) {
        if (p(zVar)) {
            c30.c cVar = f97947g;
            int i5 = cVar.f19532b;
            int iA = x1.k.a(zVar);
            int i11 = -1;
            if (i5 > 0) {
                int i12 = cVar.f19532b - 1;
                int i13 = 0;
                while (true) {
                    if (i13 > i12) {
                        i11 = -(i13 + 1);
                        break;
                    }
                    int i14 = (i13 + i12) >>> 1;
                    int i15 = ((int[]) cVar.f19533c)[i14];
                    if (i15 < iA) {
                        i13 = i14 + 1;
                    } else if (i15 > iA) {
                        i12 = i14 - 1;
                    } else {
                        x1.o oVar = ((x1.o[]) cVar.f19534d)[i14];
                        if (zVar == (oVar != null ? oVar.get() : null)) {
                            i11 = i14;
                        } else {
                            for (int i16 = i14 - 1; -1 < i16 && ((int[]) cVar.f19533c)[i16] == iA; i16--) {
                                x1.o oVar2 = ((x1.o[]) cVar.f19534d)[i16];
                                if ((oVar2 != null ? oVar2.get() : null) == zVar) {
                                    i11 = i16;
                                    break;
                                }
                            }
                            i14++;
                            int i17 = cVar.f19532b;
                            while (true) {
                                if (i14 >= i17) {
                                    i11 = -(cVar.f19532b + 1);
                                    break;
                                } else {
                                    if (((int[]) cVar.f19533c)[i14] != iA) {
                                        i11 = -(i14 + 1);
                                        break;
                                    }
                                    x1.o oVar3 = ((x1.o[]) cVar.f19534d)[i14];
                                    if ((oVar3 != null ? oVar3.get() : null) == zVar) {
                                        break;
                                    } else {
                                        i14++;
                                    }
                                }
                            }
                            i11 = i14;
                        }
                    }
                }
                if (i11 >= 0) {
                    return;
                }
            }
            int i18 = -(i11 + 1);
            x1.o[] oVarArr = (x1.o[]) cVar.f19534d;
            int length = oVarArr.length;
            if (i5 == length) {
                int i19 = length * 2;
                x1.o[] oVarArr2 = new x1.o[i19];
                int[] iArr = new int[i19];
                int i21 = i18 + 1;
                System.arraycopy(oVarArr, i18, oVarArr2, i21, i5 - i18);
                System.arraycopy((x1.o[]) cVar.f19534d, 0, oVarArr2, 0, i18);
                u90.b.p(i21, i18, (int[]) cVar.f19533c, iArr, i5);
                u90.b.u(0, i18, (int[]) cVar.f19533c, iArr, 6);
                cVar.f19534d = oVarArr2;
                cVar.f19533c = iArr;
            } else {
                int i22 = i18 + 1;
                System.arraycopy(oVarArr, i18, oVarArr, i22, i5 - i18);
                int[] iArr2 = (int[]) cVar.f19533c;
                u90.b.p(i22, i18, iArr2, iArr2, i5);
            }
            ((x1.o[]) cVar.f19534d)[i18] = new x1.o(zVar);
            ((int[]) cVar.f19533c)[i18] = iA;
            cVar.f19532b++;
        }
    }

    public static final void r() {
        throw new IllegalStateException("Reading a state that was created after the snapshot was taken or in a snapshot that has not yet been applied");
    }

    public static final b0 s(b0 b0Var, long j11, j jVar) {
        b0 b0Var2 = null;
        while (b0Var != null) {
            long j12 = b0Var.f97901a;
            if (j12 != 0 && Intrinsics.i(j12, j11) <= 0 && !jVar.d(j12) && (b0Var2 == null || Intrinsics.i(b0Var2.f97901a, b0Var.f97901a) < 0)) {
                b0Var2 = b0Var;
            }
            b0Var = b0Var.f97902b;
        }
        if (b0Var2 != null) {
            return b0Var2;
        }
        return null;
    }

    public static final b0 t(b0 b0Var, z zVar) {
        b0 b0VarS;
        f fVarK = k();
        Function1 function1E = fVarK.e();
        if (function1E != null) {
            function1E.invoke(zVar);
        }
        b0 b0VarS2 = s(b0Var, fVarK.g(), fVarK.d());
        if (b0VarS2 != null) {
            return b0VarS2;
        }
        synchronized (f97943c) {
            f fVarK2 = k();
            b0 b0VarD = zVar.d();
            Intrinsics.e(b0VarD, "null cannot be cast to non-null type T of androidx.compose.runtime.snapshots.SnapshotKt.readable");
            b0VarS = s(b0VarD, fVarK2.g(), fVarK2.d());
            if (b0VarS == null) {
                r();
                throw null;
            }
        }
        return b0VarS;
    }

    public static final void u(int i5) {
        fa0.d dVar = f97946f;
        int i11 = ((int[]) dVar.f54580e)[i5];
        dVar.b(i11, dVar.f54576a - 1);
        dVar.f54576a--;
        long[] jArr = (long[]) dVar.f54578c;
        long j11 = jArr[i11];
        int i12 = i11;
        while (i12 > 0) {
            int i13 = ((i12 + 1) >> 1) - 1;
            if (Intrinsics.i(jArr[i13], j11) <= 0) {
                break;
            }
            dVar.b(i13, i12);
            i12 = i13;
        }
        long[] jArr2 = (long[]) dVar.f54578c;
        int i14 = dVar.f54576a >> 1;
        while (i11 < i14) {
            int i15 = (i11 + 1) << 1;
            int i16 = i15 - 1;
            if (i15 < dVar.f54576a && Intrinsics.i(jArr2[i15], jArr2[i16]) < 0) {
                if (Intrinsics.i(jArr2[i15], jArr2[i11]) >= 0) {
                    break;
                }
                dVar.b(i15, i11);
                i11 = i15;
            } else {
                if (Intrinsics.i(jArr2[i16], jArr2[i11]) >= 0) {
                    break;
                }
                dVar.b(i16, i11);
                i11 = i16;
            }
        }
        ((int[]) dVar.f54580e)[i5] = dVar.f54577b;
        dVar.f54577b = i5;
    }

    public static final Object v(a aVar, Function1 function1) {
        long j11 = aVar.f97920b;
        Object objInvoke = function1.invoke(f97944d.c(j11));
        long j12 = f97945e;
        f97945e = 1 + j12;
        j jVarC = f97944d.c(j11);
        f97944d = jVarC;
        aVar.f97920b = j12;
        aVar.f97919a = jVarC;
        aVar.f97894g = 0;
        aVar.f97895h = null;
        aVar.o();
        f97944d = f97944d.f(j12);
        return objInvoke;
    }

    public static final b0 w(b0 b0Var, z zVar, f fVar) {
        b0 b0VarS;
        if (fVar.f()) {
            fVar.n(zVar);
        }
        long jG = fVar.g();
        b0 b0VarS2 = s(b0Var, jG, fVar.d());
        if (b0VarS2 == null) {
            r();
            throw null;
        }
        if (b0VarS2.f97901a == fVar.g()) {
            return b0VarS2;
        }
        synchronized (f97943c) {
            b0VarS = s(zVar.d(), jG, fVar.d());
            if (b0VarS == null) {
                r();
                throw null;
            }
            if (b0VarS.f97901a != jG) {
                b0 b0VarM = m(b0VarS, zVar);
                b0VarM.a(b0VarS);
                b0VarM.f97901a = fVar.g();
                b0VarS = b0VarM;
            }
        }
        if (b0VarS2.f97901a != 1) {
            fVar.n(zVar);
        }
        return b0VarS;
    }
}
