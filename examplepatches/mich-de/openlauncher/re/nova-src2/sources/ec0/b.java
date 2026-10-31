package ec0;

import aa.t;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.android.gms.internal.consent_sdk.k0;
import fc0.o;
import fc0.s;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import jc0.d;
import jc0.g;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import x60.c;
import x60.e;
import x60.f;

/* loaded from: classes5.dex */
public class b extends k0 {

    /* renamed from: f, reason: collision with root package name */
    public static final e[] f52678f = {g.f69454d, g.D, g.f69455e, g.f69467s, g.f69469u, g.E, g.f69474z, g.n, g.f69465q, g.G, g.f69456f, g.B, g.C, g.f69458h, g.f69459i, g.o, g.f69470v, g.f69464p, g.f69462l, g.f69460j, g.f69471w, g.F, g.f69463m, g.f69473y, g.f69468t, g.f69466r, g.f69472x};

    /* renamed from: g, reason: collision with root package name */
    public static final String[] f52679g;

    /* renamed from: h, reason: collision with root package name */
    public static final f[] f52680h;

    /* renamed from: i, reason: collision with root package name */
    public static final String[] f52681i;

    /* renamed from: j, reason: collision with root package name */
    public static final f[] f52682j;

    /* renamed from: k, reason: collision with root package name */
    public static final b f52683k;

    /* renamed from: l, reason: collision with root package name */
    public static final a f52684l;

    /* renamed from: d, reason: collision with root package name */
    public final HashMap f52685d = new HashMap();

    /* renamed from: e, reason: collision with root package name */
    public final HashMap f52686e = new HashMap();

