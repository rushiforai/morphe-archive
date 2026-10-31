package y90;

import ads_mobile_sdk.pd;
import b.c0;
import b.u4;
import ba0.r;
import ba0.u;
import cl.k0;
import cl.l0;
import java.util.Arrays;
import java.util.BitSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import m.w;
import sp.g0;

/* loaded from: classes5.dex */
public final class k {

    /* renamed from: i, reason: collision with root package name */
    public static final Pattern f97055i = Pattern.compile("^[!\"#\\$%&'\\(\\)\\*\\+,\\-\\./:;<=>\\?@\\[\\\\\\]\\^_`\\{\\|\\}~\\p{Pc}\\p{Pd}\\p{Pe}\\p{Pf}\\p{Pi}\\p{Po}\\p{Ps}]");

    /* renamed from: j, reason: collision with root package name */
    public static final Pattern f97056j = Pattern.compile("^(?:<[A-Za-z][A-Za-z0-9-]*(?:\\s+[a-zA-Z_:][a-zA-Z0-9:._-]*(?:\\s*=\\s*(?:[^\"'=<>`\\x00-\\x20]+|'[^']*'|\"[^\"]*\"))?)*\\s*/?>|</[A-Za-z][A-Za-z0-9-]*\\s*[>]|<!---->|<!--(?:-?[^>-])(?:-?[^-])*-->|[<][?].*?[?][>]|<![A-Z]+\\s+[^>]*>|<!\\[CDATA\\[[\\s\\S]*?\\]\\]>)", 2);

    /* renamed from: k, reason: collision with root package name */
    public static final Pattern f97057k = Pattern.compile("^[!\"#$%&'()*+,./:;<=>?@\\[\\\\\\]^_`{|}~-]");

    /* renamed from: l, reason: collision with root package name */
    public static final Pattern f97058l = Pattern.compile("^&(?:#x[a-f0-9]{1,6}|#[0-9]{1,7}|[a-z][a-z0-9]{1,31});", 2);

    /* renamed from: m, reason: collision with root package name */
    public static final Pattern f97059m = Pattern.compile("`+");
    public static final Pattern n = Pattern.compile("^`+");
    public static final Pattern o = Pattern.compile("^<([a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*)>");

    /* renamed from: p, reason: collision with root package name */
    public static final Pattern f97060p = Pattern.compile("^<[a-zA-Z][a-zA-Z0-9.+-]{1,31}:[^<>\u0000- ]*>");

    /* renamed from: q, reason: collision with root package name */
    public static final Pattern f97061q = Pattern.compile("^ *(?:\n *)?");

    /* renamed from: r, reason: collision with root package name */
    public static final Pattern f97062r = Pattern.compile("^[\\p{Zs}\t\r\n\f]");

    /* renamed from: s, reason: collision with root package name */
    public static final Pattern f97063s = Pattern.compile("\\s+");

    /* renamed from: t, reason: collision with root package name */
    public static final Pattern f97064t = Pattern.compile(" *$");

    /* renamed from: a, reason: collision with root package name */
    public final BitSet f97065a;

    /* renamed from: b, reason: collision with root package name */
    public final BitSet f97066b;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f97067c;

    /* renamed from: d, reason: collision with root package name */
    public final w f97068d;

    /* renamed from: e, reason: collision with root package name */
    public String f97069e;

    /* renamed from: f, reason: collision with root package name */
    public int f97070f;

    /* renamed from: g, reason: collision with root package name */
    public d f97071g;

    /* renamed from: h, reason: collision with root package name */
    public c f97072h;

