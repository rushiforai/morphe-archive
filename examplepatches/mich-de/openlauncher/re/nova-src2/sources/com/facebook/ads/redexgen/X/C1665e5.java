package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.e5, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1665e5 {
    public static final C1665e5 A02 = new C1665e5();
    public byte A00 = 3;
    public boolean A01 = true;

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null || !(obj instanceof C1665e5)) {
            return false;
        }
        C1665e5 c1665e5 = (C1665e5) obj;
        return this.A00 == c1665e5.A00 && this.A01 == c1665e5.A01;
    }

    public final int hashCode() {
        return new Byte(this.A00).hashCode() + new Boolean(this.A01).hashCode();
    }
}
