package defpackage;

import android.graphics.Path;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v3c implements r82 {
    public final boolean a;
    public final Path.FillType b;
    public final pu c;
    public final pu d;
    public final boolean e;

    public v3c(String str, boolean z, Path.FillType fillType, pu puVar, pu puVar2, boolean z2) {
        this.a = z;
        this.b = fillType;
        this.c = puVar;
        this.d = puVar2;
        this.e = z2;
    }

    @Override // defpackage.r82
    public final v72 a(rc7 rc7Var, bc7 bc7Var, tn0 tn0Var) {
        return new qh4(rc7Var, tn0Var, this);
    }

    public final String toString() {
        return ev6.A(new StringBuilder("ShapeFill{color=, fillEnabled="), this.a, '}');
    }
}
