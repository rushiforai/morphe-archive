package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yu0 implements zu0 {
    public final Integer a;
    public final boolean b;
    public final String c;

    public yu0(Integer num, boolean z, String str) {
        this.a = num;
        this.b = z;
        this.c = str;
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
        if (!(obj instanceof yu0)) {
            return false;
        }
        yu0 yu0Var = (yu0) obj;
        return g76.L(this.a, yu0Var.a) && this.b == yu0Var.b && g76.L(this.c, yu0Var.c);
    }

    public final int hashCode() {
        Integer num = this.a;
        int iHashCode = (((num == null ? 0 : num.hashCode()) * 31) + (this.b ? 1231 : 1237)) * 31;
        String str = this.c;
        return iHashCode + (str != null ? str.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Reposted(repostCount=");
        sb.append(this.a);
        sb.append(", isRepostCountClickable=");
        sb.append(this.b);
        sb.append(", repostNote=");
        return ka1.v(sb, this.c, ")");
    }
}
