package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e8e implements g8e {
    public final String a;
    public final String b;
    public final String c;
    public final b24 d;
    public final SourceParameter e;

    public e8e(String str, String str2, String str3, b24 b24Var, SourceParameter sourceParameter) {
        ho2.P(sourceParameter, str, str2, str3);
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
        if (!(obj instanceof e8e)) {
            return false;
        }
        e8e e8eVar = (e8e) obj;
        return g76.L(this.a, e8eVar.a) && g76.L(this.b, e8eVar.b) && g76.L(this.c, e8eVar.c) && this.d.equals(e8eVar.d) && g76.L(this.e, e8eVar.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + ((this.d.hashCode() + wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("UnsubscribeFromNewsletterFailure(newsletterId=", this.a, ", userId=", this.b, ", userName=");
        sbU.append(this.c);
        sbU.append(", errorState=");
        sbU.append(this.d);
        sbU.append(", sourceParameter=");
        return y30.r(sbU, this.e, ")");
    }
}
