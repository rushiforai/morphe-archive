package com.facebook.ads.redexgen.X;

import java.util.LinkedHashMap;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.fe, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1761fe extends LinkedHashMap<String, C1760fd> {
    public C1761fe(int i5, float f11, boolean z11) {
        super(i5, f11, z11);
    }

    @Override // java.util.LinkedHashMap
    public final boolean removeEldestEntry(Map.Entry<String, C1760fd> entry) {
        return size() > 10;
    }
}
