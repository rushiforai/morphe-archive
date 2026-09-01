package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a8e implements g8e {
    public final String a;
    public final String b;
    public final String c;
    public final SourceParameter d;

    public a8e(SourceParameter sourceParameter, String str, String str2, String str3) {
        str2.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a8e)) {
            return false;
        }
        a8e a8eVar = (a8e) obj;
        return g76.L(this.a, a8eVar.a) && g76.L(this.b, a8eVar.b) && this.c.equals(a8eVar.c) && g76.L(this.d, a8eVar.d);
    }

    public final int hashCode() {
        String str = this.a;
        return this.d.hashCode() + wgd.o(wgd.o((str == null ? 0 : str.hashCode()) * 31, 31, this.b), 31, this.c);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("UnfollowAndUnsubscribeSuccess(newsletterId=", this.a, ", userId=", this.b, ", userName=");
        sbU.append(this.c);
        sbU.append(", sourceParameter=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
