package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yi0 {
    public aj0 a;
    public String b;
    public String c;
    public long d;
    public byte e;

    public final zi0 a() {
        aj0 aj0Var;
        String str;
        String str2;
        if (this.e == 1 && (aj0Var = this.a) != null && (str = this.b) != null && (str2 = this.c) != null) {
            return new zi0(aj0Var, str, str2, this.d);
        }
        StringBuilder sb = new StringBuilder();
        if (this.a == null) {
            sb.append(" rolloutVariant");
        }
        if (this.b == null) {
            sb.append(" parameterKey");
        }
        if (this.c == null) {
            sb.append(" parameterValue");
        }
        if ((this.e & 1) == 0) {
            sb.append(" templateVersion");
        }
        ygf.f(ka1.u("Missing required properties:", sb));
        return null;
    }
}
