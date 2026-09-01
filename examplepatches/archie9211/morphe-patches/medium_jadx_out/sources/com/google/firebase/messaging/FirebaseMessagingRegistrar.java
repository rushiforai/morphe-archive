package com.google.firebase.messaging;

import com.google.firebase.components.ComponentRegistrar;
import defpackage.cj5;
import defpackage.dz2;
import defpackage.e33;
import defpackage.hk4;
import defpackage.hy1;
import defpackage.iy1;
import defpackage.jk4;
import defpackage.lsd;
import defpackage.nsd;
import defpackage.pwd;
import defpackage.rd6;
import defpackage.rqa;
import defpackage.s73;
import defpackage.xj4;
import defpackage.zwc;
import defpackage.zy1;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FirebaseMessagingRegistrar implements ComponentRegistrar {
    private static final String LIBRARY_NAME = "fire-fcm";

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ FirebaseMessaging lambda$getComponents$0(rqa rqaVar, zy1 zy1Var) {
        xj4 xj4Var = (xj4) zy1Var.c(xj4.class);
        if (zy1Var.c(jk4.class) == null) {
            return new FirebaseMessaging(xj4Var, zy1Var.e(e33.class), zy1Var.e(cj5.class), (hk4) zy1Var.c(hk4.class), zy1Var.l(rqaVar), (zwc) zy1Var.c(zwc.class));
        }
        rd6.m();
        return null;
    }

    @Override // com.google.firebase.components.ComponentRegistrar
    public List<iy1> getComponents() {
        rqa rqaVar = new rqa(lsd.class, nsd.class);
        hy1 hy1VarB = iy1.b(FirebaseMessaging.class);
        hy1VarB.a = LIBRARY_NAME;
        hy1VarB.a(s73.b(xj4.class));
        hy1VarB.a(new s73(0, 0, jk4.class));
        hy1VarB.a(new s73(0, 1, e33.class));
        hy1VarB.a(new s73(0, 1, cj5.class));
        hy1VarB.a(s73.b(hk4.class));
        hy1VarB.a(new s73(rqaVar, 0, 1));
        hy1VarB.a(s73.b(zwc.class));
        hy1VarB.f = new dz2(rqaVar, 1);
        hy1VarB.c(1);
        return Arrays.asList(hy1VarB.b(), pwd.E(LIBRARY_NAME, "25.0.2"));
    }
}
