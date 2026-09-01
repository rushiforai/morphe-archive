package defpackage;

import com.medium.proto.model.ParagraphPb;
import com.medium.proto.obv.post.DeltaType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s63 implements z63 {
    public final int a;
    public final ParagraphPb b;
    public final Boolean c;
    public final DeltaType d;

    public s63(int i, ParagraphPb paragraphPb, Boolean bool) {
        paragraphPb.getClass();
        this.a = i;
        this.b = paragraphPb;
        this.c = bool;
        this.d = DeltaType.UPDATE_PARAGRAPH_AT;
    }

    @Override // defpackage.z63
    public final DeltaType a() {
        return this.d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s63)) {
            return false;
        }
        s63 s63Var = (s63) obj;
        return this.a == s63Var.a && g76.L(this.b, s63Var.b) && g76.L(this.c, s63Var.c);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a * 31)) * 31;
        Boolean bool = this.c;
        return iHashCode + (bool == null ? 0 : bool.hashCode());
    }

    public final String toString() {
        return "UpdateParagraphAt(index=" + this.a + ", paragraphPb=" + this.b + ", verifySameName=" + this.c + ")";
    }
}
