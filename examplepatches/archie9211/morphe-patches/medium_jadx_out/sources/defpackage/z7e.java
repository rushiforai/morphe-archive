package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z7e implements g8e {
    public final String a;
    public final String b;
    public final SourceParameter c;
    public final Throwable d;

    public z7e(String str, String str2, SourceParameter sourceParameter, Throwable th) {
        str2.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = str2;
        this.c = sourceParameter;
        this.d = th;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z7e)) {
            return false;
        }
        z7e z7eVar = (z7e) obj;
        return g76.L(this.a, z7eVar.a) && g76.L(this.b, z7eVar.b) && g76.L(this.c, z7eVar.c) && this.d.equals(z7eVar.d);
    }

    public final int hashCode() {
        String str = this.a;
        return this.d.hashCode() + ev6.o(this.c, wgd.o((str == null ? 0 : str.hashCode()) * 31, 31, this.b), 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("UnfollowAndUnsubscribeFailure(newsletterId=", this.a, ", userId=", this.b, ", sourceParameter=");
        sbU.append(this.c);
        sbU.append(", exception=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
