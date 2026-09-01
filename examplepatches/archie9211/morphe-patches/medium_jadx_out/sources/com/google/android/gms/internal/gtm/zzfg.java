package com.google.android.gms.internal.gtm;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzfg extends zzbr {
    protected String zza;
    protected String zzb;
    protected boolean zzc;
    protected int zzd;
    protected boolean zze;
    protected boolean zzf;

    public zzfg(zzbu zzbuVar) {
        super(zzbuVar);
    }

    public final boolean zzc() {
        zzV();
        return this.zzf;
    }

    @Override // com.google.android.gms.internal.gtm.zzbr
    public final void zzd() {
        ApplicationInfo applicationInfo;
        int i;
        Context contextZzo = zzo();
        try {
            applicationInfo = contextZzo.getPackageManager().getApplicationInfo(contextZzo.getPackageName(), 128);
        } catch (PackageManager.NameNotFoundException e) {
            zzR("PackageManager doesn't know about the app package", e);
            applicationInfo = null;
        }
        if (applicationInfo == null) {
            zzQ("Couldn't get ApplicationInfo to load global config");
            return;
        }
        Bundle bundle = applicationInfo.metaData;
        if (bundle == null || (i = bundle.getInt("com.google.android.gms.analytics.globalConfigResource")) <= 0) {
            return;
        }
        zzbu zzbuVarZzt = zzt();
        zzej zzejVar = (zzej) new zzcr(zzbuVarZzt, new zzei(zzbuVarZzt)).zza(i);
        if (zzejVar != null) {
            zzN("Loading global XML config values");
            String str = zzejVar.zza;
            if (str != null) {
                this.zzb = str;
                zzF("XML config - app name", str);
            }
            String str2 = zzejVar.zzb;
            if (str2 != null) {
                this.zza = str2;
                zzF("XML config - app version", str2);
            }
            String str3 = zzejVar.zzc;
            if (str3 != null) {
                String lowerCase = str3.toLowerCase(Locale.US);
                int i2 = "verbose".equals(lowerCase) ? 0 : "info".equals(lowerCase) ? 1 : "warning".equals(lowerCase) ? 2 : "error".equals(lowerCase) ? 3 : -1;
                if (i2 >= 0) {
                    zzO("XML config - log level", Integer.valueOf(i2));
                }
            }
            int i3 = zzejVar.zzd;
            if (i3 >= 0) {
                this.zzd = i3;
                this.zzc = true;
                zzF("XML config - dispatch period (sec)", Integer.valueOf(i3));
            }
            int i4 = zzejVar.zze;
            if (i4 != -1) {
                boolean z = 1 == i4;
                this.zzf = z;
                this.zze = true;
                zzF("XML config - dry run", Boolean.valueOf(z));
            }
        }
    }

    public final boolean zze() {
        zzV();
        return this.zze;
    }

    public final boolean zzf() {
        zzV();
        return false;
    }
}
