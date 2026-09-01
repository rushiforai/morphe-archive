package defpackage;

import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class la1 {
    public final String a;
    public final xpc b;
    public final bo4 c;
    public final bo4 d;

    public la1(String str, xpc xpcVar, bo4 bo4Var, bo4 bo4Var2) {
        this.a = str;
        this.b = xpcVar;
        this.c = bo4Var;
        this.d = bo4Var2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof la1) {
            la1 la1Var = (la1) obj;
            if (this.a.equals(la1Var.a) && this.b == la1Var.b && this.c.equals(la1Var.c) && this.d.equals(la1Var.d)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.d.hashCode() + ka1.a(this.c, (this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31);
    }

    public final String toString() {
        return AEVqIoD.WpyjoJdGifoMzgi + this.a + ", creatorNameStream=" + this.b + ", followStateStream=" + this.c + ", followSubscribeUiModelStream=" + this.d + ")";
    }
}
