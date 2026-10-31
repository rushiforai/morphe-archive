package com.google.android.libraries.places.internal;

import a80.m;
import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Locale;

/* loaded from: classes3.dex */
final class zzbty {
    private static final String[] zza = {"DATA", "HEADERS", "PRIORITY", "RST_STREAM", "SETTINGS", "PUSH_PROMISE", "PING", "GOAWAY", "WINDOW_UPDATE", "CONTINUATION"};
    private static final String[] zzb = new String[64];
    private static final String[] zzc = new String[256];

    static {
        for (int i5 = 0; i5 < 256; i5++) {
            zzc[i5] = String.format("%8s", Integer.toBinaryString(i5)).replace(' ', '0');
        }
        String[] strArr = zzb;
        strArr[0] = b.f42142b;
        strArr[1] = "END_STREAM";
        int[] iArr = {1};
        strArr[8] = "PADDED";
        for (int i11 = 0; i11 <= 0; i11++) {
            int i12 = iArr[i11];
            String[] strArr2 = zzb;
            strArr2[i12 | 8] = String.valueOf(strArr2[i12]).concat("|PADDED");
        }
        String[] strArr3 = zzb;
        strArr3[4] = "END_HEADERS";
        strArr3[32] = "PRIORITY";
        strArr3[36] = "END_HEADERS|PRIORITY";
        int[] iArr2 = {4, 32, 36};
        for (int i13 = 0; i13 < 3; i13++) {
            int i14 = iArr2[i13];
            for (int i15 = 0; i15 <= 0; i15++) {
                int i16 = iArr[i15];
                int i17 = i16 | i14;
                String[] strArr4 = zzb;
                strArr4[i17] = u4.m(strArr4[i16], "|", strArr4[i14]);
                strArr4[i17 | 8] = m.h(strArr4[i16], "|", strArr4[i14], "|PADDED");
            }
        }
        for (int i18 = 0; i18 < 64; i18++) {
            String[] strArr5 = zzb;
            if (strArr5[i18] == null) {
                strArr5[i18] = zzc[i18];
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0068  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String zza(boolean z11, int i5, int i11, byte b11, byte b12) {
        String strReplace;
        String str = b11 < 10 ? zza[b11] : String.format("0x%02x", Byte.valueOf(b11));
        if (b12 == 0) {
            strReplace = b.f42142b;
        } else if (b11 == 2 || b11 == 3) {
            strReplace = zzc[b12];
        } else if (b11 == 4 || b11 == 6) {
            strReplace = b12 == 1 ? "ACK" : zzc[b12];
        } else if (b11 != 7 && b11 != 8) {
            String str2 = b12 < 64 ? zzb[b12] : zzc[b12];
            if (b11 == 5) {
                strReplace = (b12 & 4) != 0 ? str2.replace("HEADERS", "PUSH_PROMISE") : str2;
            } else if (b11 == 0 && (b12 & 32) != 0) {
                strReplace = str2.replace("PRIORITY", "COMPRESSED");
            }
        }
        return String.format(Locale.US, "%s 0x%08x %5d %-13s %s", true != z11 ? ">>" : "<<", Integer.valueOf(i5), Integer.valueOf(i11), str, strReplace);
    }
}
