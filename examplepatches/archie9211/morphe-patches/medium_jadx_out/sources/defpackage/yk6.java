package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yk6 {
    public final Float a;
    public yn3 b;

    public yk6(Float f, yn3 yn3Var) {
        this.a = f;
        this.b = yn3Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof yk6)) {
            return false;
        }
        yk6 yk6Var = (yk6) obj;
        return yk6Var.a.equals(this.a) && g76.L(yk6Var.b, this.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 961);
    }
}
