package defpackage;

import com.medium.android.core.share.PostShareData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mk5 implements pk5 {
    public final PostShareData a;
    public final String b;
    public final String c;
    public final String d;

    public mk5(PostShareData postShareData, String str, String str2, String str3) {
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
        if (!(obj instanceof mk5)) {
            return false;
        }
        mk5 mk5Var = (mk5) obj;
        return this.a.equals(mk5Var.a) && this.b.equals(mk5Var.b) && g76.L(this.c, mk5Var.c) && g76.L(this.d, mk5Var.d);
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
