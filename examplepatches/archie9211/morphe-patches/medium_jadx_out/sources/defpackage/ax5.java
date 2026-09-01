package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ax5 {
    public final String a;

    public /* synthetic */ ax5(String str) {
        this.a = str;
    }

    public static String a(String str) {
        return ev6.x("ImageId(value=", str, ")");
    }

    public final boolean equals(Object obj) {
        if (obj instanceof ax5) {
            return g76.L(this.a, ((ax5) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return a(this.a);
    }
}
