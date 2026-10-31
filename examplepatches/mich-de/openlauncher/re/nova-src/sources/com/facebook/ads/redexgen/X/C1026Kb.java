package com.facebook.ads.redexgen.X;

import android.util.SparseBooleanArray;

/* renamed from: com.facebook.ads.redexgen.X.Kb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1026Kb {
    public static String[] A02 = {"5FV08b95yLvtZwZrNxGpn8iKRE", "GXQcNhF1paiKbMyxV9", "Wo8eluhVPqVsTbP5KKxt", "wjBjQ78OlGhMWfzsjfzFWV8qQjT", "YpT7RYUrHnZfByTATm5ldFxQvD9tLwOd", "HeJj8ROU5xVgtZb2mGvRb", "dbFS2unVwrrJA2FQ7HsqBfbhqAqEC2Oq", "EEG8Nl4mUCP5n3Hlp7DD9mLhAb1vjNJk"};
    public boolean A00;
    public final SparseBooleanArray A01 = new SparseBooleanArray();

    public final C1026Kb A00(int i5) {
        AbstractC1062Ln.A08(!this.A00);
        this.A01.append(i5, true);
        return this;
    }

    public final C1026Kb A01(int i5, boolean z11) {
        if (z11) {
            C1026Kb c1026KbA00 = A00(i5);
            if (A02[2].length() != 20) {
                throw new RuntimeException();
            }
            A02[4] = "T7xmkUdaLIne0yF5owMg3GCob8tJwFRt";
            return c1026KbA00;
        }
        return this;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final C1026Kb A02(C1027Kc c1027Kc) {
        for (int i5 = 0; i5 < i; i5++) {
            int i11 = c1027Kc.A01(i5);
            A00(i11);
        }
        return this;
    }

    public final C1026Kb A03(int... iArr) {
        for (int i5 : iArr) {
            A00(i5);
        }
        return this;
    }

    public final C1027Kc A04() {
        AbstractC1062Ln.A08(!this.A00);
        this.A00 = true;
        return new C1027Kc(this.A01);
    }
}
