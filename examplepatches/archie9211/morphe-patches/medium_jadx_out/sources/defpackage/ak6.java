package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ak6 {
    public static final ak6 c = new ak6(null, null);
    public final bk6 a;
    public final qj6 b;

    public ak6(bk6 bk6Var, qj6 qj6Var) {
        String str;
        this.a = bk6Var;
        this.b = qj6Var;
        if ((bk6Var == null) == (qj6Var == null)) {
            return;
        }
        if (bk6Var == null) {
            str = "Star projection must have no type specified.";
        } else {
            str = "The projection variance " + bk6Var + " requires type to be specified.";
        }
        ywb.g(str);
        throw null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ak6)) {
            return false;
        }
        ak6 ak6Var = (ak6) obj;
        return this.a == ak6Var.a && g76.L(this.b, ak6Var.b);
    }

    public final int hashCode() {
        bk6 bk6Var = this.a;
        int iHashCode = (bk6Var == null ? 0 : bk6Var.hashCode()) * 31;
        qj6 qj6Var = this.b;
        return iHashCode + (qj6Var != null ? qj6Var.hashCode() : 0);
    }

    public final String toString() {
        bk6 bk6Var = this.a;
        int i = bk6Var == null ? -1 : zj6.a[bk6Var.ordinal()];
        if (i == -1) {
            return "*";
        }
        qj6 qj6Var = this.b;
        if (i == 1) {
            return String.valueOf(qj6Var);
        }
        if (i == 2) {
            return "in " + qj6Var;
        }
        if (i != 3) {
            ygf.a();
            return null;
        }
        return "out " + qj6Var;
    }
}
