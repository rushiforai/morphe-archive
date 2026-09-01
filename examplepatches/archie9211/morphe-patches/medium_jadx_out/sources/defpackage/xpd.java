package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xpd {
    public final String a;
    public final String b;
    public final boolean c;
    public final SourceParameter d;

    public xpd(SourceParameter sourceParameter, String str, String str2, boolean z) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = z;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xpd)) {
            return false;
        }
        xpd xpdVar = (xpd) obj;
        return g76.L(this.a, xpdVar.a) && this.b.equals(xpdVar.b) && this.c == xpdVar.c && this.d.equals(xpdVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((wgd.o(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("TopicUiModel(slug=", this.a, ", name=", this.b, ", isFollowing=");
        sbU.append(this.c);
        sbU.append(", sourceParameter=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
