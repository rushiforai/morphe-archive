package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ny9 {
    public final String a;

    public ny9(String str) {
        str.getClass();
        this.a = str;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ny9)) {
            return false;
        }
        return g76.L(this.a, ((ny9) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return this.a;
    }
}
