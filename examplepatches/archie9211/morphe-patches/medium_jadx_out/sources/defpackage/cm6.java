package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cm6 extends gsa {
    public final int n;

    public cm6(int i) {
        this.n = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof cm6) && this.n == ((cm6) obj).n;
    }

    public final int hashCode() {
        return this.n;
    }

    public final String toString() {
        return km4.A(new StringBuilder("TypeParameter(id="), this.n, ')');
    }
}
