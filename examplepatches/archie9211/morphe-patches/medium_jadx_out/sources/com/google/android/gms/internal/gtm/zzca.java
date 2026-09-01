package com.google.android.gms.internal.gtm;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.RemoteException;
import defpackage.l42;
import defpackage.qjg;
import defpackage.ygf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzca implements ServiceConnection {
    final /* synthetic */ zzcb zza;
    private volatile boolean zzb;
    private volatile zzel zzc;

    public zzca(zzcb zzcbVar) {
        this.zza = zzcbVar;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        if (Looper.getMainLooper() != Looper.myLooper()) {
            ygf.f("AnalyticsServiceConnection.onServiceConnected");
            return;
        }
        synchronized (this) {
            try {
                if (iBinder == null) {
                    this.zza.zzI("Service connected with null binder");
                    return;
                }
                zzel zzelVar = null;
                try {
                    String interfaceDescriptor = iBinder.getInterfaceDescriptor();
                    if ("com.google.android.gms.analytics.internal.IAnalyticsService".equals(interfaceDescriptor)) {
                        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.analytics.internal.IAnalyticsService");
                        zzelVar = iInterfaceQueryLocalInterface instanceof zzel ? (zzel) iInterfaceQueryLocalInterface : new zzel(iBinder);
                        this.zza.zzN("Bound to IAnalyticsService interface");
                    } else {
                        this.zza.zzJ("Got binder with a wrong descriptor", interfaceDescriptor);
                    }
                } catch (RemoteException unused) {
                    this.zza.zzI("Service connect failed to get IAnalyticsService");
                }
                if (zzelVar == null) {
                    try {
                        l42.a().b(this.zza.zzo(), this.zza.zza);
                    } catch (IllegalArgumentException unused2) {
                    }
                } else if (this.zzb) {
                    this.zzc = zzelVar;
                } else {
                    this.zza.zzQ("onServiceConnected received after the timeout limit");
                    qjg qjgVarZzq = this.zza.zzq();
                    zzby zzbyVar = new zzby(this, zzelVar);
                    qjgVarZzq.getClass();
                    qjgVarZzq.b.submit(zzbyVar);
                }
            } finally {
                notifyAll();
            }
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        if (Looper.getMainLooper() != Looper.myLooper()) {
            ygf.f("AnalyticsServiceConnection.onServiceDisconnected");
            return;
        }
        qjg qjgVarZzq = this.zza.zzq();
        zzbz zzbzVar = new zzbz(this, componentName);
        qjgVarZzq.getClass();
        qjgVarZzq.b.submit(zzbzVar);
    }

    public final zzel zza() {
        qjg.a();
        Intent intent = new Intent("com.google.android.gms.analytics.service.START");
        intent.setComponent(new ComponentName("com.google.android.gms", "com.google.android.gms.analytics.service.AnalyticsService"));
        Context contextZzo = this.zza.zzo();
        intent.putExtra("app_package_name", contextZzo.getPackageName());
        l42 l42VarA = l42.a();
        synchronized (this) {
            this.zzc = null;
            this.zzb = true;
            boolean zC = l42VarA.c(contextZzo, contextZzo.getClass().getName(), intent, this.zza.zza, 129, null);
            this.zza.zzO("Bind to service requested", Boolean.valueOf(zC));
            if (!zC) {
                this.zzb = false;
                return null;
            }
            try {
                this.zza.zzw();
                wait(((Long) zzeh.zzB.zzb()).longValue());
            } catch (InterruptedException unused) {
                this.zza.zzQ("Wait for service connect was interrupted");
            }
            this.zzb = false;
            zzel zzelVar = this.zzc;
            this.zzc = null;
            if (zzelVar == null) {
                this.zza.zzI("Successfully bound to service but never got onServiceConnected callback");
            }
            return zzelVar;
        }
    }
}
