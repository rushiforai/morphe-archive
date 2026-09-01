package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a5e implements d5e {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final boolean e;
    public final boolean f;

    public a5e(String str, String str2, String str3, boolean z, boolean z2, boolean z3) {
        b09.I(str, str2, str3);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = z2;
        this.f = z3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a5e)) {
            return false;
        }
        a5e a5eVar = (a5e) obj;
        return g76.L(this.a, a5eVar.a) && g76.L(this.b, a5eVar.b) && g76.L(this.c, a5eVar.c) && this.d == a5eVar.d && this.e == a5eVar.e && this.f == a5eVar.f;
    }

    public final int hashCode() {
        return ((((wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Content(id=", this.a, ", title=", this.b, ", description=");
        ka1.D(sbU, this.c, ", isPrivate=", this.d, ", isPredefined=");
        return b09.C(sbU, this.e, ", canSubmit=", this.f, ")");
    }
}
