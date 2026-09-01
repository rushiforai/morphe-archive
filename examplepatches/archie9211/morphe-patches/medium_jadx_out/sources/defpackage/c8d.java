package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c8d extends a8d {
    public final String g;
    public final SourceParameter h;

    public c8d(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.g = str;
        this.h = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c8d)) {
            return false;
        }
        c8d c8dVar = (c8d) obj;
        return g76.L(this.g, c8dVar.g) && g76.L(this.h, c8dVar.h);
    }

    public final int hashCode() {
        return this.h.hashCode() + (this.g.hashCode() * 31);
    }

    public final String toString() {
        return "UnfollowTagSuccess(tagId=" + this.g + ", sourceParameter=" + this.h + ")";
    }
}
