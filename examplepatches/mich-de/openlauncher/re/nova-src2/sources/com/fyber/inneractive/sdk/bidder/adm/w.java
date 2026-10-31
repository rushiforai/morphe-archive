package com.fyber.inneractive.sdk.bidder.adm;

import com.fyber.inneractive.sdk.network.p0;

/* loaded from: classes3.dex */
public final class w implements p0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ y f27614a;

    public w(y yVar) {
        this.f27614a = yVar;
    }

    @Override // com.fyber.inneractive.sdk.network.p0
    public final void a(String str) {
        str.getClass();
        switch (str) {
            case "sdkInitNetworkRequest":
                com.fyber.inneractive.sdk.metrics.d dVar = com.fyber.inneractive.sdk.metrics.d.f28545d;
                dVar.a(this.f27614a.f27619d).f();
                dVar.b(this.f27614a.f27619d).f28561c = System.currentTimeMillis();
                break;
            case "sdkGotServerResponse":
                com.fyber.inneractive.sdk.metrics.d.f28545d.a(this.f27614a.f27619d).h();
                break;
            case "sdkParsedResponse":
                com.fyber.inneractive.sdk.metrics.d.f28545d.a(this.f27614a.f27619d).d();
                break;
            case "sdkRequestEndedButWillBeRetried":
                com.fyber.inneractive.sdk.metrics.i iVarB = com.fyber.inneractive.sdk.metrics.d.f28545d.b(this.f27614a.f27619d);
                iVarB.f28559a.put(new com.fyber.inneractive.sdk.metrics.h("retrying"), Long.valueOf(System.currentTimeMillis() - iVarB.f28561c));
                break;
        }
    }
}
