package defpackage;

import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c15 extends h15 {
    public final /* synthetic */ j15 a;

    public c15(j15 j15Var) {
        this.a = j15Var;
    }

    @Override // defpackage.h15
    public final void a() {
        j15 j15Var = this.a;
        j15Var.S.a.a();
        kyd.R(j15Var);
        Bundle bundle = j15Var.b;
        j15Var.S.a(bundle != null ? bundle.getBundle("registryState") : null);
    }
}
