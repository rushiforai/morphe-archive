package defpackage;

import com.apollographql.apollo.exception.JsonDataException;
import com.apollographql.apollo.exception.JsonEncodingException;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a01 implements fd6 {
    public static final h21 m;
    public static final h21 n;
    public static final h21 o;
    public final zz0 a;
    public final kz0 b;
    public int c;
    public long d;
    public int e;
    public String f;
    public int[] g;
    public int h;
    public String[] i;
    public int[] j;
    public int[] k;
    public int l;

    static {
        h21 h21Var = h21.d;
        m = dq1.o("'\\");
        n = dq1.o("\"\\");
        o = dq1.o("{}[]:, \n\t\r/\\;#=");
    }

    public a01(zz0 zz0Var) {
        this.a = zz0Var;
        this.b = zz0Var.a();
        int[] iArr = new int[64];
        iArr[0] = 6;
        this.g = iArr;
        this.h = 1;
        this.i = new String[64];
        this.j = new int[64];
        int[] iArr2 = new int[64];
        iArr2[0] = 0;
        this.k = iArr2;
        this.l = 1;
    }

    public final int B(boolean z) throws EOFException {
        int i = 0;
        while (true) {
            long j = i;
            zz0 zz0Var = this.a;
            if (!zz0Var.request(j + 1)) {
                if (z) {
                    throw new EOFException("End of input");
                }
                return -1;
            }
            i++;
            kz0 kz0Var = this.b;
            byte bL = kz0Var.L(j);
            if (bL != 9 && bL != 10 && bL != 13 && bL != 32) {
                kz0Var.skip(((long) i) - 1);
                if (bL == 35) {
                    R("Malformed JSON");
                    throw null;
                }
                if (bL != 47 || !zz0Var.request(2L)) {
                    return bL;
                }
                R("Malformed JSON");
                throw null;
            }
        }
    }

    public final String D(h21 h21Var) throws EOFException {
        StringBuilder sb = null;
        while (true) {
            long jO = this.a.O(h21Var);
            if (jO == -1) {
                R("Unterminated string");
                throw null;
            }
            kz0 kz0Var = this.b;
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
            sb.append(N());
        }
    }

    public final String I() {
        long jO = this.a.O(o);
        kz0 kz0Var = this.b;
        if (jO == -1) {
            return kz0Var.G0();
        }
        kz0Var.getClass();
        return kz0Var.F0(jO, wk1.a);
    }

    public final void L(int i) {
        int i2 = this.h;
        int[] iArr = this.g;
        if (i2 == iArr.length) {
            this.g = Arrays.copyOf(iArr, iArr.length * 2);
            String[] strArr = this.i;
            this.i = (String[]) Arrays.copyOf(strArr, strArr.length * 2);
            int[] iArr2 = this.j;
            this.j = Arrays.copyOf(iArr2, iArr2.length * 2);
            int[] iArr3 = this.k;
            this.k = Arrays.copyOf(iArr3, iArr3.length * 2);
        }
        int[] iArr4 = this.g;
        int i3 = this.h;
        this.h = i3 + 1;
        iArr4[i3] = i;
    }

    public final char N() throws EOFException {
        int i;
        zz0 zz0Var = this.a;
        if (!zz0Var.request(1L)) {
            R("Unterminated escape sequence");
            throw null;
        }
        kz0 kz0Var = this.b;
        char c = (char) kz0Var.readByte();
        if (c == '\n' || c == '\"' || c == '\'' || c == '/' || c == '\\') {
            return c;
        }
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
            R("Invalid escape sequence: \\" + c);
            throw null;
        }
        if (!zz0Var.request(4L)) {
            throw new EOFException("Unterminated escape sequence at path " + h());
        }
        char c2 = 0;
        for (int i2 = 0; i2 < 4; i2++) {
            byte bL = kz0Var.L(i2);
            char c3 = (char) (c2 << 4);
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
            c2 = (char) (c3 + i);
        }
        kz0Var.skip(4L);
        return c2;
    }

    public final void Q(h21 h21Var) throws EOFException {
        while (true) {
            long jO = this.a.O(h21Var);
            if (jO == -1) {
                R("Unterminated string");
                throw null;
            }
            kz0 kz0Var = this.b;
            if (kz0Var.L(jO) != 92) {
                kz0Var.skip(jO + 1);
                return;
            } else {
                kz0Var.skip(jO + 1);
                N();
            }
        }
    }

    public final void R(String str) {
        throw new JsonEncodingException(str + " at path " + h(), null);
    }

    @Override // defpackage.fd6
    public final String X() throws EOFException {
        String strD;
        int i = this.c;
        Integer numValueOf = Integer.valueOf(i);
        if (i == 0) {
            numValueOf = null;
        }
        switch (numValueOf != null ? numValueOf.intValue() : f()) {
            case 12:
                strD = D(m);
                break;
            case 13:
                strD = D(n);
                break;
            case 14:
                strD = I();
                break;
            default:
                StringBuilder sb = new StringBuilder("Expected a name but was ");
                sb.append(peek());
                rd6.t(sb, m());
                return null;
        }
        this.c = 0;
        this.i[this.h - 1] = strD;
        return strD;
    }

    @Override // defpackage.fd6
    public final void a0() {
        int i = this.c;
        Integer numValueOf = Integer.valueOf(i);
        if (i == 0) {
            numValueOf = null;
        }
        if ((numValueOf != null ? numValueOf.intValue() : f()) != 7) {
            StringBuilder sb = new StringBuilder("Expected null but was ");
            sb.append(peek());
            rd6.t(sb, m());
        } else {
            this.c = 0;
            int[] iArr = this.j;
            int i2 = this.h - 1;
            iArr[i2] = iArr[i2] + 1;
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.c = 0;
        this.g[0] = 8;
        this.h = 1;
        this.b.B();
        this.a.close();
    }

    @Override // defpackage.fd6
    public final fd6 e() {
        int i = this.c;
        Integer numValueOf = Integer.valueOf(i);
        if (i == 0) {
            numValueOf = null;
        }
        if ((numValueOf != null ? numValueOf.intValue() : f()) != 2) {
            StringBuilder sb = new StringBuilder("Expected END_OBJECT but was ");
            sb.append(peek());
            rd6.t(sb, m());
            return null;
        }
        int i2 = this.h;
        int i3 = i2 - 1;
        this.h = i3;
        this.i[i3] = null;
        int[] iArr = this.j;
        int i4 = i2 - 2;
        iArr[i4] = iArr[i4] + 1;
        this.c = 0;
        this.l--;
        return this;
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x015b  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x01b0  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x015a A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int f() throws java.io.EOFException {
        /*
            Method dump skipped, instruction units count: 652
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a01.f():int");
    }

    @Override // defpackage.fd6
    public final ArrayList h() {
        String str;
        int i = this.h;
        int[] iArr = this.g;
        String[] strArr = this.i;
        int[] iArr2 = this.j;
        ArrayList arrayList = new ArrayList();
        for (int i2 = 0; i2 < i; i2++) {
            int i3 = iArr[i2];
            if (i3 == 1 || i3 == 2) {
                arrayList.add(Integer.valueOf(iArr2[i2]));
            } else if ((i3 == 3 || i3 == 4 || i3 == 5) && (str = strArr[i2]) != null) {
                arrayList.add(str);
            }
        }
        return arrayList;
    }

    @Override // defpackage.fd6
    public final boolean hasNext() {
        Integer numValueOf = Integer.valueOf(this.c);
        if (numValueOf.intValue() == 0) {
            numValueOf = null;
        }
        int iIntValue = numValueOf != null ? numValueOf.intValue() : f();
        return (iIntValue == 2 || iIntValue == 4) ? false : true;
    }

    @Override // defpackage.fd6
    public final fd6 i() {
        int i = this.c;
        Integer numValueOf = Integer.valueOf(i);
        if (i == 0) {
            numValueOf = null;
        }
        if ((numValueOf != null ? numValueOf.intValue() : f()) != 1) {
            StringBuilder sb = new StringBuilder("Expected BEGIN_OBJECT but was ");
            sb.append(peek());
            rd6.t(sb, m());
            return null;
        }
        L(3);
        this.c = 0;
        int i2 = this.l;
        this.l = i2 + 1;
        this.k[i2] = 0;
        return this;
    }

    @Override // defpackage.fd6
    public final void j() {
        throw new IllegalStateException("BufferedSourceJsonReader cannot rewind.");
    }

    @Override // defpackage.fd6
    public final fd6 k() {
        int i = this.c;
        Integer numValueOf = Integer.valueOf(i);
        if (i == 0) {
            numValueOf = null;
        }
        if ((numValueOf != null ? numValueOf.intValue() : f()) != 4) {
            StringBuilder sb = new StringBuilder("Expected END_ARRAY but was ");
            sb.append(peek());
            rd6.t(sb, m());
            return null;
        }
        int i2 = this.h;
        this.h = i2 - 1;
        int[] iArr = this.j;
        int i3 = i2 - 2;
        iArr[i3] = iArr[i3] + 1;
        this.c = 0;
        return this;
    }

    @Override // defpackage.fd6
    public final rc6 l0() throws EOFException {
        String strQ = q();
        strQ.getClass();
        return new rc6(strQ);
    }

    public final String m() {
        return bu1.F0(h(), ".", null, null, null, 62);
    }

    @Override // defpackage.fd6
    public final fd6 n() {
        int i = this.c;
        Integer numValueOf = Integer.valueOf(i);
        if (i == 0) {
            numValueOf = null;
        }
        if ((numValueOf != null ? numValueOf.intValue() : f()) == 3) {
            L(1);
            this.j[this.h - 1] = 0;
            this.c = 0;
            return this;
        }
        StringBuilder sb = new StringBuilder("Expected BEGIN_ARRAY but was ");
        sb.append(peek());
        rd6.t(sb, m());
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x004c, code lost:
    
        v();
     */
    @Override // defpackage.fd6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int n0(java.util.List r6) throws java.io.EOFException {
        /*
            r5 = this;
            r6.getClass()
            boolean r0 = r6.isEmpty()
            if (r0 == 0) goto La
            goto L73
        La:
            boolean r0 = r5.hasNext()
            if (r0 == 0) goto L73
            java.lang.String r0 = r5.X()
            int[] r1 = r5.k
            int r2 = r5.l
            int r2 = r2 + (-1)
            r1 = r1[r2]
            java.lang.Object r2 = r6.get(r1)
            boolean r2 = defpackage.g76.L(r2, r0)
            r3 = 0
            if (r2 == 0) goto L40
            int[] r0 = r5.k
            int r2 = r5.l
            int r2 = r2 + (-1)
            int r4 = r1 + 1
            r0[r2] = r4
            int r6 = r6.size()
            if (r4 != r6) goto L3f
            int[] r6 = r5.k
            int r5 = r5.l
            int r5 = r5 + (-1)
            r6[r5] = r3
        L3f:
            return r1
        L40:
            r2 = r1
        L41:
            int r2 = r2 + 1
            int r4 = r6.size()
            if (r2 != r4) goto L4a
            r2 = r3
        L4a:
            if (r2 != r1) goto L50
            r5.v()
            goto La
        L50:
            java.lang.Object r4 = r6.get(r2)
            boolean r4 = defpackage.g76.L(r4, r0)
            if (r4 == 0) goto L41
            int[] r0 = r5.k
            int r1 = r5.l
            int r1 = r1 + (-1)
            int r4 = r2 + 1
            r0[r1] = r4
            int r6 = r6.size()
            if (r4 != r6) goto L72
            int[] r6 = r5.k
            int r5 = r5.l
            int r5 = r5 + (-1)
            r6[r5] = r3
        L72:
            return r2
        L73:
            r5 = -1
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a01.n0(java.util.List):int");
    }

    @Override // defpackage.fd6
    public final boolean nextBoolean() {
        int i = this.c;
        Integer numValueOf = Integer.valueOf(i);
        if (i == 0) {
            numValueOf = null;
        }
        int iIntValue = numValueOf != null ? numValueOf.intValue() : f();
        if (iIntValue == 5) {
            this.c = 0;
            int[] iArr = this.j;
            int i2 = this.h - 1;
            iArr[i2] = iArr[i2] + 1;
            return true;
        }
        if (iIntValue != 6) {
            StringBuilder sb = new StringBuilder("Expected a boolean but was ");
            sb.append(peek());
            rd6.t(sb, m());
            return false;
        }
        this.c = 0;
        int[] iArr2 = this.j;
        int i3 = this.h - 1;
        iArr2[i3] = iArr2[i3] + 1;
        return false;
    }

    @Override // defpackage.fd6
    public final double nextDouble() {
        int i = this.c;
        Integer numValueOf = Integer.valueOf(i);
        if (i == 0) {
            numValueOf = null;
        }
        int iIntValue = numValueOf != null ? numValueOf.intValue() : f();
        if (iIntValue == 15) {
            this.c = 0;
            int[] iArr = this.j;
            int i2 = this.h - 1;
            iArr[i2] = iArr[i2] + 1;
            return this.d;
        }
        if (iIntValue == 16) {
            long j = this.e;
            kz0 kz0Var = this.b;
            kz0Var.getClass();
            this.f = kz0Var.F0(j, wk1.a);
        } else if (iIntValue == 9) {
            this.f = D(n);
        } else if (iIntValue == 8) {
            this.f = D(m);
        } else if (iIntValue == 10) {
            this.f = I();
        } else if (iIntValue != 11) {
            StringBuilder sb = new StringBuilder("Expected a double but was ");
            sb.append(peek());
            rd6.t(sb, m());
            return 0.0d;
        }
        this.c = 11;
        try {
            String str = this.f;
            str.getClass();
            double d = Double.parseDouble(str);
            if (Double.isNaN(d) || Double.isInfinite(d)) {
                throw new JsonEncodingException("JSON forbids NaN and infinities: " + d + " at path " + m(), null);
            }
            this.f = null;
            this.c = 0;
            int[] iArr2 = this.j;
            int i3 = this.h - 1;
            iArr2[i3] = iArr2[i3] + 1;
            return d;
        } catch (NumberFormatException unused) {
            ay0.j("Expected a double but was ", this.f, m());
            return 0.0d;
        }
    }

    @Override // defpackage.fd6
    public final int nextInt() throws EOFException {
        int i = this.c;
        Integer numValueOf = Integer.valueOf(i);
        if (i == 0) {
            numValueOf = null;
        }
        int iIntValue = numValueOf != null ? numValueOf.intValue() : f();
        if (iIntValue == 15) {
            long j = this.d;
            int i2 = (int) j;
            if (j == i2) {
                this.c = 0;
                int[] iArr = this.j;
                int i3 = this.h - 1;
                iArr[i3] = iArr[i3] + 1;
                return i2;
            }
            throw new JsonDataException("Expected an int but was " + this.d + " at path " + h(), null);
        }
        if (iIntValue == 16) {
            long j2 = this.e;
            kz0 kz0Var = this.b;
            kz0Var.getClass();
            this.f = kz0Var.F0(j2, wk1.a);
        } else if (iIntValue == 9 || iIntValue == 8) {
            String strD = D(iIntValue == 9 ? n : m);
            this.f = strD;
            try {
                int i4 = Integer.parseInt(strD);
                this.c = 0;
                int[] iArr2 = this.j;
                int i5 = this.h - 1;
                iArr2[i5] = iArr2[i5] + 1;
                return i4;
            } catch (NumberFormatException unused) {
            }
        } else if (iIntValue != 11) {
            StringBuilder sb = new StringBuilder("Expected an int but was ");
            sb.append(peek());
            rd6.t(sb, m());
            return 0;
        }
        this.c = 11;
        try {
            String str = this.f;
            str.getClass();
            double d = Double.parseDouble(str);
            int i6 = (int) d;
            if (i6 != d) {
                ay0.j("Expected an int but was ", this.f, m());
                return 0;
            }
            this.f = null;
            this.c = 0;
            int[] iArr3 = this.j;
            int i7 = this.h - 1;
            iArr3[i7] = iArr3[i7] + 1;
            return i6;
        } catch (NumberFormatException unused2) {
            ay0.j("Expected an int but was ", this.f, m());
            return 0;
        }
    }

    @Override // defpackage.fd6
    public final long nextLong() throws EOFException {
        int i = this.c;
        Integer numValueOf = Integer.valueOf(i);
        if (i == 0) {
            numValueOf = null;
        }
        int iIntValue = numValueOf != null ? numValueOf.intValue() : f();
        if (iIntValue == 15) {
            this.c = 0;
            int[] iArr = this.j;
            int i2 = this.h - 1;
            iArr[i2] = iArr[i2] + 1;
            return this.d;
        }
        if (iIntValue == 16) {
            long j = this.e;
            kz0 kz0Var = this.b;
            kz0Var.getClass();
            this.f = kz0Var.F0(j, wk1.a);
        } else if (iIntValue == 9 || iIntValue == 8) {
            String strD = D(iIntValue == 9 ? n : m);
            this.f = strD;
            try {
                long j2 = Long.parseLong(strD);
                this.c = 0;
                int[] iArr2 = this.j;
                int i3 = this.h - 1;
                iArr2[i3] = iArr2[i3] + 1;
                return j2;
            } catch (NumberFormatException unused) {
            }
        } else if (iIntValue != 11) {
            StringBuilder sb = new StringBuilder("Expected a long but was ");
            sb.append(peek());
            rd6.t(sb, m());
            return 0L;
        }
        this.c = 11;
        try {
            String str = this.f;
            str.getClass();
            double d = Double.parseDouble(str);
            long j3 = (long) d;
            if (j3 != d) {
                ay0.j("Expected a long but was ", this.f, m());
                return 0L;
            }
            this.f = null;
            this.c = 0;
            int[] iArr3 = this.j;
            int i4 = this.h - 1;
            iArr3[i4] = iArr3[i4] + 1;
            return j3;
        } catch (NumberFormatException unused2) {
            ay0.j("Expected a long but was ", this.f, m());
            return 0L;
        }
    }

    public final boolean p(char c) {
        if (c == '\t' || c == '\n' || c == '\r' || c == ' ') {
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
        R("Unexpected character: " + c);
        throw null;
    }

    @Override // defpackage.fd6
    public final cd6 peek() {
        Integer numValueOf = Integer.valueOf(this.c);
        if (numValueOf.intValue() == 0) {
            numValueOf = null;
        }
        switch (numValueOf != null ? numValueOf.intValue() : f()) {
            case 1:
                return cd6.BEGIN_OBJECT;
            case 2:
                return cd6.END_OBJECT;
            case 3:
                return cd6.BEGIN_ARRAY;
            case 4:
                return cd6.END_ARRAY;
            case 5:
            case 6:
                return cd6.BOOLEAN;
            case 7:
                return cd6.NULL;
            case 8:
            case 9:
            case 10:
            case 11:
                return cd6.STRING;
            case 12:
            case 13:
            case 14:
                return cd6.NAME;
            case 15:
                return cd6.LONG;
            case 16:
                return cd6.NUMBER;
            case 17:
                return cd6.END_DOCUMENT;
            default:
                ywb.d();
                return null;
        }
    }

    @Override // defpackage.fd6
    public final String q() throws EOFException {
        int i = this.c;
        Integer numValueOf = Integer.valueOf(i);
        String strValueOf = null;
        if (i == 0) {
            numValueOf = null;
        }
        int iIntValue = numValueOf != null ? numValueOf.intValue() : f();
        if (iIntValue == 15) {
            strValueOf = String.valueOf(this.d);
        } else if (iIntValue != 16) {
            switch (iIntValue) {
                case 8:
                    strValueOf = D(m);
                    break;
                case 9:
                    strValueOf = D(n);
                    break;
                case 10:
                    strValueOf = I();
                    break;
                case 11:
                    String str = this.f;
                    if (str != null) {
                        this.f = null;
                        strValueOf = str;
                    }
                    break;
                default:
                    StringBuilder sb = new StringBuilder("Expected a string but was ");
                    sb.append(peek());
                    rd6.t(sb, m());
                    return null;
            }
        } else {
            long j = this.e;
            kz0 kz0Var = this.b;
            kz0Var.getClass();
            strValueOf = kz0Var.F0(j, wk1.a);
        }
        this.c = 0;
        int[] iArr = this.j;
        int i2 = this.h - 1;
        iArr[i2] = iArr[i2] + 1;
        return strValueOf;
    }

    @Override // defpackage.fd6
    public final void v() throws EOFException {
        int i = 0;
        do {
            int i2 = this.c;
            Integer numValueOf = Integer.valueOf(i2);
            if (i2 == 0) {
                numValueOf = null;
            }
            int iIntValue = numValueOf != null ? numValueOf.intValue() : f();
            kz0 kz0Var = this.b;
            switch (iIntValue) {
                case 1:
                    L(3);
                    i++;
                    break;
                case 2:
                    this.h--;
                    i--;
                    break;
                case 3:
                    L(1);
                    i++;
                    break;
                case 4:
                    this.h--;
                    i--;
                    break;
                case 8:
                case 12:
                    Q(m);
                    break;
                case 9:
                case 13:
                    Q(n);
                    break;
                case 10:
                case 14:
                    long jO = this.a.O(o);
                    if (jO == -1) {
                        jO = kz0Var.b;
                    }
                    kz0Var.skip(jO);
                    break;
                case 16:
                    kz0Var.skip(this.e);
                    break;
            }
            this.c = 0;
        } while (i != 0);
        int[] iArr = this.j;
        int i3 = this.h - 1;
        iArr[i3] = iArr[i3] + 1;
        this.i[i3] = "null";
    }
}
