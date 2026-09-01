package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class hj6 extends vg6 implements qh6, si6 {
    @Override // defpackage.vg6
    public final boolean B() {
        return D().B();
    }

    public abstract o4a C();

    public abstract mj6 D();

    @Override // defpackage.qh6
    public final boolean isExternal() {
        return C().g;
    }

    @Override // defpackage.qh6
    public final boolean isInfix() {
        C();
        return false;
    }

    @Override // defpackage.qh6
    public final boolean isInline() {
        return C().j;
    }

    @Override // defpackage.qh6
    public final boolean isOperator() {
        C();
        return false;
    }

    @Override // defpackage.rg6, defpackage.qh6
    public final boolean isSuspend() {
        C();
        return false;
    }

    @Override // defpackage.vg6
    public final ph6 w() {
        return D().h;
    }

    @Override // defpackage.vg6
    public final v41 x() {
        return null;
    }
}
