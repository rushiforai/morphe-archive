package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ka implements na {
    public final dr9 a;
    public final String b;
    public final boolean c;
    public final boolean d;

    public ka(dr9 dr9Var, String str, boolean z, boolean z2) {
        str.getClass();
        this.a = dr9Var;
        this.b = str;
        this.c = z;
        this.d = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ka)) {
            return false;
        }
        ka kaVar = (ka) obj;
        return this.a.equals(kaVar.a) && g76.L(this.b, kaVar.b) && this.c == kaVar.c && this.d == kaVar.d;
    }

    public final int hashCode() {
        return ((wgd.o(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Content(uiModel=");
        sb.append(this.a);
        sb.append(", annotation=");
        sb.append(this.b);
        sb.append(", canSubmit=");
        return b09.C(sb, this.c, ", isEditingAnnotation=", this.d, ")");
    }
}
