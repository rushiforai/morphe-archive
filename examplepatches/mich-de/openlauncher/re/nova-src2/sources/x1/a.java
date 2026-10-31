package x1;

import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes.dex */
public final class a extends AtomicInteger {
    @Override // java.lang.Number
    public final byte byteValue() {
        return (byte) super.intValue();
    }

    @Override // java.lang.Number
    public final short shortValue() {
        return (short) super.intValue();
    }
}
