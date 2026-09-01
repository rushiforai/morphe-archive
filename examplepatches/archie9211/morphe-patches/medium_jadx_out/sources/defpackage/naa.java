package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class naa implements qaa {
    public final String a;
    public final String b;
    public final az5 c;
    public final az5 d;
    public final az5 e;
    public final p f;
    public final SourceParameter g;

    public naa(String str, String str2, az5 az5Var, az5 az5Var2, az5 az5Var3, p pVar, SourceParameter sourceParameter) {
        str.getClass();
        az5Var.getClass();
        az5Var2.getClass();
        az5Var3.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = str2;
        this.c = az5Var;
        this.d = az5Var2;
        this.e = az5Var3;
        this.f = pVar;
        this.g = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof naa)) {
            return false;
        }
        naa naaVar = (naa) obj;
        return g76.L(this.a, naaVar.a) && g76.L(this.b, naaVar.b) && g76.L(this.c, naaVar.c) && g76.L(this.d, naaVar.d) && g76.L(this.e, naaVar.e) && g76.L(this.f, naaVar.f) && g76.L(this.g, naaVar.g);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iB = ka1.b(this.e, ka1.b(this.d, ka1.b(this.c, (iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31), 31), 31);
        p pVar = this.f;
        return this.g.hashCode() + ((iB + (pVar != null ? pVar.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Content(publicationId=", this.a, ", publicationDescription=", this.b, ", socialNavigations=");
        sbU.append(this.c);
        sbU.append(", topics=");
        sbU.append(this.d);
        sbU.append(", userGroupSections=");
        sbU.append(this.e);
        sbU.append(", archives=");
        sbU.append(this.f);
        sbU.append(", sourceParameter=");
        return y30.r(sbU, this.g, ")");
    }
}
