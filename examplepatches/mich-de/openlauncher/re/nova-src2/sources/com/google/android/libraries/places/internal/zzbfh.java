package com.google.android.libraries.places.internal;

import java.text.MessageFormat;
import java.util.logging.Level;

/* loaded from: classes3.dex */
final class zzbfh extends zzaym {
    private final zzbfi zza;
    private final zzbqt zzb;

    public zzbfh(zzbfi zzbfiVar, zzbqt zzbqtVar) {
        zzmt.zzc(zzbfiVar, "tracer");
        this.zza = zzbfiVar;
        zzmt.zzc(zzbqtVar, "time");
        this.zzb = zzbqtVar;
    }

    private static Level zzc(int i5) {
        int i11 = i5 - 1;
        return i11 != 1 ? (i11 == 2 || i11 == 3) ? Level.FINE : Level.FINEST : Level.FINER;
    }

    private final boolean zzd(int i5) {
        if (i5 == 1) {
            return false;
        }
        this.zza.zzd();
        return false;
    }

    @Override // com.google.android.libraries.places.internal.zzaym
    public final void zza(int i5, String str) {
        zzbap zzbapVarZza = this.zza.zza();
        Level levelZzc = zzc(i5);
        if (zzbfi.zza.isLoggable(levelZzc)) {
            zzbfi.zzb(zzbapVarZza, levelZzc, str);
        }
        zzd(i5);
    }

    @Override // com.google.android.libraries.places.internal.zzaym
    public final void zzb(int i5, String str, Object... objArr) {
        Level levelZzc = zzc(i5);
        zzd(i5);
        zza(i5, zzbfi.zza.isLoggable(levelZzc) ? MessageFormat.format(str, objArr) : null);
    }
}
