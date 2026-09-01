package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yj0 {
    public String a;
    public g89 b;
    public String c;
    public String d;
    public long e;
    public long f;
    public String g;
    public byte h;

    public final zj0 a() {
        if (this.h == 3 && this.b != null) {
            return new zj0(this.a, this.b, this.c, this.d, this.e, this.f, this.g);
        }
        StringBuilder sb = new StringBuilder();
        if (this.b == null) {
            sb.append(" registrationStatus");
        }
        if ((this.h & 1) == 0) {
            sb.append(" expiresInSecs");
        }
        if ((this.h & 2) == 0) {
            sb.append(" tokenCreationEpochInSecs");
        }
        ygf.f(ka1.u("Missing required properties:", sb));
        return null;
    }

    public final void b(g89 g89Var) {
        if (g89Var != null) {
            this.b = g89Var;
        } else {
            z72.c("Null registrationStatus");
        }
    }
}
