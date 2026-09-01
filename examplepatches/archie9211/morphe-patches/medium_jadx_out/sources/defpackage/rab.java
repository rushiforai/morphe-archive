package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rab implements xab {
    public final String a;
    public final SourceParameter b;
    public final String c;

    public rab(SourceParameter sourceParameter, String str, String str2) {
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
        if (!(obj instanceof rab)) {
            return false;
        }
        rab rabVar = (rab) obj;
        return g76.L(this.a, rabVar.a) && g76.L(this.b, rabVar.b) && g76.L(this.c, rabVar.c);
    }

    public final int hashCode() {
        int iO = ev6.o(this.b, this.a.hashCode() * 31, 31);
        String str = this.c;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("BlockReposterSuccessful(reposterId=");
        sb.append(this.a);
        sb.append(", sourceParameter=");
        sb.append(this.b);
        sb.append(", userName=");
        return ka1.v(sb, this.c, ")");
    }
}
