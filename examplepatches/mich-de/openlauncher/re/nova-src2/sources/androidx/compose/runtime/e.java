package androidx.compose.runtime;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import p1.a3;
import p1.b3;
import p1.f0;
import p1.g1;
import p1.n0;
import p1.r1;
import p1.s2;
import p1.t2;
import p1.y0;

/* loaded from: classes.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public final y0 f14111a;

    public e(Function0 function0) {
        this.f14111a = new y0(function0);
    }

    public abstract r1 a(Object obj);

    public b3 b() {
        return this.f14111a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final b3 c(r1 r1Var, b3 b3Var) {
        n0 n0Var = null;
        if (b3Var instanceof n0) {
            if (r1Var.f81541d) {
                n0Var = (n0) b3Var;
                ((s2) n0Var.f81515a).setValue(r1Var.a());
            }
        } else if (b3Var instanceof a3) {
            if ((r1Var.f81539b || r1Var.f81542e != null) && !r1Var.f81541d) {
                a3 a3Var = (a3) b3Var;
                if (Intrinsics.b(r1Var.a(), a3Var.f81383a)) {
                    n0Var = a3Var;
                }
            }
        } else if (b3Var instanceof f0) {
            r1Var.getClass();
        }
        if (n0Var != null) {
            return n0Var;
        }
        if (!r1Var.f81541d) {
            return new a3(r1Var.a());
        }
        Object obj = r1Var.f81542e;
        t2 t2Var = r1Var.f81540c;
        if (t2Var == null) {
            t2Var = g1.f81425e;
        }
        return new n0(new ParcelableSnapshotMutableState(obj, t2Var));
    }
}
