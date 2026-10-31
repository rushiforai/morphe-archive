package com.facebook.ads.redexgen.X;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/* renamed from: com.facebook.ads.redexgen.X.Md, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1077Md extends BroadcastReceiver {
    public final /* synthetic */ C1078Me A00;

    public C1077Md(C1078Me c1078Me) {
        this.A00 = c1078Me;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        int iA00 = C1078Me.A00(context);
        if (N1.A02 >= 31 && iA00 == 5) {
            C1075Mb.A02(context, this.A00);
        } else {
            this.A00.A07(iA00);
        }
    }
}
