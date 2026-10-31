package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.2j, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C2j {
    public static byte[] A01;
    public static String[] A02 = {"fbJZDruusr1r1ap", "K5pFJLc0dCE9hZa85uzgmQiRrPtoJfua", "FJelQoOdCs3YKhyd5FpIgqPUOMoiTrys", "PFy8N3xOTfc9qwZF2GiqcDtMHaON3zMI", "vV0e40TZvFhyRkNzV7GeEhVfGIfjztVM", "huecsYumwoqBHh4eLfJjz", "lFluhjrJnQkdQB9rQytU5L5djmFC242x", "dUhcMBg3SY8juvkeQQi8B85Avgd7ZzpC"};
    public InterfaceC05902k A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 75);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        if (A02[4].charAt(25) != 'I') {
            throw new RuntimeException();
        }
        A02[4] = "aB5IQswNDeQrinuF69zlZiT0LIjC4Anl";
        A01 = new byte[]{8, 27, 23, 41, 34, 33, 27, 32, 38, -2, 27, 24, 23, 21, 43, 21, 30, 23, -11, 33, 32, 38, 36, 33, 30, 30, 23, 36, -32, 37, 38, 19, 36, 38, 5, 21, 19, 32, -78, -59, -63, -45, -52, -53, -59, -54, -48, -88, -59, -62, -63, -65, -43, -65, -56, -63, -97, -53, -54, -48, -50, -53, -56, -56, -63, -50, -118, -49, -48, -53, -52, -81, -65, -67, -54};
    }

    static {
        A01();
    }

    public final void A03() {
        C2Q.A01.A02(A00(0, 38, 103));
        InterfaceC05902k localOnLifecycleEventListener = this.A00;
        if (localOnLifecycleEventListener != null) {
            localOnLifecycleEventListener.onStart();
        }
    }

    public final void A04() {
        C2Q.A01.A02(A00(38, 37, 17));
        InterfaceC05902k localOnLifecycleEventListener = this.A00;
        if (localOnLifecycleEventListener != null) {
            localOnLifecycleEventListener.onStop();
        }
    }

    public final void A05(InterfaceC05902k interfaceC05902k) {
        this.A00 = interfaceC05902k;
    }
}
