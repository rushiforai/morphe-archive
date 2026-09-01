package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gka implements jka {
    public final String a;
    public final if8 b;
    public final az5 c;
    public final boolean d;

    public gka(String str, if8 if8Var, az5 az5Var, boolean z) {
        str.getClass();
        az5Var.getClass();
        this.a = str;
        this.b = if8Var;
        this.c = az5Var;
        this.d = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gka)) {
            return false;
        }
        gka gkaVar = (gka) obj;
        return g76.L(this.a, gkaVar.a) && this.b.equals(gkaVar.b) && g76.L(this.c, gkaVar.c) && this.d == gkaVar.d;
    }

    public final int hashCode() {
        return ka1.b(this.c, (this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        return "Content(publicationName=" + this.a + ", newsletterItemUiModel=" + this.b + ", posts=" + this.c + ", isLoadingMore=" + this.d + ")";
    }
}
