package defpackage;

import gen.model.SourceParameter;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class eka implements fka {
    public final String a;
    public final String b;
    public final SourceParameter c;

    public eka(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        this.a = str;
        this.b = str2;
        this.c = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof eka)) {
            return false;
        }
        eka ekaVar = (eka) obj;
        return g76.L(this.a, ekaVar.a) && g76.L(this.b, ekaVar.b) && g76.L(this.c, ekaVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return y30.r(y30.u("UnsubscribedFromNewsletterSuccess(newsletterId=", this.a, ", publicationName=", this.b, dpBiLjNeNsiASg.wFwvRwEBY), this.c, ")");
    }
}
