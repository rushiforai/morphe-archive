package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class iv0 {
    public final xm1 a;
    public final dv0 b;
    public final zu0 c;
    public final tu0 d;
    public final hv0 e;
    public final String f;
    public final boolean g;
    public final g08 h;

    public iv0(xm1 xm1Var, dv0 dv0Var, zu0 zu0Var, tu0 tu0Var, hv0 hv0Var, String str, boolean z, g08 g08Var) {
        str.getClass();
        g08Var.getClass();
        this.a = xm1Var;
        this.b = dv0Var;
        this.c = zu0Var;
        this.d = tu0Var;
        this.e = hv0Var;
        this.f = str;
        this.g = z;
        this.h = g08Var;
    }

    public static iv0 a(iv0 iv0Var, zu0 zu0Var, tu0 tu0Var, int i) {
        xm1 xm1Var = iv0Var.a;
        dv0 dv0Var = iv0Var.b;
        if ((i & 4) != 0) {
            zu0Var = iv0Var.c;
        }
        zu0 zu0Var2 = zu0Var;
        if ((i & 8) != 0) {
            tu0Var = iv0Var.d;
        }
        tu0 tu0Var2 = tu0Var;
        hv0 hv0Var = iv0Var.e;
        String str = iv0Var.f;
        boolean z = (i & 64) != 0 ? iv0Var.g : true;
        g08 g08Var = iv0Var.h;
        iv0Var.getClass();
        zu0Var2.getClass();
        tu0Var2.getClass();
        str.getClass();
        g08Var.getClass();
        return new iv0(xm1Var, dv0Var, zu0Var2, tu0Var2, hv0Var, str, z, g08Var);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof iv0)) {
            return false;
        }
        iv0 iv0Var = (iv0) obj;
        return this.a.equals(iv0Var.a) && this.b.equals(iv0Var.b) && this.c.equals(iv0Var.c) && this.d.equals(iv0Var.d) && this.e.equals(iv0Var.e) && g76.L(this.f, iv0Var.f) && this.g == iv0Var.g && g76.L(this.h, iv0Var.h);
    }

    public final int hashCode() {
        return this.h.hashCode() + ((wgd.o((this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31, 31, this.f) + (this.g ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "BottomActionBarUiModel(clapsState=" + this.a + ", responsesState=" + this.b + ", repostState=" + this.c + ", bookmarkState=" + this.d + ", shareState=" + this.e + ", postId=" + this.f + ", isAudioPlayerVisible=" + this.g + ", metricsContext=" + this.h + ")";
    }
}
