package r10;

import android.net.Uri;
import e10.z2;
import java.util.Locale;
import java.util.Set;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public class m1 {

    /* renamed from: e, reason: collision with root package name */
    public static final g f85175e;

    /* renamed from: f, reason: collision with root package name */
    public static final int[] f85176f;

    /* renamed from: g, reason: collision with root package name */
    public static final int[] f85177g;

    /* renamed from: h, reason: collision with root package name */
    public static final l1 f85178h;

    /* renamed from: i, reason: collision with root package name */
    public static final m1 f85179i;

    /* renamed from: j, reason: collision with root package name */
    public static final d1 f85180j;

    /* renamed from: k, reason: collision with root package name */
    public static final m1 f85181k;

    /* renamed from: l, reason: collision with root package name */
    public static final i1 f85182l;

    /* renamed from: m, reason: collision with root package name */
    public static final /* synthetic */ m1[] f85183m;

    /* renamed from: a, reason: collision with root package name */
    public final String f85184a;

    /* renamed from: b, reason: collision with root package name */
    public final String f85185b;

    /* renamed from: c, reason: collision with root package name */
    public final Regex f85186c;

    /* renamed from: d, reason: collision with root package name */
    public final Uri f85187d;

    static {
        e1 e1Var = new e1("BITCOIN", 0, "BTC", "blockchain.info/btc/address/%s", new Regex("\\b([13][a-km-zA-HJ-NP-Z1-9]{26,33}|bc1[a-z0-9]{39,59})\\b"), z2.v(2131231678, "com.teslacoilsw.launcher"));
        g1 g1Var = new g1("ETHEREUM", 1, "ETH", "blockchain.info/eth/address/%s", new Regex("\\b(0x[a-fA-F0-9]{40})\\b"), z2.v(2131231681, "com.teslacoilsw.launcher"));
        l1 l1Var = new l1("USPS", 2, "USPS", "tools.usps.com/go/TrackConfirmAction?tLabels=%s", new Regex("\\b(?:420(?:\\d{9}|\\d{5}))?(9[1-5]\\d{20,24})\\b"), z2.v(2131231686, "com.teslacoilsw.launcher"));
        f85178h = l1Var;
        h1 h1Var = new h1("FEDEX", 3, "FedEx", "fedex.com/fedextrack/?trknbr=%s", new Regex("\\b((?:(?:(?:96\\d{3}|(?:92)?(?:6\\d{2}|748))\\d{2} ?\\d{4}|96\\d{2}|\\d{4}) ?\\d{4} ?\\d{4}(?: ?\\d{3})?))\\b"), z2.v(2131231682, "com.teslacoilsw.launcher"));
        k1 k1Var = new k1("UPS", 4, "UPS", "www.ups.com/track?loc=en_US&tracknum=%s", new Regex("\\b(1Z[A-Z0-9]{16})\\b"), z2.v(2131231685, "com.teslacoilsw.launcher"));
        f1 f1Var = new f1("DHL", 5, "DHL", "www.dhl.com/en/express/tracking.html?AWB=%s", new Regex("\\b([0-9]{10,11})\\b"), z2.v(2131231680, "com.teslacoilsw.launcher"));
        m1 m1Var = new m1("ROYAL_MAIL", 6, "Royal Mail", "www.royalmail.com/track-your-item?trackNumber=%s", null, z2.v(2131231684, "com.teslacoilsw.launcher"));
        f85179i = m1Var;
        d1 d1Var = new d1("AUSPOST", 7, "AusPost", "auspost.com.au/mypost/track/#/details/%s", new Regex("(33[A-Z][A-Z0-9][A-Z0-9](?:[0-9]{7}|[0-9]{18})|[A-Z]{3}\\d{7})\\b"), z2.v(2131231677, "com.teslacoilsw.launcher"));
        f85180j = d1Var;
        m1 m1Var2 = new m1() { // from class: r10.c1
            public final Set n;

            {
                new Regex("\\b(\\d{10,11})\\b");
                z2.v(2131231676, "com.teslacoilsw.launcher");
                this.n = kotlin.collections.c.f1(new String[]{"AU", "AE", "IN", "SA", "KW", "NZ", "IR", "JO", "PS", "TR", "ZA"});
            }

            @Override // r10.m1
            public final boolean h(Locale locale) {
                return Intrinsics.b(locale.getLanguage(), "ar") || this.n.contains(locale.getCountry());
            }

            @Override // r10.m1
            public final boolean i(String str) {
                char cF1 = r70.l.F1(str);
                if ('0' <= cF1 && cF1 < ':') {
                    return ((int) (Long.parseLong(r70.l.C1(str)) % ((long) 7))) == cF1 - '0';
                }
                throw new NumberFormatException("'" + cF1 + "' is not 0-9");
            }
        };
        j1 j1Var = new j1("ONTRAC", 9, "OnTrac", "www.ontrac.com/trackingresults.asp?tracking_number=%s", new Regex("\\b([CD]\\d{14})\\b"), z2.v(2131231683, "com.teslacoilsw.launcher"));
        m1 m1Var3 = new m1("CHINA_POST", 10, "China Post", "global.cainiao.com/detail.htm?mailNoList=%s", null, z2.v(2131231679, "com.teslacoilsw.launcher"));
        f85181k = m1Var3;
        i1 i1Var = new i1("GENERIC_S10", 11, "S10", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, new Regex("\\b([A-Z]{2}\\d{9}[A-Z]{2})\\b"), z2.v(2131231686, "com.teslacoilsw.launcher"));
        f85182l = i1Var;
        m1[] m1VarArr = {e1Var, g1Var, l1Var, h1Var, k1Var, f1Var, m1Var, d1Var, m1Var2, j1Var, m1Var3, i1Var};
        f85183m = m1VarArr;
        EnumEntriesKt.a(m1VarArr);
        f85175e = new g();
        f85176f = new int[]{1, 3, 7};
        f85177g = new int[]{8, 6, 4, 2, 3, 5, 9, 7};
    }

    public m1(String str, int i5, String str2, String str3, Regex regex, Uri uri) {
        this.f85184a = str2;
        this.f85185b = str3;
        this.f85186c = regex;
        this.f85187d = uri;
    }

    public static boolean a(int i5, int i11, String str) {
        int i12;
        char cF1 = r70.l.F1(str);
        if ('0' > cF1 || cF1 >= ':') {
            throw new NumberFormatException("'" + cF1 + "' is not 0-9");
        }
        int i13 = cF1 - '0';
        String strSubstring = str.substring(0, str.length() - 1);
        Intrinsics.f(strSubstring, "substring(...)");
        int i14 = 0;
        int i15 = 0;
        int i16 = 0;
        while (i14 < strSubstring.length()) {
            char cCharAt = strSubstring.charAt(i14);
            int i17 = i16 + 1;
            if ('0' > cCharAt || cCharAt >= ':') {
                i12 = (cCharAt - '?') % 10;
            } else {
                if ('0' > cCharAt || cCharAt >= ':') {
                    throw new NumberFormatException("'" + cCharAt + "' is not 0-9");
                }
                i12 = cCharAt - '0';
            }
            i15 += i16 % 2 == 0 ? i12 * i11 : i12 * i5;
            i14++;
            i16 = i17;
        }
        int i18 = i15 % 10;
        if (i18 != 0) {
            i18 = 10 - i18;
        }
        return i13 == i18;
    }

    public static m1 valueOf(String str) {
        return (m1) Enum.valueOf(m1.class, str);
    }

    public static m1[] values() {
        return (m1[]) f85183m.clone();
    }

    public final Regex b() {
        return this.f85186c;
    }

    public final Uri c() {
        return this.f85187d;
    }

    public final String d() {
        return this.f85184a;
    }

    public final String g() {
        return this.f85185b;
    }

    public boolean h(Locale locale) {
        return true;
    }

    public boolean i(String str) {
        return this instanceof e1;
    }
}
