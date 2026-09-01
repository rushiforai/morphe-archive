package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wy3 {
    public final String a;

    public wy3(String str) {
        if (str != null) {
            this.a = str;
        } else {
            z72.c("name is null");
            throw null;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wy3)) {
            return false;
        }
        return this.a.equals(((wy3) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode() ^ 1000003;
    }

    public final String toString() {
        return ka1.v(new StringBuilder("Encoding{name=\""), this.a, "\"}");
    }
}
