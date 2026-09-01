package defpackage;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class nj5 {
    public static final nj5 d;
    public final boolean a;
    public final lj5 b;
    public final mj5 c;

    static {
        lj5 lj5Var = lj5.a;
        mj5 mj5Var = mj5.b;
        d = new nj5(false, lj5Var, mj5Var);
        new nj5(true, lj5Var, mj5Var);
    }

    public nj5(boolean z, lj5 lj5Var, mj5 mj5Var) {
        lj5Var.getClass();
        mj5Var.getClass();
        this.a = z;
        this.b = lj5Var;
        this.c = mj5Var;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("HexFormat(\n    upperCase = ");
        sb.append(this.a);
        sb.append(",\n    bytes = BytesHexFormat(\n");
        this.b.a("        ", sb);
        sb.append('\n');
        sb.append("    ),");
        sb.append('\n');
        sb.append("    number = NumberHexFormat(");
        sb.append('\n');
        this.c.a("        ", sb);
        sb.append('\n');
        sb.append(pUlNWdybf.yGHBtyIFHvyJ);
        sb.append('\n');
        sb.append(")");
        return sb.toString();
    }
}
