package com.facebook.ads.redexgen.X;

import android.database.ContentObserver;
import android.os.Handler;

/* renamed from: com.facebook.ads.redexgen.X.eD, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1673eD extends ContentObserver {
    public final BR A00;

    public C1673eD(Handler handler, BR br2) {
        super(handler);
        this.A00 = br2;
    }

    @Override // android.database.ContentObserver
    public final boolean deliverSelfNotifications() {
        return false;
    }

    @Override // android.database.ContentObserver
    public final void onChange(boolean z11) {
        this.A00.A0f();
    }
}
