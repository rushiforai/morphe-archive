package defpackage;

import android.window.BackEvent;
import android.window.OnBackAnimationCallback;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aq8 implements OnBackAnimationCallback {
    public final /* synthetic */ bq8 a;

    public aq8(bq8 bq8Var) {
        this.a = bq8Var;
    }

    public final void onBackCancelled() {
        bq8 bq8Var = this.a;
        jc8 jc8Var = bq8Var.a;
        if (jc8Var == null) {
            ygf.f("This input is not added to any dispatcher.");
            return;
        }
        if (!bq8Var.b) {
            jc8Var.d(bq8Var, null);
        }
        oc8 oc8Var = jc8Var.b;
        if (bq8Var.equals(oc8Var.h) && -1 == oc8Var.g) {
            lc8 lc8VarC = oc8Var.f;
            if (lc8VarC == null) {
                lc8VarC = oc8Var.c(-1);
            }
            oc8Var.f = null;
            oc8Var.g = 0;
            oc8Var.h = null;
            if (lc8VarC != null) {
                lc8VarC.a();
            }
            oc8Var.a.m(null, pc8.d);
        }
        bq8Var.b = false;
    }

    public final void onBackInvoked() {
        this.a.a();
    }

    public final void onBackProgressed(BackEvent backEvent) {
        backEvent.getClass();
        ic8 ic8VarA = w4.a(backEvent);
        bq8 bq8Var = this.a;
        jc8 jc8Var = bq8Var.a;
        if (jc8Var == null) {
            ygf.f("This input is not added to any dispatcher.");
            return;
        }
        if (bq8Var.b) {
            oc8 oc8Var = jc8Var.b;
            if (bq8Var.equals(oc8Var.h) && -1 == oc8Var.g) {
                lc8 lc8VarC = oc8Var.f;
                if (lc8VarC == null) {
                    lc8VarC = oc8Var.c(-1);
                }
                if (lc8VarC != null) {
                    lc8VarC.c(ic8VarA);
                }
                oc8Var.a.m(null, new qc8(ic8VarA));
            }
        }
    }

    public final void onBackStarted(BackEvent backEvent) {
        backEvent.getClass();
        ic8 ic8VarA = w4.a(backEvent);
        bq8 bq8Var = this.a;
        jc8 jc8Var = bq8Var.a;
        if (jc8Var == null) {
            ygf.f("This input is not added to any dispatcher.");
        } else {
            if (bq8Var.b) {
                return;
            }
            jc8Var.d(bq8Var, ic8VarA);
            bq8Var.b = true;
        }
    }
}
