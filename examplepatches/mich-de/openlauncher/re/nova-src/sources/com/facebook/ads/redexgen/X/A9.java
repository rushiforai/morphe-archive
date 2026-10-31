package com.facebook.ads.redexgen.X;

import android.util.Log;

/* loaded from: assets/audience_network/classes.dex */
public abstract class A9 implements YR {
    public int A00;

    @Override // com.facebook.ads.redexgen.X.YR
    public final void AAX(String str, String str2) {
        Log.i(str, str2);
    }

    @Override // com.facebook.ads.redexgen.X.YR
    public final void AAY(String str, String str2, Throwable th2) {
        Log.i(str, str2, th2);
    }

    @Override // com.facebook.ads.redexgen.X.YR
    public final boolean ABG(int i5) {
        return this.A00 <= i5;
    }

    @Override // com.facebook.ads.redexgen.X.YR
    public final void AKq(int i5) {
        this.A00 = i5;
    }
}
