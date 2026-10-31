package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzbtx implements zzbws {
    int zza;
    byte zzb;
    int zzc;
    int zzd;
    short zze;
    private final zzbwd zzf;

    public zzbtx(zzbwd zzbwdVar) {
        this.zzf = zzbwdVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbws, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
    }

    @Override // com.google.android.libraries.places.internal.zzbws
    public final long zza(zzbwb zzbwbVar, long j11) throws IOException {
        int i5;
        int iZze;
        do {
            int i11 = this.zzd;
            if (i11 == 0) {
                this.zzf.zzF(this.zze);
                this.zze = (short) 0;
                if ((this.zzb & 4) == 0) {
                    i5 = this.zzc;
                    int iZzb = zzbub.zzb(this.zzf);
                    this.zzd = iZzb;
                    this.zza = iZzb;
                    int iZzc = this.zzf.zzc() & 255;
                    this.zzb = (byte) (this.zzf.zzc() & 255);
                    Logger logger = zzbub.zza;
                    Level level = Level.FINE;
                    byte b11 = (byte) iZzc;
                    if (logger.isLoggable(level)) {
                        zzbub.zza.logp(level, "io.grpc.okhttp.internal.framed.Http2$ContinuationSource", "readContinuationHeader", zzbty.zza(true, this.zzc, this.zza, b11, this.zzb));
                    }
                    iZze = this.zzf.zze() & LayoutNode.NotPlacedPlaceOrder;
                    this.zzc = iZze;
                    if (b11 != 9) {
                        throw zzbub.zzi("%s != TYPE_CONTINUATION", Byte.valueOf(b11));
                    }
                }
            } else {
                long jZza = this.zzf.zza(zzbwbVar, Math.min(8192L, i11));
                if (jZza != -1) {
                    this.zzd -= (int) jZza;
                    return jZza;
                }
            }
            return -1L;
        } while (iZze == i5);
        throw zzbub.zzi("TYPE_CONTINUATION streamId changed", new Object[0]);
    }
}
