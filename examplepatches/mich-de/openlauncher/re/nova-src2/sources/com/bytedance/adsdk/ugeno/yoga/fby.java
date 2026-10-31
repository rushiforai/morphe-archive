package com.bytedance.adsdk.ugeno.yoga;

/* loaded from: classes2.dex */
public enum fby {
    UNDEFINED(0),
    EXACTLY(1),
    AT_MOST(2);


    /* renamed from: dj, reason: collision with root package name */
    private final int f22603dj;

    fby(int i5) {
        this.f22603dj = i5;
    }

    public static fby ycx(int i5) {
        if (i5 == 0) {
            return UNDEFINED;
        }
        if (i5 == 1) {
            return EXACTLY;
        }
        if (i5 == 2) {
            return AT_MOST;
        }
        throw new IllegalArgumentException("Unknown enum value: ".concat(String.valueOf(i5)));
    }
}
