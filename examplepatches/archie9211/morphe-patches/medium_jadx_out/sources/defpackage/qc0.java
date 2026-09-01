package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qc0 implements ec0 {
    public final /* synthetic */ wc0 a;
    public final /* synthetic */ wc0 b;
    public final /* synthetic */ ld0 c;

    public qc0(wc0 wc0Var, ld0 ld0Var) {
        this.b = wc0Var;
        this.c = ld0Var;
        this.a = wc0Var;
    }

    @Override // defpackage.ec0
    public final void a(SusiOperation susiOperation) {
        susiOperation.getClass();
        l3d l3dVar = this.c.g;
        wc0 wc0Var = this.b;
        wc0Var.g(l3dVar);
        wc0Var.a(susiOperation);
    }

    @Override // defpackage.ec0
    public final void b(SusiOperation susiOperation, SusiDestination susiDestination, String str, boolean z) {
        susiOperation.getClass();
        ld0 ld0Var = this.c;
        String str2 = ld0Var.i;
        String str3 = ld0Var.c;
        SusiOperation susiOperation2 = ld0Var.h;
        SusiDestination susiDestination2 = ld0Var.f;
        str2.getClass();
        str3.getClass();
        susiOperation2.getClass();
        yd0 yd0Var = this.b.a;
        yd0Var.k(l3d.MEDIUM);
        vx0.c0(f76.F(yd0Var), null, null, new b9(yd0Var, str2, susiDestination2, str3, susiOperation2, (n92) null, 9), 3);
    }

    @Override // defpackage.ec0
    public final void c() {
        this.a.c();
    }

    @Override // defpackage.ec0
    public final void d() {
        l3d l3dVar = this.c.g;
        wc0 wc0Var = this.b;
        wc0Var.g(l3dVar);
        wc0Var.d();
    }

    @Override // defpackage.ec0
    public final void e() {
        l3d l3dVar = this.c.g;
        wc0 wc0Var = this.b;
        wc0Var.g(l3dVar);
        wc0Var.e();
    }

    @Override // defpackage.ec0
    public final void f(String str) {
        l3d l3dVar = this.c.g;
        wc0 wc0Var = this.b;
        wc0Var.g(l3dVar);
        wc0Var.f(str);
    }
}
