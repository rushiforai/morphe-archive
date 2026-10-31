package kl;

import java.math.BigDecimal;

/* loaded from: classes3.dex */
public final class i extends Number {

    /* renamed from: a, reason: collision with root package name */
    public final String f71599a;

    public i(String str) {
        this.f71599a = str;
    }

    @Override // java.lang.Number
    public final double doubleValue() {
        return Double.parseDouble(this.f71599a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof i) {
            return this.f71599a.equals(((i) obj).f71599a);
        }
        return false;
    }

    @Override // java.lang.Number
    public final float floatValue() {
        return Float.parseFloat(this.f71599a);
    }

    public final int hashCode() {
        return this.f71599a.hashCode();
    }

    @Override // java.lang.Number
    public final int intValue() {
        String str = this.f71599a;
        try {
            try {
                return Integer.parseInt(str);
            } catch (NumberFormatException unused) {
                return (int) Long.parseLong(str);
            }
        } catch (NumberFormatException unused2) {
            return new BigDecimal(str).intValue();
        }
    }

    @Override // java.lang.Number
    public final long longValue() {
        String str = this.f71599a;
        try {
            return Long.parseLong(str);
        } catch (NumberFormatException unused) {
            return new BigDecimal(str).longValue();
        }
    }

    public final String toString() {
        return this.f71599a;
    }
}
