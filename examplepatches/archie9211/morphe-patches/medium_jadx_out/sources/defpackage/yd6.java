package defpackage;

import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import com.medium.android.admin.stagebranch.uG.peNPu;
import j$.util.Objects;
import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;
import java.io.Writer;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class yd6 implements Closeable, Flushable {
    public static final Pattern l = Pattern.compile("-?(?:0|[1-9][0-9]*)(?:\\.[0-9]+)?(?:[eE][-+]?[0-9]+)?");
    public static final String[] m = new String[128];
    public static final String[] n;
    public final Writer a;
    public int[] b;
    public int c;
    public r05 d;
    public String e;
    public String f;
    public boolean g;
    public euc h;
    public boolean i;
    public String j;
    public boolean k;

    public yd6(Writer writer) {
        int[] iArrCopyOf = new int[32];
        this.b = iArrCopyOf;
        this.c = 0;
        if (iArrCopyOf.length == 0) {
            iArrCopyOf = Arrays.copyOf(iArrCopyOf, 0);
            this.b = iArrCopyOf;
        }
        int i = this.c;
        this.c = i + 1;
        iArrCopyOf[i] = 6;
        this.h = euc.LEGACY_STRICT;
        this.k = true;
        Objects.requireNonNull(writer, "out == null");
        this.a = writer;
        T(r05.d);
    }

    public void A0(String str) throws IOException {
        if (str == null) {
            Q();
            return;
        }
        F0();
        f();
        g0(str);
    }

    public void D() throws IOException {
        B(1, 2, ']');
    }

    public void E0(boolean z) throws IOException {
        F0();
        f();
        this.a.write(z ? "true" : "false");
    }

    public final void F0() throws IOException {
        if (this.j != null) {
            int iR = R();
            if (iR == 5) {
                this.a.write(this.f);
            } else if (iR != 3) {
                ygf.f("Nesting problem.");
                return;
            }
            N();
            this.b[this.c - 1] = 4;
            g0(this.j);
            this.j = null;
        }
    }

    public void I() throws IOException {
        B(3, 5, '}');
    }

    public void L(String str) {
        Objects.requireNonNull(str, "name == null");
        if (this.j != null) {
            ygf.f("Already wrote a name, expecting a value.");
            return;
        }
        int iR = R();
        if (iR == 3 || iR == 5) {
            this.j = str;
        } else {
            ygf.f("Please begin an object before writing a name.");
        }
    }

    public final void N() throws IOException {
        if (this.g) {
            return;
        }
        String str = this.d.a;
        Writer writer = this.a;
        writer.write(str);
        int i = this.c;
        for (int i2 = 1; i2 < i; i2++) {
            writer.write(this.d.b);
        }
    }

    public yd6 Q() {
        if (this.j != null) {
            if (!this.k) {
                this.j = null;
                return this;
            }
            F0();
        }
        f();
        this.a.write("null");
        return this;
    }

    public final int R() {
        int i = this.c;
        if (i != 0) {
            return this.b[i - 1];
        }
        ygf.f("JsonWriter is closed.");
        return 0;
    }

    public final void T(r05 r05Var) {
        Objects.requireNonNull(r05Var);
        this.d = r05Var;
        this.f = ",";
        if (r05Var.c) {
            this.e = ": ";
            if (r05Var.a.isEmpty()) {
                this.f = ", ";
            }
        } else {
            this.e = ":";
        }
        this.g = this.d.a.isEmpty() && this.d.b.isEmpty();
    }

    public final void U(euc eucVar) {
        Objects.requireNonNull(eucVar);
        this.h = eucVar;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.a.close();
        int i = this.c;
        if (i > 1 || (i == 1 && this.b[i - 1] != 7)) {
            ik4.g("Incomplete document");
        } else {
            this.c = 0;
        }
    }

    public final void f() throws IOException {
        int iR = R();
        if (iR == 1) {
            this.b[this.c - 1] = 2;
            N();
            return;
        }
        Writer writer = this.a;
        if (iR == 2) {
            writer.append((CharSequence) this.f);
            N();
            return;
        }
        if (iR == 4) {
            writer.append((CharSequence) this.e);
            this.b[this.c - 1] = 5;
            return;
        }
        if (iR != 6) {
            if (iR != 7) {
                ygf.f("Nesting problem.");
                return;
            } else if (this.h != euc.LENIENT) {
                ygf.f("JSON must have only one top-level value.");
                return;
            }
        }
        this.b[this.c - 1] = 7;
    }

    public void flush() throws IOException {
        if (this.c != 0) {
            this.a.flush();
        } else {
            ygf.f("JsonWriter is closed.");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0034  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void g0(java.lang.String r8) throws java.io.IOException {
        /*
            r7 = this;
            boolean r0 = r7.i
            if (r0 == 0) goto L7
            java.lang.String[] r0 = defpackage.yd6.n
            goto L9
        L7:
            java.lang.String[] r0 = defpackage.yd6.m
        L9:
            java.io.Writer r7 = r7.a
            r1 = 34
            r7.write(r1)
            int r2 = r8.length()
            r3 = 0
            r4 = r3
        L16:
            if (r3 >= r2) goto L41
            char r5 = r8.charAt(r3)
            r6 = 128(0x80, float:1.8E-43)
            if (r5 >= r6) goto L25
            r5 = r0[r5]
            if (r5 != 0) goto L32
            goto L3e
        L25:
            r6 = 8232(0x2028, float:1.1535E-41)
            if (r5 != r6) goto L2c
            java.lang.String r5 = "\\u2028"
            goto L32
        L2c:
            r6 = 8233(0x2029, float:1.1537E-41)
            if (r5 != r6) goto L3e
            java.lang.String r5 = "\\u2029"
        L32:
            if (r4 >= r3) goto L39
            int r6 = r3 - r4
            r7.write(r8, r4, r6)
        L39:
            r7.write(r5)
            int r4 = r3 + 1
        L3e:
            int r3 = r3 + 1
            goto L16
        L41:
            if (r4 >= r2) goto L47
            int r2 = r2 - r4
            r7.write(r8, r4, r2)
        L47:
            r7.write(r1)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yd6.g0(java.lang.String):void");
    }

    public void j0(double d) throws IOException {
        F0();
        if (this.h != euc.LENIENT && (Double.isNaN(d) || Double.isInfinite(d))) {
            rd6.c(d, "Numeric values must be finite, but was ");
        } else {
            f();
            this.a.append((CharSequence) Double.toString(d));
        }
    }

    public void m() throws IOException {
        F0();
        f();
        int i = this.c;
        int[] iArrCopyOf = this.b;
        if (i == iArrCopyOf.length) {
            iArrCopyOf = Arrays.copyOf(iArrCopyOf, i * 2);
            this.b = iArrCopyOf;
        }
        int i2 = this.c;
        this.c = i2 + 1;
        iArrCopyOf[i2] = 1;
        this.a.write(91);
    }

    public void o0(long j) throws IOException {
        F0();
        f();
        this.a.write(Long.toString(j));
    }

    public void p() throws IOException {
        F0();
        f();
        int i = this.c;
        int[] iArrCopyOf = this.b;
        if (i == iArrCopyOf.length) {
            iArrCopyOf = Arrays.copyOf(iArrCopyOf, i * 2);
            this.b = iArrCopyOf;
        }
        int i2 = this.c;
        this.c = i2 + 1;
        iArrCopyOf[i2] = 3;
        this.a.write(123);
    }

    public void p0(Boolean bool) throws IOException {
        if (bool == null) {
            Q();
            return;
        }
        F0();
        f();
        this.a.write(bool.booleanValue() ? "true" : "false");
    }

    public void z0(Number number) throws IOException {
        if (number == null) {
            Q();
            return;
        }
        F0();
        String string = number.toString();
        Class<?> cls = number.getClass();
        if (cls != Integer.class && cls != Long.class && cls != Byte.class && cls != Short.class && cls != BigDecimal.class && cls != BigInteger.class && cls != AtomicInteger.class && cls != AtomicLong.class) {
            if (string.equals("-Infinity") || string.equals("Infinity") || string.equals("NaN")) {
                if (this.h != euc.LENIENT) {
                    ay0.e("Numeric values must be finite, but was ".concat(string));
                    return;
                }
            } else if (cls != Float.class && cls != Double.class && !l.matcher(string).matches()) {
                ywb.j("String created by ", cls, " is not a valid JSON number: ", string);
                return;
            }
        }
        f();
        this.a.append((CharSequence) string);
    }

    static {
        for (int i = 0; i <= 31; i++) {
            m[i] = String.format("\\u%04x", Integer.valueOf(i));
        }
        String[] strArr = m;
        strArr[34] = "\\\"";
        strArr[92] = "\\\\";
        strArr[9] = "\\t";
        strArr[8] = "\\b";
        strArr[10] = "\\n";
        strArr[13] = "\\r";
        strArr[12] = "\\f";
        String[] strArr2 = (String[]) strArr.clone();
        n = strArr2;
        strArr2[60] = "\\u003c";
        strArr2[62] = ziYqbdHrAXvj.jGkipVrBYBUyzJz;
        strArr2[38] = "\\u0026";
        strArr2[61] = "\\u003d";
        strArr2[39] = "\\u0027";
    }

    public final void B(int i, int i2, char c) throws IOException {
        int iR = R();
        if (iR != i2 && iR != i) {
            ygf.f("Nesting problem.");
            return;
        }
        if (this.j == null) {
            this.c--;
            if (iR == i2) {
                N();
            }
            this.a.write(c);
            return;
        }
        rd6.g(peNPu.IBs, this.j);
    }
}
