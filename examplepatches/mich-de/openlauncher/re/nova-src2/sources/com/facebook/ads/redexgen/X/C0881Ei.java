package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import java.lang.ref.WeakReference;

/* renamed from: com.facebook.ads.redexgen.X.Ei, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0881Ei implements InterfaceC2617th {
    public static String[] A01 = {"rUOW", "aWRz9w57BbjdFqiLlVKULgjEpPmZvoH8", "O5R7kQjl9dlEbTmOxFM", "RTTXt1XGjQ7lc0JJN4k", "YWk5sDvdVq4OrfH6uqkpvIufIX02K612", "riiCfbbpSiQJxVLfaMk0fOBGnO7a3bhl", "ebL4stdzD1kZZbdyPmGvoJkp8ONqczPZ", "XaKiFBuErPwArMTrVIzzCBiiyB1SWdBx"};
    public final WeakReference<C06906i> A00;

    public C0881Ei(C06906i c06906i) {
        this.A00 = new WeakReference<>(c06906i);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2617th
    public final void AFA(C2616tg c2616tg) {
        C06906i c06906i = this.A00.get();
        if (c06906i != null) {
            Bitmap bitmapA00 = c2616tg.A00();
            String[] strArr = A01;
            if (strArr[4].charAt(12) != strArr[7].charAt(12)) {
                throw new RuntimeException();
            }
            A01[0] = "M8qO";
            c06906i.A04 = bitmapA00 != null;
            c06906i.A02();
        }
    }
}
