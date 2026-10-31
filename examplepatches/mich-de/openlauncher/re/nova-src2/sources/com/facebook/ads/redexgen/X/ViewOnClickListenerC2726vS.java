package com.facebook.ads.redexgen.X;

import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.vS, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnClickListenerC2726vS implements View.OnClickListener {
    public static byte[] A01;
    public static String[] A02 = {"zuBXHW69HMsgqPkvw822efdqIzipI38Z", "nYdvLYfpD29HQYL7zEpWwXf8IT7vu0fJ", "kbAJV2oEH8wTAGmdzesmligVJmWrG6rY", b.f42142b, "Lz0WQdNHmEkGKqDRaWMt4EzB5Z5VAIm7", "XnAXt8", "Cdgs2qwyfuiL45Fb99MleVqfyozS1BQu", "31C1ogJFA1t40Kq3YH41fL7WYJx5kQRd"};
    public final /* synthetic */ ViewOnClickListenerC0884El A00;

    public ViewOnClickListenerC2726vS(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        this.A00 = viewOnClickListenerC0884El;
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 8);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        String[] strArr = A02;
        if (strArr[6].charAt(31) == strArr[4].charAt(31)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A02;
        strArr2[0] = "aEQGJDm1Hrq1SSVJKIONBLtECkP34d8K";
        strArr2[2] = "jeRBFdLPHjNhicccNA79bad4rW6OoDm2";
        A01 = new byte[]{14, 5, 15, 8, 10, 25, 15, 24};
    }

    static {
        A01();
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            ViewOnClickListenerC0884El viewOnClickListenerC0884El = this.A00;
            if (viewOnClickListenerC0884El != null) {
                viewOnClickListenerC0884El.A0E(A00(0, 8, 99));
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
