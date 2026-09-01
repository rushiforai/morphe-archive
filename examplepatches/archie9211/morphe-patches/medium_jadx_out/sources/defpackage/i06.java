package defpackage;

import com.medium.android.domain.post.models.Highlight;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class i06 {
    public final String a;
    public final String b;
    public final String c;
    public final long d;
    public final long e;
    public final Highlight f;

    public i06(String str, String str2, String str3, long j, long j2, Highlight highlight) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = j;
        this.e = j2;
        this.f = highlight;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i06)) {
            return false;
        }
        i06 i06Var = (i06) obj;
        return g76.L(this.a, i06Var.a) && this.b.equals(i06Var.b) && this.c.equals(i06Var.c) && this.d == i06Var.d && this.e == i06Var.e && g76.L(this.f, i06Var.f);
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c);
        long j = this.d;
        int i = (iO + ((int) (j ^ (j >>> 32)))) * 31;
        long j2 = this.e;
        int i2 = (i + ((int) (j2 ^ (j2 >>> 32)))) * 31;
        Highlight highlight = this.f;
        return i2 + (highlight == null ? 0 : highlight.hashCode());
    }

    public final String toString() {
        StringBuilder sbU = y30.u("InResponseToPostUiModel(postId=", this.a, ", postTitle=", this.b, ", authorName=");
        sbU.append(this.c);
        sbU.append(", totalClapCount=");
        sbU.append(this.d);
        wgd.y(sbU, ", responsesCount=", this.e, ", highlight=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}
