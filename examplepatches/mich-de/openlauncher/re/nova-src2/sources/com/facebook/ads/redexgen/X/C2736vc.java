package com.facebook.ads.redexgen.X;

import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.vc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2736vc {
    public static String[] A01 = {"gt2", "4KEpkRKu9anxmCmYjLaYuK", "9KxVtEikNW8COYO6VKOlslEVojMbVLHK", b.f42142b, "VKL0kgBzBpf71qI91B5UjeochpsCtMYK", "AopFSmA4Thri0taPF6pXEN45nqYMt", "SncErU", "J6UD30rvFK8IHu3zaS3aE6GeUe5ZyLQv"};
    public EnumC1664e4 A00;

    public final void A00(View view) {
        C0799Be c0799Be = view instanceof C0799Be ? (C0799Be) view : null;
        if (c0799Be == null || c0799Be.A0o()) {
            return;
        }
        EnumC1664e4 videoStartReason = c0799Be.getVideoStartReason();
        String[] strArr = A01;
        if (strArr[1].length() == strArr[5].length()) {
            throw new RuntimeException();
        }
        A01[7] = "iKEK4fcfcQgKhsoD7TgdSMANbNe7WyZ8";
        this.A00 = videoStartReason;
        c0799Be.A0j(false, 3);
    }

    public final void A01(View view) {
        EnumC1664e4 enumC1664e4 = this.A00;
        if (enumC1664e4 == null) {
            return;
        }
        C0799Be c0799Be = view instanceof C0799Be ? (C0799Be) view : null;
        if (c0799Be == null) {
            return;
        }
        this.A00 = null;
        if (c0799Be.getState() == EnumC1549cC.A06 || !c0799Be.A0o()) {
            return;
        }
        String[] strArr = A01;
        if (strArr[1].length() == strArr[5].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[4] = "XKcY1bT0MCu6k0YFcTq2r2FpSenItbsL";
        strArr2[2] = "6KxT60gY7CmYEMrcFHnL0o5HiRnj4Zh6";
        c0799Be.A0f(enumC1664e4, 19);
    }
}
