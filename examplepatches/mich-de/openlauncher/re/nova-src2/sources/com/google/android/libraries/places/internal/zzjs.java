package com.google.android.libraries.places.internal;

import java.util.Locale;

/* loaded from: classes3.dex */
public final class zzjs {
    private volatile String zza;
    private volatile Locale zzb;
    private volatile boolean zzc;
    private volatile boolean zzd;

    public final synchronized String zza() {
        zzmt.zzp(zzg(), "ApiConfig must be initialized.");
        if (this.zza == null) {
            throw null;
        }
        return this.zza;
    }

    public final synchronized Locale zzb() {
        try {
            zzmt.zzp(zzg(), "ApiConfig must be initialized.");
        } catch (Throwable th2) {
            throw th2;
        }
        return this.zzb == null ? Locale.getDefault() : this.zzb;
    }

    public final synchronized void zzc() {
        this.zza = null;
        this.zzb = null;
        this.zzd = false;
    }

    public final synchronized void zzd(String str, Locale locale, boolean z11) {
        zzmt.zzc(str, "API Key must not be null.");
        zzmt.zzf(!str.isEmpty(), "API Key must not be empty.");
        this.zza = str;
        this.zzb = locale;
        this.zzc = false;
        this.zzd = false;
    }

    public final synchronized void zze(String str, Locale locale, boolean z11) {
        zzd(str, locale, false);
        this.zzd = true;
    }

    public final boolean zzf() {
        return false;
    }

    public final synchronized boolean zzg() {
        return this.zza != null;
    }

    public final boolean zzh() {
        return this.zzd;
    }
}
