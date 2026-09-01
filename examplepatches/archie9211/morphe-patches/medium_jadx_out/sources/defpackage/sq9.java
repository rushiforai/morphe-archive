package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sq9 {
    public final bo4 a;
    public final bo4 b;
    public final bo4 c;
    public final bo4 d;
    public final bo4 e;
    public final bo4 f;
    public final boolean g;
    public final boolean h;
    public final boolean i;
    public final boolean j;
    public final boolean k;
    public final boolean l;
    public final boolean m;
    public final boolean n;
    public final vq9 o;
    public final boolean p;

    public sq9(bo4 bo4Var, bo4 bo4Var2, bo4 bo4Var3, bo4 bo4Var4, bo4 bo4Var5, bo4 bo4Var6, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, boolean z7, boolean z8, vq9 vq9Var, boolean z9) {
        this.a = bo4Var;
        this.b = bo4Var2;
        this.c = bo4Var3;
        this.d = bo4Var4;
        this.e = bo4Var5;
        this.f = bo4Var6;
        this.g = z;
        this.h = z2;
        this.i = z3;
        this.j = z4;
        this.k = z5;
        this.l = z6;
        this.m = z7;
        this.n = z8;
        this.o = vq9Var;
        this.p = z9;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sq9)) {
            return false;
        }
        sq9 sq9Var = (sq9) obj;
        return this.a.equals(sq9Var.a) && this.b.equals(sq9Var.b) && this.c.equals(sq9Var.c) && this.d.equals(sq9Var.d) && this.e.equals(sq9Var.e) && this.f.equals(sq9Var.f) && this.g == sq9Var.g && this.h == sq9Var.h && this.i == sq9Var.i && this.j == sq9Var.j && this.k == sq9Var.k && this.l == sq9Var.l && this.m == sq9Var.m && this.n == sq9Var.n && g76.L(this.o, sq9Var.o) && this.p == sq9Var.p;
    }

    public final int hashCode() {
        int iA = (((((((((((((((ka1.a(this.f, ka1.a(this.e, ka1.a(this.d, ka1.a(this.c, ka1.a(this.b, this.a.hashCode() * 31, 31), 31), 31), 31), 31) + (this.g ? 1231 : 1237)) * 31) + (this.h ? 1231 : 1237)) * 31) + (this.i ? 1231 : 1237)) * 31) + (this.j ? 1231 : 1237)) * 31) + (this.k ? 1231 : 1237)) * 31) + (this.l ? 1231 : 1237)) * 31) + (this.m ? 1231 : 1237)) * 31) + (this.n ? 1231 : 1237)) * 31;
        vq9 vq9Var = this.o;
        return ((iA + (vq9Var == null ? 0 : vq9Var.hashCode())) * 31) + (this.p ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("MenuOptions(isPostBookmarkedStream=");
        sb.append(this.a);
        sb.append(", postFeaturingStateStream=");
        sb.append(this.b);
        sb.append(", authorFollowStateStream=");
        sb.append(this.c);
        sb.append(", collectionFollowStateStream=");
        sb.append(this.d);
        sb.append(", authorMuteStateStream=");
        sb.append(this.e);
        sb.append(", collectionMuteStateStream=");
        sb.append(this.f);
        sb.append(", canBeReported=");
        ho2.R(sb, this.g, ", canViewStats=", this.h, ", canBeEdited=");
        ho2.R(sb, this.i, ", canViewPost=", this.j, ", canBeDeleted=");
        ho2.R(sb, this.k, ", canBookmark=", this.l, ", canBeShared=");
        ho2.R(sb, this.m, ", showRemoveItemFromCatalog=", this.n, ", noteState=");
        sb.append(this.o);
        sb.append(", showShowLessLikeThis=");
        sb.append(this.p);
        sb.append(")");
        return sb.toString();
    }
}
