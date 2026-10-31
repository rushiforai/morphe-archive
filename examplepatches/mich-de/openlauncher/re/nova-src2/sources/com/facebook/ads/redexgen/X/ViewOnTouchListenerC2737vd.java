package com.facebook.ads.redexgen.X;

import android.view.MotionEvent;
import android.view.View;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.vd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnTouchListenerC2737vd implements View.OnTouchListener {
    public static byte[] A01;
    public final /* synthetic */ EE A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 29);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{83, 85, 67, 84, 121, 69, 74, 79, 69, 77, 121, 79, 71, 68, 26, 28, 10, 29, 48, 4, 10, 22, 31, 14, 11, 48, 12, 3, 6, 12, 4, 48, 6, 14, 13};
    }

    public ViewOnTouchListenerC2737vd(EE ee2) {
        this.A00 = ee2;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        switch (motionEvent.getActionMasked()) {
            case 0:
                if (!this.A00.A0P && this.A00.A0i != null && this.A00.A0i.isAcceptingText()) {
                    this.A00.A0P = true;
                    this.A00.A0w(A00(14, 21, 114));
                    break;
                }
                break;
            case 1:
                EE.A04(this.A00);
                if (!this.A00.A0O && this.A00.A03 >= 5) {
                    this.A00.A0O = true;
                    this.A00.A0w(A00(0, 14, 59));
                    break;
                }
                break;
        }
        return false;
    }
}
