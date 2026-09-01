package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oh8 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final SourceParameter e;
    public final UpsellInfo f;

    public oh8(String str, String str2, String str3, String str4, SourceParameter sourceParameter, UpsellInfo upsellInfo) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = sourceParameter;
        this.f = upsellInfo;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof oh8)) {
            return false;
        }
        oh8 oh8Var = (oh8) obj;
        return g76.L(this.a, oh8Var.a) && g76.L(this.b, oh8Var.b) && this.c.equals(oh8Var.c) && this.d.equals(oh8Var.d) && this.e.equals(oh8Var.e) && this.f.equals(oh8Var.f);
    }

    public final int hashCode() {
        return this.f.hashCode() + ev6.o(this.e, wgd.o(wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c), 31, this.d), 31);
    }

    public final String toString() {
        String strA = ax5.a(this.c);
        String strA2 = ax5.a(this.d);
        StringBuilder sbU = y30.u("NonMemberUpsellUiModel(actionUrl=", this.a, ", contentDescription=", this.b, ", largeImageId=");
        ka1.C(sbU, strA, ", smallImageId=", strA2, ", sourceParameter=");
        sbU.append(this.e);
        sbU.append(", upsellInfo=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}
