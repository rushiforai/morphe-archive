package defpackage;

import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class u7e implements g8e {
    public final String a;
    public final String b;
    public final String c;
    public final b24 d;
    public final SourceParameter e;

    public u7e(String str, String str2, String str3, b24 b24Var, SourceParameter sourceParameter) {
        ho2.O(sourceParameter, str2, str3);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = b24Var;
        this.e = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u7e)) {
            return false;
        }
        u7e u7eVar = (u7e) obj;
        return g76.L(this.a, u7eVar.a) && g76.L(this.b, u7eVar.b) && g76.L(this.c, u7eVar.c) && this.d.equals(u7eVar.d) && g76.L(this.e, u7eVar.e);
    }

    public final int hashCode() {
        String str = this.a;
        return this.e.hashCode() + ((this.d.hashCode() + wgd.o(wgd.o((str == null ? 0 : str.hashCode()) * 31, 31, this.b), 31, this.c)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("SubscribeToNewsletterFailure(newsletterId=", this.a, ", userId=", this.b, ", userName=");
        sbU.append(this.c);
        sbU.append(", errorState=");
        sbU.append(this.d);
        sbU.append(", sourceParameter=");
        return y30.r(sbU, this.e, ziYqbdHrAXvj.qPpoh);
    }
}