    public k(w wVar) {
        List list = (List) wVar.f75378b;
        HashMap map = new HashMap();
        b(Arrays.asList(new z90.a('*'), new z90.a('_')), map);
        b(list, map);
        this.f97067c = map;
        Set setKeySet = map.keySet();
        BitSet bitSet = new BitSet();
        Iterator it = setKeySet.iterator();
        while (it.hasNext()) {
            bitSet.set(((Character) it.next()).charValue());
        }
        this.f97066b = bitSet;
        BitSet bitSet2 = new BitSet();
        bitSet2.or(bitSet);
        bitSet2.set(10);
        bitSet2.set(96);
        bitSet2.set(91);
        bitSet2.set(93);
        bitSet2.set(92);
        bitSet2.set(33);
        bitSet2.set(60);
        bitSet2.set(38);
        this.f97065a = bitSet2;
        this.f97068d = wVar;
    }

    public static void a(char c11, ea0.a aVar, HashMap map) {
        if (((ea0.a) map.put(Character.valueOf(c11), aVar)) == null) {
            return;
        }
        throw new IllegalArgumentException("Delimiter processor conflict with delimiter char '" + c11 + "'");
    }

    public static void b(Iterable iterable, HashMap map) {
        q qVar;
        Iterator it = iterable.iterator();
        while (it.hasNext()) {
            ea0.a aVar = (ea0.a) it.next();
            char cD = aVar.d();
            char cB = aVar.b();
            if (cD == cB) {
                ea0.a aVar2 = (ea0.a) map.get(Character.valueOf(cD));
                if (aVar2 == null || aVar2.d() != aVar2.b()) {
                    a(cD, aVar, map);
                } else {
                    if (aVar2 instanceof q) {
                        qVar = (q) aVar2;
                    } else {
                        q qVar2 = new q(cD);
                        qVar2.f(aVar2);
                        qVar = qVar2;
                    }
                    qVar.f(aVar);
                    map.put(Character.valueOf(cD), qVar);
                }
            } else {
                a(cD, aVar, map);
                a(cB, aVar, map);
            }
        }
    }

    public static void d(ba0.w wVar, ba0.w wVar2, int i5) {
        if (wVar == null || wVar2 == null || wVar == wVar2) {
            return;
        }
        StringBuilder sb2 = new StringBuilder(i5);
        sb2.append(wVar.f17788f);
        r rVar = wVar.f17785e;
        r rVar2 = wVar2.f17785e;
        while (rVar != rVar2) {
            sb2.append(((ba0.w) rVar).f17788f);
            r rVar3 = rVar.f17785e;
            rVar.f();
            rVar = rVar3;
        }
        wVar.f17788f = sb2.toString();
    }

    public static void e(r rVar, r rVar2) {
        ba0.w wVar = null;
        ba0.w wVar2 = null;
        int length = 0;
        while (rVar != null) {
            if (rVar instanceof ba0.w) {
                wVar2 = (ba0.w) rVar;
                if (wVar == null) {
                    wVar = wVar2;
                }
                length = wVar2.f17788f.length() + length;
            } else {
                d(wVar, wVar2, length);
                wVar = null;
                wVar2 = null;
                length = 0;
            }
            if (rVar == rVar2) {
                break;
            } else {
                rVar = rVar.f17785e;
            }
        }
        d(wVar, wVar2, length);
    }

