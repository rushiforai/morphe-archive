package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jy6 {
    public vx6 a;
    public cy6 b;

    public final void a(iy6 iy6Var, ux6 ux6Var) {
        vx6 targetState = ux6Var.getTargetState();
        vx6 vx6Var = this.a;
        vx6Var.getClass();
        if (targetState != null && targetState.compareTo(vx6Var) < 0) {
            vx6Var = targetState;
        }
        this.a = vx6Var;
        this.b.f(iy6Var, ux6Var);
        this.a = targetState;
    }
}
