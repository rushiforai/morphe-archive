package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tie implements hje {
    public final String a;
    public final String b;
    public final String c;
    public final SourceParameter d;

    public tie(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tie)) {
            return false;
        }
        tie tieVar = (tie) obj;
        return g76.L(this.a, tieVar.a) && g76.L(this.b, tieVar.b) && g76.L(this.c, tieVar.c) && g76.L(this.d, tieVar.d);
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        return this.d.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("GoToSubscribeToNewsletterConsentScreen(userId=", this.a, ", userName=", this.b, ", newsletterId=");
        sbU.append(this.c);
        sbU.append(", sourceParameter=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
