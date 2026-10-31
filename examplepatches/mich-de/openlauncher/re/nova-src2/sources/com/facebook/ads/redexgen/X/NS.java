package com.facebook.ads.redexgen.X;

import java.io.IOException;

/* loaded from: assets/audience_network/classes.dex */
public abstract class NS {
    public static void A00(TE te2) {
        if (te2 != null) {
            try {
                te2.close();
            } catch (IOException unused) {
            }
        }
    }
}
