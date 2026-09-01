package defpackage;

import android.util.Log;
import androidx.fragment.app.strictmode.FragmentReuseViolation;
import androidx.fragment.app.strictmode.Violation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class u25 {
    public static final t25 a = t25.a;

    public static t25 a(j15 j15Var) {
        while (j15Var != null) {
            if (j15Var.t()) {
                j15Var.m();
            }
            j15Var = j15Var.v;
        }
        return a;
    }

    public static void b(Violation violation) {
        if (f25.I(3)) {
            Log.d("FragmentManager", "StrictMode violation in ".concat(violation.a.getClass().getName()), violation);
        }
    }

    public static final void c(j15 j15Var, String str) {
        str.getClass();
        b(new FragmentReuseViolation(j15Var, "Attempting to reuse fragment " + j15Var + " with previous ID " + str));
        a(j15Var).getClass();
    }
}
