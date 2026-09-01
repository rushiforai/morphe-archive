package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qab implements xab {
    public final String a;
    public final SourceParameter b;
    public final b24 c;

    public qab(String str, SourceParameter sourceParameter, b24 b24Var) {
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
        if (!(obj instanceof qab)) {
            return false;
        }
        qab qabVar = (qab) obj;
        return g76.L(this.a, qabVar.a) && g76.L(this.b, qabVar.b) && this.c.equals(qabVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ev6.o(this.b, this.a.hashCode() * 31, 31);
    }

    public final String toString() {
        return "BlockReposterFailed(targetUserId=" + this.a + ", sourceParameter=" + this.b + ", errorState=" + this.c + ")";
    }
}
