package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cx6 extends mn6 {
    public final x67 b;
    public final m45 c;
    public final u67 d;

    public cx6(x67 x67Var, m45 m45Var) {
        this.b = x67Var;
        this.c = m45Var;
        this.d = new u67(x67Var, m45Var);
    }

    @Override // defpackage.mn6
    public final ev7 H() {
        return n0().H();
    }

    @Override // defpackage.mn6
    public final List h0() {
        return n0().h0();
    }

    @Override // defpackage.mn6
    public final uvd i0() {
        return n0().i0();
    }

    @Override // defpackage.mn6
    public final zvd j0() {
        return n0().j0();
    }

    @Override // defpackage.mn6
    public final boolean k0() {
        return n0().k0();
    }

    @Override // defpackage.mn6
    public final mn6 l0(sn6 sn6Var) {
        return new cx6(this.b, new bx6(sn6Var, this));
    }

    @Override // defpackage.mn6
    public final o3e m0() {
        mn6 mn6VarN0 = n0();
        while (mn6VarN0 instanceof cx6) {
            mn6VarN0 = ((cx6) mn6VarN0).n0();
        }
        mn6VarN0.getClass();
        return (o3e) mn6VarN0;
    }

    public final mn6 n0() {
        return (mn6) this.d.invoke();
    }

    public final String toString() {
        u67 u67Var = this.d;
        return (u67Var.c == w67.NOT_COMPUTED || u67Var.c == w67.COMPUTING) ? "<Not computed yet>" : n0().toString();
    }
}
