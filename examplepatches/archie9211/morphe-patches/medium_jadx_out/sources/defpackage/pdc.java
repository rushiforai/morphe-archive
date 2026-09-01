package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pdc {
    public final uid a;
    public final Integer b;
    public final uid c;
    public final Integer d;
    public final boolean e;
    public final String f;

    public pdc(uid uidVar, Integer num, uid uidVar2, Integer num2, boolean z, String str) {
        uidVar.getClass();
        uidVar2.getClass();
        str.getClass();
        this.a = uidVar;
        this.b = num;
        this.c = uidVar2;
        this.d = num2;
        this.e = z;
        this.f = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pdc)) {
            return false;
        }
        pdc pdcVar = (pdc) obj;
        return g76.L(this.a, pdcVar.a) && g76.L(this.b, pdcVar.b) && g76.L(this.c, pdcVar.c) && g76.L(this.d, pdcVar.d) && this.e == pdcVar.e && g76.L(this.f, pdcVar.f);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        Integer num = this.b;
        int iHashCode2 = (this.c.hashCode() + ((iHashCode + (num == null ? 0 : num.hashCode())) * 31)) * 31;
        Integer num2 = this.d;
        return this.f.hashCode() + ((((iHashCode2 + (num2 != null ? num2.hashCode() : 0)) * 31) + (this.e ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "Content(fullName=" + this.a + ", fullNameErrorResId=" + this.b + ", email=" + this.c + ", emailErrorResId=" + this.d + ", canSubmit=" + this.e + ", source=" + this.f + ")";
    }

    public /* synthetic */ pdc(uid uidVar, uid uidVar2, boolean z, String str) {
        this(uidVar, null, uidVar2, null, z, str);
    }
}
