package com.google.android.gms.internal.gtm;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.text.TextUtils;
import android.util.Log;
import defpackage.qjg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzce extends zzbr {
    private final zzau zza;

    public zzce(zzbu zzbuVar) {
        super(zzbuVar);
        this.zza = new zzau();
    }

    @Override // com.google.android.gms.internal.gtm.zzbr
    public final void zzd() {
        qjg qjgVarZzq = zzq();
        if (qjgVarZzq.c == null) {
            synchronized (qjgVarZzq) {
                try {
                    if (qjgVarZzq.c == null) {
                        zzau zzauVar = new zzau();
                        PackageManager packageManager = qjgVarZzq.a.getPackageManager();
                        String packageName = qjgVarZzq.a.getPackageName();
                        zzauVar.zzi(packageName);
                        zzauVar.zzj(packageManager.getInstallerPackageName(packageName));
                        String str = null;
                        try {
                            PackageInfo packageInfo = packageManager.getPackageInfo(qjgVarZzq.a.getPackageName(), 0);
                            if (packageInfo != null) {
                                CharSequence applicationLabel = packageManager.getApplicationLabel(packageInfo.applicationInfo);
                                if (!TextUtils.isEmpty(applicationLabel)) {
                                    packageName = applicationLabel.toString();
                                }
                                str = packageInfo.versionName;
                            }
                        } catch (PackageManager.NameNotFoundException unused) {
                            Log.e("GAv4", "Error retrieving package info: appName set to " + packageName);
                        }
                        zzauVar.zzk(packageName);
                        zzauVar.zzl(str);
                        qjgVarZzq.c = zzauVar;
                    }
                } finally {
                }
            }
        }
        qjgVarZzq.c.zzh(this.zza);
        zzfg zzfgVarZzB = zzB();
        zzfgVarZzB.zzV();
        String str2 = zzfgVarZzB.zzb;
        if (str2 != null) {
            this.zza.zzk(str2);
        }
        zzfgVarZzB.zzV();
        String str3 = zzfgVarZzB.zza;
        if (str3 != null) {
            this.zza.zzl(str3);
        }
    }
}
