package defpackage;

import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ftb {
    public final Object a;
    public final String b;
    public final String c;
    public final int d;

    public ftb(Object obj, String str, String str2, int i) {
        this.a = obj;
        this.b = str;
        this.c = str2;
        this.d = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ftb)) {
            return false;
        }
        ftb ftbVar = (ftb) obj;
        return g76.L(this.a, ftbVar.a) && g76.L(this.b, ftbVar.b) && g76.L(this.c, ftbVar.c) && this.d == ftbVar.d;
    }

    public final int hashCode() {
        Object obj = this.a;
        int iHashCode = (obj == null ? 0 : obj.hashCode()) * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        return ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31) + this.d;
    }

    public final String toString() {
        return "SearchData(uiModel=" + this.a + JWcjNoweKCnTr.iGLiP + this.b + ", algoliaObjectId=" + this.c + ", index=" + this.d + ")";
    }
}
