package defpackage;

import com.medium.android.core.share.PostShareData;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sb4 {
    public final String a;
    public final String b;
    public final boolean c;
    public final String d;
    public final String e;
    public final long f;
    public final PostShareData g;
    public final String h;
    public final String i;
    public final SourceParameter j;

    public sb4(String str, String str2, boolean z, String str3, String str4, long j, PostShareData postShareData, String str5, String str6, SourceParameter sourceParameter) {
        ho2.Q(str, str3, str5, str6);
        this.a = str;
        this.b = str2;
        this.c = z;
        this.d = str3;
        this.e = str4;
        this.f = j;
        this.g = postShareData;
        this.h = str5;
        this.i = str6;
        this.j = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sb4)) {
            return false;
        }
        sb4 sb4Var = (sb4) obj;
        return g76.L(this.a, sb4Var.a) && g76.L(this.b, sb4Var.b) && this.c == sb4Var.c && g76.L(this.d, sb4Var.d) && g76.L(this.e, sb4Var.e) && this.f == sb4Var.f && g76.L(this.g, sb4Var.g) && g76.L(this.h, sb4Var.h) && g76.L(this.i, sb4Var.i) && this.j.equals(sb4Var.j);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iO = wgd.o((((iHashCode + (str == null ? 0 : str.hashCode())) * 31) + (this.c ? 1231 : 1237)) * 31, 31, this.d);
        String str2 = this.e;
        int iHashCode2 = str2 == null ? 0 : str2.hashCode();
        long j = this.f;
        int i = (((iO + iHashCode2) * 31) + ((int) (j ^ (j >>> 32)))) * 31;
        PostShareData postShareData = this.g;
        return this.j.hashCode() + wgd.o(wgd.o((i + (postShareData != null ? postShareData.hashCode() : 0)) * 31, 31, this.h), 31, this.i);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("FeaturedPostUiModel(postId=", this.a, ", postTitle=", this.b, ", isPostLocked=");
        sbU.append(this.c);
        sbU.append(", editorId=");
        sbU.append(this.d);
        sbU.append(", editorName=");
        sbU.append(this.e);
        sbU.append(", featuredDate=");
        sbU.append(this.f);
        sbU.append(", postShareData=");
        sbU.append(this.g);
        sbU.append(", referrerSource=");
        sbU.append(this.h);
        sbU.append(", location=");
        sbU.append(this.i);
        sbU.append(", sourceParameter=");
        sbU.append(this.j);
        sbU.append(")");
        return sbU.toString();
    }
}