    static {
        String str;
        String[] strArr = (String[]) ((List) Stream.of((Object[]) c.values()).map(new t(11)).collect(Collectors.toList())).toArray(new String[0]);
        f52679g = strArr;
        f52680h = (f[]) ((List) Stream.of((Object[]) c.values()).map(new t(12)).collect(Collectors.toList())).toArray(new f[0]);
        f52681i = (String[]) ((List) Stream.of((Object[]) x60.a.values()).map(new t(13)).collect(Collectors.toList())).toArray(new String[0]);
        f52682j = (f[]) ((List) Stream.of((Object[]) x60.a.values()).map(new t(14)).collect(Collectors.toList())).toArray(new f[0]);
        HashMap map = new HashMap();
        e eVar = g.f69461k;
        map.put("µg", c.d(eVar));
        map.put("μg", c.d(eVar));
        map.put("μg", c.d(eVar));
        b bVar = new b();
        int i5 = 0;
        while (true) {
            e[] eVarArr = f52678f;
            if (i5 >= eVarArr.length) {
                break;
            }
            e eVar2 = eVarArr[i5];
            String str2 = (eVar2 instanceof jc0.b ? (jc0.b) eVar2 : (jc0.a) eVar2).f49218b;
            bVar.O(eVar2, str2);
            for (int i11 = 0; i11 < strArr.length; i11++) {
                e eVarN = ((dc0.b) eVar2).n(c.values()[i11]);
                bVar.O(eVarN, strArr[i11] + str2);
                if ("µ".equals(strArr[i11])) {
                    bVar.O(eVarN, "μ" + str2);
                }
            }
            i5++;
        }
        bVar.O(g.f69461k, "g");
        for (c cVar : c.values()) {
            int iOrdinal = cVar.ordinal();
            String str3 = cVar.f95120a;
            if (iOrdinal == 7) {
                bVar.O(g.f69457g, "kg");
            } else if (iOrdinal != 13) {
                bVar.O(((dc0.b) g.f69461k).n(cVar), str3.concat("g"));
            } else {
                bVar.O(((dc0.b) g.f69461k).n(cVar), str3.concat("g"));
            }
        }
        bVar.O(c.d(g.f69461k), "µg");
        bVar.I(g.f69470v, "Ohm");
        for (int i12 = 0; i12 < strArr.length; i12++) {
            bVar.I(g.f69470v.n(c.values()[i12]), strArr[i12] + "Ohm");
        }
        e eVar3 = g.A;
        bVar.O(eVar3, "℃");
        bVar.I(eVar3, "°C");
        for (int i13 = 0; i13 < strArr.length; i13++) {
            dc0.b bVar2 = (dc0.b) g.A;
            bVar.O(bVar2.n(c.values()[i13]), strArr[i13] + "℃");
            bVar.I(bVar2.n(c.values()[i13]), strArr[i13] + "°C");
        }
        bVar.O(g.M, "%");
        bVar.O(g.f69458h, InneractiveMediationDefs.GENDER_MALE);
        bVar.O(g.f69460j, "s");
        bVar.O(g.N, "min");
        bVar.O(g.O, "h");
        jc0.e eVar4 = g.P;
        bVar.O(eVar4, "day");
        bVar.I(eVar4, "d");
        bVar.O(g.Q, "week");
        e eVar5 = g.R;
        bVar.O(eVar5, "year");
        bVar.I(eVar5, "days365");
        e eVar6 = g.S;
        bVar.O(eVar6, "mo");
        bVar.I(eVar6, "mon");
        bVar.I(eVar6, "month");
        bVar.O(g.L, "km/h");
        bVar.O(g.K, "㎥");
        String str4 = "l";
        bVar.O(g.T, "l");
        for (c cVar2 : c.values()) {
            bVar.O(((dc0.b) g.T).n(cVar2), cVar2.f95120a.concat("l"));
        }
        String str5 = "N";
        bVar.O(g.o, "N");
        String str6 = "rad";
        bVar.O(g.f69462l, "rad");
        bVar.O(dc0.b.f49216c, "one");
        bVar.I(g.J, "m2");
        bVar.I(g.K, "m3");
        f52683k = bVar;
        a aVar = new a();
        String[] strArr2 = f52679g;
        int i14 = 0;
        while (true) {
            e[] eVarArr2 = f52678f;
            str = str6;
            if (i14 >= eVarArr2.length) {
                break;
            }
            e eVar7 = eVarArr2[i14];
            int i15 = i14;
            String str7 = (eVar7 instanceof jc0.b ? (jc0.b) eVar7 : (jc0.a) eVar7).f49218b;
            String str8 = str5;
            String str9 = str4;
            int i16 = 0;
            while (true) {
                if (i16 >= str7.length()) {
                    aVar.O(eVar7, str7);
                    break;
                }
                int i17 = i16;
                if (str7.charAt(i16) > 127) {
                    break;
                } else {
                    i16 = i17 + 1;
                }
            }
            int i18 = 0;
            while (i18 < strArr2.length) {
                int i19 = i18;
                e eVarN2 = ((dc0.b) eVar7).n(c.values()[i18]);
                if ("µ".equals(strArr2[i19])) {
                    aVar.O(eVarN2, "micro".concat("Ω".equals(str7) ? "Ohm" : str7));
                }
                i18 = i19 + 1;
            }
            i14 = i15 + 1;
            str6 = str;
            str5 = str8;
            str4 = str9;
        }
        String str10 = str5;
        String str11 = str4;
        aVar.O(g.f69461k, "g");
        c[] cVarArrValues = c.values();
        int length = cVarArrValues.length;
        int i21 = 0;
        while (i21 < length) {
            c cVar3 = cVarArrValues[i21];
            c[] cVarArr = cVarArrValues;
            int iOrdinal2 = cVar3.ordinal();
            int i22 = length;
            if (iOrdinal2 == 7) {
                aVar.O(g.f69457g, "kg");
            } else if (iOrdinal2 != 13) {
                aVar.O(((dc0.b) g.f69461k).n(cVar3), cVar3.f95120a.concat("g"));
            } else {
                aVar.O(c.d(g.T), "microg");
            }
            i21++;
            cVarArrValues = cVarArr;
            length = i22;
        }
        aVar.O(g.f69470v, "Ohm");
        for (int i23 = 0; i23 < strArr2.length; i23++) {
            e eVarN3 = g.f69470v.n(c.values()[i23]);
            StringBuilder sb2 = new StringBuilder();
            String str12 = strArr2[i23];
            if ("µ".equals(str12)) {
                str12 = "micro";
            }
            sb2.append(str12);
            sb2.append("Ohm");
            aVar.O(eVarN3, sb2.toString());
        }
        aVar.O(g.A, "Celsius");
        for (int i24 = 0; i24 < strArr2.length; i24++) {
            e eVarN4 = ((dc0.b) g.A).n(c.values()[i24]);
            StringBuilder sb3 = new StringBuilder();
            String str13 = strArr2[i24];
            if ("µ".equals(str13)) {
                str13 = "micro";
            }
            sb3.append(str13);
            sb3.append("Celsius");
            aVar.O(eVarN4, sb3.toString());
        }
        aVar.I(g.A, "Cel");
        aVar.O(g.f69458h, InneractiveMediationDefs.GENDER_MALE);
        aVar.O(g.f69460j, "s");
        aVar.O(g.L, "km/h");
        aVar.I(g.J, "m2");
        aVar.I(g.K, "m3");
        aVar.O(g.T, str11);
        for (c cVar4 : c.values()) {
            if (cVar4 == c.MICRO) {
                aVar.O(c.d(g.T), "microL");
            } else {
                aVar.O(((dc0.b) g.T).n(cVar4), cVar4.f95120a.concat("L"));
            }
        }
        aVar.O(g.o, str10);
        aVar.O(g.f69462l, str);
        aVar.O(dc0.b.f49216c, "one");
        f52684l = aVar;
    }

