package com.facebook.ads.redexgen.X;

import android.content.Context;
import com.facebook.ads.internal.api.BidderTokenProviderApi;

/* renamed from: com.facebook.ads.redexgen.X.jh, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2007jh implements BidderTokenProviderApi {
    public final C2077kq A00 = new C2077kq();

    public final C2077kq A00() {
        return this.A00;
    }

    @Override // com.facebook.ads.internal.api.BidderTokenProviderApi
    public final String getBidderToken(Context context) {
        return this.A00.A06(C2013jn.A09(context));
    }
}
