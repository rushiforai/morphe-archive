package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p7b implements t7b {
    public final String a;
    public final SourceParameter b;
    public final b24 c;

    public p7b(String str, SourceParameter sourceParameter, b24 b24Var) {
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
        if (!(obj instanceof p7b)) {
            return false;
        }
        p7b p7bVar = (p7b) obj;
        return g76.L(this.a, p7bVar.a) && g76.L(this.b, p7bVar.b) && this.c.equals(p7bVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ev6.o(this.b, this.a.hashCode() * 31, 31);
    }

    public final String toString() {
        return "BlockReposterFailed(targetUserId=" + this.a + ", sourceParameter=" + this.b + ", errorState=" + this.c + ")";
    }
}
