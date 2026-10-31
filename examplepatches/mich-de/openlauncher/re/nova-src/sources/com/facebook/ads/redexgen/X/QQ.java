package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.view.WindowManager;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class QQ implements InterfaceC1356Xr {
    public static byte[] A01;
    public final WindowManager A00;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 60);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A01 = new byte[]{11, -3, 2, -8, 3, 11};
    }

    public QQ(WindowManager windowManager) {
        this.A00 = windowManager;
    }

    public static QQ A00(Context context) {
        WindowManager windowManager = (WindowManager) context.getSystemService(A01(0, 6, 88));
        if (windowManager != null) {
            return new QQ(windowManager);
        }
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1356Xr
    public final void AIl(InterfaceC1355Xq interfaceC1355Xq) {
        interfaceC1355Xq.AEe(this.A00.getDefaultDisplay());
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1356Xr
    public final void ALq() {
    }
}
