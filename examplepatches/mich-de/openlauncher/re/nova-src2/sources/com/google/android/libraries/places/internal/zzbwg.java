package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.io.InputStream;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes3.dex */
final class zzbwg implements zzbws {

    @NotNull
    private final InputStream zza;

    @NotNull
    private final zzbwv zzb;

    public zzbwg(@NotNull InputStream input, @NotNull zzbwv timeout) {
        Intrinsics.g(input, "input");
        Intrinsics.g(timeout, "timeout");
        this.zza = input;
        this.zzb = timeout;
    }

    @Override // com.google.android.libraries.places.internal.zzbws, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.zza.close();
    }

    @NotNull
    public final String toString() {
        return "source(" + this.zza + ")";
    }

    @Override // com.google.android.libraries.places.internal.zzbws
    public final long zza(@NotNull zzbwb sink, long j11) throws IOException {
        Intrinsics.g(sink, "sink");
        try {
            zzbwv.zzb();
            zzbwn zzbwnVarZzB = sink.zzB(1);
            int i5 = this.zza.read(zzbwnVarZzB.zzb, zzbwnVarZzB.zzd, (int) Math.min(j11, 8192 - zzbwnVarZzB.zzd));
            if (i5 != -1) {
                zzbwnVarZzB.zzd += i5;
                long j12 = i5;
                sink.zzE(sink.zzg() + j12);
                return j12;
            }
            if (zzbwnVarZzB.zzc != zzbwnVarZzB.zzd) {
                return -1L;
            }
            sink.zza = zzbwnVarZzB.zza();
            zzbwo.zzb(zzbwnVarZzB);
            return -1L;
        } catch (AssertionError e3) {
            if (zzbwi.zza(e3)) {
                throw new IOException(e3);
            }
            throw e3;
        }
    }
}
