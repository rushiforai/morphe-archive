package com.google.android.gms.internal.gtm;

import defpackage.vp7;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzeq {
    final /* synthetic */ zzer zza;
    private int zzb;
    private final ByteArrayOutputStream zzc = new ByteArrayOutputStream();

    public zzeq(zzer zzerVar) {
        this.zza = zzerVar;
    }

    public final int zza() {
        return this.zzb;
    }

    public final boolean zzb(zzek zzekVar) {
        vp7.p(zzekVar);
        int i = this.zzb + 1;
        this.zza.zzw();
        if (i <= zzcs.zzg()) {
            String strZza = this.zza.zza(zzekVar, false);
            if (strZza == null) {
                this.zza.zzz().zzb(zzekVar, "Error formatting hit");
                return true;
            }
            byte[] bytes = strZza.getBytes();
            int length = bytes.length;
            this.zza.zzw();
            if (length > zzcs.zzf()) {
                this.zza.zzz().zzb(zzekVar, "Hit size exceeds the maximum size limit");
                return true;
            }
            if (this.zzc.size() > 0) {
                length++;
            }
            int size = this.zzc.size() + length;
            this.zza.zzw();
            if (size <= ((Integer) zzeh.zzt.zzb()).intValue()) {
                try {
                    if (this.zzc.size() > 0) {
                        this.zzc.write(zzer.zza);
                    }
                    this.zzc.write(bytes);
                    this.zzb++;
                    return true;
                } catch (IOException e) {
                    this.zza.zzJ("Failed to write payload when batching hits", e);
                    return true;
                }
            }
        }
        return false;
    }

    public final byte[] zzc() {
        return this.zzc.toByteArray();
    }
}
