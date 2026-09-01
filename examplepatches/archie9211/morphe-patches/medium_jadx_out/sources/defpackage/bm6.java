package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bm6 extends gsa {
    public final String n;

    public bm6(String str) {
        str.getClass();
        this.n = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof bm6) && g76.L(this.n, ((bm6) obj).n);
    }

    public final int hashCode() {
        return this.n.hashCode();
    }

    public final String toString() {
        return ev6.z(new StringBuilder("TypeAlias(name="), this.n, ')');
    }
}
