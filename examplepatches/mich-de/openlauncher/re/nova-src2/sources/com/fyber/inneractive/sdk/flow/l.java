package com.fyber.inneractive.sdk.flow;

import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class l implements IAConfigManager.OnConfigurationReadyAndValidListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ InneractiveAdRequest f28177a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m f28178b;

    public l(m mVar, InneractiveAdRequest inneractiveAdRequest) {
        this.f28178b = mVar;
        this.f28177a = inneractiveAdRequest;
    }

    @Override // com.fyber.inneractive.sdk.config.IAConfigManager.OnConfigurationReadyAndValidListener
    public final void onConfigurationReadyAndValid(IAConfigManager iAConfigManager, boolean z11, Exception exc) {
        IAConfigManager.removeListener(this);
        m mVar = this.f28178b;
        InneractiveAdRequest inneractiveAdRequest = this.f28177a;
        mVar.getClass();
        if (IAConfigManager.c()) {
            IAConfigManager.e();
            mVar.a(inneractiveAdRequest, mVar.c(), new InneractiveInfrastructureError(InneractiveErrorCode.IAB_TCF_PURPOSE_1_DISABLED, i.PURPOSE_1_DISABLED));
            m mVar2 = this.f28178b;
            mVar2.getClass();
            IAlog.a("%sIAB TCF purpose 1 disabled, dropping request", IAlog.a(mVar2));
            return;
        }
        if (z11) {
            this.f28178b.c(this.f28177a);
            return;
        }
        InneractiveInfrastructureError inneractiveInfrastructureError = new InneractiveInfrastructureError(exc instanceof com.fyber.inneractive.sdk.network.b ? InneractiveErrorCode.CONNECTION_ERROR : InneractiveErrorCode.SDK_NOT_INITIALIZED_OR_CONFIG_ERROR, i.NO_APP_CONFIG_AVAILABLE, exc);
        m mVar3 = this.f28178b;
        mVar3.a(this.f28177a, mVar3.c(), inneractiveInfrastructureError);
    }
}
