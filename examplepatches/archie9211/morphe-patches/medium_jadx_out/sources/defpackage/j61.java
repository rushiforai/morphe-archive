package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j61 extends hec implements p61 {
    public final xwd b;
    public final n61 c;
    public final boolean d;
    public final uvd e;

    public j61(xwd xwdVar, n61 n61Var, boolean z, uvd uvdVar) {
        xwdVar.getClass();
        uvdVar.getClass();
        this.b = xwdVar;
        this.c = n61Var;
        this.d = z;
        this.e = uvdVar;
    }

    @Override // defpackage.mn6
    public final ev7 H() {
        return l24.a(t14.CAPTURED_TYPE_SCOPE, true, new String[0]);
    }

    @Override // defpackage.mn6
    public final List h0() {
        return ey3.a;
    }

    @Override // defpackage.mn6
    public final uvd i0() {
        return this.e;
    }

    @Override // defpackage.mn6
    public final zvd j0() {
        return this.c;
    }

    @Override // defpackage.mn6
    public final boolean k0() {
        return this.d;
    }

    @Override // defpackage.mn6
    public final mn6 l0(sn6 sn6Var) {
        return new j61(this.b.d(sn6Var), this.c, this.d, this.e);
    }

    @Override // defpackage.hec, defpackage.o3e
    public final o3e n0(boolean z) {
        if (z == this.d) {
            return this;
        }
        return new j61(this.b, this.c, z, this.e);
    }

    @Override // defpackage.o3e
    /* JADX INFO: renamed from: o0 */
    public final o3e l0(sn6 sn6Var) {
        return new j61(this.b.d(sn6Var), this.c, this.d, this.e);
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: q0 */
    public final hec n0(boolean z) {
        if (z == this.d) {
            return this;
        }
        return new j61(this.b, this.c, z, this.e);
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: r0 */
    public final hec p0(uvd uvdVar) {
        uvdVar.getClass();
        return new j61(this.b, this.c, this.d, uvdVar);
    }

    @Override // defpackage.hec
    public final String toString() {
        StringBuilder sb = new StringBuilder("Captured(");
        sb.append(this.b);
        sb.append(')');
        sb.append(this.d ? "?" : "");
        return sb.toString();
    }
}
