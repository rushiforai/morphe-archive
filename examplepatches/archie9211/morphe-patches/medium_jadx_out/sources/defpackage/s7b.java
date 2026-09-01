package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s7b implements t7b {
    public final String a;
    public final SourceParameter b;
    public final String c;

    public s7b(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = sourceParameter;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s7b)) {
            return false;
        }
        s7b s7bVar = (s7b) obj;
        return g76.L(this.a, s7bVar.a) && g76.L(this.b, s7bVar.b) && g76.L(this.c, s7bVar.c);
    }

    public final int hashCode() {
        int iO = ev6.o(this.b, this.a.hashCode() * 31, 31);
        String str = this.c;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("UnblockReposterSuccessful(reposterId=");
        sb.append(this.a);
        sb.append(", sourceParameter=");
        sb.append(this.b);
        sb.append(", userName=");
        return ka1.v(sb, this.c, ")");
    }
}
