package com.fyber.inneractive.sdk.response;

import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/* loaded from: classes3.dex */
public class g extends e {
    public long M;
    public com.fyber.inneractive.sdk.model.vast.b N;
    public final ArrayList Q = new ArrayList();
    public final LinkedHashMap O = new LinkedHashMap();
    public final ArrayList P = new ArrayList();
    public final LinkedHashMap R = new LinkedHashMap();

    @Override // com.fyber.inneractive.sdk.response.e
    public InneractiveErrorCode a(InneractiveAdRequest inneractiveAdRequest, r rVar) {
        return com.fyber.inneractive.sdk.flow.vast.j.a(inneractiveAdRequest, this, rVar);
    }

    @Override // com.fyber.inneractive.sdk.response.e
    public InneractiveErrorCode b() {
        return a(null, null);
    }
}
