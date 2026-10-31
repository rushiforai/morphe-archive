package com.fyber.inneractive.sdk.config.global.features;

import android.text.TextUtils;
import com.amplitude.core.Configuration;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Locale;

/* loaded from: classes.dex */
public final class k extends i {
    public k() {
        super("load_timeouts");
    }

    public static String a(String... strArr) {
        StringBuilder sb2 = new StringBuilder();
        Iterator it = Arrays.asList(strArr).iterator();
        while (it.hasNext()) {
            sb2.append((String) it.next());
            if (it.hasNext()) {
                sb2.append("_");
            }
        }
        return sb2.toString();
    }

    public static boolean d(String str) {
        return UnitDisplayType.INTERSTITIAL.name().equalsIgnoreCase(str) || UnitDisplayType.REWARDED.name().equalsIgnoreCase(str);
    }

    public static String e(String str) {
        return TextUtils.isEmpty(str) ? "all_mediators" : str.toLowerCase(Locale.US);
    }

    public final int b(String str, String str2) {
        String strA = a(str, "bidding", "global_timeout", e(str2));
        String strA2 = a(str, "bidding", "global_timeout", "all_mediators");
        int iIntValue = d(str) ? Configuration.FLUSH_INTERVAL_MILLIS : 10000;
        Integer numA = a(a(str, "global_timeout", "all_mediators"));
        if (numA != null) {
            iIntValue = numA.intValue();
        }
        Integer numA2 = a(strA2);
        if (numA2 != null) {
            iIntValue = numA2.intValue();
        }
        Integer numA3 = a(strA);
        return numA3 != null ? numA3.intValue() : iIntValue;
    }

    public final int c(String str, String str2) {
        String strA = a(str, "global_timeout", e(str2));
        String strA2 = a(str, "global_timeout", "all_mediators");
        int iIntValue = d(str) ? Configuration.FLUSH_INTERVAL_MILLIS : 10000;
        Integer numA = a(a(str, "global_timeout", "all_mediators"));
        if (numA != null) {
            iIntValue = numA.intValue();
        }
        Integer numA2 = a(strA2);
        if (numA2 != null) {
            iIntValue = numA2.intValue();
        }
        Integer numA3 = a(strA);
        return numA3 != null ? numA3.intValue() : iIntValue;
    }

    @Override // com.fyber.inneractive.sdk.config.global.features.i
    public final i b() {
        k kVar = new k();
        a(kVar);
        return kVar;
    }
}
