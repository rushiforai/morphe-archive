package defpackage;

import android.view.ViewGroup;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u10 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ f20 b;

    public /* synthetic */ u10(f20 f20Var, int i) {
        this.a = i;
        this.b = f20Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        ViewGroup viewGroup;
        int i = this.a;
        f20 f20Var = this.b;
        switch (i) {
            case 0:
                if ((f20Var.o0 & 1) != 0) {
                    f20Var.u(0);
                }
                if ((f20Var.o0 & 4096) != 0) {
                    f20Var.u(108);
                }
                f20Var.n0 = false;
                f20Var.o0 = 0;
                break;
            default:
                f20Var.v.showAtLocation(f20Var.u, 55, 0, 0);
                jve jveVar = f20Var.x;
                if (jveVar != null) {
                    jveVar.b();
                }
                if (f20Var.z && (viewGroup = f20Var.A) != null && viewGroup.isLaidOut()) {
                    f20Var.u.setAlpha(0.0f);
                    jve jveVarA = ute.a(f20Var.u);
                    jveVarA.a(1.0f);
                    f20Var.x = jveVarA;
                    jveVarA.d(new w10(0, this));
                } else {
                    f20Var.u.setAlpha(1.0f);
                    f20Var.u.setVisibility(0);
                }
                break;
        }
    }
}
