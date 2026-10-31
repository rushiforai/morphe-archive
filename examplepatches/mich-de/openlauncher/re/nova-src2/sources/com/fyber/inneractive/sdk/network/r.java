package com.fyber.inneractive.sdk.network;

/* loaded from: classes.dex */
public final class r implements p0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ s f28768a;

    public r(s sVar) {
        this.f28768a = sVar;
    }

    @Override // com.fyber.inneractive.sdk.network.p0
    public final void a(String str) {
        str.getClass();
        switch (str) {
            case "sdkInitNetworkRequest":
                com.fyber.inneractive.sdk.metrics.d.f28545d.a(this.f28768a.f28751d).f();
                break;
            case "sdkGotServerResponse":
                com.fyber.inneractive.sdk.metrics.d.f28545d.a(this.f28768a.f28751d).g();
                break;
            case "sdkParsedResponse":
                com.fyber.inneractive.sdk.metrics.d.f28545d.a(this.f28768a.f28751d).d();
                break;
        }
    }
}
