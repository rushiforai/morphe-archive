package defpackage;

import com.medium.android.core.share.PostShareData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bu9 implements ou9 {
    public final PostShareData a;
    public final String b;
    public final String c;
    public final String d;

    public bu9(PostShareData postShareData, String str, String str2, String str3) {
        postShareData.getClass();
        str.getClass();
        str2.getClass();
        str3.getClass();
        this.a = postShareData;
        this.b = str;
        this.c = str2;
        this.d = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bu9)) {
            return false;
        }
        bu9 bu9Var = (bu9) obj;
        return g76.L(this.a, bu9Var.a) && g76.L(this.b, bu9Var.b) && g76.L(this.c, bu9Var.c) && g76.L(this.d, bu9Var.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SharePost(postShareData=");
        sb.append(this.a);
        sb.append(", source=");
        sb.append(this.b);
        sb.append(", referrerSource=");
        return km4.C(sb, this.c, ", location=", this.d, ")");
    }
}
