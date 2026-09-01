package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fhd extends vgd {
    public final String b;
    public final int c;
    public final x45 d;

    public fhd(Object obj, String str, int i, x45 x45Var) {
        super(obj);
        this.b = str;
        this.c = i;
        this.d = x45Var;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("TextContextMenuItem(key=");
        sb.append(this.a);
        sb.append(", label=\"");
        sb.append(this.b);
        sb.append("\", leadingIcon=");
        return km4.A(sb, this.c, ')');
    }
}
