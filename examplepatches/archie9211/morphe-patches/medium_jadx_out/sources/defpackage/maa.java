package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class maa {
    public final laa a;
    public final az5 b;
    public final boolean c;
    public final SourceParameter d;

    public maa(laa laaVar, az5 az5Var, boolean z, SourceParameter sourceParameter) {
        laaVar.getClass();
        az5Var.getClass();
        sourceParameter.getClass();
        this.a = laaVar;
        this.b = az5Var;
        this.c = z;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof maa)) {
            return false;
        }
        maa maaVar = (maa) obj;
        return this.a == maaVar.a && g76.L(this.b, maaVar.b) && this.c == maaVar.c && g76.L(this.d, maaVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((ka1.b(this.b, this.a.hashCode() * 31, 31) + (this.c ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "UserGroupSection(userType=" + this.a + ", users=" + this.b + ", hasMore=" + this.c + ", sourceParameter=" + this.d + ")";
    }
}
