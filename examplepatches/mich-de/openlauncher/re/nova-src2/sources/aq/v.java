package aq;

import ads_mobile_sdk.pd;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.squareup.moshi.JsonDataException;
import com.squareup.moshi.JsonEncodingException;
import io.sentry.e3;
import java.io.EOFException;
import java.io.IOException;
import kotlin.text.Charsets;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class v extends u {

    /* renamed from: k, reason: collision with root package name */
    public static final m90.j f15516k;

    /* renamed from: l, reason: collision with root package name */
    public static final m90.j f15517l;

    /* renamed from: m, reason: collision with root package name */
    public static final m90.j f15518m;
    public static final m90.j n;
    public static final m90.j o;

    /* renamed from: e, reason: collision with root package name */
    public final m90.i f15519e;

    /* renamed from: f, reason: collision with root package name */
    public final m90.g f15520f;

    /* renamed from: g, reason: collision with root package name */
    public int f15521g;

    /* renamed from: h, reason: collision with root package name */
    public long f15522h;

    /* renamed from: i, reason: collision with root package name */
    public int f15523i;

    /* renamed from: j, reason: collision with root package name */
    public String f15524j;

    static {
        m90.j jVar = m90.j.f76130d;
        f15516k = lm.e.n("'\\");
        f15517l = lm.e.n("\"\\");
        f15518m = lm.e.n("{}[]:, \n\t\r\f/\\;#=");
        n = lm.e.n("\n\r");
        o = lm.e.n("*/");
    }

    public v(m90.i iVar) {
        this.f15513b = new int[32];
        this.f15514c = new String[32];
        this.f15515d = new int[32];
        this.f15521g = 0;
        this.f15519e = iVar;
        this.f15520f = iVar.i();
        A(6);
    }

    @Override // aq.u
    public final int D(e3 e3Var) throws EOFException, JsonEncodingException {
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        if (iV < 12 || iV > 15) {
            return -1;
        }
        if (iV == 15) {
            return c0(this.f15524j, e3Var);
        }
        int iV2 = this.f15519e.v((m90.x) e3Var.f67209c);
        if (iV2 != -1) {
            this.f15521g = 0;
            this.f15514c[this.f15512a - 1] = ((String[]) e3Var.f67208b)[iV2];
            return iV2;
        }
        String str = this.f15514c[this.f15512a - 1];
        String strF0 = f0();
        int iC0 = c0(strF0, e3Var);
        if (iC0 == -1) {
            this.f15521g = 15;
            this.f15524j = strF0;
            this.f15514c[this.f15512a - 1] = str;
        }
        return iC0;
    }

    @Override // aq.u
    public final void K() throws EOFException, JsonEncodingException {
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        if (iV == 14) {
            long jT = this.f15519e.t(f15518m);
            m90.g gVar = this.f15520f;
            if (jT == -1) {
                jT = gVar.f76126b;
            }
            gVar.skip(jT);
        } else if (iV == 13) {
            k0(f15517l);
        } else if (iV == 12) {
            k0(f15516k);
        } else if (iV != 15) {
            throw new JsonDataException("Expected a name but was " + a80.m.y(w()) + " at path " + e());
        }
        this.f15521g = 0;
        this.f15514c[this.f15512a - 1] = AbstractJsonLexerKt.NULL;
    }

    @Override // aq.u
    public final void M() throws EOFException, JsonEncodingException {
        int i5 = 0;
        do {
            int iV = this.f15521g;
            if (iV == 0) {
                iV = V();
            }
            if (iV == 3) {
                A(1);
            } else if (iV == 1) {
                A(3);
            } else {
                if (iV == 4) {
                    i5--;
                    if (i5 < 0) {
                        throw new JsonDataException("Expected a value but was " + a80.m.y(w()) + " at path " + e());
                    }
                    this.f15512a--;
                } else if (iV == 2) {
                    i5--;
                    if (i5 < 0) {
                        throw new JsonDataException("Expected a value but was " + a80.m.y(w()) + " at path " + e());
                    }
                    this.f15512a--;
                } else {
                    m90.g gVar = this.f15520f;
                    if (iV == 14 || iV == 10) {
                        long jT = this.f15519e.t(f15518m);
                        if (jT == -1) {
                            jT = gVar.f76126b;
                        }
                        gVar.skip(jT);
                    } else if (iV == 9 || iV == 13) {
                        k0(f15517l);
                    } else if (iV == 8 || iV == 12) {
                        k0(f15516k);
                    } else if (iV == 17) {
                        gVar.skip(this.f15523i);
                    } else if (iV == 18) {
                        throw new JsonDataException("Expected a value but was " + a80.m.y(w()) + " at path " + e());
                    }
                }
                this.f15521g = 0;
            }
            i5++;
            this.f15521g = 0;
        } while (i5 != 0);
        int[] iArr = this.f15515d;
        int i11 = this.f15512a - 1;
        iArr[i11] = iArr[i11] + 1;
        this.f15514c[i11] = AbstractJsonLexerKt.NULL;
    }

    public final void S() throws JsonEncodingException {
        P("Use JsonReader.setLenient(true) to accept malformed JSON");
        throw null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:139:0x01b5, code lost:
    
        if (e0(r7) != false) goto L120;
     */
    /* JADX WARN: Code restructure failed: missing block: B:141:0x01b8, code lost:
    
        if (r2 != 2) goto L155;
     */
    /* JADX WARN: Code restructure failed: missing block: B:142:0x01ba, code lost:
    
        if (r5 == 0) goto L147;
     */
    /* JADX WARN: Code restructure failed: missing block: B:144:0x01c0, code lost:
    
        if (r18 != Long.MIN_VALUE) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:145:0x01c2, code lost:
    
        if (r6 == 0) goto L147;
     */
    /* JADX WARN: Code restructure failed: missing block: B:147:0x01c5, code lost:
    
        r3 = 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:149:0x01c9, code lost:
    
        if (r18 != r16) goto L151;
     */
    /* JADX WARN: Code restructure failed: missing block: B:150:0x01cb, code lost:
    
        if (r6 != 0) goto L147;
     */
    /* JADX WARN: Code restructure failed: missing block: B:151:0x01cd, code lost:
    
        if (r6 == 0) goto L153;
     */
    /* JADX WARN: Code restructure failed: missing block: B:152:0x01cf, code lost:
    
        r8 = r18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x01d2, code lost:
    
        r8 = -r18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:154:0x01d5, code lost:
    
        r23.f15522h = r8;
        r11.skip(r4);
        r10 = 16;
        r23.f15521g = 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:155:0x01e0, code lost:
    
        if (r2 == r3) goto L160;
     */
    /* JADX WARN: Code restructure failed: missing block: B:157:0x01e3, code lost:
    
        if (r2 == 4) goto L160;
     */
    /* JADX WARN: Code restructure failed: missing block: B:159:0x01e6, code lost:
    
        if (r2 != 7) goto L120;
     */
    /* JADX WARN: Code restructure failed: missing block: B:160:0x01e8, code lost:
    
        r23.f15523i = r4;
        r10 = 17;
        r23.f15521g = 17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x0146, code lost:
    
        r3 = 2;
     */
    /* JADX WARN: Removed duplicated region for block: B:179:0x0216 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:180:0x0217  */
    /* JADX WARN: Removed duplicated region for block: B:205:0x0267  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0134 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0135  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int V() throws EOFException, JsonEncodingException {
        int i5;
        int iG0;
        int i11;
        int i12;
        String str;
        String str2;
        long j11;
        char cF;
        int i13;
        int i14;
        int[] iArr = this.f15513b;
        int i15 = 1;
        int i16 = this.f15512a - 1;
        int i17 = iArr[i16];
        m90.i iVar = this.f15519e;
        long j12 = 0;
        m90.g gVar = this.f15520f;
        if (i17 == 1) {
            iArr[i16] = 2;
        } else if (i17 == 2) {
            int iG02 = g0(true);
            gVar.readByte();
            if (iG02 != 44) {
                if (iG02 != 59) {
                    if (iG02 == 93) {
                        this.f15521g = 4;
                        return 4;
                    }
                    P("Unterminated array");
                    throw null;
                }
                S();
            }
        } else {
            if (i17 == 3 || i17 == 5) {
                iArr[i16] = 4;
                if (i17 == 5) {
                    int iG03 = g0(true);
                    gVar.readByte();
                    if (iG03 != 44) {
                        if (iG03 != 59) {
                            if (iG03 == 125) {
                                this.f15521g = 2;
                                return 2;
                            }
                            P("Unterminated object");
                            throw null;
                        }
                        S();
                    }
                }
                int iG04 = g0(true);
                if (iG04 == 34) {
                    gVar.readByte();
                    this.f15521g = 13;
                    return 13;
                }
                if (iG04 == 39) {
                    gVar.readByte();
                    S();
                    this.f15521g = 12;
                    return 12;
                }
                if (iG04 != 125) {
                    S();
                    if (e0((char) iG04)) {
                        this.f15521g = 14;
                        return 14;
                    }
                    P("Expected name");
                    throw null;
                }
                if (i17 == 5) {
                    P("Expected name");
                    throw null;
                }
                gVar.readByte();
                this.f15521g = 2;
                return 2;
            }
            if (i17 == 4) {
                iArr[i16] = 5;
                int iG05 = g0(true);
                gVar.readByte();
                if (iG05 != 58) {
                    if (iG05 != 61) {
                        P("Expected ':'");
                        throw null;
                    }
                    S();
                    if (iVar.j(1L) && gVar.f(0L) == 62) {
                        gVar.readByte();
                    }
                }
            } else {
                if (i17 != 6) {
                    if (i17 == 7) {
                        i5 = 0;
                        if (g0(false) == -1) {
                            this.f15521g = 18;
                            return 18;
                        }
                        S();
                    } else {
                        i5 = 0;
                        if (i17 == 9) {
                            throw null;
                        }
                        if (i17 == 8) {
                            throw new IllegalStateException("JsonReader is closed");
                        }
                    }
                    iG0 = g0(true);
                    if (iG0 != 34) {
                        gVar.readByte();
                        this.f15521g = 9;
                        return 9;
                    }
                    if (iG0 == 39) {
                        S();
                        gVar.readByte();
                        this.f15521g = 8;
                        return 8;
                    }
                    if (iG0 == 44 || iG0 == 59) {
                        i11 = 1;
                    } else {
                        if (iG0 == 91) {
                            gVar.readByte();
                            this.f15521g = 3;
                            return 3;
                        }
                        if (iG0 == 93) {
                            i11 = 1;
                            if (i17 == 1) {
                                gVar.readByte();
                                this.f15521g = 4;
                                return 4;
                            }
                        } else {
                            if (iG0 == 123) {
                                gVar.readByte();
                                this.f15521g = 1;
                                return 1;
                            }
                            byte bF = gVar.f(0L);
                            if (bF == 116 || bF == 84) {
                                i12 = 5;
                                str2 = InneractiveMediationDefs.SHOW_HOUSE_AD_YES;
                                str = "TRUE";
                            } else if (bF == 102 || bF == 70) {
                                i12 = 6;
                                str2 = "false";
                                str = "FALSE";
                            } else if (bF == 110 || bF == 78) {
                                i12 = 7;
                                str2 = AbstractJsonLexerKt.NULL;
                                str = "NULL";
                            } else {
                                i12 = i5;
                                j11 = 0;
                                if (i12 == 0) {
                                    return i12;
                                }
                                int i18 = i5;
                                int i19 = i18;
                                int i21 = i19;
                                int i22 = 1;
                                long j13 = j11;
                                while (true) {
                                    int i23 = i19 + 1;
                                    long j14 = j13;
                                    if (!iVar.j(i23)) {
                                        break;
                                    }
                                    byte bF2 = gVar.f(i19);
                                    if (bF2 != 43) {
                                        if (bF2 == 69 || bF2 == 101) {
                                            if (i18 != 2 && i18 != 4) {
                                                break;
                                            }
                                            i18 = 5;
                                            i19 = i23;
                                            j13 = j14;
                                            i15 = 1;
                                        } else if (bF2 == 45) {
                                            i14 = 6;
                                            if (i18 == 0) {
                                                i18 = 1;
                                                i21 = 1;
                                                i19 = i23;
                                                j13 = j14;
                                                i15 = 1;
                                            } else {
                                                if (i18 != 5) {
                                                    break;
                                                }
                                                i18 = i14;
                                                i19 = i23;
                                                j13 = j14;
                                                i15 = 1;
                                            }
                                        } else if (bF2 == 46) {
                                            if (i18 != 2) {
                                                break;
                                            }
                                            i18 = 3;
                                            i19 = i23;
                                            j13 = j14;
                                            i15 = 1;
                                        } else {
                                            if (bF2 < 48 || bF2 > 57) {
                                                break;
                                            }
                                            if (i18 == i15 || i18 == 0) {
                                                j14 = -(bF2 - 48);
                                                i18 = 2;
                                            } else if (i18 == 2) {
                                                if (j14 == j11) {
                                                    break;
                                                }
                                                long j15 = (10 * j14) - (bF2 - 48);
                                                i22 &= (j14 > -922337203685477580L || (j14 == -922337203685477580L && j15 < j14)) ? 1 : i5;
                                                j14 = j15;
                                            } else if (i18 == 3) {
                                                i18 = 4;
                                            } else if (i18 == 5 || i18 == 6) {
                                                i18 = 7;
                                            }
                                            i19 = i23;
                                            j13 = j14;
                                            i15 = 1;
                                        }
                                        if (i13 == 0) {
                                            return i13;
                                        }
                                        if (!e0(gVar.f(j11))) {
                                            P("Expected value");
                                            throw null;
                                        }
                                        S();
                                        this.f15521g = 10;
                                        return 10;
                                    }
                                    i14 = 6;
                                    if (i18 != 5) {
                                        break;
                                    }
                                    i18 = i14;
                                    i19 = i23;
                                    j13 = j14;
                                    i15 = 1;
                                }
                                i13 = i5;
                                if (i13 == 0) {
                                }
                            }
                            int length = str2.length();
                            int i24 = 1;
                            while (true) {
                                if (i24 < length) {
                                    int i25 = i24 + 1;
                                    j11 = j12;
                                    if (!iVar.j(i25) || ((cF = gVar.f(i24)) != str2.charAt(i24) && cF != str.charAt(i24))) {
                                        break;
                                    }
                                    i24 = i25;
                                    j12 = j11;
                                } else {
                                    j11 = j12;
                                    if (!iVar.j(length + 1) || !e0(gVar.f(length))) {
                                        gVar.skip(length);
                                        this.f15521g = i12;
                                    }
                                }
                            }
                            i12 = i5;
                            if (i12 == 0) {
                            }
                        }
                    }
                    if (i17 != i11 && i17 != 2) {
                        P("Unexpected value");
                        throw null;
                    }
                    S();
                    this.f15521g = 7;
                    return 7;
                }
                iArr[i16] = 7;
            }
        }
        i5 = 0;
        iG0 = g0(true);
        if (iG0 != 34) {
        }
    }

    @Override // aq.u
    public final void a() throws EOFException, JsonEncodingException {
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        if (iV == 3) {
            A(1);
            this.f15515d[this.f15512a - 1] = 0;
            this.f15521g = 0;
        } else {
            throw new JsonDataException("Expected BEGIN_ARRAY but was " + a80.m.y(w()) + " at path " + e());
        }
    }

    @Override // aq.u
    public final void b() throws EOFException, JsonEncodingException {
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        if (iV == 1) {
            A(3);
            this.f15521g = 0;
        } else {
            throw new JsonDataException("Expected BEGIN_OBJECT but was " + a80.m.y(w()) + " at path " + e());
        }
    }

    @Override // aq.u
    public final void c() throws EOFException, JsonEncodingException {
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        if (iV != 4) {
            throw new JsonDataException("Expected END_ARRAY but was " + a80.m.y(w()) + " at path " + e());
        }
        int i5 = this.f15512a;
        this.f15512a = i5 - 1;
        int[] iArr = this.f15515d;
        int i11 = i5 - 2;
        iArr[i11] = iArr[i11] + 1;
        this.f15521g = 0;
    }

    public final int c0(String str, e3 e3Var) {
        int length = ((String[]) e3Var.f67208b).length;
        for (int i5 = 0; i5 < length; i5++) {
            if (str.equals(((String[]) e3Var.f67208b)[i5])) {
                this.f15521g = 0;
                this.f15514c[this.f15512a - 1] = str;
                return i5;
            }
        }
        return -1;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.f15521g = 0;
        this.f15513b[0] = 8;
        this.f15512a = 1;
        this.f15520f.a();
        this.f15519e.close();
    }

    @Override // aq.u
    public final void d() throws EOFException, JsonEncodingException {
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        if (iV != 2) {
            throw new JsonDataException("Expected END_OBJECT but was " + a80.m.y(w()) + " at path " + e());
        }
        int i5 = this.f15512a;
        int i11 = i5 - 1;
        this.f15512a = i11;
        this.f15514c[i11] = null;
        int[] iArr = this.f15515d;
        int i12 = i5 - 2;
        iArr[i12] = iArr[i12] + 1;
        this.f15521g = 0;
    }

    public final int d0(String str, e3 e3Var) {
        int length = ((String[]) e3Var.f67208b).length;
        for (int i5 = 0; i5 < length; i5++) {
            if (str.equals(((String[]) e3Var.f67208b)[i5])) {
                this.f15521g = 0;
                int[] iArr = this.f15515d;
                int i11 = this.f15512a - 1;
                iArr[i11] = iArr[i11] + 1;
                return i5;
            }
        }
        return -1;
    }

    public final boolean e0(int i5) throws JsonEncodingException {
        if (i5 == 9 || i5 == 10 || i5 == 12 || i5 == 13 || i5 == 32) {
            return false;
        }
        if (i5 != 35) {
            if (i5 == 44) {
                return false;
            }
            if (i5 != 47 && i5 != 61) {
                if (i5 == 123 || i5 == 125 || i5 == 58) {
                    return false;
                }
                if (i5 != 59) {
                    switch (i5) {
                        case 91:
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
        S();
        return false;
    }

    @Override // aq.u
    public final boolean f() throws EOFException, JsonEncodingException {
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        return (iV == 2 || iV == 4 || iV == 18) ? false : true;
    }

    public final String f0() throws EOFException, JsonEncodingException {
        String strH0;
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        if (iV == 14) {
            strH0 = i0();
        } else if (iV == 13) {
            strH0 = h0(f15517l);
        } else if (iV == 12) {
            strH0 = h0(f15516k);
        } else {
            if (iV != 15) {
                throw new JsonDataException("Expected a name but was " + a80.m.y(w()) + " at path " + e());
            }
            strH0 = this.f15524j;
            this.f15524j = null;
        }
        this.f15521g = 0;
        this.f15514c[this.f15512a - 1] = strH0;
        return strH0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0026, code lost:
    
        r1.skip(r3);
        r2 = aq.v.n;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0031, code lost:
    
        if (r6 != 47) goto L56;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0039, code lost:
    
        if (r5.j(2) != false) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x003d, code lost:
    
        S();
        r10 = r1.f(1);
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
        r5 = r5.t(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0057, code lost:
    
        if (r5 == (-1)) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0059, code lost:
    
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x005b, code lost:
    
        r5 = r1.f76126b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x005d, code lost:
    
        r1.skip(r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0061, code lost:
    
        r1.readByte();
        r1.readByte();
        r5 = r5.y(aq.v.o);
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
    
        r5 = r5 + r2.f76131a.length;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x007c, code lost:
    
        r5 = r1.f76126b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x007e, code lost:
    
        r1.skip(r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0081, code lost:
    
        if (r3 == false) goto L61;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0085, code lost:
    
        P("Unterminated comment");
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x008b, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x008e, code lost:
    
        if (r6 != 35) goto L62;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0090, code lost:
    
        S();
        r5 = r5.t(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0099, code lost:
    
        if (r5 == (-1)) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x009b, code lost:
    
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x009d, code lost:
    
        r5 = r1.f76126b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x009f, code lost:
    
        r1.skip(r5);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int g0(boolean z11) throws EOFException, JsonEncodingException {
        byte bF;
        while (true) {
            int i5 = 0;
            while (true) {
                int i11 = i5 + 1;
                m90.i iVar = this.f15519e;
                if (!iVar.j(i11)) {
                    if (z11) {
                        throw new EOFException("End of input");
                    }
                    return -1;
                }
                long j11 = i5;
                m90.g gVar = this.f15520f;
                bF = gVar.f(j11);
                if (bF != 10 && bF != 32 && bF != 13 && bF != 9) {
                    break;
                }
                i5 = i11;
            }
        }
        return bF;
    }

    @Override // aq.u
    public final double h() throws NumberFormatException, EOFException, JsonEncodingException {
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        if (iV == 16) {
            this.f15521g = 0;
            int[] iArr = this.f15515d;
            int i5 = this.f15512a - 1;
            iArr[i5] = iArr[i5] + 1;
            return this.f15522h;
        }
        if (iV == 17) {
            long j11 = this.f15523i;
            m90.g gVar = this.f15520f;
            gVar.getClass();
            this.f15524j = gVar.M(j11, Charsets.f72000b);
        } else if (iV == 9) {
            this.f15524j = h0(f15517l);
        } else if (iV == 8) {
            this.f15524j = h0(f15516k);
        } else if (iV == 10) {
            this.f15524j = i0();
        } else if (iV != 11) {
            throw new JsonDataException("Expected a double but was " + a80.m.y(w()) + " at path " + e());
        }
        this.f15521g = 11;
        try {
            double d5 = Double.parseDouble(this.f15524j);
            if (Double.isNaN(d5) || Double.isInfinite(d5)) {
                throw new JsonEncodingException("JSON forbids NaN and infinities: " + d5 + " at path " + e());
            }
            this.f15524j = null;
            this.f15521g = 0;
            int[] iArr2 = this.f15515d;
            int i11 = this.f15512a - 1;
            iArr2[i11] = iArr2[i11] + 1;
            return d5;
        } catch (NumberFormatException unused) {
            throw new JsonDataException("Expected a double but was " + this.f15524j + " at path " + e());
        }
    }

    public final String h0(m90.j jVar) throws EOFException, JsonEncodingException {
        StringBuilder sb2 = null;
        while (true) {
            long jT = this.f15519e.t(jVar);
            if (jT == -1) {
                P("Unterminated string");
                throw null;
            }
            m90.g gVar = this.f15520f;
            if (gVar.f(jT) != 92) {
                if (sb2 == null) {
                    String strM = gVar.M(jT, Charsets.f72000b);
                    gVar.readByte();
                    return strM;
                }
                sb2.append(gVar.M(jT, Charsets.f72000b));
                gVar.readByte();
                return sb2.toString();
            }
            if (sb2 == null) {
                sb2 = new StringBuilder();
            }
            sb2.append(gVar.M(jT, Charsets.f72000b));
            gVar.readByte();
            sb2.append(j0());
        }
    }

    public final String i0() {
        long jT = this.f15519e.t(f15518m);
        m90.g gVar = this.f15520f;
        if (jT == -1) {
            return gVar.P();
        }
        gVar.getClass();
        return gVar.M(jT, Charsets.f72000b);
    }

    public final char j0() throws EOFException, JsonEncodingException {
        int i5;
        m90.i iVar = this.f15519e;
        if (!iVar.j(1L)) {
            P("Unterminated escape sequence");
            throw null;
        }
        m90.g gVar = this.f15520f;
        byte b11 = gVar.readByte();
        if (b11 == 10 || b11 == 34 || b11 == 39 || b11 == 47 || b11 == 92) {
            return (char) b11;
        }
        if (b11 == 98) {
            return '\b';
        }
        if (b11 == 102) {
            return '\f';
        }
        if (b11 == 110) {
            return '\n';
        }
        if (b11 == 114) {
            return '\r';
        }
        if (b11 == 116) {
            return '\t';
        }
        if (b11 != 117) {
            P("Invalid escape sequence: \\" + ((char) b11));
            throw null;
        }
        if (!iVar.j(4L)) {
            throw new EOFException("Unterminated escape sequence at path " + e());
        }
        char c11 = 0;
        for (int i11 = 0; i11 < 4; i11++) {
            byte bF = gVar.f(i11);
            char c12 = (char) (c11 << 4);
            if (bF >= 48 && bF <= 57) {
                i5 = bF - 48;
            } else if (bF >= 97 && bF <= 102) {
                i5 = bF - 87;
            } else {
                if (bF < 65 || bF > 70) {
                    P("\\u".concat(gVar.M(4L, Charsets.f72000b)));
                    throw null;
                }
                i5 = bF - 55;
            }
            c11 = (char) (i5 + c12);
        }
        gVar.skip(4L);
        return c11;
    }

    public final void k0(m90.j jVar) throws EOFException, JsonEncodingException {
        while (true) {
            long jT = this.f15519e.t(jVar);
            if (jT == -1) {
                P("Unterminated string");
                throw null;
            }
            m90.g gVar = this.f15520f;
            if (gVar.f(jT) != 92) {
                gVar.skip(jT + 1);
                return;
            } else {
                gVar.skip(jT + 1);
                j0();
            }
        }
    }

    @Override // aq.u
    public final int l() throws NumberFormatException, EOFException, JsonEncodingException {
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        if (iV == 16) {
            long j11 = this.f15522h;
            int i5 = (int) j11;
            if (j11 == i5) {
                this.f15521g = 0;
                int[] iArr = this.f15515d;
                int i11 = this.f15512a - 1;
                iArr[i11] = iArr[i11] + 1;
                return i5;
            }
            throw new JsonDataException("Expected an int but was " + this.f15522h + " at path " + e());
        }
        if (iV == 17) {
            long j12 = this.f15523i;
            m90.g gVar = this.f15520f;
            gVar.getClass();
            this.f15524j = gVar.M(j12, Charsets.f72000b);
        } else if (iV == 9 || iV == 8) {
            String strH0 = iV == 9 ? h0(f15517l) : h0(f15516k);
            this.f15524j = strH0;
            try {
                int i12 = Integer.parseInt(strH0);
                this.f15521g = 0;
                int[] iArr2 = this.f15515d;
                int i13 = this.f15512a - 1;
                iArr2[i13] = iArr2[i13] + 1;
                return i12;
            } catch (NumberFormatException unused) {
            }
        } else if (iV != 11) {
            throw new JsonDataException("Expected an int but was " + a80.m.y(w()) + " at path " + e());
        }
        this.f15521g = 11;
        try {
            double d5 = Double.parseDouble(this.f15524j);
            int i14 = (int) d5;
            if (i14 != d5) {
                throw new JsonDataException("Expected an int but was " + this.f15524j + " at path " + e());
            }
            this.f15524j = null;
            this.f15521g = 0;
            int[] iArr3 = this.f15515d;
            int i15 = this.f15512a - 1;
            iArr3[i15] = iArr3[i15] + 1;
            return i14;
        } catch (NumberFormatException unused2) {
            throw new JsonDataException("Expected an int but was " + this.f15524j + " at path " + e());
        }
    }

    @Override // aq.u
    public final void p() throws EOFException, JsonEncodingException {
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        if (iV == 7) {
            this.f15521g = 0;
            int[] iArr = this.f15515d;
            int i5 = this.f15512a - 1;
            iArr[i5] = iArr[i5] + 1;
            return;
        }
        throw new JsonDataException("Expected null but was " + a80.m.y(w()) + " at path " + e());
    }

    @Override // aq.u
    public final String s() throws EOFException, JsonEncodingException {
        String strM;
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        if (iV == 10) {
            strM = i0();
        } else if (iV == 9) {
            strM = h0(f15517l);
        } else if (iV == 8) {
            strM = h0(f15516k);
        } else if (iV == 11) {
            strM = this.f15524j;
            this.f15524j = null;
        } else if (iV == 16) {
            strM = Long.toString(this.f15522h);
        } else {
            if (iV != 17) {
                throw new JsonDataException("Expected a string but was " + a80.m.y(w()) + " at path " + e());
            }
            long j11 = this.f15523i;
            m90.g gVar = this.f15520f;
            gVar.getClass();
            strM = gVar.M(j11, Charsets.f72000b);
        }
        this.f15521g = 0;
        int[] iArr = this.f15515d;
        int i5 = this.f15512a - 1;
        iArr[i5] = iArr[i5] + 1;
        return strM;
    }

    public final String toString() {
        return "JsonReader(" + this.f15519e + ")";
    }

    @Override // aq.u
    public final int w() throws EOFException, JsonEncodingException {
        int iV = this.f15521g;
        if (iV == 0) {
            iV = V();
        }
        switch (iV) {
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
            case 15:
                return 5;
            case 16:
            case 17:
                return 7;
            case 18:
                return 10;
            default:
                throw new AssertionError();
        }
    }
}
