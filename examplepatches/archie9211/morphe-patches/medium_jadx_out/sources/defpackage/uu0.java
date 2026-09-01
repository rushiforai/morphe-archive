package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class uu0 implements zu0 {
    public final Integer a;
    public final boolean b;
    public final boolean c;
    public final boolean d;

    public uu0(Integer num, boolean z, int i) {
        boolean z2 = (i & 4) == 0;
        boolean z3 = (i & 8) == 0;
        this.a = num;
        this.b = z;
        this.c = z2;
        this.d = z3;
    }

    @Override // defpackage.zu0
    public final boolean a() {
        return this.b;
    }

    @Override // defpackage.zu0
    public final Integer b() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof uu0)) {
            return false;
        }
        uu0 uu0Var = (uu0) obj;
        return g76.L(this.a, uu0Var.a) && this.b == uu0Var.b && this.c == uu0Var.c && this.d == uu0Var.d;
    }

    public final int hashCode() {
        Integer num = this.a;
        return ((((((num == null ? 0 : num.hashCode()) * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Disabled(repostCount=");
        sb.append(this.a);
        sb.append(", isRepostCountClickable=");
        sb.append(this.b);
        sb.append(", isOwnStory=");
        return b09.C(sb, this.c, ", isRepostDisabledByWriter=", this.d, ")");
    }
}
