package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Message;

/* loaded from: assets/audience_network/classes.dex */
public final class TV implements ML {
    public Message A00;
    public TU A01;

    public TV() {
    }

    private void A00() {
        this.A00 = null;
        this.A01 = null;
        TU.A01(this);
    }

    public final TV A01(Message message, TU tu2) {
        this.A00 = message;
        this.A01 = tu2;
        return this;
    }

    public final void A02() {
        ((Message) AbstractC1062Ln.A01(this.A00)).sendToTarget();
        A00();
    }

    public final boolean A03(Handler handler) {
        boolean success = handler.sendMessageAtFrontOfQueue((Message) AbstractC1062Ln.A01(this.A00));
        A00();
        return success;
    }
}
