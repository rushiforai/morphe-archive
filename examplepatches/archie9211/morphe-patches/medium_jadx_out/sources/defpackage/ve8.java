package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ve8 extends hec implements p61 {
    public final i61 b;
    public final we8 c;
    public final o3e d;
    public final uvd e;
    public final boolean f;
    public final boolean g;

    /* JADX WARN: Illegal instructions before constructor call */
    public ve8(i61 i61Var, we8 we8Var, o3e o3eVar, uvd uvdVar, boolean z, int i) {
        if ((i & 8) != 0) {
            uvd.b.getClass();
            uvdVar = uvd.c;
        }
        this(i61Var, we8Var, o3eVar, uvdVar, (i & 16) != 0 ? false : z, false);
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
        return this.f;
    }

    @Override // defpackage.hec, defpackage.o3e
    public final o3e n0(boolean z) {
        return new ve8(this.b, this.c, this.d, this.e, z, 32);
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: q0 */
    public final hec n0(boolean z) {
        return new ve8(this.b, this.c, this.d, this.e, z, 32);
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: r0 */
    public final hec p0(uvd uvdVar) {
        uvdVar.getClass();
        return new ve8(this.b, this.c, this.d, uvdVar, this.f, this.g);
    }

    @Override // defpackage.o3e
    /* JADX INFO: renamed from: s0, reason: merged with bridge method [inline-methods] and merged with bridge method [inline-methods] */
    public final ve8 l0(sn6 sn6Var) {
        we8 we8Var = this.c;
        xwd xwdVarD = we8Var.a.d(sn6Var);
        a3 a3Var = we8Var.b != null ? new a3(we8Var, sn6Var, false, 20) : null;
        we8 we8Var2 = we8Var.c;
        if (we8Var2 == null) {
            we8Var2 = we8Var;
        }
        we8 we8Var3 = new we8(xwdVarD, a3Var, we8Var2, we8Var.d);
        o3e o3eVar = this.d;
        return new ve8(this.b, we8Var3, o3eVar != null ? o3eVar : null, this.e, this.f, 32);
    }

    public ve8(i61 i61Var, we8 we8Var, o3e o3eVar, uvd uvdVar, boolean z, boolean z2) {
        i61Var.getClass();
        we8Var.getClass();
        uvdVar.getClass();
        this.b = i61Var;
        this.c = we8Var;
        this.d = o3eVar;
        this.e = uvdVar;
        this.f = z;
        this.g = z2;
    }
}
