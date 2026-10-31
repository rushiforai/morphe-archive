package com.facebook.ads.redexgen.X;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.Nd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1103Nd {
    public Map<String, String> A00;
    public final Map<String, String> A01 = new HashMap();

    public final synchronized Map<String, String> A00() {
        if (this.A00 == null) {
            this.A00 = Collections.unmodifiableMap(new HashMap(this.A01));
        }
        return this.A00;
    }

    public final synchronized void A01(String str, String str2) {
        this.A00 = null;
        this.A01.put(str, str2);
    }
}
