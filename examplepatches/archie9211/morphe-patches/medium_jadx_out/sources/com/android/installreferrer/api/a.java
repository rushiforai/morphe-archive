package com.android.installreferrer.api;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.IInterface;
import com.android.installreferrer.commons.InstallReferrerCommons;
import defpackage.au5;
import defpackage.bu5;
import defpackage.ygf;
import defpackage.zt5;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a implements ServiceConnection {
    public final InstallReferrerStateListener a;
    public final /* synthetic */ b b;

    public a(b bVar, InstallReferrerStateListener installReferrerStateListener) {
        this.b = bVar;
        if (installReferrerStateListener != null) {
            this.a = installReferrerStateListener;
        } else {
            ygf.i("Please specify a listener to know when setup is done.");
            throw null;
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        bu5 zt5Var;
        InstallReferrerCommons.logVerbose("InstallReferrerClient", "Install Referrer service connected.");
        int i = au5.e;
        if (iBinder == null) {
            zt5Var = null;
        } else {
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.finsky.externalreferrer.IGetInstallReferrerService");
            zt5Var = iInterfaceQueryLocalInterface instanceof bu5 ? (bu5) iInterfaceQueryLocalInterface : new zt5(iBinder);
        }
        b bVar = this.b;
        bVar.c = zt5Var;
        bVar.a = 2;
        this.a.onInstallReferrerSetupFinished(0);
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        InstallReferrerCommons.logWarn("InstallReferrerClient", "Install Referrer service disconnected.");
        b bVar = this.b;
        bVar.c = null;
        bVar.a = 0;
        this.a.onInstallReferrerServiceDisconnected();
    }
}
