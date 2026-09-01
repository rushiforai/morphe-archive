package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mkb {
    public final long a = uu1.h;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mkb)) {
            return false;
        }
        long j = ((mkb) obj).a;
        int i = uu1.i;
        return ezd.a(this.a, j);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.a) * 31;
    }

    public final String toString() {
        return "RippleConfiguration(color=" + ((Object) uu1.h(this.a)) + ", rippleAlpha=null)";
    }
}
