package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

/* loaded from: assets/audience_network/classes.dex */
public class OR extends Handler {
    public final /* synthetic */ AnonymousClass95 A00;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public OR(AnonymousClass95 anonymousClass95, Looper looper) {
        super(looper);
        this.A00 = anonymousClass95;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message msg) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0N(msg);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
