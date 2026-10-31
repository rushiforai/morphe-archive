package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import android.os.IBinder;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Ls, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1067Ls {
    public static Method A00;
    public static byte[] A01;
    public static String[] A02 = {"Ew43nY4XtVoC5zlDtkt2ZWcN1dsEGxa", "fn2q5rJwxjNsJISI", "4R0AbhH5RA3TlqK9gDIiy", "VfnXVFOu7PusRmCJEAqAZxiewZgMCJeR", "4q53lVY6OzLtolmL0oLZ86FUrdMd1", "DSFwamS7NgBawa1FfsKE3t3M6ZVZ6", "hwUNrRKyYm9d1FcTsZtGT6Jy3Iu78Lug", "C875yeeqymeyePPFGyiScmxWvDpzbWmg"};

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE;
            String[] strArr = A02;
            if (strArr[2].length() == strArr[0].length()) {
                throw new RuntimeException();
            }
            A02[1] = "nYOMXcFf94ybqm7";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A01 = new byte[]{118, 65, 90, 80, 88, 81, 97, 64, 93, 88, 109, 74, 66, 71, 78, 79, 11, 95, 68, 11, 66, 69, 93, 68, 64, 78, 11, 76, 78, 95, 98, 105, 66, 69, 79, 78, 89, 11, 93, 66, 74, 11, 89, 78, 77, 71, 78, 72, 95, 66, 68, 69, 71, 96, 104, 109, 100, 101, 33, 117, 110, 33, 115, 100, 117, 115, 104, 100, 119, 100, 33, 102, 100, 117, 72, 67, 104, 111, 101, 100, 115, 33, 108, 100, 117, 105, 110, 101, 26, 24, 9, 52, 63, 20, 19, 25, 24, 15};
    }

    static {
        A03();
    }

    public static IBinder A00(Bundle bundle, String str) {
        if (N1.A02 >= 18) {
            return bundle.getBinder(str);
        }
        return A01(bundle, str);
    }

    public static IBinder A01(Bundle bundle, String str) throws NoSuchMethodException, SecurityException {
        Method method = A00;
        String strA02 = A02(0, 10, 72);
        if (method == null) {
            try {
                Method getIBinder = Bundle.class.getMethod(A02(88, 10, 1), String.class);
                A00 = getIBinder;
                Method getIBinder2 = A00;
                getIBinder2.setAccessible(true);
                method = A00;
            } catch (NoSuchMethodException e3) {
                MV.A09(strA02, A02(52, 36, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE), e3);
                return null;
            }
        }
        try {
            return (IBinder) method.invoke(bundle, str);
        } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e11) {
            MV.A09(strA02, A02(10, 42, 87), e11);
            return null;
        }
    }
}
