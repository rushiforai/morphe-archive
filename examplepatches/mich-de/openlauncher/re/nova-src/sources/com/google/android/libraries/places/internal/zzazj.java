package com.google.android.libraries.places.internal;

import java.util.concurrent.Executor;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class zzazj {
    static final Logger zza = Logger.getLogger(zzazj.class.getName());
    public static final zzazj zzb = new zzazj();

    private zzazj() {
    }

    public static zzazj zzb() {
        zzazj zzazjVarZza = zzazh.zza.zza();
        return zzazjVarZza == null ? zzb : zzazjVarZza;
    }

    public static Object zzc(Object obj, Object obj2) {
        if (obj != null) {
            return obj;
        }
        throw new NullPointerException((String) obj2);
    }

    public final zzazj zza() {
        zzazj zzazjVarZzb = zzazh.zza.zzb(this);
        return zzazjVarZzb == null ? zzb : zzazjVarZzb;
    }

    public final void zzd(zzazg zzazgVar, Executor executor) {
        zzc(executor, "executor");
    }

    public final void zze(zzazj zzazjVar) {
        zzc(zzazjVar, "toAttach");
        zzazh.zza.zzc(this, zzazjVar);
    }
}
