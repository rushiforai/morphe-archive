package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class if6 extends n01 {
    public final String r;
    public final String s;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public if6(String str, String str2) {
        super(27);
        str.getClass();
        str2.getClass();
        this.r = str;
        this.s = str2;
    }

    @Override // defpackage.n01
    public final String S() {
        return this.r + ':' + this.s;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof if6)) {
            return false;
        }
        if6 if6Var = (if6) obj;
        return g76.L(this.r, if6Var.r) && g76.L(this.s, if6Var.s);
    }

    public final int hashCode() {
        return this.s.hashCode() + (this.r.hashCode() * 31);
    }
}
