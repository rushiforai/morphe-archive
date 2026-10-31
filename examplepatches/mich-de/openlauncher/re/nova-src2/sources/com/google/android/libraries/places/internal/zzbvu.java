package com.google.android.libraries.places.internal;

import kotlin.jvm.JvmName;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@JvmName
/* loaded from: classes3.dex */
public final class zzbvu {

    @NotNull
    private static final byte[] zza;

    @NotNull
    private static final byte[] zzb;

    static {
        zzbwe zzbweVar = zzbwf.zza;
        zza = zzbwe.zza("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/").zzn();
        zzb = zzbwe.zza("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_").zzn();
    }

    public static /* synthetic */ String zza(byte[] bArr, byte[] bArr2, int i5, Object obj) {
        byte[] map = zza;
        Intrinsics.g(bArr, "<this>");
        Intrinsics.g(map, "map");
        int length = bArr.length;
        int i11 = length + 2;
        int i12 = length - (length % 3);
        byte[] bArr3 = new byte[(i11 / 3) * 4];
        int i13 = 0;
        int i14 = 0;
        while (i13 < i12) {
            int i15 = i14 + 3;
            byte b11 = bArr[i13];
            int i16 = i13 + 2;
            byte b12 = bArr[i13 + 1];
            i13 += 3;
            byte b13 = bArr[i16];
            bArr3[i14] = map[(b11 & 255) >> 2];
            bArr3[i14 + 1] = map[((b11 & 3) << 4) | ((b12 & 255) >> 4)];
            bArr3[i14 + 2] = map[((b12 & 15) << 2) | ((b13 & 255) >> 6)];
            i14 += 4;
            bArr3[i15] = map[b13 & 63];
        }
        int length2 = bArr.length - i12;
        if (length2 == 1) {
            byte b14 = bArr[i13];
            bArr3[i14] = map[(b14 & 255) >> 2];
            bArr3[i14 + 1] = map[(b14 & 3) << 4];
            bArr3[i14 + 2] = 61;
            bArr3[i14 + 3] = 61;
        } else if (length2 == 2) {
            int i17 = i13 + 1;
            byte b15 = bArr[i13];
            byte b16 = bArr[i17];
            bArr3[i14] = map[(b15 & 255) >> 2];
            bArr3[i14 + 1] = map[((b15 & 3) << 4) | ((b16 & 255) >> 4)];
            bArr3[i14 + 2] = map[(b16 & 15) << 2];
            bArr3[i14 + 3] = 61;
        }
        return zzbww.zza(bArr3);
    }
}
