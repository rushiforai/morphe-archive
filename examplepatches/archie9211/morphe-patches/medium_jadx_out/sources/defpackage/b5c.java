package defpackage;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class b5c {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final sw5 f;
    public final Integer g;

    public b5c(String str, String str2, String str3, String str4, String str5, sw5 sw5Var, Integer num) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = str5;
        this.f = sw5Var;
        this.g = num;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b5c)) {
            return false;
        }
        b5c b5cVar = (b5c) obj;
        return g76.L(this.a, b5cVar.a) && g76.L(this.b, b5cVar.b) && this.c.equals(b5cVar.c) && g76.L(this.d, b5cVar.d) && g76.L(this.e, b5cVar.e) && g76.L(this.f, b5cVar.f) && g76.L(this.g, b5cVar.g);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iO = wgd.o((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.c);
        String str2 = this.d;
        int iHashCode2 = (iO + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.e;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        sw5 sw5Var = this.f;
        int iHashCode4 = (iHashCode3 + (sw5Var == null ? 0 : sw5Var.hashCode())) * 31;
        Integer num = this.g;
        return iHashCode4 + (num != null ? num.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("ShareCardUiModel(title=", this.a, ", subtitle=", this.b, ", url=");
        ka1.C(sbU, this.c, ", authorName=", this.d, ", authorAvatarId=");
        sbU.append(this.e);
        sbU.append(ZVsviyDAr.GlTIcqXedScHWSu);
        sbU.append(this.f);
        sbU.append(", minutesRead=");
        sbU.append(this.g);
        sbU.append(")");
        return sbU.toString();
    }
}
