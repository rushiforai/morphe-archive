package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lf extends nf {
    public final b24 a;
    public final int b;

    public lf(int i, b24 b24Var) {
        this.a = b24Var;
        this.b = i;
    }

    @Override // defpackage.nf
    public final int a() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lf)) {
            return false;
        }
        lf lfVar = (lf) obj;
        return this.a.equals(lfVar.a) && this.b == lfVar.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() {
        return "Error(errorState=" + this.a + ", total=" + this.b + ")";
    }
}
