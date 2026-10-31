package com.fyber.inneractive.sdk.network.timeouts.content;

import android.text.TextUtils;
import b.c0;
import com.amplitude.core.Configuration;
import com.amplitude.core.utilities.http.HttpClient;
import com.fyber.inneractive.sdk.config.global.features.k;
import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class a extends com.fyber.inneractive.sdk.network.timeouts.a {

    /* renamed from: h, reason: collision with root package name */
    public final int f28798h;

    public a(String str, String str2, int i5, boolean z11, String str3, r rVar) {
        int iIntValue;
        k kVar = (k) rVar.a(k.class);
        this.f28798h = 0;
        Boolean boolC = kVar.c("reverse_retries");
        this.f28797g = boolC != null ? boolC.booleanValue() : true;
        if (z11) {
            iIntValue = kVar.b(str, str3);
        } else if (TextUtils.isEmpty(str3)) {
            String strE = c0.E(str, "_global_timeout");
            int i11 = k.d(str) ? Configuration.FLUSH_INTERVAL_MILLIS : 10000;
            Integer numA = kVar.a(strE);
            iIntValue = numA != null ? numA.intValue() : i11;
        } else {
            iIntValue = kVar.c(str, str3);
        }
        if (iIntValue > i5) {
            if (TextUtils.isEmpty(str3)) {
                Integer numA2 = kVar.a(k.a(str, str2, "retry_interval"));
                this.f28795e = numA2 != null ? numA2.intValue() : 100;
                Integer numA3 = kVar.a(k.a("timeout", "threshold"));
                this.f28796f = numA3 != null ? numA3.intValue() : 300;
                String strA = k.a(str, str2, "ilat");
                int i12 = k.d(str) ? HttpClient.Request.DEFAULT_READ_TIMEOUT_MS : 10000;
                Integer numA4 = kVar.a(strA);
                this.f28794d = numA4 != null ? numA4.intValue() : i12;
            } else {
                String strA2 = k.a(str, str2, "retry_interval", k.e(str3));
                Integer numA5 = kVar.a(k.a("retry_interval", "all_mediators"));
                int iIntValue2 = numA5 != null ? numA5.intValue() : 100;
                Integer numA6 = kVar.a(strA2);
                this.f28795e = numA6 != null ? numA6.intValue() : iIntValue2;
                String strA3 = k.a("timeout", "threshold", k.e(str3));
                Integer numA7 = kVar.a(k.a("timeout", "threshold", "all_mediators"));
                int iIntValue3 = numA7 != null ? numA7.intValue() : 300;
                Integer numA8 = kVar.a(strA3);
                this.f28796f = numA8 != null ? numA8.intValue() : iIntValue3;
                String strA4 = k.a(str, str2, "ilat", k.e(str3));
                String strA5 = k.a(str, str2, "ilat", "all_mediators");
                int iIntValue4 = k.d(str) ? HttpClient.Request.DEFAULT_READ_TIMEOUT_MS : 10000;
                Integer numA9 = kVar.a(strA5);
                iIntValue4 = numA9 != null ? numA9.intValue() : iIntValue4;
                Integer numA10 = kVar.a(strA4);
                this.f28794d = numA10 != null ? numA10.intValue() : iIntValue4;
            }
        }
        int i13 = iIntValue - (this.f28796f + i5);
        IAlog.a("%s : LoadAdContentTimeout resolveLoadAdTimeout : usedTime: %d, global timeout: %d, timeout: %d", IAlog.a(a.class), Integer.valueOf(i5), Integer.valueOf(iIntValue), Integer.valueOf(i13));
        this.f28793c = Math.max(i13, 0);
        int iA = a();
        this.f28791a = iA;
        if (iA == 0) {
            this.f28794d = this.f28793c;
        }
        IAlog.a("%s : LoadAdContentTimeout onFixedLoadAdTimeoutUpdated : Calculated: %d attempts with LeftoverTime: %d", IAlog.a(this), Integer.valueOf(this.f28791a), 0);
        int i14 = this.f28791a;
        if (i14 > 0) {
            int i15 = this.f28793c;
            int i16 = this.f28796f;
            int i17 = this.f28795e;
            for (int i18 = 0; i18 <= i14; i18++) {
                i15 -= (this.f28792b * i18) + this.f28794d;
            }
            this.f28798h = Math.max(0, i15 - ((i17 * i14) + (i16 * i14)));
        }
    }
}
