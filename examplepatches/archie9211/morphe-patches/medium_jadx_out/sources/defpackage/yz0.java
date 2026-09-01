package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class yz0 implements ae6 {
    public static final no3 g = new no3(12);
    public static final String[] h;
    public final xz0 a;
    public int b;
    public int[] c = new int[64];
    public String[] d = new String[64];
    public int[] e = new int[64];
    public String f;

    static {
        String[] strArr = new String[128];
        for (int i = 0; i < 32; i++) {
            byte b = (byte) i;
            g.getClass();
            StringBuilder sb = new StringBuilder();
            sb.append("0123456789abcdef".charAt(b >>> 4));
            sb.append("0123456789abcdef".charAt(b & 15));
            strArr[i] = "\\u00".concat(sb.toString());
        }
        strArr[34] = "\\\"";
        strArr[92] = "\\\\";
        strArr[9] = "\\t";
        strArr[8] = "\\b";
        strArr[10] = "\\n";
        strArr[13] = "\\r";
        h = strArr;
    }

    public yz0(xz0 xz0Var) {
        this.a = xz0Var;
        D(6);
    }

    public final int B() {
        int i = this.b;
        if (i != 0) {
            return this.c[i - 1];
        }
        ygf.f("JsonWriter is closed.");
        return 0;
    }

    public final void D(int i) {
        int i2 = this.b;
        int[] iArr = this.c;
        if (i2 == iArr.length) {
            this.c = Arrays.copyOf(iArr, iArr.length * 2);
            String[] strArr = this.d;
            this.d = (String[]) Arrays.copyOf(strArr, strArr.length * 2);
            int[] iArr2 = this.e;
            this.e = Arrays.copyOf(iArr2, iArr2.length * 2);
        }
        int[] iArr3 = this.c;
        int i3 = this.b;
        this.b = i3 + 1;
        iArr3[i3] = i;
    }

    @Override // defpackage.ae6
    public final ae6 E(String str) {
        str.getClass();
        I();
        f();
        no3.P0(this.a, str);
        int[] iArr = this.e;
        int i = this.b - 1;
        iArr[i] = iArr[i] + 1;
        return this;
    }

    public final void I() {
        if (this.f != null) {
            int iB = B();
            xz0 xz0Var = this.a;
            if (iB == 5) {
                xz0Var.writeByte(44);
            } else if (iB != 3) {
                ygf.f("Nesting problem.");
                return;
            }
            this.c[this.b - 1] = 4;
            String str = this.f;
            str.getClass();
            no3.P0(xz0Var, str);
            this.f = null;
        }
    }

    @Override // defpackage.ae6
    public final ae6 V(boolean z) {
        p(z ? "true" : "false");
        return this;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.a.close();
        int i = this.b;
        if (i > 1 || (i == 1 && this.c[i - 1] != 7)) {
            ik4.g("Incomplete document");
        } else {
            this.b = 0;
        }
    }

    @Override // defpackage.ae6
    public final ae6 e() {
        m(3, 5, "}");
        return this;
    }

    public final void f() {
        int iB = B();
        if (iB == 1) {
            this.c[this.b - 1] = 2;
            return;
        }
        xz0 xz0Var = this.a;
        if (iB == 2) {
            xz0Var.writeByte(44);
            return;
        }
        if (iB == 4) {
            xz0Var.Y(":");
            this.c[this.b - 1] = 5;
        } else if (iB == 6) {
            this.c[this.b - 1] = 7;
        } else if (iB != 7) {
            ygf.f("Nesting problem.");
        } else {
            ygf.f("JSON must have only one top-level value.");
        }
    }

    @Override // defpackage.ae6
    public final ae6 i() {
        I();
        f();
        D(3);
        this.e[this.b - 1] = 0;
        this.a.Y("{");
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 k() {
        m(1, 2, CspinKvYN.SxLgJusxFVi);
        return this;
    }

    public final void m(int i, int i2, String str) {
        int iB = B();
        if (iB != i2 && iB != i) {
            ygf.f("Nesting problem.");
            return;
        }
        if (this.f != null) {
            lg8.m("Dangling name: ", this.f);
            return;
        }
        int i3 = this.b;
        int i4 = i3 - 1;
        this.b = i4;
        this.d[i4] = null;
        int[] iArr = this.e;
        int i5 = i3 - 2;
        iArr[i5] = iArr[i5] + 1;
        this.a.Y(str);
    }

    @Override // defpackage.ae6
    public final ae6 n() {
        I();
        f();
        D(1);
        this.e[this.b - 1] = 0;
        this.a.Y("[");
        return this;
    }

    public final void p(String str) {
        str.getClass();
        I();
        f();
        this.a.Y(str);
        int[] iArr = this.e;
        int i = this.b - 1;
        iArr[i] = iArr[i] + 1;
    }

    @Override // defpackage.ae6
    public final ae6 s0() {
        p("null");
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 t(long j) {
        p(String.valueOf(j));
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 t0(String str) {
        int i = this.b;
        if (i == 0) {
            ygf.f("JsonWriter is closed.");
            return null;
        }
        if (this.f != null) {
            ygf.f("Nesting problem.");
            return null;
        }
        this.f = str;
        this.d[i - 1] = str;
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 u(int i) {
        p(String.valueOf(i));
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 x(rc6 rc6Var) {
        p(rc6Var.a);
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 z(double d) {
        if (!Double.isNaN(d) && !Double.isInfinite(d)) {
            p(String.valueOf(d));
            return this;
        }
        throw new IllegalArgumentException(("Numeric values must be finite, but was " + d).toString());
    }
}
