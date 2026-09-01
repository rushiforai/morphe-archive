package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l7e implements n7e {
    public final String a;
    public final String b;
    public final SourceParameter c;
    public final Throwable d;

    public l7e(String str, String str2, SourceParameter sourceParameter, Throwable th) {
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
        if (!(obj instanceof l7e)) {
            return false;
        }
        l7e l7eVar = (l7e) obj;
        return g76.L(this.a, l7eVar.a) && g76.L(this.b, l7eVar.b) && g76.L(this.c, l7eVar.c) && this.d.equals(l7eVar.d);
    }

    public final int hashCode() {
        String str = this.a;
        return this.d.hashCode() + ev6.o(this.c, wgd.o((str == null ? 0 : str.hashCode()) * 31, 31, this.b), 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("FollowAndSubscribeFailure(newsletterId=", this.a, ", userId=", this.b, ", sourceParameter=");
        sbU.append(this.c);
        sbU.append(", exception=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
