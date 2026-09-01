package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ocb {
    public final int a;
    public final d05 b;
    public final int c;
    public final c05 d;

    public ocb(int i, d05 d05Var, int i2, c05 c05Var) {
        this.a = i;
        this.b = d05Var;
        this.c = i2;
        this.d = c05Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ocb)) {
            return false;
        }
        ocb ocbVar = (ocb) obj;
        return this.a == ocbVar.a && g76.L(this.b, ocbVar.b) && this.c == ocbVar.c && this.d.equals(ocbVar.d);
    }

    public final int hashCode() {
        return this.d.a.hashCode() + (((((this.a * 31) + this.b.a) * 31) + this.c) * 961);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ResourceFont(resId=");
        sb.append(this.a);
        sb.append(", weight=");
        sb.append(this.b);
        sb.append(", style=");
        int i = this.c;
        sb.append((Object) (i == 0 ? "Normal" : i == 1 ? "Italic" : "Invalid"));
        sb.append(", loadingStrategy=Blocking)");
        return sb.toString();
    }
}
