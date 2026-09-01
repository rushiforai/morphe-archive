package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bka implements fka {
    public final String a;
    public final String b;
    public final b24 c;
    public final SourceParameter d;

    public bka(String str, String str2, b24 b24Var, SourceParameter sourceParameter) {
        ho2.O(sourceParameter, str, str2);
        this.a = str;
        this.b = str2;
        this.c = b24Var;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bka)) {
            return false;
        }
        bka bkaVar = (bka) obj;
        return g76.L(this.a, bkaVar.a) && g76.L(this.b, bkaVar.b) && this.c.equals(bkaVar.c) && g76.L(this.d, bkaVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("SubscribedToNewsletterFailure(newsletterId=", this.a, ", publicationName=", this.b, ", errorState=");
        sbU.append(this.c);
        sbU.append(", sourceParameter=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
