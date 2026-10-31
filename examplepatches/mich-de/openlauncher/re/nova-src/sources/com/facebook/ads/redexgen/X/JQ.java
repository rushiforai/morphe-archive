package com.facebook.ads.redexgen.X;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.os.IBinder;
import android.support.customtabs.ICustomTabsCallback;
import android.support.customtabs.ICustomTabsService;

/* loaded from: assets/audience_network/classes.dex */
public final class JQ {
    public final PendingIntent A00;
    public final ComponentName A01;
    public final ICustomTabsCallback A02;
    public final ICustomTabsService A03;
    public final Object A04 = new Object();

    public JQ(ICustomTabsService iCustomTabsService, ICustomTabsCallback iCustomTabsCallback, ComponentName componentName, PendingIntent pendingIntent) {
        this.A03 = iCustomTabsService;
        this.A02 = iCustomTabsCallback;
        this.A01 = componentName;
        this.A00 = pendingIntent;
    }

    public final PendingIntent A00() {
        return this.A00;
    }

    public final ComponentName A01() {
        return this.A01;
    }

    public final IBinder A02() {
        return this.A02.asBinder();
    }
}
