package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class am6 extends gsa {
    public final String n;

    public am6(String str) {
        str.getClass();
        this.n = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof am6) && g76.L(this.n, ((am6) obj).n);
    }

    public final int hashCode() {
        return this.n.hashCode();
    }

    public final String toString() {
        return ev6.z(new StringBuilder("Class(name="), this.n, ')');
    }
}
