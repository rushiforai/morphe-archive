package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o2a implements q2a {
    public final int a;
    public final String b;

    public o2a(int i, String str) {
        this.a = i;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o2a)) {
            return false;
        }
        o2a o2aVar = (o2a) obj;
        return this.a == o2aVar.a && g76.L(this.b, o2aVar.b);
    }

    public final int hashCode() {
        int i = this.a * 31;
        String str = this.b;
        return i + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "Error(responseCode=" + this.a + ", debugMessage=" + this.b + ")";
    }
}
