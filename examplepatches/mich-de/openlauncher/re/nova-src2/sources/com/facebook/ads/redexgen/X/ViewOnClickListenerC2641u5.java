package com.facebook.ads.redexgen.X;

import android.view.View;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.u5, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2641u5 implements View.OnClickListener {
    public static byte[] A01;
    public static String[] A02 = {"RYA2HQ6anw2o8PvCxADvTN", "IKjtsRdpuS1IfN9T1jv6dJ9uALg3SUNY", "TAC7iR6gfH4fQH4FUC8pRA1olETjYiFn", "JhgS4Y3uyLbUg3hkwI2AfFWsUfxEZ", "Zu8yEv2UKOq8m0zwWzi4DlBhW069tU2f", "k9l6PSLGLPB9HmxqsEJAgQ7UTkqQ4w0X", "g278jeKkaA", "ZfAAWfzLTzVJ8at6OmwoEYoq"};
    public final /* synthetic */ C2642u6 A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 76);
            String[] strArr = A02;
            if (strArr[7].length() == strArr[6].length()) {
                throw new RuntimeException();
            }
            A02[3] = "GSyRW8ctKQsKD3e1InPNLPVM5uW86";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{91, 75, 86, 78, 74, 92, 75, 102, 73, 92, 92, 82};
    }

    static {
        A01();
    }

    public ViewOnClickListenerC2641u5(C2642u6 c2642u6) {
        this.A00 = c2642u6;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0D.A0E(A00(0, 12, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
            this.A00.A0B();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
