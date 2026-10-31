package com.google.android.libraries.places.internal;

import java.util.concurrent.TimeUnit;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public abstract class zzqn {
    private static String zza = "com.google.android.libraries.places.internal.zzqs";
    private static String zzb = "com.google.common.flogger.backend.google.GooglePlatform";
    private static String zzc = "com.google.common.flogger.backend.system.DefaultPlatform";
    private static final String[] zzd = {"com.google.android.libraries.places.internal.zzqs", "com.google.common.flogger.backend.google.GooglePlatform", "com.google.common.flogger.backend.system.DefaultPlatform"};

    public static int zza() {
        return zzrt.zza();
    }

    public static long zzb() {
        return zzql.zza.zzc();
    }

    public static zzpw zzd(String str) {
        return zzql.zza.zze(str);
    }

    public static zzpy zzf() {
        return zzi().zza();
    }

    public static zzqm zzg() {
        return zzql.zza.zzh();
    }

    public static zzrc zzi() {
        return zzql.zza.zzj();
    }

    public static zzrp zzk() {
        return zzi().zzc();
    }

    public static String zzl() {
        return zzql.zza.zzm();
    }

    public static boolean zzn(String str, Level level, boolean z11) {
        zzi().zzd(str, level, z11);
        return false;
    }

    public long zzc() {
        return TimeUnit.MILLISECONDS.toNanos(System.currentTimeMillis());
    }

    public abstract zzpw zze(String str);

    public abstract zzqm zzh();

    public zzrc zzj() {
        return zzrc.zze();
    }

    public abstract String zzm();
}
