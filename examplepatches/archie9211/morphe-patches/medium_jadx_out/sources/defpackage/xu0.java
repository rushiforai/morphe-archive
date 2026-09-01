package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xu0 implements zu0 {
    public final boolean a;
    public final Integer b;
    public final boolean c;

    public xu0(boolean z, Integer num, boolean z2) {
        this.a = z;
        this.b = num;
        this.c = z2;
    }

    public static xu0 c(xu0 xu0Var, boolean z, Integer num, int i) {
        if ((i & 1) != 0) {
            z = xu0Var.a;
        }
        if ((i & 2) != 0) {
            num = xu0Var.b;
        }
        return new xu0(z, num, (i & 4) != 0 ? xu0Var.c : true);
    }

    @Override // defpackage.zu0
    public final boolean a() {
        return this.c;
    }

    @Override // defpackage.zu0
    public final Integer b() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xu0)) {
            return false;
        }
        xu0 xu0Var = (xu0) obj;
        return this.a == xu0Var.a && g76.L(this.b, xu0Var.b) && this.c == xu0Var.c;
    }

    public final int hashCode() {
        int i = (this.a ? 1231 : 1237) * 31;
        Integer num = this.b;
        return ((i + (num == null ? 0 : num.hashCode())) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NotReposted(showRepostTooltip=");
        sb.append(this.a);
        sb.append(", repostCount=");
        sb.append(this.b);
        sb.append(", isRepostCountClickable=");
        return lv8.t(sb, this.c, ")");
    }
}
