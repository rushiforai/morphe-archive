package io.sentry;

/* loaded from: classes4.dex */
public enum z3 {
    LOW(0.8f, 50000),
    MEDIUM(1.0f, 75000),
    HIGH(1.0f, 100000);

    public final int bitRate;
    public final float sizeScale;

    z3(float f11, int i5) {
        this.sizeScale = f11;
        this.bitRate = i5;
    }
}
