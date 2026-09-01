package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yb1 implements bc1 {
    public final r0e a;

    public yb1(r0e r0eVar) {
        r0eVar.getClass();
        this.a = r0eVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof yb1) && g76.L(this.a, ((yb1) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "UnfollowUnSubscribe(result=" + this.a + ")";
    }
}