    public static void J(Appendable appendable, String str, int i5, int i11) throws IOException {
        appendable.append(str);
        if (i5 == 1 && i11 == 1) {
            return;
        }
        if (i5 == 2 && i11 == 1) {
            appendable.append((char) 178);
            return;
        }
        if (i5 == 3 && i11 == 1) {
            appendable.append((char) 179);
            return;
        }
        appendable.append('^');
        appendable.append(String.valueOf(i5));
        if (i11 != 1) {
            appendable.append(AbstractJsonLexerKt.COLON);
            appendable.append(String.valueOf(i11));
        }
    }

    public static b L(int i5) {
        return c0.F(i5) != 1 ? f52683k : f52684l;
    }

    public static boolean M(char c11) {
        if (Character.isLetter(c11)) {
            return true;
        }
        return (Character.isWhitespace(c11) || Character.isDigit(c11) || c11 == 183 || c11 == '*' || c11 == '/' || c11 == '(' || c11 == ')' || c11 == '[' || c11 == ']' || c11 == 185 || c11 == 178 || c11 == 179 || c11 == '^' || c11 == '+' || c11 == '-') ? false : true;
    }

    public final void I(e eVar, String str) {
        if (!N(str)) {
            throw new IllegalArgumentException(c0.l("Alias: ", str, " is not a valid identifier."));
        }
        synchronized (this) {
            this.f52685d.put(str, eVar);
        }
    }

