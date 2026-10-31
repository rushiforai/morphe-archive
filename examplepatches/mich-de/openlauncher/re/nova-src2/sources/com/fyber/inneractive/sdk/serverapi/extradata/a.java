package com.fyber.inneractive.sdk.serverapi.extradata;

import com.fyber.inneractive.sdk.bidder.TokenParametersOuterClass$TokenParameters;
import com.fyber.inneractive.sdk.bidder.d0;
import com.fyber.inneractive.sdk.bidder.k;

/* loaded from: classes.dex */
public final class a implements c {
    @Override // com.fyber.inneractive.sdk.serverapi.extradata.c
    public final boolean a(Object obj) {
        return ((TokenParametersOuterClass$TokenParameters) ((k) obj).f30901b).getPubExtraDataCount() == 0;
    }

    @Override // com.fyber.inneractive.sdk.serverapi.extradata.c
    public final void a(String str, String str2, Object obj) {
        k kVar = (k) obj;
        d0 d0VarNewBuilder = TokenParametersOuterClass$TokenParameters.PubExtraData.newBuilder();
        d0VarNewBuilder.c();
        ((TokenParametersOuterClass$TokenParameters.PubExtraData) d0VarNewBuilder.f30901b).setKey(str);
        d0VarNewBuilder.c();
        ((TokenParametersOuterClass$TokenParameters.PubExtraData) d0VarNewBuilder.f30901b).setValue(str2);
        TokenParametersOuterClass$TokenParameters.PubExtraData pubExtraData = (TokenParametersOuterClass$TokenParameters.PubExtraData) d0VarNewBuilder.a();
        kVar.c();
        ((TokenParametersOuterClass$TokenParameters) kVar.f30901b).addPubExtraData(pubExtraData);
    }
}
