package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cfc {
    public static final cfc c;
    public final xe3 a;
    public final xe3 b;

    static {
        ve3 ve3Var = ve3.a;
        c = new cfc(ve3Var, ve3Var);
    }

    public cfc(xe3 xe3Var, xe3 xe3Var2) {
        this.a = xe3Var;
        this.b = xe3Var2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cfc)) {
            return false;
        }
        cfc cfcVar = (cfc) obj;
        return this.a.equals(cfcVar.a) && this.b.equals(cfcVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Size(width=" + this.a + ", height=" + this.b + ')';
    }
}
