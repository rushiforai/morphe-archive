package com.fyber.inneractive.sdk.flow;

import android.content.Context;
import com.fyber.inneractive.sdk.activities.FyberReportAdActivity;
import com.fyber.inneractive.sdk.external.ImpressionData;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.ui.FyberAdIdentifierFactory;
import com.fyber.inneractive.sdk.ui.FyberAdIdentifierLocal;
import com.fyber.inneractive.sdk.ui.FyberAdIdentifierRemote;
import com.fyber.inneractive.sdk.ui.IFyberAdIdentifier;

/* loaded from: classes3.dex */
public final class g implements IFyberAdIdentifier.ClickListener, h {

    /* renamed from: a, reason: collision with root package name */
    public final Context f28146a;

    /* renamed from: b, reason: collision with root package name */
    public final InneractiveAdRequest f28147b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.response.e f28148c;

    /* renamed from: d, reason: collision with root package name */
    public final IFyberAdIdentifier f28149d;

    public g(Context context, boolean z11, InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.response.e eVar, com.fyber.inneractive.sdk.config.global.r rVar) {
        this.f28146a = context;
        this.f28147b = inneractiveAdRequest;
        this.f28148c = eVar;
        new FyberAdIdentifierFactory();
        IFyberAdIdentifier fyberAdIdentifierRemote = z11 ? new FyberAdIdentifierRemote(rVar) : new FyberAdIdentifierLocal(rVar);
        this.f28149d = fyberAdIdentifierRemote;
        fyberAdIdentifierRemote.f31139a = this;
    }

    @Override // com.fyber.inneractive.sdk.ui.IFyberAdIdentifier.ClickListener
    public final void a() {
        Long demandId;
        String demandSource;
        com.fyber.inneractive.sdk.response.e eVar = this.f28148c;
        String str = null;
        if (eVar != null) {
            ImpressionData impressionData = eVar.f31057r;
            String advertiserDomain = impressionData != null ? impressionData.getAdvertiserDomain() : null;
            ImpressionData impressionData2 = this.f28148c.f31057r;
            demandSource = impressionData2 != null ? impressionData2.getDemandSource() : null;
            ImpressionData impressionData3 = this.f28148c.f31057r;
            str = advertiserDomain;
            demandId = impressionData3 != null ? impressionData3.getDemandId() : null;
        } else {
            demandId = null;
            demandSource = null;
        }
        FyberReportAdActivity.start(this.f28146a, this, str, demandSource, demandId);
    }
}
