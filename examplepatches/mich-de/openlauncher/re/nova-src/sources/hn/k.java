package hn;

/* loaded from: classes.dex */
public final class k extends Number {

    /* renamed from: a, reason: collision with root package name */
    public final String f59915a;

    public k(String str) {
        this.f59915a = str;
    }

    @Override // java.lang.Number
    public final double doubleValue() {
        return Double.parseDouble(this.f59915a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof k) {
            return this.f59915a.equals(((k) obj).f59915a);
        }
        return false;
    }

    @Override // java.lang.Number
    public final float floatValue() {
        return Float.parseFloat(this.f59915a);
    }

    public final int hashCode() {
        return this.f59915a.hashCode();
    }

    @Override // java.lang.Number
    public final int intValue() {
        String str = this.f59915a;
        try {
            try {
                return Integer.parseInt(str);
            } catch (NumberFormatException unused) {
                return (int) Long.parseLong(str);
            }
        } catch (NumberFormatException unused2) {
            return h.j(str).intValue();
        }
    }

    @Override // java.lang.Number
    public final long longValue() {
        String str = this.f59915a;
        try {
            return Long.parseLong(str);
        } catch (NumberFormatException unused) {
            return h.j(str).longValue();
        }
    }

    public final String toString() {
        return this.f59915a;
    }
}
