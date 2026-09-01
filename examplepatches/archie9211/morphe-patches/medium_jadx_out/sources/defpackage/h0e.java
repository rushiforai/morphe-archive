package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h0e implements g0e {
    public final String a;
    public final String b;
    public final SourceParameter c;
    public final Throwable d;

    public h0e(String str, String str2, SourceParameter sourceParameter, Throwable th) {
        ho2.O(sourceParameter, str, str2);
        this.a = str;
        this.b = str2;
        this.c = sourceParameter;
        this.d = th;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h0e)) {
            return false;
        }
        h0e h0eVar = (h0e) obj;
        return g76.L(this.a, h0eVar.a) && g76.L(this.b, h0eVar.b) && g76.L(this.c, h0eVar.c) && this.d.equals(h0eVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ev6.o(this.c, wgd.o(this.a.hashCode() * 31, 31, this.b), 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("UnfollowAuthorAndUnsubscribeFailure(newsletterId=", this.a, ", userId=", this.b, ", sourceParameter=");
        sbU.append(this.c);
        sbU.append(", exception=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
