package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oq9 {
    public final boolean a;
    public final boolean b;
    public final boolean c;
    public final bo4 d;
    public final boolean e;

    public oq9(boolean z, boolean z2, boolean z3, bo4 bo4Var, boolean z4) {
        this.a = z;
        this.b = z2;
        this.c = z3;
        this.d = bo4Var;
        this.e = z4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof oq9)) {
            return false;
        }
        oq9 oq9Var = (oq9) obj;
        return this.a == oq9Var.a && this.b == oq9Var.b && this.c == oq9Var.c && this.d.equals(oq9Var.d) && this.e == oq9Var.e;
    }

    public final int hashCode() {
        return ka1.a(this.d, (((((this.a ? 1231 : 1237) * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31, 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Actions(showShowLessLikeThisAction=");
        sb.append(this.a);
        sb.append(", showRemoveFromReadingHistoryAction=");
        sb.append(this.b);
        sb.append(", showBookmarkAction=");
        sb.append(this.c);
        sb.append(", isPostBookmarkedStream=");
        sb.append(this.d);
        sb.append(", showShareAction=");
        return lv8.t(sb, this.e, ")");
    }
}
