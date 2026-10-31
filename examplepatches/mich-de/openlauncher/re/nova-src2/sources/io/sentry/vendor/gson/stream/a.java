package io.sentry.vendor.gson.stream;

import ads_mobile_sdk.pd;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class a implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final Reader f67870a;

    /* renamed from: i, reason: collision with root package name */
    public long f67878i;

    /* renamed from: j, reason: collision with root package name */
    public int f67879j;

    /* renamed from: k, reason: collision with root package name */
    public String f67880k;

    /* renamed from: l, reason: collision with root package name */
    public int[] f67881l;
    public String[] n;
    public int[] o;

    /* renamed from: b, reason: collision with root package name */
    public boolean f67871b = false;

    /* renamed from: c, reason: collision with root package name */
    public final char[] f67872c = new char[1024];

    /* renamed from: d, reason: collision with root package name */
    public int f67873d = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f67874e = 0;

    /* renamed from: f, reason: collision with root package name */
    public int f67875f = 0;

    /* renamed from: g, reason: collision with root package name */
    public int f67876g = 0;

    /* renamed from: h, reason: collision with root package name */
    public int f67877h = 0;

    /* renamed from: m, reason: collision with root package name */
    public int f67882m = 1;

    public a(Reader reader) {
        int[] iArr = new int[32];
        this.f67881l = iArr;
        iArr[0] = 6;
        this.n = new String[32];
        this.o = new int[32];
        this.f67870a = reader;
    }

    public final double A() throws IOException, NumberFormatException {
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 15) {
            this.f67877h = 0;
            int[] iArr = this.o;
            int i5 = this.f67882m - 1;
            iArr[i5] = iArr[i5] + 1;
            return this.f67878i;
        }
        if (iD == 16) {
            this.f67880k = new String(this.f67872c, this.f67873d, this.f67879j);
            this.f67873d += this.f67879j;
        } else if (iD == 8 || iD == 9) {
            this.f67880k = V(iD == 8 ? '\'' : AbstractJsonLexerKt.STRING);
        } else if (iD == 10) {
            this.f67880k = d0();
        } else if (iD != 11) {
            throw new IllegalStateException("Expected a double but was " + e0() + s());
        }
        this.f67877h = 11;
        double d5 = Double.parseDouble(this.f67880k);
        if (!this.f67871b && (Double.isNaN(d5) || Double.isInfinite(d5))) {
            throw new MalformedJsonException("JSON forbids NaN and infinities: " + d5 + s());
        }
        this.f67880k = null;
        this.f67877h = 0;
        int[] iArr2 = this.o;
        int i11 = this.f67882m - 1;
        iArr2[i11] = iArr2[i11] + 1;
        return d5;
    }

    public final int D() throws IOException, NumberFormatException {
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 15) {
            long j11 = this.f67878i;
            int i5 = (int) j11;
            if (j11 != i5) {
                throw new NumberFormatException("Expected an int but was " + this.f67878i + s());
            }
            this.f67877h = 0;
            int[] iArr = this.o;
            int i11 = this.f67882m - 1;
            iArr[i11] = iArr[i11] + 1;
            return i5;
        }
        if (iD == 16) {
            this.f67880k = new String(this.f67872c, this.f67873d, this.f67879j);
            this.f67873d += this.f67879j;
        } else {
            if (iD != 8 && iD != 9 && iD != 10) {
                throw new IllegalStateException("Expected an int but was " + e0() + s());
            }
            if (iD == 10) {
                this.f67880k = d0();
            } else {
                this.f67880k = V(iD == 8 ? '\'' : AbstractJsonLexerKt.STRING);
            }
            try {
                int i12 = Integer.parseInt(this.f67880k);
                this.f67877h = 0;
                int[] iArr2 = this.o;
                int i13 = this.f67882m - 1;
                iArr2[i13] = iArr2[i13] + 1;
                return i12;
            } catch (NumberFormatException unused) {
            }
        }
        this.f67877h = 11;
        double d5 = Double.parseDouble(this.f67880k);
        int i14 = (int) d5;
        if (i14 != d5) {
            throw new NumberFormatException("Expected an int but was " + this.f67880k + s());
        }
        this.f67880k = null;
        this.f67877h = 0;
        int[] iArr3 = this.o;
        int i15 = this.f67882m - 1;
        iArr3[i15] = iArr3[i15] + 1;
        return i14;
    }

    public final long K() throws IOException, NumberFormatException {
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 15) {
            this.f67877h = 0;
            int[] iArr = this.o;
            int i5 = this.f67882m - 1;
            iArr[i5] = iArr[i5] + 1;
            return this.f67878i;
        }
        if (iD == 16) {
            this.f67880k = new String(this.f67872c, this.f67873d, this.f67879j);
            this.f67873d += this.f67879j;
        } else {
            if (iD != 8 && iD != 9 && iD != 10) {
                throw new IllegalStateException("Expected a long but was " + e0() + s());
            }
            if (iD == 10) {
                this.f67880k = d0();
            } else {
                this.f67880k = V(iD == 8 ? '\'' : AbstractJsonLexerKt.STRING);
            }
            try {
                long j11 = Long.parseLong(this.f67880k);
                this.f67877h = 0;
                int[] iArr2 = this.o;
                int i11 = this.f67882m - 1;
                iArr2[i11] = iArr2[i11] + 1;
                return j11;
            } catch (NumberFormatException unused) {
            }
        }
        this.f67877h = 11;
        double d5 = Double.parseDouble(this.f67880k);
        long j12 = (long) d5;
        if (j12 != d5) {
            throw new NumberFormatException("Expected a long but was " + this.f67880k + s());
        }
        this.f67880k = null;
        this.f67877h = 0;
        int[] iArr3 = this.o;
        int i12 = this.f67882m - 1;
        iArr3[i12] = iArr3[i12] + 1;
        return j12;
    }

    public final String M() {
        String strV;
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 14) {
            strV = d0();
        } else if (iD == 12) {
            strV = V('\'');
        } else {
            if (iD != 13) {
                throw new IllegalStateException("Expected a name but was " + e0() + s());
            }
            strV = V(AbstractJsonLexerKt.STRING);
        }
        this.f67877h = 0;
        this.n[this.f67882m - 1] = strV;
        return strV;
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0074, code lost:
    
        return r5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int P(boolean z11) throws IOException {
        int i5 = this.f67873d;
        int i11 = this.f67874e;
        while (true) {
            if (i5 == i11) {
                this.f67873d = i5;
                if (!h(1)) {
                    if (!z11) {
                        return -1;
                    }
                    throw new EOFException("End of input" + s());
                }
                i5 = this.f67873d;
                i11 = this.f67874e;
            }
            int i12 = i5 + 1;
            char[] cArr = this.f67872c;
            char c11 = cArr[i5];
            if (c11 == '\n') {
                this.f67875f++;
                this.f67876g = i12;
            } else if (c11 != ' ' && c11 != '\r' && c11 != '\t') {
                if (c11 == '/') {
                    this.f67873d = i12;
                    if (i12 == i11) {
                        this.f67873d = i5;
                        boolean zH = h(2);
                        this.f67873d++;
                        if (!zH) {
                            break;
                        }
                        break;
                        break;
                    }
                    c();
                    int i13 = this.f67873d;
                    char c12 = cArr[i13];
                    if (c12 == '*') {
                        this.f67873d = i13 + 1;
                        while (true) {
                            if (this.f67873d + 2 > this.f67874e && !h(2)) {
                                j0("Unterminated comment");
                                throw null;
                            }
                            int i14 = this.f67873d;
                            if (cArr[i14] != '\n') {
                                for (int i15 = 0; i15 < 2; i15++) {
                                    if (cArr[this.f67873d + i15] != "*/".charAt(i15)) {
                                        break;
                                    }
                                }
                                i5 = this.f67873d + 2;
                                i11 = this.f67874e;
                                break;
                            }
                            this.f67875f++;
                            this.f67876g = i14 + 1;
                            this.f67873d++;
                        }
                    } else {
                        if (c12 != '/') {
                            break;
                        }
                        this.f67873d = i13 + 1;
                        i0();
                        i5 = this.f67873d;
                        i11 = this.f67874e;
                    }
                } else {
                    if (c11 != '#') {
                        this.f67873d = i12;
                        return c11;
                    }
                    this.f67873d = i12;
                    c();
                    i0();
                    i5 = this.f67873d;
                    i11 = this.f67874e;
                }
            }
            i5 = i12;
        }
    }

    public final void S() {
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        if (iD != 7) {
            throw new IllegalStateException("Expected null but was " + e0() + s());
        }
        this.f67877h = 0;
        int[] iArr = this.o;
        int i5 = this.f67882m - 1;
        iArr[i5] = iArr[i5] + 1;
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x005c, code lost:
    
        if (r1 != null) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x005e, code lost:
    
        r1 = new java.lang.StringBuilder(java.lang.Math.max((r2 - r3) * 2, 16));
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x006c, code lost:
    
        r1.append(r7, r3, r2 - r3);
        r10.f67873d = r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String V(char c11) throws MalformedJsonException {
        StringBuilder sb2 = null;
        do {
            int i5 = this.f67873d;
            int i11 = this.f67874e;
            int i12 = i5;
            while (true) {
                char[] cArr = this.f67872c;
                if (i5 >= i11) {
                    break;
                }
                int i13 = i5 + 1;
                char c12 = cArr[i5];
                if (c12 == c11) {
                    this.f67873d = i13;
                    int i14 = (i13 - i12) - 1;
                    if (sb2 == null) {
                        return new String(cArr, i12, i14);
                    }
                    sb2.append(cArr, i12, i14);
                    return sb2.toString();
                }
                if (c12 == '\\') {
                    this.f67873d = i13;
                    int i15 = i13 - i12;
                    int i16 = i15 - 1;
                    if (sb2 == null) {
                        sb2 = new StringBuilder(Math.max(i15 * 2, 16));
                    }
                    sb2.append(cArr, i12, i16);
                    sb2.append(g0());
                    i12 = this.f67873d;
                    i11 = this.f67874e;
                    i5 = i12;
                } else {
                    if (c12 == '\n') {
                        this.f67875f++;
                        this.f67876g = i13;
                    }
                    i5 = i13;
                }
            }
        } while (h(1));
        j0("Unterminated string");
        throw null;
    }

    public final void a() {
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 3) {
            f0(1);
            this.o[this.f67882m - 1] = 0;
            this.f67877h = 0;
        } else {
            throw new IllegalStateException("Expected BEGIN_ARRAY but was " + e0() + s());
        }
    }

    public final void b() {
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 1) {
            f0(3);
            this.f67877h = 0;
        } else {
            throw new IllegalStateException("Expected BEGIN_OBJECT but was " + e0() + s());
        }
    }

    public final void c() throws MalformedJsonException {
        if (this.f67871b) {
            return;
        }
        j0("Use JsonReader.setLenient(true) to accept malformed JSON");
        throw null;
    }

    public final String c0() {
        String str;
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 10) {
            str = d0();
        } else if (iD == 8) {
            str = V('\'');
        } else if (iD == 9) {
            str = V(AbstractJsonLexerKt.STRING);
        } else if (iD == 11) {
            str = this.f67880k;
            this.f67880k = null;
        } else if (iD == 15) {
            str = Long.toString(this.f67878i);
        } else {
            if (iD != 16) {
                throw new IllegalStateException("Expected a string but was " + e0() + s());
            }
            str = new String(this.f67872c, this.f67873d, this.f67879j);
            this.f67873d += this.f67879j;
        }
        this.f67877h = 0;
        int[] iArr = this.o;
        int i5 = this.f67882m - 1;
        iArr[i5] = iArr[i5] + 1;
        return str;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f67877h = 0;
        this.f67881l[0] = 8;
        this.f67882m = 1;
        this.f67870a.close();
    }

    /* JADX WARN: Code restructure failed: missing block: B:167:0x0215, code lost:
    
        if (p(r1) != false) goto L121;
     */
    /* JADX WARN: Removed duplicated region for block: B:115:0x017d A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:116:0x017e  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x01b0  */
    /* JADX WARN: Removed duplicated region for block: B:202:0x026b  */
    /* JADX WARN: Removed duplicated region for block: B:207:0x027a A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:208:0x027b  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x02c0  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00e8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int d() throws IOException {
        int iP;
        int i5;
        int iP2;
        int i11;
        String str;
        String str2;
        int i12;
        char c11;
        char c12;
        long j11;
        int i13;
        int i14;
        int i15;
        int[] iArr = this.f67881l;
        int i16 = 1;
        int i17 = this.f67882m - 1;
        int i18 = iArr[i17];
        char[] cArr = this.f67872c;
        if (i18 == 1) {
            iArr[i17] = 2;
        } else if (i18 == 2) {
            int iP3 = P(true);
            if (iP3 != 44) {
                if (iP3 != 59) {
                    if (iP3 == 93) {
                        this.f67877h = 4;
                        return 4;
                    }
                    j0("Unterminated array");
                    throw null;
                }
                c();
            }
        } else {
            if (i18 == 3 || i18 == 5) {
                iArr[i17] = 4;
                if (i18 == 5 && (iP = P(true)) != 44) {
                    if (iP != 59) {
                        if (iP == 125) {
                            this.f67877h = 2;
                            return 2;
                        }
                        j0("Unterminated object");
                        throw null;
                    }
                    c();
                }
                int iP4 = P(true);
                if (iP4 == 34) {
                    this.f67877h = 13;
                    return 13;
                }
                if (iP4 == 39) {
                    c();
                    this.f67877h = 12;
                    return 12;
                }
                if (iP4 == 125) {
                    if (i18 != 5) {
                        this.f67877h = 2;
                        return 2;
                    }
                    j0("Expected name");
                    throw null;
                }
                c();
                this.f67873d--;
                if (p((char) iP4)) {
                    this.f67877h = 14;
                    return 14;
                }
                j0("Expected name");
                throw null;
            }
            if (i18 == 4) {
                iArr[i17] = 5;
                int iP5 = P(true);
                if (iP5 != 58) {
                    if (iP5 != 61) {
                        j0("Expected ':'");
                        throw null;
                    }
                    c();
                    if (this.f67873d < this.f67874e || h(1)) {
                        int i19 = this.f67873d;
                        if (cArr[i19] == '>') {
                            this.f67873d = i19 + 1;
                        }
                    }
                }
            } else {
                if (i18 != 6) {
                    if (i18 == 7) {
                        i5 = 0;
                        if (P(false) == -1) {
                            this.f67877h = 17;
                            return 17;
                        }
                        c();
                        this.f67873d--;
                    } else {
                        i5 = 0;
                        if (i18 == 8) {
                            throw new IllegalStateException("JsonReader is closed");
                        }
                    }
                    iP2 = P(true);
                    if (iP2 != 34) {
                        this.f67877h = 9;
                        return 9;
                    }
                    if (iP2 == 39) {
                        c();
                        this.f67877h = 8;
                        return 8;
                    }
                    if (iP2 == 44 || iP2 == 59) {
                        i11 = 1;
                    } else {
                        if (iP2 == 91) {
                            this.f67877h = 3;
                            return 3;
                        }
                        if (iP2 == 93) {
                            i11 = 1;
                            if (i18 == 1) {
                                this.f67877h = 4;
                                return 4;
                            }
                        } else {
                            if (iP2 == 123) {
                                this.f67877h = 1;
                                return 1;
                            }
                            int i21 = this.f67873d - 1;
                            this.f67873d = i21;
                            char c13 = cArr[i21];
                            if (c13 == 't' || c13 == 'T') {
                                str = InneractiveMediationDefs.SHOW_HOUSE_AD_YES;
                                str2 = "TRUE";
                                i12 = 5;
                            } else if (c13 == 'f' || c13 == 'F') {
                                str = "false";
                                str2 = "FALSE";
                                i12 = 6;
                            } else {
                                if (c13 == 'n' || c13 == 'N') {
                                    str = AbstractJsonLexerKt.NULL;
                                    str2 = "NULL";
                                    i12 = 7;
                                }
                                i12 = i5;
                                if (i12 == 0) {
                                    return i12;
                                }
                                int i22 = this.f67873d;
                                int i23 = this.f67874e;
                                int i24 = i5;
                                int i25 = i24;
                                int i26 = i25;
                                boolean z11 = true;
                                long j12 = 0;
                                while (true) {
                                    if (i22 + i25 == i23) {
                                        if (i25 == cArr.length) {
                                            break;
                                        }
                                        if (!h(i25 + 1)) {
                                            j11 = 0;
                                            break;
                                        }
                                        int i27 = this.f67873d;
                                        i23 = this.f67874e;
                                        i22 = i27;
                                        c12 = cArr[i22 + i25];
                                        j11 = 0;
                                        if (c12 != '+') {
                                        }
                                    } else {
                                        c12 = cArr[i22 + i25];
                                        j11 = 0;
                                        if (c12 != '+') {
                                            i13 = i23;
                                            i14 = 6;
                                            if (i24 != 5) {
                                                break;
                                            }
                                            i24 = i14;
                                            i25++;
                                            i23 = i13;
                                            i16 = 1;
                                        } else if (c12 == 'E' || c12 == 'e') {
                                            i13 = i23;
                                            if (i24 != 2 && i24 != 4) {
                                                break;
                                            }
                                            i24 = 5;
                                            i25++;
                                            i23 = i13;
                                            i16 = 1;
                                        } else if (c12 == '-') {
                                            i13 = i23;
                                            i14 = 6;
                                            if (i24 == 0) {
                                                i24 = 1;
                                                i26 = 1;
                                                i25++;
                                                i23 = i13;
                                                i16 = 1;
                                            } else {
                                                if (i24 != 5) {
                                                    break;
                                                }
                                                i24 = i14;
                                                i25++;
                                                i23 = i13;
                                                i16 = 1;
                                            }
                                        } else if (c12 == '.') {
                                            i13 = i23;
                                            if (i24 != 2) {
                                                break;
                                            }
                                            i24 = 3;
                                            i25++;
                                            i23 = i13;
                                            i16 = 1;
                                        } else {
                                            if (c12 < '0' || c12 > '9') {
                                                break;
                                            }
                                            if (i24 == i16 || i24 == 0) {
                                                i13 = i23;
                                                j12 = -(c12 - '0');
                                                i24 = 2;
                                            } else if (i24 != 2) {
                                                i13 = i23;
                                                if (i24 == 3) {
                                                    i24 = 4;
                                                } else if (i24 == 5 || i24 == 6) {
                                                    i24 = 7;
                                                }
                                            } else {
                                                if (j12 == 0) {
                                                    break;
                                                }
                                                i13 = i23;
                                                long j13 = (10 * j12) - (c12 - '0');
                                                z11 &= j12 > -922337203685477580L || (j12 == -922337203685477580L && j13 < j12);
                                                j12 = j13;
                                            }
                                            i25++;
                                            i23 = i13;
                                            i16 = 1;
                                        }
                                    }
                                    if (i15 == 0) {
                                        return i15;
                                    }
                                    if (!p(cArr[this.f67873d])) {
                                        j0("Expected value");
                                        throw null;
                                    }
                                    c();
                                    this.f67877h = 10;
                                    return 10;
                                }
                                int i28 = 2;
                                if (i24 != 2) {
                                    if (i24 != i28 || i24 == 4 || i24 == 7) {
                                        this.f67879j = i25;
                                        i15 = 16;
                                        this.f67877h = 16;
                                    } else {
                                        i15 = 0;
                                    }
                                } else if (!z11 || ((j12 == Long.MIN_VALUE && i26 == 0) || (j12 == j11 && i26 != 0))) {
                                    i28 = 2;
                                    if (i24 != i28) {
                                    }
                                    this.f67879j = i25;
                                    i15 = 16;
                                    this.f67877h = 16;
                                } else {
                                    if (i26 == 0) {
                                        j12 = -j12;
                                    }
                                    this.f67878i = j12;
                                    this.f67873d += i25;
                                    i15 = 15;
                                    this.f67877h = 15;
                                }
                                if (i15 == 0) {
                                }
                            }
                            int length = str.length();
                            int i29 = 1;
                            while (true) {
                                if (i29 < length) {
                                    if ((this.f67873d + i29 >= this.f67874e && !h(i29 + 1)) || ((c11 = cArr[this.f67873d + i29]) != str.charAt(i29) && c11 != str2.charAt(i29))) {
                                        break;
                                    }
                                    i29++;
                                } else {
                                    if ((this.f67873d + length < this.f67874e || h(length + 1)) && p(cArr[this.f67873d + length])) {
                                        break;
                                    }
                                    this.f67873d += length;
                                    this.f67877h = i12;
                                }
                            }
                            if (i12 == 0) {
                            }
                        }
                    }
                    if (i18 != i11 && i18 != 2) {
                        j0("Unexpected value");
                        throw null;
                    }
                    c();
                    this.f67873d -= i11;
                    this.f67877h = 7;
                    return 7;
                }
                if (this.f67871b) {
                    P(true);
                    int i31 = this.f67873d;
                    int i32 = i31 - 1;
                    this.f67873d = i32;
                    if ((i31 + 4 <= this.f67874e || h(5)) && cArr[i32] == ')' && cArr[i31] == ']' && cArr[i31 + 1] == '}' && cArr[i31 + 2] == '\'' && cArr[i31 + 3] == '\n') {
                        this.f67873d += 5;
                    }
                }
                this.f67881l[this.f67882m - 1] = 7;
            }
        }
        i5 = 0;
        iP2 = P(true);
        if (iP2 != 34) {
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x0048, code lost:
    
        c();
     */
    /* JADX WARN: Failed to find 'out' block for switch in B:32:0x0042. Please report as an issue. */
    /* JADX WARN: Removed duplicated region for block: B:46:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0082  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String d0() throws MalformedJsonException {
        char[] cArr;
        String string;
        StringBuilder sb2 = null;
        int i5 = 0;
        do {
            int i11 = 0;
            while (true) {
                int i12 = this.f67873d + i11;
                int i13 = this.f67874e;
                cArr = this.f67872c;
                if (i12 < i13) {
                    char c11 = cArr[i12];
                    if (c11 != '\t' && c11 != '\n' && c11 != '\f' && c11 != '\r' && c11 != ' ') {
                        if (c11 != '#') {
                            if (c11 != ',') {
                                if (c11 != '/' && c11 != '=') {
                                    if (c11 != '{' && c11 != '}' && c11 != ':') {
                                        if (c11 != ';') {
                                            switch (c11) {
                                                case '[':
                                                case pd.O0 /* 93 */:
                                                    break;
                                                case pd.N0 /* 92 */:
                                                    break;
                                                default:
                                                    i11++;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else if (i11 >= cArr.length) {
                    if (sb2 == null) {
                        sb2 = new StringBuilder(Math.max(i11, 16));
                    }
                    sb2.append(cArr, this.f67873d, i11);
                    this.f67873d += i11;
                } else if (h(i11 + 1)) {
                }
            }
            i5 = i11;
            if (sb2 != null) {
                string = new String(cArr, this.f67873d, i5);
            } else {
                sb2.append(cArr, this.f67873d, i5);
                string = sb2.toString();
            }
            this.f67873d += i5;
            return string;
        } while (h(1));
        if (sb2 != null) {
        }
        this.f67873d += i5;
        return string;
    }

    public final void e() {
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        if (iD != 4) {
            throw new IllegalStateException("Expected END_ARRAY but was " + e0() + s());
        }
        int i5 = this.f67882m;
        this.f67882m = i5 - 1;
        int[] iArr = this.o;
        int i11 = i5 - 2;
        iArr[i11] = iArr[i11] + 1;
        this.f67877h = 0;
    }

    public final b e0() throws IOException {
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        switch (iD) {
            case 1:
                return b.BEGIN_OBJECT;
            case 2:
                return b.END_OBJECT;
            case 3:
                return b.BEGIN_ARRAY;
            case 4:
                return b.END_ARRAY;
            case 5:
            case 6:
                return b.BOOLEAN;
            case 7:
                return b.NULL;
            case 8:
            case 9:
            case 10:
            case 11:
                return b.STRING;
            case 12:
            case 13:
            case 14:
                return b.NAME;
            case 15:
            case 16:
                return b.NUMBER;
            case 17:
                return b.END_DOCUMENT;
            default:
                throw new AssertionError();
        }
    }

    public final void f() {
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        if (iD != 2) {
            throw new IllegalStateException("Expected END_OBJECT but was " + e0() + s());
        }
        int i5 = this.f67882m;
        int i11 = i5 - 1;
        this.f67882m = i11;
        this.n[i11] = null;
        int[] iArr = this.o;
        int i12 = i5 - 2;
        iArr[i12] = iArr[i12] + 1;
        this.f67877h = 0;
    }

    public final void f0(int i5) {
        int i11 = this.f67882m;
        int[] iArr = this.f67881l;
        if (i11 == iArr.length) {
            int i12 = i11 * 2;
            this.f67881l = Arrays.copyOf(iArr, i12);
            this.o = Arrays.copyOf(this.o, i12);
            this.n = (String[]) Arrays.copyOf(this.n, i12);
        }
        int[] iArr2 = this.f67881l;
        int i13 = this.f67882m;
        this.f67882m = i13 + 1;
        iArr2[i13] = i5;
    }

    public final char g0() throws MalformedJsonException {
        int i5;
        if (this.f67873d == this.f67874e && !h(1)) {
            j0("Unterminated escape sequence");
            throw null;
        }
        int i11 = this.f67873d;
        int i12 = i11 + 1;
        this.f67873d = i12;
        char[] cArr = this.f67872c;
        char c11 = cArr[i11];
        if (c11 == '\n') {
            this.f67875f++;
            this.f67876g = i12;
            return c11;
        }
        if (c11 == '\"' || c11 == '\'' || c11 == '/' || c11 == '\\') {
            return c11;
        }
        if (c11 == 'b') {
            return '\b';
        }
        if (c11 == 'f') {
            return '\f';
        }
        if (c11 == 'n') {
            return '\n';
        }
        if (c11 == 'r') {
            return '\r';
        }
        if (c11 == 't') {
            return '\t';
        }
        if (c11 != 'u') {
            j0("Invalid escape sequence");
            throw null;
        }
        if (i11 + 5 > this.f67874e && !h(4)) {
            j0("Unterminated escape sequence");
            throw null;
        }
        int i13 = this.f67873d;
        int i14 = i13 + 4;
        char c12 = 0;
        while (i13 < i14) {
            char c13 = cArr[i13];
            char c14 = (char) (c12 << 4);
            if (c13 >= '0' && c13 <= '9') {
                i5 = c13 - '0';
            } else if (c13 >= 'a' && c13 <= 'f') {
                i5 = c13 - 'W';
            } else {
                if (c13 < 'A' || c13 > 'F') {
                    throw new NumberFormatException("\\u".concat(new String(cArr, this.f67873d, 4)));
                }
                i5 = c13 - '7';
            }
            c12 = (char) (i5 + c14);
            i13++;
        }
        this.f67873d += 4;
        return c12;
    }

    public final boolean h(int i5) throws IOException {
        int i11;
        int i12;
        int i13 = this.f67876g;
        int i14 = this.f67873d;
        this.f67876g = i13 - i14;
        int i15 = this.f67874e;
        char[] cArr = this.f67872c;
        if (i15 != i14) {
            int i16 = i15 - i14;
            this.f67874e = i16;
            System.arraycopy(cArr, i14, cArr, 0, i16);
        } else {
            this.f67874e = 0;
        }
        this.f67873d = 0;
        do {
            int i17 = this.f67874e;
            int i18 = this.f67870a.read(cArr, i17, cArr.length - i17);
            if (i18 == -1) {
                return false;
            }
            i11 = this.f67874e + i18;
            this.f67874e = i11;
            if (this.f67875f == 0 && (i12 = this.f67876g) == 0 && i11 > 0 && cArr[0] == 65279) {
                this.f67873d++;
                this.f67876g = i12 + 1;
                i5++;
            }
        } while (i11 < i5);
        return true;
    }

    public final void h0(char c11) throws MalformedJsonException {
        do {
            int i5 = this.f67873d;
            int i11 = this.f67874e;
            while (i5 < i11) {
                int i12 = i5 + 1;
                char c12 = this.f67872c[i5];
                if (c12 == c11) {
                    this.f67873d = i12;
                    return;
                }
                if (c12 == '\\') {
                    this.f67873d = i12;
                    g0();
                    i5 = this.f67873d;
                    i11 = this.f67874e;
                } else {
                    if (c12 == '\n') {
                        this.f67875f++;
                        this.f67876g = i12;
                    }
                    i5 = i12;
                }
            }
            this.f67873d = i5;
        } while (h(1));
        j0("Unterminated string");
        throw null;
    }

    public final void i0() {
        char c11;
        do {
            if (this.f67873d >= this.f67874e && !h(1)) {
                return;
            }
            int i5 = this.f67873d;
            int i11 = i5 + 1;
            this.f67873d = i11;
            c11 = this.f67872c[i5];
            if (c11 == '\n') {
                this.f67875f++;
                this.f67876g = i11;
                return;
            }
        } while (c11 != '\r');
    }

    public final void j0(String str) throws MalformedJsonException {
        StringBuilder sbQ = a2.c.q(str);
        sbQ.append(s());
        throw new MalformedJsonException(sbQ.toString());
    }

    public final boolean l() throws IOException {
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        return (iD == 2 || iD == 4) ? false : true;
    }

    public final boolean p(char c11) throws MalformedJsonException {
        if (c11 == '\t' || c11 == '\n' || c11 == '\f' || c11 == '\r' || c11 == ' ') {
            return false;
        }
        if (c11 != '#') {
            if (c11 == ',') {
                return false;
            }
            if (c11 != '/' && c11 != '=') {
                if (c11 == '{' || c11 == '}' || c11 == ':') {
                    return false;
                }
                if (c11 != ';') {
                    switch (c11) {
                        case '[':
                        case pd.O0 /* 93 */:
                            return false;
                        case pd.N0 /* 92 */:
                            break;
                        default:
                            return true;
                    }
                }
            }
        }
        c();
        return false;
    }

    public final String s() {
        StringBuilder sbT = c0.t(this.f67875f + 1, " at line ", " column ", (this.f67873d - this.f67876g) + 1, " path ");
        StringBuilder sb2 = new StringBuilder("$");
        int i5 = this.f67882m;
        for (int i11 = 0; i11 < i5; i11++) {
            int i12 = this.f67881l[i11];
            if (i12 == 1 || i12 == 2) {
                sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
                sb2.append(this.o[i11]);
                sb2.append(AbstractJsonLexerKt.END_LIST);
            } else if (i12 == 3 || i12 == 4 || i12 == 5) {
                sb2.append('.');
                String str = this.n[i11];
                if (str != null) {
                    sb2.append(str);
                }
            }
        }
        sbT.append(sb2.toString());
        return sbT.toString();
    }

    public final String toString() {
        return a.class.getSimpleName() + s();
    }

    public final boolean w() throws IOException {
        int iD = this.f67877h;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 5) {
            this.f67877h = 0;
            int[] iArr = this.o;
            int i5 = this.f67882m - 1;
            iArr[i5] = iArr[i5] + 1;
            return true;
        }
        if (iD != 6) {
            throw new IllegalStateException("Expected a boolean but was " + e0() + s());
        }
        this.f67877h = 0;
        int[] iArr2 = this.o;
        int i11 = this.f67882m - 1;
        iArr2[i11] = iArr2[i11] + 1;
        return false;
    }
}
