package com.google.android.libraries.places.internal;

import b.c0;
import kotlin.jvm.JvmName;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import r70.j;

@JvmName
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class zzbvv {

    @NotNull
    private static final zzbwa zza = new zzbwa();

    @NotNull
    public static final String zza(int i5) {
        int i11 = 0;
        char[] cArr = {zzbwy.zza()[i5 >> 28], zzbwy.zza()[(i5 >> 24) & 15], zzbwy.zza()[(i5 >> 20) & 15], zzbwy.zza()[(i5 >> 16) & 15], zzbwy.zza()[(i5 >> 12) & 15], zzbwy.zza()[(i5 >> 8) & 15], zzbwy.zza()[(i5 >> 4) & 15], zzbwy.zza()[i5 & 15]};
        while (i11 < 8 && cArr[i11] == '0') {
            i11++;
        }
        return j.w0(cArr, i11, 8);
    }

    public static final void zzb(long j11, long j12, long j13) {
        if ((j12 | j13) < 0 || j12 > j11 || j11 - j12 < j13) {
            StringBuilder sbU = c0.u(j11, "size=", " offset=");
            sbU.append(j12);
            sbU.append(" byteCount=");
            sbU.append(j13);
            throw new ArrayIndexOutOfBoundsException(sbU.toString());
        }
    }

    public static final boolean zzc(@NotNull byte[] a11, int i5, @NotNull byte[] b11, int i11, int i12) {
        Intrinsics.g(a11, "a");
        Intrinsics.g(b11, "b");
        for (int i13 = 0; i13 < i12; i13++) {
            if (a11[i13 + i5] != b11[i13 + i11]) {
                return false;
            }
        }
        return true;
    }
}
