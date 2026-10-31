package com.facebook.ads.redexgen.X;

import android.graphics.Outline;
import android.view.View;
import android.view.ViewOutlineProvider;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.oD, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2281oD extends ViewOutlineProvider {
    public static byte[] A01;
    public final /* synthetic */ float A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 59);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{9, 15, 14, 6, 3, 8, -1, -53, -66, -70, -52};
    }

    public C2281oD(float f11) {
        this.A00 = f11;
    }

    @Override // android.view.ViewOutlineProvider
    public final void getOutline(View view, Outline outline) {
        C1h.A09(view, A00(7, 4, 26));
        C1h.A09(outline, A00(0, 7, 95));
        outline.setRoundRect(0, -((int) this.A00), view.getWidth(), view.getHeight(), this.A00);
    }
}
