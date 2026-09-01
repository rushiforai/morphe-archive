package com.android.billingclient.api;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.IInterface;
import defpackage.rvf;
import defpackage.rxf;
import defpackage.uvf;
import defpackage.zvf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l implements ServiceConnection {
    public final /* synthetic */ m a;

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        zvf rvfVar;
        rxf.h("BillingClientTesting", "Billing Override Service connected.");
        m mVar = this.a;
        int i = uvf.f;
        if (iBinder == null) {
            rvfVar = null;
        } else {
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.apps.play.billingtestcompanion.aidl.IBillingOverrideService");
            rvfVar = iInterfaceQueryLocalInterface instanceof zvf ? (zvf) iInterfaceQueryLocalInterface : new rvf(iBinder, "com.google.android.apps.play.billingtestcompanion.aidl.IBillingOverrideService", 2);
        }
        mVar.P = rvfVar;
        mVar.O = 2;
        mVar.X(26);
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        rxf.i("BillingClientTesting", "Billing Override Service disconnected.");
        m mVar = this.a;
        mVar.P = null;
        mVar.O = 0;
    }
}
