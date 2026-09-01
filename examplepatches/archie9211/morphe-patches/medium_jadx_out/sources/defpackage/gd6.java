package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import com.google.gson.stream.MalformedJsonException;
import j$.util.Objects;
import java.io.Closeable;
import java.io.IOException;
import java.io.Reader;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class gd6 implements Closeable {
    public final Reader a;
    public long i;
    public int j;
    public String k;
    public int[] l;
    public String[] n;
    public int[] o;
    public euc b = euc.LEGACY_STRICT;
    public final char[] c = new char[1024];
    public int d = 0;
    public int e = 0;
    public int f = 0;
    public int g = 0;
    public int h = 0;
    public int m = 1;

    static {
        u3b.o = new u3b(18);
    }

    public gd6(Reader reader) {
        int[] iArr = new int[32];
        this.l = iArr;
        iArr[0] = 6;
        this.n = new String[32];
        this.o = new int[32];
        Objects.requireNonNull(reader, "in == null");
        this.a = reader;
    }

    public void D() throws IOException {
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        if (iB != 4) {
            throw J0("END_ARRAY");
        }
        int i = this.m;
        this.m = i - 1;
        int[] iArr = this.o;
        int i2 = i - 2;
        iArr[i2] = iArr[i2] + 1;
        this.h = 0;
    }

    public final void E0(euc eucVar) {
        Objects.requireNonNull(eucVar);
        this.b = eucVar;
    }

    public final void F0(char c) throws MalformedJsonException {
        do {
            int i = this.d;
            int i2 = this.e;
            while (i < i2) {
                int i3 = i + 1;
                char c2 = this.c[i];
                if (c2 == c) {
                    this.d = i3;
                    return;
                }
                if (c2 == '\\') {
                    this.d = i3;
                    A0();
                    i = this.d;
                    i2 = this.e;
                } else {
                    if (c2 == '\n') {
                        this.f++;
                        this.g = i3;
                    }
                    i = i3;
                }
            }
            this.d = i;
        } while (L(1));
        I0("Unterminated string");
        throw null;
    }

    public final void G0() {
        char c;
        do {
            if (this.d >= this.e && !L(1)) {
                return;
            }
            int i = this.d;
            int i2 = i + 1;
            this.d = i2;
            c = this.c[i];
            if (c == '\n') {
                this.f++;
                this.g = i2;
                return;
            }
        } while (c != '\r');
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0046, code lost:
    
        p();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void H0() throws com.google.gson.stream.MalformedJsonException {
        /*
            r3 = this;
        L0:
            r0 = 0
        L1:
            int r1 = r3.d
            int r1 = r1 + r0
            int r2 = r3.e
            if (r1 >= r2) goto L4f
            char[] r2 = r3.c
            char r1 = r2[r1]
            r2 = 9
            if (r1 == r2) goto L49
            r2 = 10
            if (r1 == r2) goto L49
            r2 = 12
            if (r1 == r2) goto L49
            r2 = 13
            if (r1 == r2) goto L49
            r2 = 32
            if (r1 == r2) goto L49
            r2 = 35
            if (r1 == r2) goto L46
            r2 = 44
            if (r1 == r2) goto L49
            r2 = 47
            if (r1 == r2) goto L46
            r2 = 61
            if (r1 == r2) goto L46
            r2 = 123(0x7b, float:1.72E-43)
            if (r1 == r2) goto L49
            r2 = 125(0x7d, float:1.75E-43)
            if (r1 == r2) goto L49
            r2 = 58
            if (r1 == r2) goto L49
            r2 = 59
            if (r1 == r2) goto L46
            switch(r1) {
                case 91: goto L49;
                case 92: goto L46;
                case 93: goto L49;
                default: goto L43;
            }
        L43:
            int r0 = r0 + 1
            goto L1
        L46:
            r3.p()
        L49:
            int r1 = r3.d
            int r1 = r1 + r0
            r3.d = r1
            return
        L4f:
            r3.d = r1
            r0 = 1
            boolean r0 = r3.L(r0)
            if (r0 != 0) goto L0
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gd6.H0():void");
    }

    public void I() throws IOException {
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        if (iB != 2) {
            throw J0("END_OBJECT");
        }
        int i = this.m;
        int i2 = i - 1;
        this.m = i2;
        this.n[i2] = null;
        int[] iArr = this.o;
        int i3 = i - 2;
        iArr[i3] = iArr[i3] + 1;
        this.h = 0;
    }

    public final void I0(String str) throws MalformedJsonException {
        throw new MalformedJsonException(str + U() + "\nSee " + "https://github.com/google/gson/blob/main/Troubleshooting.md#".concat("malformed-json"));
    }

    public final void K0(String str) throws MalformedJsonException {
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) > 127) {
                I0("String contains non-ASCII characters: ".concat(str));
                throw null;
            }
        }
    }

    public final boolean L(int i) throws IOException {
        int i2;
        int i3;
        int i4 = this.g;
        int i5 = this.d;
        this.g = i4 - i5;
        int i6 = this.e;
        char[] cArr = this.c;
        if (i6 != i5) {
            int i7 = i6 - i5;
            this.e = i7;
            System.arraycopy(cArr, i5, cArr, 0, i7);
        } else {
            this.e = 0;
        }
        this.d = 0;
        do {
            int i8 = this.e;
            int i9 = this.a.read(cArr, i8, cArr.length - i8);
            if (i9 == -1) {
                return false;
            }
            i2 = this.e + i9;
            this.e = i2;
            if (this.f == 0 && (i3 = this.g) == 0 && i2 > 0 && cArr[0] == 65279) {
                this.d++;
                this.g = i3 + 1;
                i++;
            }
        } while (i2 < i);
        return true;
    }

    public String N() {
        return Q(false);
    }

    public final String Q(boolean z) {
        StringBuilder sb = new StringBuilder("$");
        int i = 0;
        while (true) {
            int i2 = this.m;
            if (i >= i2) {
                return sb.toString();
            }
            int i3 = this.l[i];
            switch (i3) {
                case 1:
                case 2:
                    int i4 = this.o[i];
                    if (z && i4 > 0 && i == i2 - 1) {
                        i4--;
                    }
                    sb.append('[');
                    sb.append(i4);
                    sb.append(']');
                    break;
                case 3:
                case 4:
                case 5:
                    sb.append('.');
                    String str = this.n[i];
                    if (str != null) {
                        sb.append(str);
                    }
                    break;
                case 6:
                case 7:
                case 8:
                    break;
                default:
                    ay0.d(b09.w(i3, "Unknown scope value: "));
                    return null;
            }
            i++;
        }
    }

    public String R() {
        return Q(true);
    }

    public final boolean T(char c) throws MalformedJsonException {
        if (c == '\t' || c == '\n' || c == '\f' || c == '\r' || c == ' ') {
            return false;
        }
        if (c != '#') {
            if (c == ',') {
                return false;
            }
            if (c != '/' && c != '=') {
                if (c == '{' || c == '}' || c == ':') {
                    return false;
                }
                if (c != ';') {
                    switch (c) {
                        case '[':
                        case ']':
                            return false;
                        case '\\':
                            break;
                        default:
                            return true;
                    }
                }
            }
        }
        p();
        return false;
    }

    final String U() {
        StringBuilder sbB = ev6.B(this.f + 1, (this.d - this.g) + 1, " at line ", " column ", " path ");
        sbB.append(N());
        return sbB.toString();
    }

    public String X() throws IOException {
        String strJ0;
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        if (iB == 14) {
            strJ0 = o0();
        } else if (iB == 12) {
            strJ0 = j0('\'');
        } else {
            if (iB != 13) {
                throw J0("a name");
            }
            strJ0 = j0('\"');
        }
        this.h = 0;
        this.n[this.m - 1] = strJ0;
        return strJ0;
    }

    public void a0() throws IOException {
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        if (iB != 7) {
            throw J0("null");
        }
        this.h = 0;
        int[] iArr = this.o;
        int i = this.m - 1;
        iArr[i] = iArr[i] + 1;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.h = 0;
        this.l[0] = 8;
        this.m = 1;
        this.a.close();
    }

    public void f() throws IOException {
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        if (iB != 3) {
            throw J0("BEGIN_ARRAY");
        }
        z0(1);
        this.o[this.m - 1] = 0;
        this.h = 0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x006c, code lost:
    
        return r5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int g0(boolean r10) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 217
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gd6.g0(boolean):int");
    }

    public boolean hasNext() throws IOException {
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        return (iB == 2 || iB == 4 || iB == 17) ? false : true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x003e, code lost:
    
        r11.d = r8;
        r8 = r8 - r3;
        r2 = r8 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0043, code lost:
    
        if (r1 != null) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0045, code lost:
    
        r1 = new java.lang.StringBuilder(java.lang.Math.max(r8 * 2, 16));
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x006c, code lost:
    
        if (r1 != null) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x006e, code lost:
    
        r1 = new java.lang.StringBuilder(java.lang.Math.max((r2 - r3) * 2, 16));
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x007c, code lost:
    
        r1.append(r7, r3, r2 - r3);
        r11.d = r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String j0(char r12) throws com.google.gson.stream.MalformedJsonException {
        /*
            r11 = this;
            r0 = 0
            r1 = r0
        L2:
            int r2 = r11.d
            int r3 = r11.e
        L6:
            r4 = r3
            r3 = r2
        L8:
            r5 = 16
            r6 = 1
            char[] r7 = r11.c
            if (r2 >= r4) goto L6c
            int r8 = r2 + 1
            char r2 = r7[r2]
            euc r9 = r11.b
            euc r10 = defpackage.euc.STRICT
            if (r9 != r10) goto L24
            r9 = 32
            if (r2 < r9) goto L1e
            goto L24
        L1e:
            java.lang.String r12 = "Unescaped control characters (\\u0000-\\u001F) are not allowed in strict mode"
            r11.I0(r12)
            throw r0
        L24:
            if (r2 != r12) goto L3a
            r11.d = r8
            int r8 = r8 - r3
            int r8 = r8 - r6
            if (r1 != 0) goto L32
            java.lang.String r11 = new java.lang.String
            r11.<init>(r7, r3, r8)
            return r11
        L32:
            r1.append(r7, r3, r8)
            java.lang.String r11 = r1.toString()
            return r11
        L3a:
            r9 = 92
            if (r2 != r9) goto L5f
            r11.d = r8
            int r8 = r8 - r3
            int r2 = r8 + (-1)
            if (r1 != 0) goto L50
            int r8 = r8 * 2
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            int r4 = java.lang.Math.max(r8, r5)
            r1.<init>(r4)
        L50:
            r1.append(r7, r3, r2)
            char r2 = r11.A0()
            r1.append(r2)
            int r2 = r11.d
            int r3 = r11.e
            goto L6
        L5f:
            r5 = 10
            if (r2 != r5) goto L6a
            int r2 = r11.f
            int r2 = r2 + r6
            r11.f = r2
            r11.g = r8
        L6a:
            r2 = r8
            goto L8
        L6c:
            if (r1 != 0) goto L7c
            int r1 = r2 - r3
            int r1 = r1 * 2
            java.lang.StringBuilder r4 = new java.lang.StringBuilder
            int r1 = java.lang.Math.max(r1, r5)
            r4.<init>(r1)
            r1 = r4
        L7c:
            int r4 = r2 - r3
            r1.append(r7, r3, r4)
            r11.d = r2
            boolean r2 = r11.L(r6)
            if (r2 == 0) goto L8b
            goto L2
        L8b:
            java.lang.String r12 = "Unterminated string"
            r11.I0(r12)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gd6.j0(char):java.lang.String");
    }

    public void m() throws IOException {
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        if (iB != 1) {
            throw J0("BEGIN_OBJECT");
        }
        z0(3);
        this.h = 0;
    }

    public boolean nextBoolean() throws IOException {
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        if (iB == 5) {
            this.h = 0;
            int[] iArr = this.o;
            int i = this.m - 1;
            iArr[i] = iArr[i] + 1;
            return true;
        }
        if (iB != 6) {
            throw J0("a boolean");
        }
        this.h = 0;
        int[] iArr2 = this.o;
        int i2 = this.m - 1;
        iArr2[i2] = iArr2[i2] + 1;
        return false;
    }

    public double nextDouble() throws IOException {
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        if (iB == 15) {
            this.h = 0;
            int[] iArr = this.o;
            int i = this.m - 1;
            iArr[i] = iArr[i] + 1;
            return this.i;
        }
        if (iB == 16) {
            this.k = new String(this.c, this.d, this.j);
            this.d += this.j;
        } else if (iB == 8 || iB == 9) {
            this.k = j0(iB == 8 ? '\'' : '\"');
        } else if (iB == 10) {
            this.k = o0();
        } else if (iB != 11) {
            throw J0("a double");
        }
        this.h = 11;
        double d = Double.parseDouble(this.k);
        if (this.b != euc.LENIENT && (Double.isNaN(d) || Double.isInfinite(d))) {
            I0("JSON forbids NaN and infinities: " + d);
            throw null;
        }
        this.k = null;
        this.h = 0;
        int[] iArr2 = this.o;
        int i2 = this.m - 1;
        iArr2[i2] = iArr2[i2] + 1;
        return d;
    }

    public int nextInt() throws IOException {
        String strJ0;
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        if (iB == 15) {
            long j = this.i;
            int i = (int) j;
            if (j == i) {
                this.h = 0;
                int[] iArr = this.o;
                int i2 = this.m - 1;
                iArr[i2] = iArr[i2] + 1;
                return i;
            }
            throw new NumberFormatException("Expected an int but was " + this.i + U());
        }
        if (iB == 16) {
            this.k = new String(this.c, this.d, this.j);
            this.d += this.j;
        } else {
            if (iB != 8 && iB != 9 && iB != 10) {
                throw J0("an int");
            }
            if (iB == 10) {
                strJ0 = o0();
                this.k = strJ0;
            } else {
                strJ0 = j0(iB == 8 ? '\'' : '\"');
                this.k = strJ0;
            }
            K0(strJ0);
            try {
                int i3 = Integer.parseInt(this.k);
                this.h = 0;
                int[] iArr2 = this.o;
                int i4 = this.m - 1;
                iArr2[i4] = iArr2[i4] + 1;
                return i3;
            } catch (NumberFormatException unused) {
            }
        }
        this.h = 11;
        double d = Double.parseDouble(this.k);
        int i5 = (int) d;
        if (i5 != d) {
            ay0.f("Expected an int but was ", this.k, U());
            return 0;
        }
        this.k = null;
        this.h = 0;
        int[] iArr3 = this.o;
        int i6 = this.m - 1;
        iArr3[i6] = iArr3[i6] + 1;
        return i5;
    }

    public long nextLong() throws IOException {
        String strJ0;
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        if (iB == 15) {
            this.h = 0;
            int[] iArr = this.o;
            int i = this.m - 1;
            iArr[i] = iArr[i] + 1;
            return this.i;
        }
        if (iB == 16) {
            this.k = new String(this.c, this.d, this.j);
            this.d += this.j;
        } else {
            if (iB != 8 && iB != 9 && iB != 10) {
                throw J0("a long");
            }
            if (iB == 10) {
                strJ0 = o0();
                this.k = strJ0;
            } else {
                strJ0 = j0(iB == 8 ? '\'' : '\"');
                this.k = strJ0;
            }
            K0(strJ0);
            try {
                long j = Long.parseLong(this.k);
                this.h = 0;
                int[] iArr2 = this.o;
                int i2 = this.m - 1;
                iArr2[i2] = iArr2[i2] + 1;
                return j;
            } catch (NumberFormatException unused) {
            }
        }
        this.h = 11;
        double d = Double.parseDouble(this.k);
        long j2 = (long) d;
        if (j2 != d) {
            ay0.f("Expected a long but was ", this.k, U());
            return 0L;
        }
        this.k = null;
        this.h = 0;
        int[] iArr3 = this.o;
        int i3 = this.m - 1;
        iArr3[i3] = iArr3[i3] + 1;
        return j2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x0048, code lost:
    
        p();
     */
    /* JADX WARN: Failed to find 'out' block for switch in B:32:0x0042. Please report as an issue. */
    /* JADX WARN: Removed duplicated region for block: B:47:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0082  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String o0() throws com.google.gson.stream.MalformedJsonException {
        /*
            r6 = this;
            r0 = 0
            r1 = 0
        L2:
            r2 = r1
        L3:
            int r3 = r6.d
            int r3 = r3 + r2
            int r4 = r6.e
            char[] r5 = r6.c
            if (r3 >= r4) goto L4c
            char r3 = r5[r3]
            r4 = 9
            if (r3 == r4) goto L58
            r4 = 10
            if (r3 == r4) goto L58
            r4 = 12
            if (r3 == r4) goto L58
            r4 = 13
            if (r3 == r4) goto L58
            r4 = 32
            if (r3 == r4) goto L58
            r4 = 35
            if (r3 == r4) goto L48
            r4 = 44
            if (r3 == r4) goto L58
            r4 = 47
            if (r3 == r4) goto L48
            r4 = 61
            if (r3 == r4) goto L48
            r4 = 123(0x7b, float:1.72E-43)
            if (r3 == r4) goto L58
            r4 = 125(0x7d, float:1.75E-43)
            if (r3 == r4) goto L58
            r4 = 58
            if (r3 == r4) goto L58
            r4 = 59
            if (r3 == r4) goto L48
            switch(r3) {
                case 91: goto L58;
                case 92: goto L48;
                case 93: goto L58;
                default: goto L45;
            }
        L45:
            int r2 = r2 + 1
            goto L3
        L48:
            r6.p()
            goto L58
        L4c:
            int r3 = r5.length
            if (r2 >= r3) goto L5a
            int r3 = r2 + 1
            boolean r3 = r6.L(r3)
            if (r3 == 0) goto L58
            goto L3
        L58:
            r1 = r2
            goto L78
        L5a:
            if (r0 != 0) goto L67
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r3 = 16
            int r3 = java.lang.Math.max(r2, r3)
            r0.<init>(r3)
        L67:
            int r3 = r6.d
            r0.append(r5, r3, r2)
            int r3 = r6.d
            int r3 = r3 + r2
            r6.d = r3
            r2 = 1
            boolean r2 = r6.L(r2)
            if (r2 != 0) goto L2
        L78:
            int r2 = r6.d
            if (r0 != 0) goto L82
            java.lang.String r0 = new java.lang.String
            r0.<init>(r5, r2, r1)
            goto L89
        L82:
            r0.append(r5, r2, r1)
            java.lang.String r0 = r0.toString()
        L89:
            int r2 = r6.d
            int r2 = r2 + r1
            r6.d = r2
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gd6.o0():java.lang.String");
    }

    public final void p() throws MalformedJsonException {
        if (this.b == euc.LENIENT) {
            return;
        }
        I0("Use JsonReader.setStrictness(Strictness.LENIENT) to accept malformed JSON");
        throw null;
    }

    public jd6 p0() throws IOException {
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        switch (iB) {
            case 1:
                return jd6.BEGIN_OBJECT;
            case 2:
                return jd6.END_OBJECT;
            case 3:
                return jd6.BEGIN_ARRAY;
            case 4:
                return jd6.END_ARRAY;
            case 5:
            case 6:
                return jd6.BOOLEAN;
            case 7:
                return jd6.NULL;
            case 8:
            case 9:
            case 10:
            case 11:
                return jd6.STRING;
            case 12:
            case 13:
            case 14:
                return jd6.NAME;
            case 15:
            case 16:
                return jd6.NUMBER;
            case 17:
                return jd6.END_DOCUMENT;
            default:
                ywb.d();
                return null;
        }
    }

    public String q() throws IOException {
        String str;
        int iB = this.h;
        if (iB == 0) {
            iB = B();
        }
        if (iB == 10) {
            str = o0();
        } else if (iB == 8) {
            str = j0('\'');
        } else if (iB == 9) {
            str = j0('\"');
        } else if (iB == 11) {
            str = this.k;
            this.k = null;
        } else if (iB == 15) {
            str = Long.toString(this.i);
        } else {
            if (iB != 16) {
                throw J0("a string");
            }
            str = new String(this.c, this.d, this.j);
            this.d += this.j;
        }
        this.h = 0;
        int[] iArr = this.o;
        int i = this.m - 1;
        iArr[i] = iArr[i] + 1;
        return str;
    }

    public String toString() {
        return getClass().getSimpleName().concat(U());
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public void v() throws IOException {
        int i = 0;
        do {
            int iB = this.h;
            if (iB == 0) {
                iB = B();
            }
            switch (iB) {
                case 1:
                    z0(3);
                    i++;
                    this.h = 0;
                    break;
                case 2:
                    if (i == 0) {
                        this.n[this.m - 1] = null;
                    }
                    this.m--;
                    i--;
                    this.h = 0;
                    break;
                case 3:
                    z0(1);
                    i++;
                    this.h = 0;
                    break;
                case 4:
                    this.m--;
                    i--;
                    this.h = 0;
                    break;
                case 5:
                case 6:
                case 7:
                case 11:
                case 15:
                default:
                    this.h = 0;
                    break;
                case 8:
                    F0('\'');
                    this.h = 0;
                    break;
                case 9:
                    F0('\"');
                    this.h = 0;
                    break;
                case 10:
                    H0();
                    this.h = 0;
                    break;
                case 12:
                    F0('\'');
                    if (i == 0) {
                        this.n[this.m - 1] = "<skipped>";
                    }
                    this.h = 0;
                    break;
                case 13:
                    F0('\"');
                    if (i == 0) {
                        this.n[this.m - 1] = "<skipped>";
                    }
                    this.h = 0;
                    break;
                case 14:
                    H0();
                    if (i == 0) {
                        this.n[this.m - 1] = "<skipped>";
                    }
                    this.h = 0;
                    break;
                case 16:
                    this.d += this.j;
                    this.h = 0;
                    break;
                case 17:
                    break;
            }
            return;
        } while (i > 0);
        int[] iArr = this.o;
        int i2 = this.m - 1;
        iArr[i2] = iArr[i2] + 1;
    }

    public final void z0(int i) throws MalformedJsonException {
        int i2 = this.m;
        if (i2 - 1 >= 255) {
            throw new MalformedJsonException("Nesting limit 255 reached".concat(U()));
        }
        int[] iArr = this.l;
        if (i2 == iArr.length) {
            int i3 = i2 * 2;
            this.l = Arrays.copyOf(iArr, i3);
            this.o = Arrays.copyOf(this.o, i3);
            this.n = (String[]) Arrays.copyOf(this.n, i3);
        }
        int[] iArr2 = this.l;
        int i4 = this.m;
        this.m = i4 + 1;
        iArr2[i4] = i;
    }

    public final char A0() throws MalformedJsonException {
        int i;
        if (this.d == this.e && !L(1)) {
            I0("Unterminated escape sequence");
            throw null;
        }
        int i2 = this.d;
        int i3 = i2 + 1;
        this.d = i3;
        char[] cArr = this.c;
        char c = cArr[i2];
        if (c != '\n') {
            if (c != '\"') {
                if (c != '\'') {
                    if (c != '/' && c != '\\') {
                        if (c == 'b') {
                            return '\b';
                        }
                        if (c == 'f') {
                            return '\f';
                        }
                        if (c == 'n') {
                            return '\n';
                        }
                        if (c == 'r') {
                            return '\r';
                        }
                        if (c == 't') {
                            return '\t';
                        }
                        if (c != 'u') {
                            I0("Invalid escape sequence");
                            throw null;
                        }
                        if (i2 + 5 > this.e && !L(4)) {
                            I0("Unterminated escape sequence");
                            throw null;
                        }
                        int i4 = this.d;
                        int i5 = i4 + 4;
                        int i6 = 0;
                        while (i4 < i5) {
                            char c2 = cArr[i4];
                            int i7 = i6 << 4;
                            if (c2 >= '0' && c2 <= '9') {
                                i = c2 - '0';
                            } else if (c2 >= 'a' && c2 <= 'f') {
                                i = c2 - 'W';
                            } else {
                                if (c2 < 'A' || c2 > 'F') {
                                    I0("Malformed Unicode escape \\u".concat(new String(cArr, this.d, 4)));
                                    throw null;
                                }
                                i = c2 - '7';
                            }
                            i6 = i + i7;
                            i4++;
                        }
                        this.d += 4;
                        return (char) i6;
                    }
                }
            }
            return c;
        }
        if (this.b == euc.STRICT) {
            I0(HrUBqHumRuLe.CewLaGuVsojiXVb);
            throw null;
        }
        this.f++;
        this.g = i3;
        if (this.b == euc.STRICT) {
            I0("Invalid escaped character \"'\" in strict mode");
            throw null;
        }
        return c;
    }

    /* JADX WARN: Code restructure failed: missing block: B:145:0x01d2, code lost:
    
        r24 = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:173:0x0227, code lost:
    
        if (T(r14) != false) goto L125;
     */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0189 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:120:0x018a  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x01ba  */
    /* JADX WARN: Removed duplicated region for block: B:209:0x0277  */
    /* JADX WARN: Removed duplicated region for block: B:213:0x0283 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:214:0x0284  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int B() throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 818
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gd6.B():int");
    }

    public final IllegalStateException J0(String str) {
        String str2;
        if (p0() == jd6.NULL) {
            str2 = "adapter-not-null-safe";
        } else {
            str2 = "unexpected-json-structure";
        }
        StringBuilder sbU = lv8.u("Expected ", str, " but was ");
        sbU.append(p0());
        sbU.append(U());
        sbU.append(CspinKvYN.JkLf);
        sbU.append("https://github.com/google/gson/blob/main/Troubleshooting.md#".concat(str2));
        return new IllegalStateException(sbU.toString());
    }
}
