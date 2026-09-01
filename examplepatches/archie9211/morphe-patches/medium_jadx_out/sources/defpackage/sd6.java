package defpackage;

import com.squareup.moshi.JsonDataException;
import com.squareup.moshi.JsonEncodingException;
import java.io.EOFException;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class sd6 extends hd6 {
    public static final h21 k;
    public static final h21 l;
    public static final h21 m;
    public static final h21 n;
    public static final h21 o;
    public final zz0 e;
    public final kz0 f;
    public int g;
    public long h;
    public int i;
    public String j;

    static {
        h21 h21Var = h21.d;
        k = dq1.o("'\\");
        l = dq1.o("\"\\");
        m = dq1.o("{}[]:, \n\t\r\f/\\;#=");
        n = dq1.o("\n\r");
        o = dq1.o("*/");
    }

    public sd6(zz0 zz0Var) {
        this.b = new int[32];
        this.c = new String[32];
        this.d = new int[32];
        this.g = 0;
        this.e = zz0Var;
        this.f = zz0Var.a();
        L(6);
    }

    public final String A0() {
        long jO = this.e.O(m);
        kz0 kz0Var = this.f;
        if (jO == -1) {
            return kz0Var.G0();
        }
        kz0Var.getClass();
        return kz0Var.F0(jO, wk1.a);
    }

    @Override // defpackage.hd6
    public final void B() throws EOFException, JsonEncodingException {
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        if (iU != 2) {
            StringBuilder sb = new StringBuilder("Expected END_OBJECT but was ");
            sb.append(I());
            rd6.q(sb, D());
            return;
        }
        int i = this.a;
        int i2 = i - 1;
        this.a = i2;
        this.c[i2] = null;
        int[] iArr = this.d;
        int i3 = i - 2;
        iArr[i3] = iArr[i3] + 1;
        this.g = 0;
    }

    public final char E0() throws EOFException, JsonEncodingException {
        int i;
        zz0 zz0Var = this.e;
        if (!zz0Var.request(1L)) {
            R("Unterminated escape sequence");
            throw null;
        }
        kz0 kz0Var = this.f;
        byte b = kz0Var.readByte();
        if (b == 10 || b == 34 || b == 39 || b == 47 || b == 92) {
            return (char) b;
        }
        if (b == 98) {
            return '\b';
        }
        if (b == 102) {
            return '\f';
        }
        if (b == 110) {
            return '\n';
        }
        if (b == 114) {
            return '\r';
        }
        if (b == 116) {
            return '\t';
        }
        if (b != 117) {
            R("Invalid escape sequence: \\" + ((char) b));
            throw null;
        }
        if (!zz0Var.request(4L)) {
            throw new EOFException("Unterminated escape sequence at path ".concat(D()));
        }
        char c = 0;
        for (int i2 = 0; i2 < 4; i2++) {
            byte bL = kz0Var.L(i2);
            char c2 = (char) (c << 4);
            if (bL >= 48 && bL <= 57) {
                i = bL - 48;
            } else if (bL >= 97 && bL <= 102) {
                i = bL - 87;
            } else {
                if (bL < 65 || bL > 70) {
                    R("\\u".concat(kz0Var.F0(4L, wk1.a)));
                    throw null;
                }
                i = bL - 55;
            }
            c = (char) (i + c2);
        }
        kz0Var.skip(4L);
        return c;
    }

    public final void F0(h21 h21Var) throws EOFException, JsonEncodingException {
        while (true) {
            long jO = this.e.O(h21Var);
            if (jO == -1) {
                R("Unterminated string");
                throw null;
            }
            kz0 kz0Var = this.f;
            if (kz0Var.L(jO) != 92) {
                kz0Var.skip(jO + 1);
                return;
            } else {
                kz0Var.skip(jO + 1);
                E0();
            }
        }
    }

    @Override // defpackage.hd6
    public final dd6 I() throws EOFException, JsonEncodingException {
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        switch (iU) {
            case 1:
                return dd6.BEGIN_OBJECT;
            case 2:
                return dd6.END_OBJECT;
            case 3:
                return dd6.BEGIN_ARRAY;
            case 4:
                return dd6.END_ARRAY;
            case 5:
            case 6:
                return dd6.BOOLEAN;
            case 7:
                return dd6.NULL;
            case 8:
            case 9:
            case 10:
            case 11:
                return dd6.STRING;
            case 12:
            case 13:
            case 14:
            case 15:
                return dd6.NAME;
            case 16:
            case 17:
                return dd6.NUMBER;
            case 18:
                return dd6.END_DOCUMENT;
            default:
                ywb.d();
                return null;
        }
    }

    @Override // defpackage.hd6
    public final int N(gg5 gg5Var) throws EOFException, JsonEncodingException {
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        if (iU < 12 || iU > 15) {
            return -1;
        }
        if (iU == 15) {
            return g0(this.j, gg5Var);
        }
        int iW = this.e.w((dw8) gg5Var.c);
        if (iW != -1) {
            this.g = 0;
            this.c[this.a - 1] = ((String[]) gg5Var.b)[iW];
            return iW;
        }
        String str = this.c[this.a - 1];
        String strX = X();
        int iG0 = g0(strX, gg5Var);
        if (iG0 == -1) {
            this.g = 15;
            this.j = strX;
            this.c[this.a - 1] = str;
        }
        return iG0;
    }

    @Override // defpackage.hd6
    public final void Q() throws EOFException, JsonEncodingException {
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 14) {
            long jO = this.e.O(m);
            kz0 kz0Var = this.f;
            if (jO == -1) {
                jO = kz0Var.b;
            }
            kz0Var.skip(jO);
        } else if (iU == 13) {
            F0(l);
        } else if (iU == 12) {
            F0(k);
        } else if (iU != 15) {
            StringBuilder sb = new StringBuilder("Expected a name but was ");
            sb.append(I());
            rd6.q(sb, D());
            return;
        }
        this.g = 0;
        this.c[this.a - 1] = "null";
    }

    public final void T() throws JsonEncodingException {
        R("Use JsonReader.setLenient(true) to accept malformed JSON");
        throw null;
    }

    @Override // defpackage.hd6
    public final String X() throws EOFException, JsonEncodingException {
        String strZ0;
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 14) {
            strZ0 = A0();
        } else if (iU == 13) {
            strZ0 = z0(l);
        } else if (iU == 12) {
            strZ0 = z0(k);
        } else {
            if (iU != 15) {
                StringBuilder sb = new StringBuilder("Expected a name but was ");
                sb.append(I());
                rd6.q(sb, D());
                return null;
            }
            strZ0 = this.j;
            this.j = null;
        }
        this.g = 0;
        this.c[this.a - 1] = strZ0;
        return strZ0;
    }

    @Override // defpackage.hd6
    public final void a0() throws EOFException, JsonEncodingException {
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        if (iU != 7) {
            StringBuilder sb = new StringBuilder("Expected null but was ");
            sb.append(I());
            rd6.q(sb, D());
        } else {
            this.g = 0;
            int[] iArr = this.d;
            int i = this.a - 1;
            iArr[i] = iArr[i] + 1;
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.g = 0;
        this.b[0] = 8;
        this.a = 1;
        this.f.B();
        this.e.close();
    }

    @Override // defpackage.hd6
    public final void f() throws EOFException, JsonEncodingException {
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 3) {
            L(1);
            this.d[this.a - 1] = 0;
            this.g = 0;
        } else {
            StringBuilder sb = new StringBuilder("Expected BEGIN_ARRAY but was ");
            sb.append(I());
            rd6.q(sb, D());
        }
    }

    public final int g0(String str, gg5 gg5Var) {
        String[] strArr = (String[]) gg5Var.b;
        int length = strArr.length;
        for (int i = 0; i < length; i++) {
            if (str.equals(strArr[i])) {
                this.g = 0;
                this.c[this.a - 1] = str;
                return i;
            }
        }
        return -1;
    }

    @Override // defpackage.hd6
    public final boolean hasNext() throws EOFException, JsonEncodingException {
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        return (iU == 2 || iU == 4 || iU == 18) ? false : true;
    }

    public final int j0(String str, gg5 gg5Var) {
        int length = ((String[]) gg5Var.b).length;
        for (int i = 0; i < length; i++) {
            if (str.equals(((String[]) gg5Var.b)[i])) {
                this.g = 0;
                int[] iArr = this.d;
                int i2 = this.a - 1;
                iArr[i2] = iArr[i2] + 1;
                return i;
            }
        }
        return -1;
    }

    @Override // defpackage.hd6
    public final void m() throws EOFException, JsonEncodingException {
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 1) {
            L(3);
            this.g = 0;
        } else {
            StringBuilder sb = new StringBuilder("Expected BEGIN_OBJECT but was ");
            sb.append(I());
            rd6.q(sb, D());
        }
    }

    @Override // defpackage.hd6
    public final boolean nextBoolean() throws EOFException, JsonEncodingException {
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 5) {
            this.g = 0;
            int[] iArr = this.d;
            int i = this.a - 1;
            iArr[i] = iArr[i] + 1;
            return true;
        }
        if (iU != 6) {
            StringBuilder sb = new StringBuilder("Expected a boolean but was ");
            sb.append(I());
            rd6.q(sb, D());
            return false;
        }
        this.g = 0;
        int[] iArr2 = this.d;
        int i2 = this.a - 1;
        iArr2[i2] = iArr2[i2] + 1;
        return false;
    }

    @Override // defpackage.hd6
    public final double nextDouble() throws EOFException, JsonEncodingException {
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 16) {
            this.g = 0;
            int[] iArr = this.d;
            int i = this.a - 1;
            iArr[i] = iArr[i] + 1;
            return this.h;
        }
        if (iU == 17) {
            long j = this.i;
            kz0 kz0Var = this.f;
            kz0Var.getClass();
            this.j = kz0Var.F0(j, wk1.a);
        } else if (iU == 9) {
            this.j = z0(l);
        } else if (iU == 8) {
            this.j = z0(k);
        } else if (iU == 10) {
            this.j = A0();
        } else if (iU != 11) {
            StringBuilder sb = new StringBuilder("Expected a double but was ");
            sb.append(I());
            rd6.q(sb, D());
            return 0.0d;
        }
        this.g = 11;
        try {
            double d = Double.parseDouble(this.j);
            if (Double.isNaN(d) || Double.isInfinite(d)) {
                throw new JsonEncodingException("JSON forbids NaN and infinities: " + d + " at path " + D());
            }
            this.j = null;
            this.g = 0;
            int[] iArr2 = this.d;
            int i2 = this.a - 1;
            iArr2[i2] = iArr2[i2] + 1;
            return d;
        } catch (NumberFormatException unused) {
            rd6.i("Expected a double but was ", this.j, " at path ", D());
            return 0.0d;
        }
    }

    @Override // defpackage.hd6
    public final int nextInt() throws EOFException, JsonEncodingException {
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 16) {
            long j = this.h;
            int i = (int) j;
            if (j == i) {
                this.g = 0;
                int[] iArr = this.d;
                int i2 = this.a - 1;
                iArr[i2] = iArr[i2] + 1;
                return i;
            }
            throw new JsonDataException("Expected an int but was " + this.h + " at path " + D());
        }
        if (iU == 17) {
            long j2 = this.i;
            kz0 kz0Var = this.f;
            kz0Var.getClass();
            this.j = kz0Var.F0(j2, wk1.a);
        } else if (iU == 9 || iU == 8) {
            String strZ0 = iU == 9 ? z0(l) : z0(k);
            this.j = strZ0;
            try {
                int i3 = Integer.parseInt(strZ0);
                this.g = 0;
                int[] iArr2 = this.d;
                int i4 = this.a - 1;
                iArr2[i4] = iArr2[i4] + 1;
                return i3;
            } catch (NumberFormatException unused) {
            }
        } else if (iU != 11) {
            StringBuilder sb = new StringBuilder("Expected an int but was ");
            sb.append(I());
            rd6.q(sb, D());
            return 0;
        }
        this.g = 11;
        try {
            double d = Double.parseDouble(this.j);
            int i5 = (int) d;
            if (i5 != d) {
                rd6.i("Expected an int but was ", this.j, " at path ", D());
                return 0;
            }
            this.j = null;
            this.g = 0;
            int[] iArr3 = this.d;
            int i6 = this.a - 1;
            iArr3[i6] = iArr3[i6] + 1;
            return i5;
        } catch (NumberFormatException unused2) {
            rd6.i("Expected an int but was ", this.j, " at path ", D());
            return 0;
        }
    }

    public final boolean o0(int i) throws JsonEncodingException {
        if (i == 9 || i == 10 || i == 12 || i == 13 || i == 32) {
            return false;
        }
        if (i != 35) {
            if (i == 44) {
                return false;
            }
            if (i != 47 && i != 61) {
                if (i == 123 || i == 125 || i == 58) {
                    return false;
                }
                if (i != 59) {
                    switch (i) {
                        case 91:
                        case 93:
                            return false;
                        case 92:
                            break;
                        default:
                            return true;
                    }
                }
            }
        }
        T();
        return false;
    }

    @Override // defpackage.hd6
    public final void p() throws EOFException, JsonEncodingException {
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        if (iU != 4) {
            StringBuilder sb = new StringBuilder("Expected END_ARRAY but was ");
            sb.append(I());
            rd6.q(sb, D());
        } else {
            int i = this.a;
            this.a = i - 1;
            int[] iArr = this.d;
            int i2 = i - 2;
            iArr[i2] = iArr[i2] + 1;
            this.g = 0;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0026, code lost:
    
        r1.skip(r3);
        r2 = defpackage.sd6.n;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0031, code lost:
    
        if (r6 != 47) goto L56;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0039, code lost:
    
        if (r5.request(2) != false) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x003d, code lost:
    
        T();
        r10 = r1.L(1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0046, code lost:
    
        if (r10 == 42) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0048, code lost:
    
        if (r10 == 47) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x004b, code lost:
    
        r1.readByte();
        r1.readByte();
        r5 = r5.O(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0057, code lost:
    
        if (r5 == (-1)) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0059, code lost:
    
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x005b, code lost:
    
        r5 = r1.b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x005d, code lost:
    
        r1.skip(r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0061, code lost:
    
        r1.readByte();
        r1.readByte();
        r2 = defpackage.sd6.o;
        r5 = r5.u0(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x006f, code lost:
    
        if (r5 == (-1)) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0071, code lost:
    
        r3 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0073, code lost:
    
        r3 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0074, code lost:
    
        if (r3 == false) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0076, code lost:
    
        r5 = r5 + ((long) r2.a.length);
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x007c, code lost:
    
        r5 = r1.b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x007e, code lost:
    
        r1.skip(r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0081, code lost:
    
        if (r3 == false) goto L61;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0085, code lost:
    
        R("Unterminated comment");
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x008b, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x008e, code lost:
    
        if (r6 != 35) goto L62;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0090, code lost:
    
        T();
        r5 = r5.O(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0099, code lost:
    
        if (r5 == (-1)) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x009b, code lost:
    
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x009d, code lost:
    
        r5 = r1.b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x009f, code lost:
    
        r1.skip(r5);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int p0(boolean r13) throws java.io.EOFException, com.squareup.moshi.JsonEncodingException {
        /*
            r12 = this;
            r0 = 0
        L1:
            r1 = r0
        L2:
            int r2 = r1 + 1
            long r3 = (long) r2
            zz0 r5 = r12.e
            boolean r3 = r5.request(r3)
            if (r3 == 0) goto La8
            long r3 = (long) r1
            kz0 r1 = r12.f
            byte r6 = r1.L(r3)
            r7 = 10
            if (r6 == r7) goto La5
            r7 = 32
            if (r6 == r7) goto La5
            r7 = 13
            if (r6 == r7) goto La5
            r7 = 9
            if (r6 != r7) goto L26
            goto La5
        L26:
            r1.skip(r3)
            h21 r2 = defpackage.sd6.n
            r3 = -1
            r7 = 1
            r9 = 47
            if (r6 != r9) goto L8c
            r10 = 2
            boolean r10 = r5.request(r10)
            if (r10 != 0) goto L3d
            goto La4
        L3d:
            r12.T()
            byte r10 = r1.L(r7)
            r11 = 42
            if (r10 == r11) goto L61
            if (r10 == r9) goto L4b
            goto La4
        L4b:
            r1.readByte()
            r1.readByte()
            long r5 = r5.O(r2)
            int r2 = (r5 > r3 ? 1 : (r5 == r3 ? 0 : -1))
            if (r2 == 0) goto L5b
            long r5 = r5 + r7
            goto L5d
        L5b:
            long r5 = r1.b
        L5d:
            r1.skip(r5)
            goto L1
        L61:
            r1.readByte()
            r1.readByte()
            h21 r2 = defpackage.sd6.o
            long r5 = r5.u0(r2)
            int r3 = (r5 > r3 ? 1 : (r5 == r3 ? 0 : -1))
            if (r3 == 0) goto L73
            r3 = 1
            goto L74
        L73:
            r3 = r0
        L74:
            if (r3 == 0) goto L7c
            byte[] r2 = r2.a
            int r2 = r2.length
            long r7 = (long) r2
            long r5 = r5 + r7
            goto L7e
        L7c:
            long r5 = r1.b
        L7e:
            r1.skip(r5)
            if (r3 == 0) goto L85
            goto L1
        L85:
            java.lang.String r13 = "Unterminated comment"
            r12.R(r13)
            r12 = 0
            throw r12
        L8c:
            r9 = 35
            if (r6 != r9) goto La4
            r12.T()
            long r5 = r5.O(r2)
            int r2 = (r5 > r3 ? 1 : (r5 == r3 ? 0 : -1))
            if (r2 == 0) goto L9d
            long r5 = r5 + r7
            goto L9f
        L9d:
            long r5 = r1.b
        L9f:
            r1.skip(r5)
            goto L1
        La4:
            return r6
        La5:
            r1 = r2
            goto L2
        La8:
            if (r13 != 0) goto Lac
            r12 = -1
            return r12
        Lac:
            java.io.EOFException r12 = new java.io.EOFException
            java.lang.String r13 = "End of input"
            r12.<init>(r13)
            throw r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sd6.p0(boolean):int");
    }

    @Override // defpackage.hd6
    public final String q() throws EOFException, JsonEncodingException {
        String strF0;
        int iU = this.g;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 10) {
            strF0 = A0();
        } else if (iU == 9) {
            strF0 = z0(l);
        } else if (iU == 8) {
            strF0 = z0(k);
        } else if (iU == 11) {
            strF0 = this.j;
            this.j = null;
        } else if (iU == 16) {
            strF0 = Long.toString(this.h);
        } else {
            if (iU != 17) {
                StringBuilder sb = new StringBuilder("Expected a string but was ");
                sb.append(I());
                rd6.q(sb, D());
                return null;
            }
            long j = this.i;
            kz0 kz0Var = this.f;
            kz0Var.getClass();
            strF0 = kz0Var.F0(j, wk1.a);
        }
        this.g = 0;
        int[] iArr = this.d;
        int i = this.a - 1;
        iArr[i] = iArr[i] + 1;
        return strF0;
    }

    public final String toString() {
        return "JsonReader(" + this.e + ")";
    }

    @Override // defpackage.hd6
    public final void v() throws EOFException, JsonEncodingException {
        int i = 0;
        do {
            int iU = this.g;
            if (iU == 0) {
                iU = U();
            }
            if (iU == 3) {
                L(1);
            } else if (iU == 1) {
                L(3);
            } else {
                if (iU == 4) {
                    i--;
                    if (i < 0) {
                        StringBuilder sb = new StringBuilder("Expected a value but was ");
                        sb.append(I());
                        rd6.q(sb, D());
                        return;
                    }
                    this.a--;
                } else if (iU == 2) {
                    i--;
                    if (i < 0) {
                        StringBuilder sb2 = new StringBuilder("Expected a value but was ");
                        sb2.append(I());
                        rd6.q(sb2, D());
                        return;
                    }
                    this.a--;
                } else {
                    kz0 kz0Var = this.f;
                    if (iU == 14 || iU == 10) {
                        long jO = this.e.O(m);
                        if (jO == -1) {
                            jO = kz0Var.b;
                        }
                        kz0Var.skip(jO);
                    } else if (iU == 9 || iU == 13) {
                        F0(l);
                    } else if (iU == 8 || iU == 12) {
                        F0(k);
                    } else if (iU == 17) {
                        kz0Var.skip(this.i);
                    } else if (iU == 18) {
                        StringBuilder sb3 = new StringBuilder("Expected a value but was ");
                        sb3.append(I());
                        rd6.q(sb3, D());
                        return;
                    }
                }
                this.g = 0;
            }
            i++;
            this.g = 0;
        } while (i != 0);
        int[] iArr = this.d;
        int i2 = this.a - 1;
        iArr[i2] = iArr[i2] + 1;
        this.c[i2] = "null";
    }

    public final String z0(h21 h21Var) throws EOFException, JsonEncodingException {
        StringBuilder sb = null;
        while (true) {
            long jO = this.e.O(h21Var);
            if (jO == -1) {
                R("Unterminated string");
                throw null;
            }
            kz0 kz0Var = this.f;
            if (kz0Var.L(jO) != 92) {
                if (sb == null) {
                    String strF0 = kz0Var.F0(jO, wk1.a);
                    kz0Var.readByte();
                    return strF0;
                }
                sb.append(kz0Var.F0(jO, wk1.a));
                kz0Var.readByte();
                return sb.toString();
            }
            if (sb == null) {
                sb = new StringBuilder();
            }
            sb.append(kz0Var.F0(jO, wk1.a));
            kz0Var.readByte();
            sb.append(E0());
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:138:0x01ae, code lost:
    
        if (o0(r14) != false) goto L119;
     */
    /* JADX WARN: Code restructure failed: missing block: B:139:0x01b0, code lost:
    
        if (r4 != 2) goto L151;
     */
    /* JADX WARN: Code restructure failed: missing block: B:140:0x01b2, code lost:
    
        if (r5 == false) goto L151;
     */
    /* JADX WARN: Code restructure failed: missing block: B:142:0x01b8, code lost:
    
        if (r8 != Long.MIN_VALUE) goto L144;
     */
    /* JADX WARN: Code restructure failed: missing block: B:143:0x01ba, code lost:
    
        if (r2 == false) goto L151;
     */
    /* JADX WARN: Code restructure failed: missing block: B:145:0x01be, code lost:
    
        if (r8 != r16) goto L147;
     */
    /* JADX WARN: Code restructure failed: missing block: B:146:0x01c0, code lost:
    
        if (r2 != false) goto L151;
     */
    /* JADX WARN: Code restructure failed: missing block: B:147:0x01c2, code lost:
    
        if (r2 == false) goto L149;
     */
    /* JADX WARN: Code restructure failed: missing block: B:149:0x01c5, code lost:
    
        r8 = -r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:150:0x01c6, code lost:
    
        r24.h = r8;
        r11.skip(r1);
        r10 = 16;
        r24.g = 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:151:0x01d1, code lost:
    
        if (r4 == 2) goto L156;
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x01d4, code lost:
    
        if (r4 == 4) goto L156;
     */
    /* JADX WARN: Code restructure failed: missing block: B:155:0x01d7, code lost:
    
        if (r4 != 7) goto L119;
     */
    /* JADX WARN: Code restructure failed: missing block: B:156:0x01d9, code lost:
    
        r24.i = r1;
        r10 = 17;
        r24.g = 17;
     */
    /* JADX WARN: Removed duplicated region for block: B:175:0x0200 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:176:0x0201  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0133 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0134  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int U() throws java.io.EOFException, com.squareup.moshi.JsonEncodingException {
        /*
            Method dump skipped, instruction units count: 703
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sd6.U():int");
    }
}
