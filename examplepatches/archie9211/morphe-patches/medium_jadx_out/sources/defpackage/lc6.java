package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class lc6 extends yc6 {
    public final boolean a;
    public final String b;

    public lc6(String str, boolean z) {
        str.getClass();
        this.a = z;
        this.b = str.toString();
    }

    @Override // defpackage.yc6
    public final String d() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || lc6.class != obj.getClass()) {
            return false;
        }
        lc6 lc6Var = (lc6) obj;
        return this.a == lc6Var.a && g76.L(this.b, lc6Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + ((this.a ? 1231 : 1237) * 31);
    }

    @Override // defpackage.yc6
    public final String toString() {
        boolean z = this.a;
        String str = this.b;
        if (!z) {
            return str;
        }
        StringBuilder sb = new StringBuilder();
        iuc.a(str, sb);
        return sb.toString();
    }
}
