package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.n2, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2210n2 {
    public final View A00;
    public final C0957Hh A01;
    public final InterfaceC2224nG A02;
    public final String A03;
    public final HashMap<String, String> A04 = new HashMap<>();
    public final boolean A05;
    public final boolean A06;

    public C2210n2(C0957Hh c0957Hh, View view, String str, boolean z11, boolean z12) {
        this.A03 = str;
        this.A01 = c0957Hh;
        this.A02 = c0957Hh.A0A();
        this.A00 = view;
        this.A05 = z12;
        this.A06 = z11;
    }

    public final View A00() {
        return this.A00;
    }

    public final C0957Hh A01() {
        return this.A01;
    }

    public final InterfaceC2224nG A02() {
        return this.A02;
    }

    public final String A03() {
        return this.A03;
    }

    public final Map<String, String> A04() {
        return Collections.unmodifiableMap(this.A04);
    }

    public final boolean A05() {
        return this.A05;
    }

    public final boolean A06() {
        return this.A06;
    }
}
