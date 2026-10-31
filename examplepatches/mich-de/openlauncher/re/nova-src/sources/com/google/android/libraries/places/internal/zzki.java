package com.google.android.libraries.places.internal;

import android.content.Context;
import android.content.pm.PackageManager;

/* loaded from: classes3.dex */
public final class zzki {
    private final Context zza;

    public zzki(Context context) {
        zzmt.zzc(context, "Context must not be null.");
        this.zza = context;
    }

    public final zzoa zza() throws PackageManager.NameNotFoundException {
        Context context = this.zza;
        String packageName = context.getPackageName();
        String strZza = zzju.zza(context.getPackageManager(), packageName);
        zznz zznzVar = new zznz();
        if (packageName != null) {
            zznzVar.zza("X-Android-Package", packageName);
        }
        if (strZza != null) {
            zznzVar.zza("X-Android-Cert", strZza);
        }
        return zznzVar.zzc();
    }
}
