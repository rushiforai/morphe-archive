package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dc1 implements ec1 {
    public final String a;
    public final String b;
    public final dr9 c;
    public final String d;

    public dc1(String str, String str2, dr9 dr9Var) {
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = dr9Var;
        this.d = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dc1)) {
            return false;
        }
        dc1 dc1Var = (dc1) obj;
        return g76.L(this.a, dc1Var.a) && g76.L(this.b, dc1Var.b) && this.c.equals(dc1Var.c);
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.d;
    }

    public final int hashCode() {
        String str = this.a;
        return this.c.hashCode() + wgd.o((str == null ? 0 : str.hashCode()) * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Post(annotation=", this.a, ", itemId=", this.b, ", postUiModel=");
        sbU.append(this.c);
        sbU.append(")");
        return sbU.toString();
    }
}
