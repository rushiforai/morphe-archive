package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ri0 {
    public long a;
    public String b;
    public String c;
    public long d;
    public int e;
    public byte f;

    public final si0 a() {
        String str;
        if (this.f == 7 && (str = this.b) != null) {
            return new si0(this.a, str, this.c, this.d, this.e);
        }
        StringBuilder sb = new StringBuilder();
        if ((this.f & 1) == 0) {
            sb.append(" pc");
        }
        if (this.b == null) {
            sb.append(" symbol");
        }
        if ((this.f & 2) == 0) {
            sb.append(" offset");
        }
        if ((this.f & 4) == 0) {
            sb.append(" importance");
        }
        ygf.f(ka1.u("Missing required properties:", sb));
        return null;
    }
}
