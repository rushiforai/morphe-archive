package com.google.android.libraries.places.internal;

import java.io.IOException;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes3.dex */
public final class zzbvx implements zzbwq {
    final /* synthetic */ zzbvz zza;
    final /* synthetic */ zzbwq zzb;

    public zzbvx(zzbvz zzbvzVar, zzbwq zzbwqVar) {
        this.zza = zzbvzVar;
        this.zzb = zzbwqVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbwq, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        zzbvz zzbvzVar = this.zza;
        try {
            this.zzb.close();
            Unit unit = Unit.f71706a;
        } catch (IOException e3) {
            throw e3;
        } finally {
            zzbvw.zza(zzbvz.zza, zzbvzVar);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbwq, java.io.Flushable
    public final void flush() {
        zzbvz zzbvzVar = this.zza;
        try {
            this.zzb.flush();
            Unit unit = Unit.f71706a;
        } catch (IOException e3) {
            throw e3;
        } finally {
            zzbvw.zza(zzbvz.zza, zzbvzVar);
        }
    }

    @NotNull
    public final String toString() {
        return "AsyncTimeout.sink(" + this.zzb + ")";
    }

    @Override // com.google.android.libraries.places.internal.zzbwq
    public final void zzn(@NotNull zzbwb source, long j11) {
        Intrinsics.g(source, "source");
        zzbvv.zzb(source.zzg(), 0L, j11);
        while (true) {
            long j12 = 0;
            if (j11 <= 0) {
                return;
            }
            zzbwn zzbwnVar = source.zza;
            Intrinsics.d(zzbwnVar);
            while (true) {
                if (j12 >= 65536) {
                    break;
                }
                j12 += zzbwnVar.zzd - zzbwnVar.zzc;
                if (j12 >= j11) {
                    j12 = j11;
                    break;
                } else {
                    zzbwnVar = zzbwnVar.zzg;
                    Intrinsics.d(zzbwnVar);
                }
            }
            zzbvz zzbvzVar = this.zza;
            try {
                try {
                    this.zzb.zzn(source, j12);
                    Unit unit = Unit.f71706a;
                    zzbvw.zza(zzbvz.zza, zzbvzVar);
                    j11 -= j12;
                } catch (IOException e3) {
                    zzbvw.zza(zzbvz.zza, zzbvzVar);
                    throw e3;
                }
            } catch (Throwable th2) {
                zzbvw.zza(zzbvz.zza, zzbvzVar);
                throw th2;
            }
        }
    }
}
