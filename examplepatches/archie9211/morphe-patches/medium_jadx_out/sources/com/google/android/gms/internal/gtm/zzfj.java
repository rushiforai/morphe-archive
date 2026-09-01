package com.google.android.gms.internal.gtm;

import defpackage.ygf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzfj extends zzfq {
    private String zza;
    private byte zzb;
    private int zzc;
    private int zzd;

    public final zzfq zza(String str) {
        this.zza = "";
        return this;
    }

    public final zzfq zzb(boolean z) {
        this.zzb = (byte) 1;
        return this;
    }

    public final zzfr zzc() {
        if (this.zzb == 1 && this.zza != null && this.zzc != 0 && this.zzd != 0) {
            return new zzfl(this.zza, false, this.zzc, null, null, this.zzd, null);
        }
        StringBuilder sb = new StringBuilder();
        if (this.zza == null) {
            sb.append(" fileOwner");
        }
        if (this.zzb == 0) {
            sb.append(" hasDifferentDmaOwner");
        }
        if (this.zzc == 0) {
            sb.append(" fileChecks");
        }
        if (this.zzd == 0) {
            sb.append(" filePurpose");
        }
        ygf.f("Missing required properties:".concat(sb.toString()));
        return null;
    }

    public final zzfq zzd(int i) {
        this.zzc = i;
        return this;
    }

    public final zzfq zze(int i) {
        this.zzd = 1;
        return this;
    }
}
