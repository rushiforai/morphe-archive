package com.facebook.ads.redexgen.X;

import android.app.KeyguardManager;
import android.content.Context;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Map;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.qd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2427qd {
    public static byte[] A00;
    public static String[] A01 = {"daXn", "1AEGGiZtK9izNwxj0gdNwiRX4yxGSLbl", "jWJWqJI6vm3EcSkucHo8Z2hc4QqQU5eN", "kJ80Vw1lOC47iRluFhEDeBzKcKjW1m8D", "UFa447OZZwRnjgAwYt6DClQrKKYck", "JtTOAq931RuxhQ9Tu1gEBrllAq", "KlezWCwDulS1StSn2NonTUsqgHFd0zlY", "hQC1wn7yR06U4qX9nCxzTugCr"};
    public static final String A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 14);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-67, -13, -19, 1, -17, -3, -23, -6, -20, -100, -104, -93, -94, -96, -93, -109, -91, -108, -110, -103, -107, -84, -101, -88, -84, -95};
    }

    static {
        A01();
        A02 = C2427qd.class.getSimpleName();
    }

    public static boolean A02(Context context) {
        KeyguardManager keyguardManager = (KeyguardManager) context.getSystemService(A00(1, 8, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE));
        return keyguardManager != null && keyguardManager.inKeyguardRestrictedInputMode();
    }

    public static boolean A03(@Nullable Map<String, String> map) {
        if (map == null || map.isEmpty()) {
            return false;
        }
        String str = map.get(A00(16, 5, 32));
        String str2 = map.get(A00(21, 5, 39));
        String keyguardRestrictedInputMode = map.get(A00(9, 3, 35));
        if (str != null) {
            String[] strArr = A01;
            if (strArr[0].length() == strArr[4].length()) {
                throw new RuntimeException();
            }
            A01[7] = "KnKdjir99deazR25n";
            String flagDismissKeyguard = A00(0, 1, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
            if (str.equals(flagDismissKeyguard) && str2 != null && str2.equals(flagDismissKeyguard) && keyguardRestrictedInputMode != null && keyguardRestrictedInputMode.equals(A00(12, 4, 32))) {
                return true;
            }
        }
        return false;
    }

    public static boolean A04(@Nullable Map<String, String> map) {
        String keyguardRestrictedInputMode;
        if (map == null || map.isEmpty()) {
            return false;
        }
        String str = map.get(A00(16, 5, 32));
        String str2 = map.get(A00(21, 5, 39));
        String flagDismissKeyguard = A00(0, 1, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
        return (str == null || !str.equals(flagDismissKeyguard)) && (str2 == null || !str2.equals(flagDismissKeyguard)) && (keyguardRestrictedInputMode = map.get(A00(9, 3, 35))) != null && keyguardRestrictedInputMode.equals(A00(12, 4, 32));
    }
}
