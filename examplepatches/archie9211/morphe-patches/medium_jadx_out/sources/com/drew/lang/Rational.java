package com.drew.lang;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Rational extends Number implements Comparable<Rational>, Serializable {
    private static final long serialVersionUID = 510688928138848770L;
    private final long _denominator;
    private final long _numerator;

    public Rational(long j, long j2) {
        this._numerator = j;
        this._denominator = j2;
    }

    private static long GCD(long j, long j2) {
        if (j < 0) {
            j = -j;
        }
        if (j2 < 0) {
            j2 = -j2;
        }
        while (j != 0 && j2 != 0) {
            if (j > j2) {
                j %= j2;
            } else {
                j2 %= j;
            }
        }
        return j == 0 ? j2 : j;
    }

    @Override // java.lang.Number
    public final byte byteValue() {
        return (byte) doubleValue();
    }

    @Override // java.lang.Comparable
    public final int compareTo(Rational rational) {
        return Double.compare(doubleValue(), rational.doubleValue());
    }

    @Override // java.lang.Number
    public final double doubleValue() {
        long j = this._numerator;
        if (j == 0) {
            return 0.0d;
        }
        return j / this._denominator;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof Rational) && doubleValue() == ((Rational) obj).doubleValue();
    }

    public final boolean equalsExact(Rational rational) {
        return this._denominator == rational._denominator && this._numerator == rational._numerator;
    }

    @Override // java.lang.Number
    public final float floatValue() {
        long j = this._numerator;
        if (j == 0) {
            return 0.0f;
        }
        return j / this._denominator;
    }

    public final Rational getAbsolute() {
        return new Rational(Math.abs(this._numerator), Math.abs(this._denominator));
    }

    public final long getDenominator() {
        return this._denominator;
    }

    public final long getNumerator() {
        return this._numerator;
    }

    public final Rational getReciprocal() {
        return new Rational(this._denominator, this._numerator);
    }

    public final Rational getSimplifiedInstance() {
        long j = this._numerator;
        long j2 = this._denominator;
        if (j2 < 0) {
            j = -j;
            j2 = -j2;
        }
        long jGCD = GCD(j, j2);
        return new Rational(j / jGCD, j2 / jGCD);
    }

    public final int hashCode() {
        return (((int) this._denominator) * 23) + ((int) this._numerator);
    }

    @Override // java.lang.Number
    public final int intValue() {
        return (int) doubleValue();
    }

    public final boolean isInteger() {
        long j = this._denominator;
        if (j == 1) {
            return true;
        }
        if (j == 0 || this._numerator % j != 0) {
            return j == 0 && this._numerator == 0;
        }
        return true;
    }

    public final boolean isPositive() {
        if (!isZero()) {
            if ((this._numerator > 0) == (this._denominator > 0)) {
                return true;
            }
        }
        return false;
    }

    public final boolean isZero() {
        return this._numerator == 0 || this._denominator == 0;
    }

    @Override // java.lang.Number
    public final long longValue() {
        return (long) doubleValue();
    }

    @Override // java.lang.Number
    public final short shortValue() {
        return (short) doubleValue();
    }

    public final String toSimpleString(boolean z) {
        if (this._denominator == 0 && this._numerator != 0) {
            return toString();
        }
        if (isInteger()) {
            return Integer.toString((int) doubleValue());
        }
        Rational simplifiedInstance = getSimplifiedInstance();
        if (z) {
            String string = Double.toString(simplifiedInstance.doubleValue());
            if (string.length() < 5) {
                return string;
            }
        }
        return simplifiedInstance.toString();
    }

    public final String toString() {
        return this._numerator + "/" + this._denominator;
    }

    public final boolean equals(Rational rational) {
        return rational.doubleValue() == doubleValue();
    }
}
