package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eq0 implements zs5 {
    public final /* synthetic */ ArrayList a;

    public eq0(ArrayList arrayList) {
        this.a = arrayList;
    }

    @Override // defpackage.zs5
    public final void a(xz0 xz0Var) {
        yz0 yz0Var = new yz0(xz0Var);
        yz0Var.n();
        for (zs5 zs5Var : this.a) {
            kz0 kz0Var = new kz0();
            zs5Var.a(kz0Var);
            yz0Var.p(kz0Var.G0());
        }
        yz0Var.k();
    }

    @Override // defpackage.zs5
    public final String b() {
        return "application/json";
    }

    @Override // defpackage.zs5
    public final long c() {
        return -1L;
    }
}
