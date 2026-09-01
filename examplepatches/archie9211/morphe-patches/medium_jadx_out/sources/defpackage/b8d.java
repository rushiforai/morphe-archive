package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b8d extends a8d {
    public final String g;
    public final Throwable h;
    public final SourceParameter i;

    public b8d(SourceParameter sourceParameter, String str, Throwable th) {
        str.getClass();
        sourceParameter.getClass();
        this.g = str;
        this.h = th;
        this.i = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b8d)) {
            return false;
        }
        b8d b8dVar = (b8d) obj;
        return g76.L(this.g, b8dVar.g) && this.h.equals(b8dVar.h) && g76.L(this.i, b8dVar.i);
    }

    public final int hashCode() {
        return this.i.hashCode() + ((this.h.hashCode() + (this.g.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("UnfollowTagFailure(tagId=");
        sb.append(this.g);
        sb.append(", exception=");
        sb.append(this.h);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.i, ")");
    }
}
