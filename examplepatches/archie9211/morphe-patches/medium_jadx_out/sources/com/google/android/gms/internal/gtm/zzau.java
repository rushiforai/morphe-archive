package com.google.android.gms.internal.gtm;

import android.text.TextUtils;
import defpackage.jag;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzau extends jag {
    private String zza;
    private String zzb;
    private String zzc;
    private String zzd;

    public final String toString() {
        HashMap map = new HashMap();
        map.put("appName", this.zza);
        map.put("appVersion", this.zzb);
        map.put("appId", this.zzc);
        map.put("appInstallerId", this.zzd);
        return jag.zza(map);
    }

    public final void zzh(zzau zzauVar) {
        if (!TextUtils.isEmpty(this.zza)) {
            zzauVar.zza = this.zza;
        }
        if (!TextUtils.isEmpty(this.zzb)) {
            zzauVar.zzb = this.zzb;
        }
        if (!TextUtils.isEmpty(this.zzc)) {
            zzauVar.zzc = this.zzc;
        }
        if (TextUtils.isEmpty(this.zzd)) {
            return;
        }
        zzauVar.zzd = this.zzd;
    }

    public final void zzi(String str) {
        this.zzc = str;
    }

    public final void zzj(String str) {
        this.zzd = str;
    }

    public final void zzk(String str) {
        this.zza = str;
    }

    public final void zzl(String str) {
        this.zzb = str;
    }
}
