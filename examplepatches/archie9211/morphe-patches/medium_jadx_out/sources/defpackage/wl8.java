package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wl8 {
    public final vl8 a;
    public final boolean b;

    public wl8(vl8 vl8Var, boolean z) {
        vl8Var.getClass();
        this.a = vl8Var;
        this.b = z;
    }

    public static wl8 a(wl8 wl8Var, vl8 vl8Var, boolean z, int i) {
        if ((i & 1) != 0) {
            vl8Var = wl8Var.a;
        }
        if ((i & 2) != 0) {
            z = wl8Var.b;
        }
        wl8Var.getClass();
        vl8Var.getClass();
        return new wl8(vl8Var, z);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wl8)) {
            return false;
        }
        wl8 wl8Var = (wl8) obj;
        return this.a == wl8Var.a && this.b == wl8Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NullabilityQualifierWithMigrationStatus(qualifier=");
        sb.append(this.a);
        sb.append(", isForWarningOnly=");
        return ev6.A(sb, this.b, ')');
    }
}
