package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import android.text.TextUtils;
import com.facebook.ads.AdSDKNotificationListener;
import com.facebook.ads.AdSDKNotificationManager;
import com.facebook.ads.internal.adnotification.InternalAppAdCTAClickNotificationListener;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

/* renamed from: com.facebook.ads.redexgen.X.gU, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1813gU {
    public static String A00;
    public static String A01;
    public static byte[] A02;
    public static String[] A03 = {"78TvrWrHITRtieA2aTZi7qGWep2YDkX8", "pzh2FSdk8lA8IEfeF2CHaKG74jiQkzm6", "e1UmnQ13KNVU9kfLy1zUG0R5Wg3D3Vxv", "iqdWqB4cDAgyJmdUjGJBf18VS20IF0", "aCJrJXaMgQYbFpNxZNo5rt2Yg7XwlbIh", "HWzkgsMlanMydXPZ0BVCAZ4YRg9FuHQF", "Y4r64RXWGr9DYp3ACfceM4olVAvOCspF", "euzuGPHfToMxjJDxa7gG9F0GQ9FWJDUb"};
    public static final AtomicReference<InternalAppAdCTAClickNotificationListener> A04;
    public static final AtomicReference<InterfaceC1815gW> A05;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A03;
            if (strArr[1].length() != strArr[6].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[4] = "cBhVIjV6UO6jarVxZum0dLoV7Q4gGeII";
            strArr2[7] = "BtlpZj9vLPPbA7qxxK1kj3SzeQP234qy";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 36);
            i13++;
        }
    }

    public static void A01() {
        byte[] bArr = {-77, -72, -62, -65, -69, -80, -56, -82, -75, -66, -63, -68, -80, -61, -76, -77, -122, -75, -75, -122, -87, -120, -103, -122, -120, -79, -82, -88, -80, -63, -64, -101, -65, -62, -60, -73, -59, -59, -69, -63, -64, -30, -45, -38, -50, -27, -44, -31, -30, -40, -34, -35};
        String[] strArr = A03;
        if (strArr[4].charAt(15) != strArr[7].charAt(15)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A03;
        strArr2[2] = "6qg4xfXwekwDj2CeiXKYE384ubxLDeDe";
        strArr2[0] = "5Jma2yQ39jKE8PrbkQun1IAmWMo3kxRK";
        A02 = bArr;
    }

    static {
        A01();
        A01 = A00(41, 11, 75);
        A00 = A00(0, 14, 43);
        A05 = new AtomicReference<>();
        A04 = new AtomicReference<>();
    }

    public static void A02(String str, Bundle bundle) {
        ArrayList arrayList;
        A05.get();
        if (0 != 0) {
            bundle.getString(A01);
            bundle.getString(A00);
            throw new NullPointerException(A00(29, 12, 46));
        }
        if (TextUtils.isEmpty(str)) {
            return;
        }
        List<AdSDKNotificationListener> listeners = AdSDKNotificationManager.getNotificationListeners();
        synchronized (listeners) {
            arrayList = new ArrayList(AdSDKNotificationManager.getNotificationListeners());
        }
        ExecutorC2419qV.A00(new RunnableC1812gT(arrayList, str));
    }

    public static void A03(String str, String str2, String str3) {
        if (A04 != null && A04.get() != null) {
            A04.get();
            throw new NullPointerException(A00(14, 15, 33));
        }
    }
}
