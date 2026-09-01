package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ym4 implements mzb {
    public final mzb a;
    public final x45 b;
    public final x45 c;

    public ym4(mzb mzbVar, x45 x45Var, x45 x45Var2) {
        x45Var.getClass();
        this.a = mzbVar;
        this.b = x45Var;
        this.c = x45Var2;
    }

    @Override // defpackage.mzb
    public final Iterator iterator() {
        return new yh4(this);
    }
}
