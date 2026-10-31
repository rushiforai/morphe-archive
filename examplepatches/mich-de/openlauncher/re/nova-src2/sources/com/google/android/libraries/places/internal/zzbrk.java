package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzbrk implements zzbts {
    private static final Logger zza = Logger.getLogger(zzbsf.class.getName());
    private final zzbrj zzb;
    private final zzbts zzc;
    private final zzbsi zzd = new zzbsi(Level.FINE, zzbsf.class);

    public zzbrk(zzbrj zzbrjVar, zzbts zzbtsVar) {
        this.zzb = zzbrjVar;
        this.zzc = zzbtsVar;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        try {
            this.zzc.close();
        } catch (IOException e3) {
            zza.logp(e3.getClass().equals(IOException.class) ? Level.FINE : Level.INFO, "io.grpc.okhttp.ExceptionHandlingFrameWriter", n.f39150d, "Failed closing connection", (Throwable) e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zza(zzbue zzbueVar) {
        this.zzd.zzi(2);
        try {
            this.zzc.zza(zzbueVar);
        } catch (IOException e3) {
            this.zzb.zzb(e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzb(boolean z11, int i5, int i11) {
        long j11 = (i5 << 32) | (i11 & 4294967295L);
        if (z11) {
            this.zzd.zze(2, j11);
        } else {
            this.zzd.zzd(2, j11);
        }
        try {
            this.zzc.zzb(z11, i5, i11);
        } catch (IOException e3) {
            this.zzb.zzb(e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzc(int i5, zzbtp zzbtpVar) {
        this.zzd.zzg(2, i5, zzbtpVar);
        try {
            this.zzc.zzc(i5, zzbtpVar);
        } catch (IOException e3) {
            this.zzb.zzb(e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final int zzd() {
        return this.zzc.zzd();
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zze() {
        try {
            this.zzc.zze();
        } catch (IOException e3) {
            this.zzb.zzb(e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzf(boolean z11, int i5, zzbwb zzbwbVar, int i11) {
        this.zzd.zza(2, i5, zzbwbVar, i11, z11);
        try {
            this.zzc.zzf(z11, i5, zzbwbVar, i11);
        } catch (IOException e3) {
            this.zzb.zzb(e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzg() {
        try {
            this.zzc.zzg();
        } catch (IOException e3) {
            this.zzb.zzb(e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzh(int i5, zzbtp zzbtpVar, byte[] bArr) {
        zzbwe zzbweVar = zzbwf.zza;
        this.zzd.zzb(2, 0, zzbtpVar, zzbwe.zzb(bArr));
        try {
            this.zzc.zzh(0, zzbtpVar, bArr);
            this.zzc.zzg();
        } catch (IOException e3) {
            this.zzb.zzb(e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzi(zzbue zzbueVar) {
        this.zzd.zzh(2, zzbueVar);
        try {
            this.zzc.zzi(zzbueVar);
        } catch (IOException e3) {
            this.zzb.zzb(e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzj(boolean z11, boolean z12, int i5, int i11, List list) {
        try {
            this.zzc.zzj(false, false, i5, 0, list);
        } catch (IOException e3) {
            this.zzb.zzb(e3);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final void zzk(int i5, long j11) {
        this.zzd.zzj(2, i5, j11);
        try {
            this.zzc.zzk(i5, j11);
        } catch (IOException e3) {
            this.zzb.zzb(e3);
        }
    }
}
