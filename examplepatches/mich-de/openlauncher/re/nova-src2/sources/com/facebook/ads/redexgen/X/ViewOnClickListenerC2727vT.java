package com.facebook.ads.redexgen.X;

import android.view.View;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.vT, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnClickListenerC2727vT implements View.OnClickListener {
    public static byte[] A01;
    public static String[] A02 = {"lSBGV0KRRhhAHXO14Oeq", "virn7YiJ4qXUk6h2", "ZOOvTCYye1apYHGJTFPWFikvbRhfJSsY", "6hfctE0Zag31mxK5QRFpKawC3Tekf9Ca", "4tfRzWxWKIoAR6uYoUH9MSnQowcBDMob", "dKeDKE49emqnQ4LZs9melb0IV1QUNAj1", "cgplaZIOQiw4kluWRwCiVfcRbm0R4Od9", "7wipdldvlkBPaBSKhQUCW8O"};
    public final /* synthetic */ ViewOnClickListenerC0884El A00;

    public ViewOnClickListenerC2727vT(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        this.A00 = viewOnClickListenerC0884El;
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 75);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{46, 55, 45, 44, 42, 59, 45, 60};
        if (A02[0].length() != 20) {
            throw new RuntimeException();
        }
        String[] strArr = A02;
        strArr[2] = "hHwoQQ94wJmAW3wuKGHjx3iA97JNTkpe";
        strArr[6] = "xzfwidmi03lBfkCNziR0tI48XZANGoKS";
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
                viewOnClickListenerC0884El.A0E(A00(0, 8, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
