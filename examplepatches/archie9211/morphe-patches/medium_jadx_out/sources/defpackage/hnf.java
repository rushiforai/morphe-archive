package defpackage;

import java.util.concurrent.ScheduledExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hnf {
    public static final xp b = new xp("FirebaseAuth", new String[]{"FirebaseAuthFallback:"});
    public final ujf a;

    public hnf(xj4 xj4Var, ScheduledExecutorService scheduledExecutorService) {
        vp7.p(xj4Var);
        xj4Var.a();
        vp7.p(xj4Var.a);
        this.a = new ujf(4, new bh4(xj4Var, d87.m()));
        new tof(scheduledExecutorService);
    }

    public final void a(hha hhaVar, enf enfVar) {
        vp7.p(enfVar);
        vp7.p(hhaVar);
        ft2 ft2VarY = dl7.y((c99) hhaVar.a);
        zjf zjfVar = new zjf(enfVar, b);
        ujf ujfVar = this.a;
        bh4 bh4Var = (bh4) ujfVar.b;
        flf flfVar = new flf(ujfVar, zjfVar, 1);
        unf unfVar = (unf) bh4Var.b;
        qk7.D(unfVar.t("/verifyPhoneNumber", (String) bh4Var.a), ft2VarY, flfVar, new rrf(), (o2b) unfVar.b);
    }

    public final void b(fpf fpfVar, enf enfVar) {
        vp7.p(enfVar);
        vp7.p(fpfVar.c);
        qw3 qw3Var = fpfVar.c;
        String str = fpfVar.e;
        zjf zjfVar = new zjf(enfVar, b);
        vp7.p(qw3Var);
        boolean z = qw3Var.e;
        ujf ujfVar = this.a;
        if (z) {
            ujfVar.p(qw3Var.d, new o2b(ujfVar, qw3Var, str, zjfVar));
        } else {
            ujfVar.r(new fpf(qw3Var, null, str), zjfVar);
        }
    }

    public final void c(frf frfVar, enf enfVar) {
        vp7.p(frfVar);
        vp7.p(enfVar);
        frfVar.o = true;
        ujf ujfVar = this.a;
        bh4 bh4Var = (bh4) ujfVar.b;
        hlf hlfVar = new hlf(ujfVar, new zjf(enfVar, b), 1);
        unf unfVar = (unf) bh4Var.b;
        qk7.D(unfVar.t("/verifyAssertion", (String) bh4Var.a), frfVar, hlfVar, new irf(), (o2b) unfVar.b);
    }

    public final void d(String str, String str2, String str3, String str4, enf enfVar) {
        vp7.n(str);
        vp7.n(str2);
        vp7.p(enfVar);
        zjf zjfVar = new zjf(enfVar, b);
        vp7.n(str);
        vp7.n(str2);
        prf prfVar = new prf(str, str2, str3, str4);
        ujf ujfVar = this.a;
        bh4 bh4Var = (bh4) ujfVar.b;
        flf flfVar = new flf(ujfVar, zjfVar, 0);
        unf unfVar = (unf) bh4Var.b;
        qk7.D(unfVar.t("/verifyPassword", (String) bh4Var.a), prfVar, flfVar, new nrf(), (o2b) unfVar.b);
    }
}
