package tx;

import b.u4;

/* loaded from: classes4.dex */
public final class h2 {

    /* renamed from: a, reason: collision with root package name */
    public final String f89774a;

    /* renamed from: b, reason: collision with root package name */
    public final String f89775b;

    /* renamed from: c, reason: collision with root package name */
    public final int f89776c;

    /* renamed from: d, reason: collision with root package name */
    public final int f89777d;

    public h2(String str, String str2, int i5, int i11) {
        this.f89774a = str;
        this.f89775b = str2;
        this.f89776c = i5;
        this.f89777d = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h2)) {
            return false;
        }
        h2 h2Var = (h2) obj;
        return this.f89774a.equals(h2Var.f89774a) && this.f89775b.equals(h2Var.f89775b) && this.f89776c == h2Var.f89776c && this.f89777d == h2Var.f89777d;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f89777d) + u4.a(this.f89776c, b.c0.e(this.f89774a.hashCode() * 31, 31, this.f89775b), 31);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("PermissionInfo(permission=", this.f89774a, ", emoji=", this.f89775b, ", titleRes=");
        sbW.append(this.f89776c);
        sbW.append(", descriptionRes=");
        sbW.append(this.f89777d);
        sbW.append(")");
        return sbW.toString();
    }
}
