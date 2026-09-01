package com.google.android.gms.internal.gtm;

import android.content.SharedPreferences;
import defpackage.qjg;
import defpackage.y3b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzeu extends zzbr {
    private SharedPreferences zza;
    private long zzb;
    private long zzc;
    private final zzes zzd;

    public zzeu(zzbu zzbuVar) {
        super(zzbuVar);
        this.zzc = -1L;
        zzw();
        this.zzd = new zzes(this, "monitoring", ((Long) zzeh.zzD.zzb()).longValue(), null);
    }

    public final long zza() {
        qjg.a();
        zzV();
        long j = this.zzb;
        if (j != 0) {
            return j;
        }
        long j2 = this.zza.getLong("first_run", 0L);
        if (j2 != 0) {
            this.zzb = j2;
            return j2;
        }
        ((y3b) zzC()).getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        SharedPreferences.Editor editorEdit = this.zza.edit();
        editorEdit.putLong("first_run", jCurrentTimeMillis);
        if (!editorEdit.commit()) {
            zzQ("Failed to commit first run time");
        }
        this.zzb = jCurrentTimeMillis;
        return jCurrentTimeMillis;
    }

    public final long zzb() {
        qjg.a();
        zzV();
        long j = this.zzc;
        if (j != -1) {
            return j;
        }
        long j2 = this.zza.getLong("last_dispatch", 0L);
        this.zzc = j2;
        return j2;
    }

    @Override // com.google.android.gms.internal.gtm.zzbr
    public final void zzd() {
        this.zza = zzo().getSharedPreferences("com.google.android.gms.analytics.prefs", 0);
    }

    public final zzes zze() {
        return this.zzd;
    }

    public final void zzi() {
        qjg.a();
        zzV();
        ((y3b) zzC()).getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        SharedPreferences.Editor editorEdit = this.zza.edit();
        editorEdit.putLong("last_dispatch", jCurrentTimeMillis);
        editorEdit.apply();
        this.zzc = jCurrentTimeMillis;
    }
}
