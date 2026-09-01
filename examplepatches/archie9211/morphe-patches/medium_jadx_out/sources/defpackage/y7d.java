package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y7d extends x7d {
    public final String g;
    public final Throwable h;
    public final SourceParameter i;

    public y7d(SourceParameter sourceParameter, String str, Throwable th) {
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
        if (!(obj instanceof y7d)) {
            return false;
        }
        y7d y7dVar = (y7d) obj;
        return g76.L(this.g, y7dVar.g) && this.h.equals(y7dVar.h) && g76.L(this.i, y7dVar.i);
    }

    public final int hashCode() {
        return this.i.hashCode() + ((this.h.hashCode() + (this.g.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("FollowTagFailure(tagId=");
        sb.append(this.g);
        sb.append(", exception=");
        sb.append(this.h);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.i, ")");
    }
}
