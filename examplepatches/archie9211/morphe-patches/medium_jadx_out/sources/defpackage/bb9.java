package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bb9 {
    public final pa9 a;

    public bb9(boolean z) {
        this(new pa9(z));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof bb9) {
            return g76.L(this.a, ((bb9) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        pa9 pa9Var = this.a;
        if (pa9Var != null) {
            return pa9Var.hashCode();
        }
        return 0;
    }

    public final String toString() {
        return "PlatformTextStyle(spanStyle=null, paragraphSyle=" + this.a + ')';
    }

    public bb9(pa9 pa9Var) {
        this.a = pa9Var;
    }
}
