package com.fyber.inneractive.sdk.flow.endcard;

/* loaded from: classes3.dex */
public enum l {
    Default(1),
    Fmp(2),
    Companion(3);

    private final int mPriority;

    l(int i5) {
        this.mPriority = i5;
    }

    public final int a() {
        return this.mPriority;
    }
}
