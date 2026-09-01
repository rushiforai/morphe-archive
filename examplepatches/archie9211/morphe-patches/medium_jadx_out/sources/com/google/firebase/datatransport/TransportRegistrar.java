package com.google.firebase.datatransport;

import android.content.Context;
import com.google.firebase.components.ComponentRegistrar;
import defpackage.hy1;
import defpackage.iy1;
import defpackage.j21;
import defpackage.lsd;
import defpackage.mx6;
import defpackage.nsd;
import defpackage.psd;
import defpackage.pwd;
import defpackage.rqa;
import defpackage.s73;
import defpackage.ywb;
import defpackage.zy1;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class TransportRegistrar implements ComponentRegistrar {
    private static final String LIBRARY_NAME = "fire-transport";

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ nsd lambda$getComponents$0(zy1 zy1Var) {
        psd.b((Context) zy1Var.c(Context.class));
        return psd.a().c(j21.f);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ nsd lambda$getComponents$1(zy1 zy1Var) {
        psd.b((Context) zy1Var.c(Context.class));
        return psd.a().c(j21.f);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static /* synthetic */ nsd lambda$getComponents$2(zy1 zy1Var) {
        psd.b((Context) zy1Var.c(Context.class));
        return psd.a().c(j21.e);
    }

    @Override // com.google.firebase.components.ComponentRegistrar
    public List<iy1> getComponents() {
        hy1 hy1VarB = iy1.b(nsd.class);
        hy1VarB.a = LIBRARY_NAME;
        hy1VarB.a(s73.b(Context.class));
        hy1VarB.f = new ywb(10);
        iy1 iy1VarB = hy1VarB.b();
        hy1 hy1VarA = iy1.a(new rqa(mx6.class, nsd.class));
        hy1VarA.a(s73.b(Context.class));
        hy1VarA.f = new ywb(11);
        iy1 iy1VarB2 = hy1VarA.b();
        hy1 hy1VarA2 = iy1.a(new rqa(lsd.class, nsd.class));
        hy1VarA2.a(s73.b(Context.class));
        hy1VarA2.f = new ywb(12);
        return Arrays.asList(iy1VarB, iy1VarB2, hy1VarA2.b(), pwd.E(LIBRARY_NAME, "19.0.0"));
    }
}