    public Appendable K(e eVar, Appendable appendable) throws IOException {
        String strP = P(eVar);
        if (strP != null) {
            return appendable.append(strP);
        }
        if (!(eVar instanceof d)) {
            throw new IllegalArgumentException("Cannot format given Object as a Unit");
        }
        d dVar = (d) eVar;
        jc0.c[] cVarArr = dVar.f69438d;
        if (cVarArr.length == 1 && (dVar.w(0) instanceof d)) {
            d dVar2 = (d) dVar.w(0);
            if (P(dVar2) == null) {
                return K(d.y(dVar2, dVar.x(0)), appendable);
            }
        }
        int i5 = 0;
        boolean z11 = true;
        for (int i11 = 0; i11 < cVarArr.length; i11++) {
            int iX = dVar.x(i11);
            if (iX >= 0) {
                if (!z11) {
                    appendable.append((char) 183);
                }
                J(appendable, P(dVar.w(i11)), iX, cVarArr[i11].f69437c);
                z11 = false;
            } else {
                i5++;
            }
        }
        if (i5 != 0) {
            if (z11) {
                appendable.append('1');
            }
            appendable.append('/');
            if (i5 > 1) {
                appendable.append('(');
            }
            boolean z12 = true;
            for (int i12 = 0; i12 < cVarArr.length; i12++) {
                int iX2 = dVar.x(i12);
                if (iX2 < 0) {
                    String strP2 = P(dVar.w(i12));
                    int i13 = cVarArr[i12].f69437c;
                    if (!z12) {
                        appendable.append((char) 183);
                    }
                    J(appendable, strP2, -iX2, i13);
                    z12 = false;
                }
            }
            if (i5 > 1) {
                appendable.append(')');
            }
        }
        return appendable;
    }

    public boolean N(String str) {
        if (str == null || str.length() == 0) {
            return false;
        }
        return M(str.charAt(0));
    }

    public final void O(e eVar, String str) {
        if (!N(str)) {
            throw new IllegalArgumentException(c0.l("Label: ", str, " is not a valid identifier."));
        }
        synchronized (this) {
            this.f52685d.put(str, eVar);
            this.f52686e.put(eVar, str);
        }
    }

    public String P(e eVar) {
        String str = (String) this.f52686e.get(eVar);
        if (str != null) {
            return str;
        }
        if (eVar instanceof jc0.b) {
            return ((jc0.b) eVar).f49218b;
        }
        if (eVar instanceof jc0.a) {
            return ((jc0.a) eVar).f49218b;
        }
        String str2 = null;
        if (!(eVar instanceof jc0.e)) {
            return null;
        }
        jc0.e eVar2 = (jc0.e) eVar;
        String str3 = eVar2.f49218b;
        if (str3 != null) {
            return str3;
        }
        dc0.b bVar = eVar2.f69440d;
        f fVar = eVar2.f69442f;
        StringBuilder sb2 = new StringBuilder();
        String string = bVar.toString();
        int i5 = 0;
        while (true) {
            f[] fVarArr = f52680h;
            if (i5 >= fVarArr.length) {
                int i11 = 0;
                while (true) {
                    f[] fVarArr2 = f52682j;
                    if (i11 >= fVarArr2.length) {
                        break;
                    }
                    if (fVarArr2[i11].equals(fVar)) {
                        str2 = f52681i[i11];
                        break;
                    }
                    i11++;
                }
            } else {
                if (fVarArr[i5].equals(fVar)) {
                    str2 = f52679g[i5];
                    break;
                }
                i5++;
            }
        }
        if (string.indexOf(183) >= 0 || string.indexOf(42) >= 0 || string.indexOf(47) >= 0) {
            sb2.append('(');
            sb2.append(string);
            sb2.append(')');
        } else {
            sb2.append(string);
        }
        if (str2 != null) {
            sb2.insert(0, str2);
        } else if (fVar instanceof fc0.f) {
            sb2.append('+');
            sb2.append(((fc0.f) fVar).f54608d);
        } else {
            if (!(fVar instanceof o)) {
                return "[" + bVar + "?]";
            }
            Number number = (Number) ((o) fVar).getValue();
            if (number instanceof s) {
                s sVarK = ((s) number).k();
                if (sVarK.f54656g) {
                    sb2.append('/');
                    sb2.append(sVarK.toString());
                } else {
                    sb2.append('*');
                    sb2.append(number);
                }
            } else {
                sb2.append('*');
                sb2.append(number);
            }
        }
        return sb2.toString();
    }

    public String toString() {
        return "SimpleUnitFormat";
    }
}
