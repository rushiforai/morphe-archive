package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.util.List;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.Yz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public interface InterfaceC1387Yz {
    public static final InterfaceC1387Yz A00 = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.Q7
        @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
        public final InterfaceC1383Yv[] A5w() {
            return AbstractC1386Yy.A00();
        }

        @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
        public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
            return AbstractC1386Yy.A01(this, uri, map);
        }
    };

    InterfaceC1383Yv[] A5w();

    InterfaceC1383Yv[] A5x(Uri uri, Map<String, List<String>> map);
}
