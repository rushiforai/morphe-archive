package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class we3 {
    public static final String h = new String("FIXED_DIMENSION");
    public static final String i = new String("WRAP_DIMENSION");
    public static final String j = new String("SPREAD_DIMENSION");
    public static final String k = new String("PARENT_DIMENSION");
    public static final String l = new String("PERCENT_DIMENSION");
    public static final String m = new String("RATIO_DIMENSION");
    public String f;
    public int a = 0;
    public int b = Integer.MAX_VALUE;
    public float c = 1.0f;
    public int d = 0;
    public String e = null;
    public boolean g = false;

    public we3(String str) {
        this.f = str;
    }

    public static we3 b(int i2) {
        we3 we3Var = new we3(h);
        we3Var.f = null;
        we3Var.d = i2;
        return we3Var;
    }

    public static we3 c(String str) {
        we3 we3Var = new we3();
        we3Var.a = 0;
        we3Var.b = Integer.MAX_VALUE;
        we3Var.c = 1.0f;
        we3Var.d = 0;
        we3Var.e = null;
        we3Var.f = str;
        we3Var.g = true;
        return we3Var;
    }

    public final void a(b72 b72Var, int i2) {
        String str = this.e;
        if (str != null) {
            b72Var.K(str);
        }
        boolean z = this.g;
        String str2 = k;
        int i3 = 2;
        String str3 = l;
        String str4 = i;
        if (i2 == 0) {
            if (z) {
                b72Var.O(a72.MATCH_CONSTRAINT);
                String str5 = this.f;
                if (str5 == str4) {
                    i3 = 1;
                } else if (str5 != str3) {
                    i3 = 0;
                }
                b72Var.P(this.c, i3, this.a, this.b);
                return;
            }
            int i4 = this.a;
            if (i4 > 0) {
                if (i4 < 0) {
                    b72Var.d0 = 0;
                } else {
                    b72Var.d0 = i4;
                }
            }
            int i5 = this.b;
            if (i5 < Integer.MAX_VALUE) {
                b72Var.D[0] = i5;
            }
            String str6 = this.f;
            if (str6 == str4) {
                b72Var.O(a72.WRAP_CONTENT);
                return;
            }
            if (str6 == str2) {
                b72Var.O(a72.MATCH_PARENT);
                return;
            } else {
                if (str6 == null) {
                    b72Var.O(a72.FIXED);
                    b72Var.S(this.d);
                    return;
                }
                return;
            }
        }
        if (z) {
            b72Var.Q(a72.MATCH_CONSTRAINT);
            String str7 = this.f;
            if (str7 == str4) {
                i3 = 1;
            } else if (str7 != str3) {
                i3 = 0;
            }
            b72Var.R(this.c, i3, this.a, this.b);
            return;
        }
        int i6 = this.a;
        if (i6 > 0) {
            if (i6 < 0) {
                b72Var.e0 = 0;
            } else {
                b72Var.e0 = i6;
            }
        }
        int i7 = this.b;
        if (i7 < Integer.MAX_VALUE) {
            b72Var.D[1] = i7;
        }
        String str8 = this.f;
        if (str8 == str4) {
            b72Var.Q(a72.WRAP_CONTENT);
            return;
        }
        if (str8 == str2) {
            b72Var.Q(a72.MATCH_PARENT);
        } else if (str8 == null) {
            b72Var.Q(a72.FIXED);
            b72Var.N(this.d);
        }
    }
}
