package com.facebook.ads.redexgen.X;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Message;
import com.facebook.ads.internal.util.common.FbValidationUtils;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.gG, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1799gG {
    public static byte[] A00;
    public static String[] A01 = {"zsdAZh7iePrJV9xbPQOozgkwwcFaPnsd", "spwQNxGZecpZYnzhTOenf8qSCYVERjHa", "vRaPAS5ITjByKupsQp", "YH9oby8h5cjOXQgJZVFXdnGffnMmkFV", "Q3tNAMONEcy8t0lFeY94KcrOxIBYnGFQ", "0wdxeE89ToAVBIwU0wnnWcKH8K5SgcRK", "Enk3e4aOdQUnECCa6gTtS9QadDpJPD1Y", "9wYGdkn9LL853VhpD7bhQhTyw1nqw"};
    public static final String A02;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 18);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{102, -125, -125, -125, 115, 115, 115, 115, 115, 115, 115, 115, 115, -91, -91, -91, -91, -91, -91, -91, -91, -75, -75, -75, -104, -70, -31, -26, -36, -31, -26, -33, -104, -20, -25, -104, -21, -35, -22, -18, -31, -37, -35, -104, -21, -19, -37, -37, -35, -21, -21, -104, -75, -104, -104, 118, -119, -126, 120, -128, 121, -109, 121, -116, -120, -122, 117, -121, -109, AbstractJsonLexerKt.TC_INVALID, 121, -115, 116, 117, 115, -128, 116, 102, 115, 119, 106, 100, 102, -128, 102, 121, 117, 115, 98, 116, -105, -104, -106, -93, -105, -119, -106, -102, -115, -121, -119, -93, -105, -120, -113, -93, -102, -119, -106, -105, -115, -109, -110, 122, -122, -124, 69, 125, 120, 122, 124, 121, -122, -122, -126, 69, 120, 123, -118, 69, -128, -123, -117, 124, -119, -123, 120, -125, 69, -128, -121, 122, 69, 88, -116, 123, -128, 124, -123, 122, 124, 101, 124, -117, -114, -122, -119, -126, 105, 124, -124, -122, -117, 124, 106, 124, -119, -115, -128, 122, 124, -56, -44, -46, -109, -53, -58, -56, -54, -57, -44, -44, -48, -109, -48, -58, -39, -58, -45, -58};
    }

    static {
        A03();
        A02 = C1799gG.class.getSimpleName();
    }

    public static int A00(Context context, String str) {
        PackageManager packageManager;
        if (!A02(171, 19, 83).equals(str) || (packageManager = context.getPackageManager()) == null) {
            return 1;
        }
        try {
            return FbValidationUtils.isFbSigningCertificateValid(FbValidationUtils.getSigningCertificate(packageManager.getPackageInfo(str, 64))) ? 0 : 1;
        } catch (PackageManager.NameNotFoundException unused) {
            return 2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x002c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static C1797gE A01(C0957Hh c0957Hh, boolean z11, ServiceConnection serviceConnection) {
        boolean z12;
        int iA00;
        boolean z13 = true;
        z13 = true;
        if (c0957Hh.A05().AB6()) {
            if (!z11) {
                boolean zA1d = C2203mv.A1d(c0957Hh);
                String[] strArr = A01;
                if (strArr[4].charAt(9) != strArr[1].charAt(9)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A01;
                strArr2[0] = "5OK6o4O4MTv3VkFwkxYGLGF9NR06v1v9";
                strArr2[6] = "jjIgSfcMXOeUI3MeAziVTFLVCBhUnO3r";
                if (zA1d) {
                }
            }
            z12 = true;
        } else {
            z12 = false;
        }
        if (z12) {
            iA00 = 0;
        } else {
            iA00 = A00(c0957Hh, AbstractC2206my.A07(z11));
        }
        if (iA00 != 0) {
            return new C1797gE(iA00 == 2 ? 3 : 1, false);
        }
        Intent intent = new Intent();
        if (!z11 && (!c0957Hh.A05().AB6() || !C2203mv.A1d(c0957Hh))) {
            z13 = false;
        }
        Intent component = intent.setComponent(new ComponentName(AbstractC2206my.A07(z13), A02(113, 58, 5)));
        int i5 = 1;
        boolean zA0O = AbstractC2206my.A0O(c0957Hh);
        if (zA0O) {
            i5 = 1 | 64;
        }
        boolean zBindService = c0957Hh.bindService(component, serviceConnection, i5);
        if (c0957Hh.A05().AB6()) {
            String str = A02(13, 42, 102) + zBindService + A02(0, 13, 52);
        }
        return new C1797gE(zBindService ? 0 : 2, zA0O);
    }

    public static void A04(C0957Hh c0957Hh, Message message) {
        Bundle bundle = message.getData().getBundle(A02(55, 17, 34));
        if (bundle != null) {
            AbstractC2153m7.A06(c0957Hh, bundle.getString(A02(90, 23, 50)), bundle.getString(A02(72, 18, 15)));
        }
    }
}
