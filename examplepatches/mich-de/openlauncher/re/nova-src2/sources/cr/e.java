package cr;

import ay.f;
import b70.g;
import com.stripe.android.core.model.Country;
import com.stripe.android.core.model.CountryCode;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class e {

    /* renamed from: c, reason: collision with root package name */
    public static volatile Locale f47801c;

    /* renamed from: a, reason: collision with root package name */
    public static final Set f47799a = kotlin.collections.c.f1(new String[]{"AD", "AE", "AF", "AG", "AI", "AL", "AM", "AO", "AQ", "AR", "AT", "AU", "AW", "AX", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI", "BJ", "BL", "BM", "BN", "BO", "BQ", "BR", "BS", "BT", "BV", "BW", "BY", "BZ", "CA", "CD", "CF", "CG", "CH", "CI", "CK", "CL", "CM", "CN", "CO", "CR", "CV", "CW", "CY", "CZ", "DE", "DJ", "DK", "DM", "DO", "DZ", "EC", "EE", "EG", "EH", "ER", "ES", "ET", "FI", "FJ", "FK", "FO", "FR", "GA", "GB", "GD", "GE", "GF", "GG", "GH", "GI", "GL", "GM", "GN", "GP", "GQ", "GR", "GS", "GT", "GU", "GW", "GY", "HK", "HN", "HR", "HT", "HU", "ID", "IE", "IL", "IM", "IN", "IO", "IQ", "IS", "IT", "JE", "JM", "JO", "JP", "KE", "KG", "KH", "KI", "KM", "KN", "KR", "KW", "KY", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", "MC", "MD", "ME", "MF", "MG", "MK", "ML", "MM", "MN", "MO", "MQ", "MR", "MS", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NC", "NE", "NG", "NI", "NL", "NO", "NP", "NR", "NU", "NZ", "OM", "PA", "PE", "PF", "PG", "PH", "PK", "PL", "PM", "PN", "PR", "PS", "PT", "PY", "QA", "RE", "RO", "RS", "RU", "RW", "SA", "SB", "SC", "SE", "SG", "SH", "SI", "SJ", "SK", "SL", "SM", "SN", "SO", "SR", "SS", "ST", "SV", "SX", "SZ", "TA", "TC", "TD", "TF", "TG", "TH", "TJ", "TK", "TL", "TM", "TN", "TO", "TR", "TT", "TV", "TW", "TZ", "UA", "UG", "US", "UY", "UZ", "VA", "VC", "VE", "VG", "VN", "VU", "WF", "WS", "XK", "YE", "YT", "ZA", "ZM", "ZW"});

    /* renamed from: b, reason: collision with root package name */
    public static final Set f47800b = kotlin.collections.c.f1(new String[]{"US", "GB", "CA"});

    /* renamed from: d, reason: collision with root package name */
    public static volatile Object f47802d = EmptyList.f71733a;

    public static Country a(CountryCode countryCode, Locale locale) {
        Object next;
        Iterator it = b(locale).iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((Country) next).f42572a, countryCode)) {
                break;
            }
        }
        return (Country) next;
    }

    /* JADX WARN: Type inference failed for: r9v1, types: [java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r9v2, types: [java.lang.Object, java.util.List] */
    public static List b(Locale locale) {
        Object next;
        if (locale.equals(f47801c)) {
            return f47802d;
        }
        Set<String> set = f47799a;
        ArrayList arrayList = new ArrayList(b70.c.u0(set, 10));
        for (String str : set) {
            CountryCode.Companion.getClass();
            CountryCode countryCodeA = d.a(str);
            String displayCountry = new Locale(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, str).getDisplayCountry(locale);
            Intrinsics.f(displayCountry, "getDisplayCountry(...)");
            arrayList.add(new Country(countryCodeA, displayCountry));
        }
        Collator collator = Collator.getInstance(locale);
        Iterator it = arrayList.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            CountryCode countryCode = ((Country) next).f42572a;
            d dVar = CountryCode.Companion;
            String country = locale.getCountry();
            Intrinsics.f(country, "getCountry(...)");
            dVar.getClass();
            if (Intrinsics.b(countryCode, d.a(country))) {
                break;
            }
        }
        List listR = ul.b.R(next);
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            Object next2 = it2.next();
            CountryCode countryCode2 = ((Country) next2).f42572a;
            d dVar2 = CountryCode.Companion;
            String country2 = locale.getCountry();
            Intrinsics.f(country2, "getCountry(...)");
            dVar2.getClass();
            if (!Intrinsics.b(countryCode2, d.a(country2))) {
                arrayList2.add(next2);
            }
        }
        f47802d = g.t1(g.D1(new ay.g(new f(collator, 1), 1), arrayList2), listR);
        f47801c = locale;
        return f47802d;
    }
}
