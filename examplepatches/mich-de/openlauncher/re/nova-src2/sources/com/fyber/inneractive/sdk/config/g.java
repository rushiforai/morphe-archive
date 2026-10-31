package com.fyber.inneractive.sdk.config;

import android.content.Context;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.HashMap;
import java.util.Locale;

/* loaded from: classes.dex */
public final class g extends com.fyber.inneractive.sdk.network.v0 {
    public g(f0 f0Var, Context context) {
        super(f0Var, context, new f());
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x003f  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0051  */
    @Override // com.fyber.inneractive.sdk.network.t0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(Object obj, Exception exc, boolean z11, HashMap map) throws NumberFormatException {
        Integer numValueOf;
        m mVar;
        m0 m0Var = (m0) obj;
        if (map != null) {
            String strA = com.fyber.inneractive.sdk.network.n.DT_COUNTRY.a();
            Locale locale = Locale.US;
            String str = (String) map.get(strA.toLowerCase(locale));
            String str2 = (String) map.get(com.fyber.inneractive.sdk.network.n.DT_IS_GDPR.a().toLowerCase(locale));
            if (TextUtils.isEmpty(str2)) {
                numValueOf = null;
                IAConfigManager iAConfigManager = IAConfigManager.Q;
                iAConfigManager.f27748f = numValueOf;
                mVar = iAConfigManager.C;
                if (mVar != null) {
                    IAlog.a("DtLocationHeadersStore is null when persistDtLocationHeadersAndInvalidatePrivacyKeys called", new Object[0]);
                } else {
                    IAlog.a("DtLocationHeadersStore: persisting location headers: country=%s, isGdpr=%s", str, numValueOf);
                    HashMap map2 = new HashMap();
                    map2.put("IADtCountry", str);
                    map2.put("IADtIsGdpr", numValueOf);
                    mVar.f27863a.f27656a.a(map2);
                    com.fyber.inneractive.sdk.util.r.f31216b.post(new l0());
                }
            } else {
                try {
                    int i5 = Integer.parseInt(str2.trim());
                    if (i5 == 1 || i5 == 0) {
                        numValueOf = Integer.valueOf(i5);
                    }
                } catch (NumberFormatException unused) {
                }
                IAConfigManager iAConfigManager2 = IAConfigManager.Q;
                iAConfigManager2.f27748f = numValueOf;
                mVar = iAConfigManager2.C;
                if (mVar != null) {
                }
            }
        }
        super.a(m0Var, exc, z11, map);
    }
}
