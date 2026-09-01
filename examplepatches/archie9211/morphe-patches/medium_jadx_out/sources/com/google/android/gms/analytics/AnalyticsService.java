package com.google.android.gms.analytics;

import android.app.Service;
import android.app.job.JobParameters;
import android.content.Intent;
import android.os.IBinder;
import com.google.android.gms.internal.gtm.zzez;
import com.google.android.gms.internal.gtm.zzfa;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class AnalyticsService extends Service implements zzez {
    public zzfa a;

    @Override // com.google.android.gms.internal.gtm.zzez
    public final boolean callServiceStopSelfResult(int i) {
        return stopSelfResult(i);
    }

    @Override // android.app.Service
    public final IBinder onBind(Intent intent) {
        if (this.a != null) {
            return null;
        }
        this.a = new zzfa(this);
        return null;
    }

    @Override // android.app.Service
    public final void onCreate() {
        super.onCreate();
        zzfa zzfaVar = this.a;
        if (zzfaVar == null) {
            zzfaVar = new zzfa(this);
            this.a = zzfaVar;
        }
        zzfaVar.zze();
    }

    @Override // android.app.Service
    public final void onDestroy() {
        zzfa zzfaVar = this.a;
        if (zzfaVar == null) {
            zzfaVar = new zzfa(this);
            this.a = zzfaVar;
        }
        zzfaVar.zzf();
        super.onDestroy();
    }

    @Override // android.app.Service
    public final int onStartCommand(Intent intent, int i, int i2) {
        zzfa zzfaVar = this.a;
        if (zzfaVar == null) {
            zzfaVar = new zzfa(this);
            this.a = zzfaVar;
        }
        zzfaVar.zza(intent, i, i2);
        return 2;
    }

    @Override // com.google.android.gms.internal.gtm.zzez
    public final void zza(JobParameters jobParameters, boolean z) {
        throw new UnsupportedOperationException();
    }
}
