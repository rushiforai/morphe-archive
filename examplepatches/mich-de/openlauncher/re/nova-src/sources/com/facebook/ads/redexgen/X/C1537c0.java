package com.facebook.ads.redexgen.X;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.c0, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1537c0 {
    public float A00;
    public EnumC1638dd A01;
    public Map<String, String> A02;

    public C1537c0(EnumC1638dd enumC1638dd) {
        this(enumC1638dd, 0.0f);
    }

    public C1537c0(EnumC1638dd enumC1638dd, float f11) {
        this(enumC1638dd, f11, null);
    }

    public C1537c0(@Nullable EnumC1638dd enumC1638dd, float f11, Map<String, String> windowParams) {
        this.A01 = enumC1638dd;
        this.A00 = f11;
        if (windowParams != null) {
            this.A02 = windowParams;
        } else {
            this.A02 = new HashMap();
        }
    }

    public final float A00() {
        return this.A00;
    }

    public final int A01() {
        return this.A01.A03();
    }

    public final EnumC1638dd A02() {
        return this.A01;
    }

    public final Map<String, String> A03() {
        return this.A02;
    }

    public final boolean A04() {
        return this.A01 == EnumC1638dd.A0J;
    }
}
