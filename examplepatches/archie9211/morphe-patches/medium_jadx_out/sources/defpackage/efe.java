package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class efe implements jfe {
    public final String a;
    public final String b;
    public final String c;
    public final cfe d;
    public final SourceParameter e;
    public final boolean f;

    public efe(String str, String str2, String str3, cfe cfeVar, SourceParameter sourceParameter, boolean z) {
        sourceParameter.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = cfeVar;
        this.e = sourceParameter;
        this.f = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof efe)) {
            return false;
        }
        efe efeVar = (efe) obj;
        return this.a.equals(efeVar.a) && g76.L(this.b, efeVar.b) && g76.L(this.c, efeVar.c) && this.d.equals(efeVar.d) && g76.L(this.e, efeVar.e) && this.f == efeVar.f;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        return ev6.o(this.e, (this.d.hashCode() + ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31)) * 31, 31) + (this.f ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Content(userName=", this.a, ", bio=", this.b, ", about=");
        sbU.append(this.c);
        sbU.append(", footerData=");
        sbU.append(this.d);
        sbU.append(", sourceParameter=");
        sbU.append(this.e);
        sbU.append(", isRefreshing=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}
