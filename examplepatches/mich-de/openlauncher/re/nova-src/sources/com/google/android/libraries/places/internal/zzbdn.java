package com.google.android.libraries.places.internal;

import java.nio.ByteBuffer;
import java.util.Arrays;

/* loaded from: classes3.dex */
final class zzbdn implements zzbce {
    private static final byte[] zza = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70};

    private zzbdn() {
        throw null;
    }

    private static boolean zzc(byte b11) {
        return b11 < 32 || b11 >= 126 || b11 == 37;
    }

    @Override // com.google.android.libraries.places.internal.zzbce
    public final /* bridge */ /* synthetic */ Object zza(byte[] bArr) {
        int length;
        int i5 = 0;
        while (true) {
            length = bArr.length;
            if (i5 >= length) {
                return new String(bArr, 0);
            }
            byte b11 = bArr[i5];
            if (b11 < 32 || b11 >= 126 || (b11 == 37 && i5 + 2 < length)) {
                break;
            }
            i5++;
        }
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(length);
        int i11 = 0;
        while (true) {
            int length2 = bArr.length;
            if (i11 >= length2) {
                return new String(byteBufferAllocate.array(), 0, byteBufferAllocate.position(), zzmb.zzc);
            }
            int i12 = i11 + 1;
            if (bArr[i11] == 37 && i11 + 2 < length2) {
                try {
                    byteBufferAllocate.put((byte) Integer.parseInt(new String(bArr, i12, 2, zzmb.zza), 16));
                    i11 += 3;
                } catch (NumberFormatException unused) {
                }
            }
            byteBufferAllocate.put(bArr[i11]);
            i11 = i12;
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbce
    public final /* bridge */ /* synthetic */ byte[] zzb(Object obj) {
        byte[] bytes = ((String) obj).getBytes(zzmb.zzc);
        int i5 = 0;
        while (true) {
            int length = bytes.length;
            if (i5 >= length) {
                return bytes;
            }
            if (zzc(bytes[i5])) {
                byte[] bArr = new byte[((length - i5) * 3) + i5];
                if (i5 != 0) {
                    System.arraycopy(bytes, 0, bArr, 0, i5);
                }
                int i11 = i5;
                while (i5 < bytes.length) {
                    int i12 = i11 + 1;
                    byte b11 = bytes[i5];
                    if (zzc(b11)) {
                        bArr[i11] = 37;
                        byte[] bArr2 = zza;
                        bArr[i12] = bArr2[(b11 >> 4) & 15];
                        bArr[i11 + 2] = bArr2[b11 & 15];
                        i11 += 3;
                    } else {
                        bArr[i11] = b11;
                        i11 = i12;
                    }
                    i5++;
                }
                return Arrays.copyOf(bArr, i11);
            }
            i5++;
        }
    }

    public /* synthetic */ zzbdn(zzbdm zzbdmVar) {
    }
}
