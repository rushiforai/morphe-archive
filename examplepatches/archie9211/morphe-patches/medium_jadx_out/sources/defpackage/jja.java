package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jja implements mja {
    public final String a;
    public final SourceParameter b;

    public jja(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jja)) {
            return false;
        }
        jja jjaVar = (jja) obj;
        return g76.L(this.a, jjaVar.a) && g76.L(this.b, jjaVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Empty(publicationName=" + this.a + ", sourceParameter=" + this.b + ")";
    }
}
