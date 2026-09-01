package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ps4 {
    public final String a;
    public final SourceParameter b;

    public ps4(String str, SourceParameter sourceParameter) {
        str.getClass();
        this.a = str;
        this.b = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ps4)) {
            return false;
        }
        ps4 ps4Var = (ps4) obj;
        return g76.L(this.a, ps4Var.a) && this.b.equals(ps4Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "EntityToFollow(id=" + this.a + ", sourceParameter=" + this.b + ")";
    }
}
