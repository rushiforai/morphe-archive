package com.google.android.libraries.places.internal;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import u90.b;

@SourceDebugExtension
/* loaded from: classes3.dex */
public final class zzbwn {

    @NotNull
    public static final zzbwm zza = new zzbwm(null);

    @JvmField
    @NotNull
    public final byte[] zzb;

    @JvmField
    public int zzc;

    @JvmField
    public int zzd;

    @JvmField
    public boolean zze;

    @JvmField
    public final boolean zzf;

    @JvmField
    @Nullable
    public zzbwn zzg;

    @JvmField
    @Nullable
    public zzbwn zzh;

    public zzbwn() {
        this.zzb = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
        this.zzf = true;
        this.zze = false;
    }

    @Nullable
    public final zzbwn zza() {
        zzbwn zzbwnVar = this.zzg;
        if (zzbwnVar == this) {
            zzbwnVar = null;
        }
        zzbwn zzbwnVar2 = this.zzh;
        Intrinsics.d(zzbwnVar2);
        zzbwnVar2.zzg = this.zzg;
        zzbwn zzbwnVar3 = this.zzg;
        Intrinsics.d(zzbwnVar3);
        zzbwnVar3.zzh = this.zzh;
        this.zzg = null;
        this.zzh = null;
        return zzbwnVar;
    }

    @NotNull
    public final zzbwn zzb(@NotNull zzbwn segment) {
        Intrinsics.g(segment, "segment");
        segment.zzh = this;
        segment.zzg = this.zzg;
        zzbwn zzbwnVar = this.zzg;
        Intrinsics.d(zzbwnVar);
        zzbwnVar.zzh = segment;
        this.zzg = segment;
        return segment;
    }

    @NotNull
    public final zzbwn zzc() {
        this.zze = true;
        return new zzbwn(this.zzb, this.zzc, this.zzd, true, false);
    }

    @NotNull
    public final zzbwn zzd(int i5) {
        zzbwn zzbwnVarZzc;
        if (i5 > this.zzd - this.zzc) {
            throw new IllegalArgumentException("byteCount out of range");
        }
        if (i5 >= 1024) {
            zzbwnVarZzc = zzc();
        } else {
            byte[] bArr = this.zzb;
            zzbwn zzbwnVarZza = zzbwo.zza();
            byte[] bArr2 = zzbwnVarZza.zzb;
            int i11 = this.zzc;
            b.v(bArr, i11, bArr2, i11 + i5, 2);
            zzbwnVarZzc = zzbwnVarZza;
        }
        zzbwnVarZzc.zzd = zzbwnVarZzc.zzc + i5;
        this.zzc += i5;
        zzbwn zzbwnVar = this.zzh;
        Intrinsics.d(zzbwnVar);
        zzbwnVar.zzb(zzbwnVarZzc);
        return zzbwnVarZzc;
    }

    public final void zze(@NotNull zzbwn sink, int i5) {
        Intrinsics.g(sink, "sink");
        if (!sink.zzf) {
            throw new IllegalStateException("only owner can write");
        }
        int i11 = sink.zzd;
        int i12 = i11 + i5;
        if (i12 > 8192) {
            if (sink.zze) {
                throw new IllegalArgumentException();
            }
            int i13 = sink.zzc;
            if (i12 - i13 > 8192) {
                throw new IllegalArgumentException();
            }
            byte[] bArr = sink.zzb;
            b.v(bArr, i13, bArr, i11, 2);
            i11 = sink.zzd - sink.zzc;
            sink.zzd = i11;
            sink.zzc = 0;
        }
        byte[] bArr2 = this.zzb;
        byte[] bArr3 = sink.zzb;
        int i14 = this.zzc;
        b.q(bArr2, i11, bArr3, i14, i14 + i5);
        sink.zzd += i5;
        this.zzc += i5;
    }

    public zzbwn(@NotNull byte[] data, int i5, int i11, boolean z11, boolean z12) {
        Intrinsics.g(data, "data");
        this.zzb = data;
        this.zzc = i5;
        this.zzd = i11;
        this.zze = z11;
        this.zzf = false;
    }
}
