package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zh4 implements mzb {
    public final mzb a;
    public final boolean b;
    public final x45 c;

    public zh4(mzb mzbVar, boolean z, x45 x45Var) {
        this.a = mzbVar;
        this.b = z;
        this.c = x45Var;
    }

    @Override // defpackage.mzb
    public final Iterator iterator() {
        return new yh4(this);
    }
}
