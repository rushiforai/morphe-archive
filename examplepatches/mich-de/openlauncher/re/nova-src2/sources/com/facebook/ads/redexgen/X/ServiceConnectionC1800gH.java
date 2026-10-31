package com.facebook.ads.redexgen.X;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.Messenger;
import android.os.RemoteException;

/* renamed from: com.facebook.ads.redexgen.X.gH, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ServiceConnectionC1800gH implements ServiceConnection {
    public final /* synthetic */ HandlerC1801gI A00;

    public ServiceConnectionC1800gH(HandlerC1801gI handlerC1801gI) {
        this.A00 = handlerC1801gI;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) throws RemoteException {
        this.A00.A07.removeCallbacks(this.A00.A0C);
        this.A00.A07.removeCallbacks(this.A00.A0B);
        this.A00.A01 = 0;
        this.A00.A02 = new Messenger(iBinder);
        if (!AbstractC2206my.A0F(this.A00.A0A)) {
            return;
        }
        this.A00.A0C(this.A00.A02);
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        this.A00.A0J();
        this.A00.A0I(AbstractC2206my.A0D(this.A00.A0A));
    }
}
