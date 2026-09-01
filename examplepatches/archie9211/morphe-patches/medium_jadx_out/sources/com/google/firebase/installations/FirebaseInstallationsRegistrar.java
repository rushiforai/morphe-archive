package com.google.firebase.installations;

import com.google.firebase.components.ComponentRegistrar;
import defpackage.aj5;
import defpackage.gk4;
import defpackage.gy1;
import defpackage.hk4;
import defpackage.hy1;
import defpackage.ik4;
import defpackage.iy1;
import defpackage.om0;
import defpackage.ps0;
import defpackage.pwd;
import defpackage.rqa;
import defpackage.s73;
import defpackage.wzb;
import defpackage.xj4;
import defpackage.zi5;
import defpackage.zy1;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FirebaseInstallationsRegistrar implements ComponentRegistrar {
    private static final String LIBRARY_NAME = "fire-installations";

    /* JADX INFO: Access modifiers changed from: private */
    public static hk4 lambda$getComponents$0(zy1 zy1Var) {
        return new gk4((xj4) zy1Var.c(xj4.class), zy1Var.e(aj5.class), (ExecutorService) zy1Var.o(new rqa(om0.class, ExecutorService.class)), new wzb((Executor) zy1Var.o(new rqa(ps0.class, Executor.class))));
    }

    @Override // com.google.firebase.components.ComponentRegistrar
    public List<iy1> getComponents() {
        hy1 hy1VarB = iy1.b(hk4.class);
        hy1VarB.a = LIBRARY_NAME;
        hy1VarB.a(s73.b(xj4.class));
        int i = 0;
        hy1VarB.a(new s73(0, 1, aj5.class));
        hy1VarB.a(new s73(new rqa(om0.class, ExecutorService.class), 1, 0));
        hy1VarB.a(new s73(new rqa(ps0.class, Executor.class), 1, 0));
        hy1VarB.f = new ik4(i);
        iy1 iy1VarB = hy1VarB.b();
        zi5 zi5Var = new zi5(i);
        hy1 hy1VarB2 = iy1.b(zi5.class);
        hy1VarB2.e = 1;
        hy1VarB2.f = new gy1(i, zi5Var);
        return Arrays.asList(iy1VarB, hy1VarB2.b(), pwd.E(LIBRARY_NAME, "19.1.0"));
    }
}
