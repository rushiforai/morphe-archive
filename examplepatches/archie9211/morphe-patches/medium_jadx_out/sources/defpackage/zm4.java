package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class zm4 extends o3e implements qn6 {
    public final hec b;
    public final hec c;

    public zm4(hec hecVar, hec hecVar2) {
        hecVar.getClass();
        hecVar2.getClass();
        this.b = hecVar;
        this.c = hecVar2;
    }

    @Override // defpackage.mn6
    public ev7 H() {
        return q0().H();
    }

    @Override // defpackage.mn6
    public final List h0() {
        return q0().h0();
    }

    @Override // defpackage.mn6
    public final uvd i0() {
        return q0().i0();
    }

    @Override // defpackage.mn6
    public final zvd j0() {
        return q0().j0();
    }

    @Override // defpackage.mn6
    public final boolean k0() {
        return q0().k0();
    }

    public abstract hec q0();

    public abstract String r0(w83 w83Var, w83 w83Var2);

    public String toString() {
        return w83.e.W(this);
    }
}
