package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class c65 {
    public final y05 a;
    public final String b;

    public c65(y05 y05Var, String str) {
        y05Var.getClass();
        this.a = y05Var;
        this.b = str;
    }

    public final n98 a(int i) {
        return n98.e(this.b + i);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.a);
        sb.append('.');
        return ev6.z(sb, this.b, 'N');
    }
}
