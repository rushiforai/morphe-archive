package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tab implements xab {
    public final String a;
    public final SourceParameter b;
    public final b24 c;

    public tab(String str, SourceParameter sourceParameter, b24 b24Var) {
        str.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = sourceParameter;
        this.c = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tab)) {
            return false;
        }
        tab tabVar = (tab) obj;
        return g76.L(this.a, tabVar.a) && g76.L(this.b, tabVar.b) && this.c.equals(tabVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ev6.o(this.b, this.a.hashCode() * 31, 31);
    }

    public final String toString() {
        return "UnblockReposterFailed(targetUserId=" + this.a + ", sourceParameter=" + this.b + ", errorState=" + this.c + ")";
    }
}
