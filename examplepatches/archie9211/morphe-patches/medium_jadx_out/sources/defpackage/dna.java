package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dna implements ena {
    public final String a;
    public final String b;
    public final SourceParameter c;

    public dna(SourceParameter sourceParameter, String str, String str2) {
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
        if (!(obj instanceof dna)) {
            return false;
        }
        dna dnaVar = (dna) obj;
        return g76.L(this.a, dnaVar.a) && g76.L(this.b, dnaVar.b) && this.c.equals(dnaVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return y30.r(y30.u("UnsubscribedFromNewsletterSuccess(newsletterId=", this.a, ", publicationName=", this.b, ", sourceParameter="), this.c, ")");
    }
}
