package defpackage;

import java.io.EOFException;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class td6 extends id6 {
    public static final h21 l;
    public static final h21 m;
    public static final h21 n;
    public final yua f;
    public final kz0 g;
    public int h;
    public long i;
    public int j;
    public String k;

    static {
        h21 h21Var = h21.d;
        l = dq1.o("'\\");
        m = dq1.o("\"\\");
        n = dq1.o("{}[]:, \n\t\r\f/\\;#=");
        dq1.o("\n\r");
        dq1.o("*/");
    }

    public td6(yua yuaVar) {
        this.b = new int[32];
        this.c = new String[32];
        this.d = new int[32];
        this.h = 0;
        this.f = yuaVar;
        this.g = yuaVar.b;
        L(6);
    }

    public final char A0() throws EOFException, kc6 {
        int i;
        yua yuaVar = this.f;
        if (!yuaVar.request(1L)) {
            R("Unterminated escape sequence");
            throw null;
        }
        kz0 kz0Var = this.g;
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
        if (!yuaVar.request(4L)) {
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

    @Override // defpackage.id6
    public final void B() {
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        if (iU != 2) {
            StringBuilder sb = new StringBuilder("Expected END_OBJECT but was ");
            sb.append(I());
            rd6.k(sb, D());
            return;
        }
        int i = this.a;
        int i2 = i - 1;
        this.a = i2;
        this.c[i2] = null;
        int[] iArr = this.d;
        int i3 = i - 2;
        iArr[i3] = iArr[i3] + 1;
        this.h = 0;
    }

    public final void E0(h21 h21Var) throws EOFException, kc6 {
        while (true) {
            long jO = this.f.O(h21Var);
            if (jO == -1) {
                R("Unterminated string");
                throw null;
            }
            kz0 kz0Var = this.g;
            if (kz0Var.L(jO) != 92) {
                kz0Var.skip(jO + 1);
                return;
            } else {
                kz0Var.skip(jO + 1);
                A0();
            }
        }
    }

    @Override // defpackage.id6
    public final ed6 I() throws EOFException, kc6 {
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        switch (iU) {
            case 1:
                return ed6.BEGIN_OBJECT;
            case 2:
                return ed6.END_OBJECT;
            case 3:
                return ed6.BEGIN_ARRAY;
            case 4:
                return ed6.END_ARRAY;
            case 5:
            case 6:
                return ed6.BOOLEAN;
            case 7:
                return ed6.NULL;
            case 8:
            case 9:
            case 10:
            case 11:
                return ed6.STRING;
            case 12:
            case 13:
            case 14:
            case 15:
                return ed6.NAME;
            case 16:
            case 17:
                return ed6.NUMBER;
            case 18:
                return ed6.END_DOCUMENT;
            default:
                ywb.d();
                return null;
        }
    }

    @Override // defpackage.id6
    public final int N(hx4 hx4Var) {
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        if (iU < 12 || iU > 15) {
            return -1;
        }
        if (iU == 15) {
            return g0(this.k, hx4Var);
        }
        int iW = this.f.w((dw8) hx4Var.c);
        if (iW != -1) {
            this.h = 0;
            this.c[this.a - 1] = ((String[]) hx4Var.b)[iW];
            return iW;
        }
        String str = this.c[this.a - 1];
        String strX = X();
        int iG0 = g0(strX, hx4Var);
        if (iG0 == -1) {
            this.h = 15;
            this.k = strX;
            this.c[this.a - 1] = str;
        }
        return iG0;
    }

    @Override // defpackage.id6
    public final void Q() {
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 14) {
            long jO = this.f.O(n);
            kz0 kz0Var = this.g;
            if (jO == -1) {
                jO = kz0Var.b;
            }
            kz0Var.skip(jO);
        } else if (iU == 13) {
            E0(m);
        } else if (iU == 12) {
            E0(l);
        } else if (iU != 15) {
            StringBuilder sb = new StringBuilder("Expected a name but was ");
            sb.append(I());
            rd6.k(sb, D());
            return;
        }
        this.h = 0;
        this.c[this.a - 1] = "null";
    }

    public final void T() throws kc6 {
        R("Use JsonReader.setLenient(true) to accept malformed JSON");
        throw null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:135:0x01a2, code lost:
    
        if (j0(r10) != false) goto L113;
     */
    /* JADX WARN: Code restructure failed: missing block: B:136:0x01a4, code lost:
    
        if (r1 != 2) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x01a6, code lost:
    
        if (r4 == 0) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:139:0x01ac, code lost:
    
        if (r8 != Long.MIN_VALUE) goto L141;
     */
    /* JADX WARN: Code restructure failed: missing block: B:140:0x01ae, code lost:
    
        if (r13 == 0) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:142:0x01b2, code lost:
    
        if (r8 != r18) goto L144;
     */
    /* JADX WARN: Code restructure failed: missing block: B:143:0x01b4, code lost:
    
        if (r13 != 0) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:144:0x01b6, code lost:
    
        if (r13 == 0) goto L146;
     */
    /* JADX WARN: Code restructure failed: missing block: B:146:0x01b9, code lost:
    
        r8 = -r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:147:0x01ba, code lost:
    
        r23.i = r8;
        r7.skip(r2);
        r9 = 16;
        r23.h = 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:148:0x01c5, code lost:
    
        if (r1 == 2) goto L153;
     */
    /* JADX WARN: Code restructure failed: missing block: B:150:0x01c8, code lost:
    
        if (r1 == 4) goto L153;
     */
    /* JADX WARN: Code restructure failed: missing block: B:152:0x01cb, code lost:
    
        if (r1 != 7) goto L113;
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x01cd, code lost:
    
        r23.j = r2;
        r9 = 17;
        r23.h = 17;
     */
    /* JADX WARN: Removed duplicated region for block: B:172:0x01fa A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:173:0x01fb  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x011f A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0120  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int U() throws java.io.EOFException, defpackage.kc6 {
        /*
            Method dump skipped, instruction units count: 665
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.td6.U():int");
    }

    public final String X() {
        String strP0;
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 14) {
            strP0 = z0();
        } else if (iU == 13) {
            strP0 = p0(m);
        } else if (iU == 12) {
            strP0 = p0(l);
        } else {
            if (iU != 15) {
                StringBuilder sb = new StringBuilder("Expected a name but was ");
                sb.append(I());
                rd6.k(sb, D());
                return null;
            }
            strP0 = this.k;
        }
        this.h = 0;
        this.c[this.a - 1] = strP0;
        return strP0;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.h = 0;
        this.b[0] = 8;
        this.a = 1;
        this.g.B();
        this.f.close();
    }

    @Override // defpackage.id6
    public final void f() {
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 3) {
            L(1);
            this.d[this.a - 1] = 0;
            this.h = 0;
        } else {
            StringBuilder sb = new StringBuilder("Expected BEGIN_ARRAY but was ");
            sb.append(I());
            rd6.k(sb, D());
        }
    }

    public final int g0(String str, hx4 hx4Var) {
        int length = ((String[]) hx4Var.b).length;
        for (int i = 0; i < length; i++) {
            if (str.equals(((String[]) hx4Var.b)[i])) {
                this.h = 0;
                this.c[this.a - 1] = str;
                return i;
            }
        }
        return -1;
    }

    @Override // defpackage.id6
    public final boolean hasNext() throws EOFException, kc6 {
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        return (iU == 2 || iU == 4 || iU == 18) ? false : true;
    }

    public final boolean j0(int i) throws kc6 {
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
        throw null;
    }

    @Override // defpackage.id6
    public final void m() {
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 1) {
            L(3);
            this.h = 0;
        } else {
            StringBuilder sb = new StringBuilder("Expected BEGIN_OBJECT but was ");
            sb.append(I());
            rd6.k(sb, D());
        }
    }

    @Override // defpackage.id6
    public final boolean nextBoolean() {
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 5) {
            this.h = 0;
            int[] iArr = this.d;
            int i = this.a - 1;
            iArr[i] = iArr[i] + 1;
            return true;
        }
        if (iU != 6) {
            StringBuilder sb = new StringBuilder("Expected a boolean but was ");
            sb.append(I());
            rd6.k(sb, D());
            return false;
        }
        this.h = 0;
        int[] iArr2 = this.d;
        int i2 = this.a - 1;
        iArr2[i2] = iArr2[i2] + 1;
        return false;
    }

    @Override // defpackage.id6
    public final double nextDouble() throws EOFException, kc6 {
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 16) {
            this.h = 0;
            int[] iArr = this.d;
            int i = this.a - 1;
            iArr[i] = iArr[i] + 1;
            return this.i;
        }
        if (iU == 17) {
            long j = this.j;
            kz0 kz0Var = this.g;
            kz0Var.getClass();
            this.k = kz0Var.F0(j, wk1.a);
        } else if (iU == 9) {
            this.k = p0(m);
        } else if (iU == 8) {
            this.k = p0(l);
        } else if (iU == 10) {
            this.k = z0();
        } else if (iU != 11) {
            StringBuilder sb = new StringBuilder("Expected a double but was ");
            sb.append(I());
            rd6.k(sb, D());
            return 0.0d;
        }
        this.h = 11;
        try {
            double d = Double.parseDouble(this.k);
            if (Double.isNaN(d) || Double.isInfinite(d)) {
                throw new kc6("JSON forbids NaN and infinities: " + d + " at path " + D());
            }
            this.k = null;
            this.h = 0;
            int[] iArr2 = this.d;
            int i2 = this.a - 1;
            iArr2[i2] = iArr2[i2] + 1;
            return d;
        } catch (NumberFormatException unused) {
            throw new h22("Expected a double but was " + this.k + " at path " + D());
        }
    }

    @Override // defpackage.id6
    public final int nextInt() {
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 16) {
            long j = this.i;
            int i = (int) j;
            if (j == i) {
                this.h = 0;
                int[] iArr = this.d;
                int i2 = this.a - 1;
                iArr[i2] = iArr[i2] + 1;
                return i;
            }
            throw new h22("Expected an int but was " + this.i + " at path " + D());
        }
        if (iU == 17) {
            long j2 = this.j;
            kz0 kz0Var = this.g;
            kz0Var.getClass();
            this.k = kz0Var.F0(j2, wk1.a);
        } else if (iU == 9 || iU == 8) {
            String strP0 = iU == 9 ? p0(m) : p0(l);
            this.k = strP0;
            try {
                int i3 = Integer.parseInt(strP0);
                this.h = 0;
                int[] iArr2 = this.d;
                int i4 = this.a - 1;
                iArr2[i4] = iArr2[i4] + 1;
                return i3;
            } catch (NumberFormatException unused) {
            }
        } else if (iU != 11) {
            StringBuilder sb = new StringBuilder("Expected an int but was ");
            sb.append(I());
            rd6.k(sb, D());
            return 0;
        }
        this.h = 11;
        try {
            double d = Double.parseDouble(this.k);
            int i5 = (int) d;
            if (i5 == d) {
                this.k = null;
                this.h = 0;
                int[] iArr3 = this.d;
                int i6 = this.a - 1;
                iArr3[i6] = iArr3[i6] + 1;
                return i5;
            }
            throw new h22("Expected an int but was " + this.k + " at path " + D());
        } catch (NumberFormatException unused2) {
            throw new h22("Expected an int but was " + this.k + " at path " + D());
        }
    }

    public final int o0(boolean z) throws EOFException, kc6 {
        int i = 0;
        while (true) {
            int i2 = i + 1;
            yua yuaVar = this.f;
            if (!yuaVar.request(i2)) {
                if (z) {
                    throw new EOFException("End of input");
                }
                return -1;
            }
            long j = i;
            kz0 kz0Var = this.g;
            byte bL = kz0Var.L(j);
            if (bL != 10 && bL != 32 && bL != 13 && bL != 9) {
                kz0Var.skip(j);
                if (bL == 47) {
                    if (yuaVar.request(2L)) {
                        T();
                        throw null;
                    }
                } else if (bL == 35) {
                    T();
                    throw null;
                }
                return bL;
            }
            i = i2;
        }
    }

    @Override // defpackage.id6
    public final void p() {
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        if (iU != 4) {
            StringBuilder sb = new StringBuilder("Expected END_ARRAY but was ");
            sb.append(I());
            rd6.k(sb, D());
        } else {
            int i = this.a;
            this.a = i - 1;
            int[] iArr = this.d;
            int i2 = i - 2;
            iArr[i2] = iArr[i2] + 1;
            this.h = 0;
        }
    }

    public final String p0(h21 h21Var) throws EOFException, kc6 {
        StringBuilder sb = null;
        while (true) {
            long jO = this.f.O(h21Var);
            if (jO == -1) {
                R("Unterminated string");
                throw null;
            }
            kz0 kz0Var = this.g;
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
            sb.append(A0());
        }
    }

    @Override // defpackage.id6
    public final String q() {
        String strF0;
        int iU = this.h;
        if (iU == 0) {
            iU = U();
        }
        if (iU == 10) {
            strF0 = z0();
        } else if (iU == 9) {
            strF0 = p0(m);
        } else if (iU == 8) {
            strF0 = p0(l);
        } else if (iU == 11) {
            strF0 = this.k;
            this.k = null;
        } else if (iU == 16) {
            strF0 = Long.toString(this.i);
        } else {
            if (iU != 17) {
                StringBuilder sb = new StringBuilder("Expected a string but was ");
                sb.append(I());
                rd6.k(sb, D());
                return null;
            }
            long j = this.j;
            kz0 kz0Var = this.g;
            kz0Var.getClass();
            strF0 = kz0Var.F0(j, wk1.a);
        }
        this.h = 0;
        int[] iArr = this.d;
        int i = this.a - 1;
        iArr[i] = iArr[i] + 1;
        return strF0;
    }

    public final String toString() {
        return "JsonReader(" + this.f + ")";
    }

    @Override // defpackage.id6
    public final void v() {
        int i = 0;
        do {
            int iU = this.h;
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
                        rd6.k(sb, D());
                        return;
                    }
                    this.a--;
                } else if (iU == 2) {
                    i--;
                    if (i < 0) {
                        StringBuilder sb2 = new StringBuilder("Expected a value but was ");
                        sb2.append(I());
                        rd6.k(sb2, D());
                        return;
                    }
                    this.a--;
                } else {
                    kz0 kz0Var = this.g;
                    if (iU == 14 || iU == 10) {
                        long jO = this.f.O(n);
                        if (jO == -1) {
                            jO = kz0Var.b;
                        }
                        kz0Var.skip(jO);
                    } else if (iU == 9 || iU == 13) {
                        E0(m);
                    } else if (iU == 8 || iU == 12) {
                        E0(l);
                    } else if (iU == 17) {
                        kz0Var.skip(this.j);
                    } else if (iU == 18) {
                        StringBuilder sb3 = new StringBuilder("Expected a value but was ");
                        sb3.append(I());
                        rd6.k(sb3, D());
                        return;
                    }
                }
                this.h = 0;
            }
            i++;
            this.h = 0;
        } while (i != 0);
        int[] iArr = this.d;
        int i2 = this.a - 1;
        iArr[i2] = iArr[i2] + 1;
        this.c[i2] = "null";
    }

    public final String z0() {
        long jO = this.f.O(n);
        kz0 kz0Var = this.g;
        if (jO == -1) {
            return kz0Var.G0();
        }
        kz0Var.getClass();
        return kz0Var.F0(jO, wk1.a);
    }
}
