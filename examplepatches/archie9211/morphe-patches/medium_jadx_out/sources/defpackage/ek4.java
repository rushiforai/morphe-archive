package defpackage;

import com.google.firebase.installations.FirebaseInstallationsException;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ek4 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ gk4 b;

    public /* synthetic */ ek4(gk4 gk4Var, int i) {
        this.a = i;
        this.b = gk4Var;
    }

    /* JADX WARN: Finally extract failed */
    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        zj0 zj0VarF1;
        zj0 zj0VarI;
        int i = this.a;
        gk4 gk4Var = this.b;
        switch (i) {
            case 0:
                gk4Var.b();
                return;
            case 1:
                gk4Var.b();
                return;
            default:
                synchronized (gk4.l) {
                    try {
                        xj4 xj4Var = gk4Var.a;
                        xj4Var.a();
                        s26 s26VarY = s26.Y(xj4Var.a);
                        try {
                            zj0VarF1 = gk4Var.c.f1();
                            if (s26VarY != null) {
                                s26VarY.u0();
                            }
                        } catch (Throwable th) {
                            if (s26VarY != null) {
                                s26VarY.u0();
                            }
                            throw th;
                        }
                    } finally {
                    }
                }
                try {
                    g89 g89Var = zj0VarF1.b;
                    g89 g89Var2 = g89.REGISTER_ERROR;
                    if (g89Var == g89Var2) {
                        zj0VarI = gk4Var.i(zj0VarF1);
                    } else {
                        if (g89Var == g89.UNREGISTERED) {
                            zj0VarI = gk4Var.i(zj0VarF1);
                        } else if (!gk4Var.d.a(zj0VarF1)) {
                            return;
                        } else {
                            zj0VarI = gk4Var.c(zj0VarF1);
                        }
                    }
                    gk4Var.f(zj0VarI);
                    gk4Var.m(zj0VarF1, zj0VarI);
                    if (zj0VarI.b == g89.REGISTERED) {
                        gk4Var.l(zj0VarI.a);
                    }
                    g89 g89Var3 = zj0VarI.b;
                    if (g89Var3 == g89Var2) {
                        gk4Var.j(new FirebaseInstallationsException());
                        return;
                    } else if (g89Var3 == g89.NOT_GENERATED || g89Var3 == g89.ATTEMPT_MIGRATION) {
                        gk4Var.j(new IOException("Installation ID could not be validated with the Firebase servers (maybe it was deleted). Firebase Installations will need to create a new Installation ID and auth token. Please retry your last request."));
                        return;
                    } else {
                        gk4Var.k(zj0VarI);
                        return;
                    }
                } catch (FirebaseInstallationsException e) {
                    gk4Var.j(e);
                    return;
                }
        }
    }
}
