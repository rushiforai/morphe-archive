package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;

/* renamed from: com.facebook.ads.redexgen.X.5q, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C06725q extends BK {
    public final /* synthetic */ C06715p A00;

    public C06725q(C06715p c06715p) {
        this.A00 = c06715p;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final void A03(BL bl2) {
        new Handler(Looper.getMainLooper()).post(new RunnableC2435ql(this));
    }
}
