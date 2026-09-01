package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gw2 {
    public final ew5 a;
    public final boolean b;

    public gw2(ew5 ew5Var, boolean z) {
        this.a = ew5Var;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gw2)) {
            return false;
        }
        gw2 gw2Var = (gw2) obj;
        return this.a.equals(gw2Var.a) && this.b == gw2Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("DecodeResult(image=");
        sb.append(this.a);
        sb.append(", isSampled=");
        return ev6.A(sb, this.b, ')');
    }
}
