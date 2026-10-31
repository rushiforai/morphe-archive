package com.fyber.inneractive.sdk.rtb.data.types;

/* loaded from: classes.dex */
public enum a {
    VAST_1_0(1),
    VAST_2_0(2),
    VAST_3_0(3),
    VAST_1_0_WRAPPER(4),
    VAST_2_0_WRAPPER(5),
    VAST_3_0_WRAPPER(6);

    int value;

    a(int i5) {
        this.value = i5;
    }

    public final int a() {
        return this.value;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return String.valueOf(this.value);
    }
}
