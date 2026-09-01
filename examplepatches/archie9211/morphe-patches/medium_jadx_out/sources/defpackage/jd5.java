package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class jd5 extends er7 {
    public final /* synthetic */ ArrayList d;
    public final /* synthetic */ kd5 e;

    public jd5(ArrayList arrayList, kd5 kd5Var) {
        this.d = arrayList;
        this.e = kd5Var;
    }

    @Override // defpackage.er7
    public final void u(f41 f41Var) {
        f41Var.getClass();
        cx8.r(f41Var, null);
        this.d.add(f41Var);
    }

    @Override // defpackage.er7
    public final void v(f41 f41Var, f41 f41Var2) {
        throw new IllegalStateException(("Conflict in scope of " + this.e.b + ": " + f41Var + " vs " + f41Var2).toString());
    }
}
