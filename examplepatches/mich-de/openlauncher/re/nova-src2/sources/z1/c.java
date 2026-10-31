package z1;

import java.util.Arrays;
import java.util.HashMap;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import z.p0;

/* loaded from: classes2.dex */
public final class c extends b {
    public final b o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f97903p;

    public c(long j11, j jVar, Function1 function1, Function1 function12, b bVar) {
        super(j11, jVar, function1, function12);
        this.o = bVar;
        bVar.k();
    }

    @Override // z1.b, z1.f
    public final void c() {
        if (this.f97921c) {
            return;
        }
        super.c();
        if (this.f97903p) {
            return;
        }
        this.f97903p = true;
        this.o.l();
    }

    @Override // z1.b
    public final w.b w() throws Throwable {
        c cVar;
        b bVar = this.o;
        if (bVar.f97900m || bVar.f97921c) {
            return new g(this);
        }
        p0 p0Var = this.f97895h;
        long j11 = this.f97920b;
        HashMap mapC = p0Var != null ? k.c(bVar.g(), this, this.o.d()) : null;
        Object obj = k.f97943c;
        synchronized (obj) {
            try {
                k.d(this);
            } catch (Throwable th2) {
                th = th2;
            }
            try {
                if (p0Var == null || p0Var.f97743d == 0) {
                    cVar = this;
                    a();
                    Unit unit = Unit.f71706a;
                } else {
                    cVar = this;
                    w.b bVarZ = cVar.z(this.o.g(), p0Var, mapC, this.o.d());
                    if (!bVarZ.equals(h.f97929d)) {
                        return bVarZ;
                    }
                    p0 p0VarX = cVar.o.x();
                    if (p0VarX != null) {
                        p0VarX.k(p0Var);
                    } else {
                        cVar.o.B(p0Var);
                        cVar.f97895h = null;
                    }
                }
                if (Intrinsics.i(cVar.o.g(), j11) < 0) {
                    cVar.o.v();
                }
                b bVar2 = cVar.o;
                bVar2.r(bVar2.d().c(j11).b(cVar.f97897j));
                cVar.o.A(j11);
                b bVar3 = cVar.o;
                int i5 = cVar.f97922d;
                cVar.f97922d = -1;
                if (i5 >= 0) {
                    int[] iArr = bVar3.f97898k;
                    Intrinsics.g(iArr, "<this>");
                    int length = iArr.length;
                    int[] iArrCopyOf = Arrays.copyOf(iArr, length + 1);
                    iArrCopyOf[length] = i5;
                    bVar3.f97898k = iArrCopyOf;
                } else {
                    bVar3.getClass();
                }
                b bVar4 = cVar.o;
                j jVar = cVar.f97897j;
                bVar4.getClass();
                synchronized (obj) {
                    bVar4.f97897j = bVar4.f97897j.e(jVar);
                    Unit unit2 = Unit.f71706a;
                    b bVar5 = cVar.o;
                    int[] iArr2 = cVar.f97898k;
                    bVar5.getClass();
                    if (iArr2.length != 0) {
                        int[] iArr3 = bVar5.f97898k;
                        if (iArr3.length != 0) {
                            int length2 = iArr3.length;
                            int length3 = iArr2.length;
                            int[] iArrCopyOf2 = Arrays.copyOf(iArr3, length2 + length3);
                            System.arraycopy(iArr2, 0, iArrCopyOf2, length2, length3);
                            Intrinsics.d(iArrCopyOf2);
                            iArr2 = iArrCopyOf2;
                        }
                        bVar5.f97898k = iArr2;
                    }
                }
                cVar.f97900m = true;
                if (!cVar.f97903p) {
                    cVar.f97903p = true;
                    cVar.o.l();
                }
                return h.f97929d;
            } catch (Throwable th3) {
                th = th3;
                throw th;
            }
        }
    }
}
