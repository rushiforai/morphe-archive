package com.google.android.gms.internal.gtm;

import android.content.SharedPreferences;
import defpackage.vp7;
import defpackage.y3b;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzes {
    final /* synthetic */ zzeu zza;
    private final String zzb;
    private final long zzc;

    public /* synthetic */ zzes(zzeu zzeuVar, String str, long j, zzet zzetVar) {
        this.zza = zzeuVar;
        vp7.n("monitoring");
        vp7.l(j > 0);
        this.zzb = "monitoring";
        this.zzc = j;
    }

    private final long zzd() {
        return this.zza.zza.getLong(zzf(), 0L);
    }

    private final String zze() {
        return this.zzb.concat(":count");
    }

    private final String zzf() {
        return this.zzb.concat(":start");
    }

    private final void zzg() {
        ((y3b) this.zza.zzC()).getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        SharedPreferences.Editor editorEdit = this.zza.zza.edit();
        editorEdit.remove(zze());
        editorEdit.remove(zzb());
        editorEdit.putLong(zzf(), jCurrentTimeMillis);
        editorEdit.commit();
    }

    public final String zzb() {
        return this.zzb.concat(":value");
    }

    public final void zzc(String str) {
        if (zzd() == 0) {
            zzg();
        }
        if (str == null) {
            str = "";
        }
        synchronized (this) {
            try {
                long j = this.zza.zza.getLong(zze(), 0L);
                if (j <= 0) {
                    SharedPreferences.Editor editorEdit = this.zza.zza.edit();
                    editorEdit.putString(zzb(), str);
                    editorEdit.putLong(zze(), 1L);
                    editorEdit.apply();
                    return;
                }
                long leastSignificantBits = UUID.randomUUID().getLeastSignificantBits() & Long.MAX_VALUE;
                long j2 = j + 1;
                long j3 = Long.MAX_VALUE / j2;
                SharedPreferences.Editor editorEdit2 = this.zza.zza.edit();
                if (leastSignificantBits < j3) {
                    editorEdit2.putString(zzb(), str);
                }
                editorEdit2.putLong(zze(), j2);
                editorEdit2.apply();
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
