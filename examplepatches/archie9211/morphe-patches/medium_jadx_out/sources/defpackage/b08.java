package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b08 {
    public final String a;
    public final SourceParameter b;
    public final UpsellInfo c;

    public b08(String str, SourceParameter sourceParameter, UpsellInfo upsellInfo) {
        str.getClass();
        this.a = str;
        this.b = sourceParameter;
        this.c = upsellInfo;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b08)) {
            return false;
        }
        b08 b08Var = (b08) obj;
        return g76.L(this.a, b08Var.a) && this.b.equals(b08Var.b) && this.c.equals(b08Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ev6.o(this.b, this.a.hashCode() * 31, 31);
    }

    public final String toString() {
        return "MeterUiModel(postId=" + this.a + ", sourceParameter=" + this.b + ", upsellInfo=" + this.c + ")";
    }
}
