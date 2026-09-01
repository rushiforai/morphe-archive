package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hn9 {
    public final boolean a;
    public final String b;

    public hn9(boolean z, String str) {
        this.a = z;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hn9)) {
            return false;
        }
        hn9 hn9Var = (hn9) obj;
        return this.a == hn9Var.a && g76.L(this.b, hn9Var.b);
    }

    public final int hashCode() {
        int i = (this.a ? 1231 : 1237) * 31;
        String str = this.b;
        return i + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "PostRepostState(isReposted=" + this.a + ", repostNote=" + this.b + ")";
    }
}
