package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class uab implements xab {
    public final String a;
    public final SourceParameter b;
    public final String c;

    public uab(SourceParameter sourceParameter, String str, String str2) {
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
        if (!(obj instanceof uab)) {
            return false;
        }
        uab uabVar = (uab) obj;
        return g76.L(this.a, uabVar.a) && g76.L(this.b, uabVar.b) && g76.L(this.c, uabVar.c);
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
