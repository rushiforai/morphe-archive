package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class v7e implements g8e {
    public final String a;
    public final String b;
    public final String c;
    public final SourceParameter d;

    public v7e(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v7e)) {
            return false;
        }
        v7e v7eVar = (v7e) obj;
        return g76.L(this.a, v7eVar.a) && g76.L(this.b, v7eVar.b) && g76.L(this.c, v7eVar.c) && g76.L(this.d, v7eVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("SubscribeToNewsletterSuccess(newsletterId=", this.a, ", userId=", this.b, ", userName=");
        sbU.append(this.c);
        sbU.append(", sourceParameter=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
