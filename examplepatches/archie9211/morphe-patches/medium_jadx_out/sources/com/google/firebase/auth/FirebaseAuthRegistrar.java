package com.google.firebase.auth;

import com.google.firebase.components.ComponentRegistrar;
import defpackage.aj5;
import defpackage.gy1;
import defpackage.hy1;
import defpackage.iq1;
import defpackage.iy1;
import defpackage.om0;
import defpackage.ps0;
import defpackage.pwd;
import defpackage.rqa;
import defpackage.rzd;
import defpackage.s73;
import defpackage.t66;
import defpackage.wmf;
import defpackage.xj4;
import defpackage.y56;
import defpackage.yy6;
import defpackage.zi5;
import defpackage.zy1;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FirebaseAuthRegistrar implements ComponentRegistrar {
    public static /* synthetic */ wmf lambda$getComponents$0(rqa rqaVar, rqa rqaVar2, rqa rqaVar3, rqa rqaVar4, rqa rqaVar5, zy1 zy1Var) {
        return new wmf((xj4) zy1Var.c(xj4.class), zy1Var.e(t66.class), zy1Var.e(aj5.class), (Executor) zy1Var.o(rqaVar), (Executor) zy1Var.o(rqaVar2), (Executor) zy1Var.o(rqaVar3), (ScheduledExecutorService) zy1Var.o(rqaVar4), (Executor) zy1Var.o(rqaVar5));
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.firebase.components.ComponentRegistrar
    public List<iy1> getComponents() {
        rqa rqaVar = new rqa(om0.class, Executor.class);
        rqa rqaVar2 = new rqa(ps0.class, Executor.class);
        rqa rqaVar3 = new rqa(yy6.class, Executor.class);
        rqa rqaVar4 = new rqa(yy6.class, ScheduledExecutorService.class);
        rqa rqaVar5 = new rqa(rzd.class, Executor.class);
        hy1 hy1Var = new hy1(wmf.class, y56.class);
        hy1Var.a(s73.b(xj4.class));
        hy1Var.a(new s73(1, 1, aj5.class));
        hy1Var.a(new s73(rqaVar, 1, 0));
        hy1Var.a(new s73(rqaVar2, 1, 0));
        hy1Var.a(new s73(rqaVar3, 1, 0));
        hy1Var.a(new s73(rqaVar4, 1, 0));
        hy1Var.a(new s73(rqaVar5, 1, 0));
        hy1Var.a(new s73(0, 1, t66.class));
        iq1 iq1Var = new iq1(20, false);
        iq1Var.b = rqaVar;
        iq1Var.c = rqaVar2;
        iq1Var.d = rqaVar3;
        iq1Var.e = rqaVar4;
        iq1Var.f = rqaVar5;
        hy1Var.f = iq1Var;
        iy1 iy1VarB = hy1Var.b();
        zi5 zi5Var = new zi5(0 == true ? 1 : 0);
        hy1 hy1VarB = iy1.b(zi5.class);
        hy1VarB.e = 1;
        hy1VarB.f = new gy1(0 == true ? 1 : 0, zi5Var);
        return Arrays.asList(iy1VarB, hy1VarB.b(), pwd.E("fire-auth", "24.1.0"));
    }
}
