package com.google.android.gms.internal.gtm;

import android.os.Looper;
import defpackage.qjg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzcu implements Runnable {
    final /* synthetic */ zzcv zza;

    public zzcu(zzcv zzcvVar) {
        this.zza = zzcvVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Looper looperMyLooper = Looper.myLooper();
        Looper mainLooper = Looper.getMainLooper();
        zzcv zzcvVar = this.zza;
        if (looperMyLooper == mainLooper) {
            qjg qjgVarZzd = zzcvVar.zzb.zzd();
            qjgVarZzd.getClass();
            qjgVarZzd.b.submit(this);
        } else {
            boolean zZzh = zzcvVar.zzh();
            zzcvVar.zzd = 0L;
            if (zZzh) {
                this.zza.zza();
            }
        }
    }
}
