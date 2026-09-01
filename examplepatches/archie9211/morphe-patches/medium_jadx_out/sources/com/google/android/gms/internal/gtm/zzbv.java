package com.google.android.gms.internal.gtm;

import android.content.Context;
import defpackage.vp7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzbv {
    private final Context zza;
    private final Context zzb;

    public zzbv(Context context) {
        vp7.p(context);
        Context applicationContext = context.getApplicationContext();
        vp7.q("Application context can't be null", applicationContext);
        this.zza = applicationContext;
        this.zzb = applicationContext;
    }

    public final Context zza() {
        return this.zza;
    }

    public final Context zzb() {
        return this.zzb;
    }
}
