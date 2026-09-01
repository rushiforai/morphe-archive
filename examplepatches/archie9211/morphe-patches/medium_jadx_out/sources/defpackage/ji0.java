package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ji0 {
    public long a;
    public String b;
    public fd2 c;
    public gd2 d;
    public hd2 e;
    public kd2 f;
    public byte g;

    public final ki0 a() {
        String str;
        fd2 fd2Var;
        gd2 gd2Var;
        if (this.g == 1 && (str = this.b) != null && (fd2Var = this.c) != null && (gd2Var = this.d) != null) {
            return new ki0(this.a, str, fd2Var, gd2Var, this.e, this.f);
        }
        StringBuilder sb = new StringBuilder();
        if ((1 & this.g) == 0) {
            sb.append(" timestamp");
        }
        if (this.b == null) {
            sb.append(" type");
        }
        if (this.c == null) {
            sb.append(" app");
        }
        if (this.d == null) {
            sb.append(" device");
        }
        ygf.f(ka1.u("Missing required properties:", sb));
        return null;
    }
}
