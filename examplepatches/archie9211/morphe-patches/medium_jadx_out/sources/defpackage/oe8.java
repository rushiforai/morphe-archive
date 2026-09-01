package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oe8 {
    public final boolean a;
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final boolean e;

    public oe8(boolean z, boolean z2, boolean z3, boolean z4, boolean z5) {
        this.a = z;
        this.b = z2;
        this.c = z3;
        this.d = z4;
        this.e = z5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof oe8)) {
            return false;
        }
        oe8 oe8Var = (oe8) obj;
        return this.a == oe8Var.a && this.b == oe8Var.b && this.c == oe8Var.c && this.d == oe8Var.d && this.e == oe8Var.e;
    }

    public final int hashCode() {
        return ((((((((this.a ? 1231 : 1237) * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NetworkState(isConnected=");
        sb.append(this.a);
        sb.append(", isValidated=");
        sb.append(this.b);
        sb.append(", isMetered=");
        sb.append(this.c);
        sb.append(", isNotRoaming=");
        sb.append(this.d);
        sb.append(", isBlocked=");
        return ev6.A(sb, this.e, ')');
    }
}
