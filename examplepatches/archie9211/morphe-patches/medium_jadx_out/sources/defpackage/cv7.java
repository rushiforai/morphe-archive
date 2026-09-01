package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cv7 {
    public final String a;
    public final String b;
    public final SourceParameter c;

    public cv7(SourceParameter sourceParameter, String str, String str2) {
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
        if (!(obj instanceof cv7)) {
            return false;
        }
        cv7 cv7Var = (cv7) obj;
        return g76.L(this.a, cv7Var.a) && this.b.equals(cv7Var.b) && g76.L(this.c, cv7Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return y30.r(y30.u("MemberOnlyChipUiModel(postId=", this.a, ", authorId=", this.b, ", sourceParameter="), this.c, ")");
    }
}
