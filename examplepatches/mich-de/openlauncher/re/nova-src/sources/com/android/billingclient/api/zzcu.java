package com.android.billingclient.api;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.IInterface;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.u;
import com.google.android.gms.internal.play_billing.v;
import com.google.android.gms.internal.play_billing.w;
import java.util.Objects;

/* loaded from: classes2.dex */
final class zzcu implements ServiceConnection {
    final /* synthetic */ zzcw zza;

    public /* synthetic */ zzcu(zzcw zzcwVar, zzcv zzcvVar) {
        Objects.requireNonNull(zzcwVar);
        this.zza = zzcwVar;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        w uVar;
        m0.g("BillingClientTesting", "Billing Override Service connected.");
        zzcw zzcwVar = this.zza;
        int i5 = v.f33560a;
        if (iBinder == null) {
            uVar = null;
        } else {
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.apps.play.billingtestcompanion.aidl.IBillingOverrideService");
            uVar = iInterfaceQueryLocalInterface instanceof w ? (w) iInterfaceQueryLocalInterface : new u(iBinder, "com.google.android.apps.play.billingtestcompanion.aidl.IBillingOverrideService", 1);
        }
        zzcwVar.zzc = uVar;
        zzcwVar.zzb = 2;
        zzcwVar.zzaO(26);
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        m0.h("BillingClientTesting", "Billing Override Service disconnected.");
        zzcw zzcwVar = this.zza;
        zzcwVar.zzc = null;
        zzcwVar.zzb = 0;
    }
}
