package com.facebook.ads.redexgen.X;

import android.graphics.Outline;
import android.view.View;
import android.view.ViewOutlineProvider;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.oV, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2298oV extends ViewOutlineProvider {
    public static byte[] A01;
    public static String[] A02 = {"byXmvqVsG48CSr93T6eJGXgdWYrJdUYR", "M7wEDz2tkjeipDVmcAOapdqwmiMIp", "ZGjeWPkVy4rp6BeS0M9VsfZeY12NfYQ4", "dK1ZZEVDS8eNQJK5k8v1", "BhyL9pkFBh8PqqW4jEqlo8J2KoKoZhZ1", "FD6gaQ", b.f42142b, "XgB2AjRR2uInvsGLr9HnTw4blOVZ38K2"};
    public final /* synthetic */ float A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A02[2].charAt(24) != 'Y') {
                throw new RuntimeException();
            }
            A02[0] = "hpvYLrLiTEim5ctO9bUhQK5RKIaFxoDe";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 39);
            i13++;
        }
    }

    public static void A01() {
        A01 = new byte[]{89, 67, 66, 90, 95, 88, 83, 9, 22, 26, 8};
    }

    static {
        A01();
    }

    public C2298oV(float f11) {
        this.A00 = f11;
    }

    @Override // android.view.ViewOutlineProvider
    public final void getOutline(View view, Outline outline) {
        C1h.A09(view, A00(7, 4, 88));
        C1h.A09(outline, A00(0, 7, 17));
        outline.setRoundRect(0, 0, view.getWidth(), view.getHeight() + ((int) this.A00), this.A00);
    }
}
