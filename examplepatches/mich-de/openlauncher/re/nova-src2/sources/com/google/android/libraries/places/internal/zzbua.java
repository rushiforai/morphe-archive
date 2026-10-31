package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.u1;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
final class zzbua implements zzbts {
    private final zzbwc zza;
    private final zzbwb zzb;
    private final zzbtv zzc;
    private int zzd;
    private boolean zze;

    public zzbua(zzbwc zzbwcVar, boolean z11) {
        this.zza = zzbwcVar;
        zzbwb zzbwbVar = new zzbwb();
        this.zzb = zzbwbVar;
        this.zzc = new zzbtv(u1.FLAG_APPEARED_IN_PRE_LAYOUT, false, zzbwbVar);
        this.zzd = ReaderJsonLexerKt.BATCH_SIZE;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() throws IOException {
        this.zze = true;
        this.zza.close();
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final synchronized void zza(zzbue zzbueVar) throws IOException {
        if (this.zze) {
            throw new IOException("closed");
        }
        this.zzd = zzbueVar.zzc(this.zzd);
        zzl(0, 0, (byte) 4, (byte) 1);
        this.zza.flush();
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final synchronized void zzb(boolean z11, int i5, int i11) throws IOException {
        if (this.zze) {
            throw new IOException("closed");
        }
        zzl(0, 8, (byte) 6, z11 ? (byte) 1 : (byte) 0);
        this.zza.zzw(i5);
        this.zza.zzw(i11);
        this.zza.flush();
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final synchronized void zzc(int i5, zzbtp zzbtpVar) throws IOException {
        if (this.zze) {
            throw new IOException("closed");
        }
        if (zzbtpVar.zzs == -1) {
            throw new IllegalArgumentException();
        }
        zzl(i5, 4, (byte) 3, (byte) 0);
        this.zza.zzw(zzbtpVar.zzs);
        this.zza.flush();
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final int zzd() {
        return this.zzd;
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final synchronized void zze() throws IOException {
        try {
            if (this.zze) {
                throw new IOException("closed");
            }
            Logger logger = zzbub.zza;
            Level level = Level.FINE;
            if (logger.isLoggable(level)) {
                zzbub.zza.logp(level, "io.grpc.okhttp.internal.framed.Http2$Writer", "connectionPreface", ">> CONNECTION " + zzbub.zzb.zze());
            }
            zzbwc zzbwcVar = this.zza;
            byte[] source = zzbub.zzb.zzp();
            Intrinsics.g(source, "source");
            if (((zzbwk) zzbwcVar).zzc) {
                throw new IllegalStateException("closed");
            }
            ((zzbwk) zzbwcVar).zzb.zzl(source, 0, source.length);
            ((zzbwk) zzbwcVar).zza();
            this.zza.flush();
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final synchronized void zzf(boolean z11, int i5, zzbwb zzbwbVar, int i11) throws IOException {
        if (this.zze) {
            throw new IOException("closed");
        }
        zzl(i5, i11, (byte) 0, z11 ? (byte) 1 : (byte) 0);
        if (i11 > 0) {
            this.zza.zzn(zzbwbVar, i11);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final synchronized void zzg() throws IOException {
        if (this.zze) {
            throw new IOException("closed");
        }
        this.zza.flush();
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final synchronized void zzh(int i5, zzbtp zzbtpVar, byte[] bArr) throws IOException {
        if (this.zze) {
            throw new IOException("closed");
        }
        if (zzbtpVar.zzs == -1) {
            throw zzbub.zzf("errorCode.httpCode == -1", new Object[0]);
        }
        zzl(0, 8, (byte) 7, (byte) 0);
        this.zza.zzw(0);
        this.zza.zzw(zzbtpVar.zzs);
        this.zza.flush();
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final synchronized void zzi(zzbue zzbueVar) throws IOException {
        int i5;
        try {
            if (this.zze) {
                throw new IOException("closed");
            }
            int i11 = 0;
            zzl(0, zzbueVar.zzd() * 6, (byte) 4, (byte) 0);
            while (i11 < 10) {
                if (zzbueVar.zzf(i11)) {
                    if (i11 == 4) {
                        int i12 = i11;
                        i11 = 3;
                        i5 = i12;
                    } else {
                        i5 = 7;
                        if (i11 == 7) {
                            i11 = 4;
                        } else {
                            i5 = i11;
                        }
                    }
                    zzbwc zzbwcVar = this.zza;
                    if (((zzbwk) zzbwcVar).zzc) {
                        throw new IllegalStateException("closed");
                    }
                    ((zzbwk) zzbwcVar).zzb.zzq(i11);
                    ((zzbwk) zzbwcVar).zza();
                    this.zza.zzw(zzbueVar.zza(i5));
                    i11 = i5;
                }
                i11++;
            }
            this.zza.flush();
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final synchronized void zzj(boolean z11, boolean z12, int i5, int i11, List list) throws IOException {
        if (this.zze) {
            throw new IOException("closed");
        }
        this.zzc.zzb(list);
        long jZzg = this.zzb.zzg();
        int iMin = (int) Math.min(this.zzd, jZzg);
        long j11 = iMin;
        zzl(i5, iMin, (byte) 1, jZzg == j11 ? (byte) 4 : (byte) 0);
        this.zza.zzn(this.zzb, j11);
        if (jZzg > j11) {
            long j12 = jZzg - j11;
            while (j12 > 0) {
                int iMin2 = (int) Math.min(this.zzd, j12);
                long j13 = iMin2;
                j12 -= j13;
                zzl(i5, iMin2, (byte) 9, j12 == 0 ? (byte) 4 : (byte) 0);
                this.zza.zzn(this.zzb, j13);
            }
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbts
    public final synchronized void zzk(int i5, long j11) throws IOException {
        if (this.zze) {
            throw new IOException("closed");
        }
        if (j11 == 0) {
            throw zzbub.zzf("windowSizeIncrement == 0 || windowSizeIncrement > 0x7fffffffL: %s", new Object[]{0L});
        }
        zzl(i5, 4, (byte) 8, (byte) 0);
        this.zza.zzw((int) j11);
        this.zza.flush();
    }

    public final void zzl(int i5, int i11, byte b11, byte b12) throws IOException {
        Logger logger = zzbub.zza;
        Level level = Level.FINE;
        if (logger.isLoggable(level)) {
            zzbub.zza.logp(level, "io.grpc.okhttp.internal.framed.Http2$Writer", "frameHeader", zzbty.zza(false, i5, i11, b11, b12));
        }
        int i12 = this.zzd;
        if (i11 > i12) {
            throw zzbub.zzf("FRAME_SIZE_ERROR length > %d: %d", new Object[]{Integer.valueOf(i12), Integer.valueOf(i11)});
        }
        if ((Integer.MIN_VALUE & i5) != 0) {
            throw zzbub.zzf("reserved bit set: %s", new Object[]{Integer.valueOf(i5)});
        }
        zzbwc zzbwcVar = this.zza;
        zzbwcVar.zzv((i11 >>> 16) & 255);
        zzbwcVar.zzv((i11 >>> 8) & 255);
        zzbwcVar.zzv(i11 & 255);
        this.zza.zzv(b11);
        this.zza.zzv(b12);
        this.zza.zzw(i5 & LayoutNode.NotPlacedPlaceOrder);
    }
}
