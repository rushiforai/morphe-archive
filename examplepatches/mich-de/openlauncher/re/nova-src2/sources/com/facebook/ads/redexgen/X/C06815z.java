package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;

/* renamed from: com.facebook.ads.redexgen.X.5z, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C06815z extends BK {
    public final /* synthetic */ C06805y A00;

    public C06815z(C06805y c06805y) {
        this.A00 = c06805y;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final void A03(BL bl2) {
        new Handler(Looper.getMainLooper()).post(new RunnableC2665uT(this));
    }
}
