package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ys4 implements xs4 {
    public final String a;
    public final SourceParameter b;
    public final Throwable c;

    public ys4(SourceParameter sourceParameter, String str, Throwable th) {
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
        if (!(obj instanceof ys4)) {
            return false;
        }
        ys4 ys4Var = (ys4) obj;
        return g76.L(this.a, ys4Var.a) && g76.L(this.b, ys4Var.b) && this.c.equals(ys4Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ev6.o(this.b, this.a.hashCode() * 31, 31);
    }

    public final String toString() {
        return "FollowCollectionFailure(collectionId=" + this.a + ", sourceParameter=" + this.b + ", exception=" + this.c + ")";
    }
}
