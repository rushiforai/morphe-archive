package defpackage;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ab4 implements fb4 {
    public final pq9 a;
    public final rq9 b;
    public final String c;
    public final int d;
    public final String e;
    public final boolean f;
    public final SourceParameter g;

    public ab4(pq9 pq9Var, rq9 rq9Var, String str, int i, String str2, boolean z, SourceParameter sourceParameter) {
        str2.getClass();
        sourceParameter.getClass();
        this.a = pq9Var;
        this.b = rq9Var;
        this.c = str;
        this.d = i;
        this.e = str2;
        this.f = z;
        this.g = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ab4)) {
            return false;
        }
        ab4 ab4Var = (ab4) obj;
        return this.a.equals(ab4Var.a) && this.b.equals(ab4Var.b) && this.c.equals(ab4Var.c) && this.d == ab4Var.d && g76.L(this.e, ab4Var.e) && this.f == ab4Var.f && g76.L(this.g, ab4Var.g);
    }

    public final int hashCode() {
        return this.g.hashCode() + ((wgd.o((wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c) + this.d) * 31, 31, this.e) + (this.f ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CanFeaturePost(author=");
        sb.append(this.a);
        sb.append(", collection=");
        sb.append(this.b);
        sb.append(", postTitle=");
        sb.append(this.c);
        sb.append(", availableFeaturingToken=");
        sb.append(this.d);
        sb.append(", publicationId=");
        ka1.D(sb, this.e, ", areActionsEnabled=", this.f, HrUBqHumRuLe.gHTzugIwHWel);
        return y30.r(sb, this.g, ")");
    }
}
