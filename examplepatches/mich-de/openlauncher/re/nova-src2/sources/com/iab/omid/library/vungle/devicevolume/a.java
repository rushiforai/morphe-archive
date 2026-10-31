package com.iab.omid.library.vungle.devicevolume;

/* loaded from: classes3.dex */
public class a {
    public float a(int i5, int i11) {
        if (i11 <= 0 || i5 <= 0) {
            return 0.0f;
        }
        float f11 = i5 / i11;
        if (f11 > 1.0f) {
            return 1.0f;
        }
        return f11;
    }
}
