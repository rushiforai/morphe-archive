package x70;

import androidx.compose.ui.node.LayoutNode;
import java.util.Arrays;
import kotlin.Result;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public c[] f95211a;

    /* renamed from: b, reason: collision with root package name */
    public int f95212b;

    /* renamed from: c, reason: collision with root package name */
    public int f95213c;

    /* renamed from: d, reason: collision with root package name */
    public a0 f95214d;

    public final c b() {
        c cVarE;
        a0 a0Var;
        synchronized (this) {
            try {
                c[] cVarArrF = this.f95211a;
                if (cVarArrF == null) {
                    cVarArrF = f();
                    this.f95211a = cVarArrF;
                } else if (this.f95212b >= cVarArrF.length) {
                    Object[] objArrCopyOf = Arrays.copyOf(cVarArrF, cVarArrF.length * 2);
                    Intrinsics.f(objArrCopyOf, "copyOf(...)");
                    this.f95211a = (c[]) objArrCopyOf;
                    cVarArrF = (c[]) objArrCopyOf;
                }
                int i5 = this.f95213c;
                do {
                    cVarE = cVarArrF[i5];
                    if (cVarE == null) {
                        cVarE = e();
                        cVarArrF[i5] = cVarE;
                    }
                    i5++;
                    if (i5 >= cVarArrF.length) {
                        i5 = 0;
                    }
                } while (!cVarE.a(this));
                this.f95213c = i5;
                this.f95212b++;
                a0Var = this.f95214d;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (a0Var != null) {
            a0Var.v(1);
        }
        return cVarE;
    }

    public abstract c e();

    public abstract c[] f();

    public final void g(c cVar) {
        a0 a0Var;
        int i5;
        Continuation[] continuationArrB;
        synchronized (this) {
            try {
                int i11 = this.f95212b - 1;
                this.f95212b = i11;
                a0Var = this.f95214d;
                if (i11 == 0) {
                    this.f95213c = 0;
                }
                Intrinsics.e(cVar, "null cannot be cast to non-null type kotlinx.coroutines.flow.internal.AbstractSharedFlowSlot<kotlin.Any>");
                continuationArrB = cVar.b(this);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        for (Continuation continuation : continuationArrB) {
            if (continuation != null) {
                int i12 = Result.f71687b;
                continuation.resumeWith(Unit.f71706a);
            }
        }
        if (a0Var != null) {
            a0Var.v(-1);
        }
    }

    public final a0 h() {
        a0 a0Var;
        synchronized (this) {
            a0Var = this.f95214d;
            if (a0Var == null) {
                int i5 = this.f95212b;
                a0Var = new a0(1, LayoutNode.NotPlacedPlaceOrder, v70.a.f92142b);
                a0Var.c(Integer.valueOf(i5));
                this.f95214d = a0Var;
            }
        }
        return a0Var;
    }
}
