package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.hardware.display.DisplayManager;
import android.view.Display;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class QM implements InterfaceC1356Xr, DisplayManager.DisplayListener {
    public static byte[] A02;
    public InterfaceC1355Xq A00;
    public final DisplayManager A01;

    static {
        A03();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 29);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A02 = new byte[]{44, 33, 59, 56, 36, 41, 49};
    }

    public QM(DisplayManager displayManager) {
        this.A01 = displayManager;
    }

    private Display A00() {
        return this.A01.getDisplay(0);
    }

    public static QM A01(Context context) {
        DisplayManager displayManager = (DisplayManager) context.getSystemService(A02(0, 7, 85));
        if (displayManager != null) {
            return new QM(displayManager);
        }
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1356Xr
    public final void AIl(InterfaceC1355Xq interfaceC1355Xq) {
        this.A00 = interfaceC1355Xq;
        this.A01.registerDisplayListener(this, N1.A0Y());
        interfaceC1355Xq.AEe(A00());
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1356Xr
    public final void ALq() {
        this.A01.unregisterDisplayListener(this);
        this.A00 = null;
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayAdded(int i5) {
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayChanged(int i5) {
        if (this.A00 != null && i5 == 0) {
            this.A00.AEe(A00());
        }
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayRemoved(int i5) {
    }
}
