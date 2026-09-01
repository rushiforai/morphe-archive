package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pw1 implements tw1 {
    public final int a;
    public final String b;

    public pw1(int i, String str) {
        this.a = i;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pw1)) {
            return false;
        }
        pw1 pw1Var = (pw1) obj;
        return this.a == pw1Var.a && this.b.equals(pw1Var.b);
    }

    @Override // defpackage.tw1
    public final String getParagraphName() {
        return this.b;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a * 31);
    }

    public final String toString() {
        return "Converted(graphIndex=" + this.a + ", paragraphName=" + this.b + ")";
    }
}
