package com.facebook.ads.redexgen.X;

import android.view.WindowInsets;

/* renamed from: com.facebook.ads.redexgen.X.hs, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1896hs {
    public final Object A00;

    public C1896hs(Object obj) {
        this.A00 = obj;
    }

    public static C1896hs A00(Object obj) {
        if (obj == null) {
            return null;
        }
        return new C1896hs(obj);
    }

    public static Object A01(C1896hs c1896hs) {
        if (c1896hs == null) {
            return null;
        }
        return c1896hs.A00;
    }

    public final int A02() {
        return ((WindowInsets) this.A00).getSystemWindowInsetBottom();
    }

    public final int A03() {
        return ((WindowInsets) this.A00).getSystemWindowInsetLeft();
    }

    public final int A04() {
        return ((WindowInsets) this.A00).getSystemWindowInsetRight();
    }

    public final int A05() {
        return ((WindowInsets) this.A00).getSystemWindowInsetTop();
    }

    public final C1896hs A06(int i5, int i11, int i12, int i13) {
        return new C1896hs(((WindowInsets) this.A00).replaceSystemWindowInsets(i5, i11, i12, i13));
    }

    public final boolean A07() {
        return ((WindowInsets) this.A00).isConsumed();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        C1896hs c1896hs = (C1896hs) obj;
        return this.A00 == null ? c1896hs.A00 == null : this.A00.equals(c1896hs.A00);
    }

    public final int hashCode() {
        if (this.A00 == null) {
            return 0;
        }
        return this.A00.hashCode();
    }
}
