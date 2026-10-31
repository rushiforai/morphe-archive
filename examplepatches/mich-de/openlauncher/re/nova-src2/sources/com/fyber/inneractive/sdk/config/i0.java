package com.fyber.inneractive.sdk.config;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class i0 implements com.fyber.inneractive.sdk.network.f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ IAConfigManager f27856a;

    public i0(IAConfigManager iAConfigManager) {
        this.f27856a = iAConfigManager;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) throws NumberFormatException {
        com.fyber.inneractive.sdk.config.global.l lVar = (com.fyber.inneractive.sdk.config.global.l) obj;
        if (lVar != null) {
            IAlog.a("calling mergeRemoteFeaturesConfig fromCache: %b", Boolean.valueOf(z11));
            IAConfigManager iAConfigManager = this.f27856a;
            iAConfigManager.f27766z.f27803a = lVar;
            if (!z11) {
                iAConfigManager.N.a(true, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                IAConfigManager.Q.F.a(iAConfigManager.N);
            }
            IAConfigManager iAConfigManager2 = this.f27856a;
            iAConfigManager2.J.f31104f = iAConfigManager2.N;
            return;
        }
        if (exc != null) {
            if (exc instanceof com.fyber.inneractive.sdk.network.g) {
                IAlog.a("remote features config not modified", new Object[0]);
                IAConfigManager iAConfigManager3 = this.f27856a;
                iAConfigManager3.N.a(true, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                IAConfigManager.Q.F.a(iAConfigManager3.N);
                return;
            }
            IAlog.a("Config manager: Error getting or parsing remote config. Resetting configurable features", new Object[0]);
            IAConfigManager iAConfigManager4 = this.f27856a;
            IAConfigManager iAConfigManager5 = IAConfigManager.Q;
            iAConfigManager4.getClass();
            new com.fyber.inneractive.sdk.network.w(com.fyber.inneractive.sdk.network.t.FATAL_FEATURES_CONFIG_ERROR).a("exception", exc.getClass().getName(), PglCryptUtils.KEY_MESSAGE, exc.getLocalizedMessage()).a((String) null);
        }
    }
}
