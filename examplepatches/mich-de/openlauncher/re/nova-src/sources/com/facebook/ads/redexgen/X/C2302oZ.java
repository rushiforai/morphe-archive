package com.facebook.ads.redexgen.X;

import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.oZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2302oZ {
    public /* synthetic */ C2302oZ(AbstractC05811i abstractC05811i) {
        this();
    }

    public C2302oZ() {
    }

    @JvmStatic
    public final EnumC2303oa A00(String str) {
        if (str == null) {
            return EnumC2303oa.A07;
        }
        try {
            return EnumC2303oa.valueOf(str);
        } catch (IllegalArgumentException unused) {
            return EnumC2303oa.A07;
        }
    }
}
