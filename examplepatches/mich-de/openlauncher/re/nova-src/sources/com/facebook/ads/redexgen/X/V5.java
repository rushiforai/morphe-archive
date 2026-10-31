package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class V5 {
    public static String[] A02 = {"3w8FpJHfG5VCPL4lCfeqzRlqAZg4JhQj", "Hyno1ay3QDA4thXokg9Ggl8fWq9qkc4d", "c", "4VlPX45rTrjyjcQtg0Sx", "KkmgHCYR4SpvzW7ANR4U0mX7C8gQJSJj", "LZslS6ZuTmiIftPf41j2O640G1", "YTxD4yXEiCsmftHzv65B5Apo4hHJHAEv", "DQLq6A"};
    public final int A00;
    public final boolean A01;

    public V5(int i5, boolean z11) {
        this.A00 = i5;
        this.A01 = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null) {
            Class<?> cls = getClass();
            if (A02[5].length() != 26) {
                throw new RuntimeException();
            }
            A02[7] = "Fa8XPVWn4aOhLXlkKVneAHaYs";
            if (cls == obj.getClass()) {
                V5 v52 = (V5) obj;
                return this.A00 == v52.A00 && this.A01 == v52.A01;
            }
        }
        return false;
    }

    public final int hashCode() {
        return (this.A00 * 31) + (this.A01 ? 1 : 0);
    }
}
