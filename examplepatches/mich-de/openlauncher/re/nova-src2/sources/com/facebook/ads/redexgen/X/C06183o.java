package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.3o, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06183o extends C0V implements InterfaceC05600l<String, Integer, Integer, AnonymousClass22> {
    public static byte[] A02;
    public final /* synthetic */ ViewOnClickListenerC0884El A00;
    public final /* synthetic */ C2250ng A01;

    static {
        A01();
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C06183o(C2250ng c2250ng, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        super(3);
        this.A01 = c2250ng;
        this.A00 = viewOnClickListenerC0884El;
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 29);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{0, 12, -3, -5, 1, 10, 0, -5, -1, -3, 14, 0, -5, 12, 14, 11, 0, 17, -1, 16};
    }

    private final void A02(String str, int i5, int i11) {
        this.A01.A0F(this.A00, str, i5, i11);
        ViewOnClickListenerC0884El viewOnClickListenerC0884El = this.A00;
        if (viewOnClickListenerC0884El != null) {
            viewOnClickListenerC0884El.A0E(A00(0, 20, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE));
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC05600l
    public final /* bridge */ /* synthetic */ AnonymousClass22 AB2(String str, Integer num, Integer num2) {
        A02(str, num.intValue(), num2.intValue());
        return AnonymousClass22.A01;
    }
}
