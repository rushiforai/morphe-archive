package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.su, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2568su {
    public static String[] A00 = {"Zuis3dFKWAyxoNTgkpIE", "xaeF0afSb05NpBFMZ5xygIdSc7B6iwCw", "tuXcYJ8v14ziTOmKAzHuhsdlRoVHn9j3", "t24s4vz84wAveoI9BHe2QhUA3xE4dBfz", "sxf", "FI50G0VJnQuwXuJuDwYc", "5PWp6wjoKKugmK0LDuyHf4PGYw4BDMr1", "wj6JTnHM3e62Gsc5OAfcHrHHUCE"};

    public static EnumC2572sy A00(LA la2) {
        if (la2.A3S()) {
            EnumC2572sy enumC2572sy = EnumC2572sy.A02;
            if (A00[1].charAt(6) != 'f') {
                throw new RuntimeException();
            }
            String[] strArr = A00;
            strArr[3] = "tsfNGtRVOFLkJYhvis7QgxjEl1sSvMPv";
            strArr[2] = "t2hZdq9OrhuvmGB4XIpOOaypxtzR7Pvs";
            return enumC2572sy;
        }
        EnumC2572sy enumC2572sy2 = EnumC2572sy.A03;
        if (A00[7].length() != 27) {
            A00[4] = "F1XyKLOJKpSOH2buCniO7rGUMGJZoF";
            return enumC2572sy2;
        }
        String[] strArr2 = A00;
        strArr2[5] = "7lXEsjF1B1e2sZ4OSZaa";
        strArr2[0] = "uqPXzMY2O0is65aO24e9";
        return enumC2572sy2;
    }

    public static void A01(LA la2, EnumC2569sv enumC2569sv, C0958Hi c0958Hi) {
        if (la2.A3O()) {
            c0958Hi.A0F().ABu(enumC2569sv.name().toLowerCase(Locale.US));
        }
        if (la2.A3S()) {
            c0958Hi.A0F().ABi(enumC2569sv.name().toLowerCase(Locale.US));
        }
    }

    public static void A02(C0958Hi c0958Hi, EnumC2569sv enumC2569sv) {
        c0958Hi.A0F().ABk(enumC2569sv.name().toLowerCase(Locale.US));
    }

    public static void A03(C0958Hi c0958Hi, EnumC2569sv enumC2569sv) {
        c0958Hi.A0F().ABw(enumC2569sv.name().toLowerCase(Locale.US));
    }

    public static void A04(C0958Hi c0958Hi, EnumC2569sv enumC2569sv) {
        c0958Hi.A0F().ACx(enumC2569sv.name().toLowerCase(Locale.US));
    }

    public static void A05(C0958Hi c0958Hi, EnumC2569sv enumC2569sv) {
        A02(c0958Hi, enumC2569sv);
    }

    public static void A06(C0958Hi c0958Hi, EnumC2569sv enumC2569sv) {
        A03(c0958Hi, enumC2569sv);
    }

    public static void A07(C0958Hi c0958Hi, EnumC2569sv enumC2569sv) {
        A04(c0958Hi, enumC2569sv);
    }

    public static void A08(C2232nO c2232nO, C0958Hi c0958Hi, InterfaceC2459r9 interfaceC2459r9, LA la2, EnumC2569sv enumC2569sv) {
        if (c2232nO != null) {
            c2232nO.A04(EnumC2231nN.A0A, null);
        }
        if (la2.A3O()) {
            c0958Hi.A0F().ABv(enumC2569sv.name().toLowerCase(Locale.US));
        }
        if (la2.A3S()) {
            c0958Hi.A0F().ABj(enumC2569sv.name().toLowerCase(Locale.US));
        }
        if (AbstractC1820gb.A00(c0958Hi.A02()).A0O(c0958Hi.A02(), true)) {
            if (interfaceC2459r9 != null) {
                String strA37 = la2.A37();
                if (A00[1].charAt(6) != 'f') {
                    throw new RuntimeException();
                }
                A00[4] = "4g3IauLO4jVP";
                interfaceC2459r9.ABW(strA37, la2.A35());
                return;
            }
            return;
        }
        if (!TextUtils.isEmpty(la2.A35().A00())) {
            C2347pK.A0P(new C2347pK(), c0958Hi, AbstractC2351pP.A00(la2.A35().A00()), la2.A37());
        }
    }
}
