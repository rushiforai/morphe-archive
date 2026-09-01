package defpackage;

import android.graphics.Path;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class te5 implements r82 {
    public final ze5 a;
    public final Path.FillType b;
    public final pu c;
    public final pu d;
    public final pu e;
    public final pu f;
    public final boolean g;

    public te5(String str, ze5 ze5Var, Path.FillType fillType, pu puVar, pu puVar2, pu puVar3, pu puVar4, boolean z) {
        this.a = ze5Var;
        this.b = fillType;
        this.c = puVar;
        this.d = puVar2;
        this.e = puVar3;
        this.f = puVar4;
        this.g = z;
    }

    @Override // defpackage.r82
    public final v72 a(rc7 rc7Var, bc7 bc7Var, tn0 tn0Var) {
        return new ue5(rc7Var, bc7Var, tn0Var, this);
    }
}
