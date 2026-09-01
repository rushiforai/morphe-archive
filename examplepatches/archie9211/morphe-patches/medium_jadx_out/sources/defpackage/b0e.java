package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b0e implements a0e {
    public final String a;
    public final SourceParameter b;
    public final Throwable c;

    public b0e(SourceParameter sourceParameter, String str, Throwable th) {
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
        if (!(obj instanceof b0e)) {
            return false;
        }
        b0e b0eVar = (b0e) obj;
        return g76.L(this.a, b0eVar.a) && g76.L(this.b, b0eVar.b) && this.c.equals(b0eVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ev6.o(this.b, this.a.hashCode() * 31, 31);
    }

    public final String toString() {
        return "UndoShowLessLikeThisFailure(postId=" + this.a + ", sourceParameter=" + this.b + ", exception=" + this.c + ")";
    }
}
