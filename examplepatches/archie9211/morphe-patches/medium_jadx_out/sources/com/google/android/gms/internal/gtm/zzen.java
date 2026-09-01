package com.google.android.gms.internal.gtm;

import android.util.Log;
import defpackage.g87;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Deprecated
public abstract class zzen {
    private static volatile g87 zza = new zzct();

    public static void zzb(String str, Object obj) {
        String str2;
        zzeo zzeoVarZza = zzeo.zza();
        if (zzeoVarZza != null) {
            zzeoVarZza.zzJ(str, obj);
        } else if (zzf(3)) {
            if (obj != null) {
                str2 = str + ":" + ((String) obj);
            } else {
                str2 = str;
            }
            Log.e((String) zzeh.zzb.zzb(), str2);
        }
        g87 g87Var = zza;
        if (g87Var != null) {
            g87Var.error(str);
        }
    }

    public static boolean zzf(int i) {
        return zza != null && zza.getLogLevel() <= i;
    }
}
