package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class bp7 extends d78 implements xh6 {
    @Override // defpackage.fj6
    public final vi6 b() {
        return ((xh6) getReflected()).b();
    }

    @Override // defpackage.fi6
    public final yh6 c() {
        return ((xh6) getReflected()).c();
    }

    @Override // defpackage.h41
    public final rg6 computeReflected() {
        return n1b.a.d(this);
    }

    @Override // defpackage.ti6
    public final Object get() {
        pu7 pu7Var = ((l2c) this.receiver).a;
        pu7Var.getClass();
        return Boolean.valueOf(pu7Var.j(ek6.SETTINGS_IMAGE_LOADING_DISABLED, false));
    }

    @Override // defpackage.m45
    public final Object invoke() {
        return get();
    }
}
