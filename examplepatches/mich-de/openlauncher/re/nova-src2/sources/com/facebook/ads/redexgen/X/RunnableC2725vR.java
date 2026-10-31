package com.facebook.ads.redexgen.X;

import android.view.View;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.vR, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class RunnableC2725vR implements Runnable {
    public static String[] A01 = {"xOWKaQpKHL5BeYXoO6208TTH", "5VEmdGyJ0DAcnkqrV7wxu", "3r36ml211ruCibO20tD36z0dIL1g0XXO", "3qmmaGKwbte3Q1VqqHSXQifKThAzwynC", "gPE8Fj4SfnVaoVCECdDcVQ61VVfonxBC", "6SrtN7wo7J6ug6zq6kCpjppRq", "L3EzuKejbhF40OoIiU33F9jeinCBS4tH", "djbBkkNOqEfT"};
    public final /* synthetic */ C2728vU A00;

    public RunnableC2725vR(C2728vU c2728vU) {
        this.A00 = c2728vU;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            View view = this.A00.A05;
            if (view != null) {
                view.bringToFront();
            }
        } catch (Throwable th2) {
            if (A01[6].charAt(5) == '2') {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[5] = "pz8orf6FeWPjGq0JwESaMoznA";
            strArr[1] = "vZggqxyQgM4YMzg0TTy6I";
            AbstractC2311oi.A00(th2, this);
        }
    }
}
