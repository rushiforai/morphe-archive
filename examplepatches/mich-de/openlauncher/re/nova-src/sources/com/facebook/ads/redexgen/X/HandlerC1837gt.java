package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

/* renamed from: com.facebook.ads.redexgen.X.gt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class HandlerC1837gt extends Handler {
    public final /* synthetic */ C1840gw A00;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public HandlerC1837gt(C1840gw c1840gw, Looper looper) {
        super(looper);
        this.A00 = c1840gw;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        switch (message.what) {
            case 1:
                this.A00.A02();
                break;
            default:
                super.handleMessage(message);
                break;
        }
    }
}
