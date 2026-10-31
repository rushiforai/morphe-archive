package com.facebook.ads.redexgen.X;

import android.content.SharedPreferences;

/* loaded from: assets/audience_network/classes.dex */
public final class JV implements InterfaceC1825gg {
    public final SharedPreferences A00;

    public JV(SharedPreferences sharedPreferences) {
        this.A00 = sharedPreferences;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1825gg
    public final JW A6r() {
        return new JW(this.A00.edit());
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1825gg
    public final long A92(String str, long j11) {
        return this.A00.getLong(str, j11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1825gg
    public final String A9r(String str, String str2) {
        return this.A00.getString(str, str2);
    }
}
