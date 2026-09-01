package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p {
    public final String a;
    public final az5 b;
    public final SourceParameter c;

    public p(String str, az5 az5Var, SourceParameter sourceParameter) {
        str.getClass();
        az5Var.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = az5Var;
        this.c = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return g76.L(this.a, pVar.a) && g76.L(this.b, pVar.b) && g76.L(this.c, pVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ka1.b(this.b, this.a.hashCode() * 31, 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("AboutArchivesUiModel(publicationId=");
        sb.append(this.a);
        sb.append(", archiveYears=");
        sb.append(this.b);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.c, ")");
    }
}
