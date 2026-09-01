package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class eb4 implements fb4 {
    public final pq9 a;
    public final rq9 b;
    public final String c;
    public final String d;
    public final boolean e;
    public final SourceParameter f;

    public eb4(pq9 pq9Var, rq9 rq9Var, String str, String str2, boolean z, SourceParameter sourceParameter) {
        str2.getClass();
        sourceParameter.getClass();
        this.a = pq9Var;
        this.b = rq9Var;
        this.c = str;
        this.d = str2;
        this.e = z;
        this.f = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof eb4)) {
            return false;
        }
        eb4 eb4Var = (eb4) obj;
        return this.a.equals(eb4Var.a) && this.b.equals(eb4Var.b) && this.c.equals(eb4Var.c) && g76.L(this.d, eb4Var.d) && this.e == eb4Var.e && g76.L(this.f, eb4Var.f);
    }

    public final int hashCode() {
        return this.f.hashCode() + ((wgd.o(wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c), 31, this.d) + (this.e ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("PostFeatured(author=");
        sb.append(this.a);
        sb.append(", collection=");
        sb.append(this.b);
        sb.append(", postTitle=");
        ka1.C(sb, this.c, ", publicationId=", this.d, ", areActionsEnabled=");
        sb.append(this.e);
        sb.append(", sourceParameter=");
        sb.append(this.f);
        sb.append(")");
        return sb.toString();
    }
}
