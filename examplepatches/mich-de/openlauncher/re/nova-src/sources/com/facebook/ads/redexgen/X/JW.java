package com.facebook.ads.redexgen.X;

import android.content.SharedPreferences;

/* loaded from: assets/audience_network/classes.dex */
public class JW implements InterfaceC1824gf {
    public final SharedPreferences.Editor A00;

    public JW(SharedPreferences.Editor editor) {
        this.A00 = editor;
    }

    public final JW A00(String str, long j11) {
        this.A00.putLong(str, j11);
        return this;
    }

    public final JW A01(String str, String str2) {
        this.A00.putString(str, str2);
        return this;
    }

    public final void A02() {
        this.A00.apply();
    }
}
