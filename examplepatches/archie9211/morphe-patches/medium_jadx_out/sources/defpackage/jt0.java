package defpackage;

import com.medium.android.data.notification.YMl.DtuT;
import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class jt0 {
    public final String a;
    public final String b;
    public final List c;
    public final String d;
    public final String e;
    public final Long f;
    public final List g;
    public final SourceParameter h;

    public jt0(String str, String str2, List list, String str3, String str4, Long l, List list2, SourceParameter sourceParameter) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        list2.getClass();
        this.a = str;
        this.b = str2;
        this.c = list;
        this.d = str3;
        this.e = str4;
        this.f = l;
        this.g = list2;
        this.h = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jt0)) {
            return false;
        }
        jt0 jt0Var = (jt0) obj;
        return g76.L(this.a, jt0Var.a) && g76.L(this.b, jt0Var.b) && this.c.equals(jt0Var.c) && g76.L(this.d, jt0Var.d) && g76.L(this.e, jt0Var.e) && g76.L(this.f, jt0Var.f) && g76.L(this.g, jt0Var.g) && this.h.equals(jt0Var.h);
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.p(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c), 31, this.d);
        String str = this.e;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        Long l = this.f;
        return this.h.hashCode() + wgd.p((iHashCode + (l != null ? l.hashCode() : 0)) * 31, 31, this.g);
    }

    public final String toString() {
        String strA = ax5.a(this.d);
        StringBuilder sbU = y30.u("BookUiModel(authorId=", this.a, ", title=", this.b, ", authorNames=");
        sbU.append(this.c);
        sbU.append(DtuT.OIDiZ);
        sbU.append(strA);
        sbU.append(", link=");
        sbU.append(this.e);
        sbU.append(", publicationDate=");
        sbU.append(this.f);
        sbU.append(", isbns=");
        sbU.append(this.g);
        sbU.append(", sourceParameter=");
        sbU.append(this.h);
        sbU.append(")");
        return sbU.toString();
    }
}
