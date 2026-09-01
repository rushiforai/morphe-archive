package com.google.firebase.sessions;

import android.content.Context;
import com.google.firebase.components.ComponentRegistrar;
import defpackage.bo;
import defpackage.c4b;
import defpackage.d46;
import defpackage.dm2;
import defpackage.e8a;
import defpackage.f1c;
import defpackage.h7c;
import defpackage.h8a;
import defpackage.hk4;
import defpackage.hy1;
import defpackage.i34;
import defpackage.ib2;
import defpackage.ik4;
import defpackage.iy1;
import defpackage.kb2;
import defpackage.nsd;
import defpackage.om0;
import defpackage.pk4;
import defpackage.ps0;
import defpackage.pwd;
import defpackage.qk4;
import defpackage.rk4;
import defpackage.rqa;
import defpackage.s73;
import defpackage.sk4;
import defpackage.v0c;
import defpackage.xi3;
import defpackage.xj4;
import defpackage.xk4;
import defpackage.yk4;
import defpackage.zs2;
import defpackage.zy1;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\b\u0001\u0018\u0000 \n2\u00020\u0001:\u0001\u000bB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J=\u0010\b\u001a0\u0012,\u0012*\u0012\u000e\b\u0001\u0012\n \u0007*\u0004\u0018\u00010\u00060\u0006 \u0007*\u0014\u0012\u000e\b\u0001\u0012\n \u0007*\u0004\u0018\u00010\u00060\u0006\u0018\u00010\u00050\u00050\u0004H\u0016¢\u0006\u0004\b\b\u0010\t¨\u0006\f"}, d2 = {"Lcom/google/firebase/sessions/FirebaseSessionsRegistrar;", "Lcom/google/firebase/components/ComponentRegistrar;", "<init>", "()V", "", "Liy1;", "", "kotlin.jvm.PlatformType", "getComponents", "()Ljava/util/List;", "Companion", "xk4", "com.google.firebase-firebase-sessions"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class FirebaseSessionsRegistrar implements ComponentRegistrar {

    @Deprecated
    public static final String LIBRARY_NAME = "fire-sessions";
    private static final xk4 Companion = new xk4();
    private static final rqa appContext = rqa.a(Context.class);
    private static final rqa firebaseApp = rqa.a(xj4.class);
    private static final rqa firebaseInstallationsApi = rqa.a(hk4.class);
    private static final rqa backgroundDispatcher = new rqa(om0.class, kb2.class);
    private static final rqa blockingDispatcher = new rqa(ps0.class, kb2.class);
    private static final rqa transportFactory = rqa.a(nsd.class);
    private static final rqa firebaseSessionsComponent = rqa.a(qk4.class);

    /* JADX INFO: Access modifiers changed from: private */
    public static final pk4 getComponents$lambda$0(zy1 zy1Var) {
        return (pk4) ((zs2) ((qk4) zy1Var.o(firebaseSessionsComponent))).p.get();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final qk4 getComponents$lambda$1(zy1 zy1Var) {
        Object objO = zy1Var.o(appContext);
        objO.getClass();
        Object objO2 = zy1Var.o(backgroundDispatcher);
        objO2.getClass();
        Object objO3 = zy1Var.o(blockingDispatcher);
        objO3.getClass();
        Object objO4 = zy1Var.o(firebaseApp);
        objO4.getClass();
        Object objO5 = zy1Var.o(firebaseInstallationsApi);
        objO5.getClass();
        h8a h8aVarL = zy1Var.l(transportFactory);
        h8aVarL.getClass();
        zs2 zs2Var = new zs2();
        zs2Var.a = v0c.a((xj4) objO4);
        v0c v0cVarA = v0c.a((Context) objO);
        zs2Var.b = v0cVarA;
        zs2Var.c = xi3.a(new i34(v0cVarA, 2));
        zs2Var.d = xi3.a(dm2.h);
        zs2Var.e = v0c.a((hk4) objO5);
        int i = 1;
        zs2Var.f = xi3.a(new i34(zs2Var.a, i));
        v0c v0cVarA2 = v0c.a((ib2) objO3);
        zs2Var.g = v0cVarA2;
        zs2Var.h = xi3.a(new rk4(zs2Var.f, v0cVarA2));
        zs2Var.i = v0c.a((ib2) objO2);
        int i2 = 0;
        zs2Var.j = xi3.a(new f1c(zs2Var.c, xi3.a(new c4b(zs2Var.d, zs2Var.e, zs2Var.f, zs2Var.h, xi3.a(new sk4((e8a) zs2Var.i, zs2Var.d, xi3.a(new rk4(zs2Var.b, zs2Var.g, i2)))))), i));
        e8a e8aVarA = xi3.a(bo.l);
        zs2Var.k = e8aVarA;
        zs2Var.l = xi3.a(new f1c(zs2Var.d, e8aVarA, i2));
        zs2Var.m = xi3.a(new c4b(zs2Var.a, (e8a) zs2Var.e, zs2Var.j, xi3.a(new i34(v0c.a(h8aVarL), i2)), (e8a) zs2Var.i));
        zs2Var.n = xi3.a(new sk4(zs2Var.b, (e8a) zs2Var.g, xi3.a(new v0c(i2, zs2Var.l))));
        e8a e8aVarA2 = xi3.a(new h7c(zs2Var.j, zs2Var.l, zs2Var.m, zs2Var.d, zs2Var.n, xi3.a(new rk4(zs2Var.b, zs2Var.k, i)), zs2Var.i));
        zs2Var.o = e8aVarA2;
        zs2Var.p = xi3.a(new yk4(zs2Var.a, zs2Var.j, zs2Var.i, xi3.a(new v0c(i, e8aVarA2))));
        return zs2Var;
    }

    @Override // com.google.firebase.components.ComponentRegistrar
    public List<iy1> getComponents() {
        hy1 hy1VarB = iy1.b(pk4.class);
        hy1VarB.a = LIBRARY_NAME;
        hy1VarB.a(s73.a(firebaseSessionsComponent));
        hy1VarB.f = new ik4(3);
        hy1VarB.c(2);
        iy1 iy1VarB = hy1VarB.b();
        hy1 hy1VarB2 = iy1.b(qk4.class);
        hy1VarB2.a = "fire-sessions-component";
        hy1VarB2.a(s73.a(appContext));
        hy1VarB2.a(s73.a(backgroundDispatcher));
        hy1VarB2.a(s73.a(blockingDispatcher));
        hy1VarB2.a(s73.a(firebaseApp));
        hy1VarB2.a(s73.a(firebaseInstallationsApi));
        hy1VarB2.a(new s73(transportFactory, 1, 1));
        hy1VarB2.f = new ik4(4);
        return d46.R(iy1VarB, hy1VarB2.b(), pwd.E(LIBRARY_NAME, "3.0.6"));
    }
}
