package com.fyber.inneractive.sdk.external;

import android.content.Context;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.external.OnFyberMarketplaceInitializedListener;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.i1;
import org.json.JSONException;

/* loaded from: classes.dex */
public final class a implements IAConfigManager.OnConfigurationReadyAndValidListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f28011a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ OnFyberMarketplaceInitializedListener f28012b;

    public a(Context context, OnFyberMarketplaceInitializedListener onFyberMarketplaceInitializedListener) {
        this.f28011a = context;
        this.f28012b = onFyberMarketplaceInitializedListener;
    }

    @Override // com.fyber.inneractive.sdk.config.IAConfigManager.OnConfigurationReadyAndValidListener
    public final void onConfigurationReadyAndValid(IAConfigManager iAConfigManager, boolean z11, Exception exc) throws JSONException {
        if (this.f28011a.getApplicationContext() != null) {
            InneractiveAdManager.a();
            IAConfigManager.removeListener(this);
            InneractiveAdManager.f27983d = null;
            if (z11) {
                InneractiveAdManager.a(this.f28012b, OnFyberMarketplaceInitializedListener.FyberInitStatus.SUCCESSFULLY, null);
            } else {
                InneractiveAdManager.a(this.f28012b, exc instanceof InvalidAppIdException ? OnFyberMarketplaceInitializedListener.FyberInitStatus.INVALID_APP_ID : OnFyberMarketplaceInitializedListener.FyberInitStatus.FAILED, exc != null ? exc.getLocalizedMessage() : null);
            }
            try {
                i1.a();
            } catch (Throwable th2) {
                IAlog.a("%s : SdkPublisherDiagnostics.initialize() : %s", "InneractiveAdManager", th2);
                InneractiveAdManager.a(this.f28011a, th2);
            }
        }
    }
}
