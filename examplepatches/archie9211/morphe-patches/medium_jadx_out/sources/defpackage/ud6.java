package defpackage;

import com.squareup.moshi.JsonDataException;
import java.io.IOException;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ud6 extends zd6 {
    public static final String[] i = new String[128];
    public final kz0 g;
    public String h;

    static {
        for (int i2 = 0; i2 <= 31; i2++) {
            i[i2] = String.format("\\u%04x", Integer.valueOf(i2));
        }
        String[] strArr = i;
        strArr[34] = "\\\"";
        strArr[92] = "\\\\";
        strArr[9] = "\\t";
        strArr[8] = "\\b";
        strArr[10] = "\\n";
        strArr[13] = "\\r";
        strArr[12] = "\\f";
    }

    public ud6(kz0 kz0Var) {
        int[] iArr = new int[32];
        this.b = iArr;
        this.c = new String[32];
        this.d = new int[32];
        this.f = -1;
        this.g = kz0Var;
        this.a = 1;
        iArr[0] = 6;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x002b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void g0(defpackage.kz0 r6, java.lang.String r7) {
        /*
            r0 = 34
            r6.K0(r0)
            int r1 = r7.length()
            r2 = 0
            r3 = r2
        Lb:
            if (r2 >= r1) goto L36
            char r4 = r7.charAt(r2)
            r5 = 128(0x80, float:1.8E-43)
            if (r4 >= r5) goto L1c
            java.lang.String[] r5 = defpackage.ud6.i
            r4 = r5[r4]
            if (r4 != 0) goto L29
            goto L33
        L1c:
            r5 = 8232(0x2028, float:1.1535E-41)
            if (r4 != r5) goto L23
            java.lang.String r4 = "\\u2028"
            goto L29
        L23:
            r5 = 8233(0x2029, float:1.1537E-41)
            if (r4 != r5) goto L33
            java.lang.String r4 = "\\u2029"
        L29:
            if (r3 >= r2) goto L2e
            r6.Q0(r3, r2, r7)
        L2e:
            r6.R0(r4)
            int r3 = r2 + 1
        L33:
            int r2 = r2 + 1
            goto Lb
        L36:
            if (r3 >= r1) goto L3b
            r6.Q0(r3, r1, r7)
        L3b:
            r6.K0(r0)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ud6.g0(kz0, java.lang.String):void");
    }

    @Override // defpackage.zd6
    public final ud6 D(String str) {
        if (str == null) {
            z72.c("name == null");
            return null;
        }
        if (this.a == 0) {
            ygf.f("JsonWriter is closed.");
            return null;
        }
        int iL = L();
        if ((iL != 3 && iL != 5) || this.h != null || this.e) {
            ygf.f("Nesting problem.");
            return null;
        }
        this.h = str;
        this.c[this.a - 1] = str;
        return this;
    }

    @Override // defpackage.zd6
    public final ud6 I() {
        if (this.e) {
            ygf.f("null cannot be used as a map key in JSON at path ".concat(B()));
            return null;
        }
        if (this.h != null) {
            this.h = null;
            return this;
        }
        R();
        this.g.R0("null");
        int[] iArr = this.d;
        int i2 = this.a - 1;
        iArr[i2] = iArr[i2] + 1;
        return this;
    }

    @Override // defpackage.zd6
    public final ud6 N(long j) {
        if (this.e) {
            this.e = false;
            D(Long.toString(j));
            return this;
        }
        j0();
        R();
        this.g.R0(Long.toString(j));
        int[] iArr = this.d;
        int i2 = this.a - 1;
        iArr[i2] = iArr[i2] + 1;
        return this;
    }

    @Override // defpackage.zd6
    public final ud6 Q(String str) {
        if (str == null) {
            I();
            return this;
        }
        if (this.e) {
            this.e = false;
            D(str);
            return this;
        }
        j0();
        R();
        g0(this.g, str);
        int[] iArr = this.d;
        int i2 = this.a - 1;
        iArr[i2] = iArr[i2] + 1;
        return this;
    }

    public final void R() {
        int iL = L();
        int i2 = 2;
        if (iL != 1) {
            kz0 kz0Var = this.g;
            if (iL == 2) {
                kz0Var.K0(44);
            } else if (iL == 4) {
                kz0Var.R0(":");
                i2 = 5;
            } else if (iL == 9) {
                ygf.f("Sink from valueSink() was not closed");
                return;
            } else {
                if (iL != 6) {
                    if (iL == 7) {
                        ygf.f("JSON must have only one top-level value.");
                        return;
                    } else {
                        ygf.f("Nesting problem.");
                        return;
                    }
                }
                i2 = 7;
            }
        }
        this.b[this.a - 1] = i2;
    }

    public final void T(int i2, int i3, char c) {
        int iL = L();
        if (iL != i3 && iL != i2) {
            ygf.f("Nesting problem.");
            return;
        }
        if (this.h != null) {
            rd6.g("Dangling name: ", this.h);
            return;
        }
        int i4 = this.a;
        int i5 = ~this.f;
        if (i4 == i5) {
            this.f = i5;
            return;
        }
        int i6 = i4 - 1;
        this.a = i6;
        this.c[i6] = null;
        int[] iArr = this.d;
        int i7 = i4 - 2;
        iArr[i7] = iArr[i7] + 1;
        this.g.K0(c);
    }

    public final void U(int i2, int i3, char c) {
        int i4;
        int i5 = this.a;
        int i6 = this.f;
        if (i5 == i6 && ((i4 = this.b[i5 - 1]) == i2 || i4 == i3)) {
            this.f = ~i6;
            return;
        }
        R();
        int i7 = this.a;
        int[] iArr = this.b;
        if (i7 == iArr.length) {
            if (i7 == 256) {
                throw new JsonDataException("Nesting too deep at " + B() + ": circular reference?");
            }
            this.b = Arrays.copyOf(iArr, iArr.length * 2);
            String[] strArr = this.c;
            this.c = (String[]) Arrays.copyOf(strArr, strArr.length * 2);
            int[] iArr2 = this.d;
            this.d = Arrays.copyOf(iArr2, iArr2.length * 2);
        }
        int[] iArr3 = this.b;
        int i8 = this.a;
        this.a = i8 + 1;
        iArr3[i8] = i2;
        this.d[i8] = 0;
        this.g.K0(c);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        int i2 = this.a;
        if (i2 > 1 || (i2 == 1 && this.b[i2 - 1] != 7)) {
            ik4.g("Incomplete document");
        } else {
            this.a = 0;
        }
    }

    @Override // defpackage.zd6
    public final ud6 f() {
        if (this.e) {
            ygf.f("Array cannot be used as a map key in JSON at path ".concat(B()));
            return null;
        }
        j0();
        U(1, 2, '[');
        return this;
    }

    @Override // java.io.Flushable
    public final void flush() {
        if (this.a != 0) {
            return;
        }
        ygf.f("JsonWriter is closed.");
    }

    public final void j0() {
        if (this.h != null) {
            int iL = L();
            kz0 kz0Var = this.g;
            if (iL == 5) {
                kz0Var.K0(44);
            } else if (iL != 3) {
                ygf.f("Nesting problem.");
                return;
            }
            this.b[this.a - 1] = 4;
            g0(kz0Var, this.h);
            this.h = null;
        }
    }

    @Override // defpackage.zd6
    public final ud6 m() {
        if (this.e) {
            ygf.f("Object cannot be used as a map key in JSON at path ".concat(B()));
            return null;
        }
        j0();
        U(3, 5, '{');
        return this;
    }

    @Override // defpackage.zd6
    public final ud6 p() {
        this.e = false;
        T(3, 5, '}');
        return this;
    }
}
