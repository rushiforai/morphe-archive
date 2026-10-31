package com.google.android.libraries.places.internal;

import b.c0;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class zzbqu {
    private static final Logger zza = Logger.getLogger(zzbqu.class.getName());
    private static final byte[] zzb = "-bin".getBytes(zzmb.zza);

    private zzbqu() {
    }

    public static byte[][] zza(zzbcf zzbcfVar) {
        int length;
        int i5;
        byte[][] bArrZzd = zzbar.zzd(zzbcfVar);
        int i11 = 0;
        int i12 = 0;
        while (true) {
            length = bArrZzd.length;
            if (i11 >= length) {
                break;
            }
            byte[] bArr = bArrZzd[i11];
            byte[] bArr2 = bArrZzd[i11 + 1];
            if (zzc(bArr, zzb)) {
                i5 = i12 + 2;
                bArrZzd[i12] = bArr;
                bArrZzd[i12 + 1] = zzbar.zzb.zzk(bArr2, 0, bArr2.length).getBytes(zzmb.zza);
            } else {
                for (byte b11 : bArr2) {
                    if (b11 < 32 || b11 > 126) {
                        zza.logp(Level.WARNING, "io.grpc.internal.TransportFrameUtil", "toHttp2Headers", c0.n("Metadata key=", new String(bArr, zzmb.zza), ", value=", Arrays.toString(bArr2), " contains invalid ASCII characters"));
                        break;
                    }
                }
                i5 = i12 + 2;
                bArrZzd[i12] = bArr;
                bArrZzd[i12 + 1] = bArr2;
            }
            i12 = i5;
            i11 += 2;
        }
        return i12 == length ? bArrZzd : (byte[][]) Arrays.copyOfRange(bArrZzd, 0, i12);
    }

    public static byte[][] zzb(byte[][] bArr) {
        int i5 = 0;
        while (i5 < bArr.length) {
            byte[] bArr2 = bArr[i5];
            int i11 = i5 + 1;
            byte[] bArr3 = bArr[i11];
            if (zzc(bArr2, zzb)) {
                for (byte b11 : bArr3) {
                    if (b11 == 44) {
                        ArrayList arrayList = new ArrayList(bArr.length + 10);
                        for (int i12 = 0; i12 < i5; i12++) {
                            arrayList.add(bArr[i12]);
                        }
                        while (i5 < bArr.length) {
                            byte[] bArr4 = bArr[i5];
                            byte[] bArr5 = bArr[i5 + 1];
                            if (zzc(bArr4, zzb)) {
                                int i13 = 0;
                                int i14 = 0;
                                while (true) {
                                    int length = bArr5.length;
                                    if (i13 <= length) {
                                        if (i13 == length || bArr5[i13] == 44) {
                                            byte[] bArrZzl = zzsi.zzj().zzl(new String(bArr5, i14, i13 - i14, zzmb.zza));
                                            arrayList.add(bArr4);
                                            arrayList.add(bArrZzl);
                                            i14 = i13 + 1;
                                        }
                                        i13++;
                                    }
                                }
                            } else {
                                arrayList.add(bArr4);
                                arrayList.add(bArr5);
                            }
                            i5 += 2;
                        }
                        return (byte[][]) arrayList.toArray(new byte[0][]);
                    }
                }
                bArr[i11] = zzsi.zzj().zzl(new String(bArr3, zzmb.zza));
            }
            i5 += 2;
        }
        return bArr;
    }

    private static boolean zzc(byte[] bArr, byte[] bArr2) {
        int length = bArr.length - bArr2.length;
        if (length < 0) {
            return false;
        }
        for (int i5 = length; i5 < bArr.length; i5++) {
            if (bArr[i5] != bArr2[i5 - length]) {
                return false;
            }
        }
        return true;
    }
}
