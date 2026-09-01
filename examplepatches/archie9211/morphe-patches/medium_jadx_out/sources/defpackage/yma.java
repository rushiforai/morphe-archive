package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yma implements ena {
    public final String a;
    public final String b;
    public final SourceParameter c;

    public yma(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yma)) {
            return false;
        }
        yma ymaVar = (yma) obj;
        return g76.L(this.a, ymaVar.a) && g76.L(this.b, ymaVar.b) && this.c.equals(ymaVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return y30.r(y30.u("SubscribedToNewsletterSuccess(newsletterId=", this.a, ", publicationName=", this.b, ", sourceParameter="), this.c, ")");
    }
}
