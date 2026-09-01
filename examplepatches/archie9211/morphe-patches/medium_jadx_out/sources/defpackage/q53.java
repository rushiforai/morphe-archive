package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class q53 {
    public final String a;
    public final String b;
    public final SourceParameter c;

    public q53(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        this.a = str;
        this.b = str2;
        this.c = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q53)) {
            return false;
        }
        q53 q53Var = (q53) obj;
        return g76.L(this.a, q53Var.a) && g76.L(this.b, q53Var.b) && g76.L(this.c, q53Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return y30.r(y30.u("DeletePostConfirmationDialogState(postId=", this.a, ", postTitle=", this.b, ", sourceParameter="), this.c, ")");
    }
}
