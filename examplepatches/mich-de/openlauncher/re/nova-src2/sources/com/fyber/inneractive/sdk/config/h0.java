package com.fyber.inneractive.sdk.config;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class h0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ IAConfigManager f27854a;

    public h0(IAConfigManager iAConfigManager) {
        this.f27854a = iAConfigManager;
    }

    @Override // java.lang.Runnable
    public final void run() {
        l lVar;
        IAConfigManager iAConfigManager = this.f27854a;
        if (iAConfigManager.f27757q == null) {
            iAConfigManager.f27757q = k.a(iAConfigManager.f27749g);
        }
        IAConfigManager iAConfigManager2 = this.f27854a;
        m mVar = iAConfigManager2.C;
        if (mVar == null) {
            IAlog.a("%sDtLocationHeadersStore is null when loadLocationHeadersSnapshot called", IAlog.a(iAConfigManager2));
        } else {
            try {
                Map mapUnmodifiableMap = Collections.unmodifiableMap(mVar.f27863a.f27656a.f27677a.getAll());
                Object obj = mapUnmodifiableMap.get("IADtCountry");
                Integer numValueOf = null;
                String str = obj instanceof String ? (String) obj : null;
                Object obj2 = mapUnmodifiableMap.get("IADtIsGdpr");
                if (obj2 instanceof Integer) {
                    Integer num = (Integer) obj2;
                    int iIntValue = num.intValue();
                    if (iIntValue == 0 || iIntValue == 1) {
                        numValueOf = num;
                    }
                } else if (obj2 instanceof String) {
                    String str2 = (String) obj2;
                    if (!TextUtils.isEmpty(str2)) {
                        try {
                            int i5 = Integer.parseInt(str2.trim());
                            if (i5 == 1 || i5 == 0) {
                                numValueOf = Integer.valueOf(i5);
                            }
                        } catch (NumberFormatException unused) {
                        }
                    }
                }
                IAlog.a("DtLocationHeadersStore: loaded location headers: country=%s, isGdpr=%s", str, numValueOf);
                lVar = new l(str, numValueOf);
            } catch (Throwable th2) {
                IAlog.a("DtLocationHeadersStore: failed to load persisted location headers", th2, new Object[0]);
                lVar = l.f27861b;
            }
            iAConfigManager2.f27748f = lVar.f27862a;
        }
        com.fyber.inneractive.sdk.util.r.f31216b.post(new g0(this));
    }
}
