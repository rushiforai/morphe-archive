package p1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class i0 extends z1.a0 implements y2 {

    /* renamed from: b, reason: collision with root package name */
    public final Function0 f81452b;

    /* renamed from: c, reason: collision with root package name */
    public final t2 f81453c;

    /* renamed from: d, reason: collision with root package name */
    public h0 f81454d = new h0(z1.k.k().g());

    public i0(Function0 function0, t2 t2Var) {
        this.f81452b = function0;
        this.f81453c = t2Var;
    }

    @Override // z1.z
    public final z1.b0 d() {
        return this.f81454d;
    }

    @Override // z1.z
    public final void f(z1.b0 b0Var) {
        Intrinsics.e(b0Var, "null cannot be cast to non-null type androidx.compose.runtime.DerivedSnapshotState.ResultRecord<T of androidx.compose.runtime.DerivedSnapshotState>");
        this.f81454d = (h0) b0Var;
    }

    @Override // p1.y2
    public final Object getValue() {
        Function1 function1E = z1.k.k().e();
        if (function1E != null) {
            function1E.invoke(this);
        }
        z1.f fVarK = z1.k.k();
        return m((h0) z1.k.j(this.f81454d, fVarK), fVarK, true, this.f81452b).f81443f;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x009c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final h0 m(h0 h0Var, z1.f fVar, boolean z11, Function0 function0) {
        r1.e eVarC;
        h0 h0Var2;
        t2 t2Var;
        int i5;
        if (h0Var.c(this, fVar)) {
            if (z11) {
                eVarC = androidx.compose.runtime.d.c();
                Object[] objArr = eVarC.f85077a;
                int i11 = eVarC.f85079c;
                for (int i12 = 0; i12 < i11; i12++) {
                    ((s) objArr[i12]).b();
                }
                try {
                    z.s0 s0Var = h0Var.f81442e;
                    x7.u uVar = u2.f81598a;
                    x1.g gVar = (x1.g) uVar.h();
                    if (gVar == null) {
                        gVar = new x1.g();
                        uVar.u(gVar);
                    }
                    int i13 = gVar.f94956a;
                    Object[] objArr2 = s0Var.f97830b;
                    int[] iArr = s0Var.f97831c;
                    long[] jArr = s0Var.f97829a;
                    int length = jArr.length - 2;
                    if (length >= 0) {
                        int i14 = 0;
                        while (true) {
                            long j11 = jArr[i14];
                            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                                int i15 = 8;
                                int i16 = 8 - ((~(i14 - length)) >>> 31);
                                int i17 = 0;
                                while (i17 < i16) {
                                    if ((j11 & 255) < 128) {
                                        int i18 = (i14 << 3) + i17;
                                        i5 = i15;
                                        z1.z zVar = (z1.z) objArr2[i18];
                                        gVar.f94956a = i13 + iArr[i18];
                                        Function1 function1E = fVar.e();
                                        if (function1E != null) {
                                            function1E.invoke(zVar);
                                        }
                                    } else {
                                        i5 = i15;
                                    }
                                    j11 >>= i5;
                                    i17++;
                                    i15 = i5;
                                }
                                if (i16 != i15) {
                                    break;
                                }
                                if (i14 == length) {
                                    break;
                                }
                                i14++;
                            }
                        }
                    }
                    gVar.f94956a = i13;
                    Unit unit = Unit.f71706a;
                    Object[] objArr3 = eVarC.f85077a;
                    int i19 = eVarC.f85079c;
                    for (int i21 = 0; i21 < i19; i21++) {
                        ((s) objArr3[i21]).a();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            return h0Var;
        }
        z.h0 h0Var3 = new z.h0();
        x7.u uVar2 = u2.f81598a;
        x1.g gVar2 = (x1.g) uVar2.h();
        if (gVar2 == null) {
            gVar2 = new x1.g();
            uVar2.u(gVar2);
        }
        x1.g gVar3 = gVar2;
        int i22 = gVar3.f94956a;
        eVarC = androidx.compose.runtime.d.c();
        Object[] objArr4 = eVarC.f85077a;
        int i23 = eVarC.f85079c;
        for (int i24 = 0; i24 < i23; i24++) {
            ((s) objArr4[i24]).b();
        }
        try {
            gVar3.f94956a = i22 + 1;
            Object objR = o2.f.r(function0, new b00.n0(i22, 1, this, gVar3, h0Var3));
            gVar3.f94956a = i22;
            Object[] objArr5 = eVarC.f85077a;
            int i25 = eVarC.f85079c;
            for (int i26 = 0; i26 < i25; i26++) {
                ((s) objArr5[i26]).a();
            }
            Object obj = z1.k.f97943c;
            synchronized (obj) {
                try {
                    z1.f fVarK = z1.k.k();
                    Object obj2 = h0Var.f81443f;
                    if (obj2 == h0.f81439h || (t2Var = this.f81453c) == null || !t2Var.a(objR, obj2)) {
                        h0 h0Var4 = this.f81454d;
                        synchronized (obj) {
                            z1.b0 b0VarM = z1.k.m(h0Var4, this);
                            b0VarM.a(h0Var4);
                            b0VarM.f97901a = fVarK.g();
                            h0Var2 = (h0) b0VarM;
                            h0Var2.f81442e = h0Var3;
                            h0Var2.f81444g = h0Var2.d(this, fVarK);
                            h0Var2.f81443f = objR;
                        }
                        return h0Var2;
                    }
                    h0Var.f81442e = h0Var3;
                    h0Var.f81444g = h0Var.d(this, fVarK);
                    h0Var2 = h0Var;
                } catch (Throwable th3) {
                    throw th3;
                }
            }
            x1.g gVar4 = (x1.g) u2.f81598a.h();
            if (gVar4 == null || gVar4.f94956a != 0) {
                return h0Var2;
            }
            z1.k.k().m();
            synchronized (obj) {
                z1.f fVarK2 = z1.k.k();
                h0Var2.f81440c = fVarK2.g();
                h0Var2.f81441d = fVarK2.h();
                Unit unit2 = Unit.f71706a;
                return h0Var2;
            }
        } finally {
            Object[] objArr6 = eVarC.f85077a;
            int i27 = eVarC.f85079c;
            for (int i28 = 0; i28 < i27; i28++) {
                ((s) objArr6[i28]).a();
            }
        }
    }

    public final h0 p() {
        z1.f fVarK = z1.k.k();
        return m((h0) z1.k.j(this.f81454d, fVarK), fVarK, false, this.f81452b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DerivedState(value=");
        h0 h0Var = (h0) z1.k.i(this.f81454d);
        sb2.append(h0Var.c(this, z1.k.k()) ? String.valueOf(h0Var.f81443f) : "<Not calculated>");
        sb2.append(")@");
        sb2.append(hashCode());
        return sb2.toString();
    }
}
