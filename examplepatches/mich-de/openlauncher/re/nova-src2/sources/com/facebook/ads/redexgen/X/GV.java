package com.facebook.ads.redexgen.X;

import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public class GV implements View.OnClickListener, View.OnLongClickListener, View.OnTouchListener, InterfaceC2091l6 {
    public static byte[] A02;
    public final C0958Hi A00;
    public final /* synthetic */ GT A01;

    static {
        A02();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 59);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A02 = new byte[]{43, 14, 74, 9, 11, 4, 4, 5, 30, 74, 8, 15, 74, 9, 6, 3, 9, 1, 15, 14, 74, 8, 15, 12, 5, 24, 15, 74, 3, 30, 74, 3, 25, 74, 28, 3, 15, 29, 15, 14, 68, 66, 109, 104, 98, 106, 114, 33, 105, 96, 113, 113, 100, 111, 100, 101, 33, 117, 110, 110, 33, 103, 96, 114, 117, 47, 20, 16, 19, 39, 54, 59, 55, 60, 49, 55, 28, 55, 38, 37, 61, 32, 57, 56, 25, 86, 2, 25, 3, 21, 30, 86, 18, 23, 2, 23, 86, 4, 19, 21, 25, 4, 18, 19, 18, 90, 86, 6, 26, 19, 23, 5, 19, 86, 19, 24, 5, 3, 4, 19, 86, 2, 25, 3, 21, 30, 86, 19, 0, 19, 24, 2, 5, 86, 4, 19, 23, 21, 30, 86, 2, 30, 19, 86, 23, 18, 86, 32, 31, 19, 1, 86, 20, 15, 86, 4, 19, 2, 3, 4, 24, 31, 24, 17, 86, 16, 23, 26, 5, 19, 86, 31, 16, 86, 15, 25, 3, 86, 31, 24, 2, 19, 4, 21, 19, 6, 2, 86, 2, 30, 19, 86, 19, 0, 19, 24, 2, 88, 33, 39, 60, 94, 68, 89};
    }

    public GV(GT gt2, C0958Hi c0958Hi) {
        this.A01 = gt2;
        this.A00 = c0958Hi;
    }

    public /* synthetic */ GV(GT gt2, C0958Hi c0958Hi, C0928Ge c0928Ge) {
        this(gt2, c0958Hi);
    }

    private Map<String, String> A01() {
        Map<String, String> mapA07 = new C2618ti().A05(this.A01.A0V).A04(this.A01.A0k).A07();
        if (this.A01.A0L != null) {
            mapA07.put(A00(201, 3, 11), String.valueOf(this.A01.A0L.A05()));
        }
        if (this.A01.A0b) {
            mapA07.put(A00(198, 3, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), String.valueOf(this.A01.A0b));
        }
        return mapA07;
    }

    private void A03(Map<String, String> extraData) {
        if (this.A01.A0f != null) {
            this.A01.A0f.A0M(extraData);
        }
    }

    public final void A04() {
        if (this.A01.A09 != null) {
            ((IB) this.A01.A09.getNativeAdLayoutApi()).A04(new C2518s6(this.A01.A0h));
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2091l6
    public final C0958Hi A7M() {
        return this.A00;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            boolean zA08 = this.A01.A0k.A08();
            String strA00 = A00(66, 17, 105);
            if (!zA08) {
                Log.e(strA00, A00(83, 115, 77));
            }
            int minimumElapsedTime = C2203mv.A0I(this.A01.A0h);
            if (minimumElapsedTime < 0 || this.A01.A0k.A03() >= minimumElapsedTime) {
                if (this.A01.A0k.A09(this.A01.A0h)) {
                    if (this.A01.A0f != null) {
                        this.A01.A0f.A0N(A01());
                        return;
                    }
                    return;
                }
                A03(A01());
                return;
            }
            if (!this.A01.A0k.A07()) {
                Log.e(strA00, A00(0, 41, 81));
            } else {
                Log.e(strA00, A00(41, 25, 58));
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }

    @Override // android.view.View.OnLongClickListener
    public final boolean onLongClick(View view) {
        if (this.A01.A04 == null || this.A01.A0P == null) {
            return false;
        }
        this.A01.A0P.setBounds(0, 0, this.A01.A04.getWidth(), this.A01.A04.getHeight());
        this.A01.A0P.A0D(!this.A01.A0P.A0E());
        return true;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        this.A01.A0k.A06(this.A01.A0h, motionEvent, this.A01.A04, view);
        return this.A01.A02 != null && this.A01.A02.onTouch(view, motionEvent);
    }
}
