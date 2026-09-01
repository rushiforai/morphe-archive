package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p4c implements r82 {
    public final qu a;
    public final ArrayList b;
    public final pu c;
    public final pu d;
    public final qu e;
    public final n4c f;
    public final o4c g;
    public final float h;
    public final boolean i;

    public p4c(String str, qu quVar, ArrayList arrayList, pu puVar, pu puVar2, qu quVar2, n4c n4cVar, o4c o4cVar, float f, boolean z) {
        this.a = quVar;
        this.b = arrayList;
        this.c = puVar;
        this.d = puVar2;
        this.e = quVar2;
        this.f = n4cVar;
        this.g = o4cVar;
        this.h = f;
        this.i = z;
    }

    @Override // defpackage.r82
    public final v72 a(rc7 rc7Var, bc7 bc7Var, tn0 tn0Var) {
        return new vuc(rc7Var, tn0Var, this);
    }
}
