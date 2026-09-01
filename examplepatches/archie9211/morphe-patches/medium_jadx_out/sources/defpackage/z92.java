package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z92 {
    public String a;
    public String b;
    public String d;
    public boolean f;
    public boolean g;
    public boolean h;
    public long c = 253402300799999L;
    public String e = "/";

    public final aa2 a() {
        String str = this.a;
        if (str == null) {
            z72.c("builder.name == null");
            return null;
        }
        String str2 = this.b;
        if (str2 == null) {
            z72.c("builder.value == null");
            return null;
        }
        long j = this.c;
        String str3 = this.d;
        if (str3 != null) {
            return new aa2(str, str2, j, str3, this.e, this.f, this.g, this.h, false, null);
        }
        z72.c("builder.domain == null");
        return null;
    }

    public final void b(String str) {
        str.getClass();
        String strB = cgf.b(str);
        if (strB != null) {
            this.d = strB;
        } else {
            ay0.e("unexpected domain: ".concat(str));
        }
    }

    public final void c(long j) {
        if (j <= 0) {
            j = Long.MIN_VALUE;
        }
        if (j > 253402300799999L) {
            j = 253402300799999L;
        }
        this.c = j;
        this.h = true;
    }

    public final void d(String str) {
        str.getClass();
        if (g76.L(muc.y0(str).toString(), str)) {
            this.a = str;
        } else {
            ay0.e("name is not trimmed");
        }
    }

    public final void e(String str) {
        str.getClass();
        if (tuc.N(str, "/", false)) {
            this.e = str;
        } else {
            ay0.e("path must start with '/'");
        }
    }

    public final void f(String str) {
        str.getClass();
        if (g76.L(muc.y0(str).toString(), str)) {
            this.b = str;
        } else {
            ay0.e("value is not trimmed");
        }
    }
}
