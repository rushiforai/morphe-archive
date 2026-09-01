package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u0e implements t0e {
    public final String a;
    public final SourceParameter b;
    public final Throwable c;

    public u0e(SourceParameter sourceParameter, String str, Throwable th) {
        str.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = sourceParameter;
        this.c = th;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u0e)) {
            return false;
        }
        u0e u0eVar = (u0e) obj;
        return g76.L(this.a, u0eVar.a) && g76.L(this.b, u0eVar.b) && this.c.equals(u0eVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ev6.o(this.b, this.a.hashCode() * 31, 31);
    }

    public final String toString() {
        return "UnfollowUserFailure(userId=" + this.a + ", sourceParameter=" + this.b + ", exception=" + this.c + ")";
    }
}
