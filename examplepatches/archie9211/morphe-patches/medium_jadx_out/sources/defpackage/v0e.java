package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v0e implements t0e {
    public final String a;
    public final String b;
    public final SourceParameter c;

    public v0e(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = str2;
        this.c = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v0e)) {
            return false;
        }
        v0e v0eVar = (v0e) obj;
        return g76.L(this.a, v0eVar.a) && g76.L(this.b, v0eVar.b) && g76.L(this.c, v0eVar.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return this.c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        return y30.r(y30.u("UnfollowUserSuccess(userId=", this.a, ", userName=", this.b, ", sourceParameter="), this.c, ")");
    }
}
