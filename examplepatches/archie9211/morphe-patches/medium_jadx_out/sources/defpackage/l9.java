package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class l9 {
    public final String a;
    public final Integer b;
    public final String c;
    public final Integer d;
    public final boolean e;

    public l9(String str, Integer num, String str2, Integer num2, boolean z) {
        this.a = str;
        this.b = num;
        this.c = str2;
        this.d = num2;
        this.e = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l9)) {
            return false;
        }
        l9 l9Var = (l9) obj;
        return g76.L(this.a, l9Var.a) && g76.L(this.b, l9Var.b) && g76.L(this.c, l9Var.c) && g76.L(this.d, l9Var.d) && this.e == l9Var.e;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        Integer num = this.b;
        int iO = wgd.o((iHashCode + (num == null ? 0 : num.hashCode())) * 31, 31, this.c);
        Integer num2 = this.d;
        return ((iO + (num2 != null ? num2.hashCode() : 0)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Content(fullName=");
        sb.append(this.a);
        sb.append(", fullNameErrorResId=");
        sb.append(this.b);
        sb.append(", email=");
        sb.append(this.c);
        sb.append(", emailErrorResId=");
        sb.append(this.d);
        sb.append(", canSubmit=");
        return lv8.t(sb, this.e, ")");
    }
}
