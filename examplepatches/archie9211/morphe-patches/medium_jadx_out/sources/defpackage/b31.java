package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b31 {
    public static final /* synthetic */ int n = 0;
    public final boolean a;
    public final boolean b;
    public final int c;
    public final int d;
    public final boolean e;
    public final boolean f;
    public final boolean g;
    public final int h;
    public final int i;
    public final boolean j;
    public final boolean k;
    public final boolean l;
    public String m;

    static {
        int i = in3.d;
        mn3 mn3Var = mn3.SECONDS;
        long j = in3.j(hlg.T(Integer.MAX_VALUE, mn3Var), mn3Var);
        if (j >= 0) {
            return;
        }
        ywb.g(ho2.D(j, "maxStale < 0: "));
    }

    public b31(boolean z, boolean z2, int i, int i2, boolean z3, boolean z4, boolean z5, int i3, int i4, boolean z6, boolean z7, boolean z8, String str) {
        this.a = z;
        this.b = z2;
        this.c = i;
        this.d = i2;
        this.e = z3;
        this.f = z4;
        this.g = z5;
        this.h = i3;
        this.i = i4;
        this.j = z6;
        this.k = z7;
        this.l = z8;
        this.m = str;
    }

    public final String toString() {
        String str = this.m;
        if (str != null) {
            return str;
        }
        StringBuilder sb = new StringBuilder();
        if (this.a) {
            sb.append("no-cache, ");
        }
        if (this.b) {
            sb.append("no-store, ");
        }
        int i = this.c;
        if (i != -1) {
            sb.append("max-age=");
            sb.append(i);
            sb.append(", ");
        }
        int i2 = this.d;
        if (i2 != -1) {
            sb.append("s-maxage=");
            sb.append(i2);
            sb.append(", ");
        }
        if (this.e) {
            sb.append("private, ");
        }
        if (this.f) {
            sb.append("public, ");
        }
        if (this.g) {
            sb.append("must-revalidate, ");
        }
        int i3 = this.h;
        if (i3 != -1) {
            sb.append("max-stale=");
            sb.append(i3);
            sb.append(", ");
        }
        int i4 = this.i;
        if (i4 != -1) {
            sb.append("min-fresh=");
            sb.append(i4);
            sb.append(", ");
        }
        if (this.j) {
            sb.append("only-if-cached, ");
        }
        if (this.k) {
            sb.append("no-transform, ");
        }
        if (this.l) {
            sb.append("immutable, ");
        }
        if (sb.length() == 0) {
            return "";
        }
        sb.delete(sb.length() - 2, sb.length()).getClass();
        String string = sb.toString();
        this.m = string;
        return string;
    }
}
