package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qu9 implements tu9 {
    public final b24 a;
    public final iv0 b;

    public qu9(b24 b24Var, iv0 iv0Var) {
        this.a = b24Var;
        this.b = iv0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qu9)) {
            return false;
        }
        qu9 qu9Var = (qu9) obj;
        return this.a.equals(qu9Var.a) && this.b.equals(qu9Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Error(errorState=" + this.a + ", bottomActionBarUiModel=" + this.b + ")";
    }
}
