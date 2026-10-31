package z1;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class q {

    /* renamed from: a, reason: collision with root package name */
    public static final Object f97955a = new Object();

    public static final void a(int i5, int i11) {
        if (i5 < 0 || i5 >= i11) {
            throw new IndexOutOfBoundsException("index (" + i5 + ") is out of bound of [0, " + i11 + ')');
        }
    }

    public static final boolean b(w wVar, int i5, s1.d dVar, boolean z11) {
        boolean z12;
        synchronized (f97955a) {
            try {
                if (wVar.d() == i5) {
                    wVar.f(dVar);
                    z12 = true;
                    if (z11) {
                        wVar.h(wVar.e() + 1);
                    }
                    wVar.g(wVar.d() + 1);
                } else {
                    z12 = false;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return z12;
    }

    public static final w c(SnapshotStateList snapshotStateList) {
        w wVar = snapshotStateList.f14112a;
        Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.<get-readable>>");
        return (w) k.t(wVar, snapshotStateList);
    }

    public static final int d(SnapshotStateList snapshotStateList) {
        w wVar = snapshotStateList.f14112a;
        Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.withCurrent>");
        return ((w) k.i(wVar)).e();
    }

    public static final boolean e(SnapshotStateList snapshotStateList, Function1 function1) {
        int iD;
        s1.d dVarC;
        Object objInvoke;
        f fVarK;
        boolean zB;
        do {
            synchronized (f97955a) {
                w wVar = snapshotStateList.f14112a;
                Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.withCurrent>");
                w wVar2 = (w) k.i(wVar);
                iD = wVar2.d();
                dVarC = wVar2.c();
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(dVarC);
            t1.f fVarBuilder = dVarC.builder();
            objInvoke = function1.invoke(fVarBuilder);
            s1.d dVarE = fVarBuilder.e();
            if (Intrinsics.b(dVarE, dVarC)) {
                break;
            }
            w wVar3 = snapshotStateList.f14112a;
            Intrinsics.e(wVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.writable>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zB = b((w) k.w(wVar3, snapshotStateList, fVarK), iD, dVarE, true);
            }
            k.n(fVarK, snapshotStateList);
        } while (!zB);
        return ((Boolean) objInvoke).booleanValue();
    }
}
