package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;

/* loaded from: assets/audience_network/classes.dex */
public class L9 extends IOException {
    public int A00;
    public boolean A01;

    @Deprecated
    public L9() {
    }

    @Deprecated
    public L9(String str) {
        super(str);
    }

    public L9(String str, Throwable th2, boolean z11, int i5) {
        super(str == null ? b.f42142b : str, th2);
        this.A01 = z11;
        this.A00 = i5;
    }

    public static L9 A00(String str) {
        return new L9(str, null, false, 1);
    }

    public static L9 A01(String str, Throwable th2) {
        return new L9(str, th2, true, 1);
    }

    public static L9 A02(String str, Throwable th2) {
        return new L9(str, th2, true, 0);
    }
}
