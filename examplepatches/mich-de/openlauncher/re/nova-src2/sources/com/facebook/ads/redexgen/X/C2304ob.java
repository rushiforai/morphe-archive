package com.facebook.ads.redexgen.X;

import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.ob, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2304ob {
    public /* synthetic */ C2304ob(AbstractC05811i abstractC05811i) {
        this();
    }

    public C2304ob() {
    }

    @JvmStatic
    public final EnumC2305oc A00(String str) {
        if (str == null) {
            return EnumC2305oc.A05;
        }
        try {
            return EnumC2305oc.valueOf(str);
        } catch (IllegalArgumentException unused) {
            return EnumC2305oc.A05;
        }
    }
}
