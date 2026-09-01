package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class di0 {
    public String a;
    public String b;
    public String c;
    public long d;
    public Long e;
    public boolean f;
    public wc2 g;
    public nd2 h;
    public md2 i;
    public xc2 j;
    public List k;
    public int l;
    public byte m;

    public final ei0 a() {
        String str;
        String str2;
        wc2 wc2Var;
        if (this.m == 7 && (str = this.a) != null && (str2 = this.b) != null && (wc2Var = this.g) != null) {
            return new ei0(str, str2, this.c, this.d, this.e, this.f, wc2Var, this.h, this.i, this.j, this.k, this.l);
        }
        StringBuilder sb = new StringBuilder();
        if (this.a == null) {
            sb.append(" generator");
        }
        if (this.b == null) {
            sb.append(" identifier");
        }
        if ((this.m & 1) == 0) {
            sb.append(" startedAt");
        }
        if ((this.m & 2) == 0) {
            sb.append(" crashed");
        }
        if (this.g == null) {
            sb.append(" app");
        }
        if ((this.m & 4) == 0) {
            sb.append(" generatorType");
        }
        ygf.f(ka1.u("Missing required properties:", sb));
        return null;
    }
}
