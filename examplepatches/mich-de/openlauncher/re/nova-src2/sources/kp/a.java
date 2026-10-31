package kp;

import ads_mobile_sdk.pd;
import b.c0;
import b.u4;
import br.c;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.nimbusds.jose.shaded.gson.stream.MalformedJsonException;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.StringReader;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public class a implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final StringReader f72086a;

    /* renamed from: h, reason: collision with root package name */
    public long f72093h;

    /* renamed from: i, reason: collision with root package name */
    public int f72094i;

    /* renamed from: j, reason: collision with root package name */
    public String f72095j;

    /* renamed from: k, reason: collision with root package name */
    public int[] f72096k;

    /* renamed from: m, reason: collision with root package name */
    public String[] f72098m;
    public int[] n;
    public int o = 2;

    /* renamed from: b, reason: collision with root package name */
    public final char[] f72087b = new char[1024];

    /* renamed from: c, reason: collision with root package name */
    public int f72088c = 0;

    /* renamed from: d, reason: collision with root package name */
    public int f72089d = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f72090e = 0;

    /* renamed from: f, reason: collision with root package name */
    public int f72091f = 0;

    /* renamed from: g, reason: collision with root package name */
    public int f72092g = 0;

    /* renamed from: l, reason: collision with root package name */
    public int f72097l = 1;

    static {
        c.f18430a = new c();
    }

    public a(StringReader stringReader) {
        int[] iArr = new int[32];
        this.f72096k = iArr;
        iArr[0] = 6;
        this.f72098m = new String[32];
        this.n = new int[32];
        this.f72086a = stringReader;
    }

    public final boolean A() {
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 5) {
            this.f72092g = 0;
            int[] iArr = this.n;
            int i5 = this.f72097l - 1;
            iArr[i5] = iArr[i5] + 1;
            return true;
        }
        if (iD != 6) {
            throw n0("a boolean");
        }
        this.f72092g = 0;
        int[] iArr2 = this.n;
        int i11 = this.f72097l - 1;
        iArr2[i11] = iArr2[i11] + 1;
        return false;
    }

    public final double D() throws IOException, NumberFormatException {
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 15) {
            this.f72092g = 0;
            int[] iArr = this.n;
            int i5 = this.f72097l - 1;
            iArr[i5] = iArr[i5] + 1;
            return this.f72093h;
        }
        if (iD == 16) {
            this.f72095j = new String(this.f72087b, this.f72088c, this.f72094i);
            this.f72088c += this.f72094i;
        } else if (iD == 8 || iD == 9) {
            this.f72095j = c0(iD == 8 ? '\'' : AbstractJsonLexerKt.STRING);
        } else if (iD == 10) {
            this.f72095j = e0();
        } else if (iD != 11) {
            throw n0("a double");
        }
        this.f72092g = 11;
        double d5 = Double.parseDouble(this.f72095j);
        if (this.o != 1 && (Double.isNaN(d5) || Double.isInfinite(d5))) {
            m0("JSON forbids NaN and infinities: " + d5);
            throw null;
        }
        this.f72095j = null;
        this.f72092g = 0;
        int[] iArr2 = this.n;
        int i11 = this.f72097l - 1;
        iArr2[i11] = iArr2[i11] + 1;
        return d5;
    }

    public final int K() {
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 15) {
            long j11 = this.f72093h;
            int i5 = (int) j11;
            if (j11 != i5) {
                throw new NumberFormatException("Expected an int but was " + this.f72093h + w());
            }
            this.f72092g = 0;
            int[] iArr = this.n;
            int i11 = this.f72097l - 1;
            iArr[i11] = iArr[i11] + 1;
            return i5;
        }
        if (iD == 16) {
            this.f72095j = new String(this.f72087b, this.f72088c, this.f72094i);
            this.f72088c += this.f72094i;
        } else {
            if (iD != 8 && iD != 9 && iD != 10) {
                throw n0("an int");
            }
            if (iD == 10) {
                this.f72095j = e0();
            } else {
                this.f72095j = c0(iD == 8 ? '\'' : AbstractJsonLexerKt.STRING);
            }
            try {
                int i12 = Integer.parseInt(this.f72095j);
                this.f72092g = 0;
                int[] iArr2 = this.n;
                int i13 = this.f72097l - 1;
                iArr2[i13] = iArr2[i13] + 1;
                return i12;
            } catch (NumberFormatException unused) {
            }
        }
        this.f72092g = 11;
        double d5 = Double.parseDouble(this.f72095j);
        int i14 = (int) d5;
        if (i14 != d5) {
            throw new NumberFormatException("Expected an int but was " + this.f72095j + w());
        }
        this.f72095j = null;
        this.f72092g = 0;
        int[] iArr3 = this.n;
        int i15 = this.f72097l - 1;
        iArr3[i15] = iArr3[i15] + 1;
        return i14;
    }

    public final long M() throws IOException, NumberFormatException {
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 15) {
            this.f72092g = 0;
            int[] iArr = this.n;
            int i5 = this.f72097l - 1;
            iArr[i5] = iArr[i5] + 1;
            return this.f72093h;
        }
        if (iD == 16) {
            this.f72095j = new String(this.f72087b, this.f72088c, this.f72094i);
            this.f72088c += this.f72094i;
        } else {
            if (iD != 8 && iD != 9 && iD != 10) {
                throw n0("a long");
            }
            if (iD == 10) {
                this.f72095j = e0();
            } else {
                this.f72095j = c0(iD == 8 ? '\'' : AbstractJsonLexerKt.STRING);
            }
            try {
                long j11 = Long.parseLong(this.f72095j);
                this.f72092g = 0;
                int[] iArr2 = this.n;
                int i11 = this.f72097l - 1;
                iArr2[i11] = iArr2[i11] + 1;
                return j11;
            } catch (NumberFormatException unused) {
            }
        }
        this.f72092g = 11;
        double d5 = Double.parseDouble(this.f72095j);
        long j12 = (long) d5;
        if (j12 != d5) {
            throw new NumberFormatException("Expected a long but was " + this.f72095j + w());
        }
        this.f72095j = null;
        this.f72092g = 0;
        int[] iArr3 = this.n;
        int i12 = this.f72097l - 1;
        iArr3[i12] = iArr3[i12] + 1;
        return j12;
    }

    public final String P() {
        String strC0;
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 14) {
            strC0 = e0();
        } else if (iD == 12) {
            strC0 = c0('\'');
        } else {
            if (iD != 13) {
                throw n0("a name");
            }
            strC0 = c0(AbstractJsonLexerKt.STRING);
        }
        this.f72092g = 0;
        this.f72098m[this.f72097l - 1] = strC0;
        return strC0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0074, code lost:
    
        return r5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int S(boolean z11) throws IOException {
        int i5 = this.f72088c;
        int i11 = this.f72089d;
        while (true) {
            if (i5 == i11) {
                this.f72088c = i5;
                if (!h(1)) {
                    if (!z11) {
                        return -1;
                    }
                    throw new EOFException("End of input" + w());
                }
                i5 = this.f72088c;
                i11 = this.f72089d;
            }
            int i12 = i5 + 1;
            char[] cArr = this.f72087b;
            char c11 = cArr[i5];
            if (c11 == '\n') {
                this.f72090e++;
                this.f72091f = i12;
            } else if (c11 != ' ' && c11 != '\r' && c11 != '\t') {
                if (c11 == '/') {
                    this.f72088c = i12;
                    if (i12 == i11) {
                        this.f72088c = i5;
                        boolean zH = h(2);
                        this.f72088c++;
                        if (!zH) {
                            break;
                        }
                        break;
                        break;
                    }
                    c();
                    int i13 = this.f72088c;
                    char c12 = cArr[i13];
                    if (c12 == '*') {
                        this.f72088c = i13 + 1;
                        while (true) {
                            if (this.f72088c + 2 > this.f72089d && !h(2)) {
                                m0("Unterminated comment");
                                throw null;
                            }
                            int i14 = this.f72088c;
                            if (cArr[i14] != '\n') {
                                for (int i15 = 0; i15 < 2; i15++) {
                                    if (cArr[this.f72088c + i15] != "*/".charAt(i15)) {
                                        break;
                                    }
                                }
                                i5 = this.f72088c + 2;
                                i11 = this.f72089d;
                                break;
                            }
                            this.f72090e++;
                            this.f72091f = i14 + 1;
                            this.f72088c++;
                        }
                    } else {
                        if (c12 != '/') {
                            break;
                        }
                        this.f72088c = i13 + 1;
                        j0();
                        i5 = this.f72088c;
                        i11 = this.f72089d;
                    }
                } else {
                    if (c11 != '#') {
                        this.f72088c = i12;
                        return c11;
                    }
                    this.f72088c = i12;
                    c();
                    j0();
                    i5 = this.f72088c;
                    i11 = this.f72089d;
                }
            }
            i5 = i12;
        }
    }

    public final void V() {
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        if (iD != 7) {
            throw n0(AbstractJsonLexerKt.NULL);
        }
        this.f72092g = 0;
        int[] iArr = this.n;
        int i5 = this.f72097l - 1;
        iArr[i5] = iArr[i5] + 1;
    }

    public final void a() {
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        if (iD != 3) {
            throw n0("BEGIN_ARRAY");
        }
        g0(1);
        this.n[this.f72097l - 1] = 0;
        this.f72092g = 0;
    }

    public final void b() {
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        if (iD != 1) {
            throw n0("BEGIN_OBJECT");
        }
        g0(3);
        this.f72092g = 0;
    }

    public final void c() throws MalformedJsonException {
        if (this.o == 1) {
            return;
        }
        m0("Use JsonReader.setStrictness(Strictness.LENIENT) to accept malformed JSON");
        throw null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x003d, code lost:
    
        r11.f72088c = r8;
        r8 = r8 - r3;
        r2 = r8 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0042, code lost:
    
        if (r1 != null) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0044, code lost:
    
        r1 = new java.lang.StringBuilder(java.lang.Math.max(r8 * 2, 16));
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x006b, code lost:
    
        if (r1 != null) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x006d, code lost:
    
        r1 = new java.lang.StringBuilder(java.lang.Math.max((r2 - r3) * 2, 16));
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x007b, code lost:
    
        r1.append(r7, r3, r2 - r3);
        r11.f72088c = r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String c0(char c11) throws MalformedJsonException {
        char[] cArr;
        int i5;
        StringBuilder sb2 = null;
        do {
            int i11 = this.f72088c;
            int i12 = this.f72089d;
            while (true) {
                int i13 = i12;
                int i14 = i11;
                while (true) {
                    cArr = this.f72087b;
                    if (i11 >= i13) {
                        break;
                    }
                    int i15 = i11 + 1;
                    char c12 = cArr[i11];
                    if (this.o == 3 && c12 < ' ') {
                        m0("Unescaped control characters (\\u0000-\\u001F) are not allowed in strict mode");
                        throw null;
                    }
                    if (c12 == c11) {
                        this.f72088c = i15;
                        int i16 = (i15 - i14) - 1;
                        if (sb2 == null) {
                            return new String(cArr, i14, i16);
                        }
                        sb2.append(cArr, i14, i16);
                        return sb2.toString();
                    }
                    if (c12 == '\\') {
                        break;
                    }
                    if (c12 == '\n') {
                        this.f72090e++;
                        this.f72091f = i15;
                    }
                    i11 = i15;
                }
                sb2.append(cArr, i14, i5);
                sb2.append(h0());
                i11 = this.f72088c;
                i12 = this.f72089d;
            }
        } while (h(1));
        m0("Unterminated string");
        throw null;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.f72092g = 0;
        this.f72096k[0] = 8;
        this.f72097l = 1;
        this.f72086a.close();
    }

    /* JADX WARN: Code restructure failed: missing block: B:169:0x0218, code lost:
    
        if (s(r12) != false) goto L125;
     */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0188 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0189  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x01ba  */
    /* JADX WARN: Removed duplicated region for block: B:204:0x0267  */
    /* JADX WARN: Removed duplicated region for block: B:208:0x0270 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:209:0x0271  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x02b3  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00ea  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int d() throws IOException {
        int iS;
        int i5;
        int iS2;
        String str;
        String str2;
        int i11;
        char c11;
        char c12;
        int i12;
        int[] iArr = this.f72096k;
        int i13 = this.f72097l - 1;
        int i14 = iArr[i13];
        char[] cArr = this.f72087b;
        if (i14 == 1) {
            iArr[i13] = 2;
        } else if (i14 == 2) {
            int iS3 = S(true);
            if (iS3 != 44) {
                if (iS3 != 59) {
                    if (iS3 == 93) {
                        this.f72092g = 4;
                        return 4;
                    }
                    m0("Unterminated array");
                    throw null;
                }
                c();
            }
        } else {
            if (i14 == 3 || i14 == 5) {
                iArr[i13] = 4;
                if (i14 == 5 && (iS = S(true)) != 44) {
                    if (iS != 59) {
                        if (iS == 125) {
                            this.f72092g = 2;
                            return 2;
                        }
                        m0("Unterminated object");
                        throw null;
                    }
                    c();
                }
                int iS4 = S(true);
                if (iS4 == 34) {
                    this.f72092g = 13;
                    return 13;
                }
                if (iS4 == 39) {
                    c();
                    this.f72092g = 12;
                    return 12;
                }
                if (iS4 == 125) {
                    if (i14 != 5) {
                        this.f72092g = 2;
                        return 2;
                    }
                    m0("Expected name");
                    throw null;
                }
                c();
                this.f72088c--;
                if (s((char) iS4)) {
                    this.f72092g = 14;
                    return 14;
                }
                m0("Expected name");
                throw null;
            }
            if (i14 == 4) {
                iArr[i13] = 5;
                int iS5 = S(true);
                if (iS5 != 58) {
                    if (iS5 != 61) {
                        m0("Expected ':'");
                        throw null;
                    }
                    c();
                    if (this.f72088c < this.f72089d || h(1)) {
                        int i15 = this.f72088c;
                        if (cArr[i15] == '>') {
                            this.f72088c = i15 + 1;
                        }
                    }
                }
            } else {
                if (i14 != 6) {
                    if (i14 == 7) {
                        i5 = 0;
                        if (S(false) == -1) {
                            this.f72092g = 17;
                            return 17;
                        }
                        c();
                        this.f72088c--;
                    } else {
                        i5 = 0;
                        if (i14 == 8) {
                            throw new IllegalStateException("JsonReader is closed");
                        }
                    }
                    iS2 = S(true);
                    if (iS2 != 34) {
                        this.f72092g = 9;
                        return 9;
                    }
                    if (iS2 == 39) {
                        c();
                        this.f72092g = 8;
                        return 8;
                    }
                    if (iS2 != 44 && iS2 != 59) {
                        if (iS2 == 91) {
                            this.f72092g = 3;
                            return 3;
                        }
                        if (iS2 != 93) {
                            if (iS2 == 123) {
                                this.f72092g = 1;
                                return 1;
                            }
                            int i16 = this.f72088c - 1;
                            this.f72088c = i16;
                            char c13 = cArr[i16];
                            if (c13 == 't' || c13 == 'T') {
                                str = InneractiveMediationDefs.SHOW_HOUSE_AD_YES;
                                str2 = "TRUE";
                                i11 = 5;
                            } else if (c13 == 'f' || c13 == 'F') {
                                str = "false";
                                str2 = "FALSE";
                                i11 = 6;
                            } else {
                                if (c13 == 'n' || c13 == 'N') {
                                    str = AbstractJsonLexerKt.NULL;
                                    str2 = "NULL";
                                    i11 = 7;
                                }
                                i11 = i5;
                                if (i11 == 0) {
                                    return i11;
                                }
                                int i17 = this.f72088c;
                                int i18 = this.f72089d;
                                int i19 = i5;
                                int i21 = i19;
                                int i22 = i21;
                                int i23 = i17;
                                boolean z11 = true;
                                long j11 = 0;
                                while (true) {
                                    if (i23 + i21 == i18) {
                                        if (i21 == cArr.length) {
                                            break;
                                        }
                                        if (!h(i21 + 1)) {
                                            break;
                                        }
                                        i23 = this.f72088c;
                                        i18 = this.f72089d;
                                        c12 = cArr[i23 + i21];
                                        if (c12 != '+') {
                                        }
                                    } else {
                                        c12 = cArr[i23 + i21];
                                        if (c12 != '+') {
                                            if (i19 != 5) {
                                                break;
                                            }
                                            i19 = 6;
                                            i21++;
                                        } else if (c12 == 'E' || c12 == 'e') {
                                            if (i19 != 2 && i19 != 4) {
                                                break;
                                            }
                                            i19 = 5;
                                            i21++;
                                        } else if (c12 != '-') {
                                            if (c12 == '.') {
                                                if (i19 != 2) {
                                                    break;
                                                }
                                                i19 = 3;
                                                i21++;
                                            } else {
                                                if (c12 < '0' || c12 > '9') {
                                                    break;
                                                }
                                                if (i19 == 1 || i19 == 0) {
                                                    j11 = -(c12 - '0');
                                                    i19 = 2;
                                                } else if (i19 == 2) {
                                                    if (j11 == 0) {
                                                        break;
                                                    }
                                                    long j12 = (10 * j11) - (c12 - '0');
                                                    z11 &= j11 > -922337203685477580L || (j11 == -922337203685477580L && j12 < j11);
                                                    j11 = j12;
                                                } else if (i19 == 3) {
                                                    i19 = 4;
                                                } else if (i19 == 5 || i19 == 6) {
                                                    i19 = 7;
                                                }
                                                i21++;
                                            }
                                        } else if (i19 == 0) {
                                            i19 = 1;
                                            i22 = 1;
                                            i21++;
                                        } else {
                                            if (i19 != 5) {
                                                break;
                                            }
                                            i19 = 6;
                                            i21++;
                                        }
                                    }
                                    if (i12 == 0) {
                                        return i12;
                                    }
                                    if (!s(cArr[this.f72088c])) {
                                        m0("Expected value");
                                        throw null;
                                    }
                                    c();
                                    this.f72092g = 10;
                                    return 10;
                                }
                                int i24 = 2;
                                if (i19 != 2) {
                                    if (i19 != i24 || i19 == 4 || i19 == 7) {
                                        this.f72094i = i21;
                                        i12 = 16;
                                        this.f72092g = 16;
                                    } else {
                                        i12 = 0;
                                    }
                                } else if (!z11 || ((j11 == Long.MIN_VALUE && i22 == 0) || (j11 == 0 && i22 != 0))) {
                                    i24 = 2;
                                    if (i19 != i24) {
                                    }
                                    this.f72094i = i21;
                                    i12 = 16;
                                    this.f72092g = 16;
                                } else {
                                    if (i22 == 0) {
                                        j11 = -j11;
                                    }
                                    this.f72093h = j11;
                                    this.f72088c += i21;
                                    i12 = 15;
                                    this.f72092g = 15;
                                }
                                if (i12 == 0) {
                                }
                            }
                            int i25 = this.o != 3 ? 1 : i5;
                            int length = str.length();
                            int i26 = i5;
                            while (true) {
                                if (i26 < length) {
                                    if ((this.f72088c + i26 >= this.f72089d && !h(i26 + 1)) || ((c11 = cArr[this.f72088c + i26]) != str.charAt(i26) && (i25 == 0 || c11 != str2.charAt(i26)))) {
                                        break;
                                    }
                                    i26++;
                                } else {
                                    if ((this.f72088c + length < this.f72089d || h(length + 1)) && s(cArr[this.f72088c + length])) {
                                        break;
                                    }
                                    this.f72088c += length;
                                    this.f72092g = i11;
                                }
                            }
                            i11 = i5;
                            if (i11 == 0) {
                            }
                        } else if (i14 == 1) {
                            this.f72092g = 4;
                            return 4;
                        }
                    }
                    if (i14 != 1 && i14 != 2) {
                        m0("Unexpected value");
                        throw null;
                    }
                    c();
                    this.f72088c--;
                    this.f72092g = 7;
                    return 7;
                }
                if (this.o == 1) {
                    S(true);
                    int i27 = this.f72088c;
                    this.f72088c = i27 - 1;
                    if (i27 + 4 <= this.f72089d || h(5)) {
                        int i28 = this.f72088c;
                        if (cArr[i28] == ')' && cArr[i28 + 1] == ']' && cArr[i28 + 2] == '}' && cArr[i28 + 3] == '\'' && cArr[i28 + 4] == '\n') {
                            this.f72088c = i28 + 5;
                        }
                    }
                }
                this.f72096k[this.f72097l - 1] = 7;
            }
        }
        i5 = 0;
        iS2 = S(true);
        if (iS2 != 34) {
        }
    }

    public final String d0() {
        String str;
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        if (iD == 10) {
            str = e0();
        } else if (iD == 8) {
            str = c0('\'');
        } else if (iD == 9) {
            str = c0(AbstractJsonLexerKt.STRING);
        } else if (iD == 11) {
            str = this.f72095j;
            this.f72095j = null;
        } else if (iD == 15) {
            str = Long.toString(this.f72093h);
        } else {
            if (iD != 16) {
                throw n0("a string");
            }
            str = new String(this.f72087b, this.f72088c, this.f72094i);
            this.f72088c += this.f72094i;
        }
        this.f72092g = 0;
        int[] iArr = this.n;
        int i5 = this.f72097l - 1;
        iArr[i5] = iArr[i5] + 1;
        return str;
    }

    public final void e() {
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        if (iD != 4) {
            throw n0("END_ARRAY");
        }
        int i5 = this.f72097l;
        this.f72097l = i5 - 1;
        int[] iArr = this.n;
        int i11 = i5 - 2;
        iArr[i11] = iArr[i11] + 1;
        this.f72092g = 0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x004a, code lost:
    
        c();
     */
    /* JADX WARN: Failed to find 'out' block for switch in B:32:0x0044. Please report as an issue. */
    /* JADX WARN: Removed duplicated region for block: B:46:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0084  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String e0() throws MalformedJsonException {
        char[] cArr;
        String string;
        StringBuilder sb2 = null;
        int i5 = 0;
        do {
            int i11 = 0;
            while (true) {
                int i12 = this.f72088c;
                int i13 = i12 + i11;
                int i14 = this.f72089d;
                cArr = this.f72087b;
                if (i13 < i14) {
                    char c11 = cArr[i12 + i11];
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
                    sb2.append(cArr, this.f72088c, i11);
                    this.f72088c += i11;
                } else if (h(i11 + 1)) {
                }
            }
            i5 = i11;
            if (sb2 != null) {
                string = new String(cArr, this.f72088c, i5);
            } else {
                sb2.append(cArr, this.f72088c, i5);
                string = sb2.toString();
            }
            this.f72088c += i5;
            return string;
        } while (h(1));
        if (sb2 != null) {
        }
        this.f72088c += i5;
        return string;
    }

    public final void f() {
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        if (iD != 2) {
            throw n0("END_OBJECT");
        }
        int i5 = this.f72097l;
        int i11 = i5 - 1;
        this.f72097l = i11;
        this.f72098m[i11] = null;
        int[] iArr = this.n;
        int i12 = i5 - 2;
        iArr[i12] = iArr[i12] + 1;
        this.f72092g = 0;
    }

    public final int f0() {
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        switch (iD) {
            case 1:
                return 3;
            case 2:
                return 4;
            case 3:
                return 1;
            case 4:
                return 2;
            case 5:
            case 6:
                return 8;
            case 7:
                return 9;
            case 8:
            case 9:
            case 10:
            case 11:
                return 6;
            case 12:
            case 13:
            case 14:
                return 5;
            case 15:
            case 16:
                return 7;
            case 17:
                return 10;
            default:
                throw new AssertionError();
        }
    }

    public final void g0(int i5) throws MalformedJsonException {
        int i11 = this.f72097l;
        if (i11 - 1 >= 255) {
            throw new MalformedJsonException("Nesting limit 255 reached" + w());
        }
        int[] iArr = this.f72096k;
        if (i11 == iArr.length) {
            int i12 = i11 * 2;
            this.f72096k = Arrays.copyOf(iArr, i12);
            this.n = Arrays.copyOf(this.n, i12);
            this.f72098m = (String[]) Arrays.copyOf(this.f72098m, i12);
        }
        int[] iArr2 = this.f72096k;
        int i13 = this.f72097l;
        this.f72097l = i13 + 1;
        iArr2[i13] = i5;
    }

    public final boolean h(int i5) throws IOException {
        int i11;
        int i12;
        int i13 = this.f72091f;
        int i14 = this.f72088c;
        this.f72091f = i13 - i14;
        int i15 = this.f72089d;
        char[] cArr = this.f72087b;
        if (i15 != i14) {
            int i16 = i15 - i14;
            this.f72089d = i16;
            System.arraycopy(cArr, i14, cArr, 0, i16);
        } else {
            this.f72089d = 0;
        }
        this.f72088c = 0;
        do {
            int i17 = this.f72089d;
            int i18 = this.f72086a.read(cArr, i17, cArr.length - i17);
            if (i18 == -1) {
                return false;
            }
            i11 = this.f72089d + i18;
            this.f72089d = i11;
            if (this.f72090e == 0 && (i12 = this.f72091f) == 0 && i11 > 0 && cArr[0] == 65279) {
                this.f72088c++;
                this.f72091f = i12 + 1;
                i5++;
            }
        } while (i11 < i5);
        return true;
    }

    public final char h0() throws MalformedJsonException {
        int i5;
        if (this.f72088c == this.f72089d && !h(1)) {
            m0("Unterminated escape sequence");
            throw null;
        }
        int i11 = this.f72088c;
        int i12 = i11 + 1;
        this.f72088c = i12;
        char[] cArr = this.f72087b;
        char c11 = cArr[i11];
        if (c11 != '\n') {
            if (c11 != '\"') {
                if (c11 != '\'') {
                    if (c11 != '/' && c11 != '\\') {
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
                            m0("Invalid escape sequence");
                            throw null;
                        }
                        if (i11 + 5 > this.f72089d && !h(4)) {
                            m0("Unterminated escape sequence");
                            throw null;
                        }
                        int i13 = this.f72088c;
                        int i14 = i13 + 4;
                        int i15 = 0;
                        while (i13 < i14) {
                            char c12 = cArr[i13];
                            int i16 = i15 << 4;
                            if (c12 >= '0' && c12 <= '9') {
                                i5 = c12 - '0';
                            } else if (c12 >= 'a' && c12 <= 'f') {
                                i5 = c12 - 'W';
                            } else {
                                if (c12 < 'A' || c12 > 'F') {
                                    m0("Malformed Unicode escape \\u".concat(new String(cArr, this.f72088c, 4)));
                                    throw null;
                                }
                                i5 = c12 - '7';
                            }
                            i15 = i5 + i16;
                            i13++;
                        }
                        this.f72088c += 4;
                        return (char) i15;
                    }
                }
            }
            return c11;
        }
        if (this.o == 3) {
            m0("Cannot escape a newline character in strict mode");
            throw null;
        }
        this.f72090e++;
        this.f72091f = i12;
        if (this.o == 3) {
            m0("Invalid escaped character \"'\" in strict mode");
            throw null;
        }
        return c11;
    }

    public final void i0(char c11) throws MalformedJsonException {
        do {
            int i5 = this.f72088c;
            int i11 = this.f72089d;
            while (i5 < i11) {
                int i12 = i5 + 1;
                char c12 = this.f72087b[i5];
                if (c12 == c11) {
                    this.f72088c = i12;
                    return;
                }
                if (c12 == '\\') {
                    this.f72088c = i12;
                    h0();
                    i5 = this.f72088c;
                    i11 = this.f72089d;
                } else {
                    if (c12 == '\n') {
                        this.f72090e++;
                        this.f72091f = i12;
                    }
                    i5 = i12;
                }
            }
            this.f72088c = i5;
        } while (h(1));
        m0("Unterminated string");
        throw null;
    }

    public final void j0() {
        char c11;
        do {
            if (this.f72088c >= this.f72089d && !h(1)) {
                return;
            }
            int i5 = this.f72088c;
            int i11 = i5 + 1;
            this.f72088c = i11;
            c11 = this.f72087b[i5];
            if (c11 == '\n') {
                this.f72090e++;
                this.f72091f = i11;
                return;
            }
        } while (c11 != '\r');
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0048, code lost:
    
        c();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void k0() throws MalformedJsonException {
        do {
            int i5 = 0;
            while (true) {
                int i11 = this.f72088c;
                if (i11 + i5 < this.f72089d) {
                    char c11 = this.f72087b[i11 + i5];
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
                                                    i5++;
                                            }
                                            return;
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    this.f72088c = i11 + i5;
                }
            }
            this.f72088c += i5;
            return;
        } while (h(1));
    }

    public final String l(boolean z11) {
        StringBuilder sb2 = new StringBuilder("$");
        int i5 = 0;
        while (true) {
            int i11 = this.f72097l;
            if (i5 >= i11) {
                return sb2.toString();
            }
            int i12 = this.f72096k[i5];
            switch (i12) {
                case 1:
                case 2:
                    int i13 = this.n[i5];
                    if (z11 && i13 > 0 && i5 == i11 - 1) {
                        i13--;
                    }
                    sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
                    sb2.append(i13);
                    sb2.append(AbstractJsonLexerKt.END_LIST);
                    break;
                case 3:
                case 4:
                case 5:
                    sb2.append('.');
                    String str = this.f72098m[i5];
                    if (str == null) {
                        break;
                    } else {
                        sb2.append(str);
                        break;
                    }
                case 6:
                case 7:
                case 8:
                    break;
                default:
                    throw new AssertionError(c0.h(i12, "Unknown scope value: "));
            }
            i5++;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public final void l0() {
        int i5 = 0;
        do {
            int iD = this.f72092g;
            if (iD == 0) {
                iD = d();
            }
            switch (iD) {
                case 1:
                    g0(3);
                    i5++;
                    this.f72092g = 0;
                    break;
                case 2:
                    if (i5 == 0) {
                        this.f72098m[this.f72097l - 1] = null;
                    }
                    this.f72097l--;
                    i5--;
                    this.f72092g = 0;
                    break;
                case 3:
                    g0(1);
                    i5++;
                    this.f72092g = 0;
                    break;
                case 4:
                    this.f72097l--;
                    i5--;
                    this.f72092g = 0;
                    break;
                case 5:
                case 6:
                case 7:
                case 11:
                case 15:
                default:
                    this.f72092g = 0;
                    break;
                case 8:
                    i0('\'');
                    this.f72092g = 0;
                    break;
                case 9:
                    i0(AbstractJsonLexerKt.STRING);
                    this.f72092g = 0;
                    break;
                case 10:
                    k0();
                    this.f72092g = 0;
                    break;
                case 12:
                    i0('\'');
                    if (i5 == 0) {
                        this.f72098m[this.f72097l - 1] = "<skipped>";
                    }
                    this.f72092g = 0;
                    break;
                case 13:
                    i0(AbstractJsonLexerKt.STRING);
                    if (i5 == 0) {
                        this.f72098m[this.f72097l - 1] = "<skipped>";
                    }
                    this.f72092g = 0;
                    break;
                case 14:
                    k0();
                    if (i5 == 0) {
                        this.f72098m[this.f72097l - 1] = "<skipped>";
                    }
                    this.f72092g = 0;
                    break;
                case 16:
                    this.f72088c += this.f72094i;
                    this.f72092g = 0;
                    break;
                case 17:
                    break;
            }
            return;
        } while (i5 > 0);
        int[] iArr = this.n;
        int i11 = this.f72097l - 1;
        iArr[i11] = iArr[i11] + 1;
    }

    public final void m0(String str) throws MalformedJsonException {
        StringBuilder sbQ = a2.c.q(str);
        sbQ.append(w());
        sbQ.append("\nSee ");
        sbQ.append("https://github.com/google/gson/blob/main/Troubleshooting.md#".concat("malformed-json"));
        throw new MalformedJsonException(sbQ.toString());
    }

    public final IllegalStateException n0(String str) {
        String str2 = f0() == 9 ? "adapter-not-null-safe" : "unexpected-json-structure";
        StringBuilder sbK = u4.k("Expected ", str, " but was ");
        sbK.append(fq.c.y(f0()));
        sbK.append(w());
        sbK.append("\nSee ");
        sbK.append("https://github.com/google/gson/blob/main/Troubleshooting.md#".concat(str2));
        return new IllegalStateException(sbK.toString());
    }

    public final boolean p() throws IOException {
        int iD = this.f72092g;
        if (iD == 0) {
            iD = d();
        }
        return (iD == 2 || iD == 4 || iD == 17) ? false : true;
    }

    public final boolean s(char c11) throws MalformedJsonException {
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

    public final String toString() {
        return a.class.getSimpleName() + w();
    }

    public final String w() {
        StringBuilder sbT = c0.t(this.f72090e + 1, " at line ", " column ", (this.f72088c - this.f72091f) + 1, " path ");
        sbT.append(l(false));
        return sbT.toString();
    }
}
