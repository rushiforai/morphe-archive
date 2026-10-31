package com.google.android.libraries.places.internal;

import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import u90.b;

@SourceDebugExtension
/* loaded from: classes3.dex */
public final class zzbwp extends zzbwf {

    @NotNull
    private final transient byte[][] zzc;

    @NotNull
    private final transient int[] zzd;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzbwp(@NotNull byte[][] segments, @NotNull int[] directory) {
        super(zzbwf.zzb.zzn());
        Intrinsics.g(segments, "segments");
        Intrinsics.g(directory, "directory");
        this.zzc = segments;
        this.zzd = directory;
    }

    private final zzbwf zzs() {
        return new zzbwf(zzp());
    }

    @Override // com.google.android.libraries.places.internal.zzbwf
    public final boolean equals(@Nullable Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof zzbwf) {
            zzbwf zzbwfVar = (zzbwf) obj;
            return zzbwfVar.zzc() == zzc() && zzk(0, zzbwfVar, 0, zzc());
        }
        return false;
    }

    @Override // com.google.android.libraries.places.internal.zzbwf
    public final int hashCode() {
        int iZzb = zzb();
        if (iZzb != 0) {
            return iZzb;
        }
        byte[][] bArr = this.zzc;
        int i5 = 0;
        int i11 = 1;
        int i12 = 0;
        while (true) {
            int length = bArr.length;
            if (i5 >= length) {
                zzh(i11);
                return i11;
            }
            int[] iArr = this.zzd;
            byte[][] bArr2 = this.zzc;
            int i13 = iArr[length + i5];
            int i14 = iArr[i5];
            int i15 = (i14 - i12) + i13;
            byte[] bArr3 = bArr2[i5];
            while (i13 < i15) {
                i11 = (i11 * 31) + bArr3[i13];
                i13++;
            }
            i5++;
            i12 = i14;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbwf
    @NotNull
    public final String toString() {
        return zzs().toString();
    }

    @Override // com.google.android.libraries.places.internal.zzbwf
    public final byte zza(int i5) {
        zzbvv.zzb(this.zzd[this.zzc.length - 1], i5, 1L);
        int iZza = zzbwz.zza(this, i5);
        int i11 = iZza == 0 ? 0 : this.zzd[iZza - 1];
        int[] iArr = this.zzd;
        byte[][] bArr = this.zzc;
        return bArr[iZza][(i5 - i11) + iArr[bArr.length + iZza]];
    }

    @Override // com.google.android.libraries.places.internal.zzbwf
    public final int zzc() {
        return this.zzd[this.zzc.length - 1];
    }

    @Override // com.google.android.libraries.places.internal.zzbwf
    @NotNull
    public final String zze() {
        return zzs().zze();
    }

    @Override // com.google.android.libraries.places.internal.zzbwf
    @NotNull
    public final zzbwf zzg() {
        return zzs().zzg();
    }

    @Override // com.google.android.libraries.places.internal.zzbwf
    public final void zzj(@NotNull zzbwb buffer, int i5, int i11) {
        int i12;
        Intrinsics.g(buffer, "buffer");
        int iZza = zzbwz.zza(this, 0);
        int i13 = 0;
        while (i13 < i11) {
            if (iZza == 0) {
                iZza = 0;
                i12 = 0;
            } else {
                i12 = this.zzd[iZza - 1];
            }
            int[] iArr = this.zzd;
            int i14 = iArr[iZza] - i12;
            int i15 = iArr[this.zzc.length + iZza];
            int iMin = Math.min(i11, i14 + i12) - i13;
            int i16 = (i13 - i12) + i15;
            zzbwn zzbwnVar = new zzbwn(this.zzc[iZza], i16, i16 + iMin, true, false);
            zzbwn zzbwnVar2 = buffer.zza;
            if (zzbwnVar2 == null) {
                zzbwnVar.zzh = zzbwnVar;
                zzbwnVar.zzg = zzbwnVar;
                buffer.zza = zzbwnVar;
            } else {
                zzbwn zzbwnVar3 = zzbwnVar2.zzh;
                Intrinsics.d(zzbwnVar3);
                zzbwnVar3.zzb(zzbwnVar);
            }
            i13 += iMin;
            iZza++;
        }
        buffer.zzE(buffer.zzg() + i11);
    }

    @Override // com.google.android.libraries.places.internal.zzbwf
    public final boolean zzk(int i5, @NotNull zzbwf other, int i11, int i12) {
        int i13;
        Intrinsics.g(other, "other");
        if (zzc() - i12 < 0) {
            return false;
        }
        int iZza = zzbwz.zza(this, 0);
        int i14 = 0;
        int i15 = 0;
        while (i14 < i12) {
            if (iZza == 0) {
                iZza = 0;
                i13 = 0;
            } else {
                i13 = this.zzd[iZza - 1];
            }
            int[] iArr = this.zzd;
            int i16 = iArr[iZza] - i13;
            int i17 = iArr[this.zzc.length + iZza];
            int iMin = Math.min(i12, i16 + i13) - i14;
            if (!other.zzl(i15, this.zzc[iZza], (i14 - i13) + i17, iMin)) {
                return false;
            }
            i15 += iMin;
            i14 += iMin;
            iZza++;
        }
        return true;
    }

    @Override // com.google.android.libraries.places.internal.zzbwf
    public final boolean zzl(int i5, @NotNull byte[] other, int i11, int i12) {
        int i13;
        Intrinsics.g(other, "other");
        if (i5 < 0 || i5 > zzc() - i12 || i11 < 0 || i11 > other.length - i12) {
            return false;
        }
        int i14 = i12 + i5;
        int iZza = zzbwz.zza(this, i5);
        while (i5 < i14) {
            if (iZza == 0) {
                iZza = 0;
                i13 = 0;
            } else {
                i13 = this.zzd[iZza - 1];
            }
            int[] iArr = this.zzd;
            int i15 = iArr[iZza] - i13;
            int i16 = iArr[this.zzc.length + iZza];
            int iMin = Math.min(i14, i15 + i13) - i5;
            if (!zzbvv.zzc(this.zzc[iZza], (i5 - i13) + i16, other, i11, iMin)) {
                return false;
            }
            i11 += iMin;
            i5 += iMin;
            iZza++;
        }
        return true;
    }

    @Override // com.google.android.libraries.places.internal.zzbwf
    @NotNull
    public final byte[] zzo() {
        return zzp();
    }

    @Override // com.google.android.libraries.places.internal.zzbwf
    @NotNull
    public final byte[] zzp() {
        byte[] bArr = new byte[zzc()];
        int i5 = 0;
        int i11 = 0;
        int i12 = 0;
        while (true) {
            byte[][] bArr2 = this.zzc;
            int length = bArr2.length;
            if (i5 >= length) {
                return bArr;
            }
            int[] iArr = this.zzd;
            int i13 = iArr[length + i5];
            int i14 = iArr[i5];
            int i15 = i14 - i11;
            b.q(bArr2[i5], i12, bArr, i13, i13 + i15);
            i12 += i15;
            i5++;
            i11 = i14;
        }
    }

    @NotNull
    public final int[] zzq() {
        return this.zzd;
    }

    @NotNull
    public final byte[][] zzr() {
        return this.zzc;
    }
}
