package com.facebook.ads.redexgen.X;

import android.view.MotionEvent;
import android.view.View;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.v5, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnTouchListenerC2703v5 implements View.OnTouchListener {
    public static byte[] A01;
    public static String[] A02 = {"IWk7s29a8CW3vlleHCDfAgE1s7GaPrN3", "GotOGy6JfY2C1poOz", "x44JkRqxpQdN5pJ4eQtPel4KzpxiNC69", "v", "k9cdUP", "QJZej3OaVhi0ilgrZ4I0rwFZFutNGTLV", "rZG0Brknx8nKyFnDp5S4OHtWYrbyN", "xZOvT4LNrEJqThSUBKywP"};
    public final /* synthetic */ ET A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 74);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{69, 67, 85, 66, 111, 83, 92, 89, 83, 91, 111, 89, 81, 82, 41, 47, 57, 46, 3, 55, 57, 37, 44, 61, 56, 3, 63, 48, 53, 63, 55, 3, 53, 61, 62};
    }

    static {
        A01();
    }

    public ViewOnTouchListenerC2703v5(ET et2) {
        this.A00 = et2;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        switch (motionEvent.getActionMasked()) {
            case 0:
                if (!this.A00.A0Q && this.A00.A0A != null && this.A00.A0A.isAcceptingText()) {
                    this.A00.A0Q = true;
                    this.A00.A0h(A00(14, 21, 22));
                    break;
                }
                break;
            case 1:
                ET.A05(this.A00);
                if (!this.A00.A0P && this.A00.A07 >= 5) {
                    this.A00.A0P = true;
                    this.A00.A0h(A00(0, 14, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE));
                    break;
                }
                break;
        }
        String[] strArr = A02;
        if (strArr[5].charAt(7) != strArr[0].charAt(7)) {
            throw new RuntimeException();
        }
        A02[7] = "cX8Lo";
        return false;
    }
}
