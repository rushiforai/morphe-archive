package fc0;

import b.c0;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes5.dex */
public enum j {
    BYTE_BOXED(true, (byte) 1, (byte) 0),
    SHORT_BOXED(true, (short) 1, (short) 0),
    INTEGER_BOXED(true, 1, 0),
    INTEGER_ATOMIC(true, 1, 0),
    LONG_BOXED(true, 1L, 0L),
    LONG_ATOMIC(true, 1L, 0),
    BIG_INTEGER(true, BigInteger.ONE, BigInteger.ZERO),
    RATIONAL(false, s.f54649k, s.f54648j),
    FLOAT_BOXED(false, Float.valueOf(1.0f), Float.valueOf(0.0f)),
    DOUBLE_BOXED(false, Double.valueOf(1.0d), Double.valueOf(0.0d)),
    BIG_DECIMAL(false, BigDecimal.ONE, BigDecimal.ZERO);


    /* renamed from: a, reason: collision with root package name */
    public final boolean f54630a;

    /* renamed from: b, reason: collision with root package name */
    public final Number f54631b;

    /* renamed from: c, reason: collision with root package name */
    public final Number f54632c;

    j(boolean z11, Number number, Number number2) {
        this.f54630a = z11;
        this.f54631b = number;
        this.f54632c = number2;
    }

    public static j a(Number number) {
        if (number instanceof Long) {
            return LONG_BOXED;
        }
        if (number instanceof AtomicLong) {
            return LONG_ATOMIC;
        }
        if (number instanceof Integer) {
            return INTEGER_BOXED;
        }
        if (number instanceof AtomicInteger) {
            return INTEGER_ATOMIC;
        }
        if (number instanceof Double) {
            return DOUBLE_BOXED;
        }
        if (number instanceof Short) {
            return SHORT_BOXED;
        }
        if (number instanceof Byte) {
            return BYTE_BOXED;
        }
        if (number instanceof Float) {
            return FLOAT_BOXED;
        }
        if (number instanceof BigDecimal) {
            return BIG_DECIMAL;
        }
        if (number instanceof BigInteger) {
            return BIG_INTEGER;
        }
        if (number instanceof s) {
            return RATIONAL;
        }
        throw new IllegalArgumentException(c0.l("Unsupported number type '", number.getClass().getName(), "'"));
    }
}
