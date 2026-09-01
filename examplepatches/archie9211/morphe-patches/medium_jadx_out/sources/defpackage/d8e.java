package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class d8e extends b8e {
    public final String a;
    public final SourceParameter b;

    public d8e(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d8e)) {
            return false;
        }
        d8e d8eVar = (d8e) obj;
        return g76.L(this.a, d8eVar.a) && g76.L(this.b, d8eVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "UnfollowUserSuccess(userId=" + this.a + ", sourceParameter=" + this.b + ")";
    }
}
