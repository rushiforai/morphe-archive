package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.app.KeyguardManager;
import android.util.Log;
import android.view.Window;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.qx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2447qx {
    public static byte[] A00;
    public static String[] A01 = {"75", b.f42142b, "84T1cPcVhFaG3gZ5iFCuz5VGfvW435Ys", "hmgtvPST3LKdfFpjmmFZYvFoyIGtsiKE", "1o0hQSlG2MREJWQYXtVsar2Zo68mKpVL", "LjPyS32kIH6YipP2gsYrsbvo7R8K", "pRhgJcRZc8j2ATnbWVmWTgInp0JNCNsL", "EpPf5pm3Rz1UtI6LaI9QQC8GFK2ymH0S"};
    public static final String A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 115);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{75, 44, 126, 67, 88, 94, 75, 79, 82, 84, 85, 27, 82, 85, 27, 76, 82, 85, 95, 84, 76, 27, 82, 85, 93, 84, 27, 88, 83, 94, 88, 80, 28, 18, 14, 16, 2, 22, 5, 19, 119, 123, 110, 115, 104, 114, 106, 120, 10, 27, 25, 22, 26, 22, 7, 18, 22, 13, 90, 89};
    }

    static {
        A02();
        A02 = C2447qx.class.getSimpleName();
    }

    public static Map<String, String> A01(@Nullable C0958Hi c0958Hi) {
        Window window;
        HashMap map = new HashMap();
        if (c0958Hi == null) {
            return map;
        }
        try {
            map.put(A00(40, 3, 111), String.valueOf(A04(c0958Hi)));
            Activity activityA0E = c0958Hi.A0E();
            if (activityA0E != null && (window = activityA0E.getWindow()) != null) {
                int i5 = window.getAttributes().flags;
                int flags = window.getAttributes().type;
                map.put(A00(58, 2, 94), Integer.toString(flags));
                int type = 4194304 & i5;
                String strA00 = A00(1, 1, 110);
                String strA002 = A00(0, 1, 8);
                map.put(A00(48, 5, 14), type > 0 ? strA00 : strA002);
                if (A01[1].length() == 23) {
                    throw new RuntimeException();
                }
                A01[7] = "fwmMHJhcrVWyeAGw8Re8ymmckApbJBDL";
                int type2 = 524288 & i5;
                if (type2 <= 0) {
                    strA00 = strA002;
                }
                map.put(A00(53, 5, 18), strA00);
            }
        } catch (Exception e3) {
            Log.e(A02, A00(2, 30, 72), e3);
            InterfaceC2125le interfaceC2125leA08 = c0958Hi.A08();
            int type3 = AbstractC2126lf.A2T;
            interfaceC2125leA08.ABz(A00(43, 5, 114), type3, new C2127lg(e3));
        }
        return map;
    }

    public static boolean A03(C0958Hi c0958Hi) {
        return !C2427qd.A04(A01(c0958Hi));
    }

    public static boolean A04(C0958Hi c0958Hi) {
        KeyguardManager keyguardManager = (KeyguardManager) c0958Hi.getSystemService(A00(32, 8, 4));
        return keyguardManager != null && keyguardManager.inKeyguardRestrictedInputMode();
    }
}
