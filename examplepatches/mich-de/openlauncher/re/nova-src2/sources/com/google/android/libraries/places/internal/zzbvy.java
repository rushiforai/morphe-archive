package com.google.android.libraries.places.internal;

import java.io.IOException;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes3.dex */
public final class zzbvy implements zzbws {
    final /* synthetic */ zzbvz zza;
    final /* synthetic */ zzbws zzb;

    public zzbvy(zzbvz zzbvzVar, zzbws zzbwsVar) {
        this.zza = zzbvzVar;
        this.zzb = zzbwsVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbws, java.io.Closeable, java.lang.AutoCloseable
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

    @NotNull
    public final String toString() {
        return "AsyncTimeout.source(" + this.zzb + ")";
    }

    @Override // com.google.android.libraries.places.internal.zzbws
    public final long zza(@NotNull zzbwb sink, long j11) {
        Intrinsics.g(sink, "sink");
        zzbvz zzbvzVar = this.zza;
        try {
            return this.zzb.zza(sink, j11);
        } catch (IOException e3) {
            throw e3;
        } finally {
            zzbvw.zza(zzbvz.zza, zzbvzVar);
        }
    }
}