    public final String c(Pattern pattern) {
        if (this.f97070f >= this.f97069e.length()) {
            return null;
        }
        Matcher matcher = pattern.matcher(this.f97069e);
        matcher.region(this.f97070f, this.f97069e.length());
        if (!matcher.find()) {
            return null;
        }
        this.f97070f = matcher.end();
        return matcher.group();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:119:0x01f4 A[PHI: r2
      0x01f4: PHI (r2v79 char) = (r2v78 char), (r2v83 char), (r2v84 char) binds: [B:113:0x01e7, B:115:0x01eb, B:118:0x01f2] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:231:0x0468  */
    /* JADX WARN: Removed duplicated region for block: B:260:0x0514  */
    /* JADX WARN: Removed duplicated region for block: B:265:0x0534 A[LOOP:0: B:3:0x0013->B:265:0x0534, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:271:0x053b A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00f1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void f(String str, r rVar) {
        int i5;
        r uVar;
        r wVar;
        r wVar2;
        r wVar3;
        ba0.n nVar;
        String strC;
        r wVar4;
        int i11;
        String strA;
        boolean z11;
        String strA2;
        int iQ;
        int i12;
        boolean z12;
        boolean z13;
        g0 g0Var;
        this.f97069e = str.trim();
        int i13 = 0;
        this.f97070f = 0;
        ba0.w wVar5 = null;
        this.f97071g = null;
        this.f97072h = null;
        r rVar2 = null;
        while (true) {
            char cG = g();
            if (cG == 0) {
                i5 = i13;
            } else {
                if (cG != '\n') {
                    if (cG != '!') {
                        if (cG == '&') {
                            String strC2 = c(f97058l);
                            if (strC2 != null) {
                                wVar3 = new ba0.w(aa0.b.a(strC2));
                                wVar = wVar3;
                            }
                            wVar = null;
                        } else if (cG == '<') {
                            String strC3 = c(o);
                            if (strC3 != null) {
                                String strF = u4.f(1, 1, strC3);
                                nVar = new ba0.n(c0.k("mailto:", strF), null);
                                nVar.b(new ba0.w(strF));
                            } else {
                                String strC4 = c(f97060p);
                                if (strC4 != null) {
                                    String strF2 = u4.f(1, 1, strC4);
                                    nVar = new ba0.n(strF2, null);
                                    nVar.b(new ba0.w(strF2));
                                } else {
                                    wVar = null;
                                    if (wVar == null) {
                                        if (c(f97056j) != null) {
                                            wVar2 = new ba0.k();
                                            wVar = wVar2;
                                        }
                                        wVar = null;
                                    }
                                }
                            }
                            wVar = nVar;
                            if (wVar == null) {
                            }
                        } else if (cG != '`') {
                            switch (cG) {
                                case '[':
                                    int i14 = this.f97070f;
                                    this.f97070f = i14 + 1;
                                    ba0.w wVar6 = new ba0.w("[");
                                    c cVar = this.f97072h;
                                    c cVar2 = new c(wVar6, i14, cVar, this.f97071g, false);
                                    if (cVar != null) {
                                        cVar.f97016g = true;
                                    }
                                    this.f97072h = cVar2;
                                    wVar = wVar6;
                                    break;
                                case pd.N0 /* 92 */:
                                    this.f97070f++;
                                    if (g() == '\n') {
                                        wVar2 = new ba0.h();
                                        this.f97070f++;
                                    } else {
                                        if (this.f97070f < this.f97069e.length()) {
                                            String str2 = this.f97069e;
                                            int i15 = this.f97070f;
                                            if (f97057k.matcher(str2.substring(i15, i15 + 1)).matches()) {
                                                String str3 = this.f97069e;
                                                int i16 = this.f97070f;
                                                ba0.w wVar7 = new ba0.w(str3.substring(i16, i16 + 1));
                                                this.f97070f++;
                                                wVar = wVar7;
                                                break;
                                            }
                                        }
                                        wVar2 = new ba0.w("\\");
                                    }
                                    wVar = wVar2;
                                    break;
                                case pd.O0 /* 93 */:
                                    int i17 = this.f97070f + 1;
                                    this.f97070f = i17;
                                    c cVar3 = this.f97072h;
                                    if (cVar3 != null) {
                                        ba0.w wVar8 = cVar3.f97010a;
                                        boolean z14 = cVar3.f97012c;
                                        if (cVar3.f97015f) {
                                            int i18 = -1;
                                            if (g() == '(') {
                                                this.f97070f++;
                                                Pattern pattern = f97061q;
                                                c(pattern);
                                                i11 = 1;
                                                int iO = k0.O(this.f97070f, this.f97069e);
                                                if (iO == -1) {
                                                    strA2 = null;
                                                } else {
                                                    String strSubstring = g() == '<' ? this.f97069e.substring(this.f97070f + 1, iO - 1) : this.f97069e.substring(this.f97070f, iO);
                                                    this.f97070f = iO;
                                                    strA2 = aa0.a.a(strSubstring);
                                                }
                                                if (strA2 != null) {
                                                    c(pattern);
                                                    String str4 = this.f97069e;
                                                    int i19 = this.f97070f;
                                                    if (f97063s.matcher(str4.substring(i19 - 1, i19)).matches()) {
                                                        String str5 = this.f97069e;
                                                        int i21 = this.f97070f;
                                                        if (i21 >= str5.length()) {
                                                            i12 = -1;
                                                        } else {
                                                            char cCharAt = str5.charAt(i21);
                                                            char c11 = AbstractJsonLexerKt.STRING;
                                                            if (cCharAt != '\"') {
                                                                c11 = '\'';
                                                                if (cCharAt == '\'') {
                                                                    iQ = k0.Q(str5, i21 + 1, c11);
                                                                    if (iQ != -1 && iQ < str5.length() && str5.charAt(iQ) == c11) {
                                                                        i12 = iQ + 1;
                                                                        i18 = -1;
                                                                    } else {
                                                                        i18 = -1;
                                                                        i12 = -1;
                                                                    }
                                                                } else {
                                                                    if (cCharAt == '(') {
                                                                        c11 = ')';
                                                                        iQ = k0.Q(str5, i21 + 1, c11);
                                                                        if (iQ != -1) {
                                                                            i12 = iQ + 1;
                                                                            i18 = -1;
                                                                        }
                                                                    }
                                                                    i18 = -1;
                                                                    i12 = -1;
                                                                }
                                                            }
                                                        }
                                                        if (i12 == i18) {
                                                            strA = null;
                                                        } else {
                                                            String strSubstring2 = this.f97069e.substring(this.f97070f + 1, i12 - 1);
                                                            this.f97070f = i12;
                                                            strA = aa0.a.a(strSubstring2);
                                                        }
                                                        c(pattern);
                                                    } else {
                                                        strA = null;
                                                    }
                                                    if (g() == ')') {
                                                        this.f97070f++;
                                                        z11 = true;
                                                    } else {
                                                        this.f97070f = i17;
                                                    }
                                                } else {
                                                    strA = null;
                                                }
                                                z11 = false;
                                            } else {
                                                i11 = 1;
                                                strA = null;
                                                z11 = false;
                                                strA2 = null;
                                            }
                                            if (!z11) {
                                                int i22 = this.f97070f;
                                                if (i22 < this.f97069e.length() && this.f97069e.charAt(this.f97070f) == '[') {
                                                    int i23 = this.f97070f + 1;
                                                    int iP = k0.P(i23, this.f97069e);
                                                    int i24 = iP - i23;
                                                    if (iP != -1 && i24 <= 999 && iP < this.f97069e.length() && this.f97069e.charAt(iP) == ']') {
                                                        this.f97070f = iP + 1;
                                                    }
                                                }
                                                int i25 = this.f97070f - i22;
                                                String strSubstring3 = i25 > 2 ? this.f97069e.substring(i22, i25 + i22) : !cVar3.f97016g ? this.f97069e.substring(cVar3.f97011b, i17) : null;
                                                if (strSubstring3 != null) {
                                                    Pattern pattern2 = aa0.a.f666a;
                                                    ba0.o oVar = (ba0.o) ((Map) this.f97068d.f75379c).get(aa0.a.f668c.matcher(strSubstring3.substring(i11, strSubstring3.length() - 1).trim().toLowerCase(Locale.ROOT)).replaceAll(" "));
                                                    if (oVar != null) {
                                                        strA2 = oVar.f17778g;
                                                        strA = oVar.f17779h;
                                                        z11 = true;
                                                    }
                                                }
                                            }
                                            if (!z11) {
                                                this.f97070f = i17;
                                                this.f97072h = this.f97072h.f97013d;
                                                wVar2 = new ba0.w("]");
                                                wVar = wVar2;
                                                break;
                                            } else {
                                                if (z14) {
                                                    ba0.l lVar = new ba0.l();
                                                    lVar.f17772f = strA2;
                                                    lVar.f17773g = strA;
                                                    wVar3 = lVar;
                                                } else {
                                                    wVar3 = new ba0.n(strA2, strA);
                                                }
                                                r rVar3 = wVar8.f17785e;
                                                while (rVar3 != null) {
                                                    r rVar4 = rVar3.f17785e;
                                                    wVar3.b(rVar3);
                                                    rVar3 = rVar4;
                                                }
                                                h(cVar3.f97014e);
                                                r rVar5 = wVar3.f17782b;
                                                r rVar6 = wVar3.f17783c;
                                                if (rVar5 != rVar6) {
                                                    e(rVar5, rVar6);
                                                }
                                                wVar8.f();
                                                c cVar4 = this.f97072h.f97013d;
                                                this.f97072h = cVar4;
                                                if (!z14) {
                                                    while (cVar4 != null) {
                                                        if (!cVar4.f97012c) {
                                                            cVar4.f97015f = false;
                                                        }
                                                        cVar4 = cVar4.f97013d;
                                                    }
                                                }
                                                wVar = wVar3;
                                                break;
                                            }
                                        } else {
                                            this.f97072h = cVar3.f97013d;
                                            wVar4 = new ba0.w("]");
                                        }
                                    } else {
                                        wVar4 = new ba0.w("]");
                                    }
                                    wVar = wVar4;
                                    break;
                                default:
                                    if (this.f97066b.get(cG)) {
                                        ea0.a aVar = (ea0.a) this.f97067c.get(Character.valueOf(cG));
                                        int i26 = this.f97070f;
                                        int i27 = i13;
                                        while (g() == cG) {
                                            i27++;
                                            this.f97070f++;
                                        }
                                        if (i27 < aVar.c()) {
                                            this.f97070f = i26;
                                            g0Var = wVar5;
                                        } else {
                                            String strSubstring4 = i26 == 0 ? "\n" : this.f97069e.substring(i26 - 1, i26);
                                            char cG2 = g();
                                            String strValueOf = cG2 != 0 ? String.valueOf(cG2) : "\n";
                                            Pattern pattern3 = f97055i;
                                            boolean zMatches = pattern3.matcher(strSubstring4).matches();
                                            Pattern pattern4 = f97062r;
                                            boolean zMatches2 = pattern4.matcher(strSubstring4).matches();
                                            boolean zMatches3 = pattern3.matcher(strValueOf).matches();
                                            boolean zMatches4 = pattern4.matcher(strValueOf).matches();
                                            int i28 = (zMatches4 || !(!zMatches3 || zMatches2 || zMatches)) ? i13 : 1;
                                            int i29 = (zMatches2 || !(!zMatches || zMatches4 || zMatches3)) ? i13 : 1;
                                            if (cG == '_') {
                                                int i31 = (i28 == 0 || !(i29 == 0 || zMatches)) ? i13 : 1;
                                                if (i29 == 0 || !(i28 == 0 || zMatches3)) {
                                                    z13 = i13;
                                                    z12 = i31;
                                                } else {
                                                    z13 = 1;
                                                    z12 = i31;
                                                }
                                            } else {
                                                int i32 = (i28 == 0 || cG != aVar.d()) ? i13 : 1;
                                                int i33 = (i29 == 0 || cG != aVar.b()) ? i13 : 1;
                                                z12 = i32;
                                                z13 = i33;
                                            }
                                            this.f97070f = i26;
                                            g0Var = new g0(i27, z12, z13);
                                        }
                                        if (g0Var == 0) {
                                            wVar = wVar5;
                                        } else {
                                            int i34 = g0Var.f87579a;
                                            int i35 = this.f97070f;
                                            int i36 = i35 + i34;
                                            this.f97070f = i36;
                                            ba0.w wVar9 = new ba0.w(this.f97069e.substring(i35, i36));
                                            boolean z15 = g0Var.f87581c;
                                            boolean z16 = g0Var.f87580b;
                                            d dVar = this.f97071g;
                                            d dVar2 = new d(wVar9, cG, z15, z16, dVar);
                                            this.f97071g = dVar2;
                                            dVar2.f97023g = i34;
                                            dVar2.f97024h = i34;
                                            if (dVar != null) {
                                                dVar.f97022f = dVar2;
                                            }
                                            wVar = wVar9;
                                        }
                                        i5 = i13;
                                        break;
                                    } else {
                                        int i37 = this.f97070f;
                                        int length = this.f97069e.length();
                                        while (true) {
                                            int i38 = this.f97070f;
                                            if (i38 != length) {
                                                if (!this.f97065a.get(this.f97069e.charAt(i38))) {
                                                    this.f97070f++;
                                                }
                                            }
                                        }
                                        int i39 = this.f97070f;
                                        if (i37 != i39) {
                                            wVar = new ba0.w(this.f97069e.substring(i37, i39));
                                        }
                                        i5 = i13;
                                    }
                                    break;
                            }
                        } else {
                            String strC5 = c(n);
                            if (strC5 != null) {
                                int i40 = this.f97070f;
                                do {
                                    strC = c(f97059m);
                                    if (strC == null) {
                                        this.f97070f = i40;
                                        wVar3 = new ba0.w(strC5);
                                        wVar = wVar3;
                                    }
                                } while (!strC.equals(strC5));
                                ba0.d dVar3 = new ba0.d();
                                String strReplace = this.f97069e.substring(i40, this.f97070f - strC5.length()).replace('\n', ' ');
                                if (strReplace.length() >= 3 && strReplace.charAt(0) == ' ' && strReplace.charAt(strReplace.length() - 1) == ' ') {
                                    int length2 = strReplace.length();
                                    if (l0.O(' ', 0, length2, strReplace) != length2) {
                                        strReplace = u4.f(1, 1, strReplace);
                                    }
                                }
                                dVar3.f17764f = strReplace;
                                wVar4 = dVar3;
                                wVar = wVar4;
                            }
                            wVar = null;
                        }
                        i5 = 0;
                    } else {
                        int i41 = this.f97070f + 1;
                        this.f97070f = i41;
                        if (g() == '[') {
                            this.f97070f++;
                            ba0.w wVar10 = new ba0.w("![");
                            c cVar5 = this.f97072h;
                            c cVar6 = new c(wVar10, i41, cVar5, this.f97071g, true);
                            if (cVar5 != null) {
                                cVar5.f97016g = true;
                            }
                            this.f97072h = cVar6;
                            wVar = wVar10;
                            i5 = 0;
                        } else {
                            wVar2 = new ba0.w("!");
                            wVar = wVar2;
                            i5 = 0;
                        }
                    }
                    if (rVar2 != null) {
                        h(null);
                        r rVar7 = rVar.f17782b;
                        r rVar8 = rVar.f17783c;
                        if (rVar7 == rVar8) {
                            return;
                        }
                        e(rVar7, rVar8);
                        return;
                    }
                    rVar.b(rVar2);
                    i13 = i5;
                    wVar5 = null;
                } else {
                    this.f97070f++;
                    if (rVar2 instanceof ba0.w) {
                        ba0.w wVar11 = (ba0.w) rVar2;
                        if (wVar11.f17788f.endsWith(" ")) {
                            String str6 = wVar11.f17788f;
                            Matcher matcher = f97064t.matcher(str6);
                            int iEnd = matcher.find() ? matcher.end() - matcher.start() : 0;
                            i5 = 0;
                            if (iEnd > 0) {
                                wVar11.f17788f = u4.f(iEnd, 0, str6);
                            }
                            uVar = iEnd >= 2 ? new ba0.h() : new u();
                        } else {
                            i5 = 0;
                            uVar = new u();
                        }
                        wVar = uVar;
                    }
                    if (rVar2 != null) {
                    }
                }
                if (wVar != null) {
                    rVar2 = wVar;
                    if (rVar2 != null) {
                    }
                } else {
                    this.f97070f++;
                    wVar5 = new ba0.w(String.valueOf(cG));
                }
            }
            rVar2 = wVar5;
            if (rVar2 != null) {
            }
        }
    }

    public final char g() {
        if (this.f97070f < this.f97069e.length()) {
            return this.f97069e.charAt(this.f97070f);
        }
        return (char) 0;
    }

    public final void h(d dVar) {
        boolean z11;
        r rVar;
        HashMap map = new HashMap();
        d dVar2 = this.f97071g;
        while (dVar2 != null) {
            d dVar3 = dVar2.f97021e;
            if (dVar3 == dVar) {
                break;
            } else {
                dVar2 = dVar3;
            }
        }
        while (dVar2 != null) {
            ba0.w wVar = dVar2.f97017a;
            char c11 = dVar2.f97018b;
            ea0.a aVar = (ea0.a) this.f97067c.get(Character.valueOf(c11));
            if (!dVar2.f97020d || aVar == null) {
                dVar2 = dVar2.f97022f;
            } else {
                char cD = aVar.d();
                d dVar4 = dVar2.f97021e;
                int iA = 0;
                boolean z12 = false;
                while (dVar4 != null && dVar4 != dVar && dVar4 != map.get(Character.valueOf(c11))) {
                    if (dVar4.f97019c && dVar4.f97018b == cD) {
                        iA = aVar.a(dVar4, dVar2);
                        z12 = true;
                        if (iA > 0) {
                            z11 = true;
                            break;
                        }
                    }
                    dVar4 = dVar4.f97021e;
                }
                z11 = z12;
                z12 = false;
                if (z12) {
                    ba0.w wVar2 = dVar4.f97017a;
                    dVar4.f97023g -= iA;
                    dVar2.f97023g -= iA;
                    wVar2.f17788f = u4.f(iA, 0, wVar2.f17788f);
                    wVar.f17788f = u4.f(iA, 0, wVar.f17788f);
                    d dVar5 = dVar2.f97021e;
                    while (dVar5 != null && dVar5 != dVar4) {
                        d dVar6 = dVar5.f97021e;
                        i(dVar5);
                        dVar5 = dVar6;
                    }
                    if (wVar2 != wVar && (rVar = wVar2.f17785e) != wVar) {
                        e(rVar, wVar.f17784d);
                    }
                    aVar.e(wVar2, wVar, iA);
                    if (dVar4.f97023g == 0) {
                        dVar4.f97017a.f();
                        i(dVar4);
                    }
                    if (dVar2.f97023g == 0) {
                        d dVar7 = dVar2.f97022f;
                        wVar.f();
                        i(dVar2);
                        dVar2 = dVar7;
                    }
                } else {
                    if (!z11) {
                        map.put(Character.valueOf(c11), dVar2.f97021e);
                        if (!dVar2.f97019c) {
                            i(dVar2);
                        }
                    }
                    dVar2 = dVar2.f97022f;
                }
            }
        }
        while (true) {
            d dVar8 = this.f97071g;
            if (dVar8 == null || dVar8 == dVar) {
                return;
            } else {
                i(dVar8);
            }
        }
    }

    public final void i(d dVar) {
        d dVar2 = dVar.f97021e;
        if (dVar2 != null) {
            dVar2.f97022f = dVar.f97022f;
        }
        d dVar3 = dVar.f97022f;
        if (dVar3 == null) {
            this.f97071g = dVar2;
        } else {
            dVar3.f97021e = dVar2;
        }
    }
}
