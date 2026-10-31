package p1;

import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h0 extends z1.b0 {

    /* renamed from: h, reason: collision with root package name */
    public static final Object f81439h = new Object();

    /* renamed from: c, reason: collision with root package name */
    public long f81440c;

    /* renamed from: d, reason: collision with root package name */
    public int f81441d;

    /* renamed from: e, reason: collision with root package name */
    public z.s0 f81442e;

    /* renamed from: f, reason: collision with root package name */
    public Object f81443f;

    /* renamed from: g, reason: collision with root package name */
    public int f81444g;

    public h0(long j11) {
        super(j11);
        z.h0 h0Var = z.t0.f97838a;
        Intrinsics.e(h0Var, "null cannot be cast to non-null type androidx.collection.ObjectIntMap<K of androidx.collection.ObjectIntMapKt.emptyObjectIntMap>");
        this.f81442e = h0Var;
        this.f81443f = f81439h;
    }

    @Override // z1.b0
    public final void a(z1.b0 b0Var) {
        Intrinsics.e(b0Var, "null cannot be cast to non-null type androidx.compose.runtime.DerivedSnapshotState.ResultRecord<T of androidx.compose.runtime.DerivedSnapshotState.ResultRecord>");
        h0 h0Var = (h0) b0Var;
        this.f81442e = h0Var.f81442e;
        this.f81443f = h0Var.f81443f;
        this.f81444g = h0Var.f81444g;
    }

    @Override // z1.b0
    public final z1.b0 b(long j11) {
        return new h0(j11);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean c(i0 i0Var, z1.f fVar) {
        boolean z11;
        boolean z12;
        Object obj = z1.k.f97943c;
        synchronized (obj) {
            z11 = true;
            if (this.f81440c == fVar.g()) {
                z12 = this.f81441d != fVar.h();
            }
        }
        if (this.f81443f == f81439h || (z12 && this.f81444g != d(i0Var, fVar))) {
            z11 = false;
        }
        if (!z11 || !z12) {
            return z11;
        }
        synchronized (obj) {
            this.f81440c = fVar.g();
            this.f81441d = fVar.h();
            Unit unit = Unit.f71706a;
        }
        return z11;
    }

    public final int d(i0 i0Var, z1.f fVar) throws Throwable {
        z.s0 s0Var;
        int iA;
        long[] jArr;
        int i5;
        long[] jArr2;
        int i11;
        int i12;
        z1.b0 b0VarM;
        synchronized (z1.k.f97943c) {
            s0Var = this.f81442e;
        }
        int i13 = 7;
        if (s0Var.f97833e == 0) {
            return 7;
        }
        r1.e eVarC = androidx.compose.runtime.d.c();
        Object[] objArr = eVarC.f85077a;
        int i14 = eVarC.f85079c;
        for (int i15 = 0; i15 < i14; i15++) {
            ((s) objArr[i15]).b();
        }
        try {
            Object[] objArr2 = s0Var.f97830b;
            int[] iArr = s0Var.f97831c;
            long[] jArr3 = s0Var.f97829a;
            int length = jArr3.length - 2;
            if (length >= 0) {
                iA = 7;
                int i16 = 0;
                while (true) {
                    long j11 = jArr3[i16];
                    if ((((~j11) << i13) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                        int i17 = 8;
                        int i18 = 8 - ((~(i16 - length)) >>> 31);
                        int i19 = 0;
                        while (i19 < i18) {
                            if ((j11 & 255) < 128) {
                                int i21 = (i16 << 3) + i19;
                                Object obj = objArr2[i21];
                                i11 = i13;
                                int i22 = iArr[i21];
                                i12 = i17;
                                z1.z zVar = (z1.z) obj;
                                if (i22 != 1) {
                                    jArr2 = jArr3;
                                } else {
                                    if (zVar instanceof i0) {
                                        try {
                                            i0 i0Var2 = (i0) zVar;
                                            b0VarM = i0Var2.m((h0) z1.k.j(i0Var2.f81454d, fVar), fVar, false, i0Var2.f81452b);
                                        } catch (Throwable th2) {
                                            th = th2;
                                            Object[] objArr3 = eVarC.f85077a;
                                            int i23 = eVarC.f85079c;
                                            for (int i24 = 0; i24 < i23; i24++) {
                                                ((s) objArr3[i24]).a();
                                            }
                                            throw th;
                                        }
                                    } else {
                                        b0VarM = z1.k.j(zVar.d(), fVar);
                                    }
                                    jArr2 = jArr3;
                                    iA = (((iA * 31) + x1.k.a(b0VarM)) * 31) + Long.hashCode(b0VarM.f97901a);
                                }
                            } else {
                                jArr2 = jArr3;
                                i11 = i13;
                                i12 = i17;
                            }
                            j11 >>= i12;
                            i19++;
                            i13 = i11;
                            jArr3 = jArr2;
                            i17 = i12;
                        }
                        jArr = jArr3;
                        i5 = i13;
                        if (i18 != i17) {
                            break;
                        }
                    } else {
                        jArr = jArr3;
                        i5 = i13;
                    }
                    if (i16 == length) {
                        i13 = iA;
                        break;
                    }
                    i16++;
                    i13 = i5;
                    jArr3 = jArr;
                }
            }
            iA = i13;
            Unit unit = Unit.f71706a;
            Object[] objArr4 = eVarC.f85077a;
            int i25 = eVarC.f85079c;
            for (int i26 = 0; i26 < i25; i26++) {
                ((s) objArr4[i26]).a();
            }
            return iA;
        } catch (Throwable th3) {
            th = th3;
        }
    }
}
