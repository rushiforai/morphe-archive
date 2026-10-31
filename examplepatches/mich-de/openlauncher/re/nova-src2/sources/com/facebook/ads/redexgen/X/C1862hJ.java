package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.ViewParent;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.hJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1862hJ {
    public static String[] A05 = {"efs8eZdEWHsCfUb6qOzicmMnQm4SneBY", "GPD1kjm6fR3i7blABsL8PkfqVt5tQ0ec", "1ZMAOqgxiysbgCK2QhJ8YR6mzQdOOVTU", "tADzoHnDRwqyF4JfOWpRm", b.f42142b, "2dCxtsKJi8key4A0", "YZUwpVg0T4azRRaUQd2X9mlkfrI9cQeh", "C6BrW2LKkOXM7XSn"};
    public ViewParent A00;
    public ViewParent A01;
    public boolean A02;
    public int[] A03;
    public final View A04;

    public C1862hJ(View view) {
        this.A04 = view;
    }

    private ViewParent A00(int i5) {
        switch (i5) {
            case 0:
                return this.A01;
            case 1:
                return this.A00;
            default:
                return null;
        }
    }

    private void A01(int i5, ViewParent viewParent) {
        switch (i5) {
            case 0:
                this.A01 = viewParent;
                break;
            case 1:
                this.A00 = viewParent;
                break;
        }
    }

    public final void A02() {
        A03(0);
    }

    public final void A03(int i5) {
        ViewParent viewParentA00 = A00(i5);
        if (viewParentA00 != null) {
            AbstractC1895hr.A02(viewParentA00, this.A04, i5);
            A01(i5, null);
        }
    }

    public final void A04(boolean z11) {
        if (this.A02) {
            AbstractC1880hb.A08(this.A04);
        }
        this.A02 = z11;
    }

    public final boolean A05() {
        return A09(0);
    }

    public final boolean A06() {
        return this.A02;
    }

    public final boolean A07(float f11, float f12) {
        ViewParent viewParentA00;
        if (!A06() || (viewParentA00 = A00(0)) == null) {
            return false;
        }
        return AbstractC1895hr.A06(viewParentA00, this.A04, f11, f12);
    }

    public final boolean A08(float f11, float f12, boolean z11) {
        ViewParent viewParentA00;
        if (!A06() || (viewParentA00 = A00(0)) == null) {
            return false;
        }
        return AbstractC1895hr.A07(viewParentA00, this.A04, f11, f12, z11);
    }

    public final boolean A09(int i5) {
        return A00(i5) != null;
    }

    public final boolean A0A(int i5) {
        return A0B(i5, 0);
    }

    public final boolean A0B(int i5, int i11) {
        if (A09(i11)) {
            return true;
        }
        if (A06()) {
            if (A05[0].charAt(13) == 't') {
                throw new RuntimeException();
            }
            String[] strArr = A05;
            strArr[6] = "WHooJguTbRSPJrOooyt3LEnarcCTCzBe";
            strArr[1] = "8Bjeqw0rr3DdKBFvYwfvH0FxnGa8049d";
            View view = this.A04;
            for (ViewParent parent = this.A04.getParent(); parent != null; parent = parent.getParent()) {
                if (AbstractC1895hr.A08(parent, view, this.A04, i5, i11)) {
                    A01(i11, parent);
                    AbstractC1895hr.A05(parent, view, this.A04, i5, i11);
                    return true;
                }
                if (parent instanceof View) {
                    view = (View) parent;
                }
            }
            return false;
        }
        return false;
    }

    public final boolean A0C(int i5, int i11, int i12, int i13, int[] iArr) {
        return A0D(i5, i11, i12, i13, iArr, 0);
    }

    public final boolean A0D(int i5, int i11, int i12, int i13, int[] iArr, int startX) {
        ViewParent viewParentA00;
        if (!A06() || (viewParentA00 = A00(startX)) == null) {
            return false;
        }
        if (i5 != 0 || i11 != 0 || i12 != 0 || i13 != 0) {
            int i14 = 0;
            int i15 = 0;
            if (iArr != null) {
                this.A04.getLocationInWindow(iArr);
                i14 = iArr[0];
                i15 = iArr[1];
            }
            AbstractC1895hr.A03(viewParentA00, this.A04, i5, i11, i12, i13, startX);
            if (iArr != null) {
                this.A04.getLocationInWindow(iArr);
                iArr[0] = iArr[0] - i14;
                iArr[1] = iArr[1] - i15;
            }
            return true;
        }
        if (iArr != null) {
            iArr[0] = 0;
            iArr[1] = 0;
        }
        return false;
    }

    public final boolean A0E(int i5, int i11, int[] iArr, int[] iArr2) {
        return A0F(i5, i11, iArr, iArr2, 0);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0060  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A0F(int startX, int startY, int[] iArr, int[] iArr2, int i5) {
        ViewParent parent;
        int[] consumed = iArr;
        if (!A06() || (parent = A00(i5)) == null) {
            return false;
        }
        if (startX != 0 || startY != 0) {
            int i11 = 0;
            int i12 = 0;
            if (A05[3].length() == 9) {
                throw new RuntimeException();
            }
            A05[0] = "3VbjZKhXDsexEmt2meqPVZABMNEQkFPW";
            if (iArr2 != null) {
                this.A04.getLocationInWindow(iArr2);
                i11 = iArr2[0];
                i12 = iArr2[1];
            }
            if (consumed == null) {
                int[] iArr3 = this.A03;
                String[] strArr = A05;
                if (strArr[5].length() != strArr[7].length()) {
                    A05[4] = b.f42142b;
                    if (iArr3 == null) {
                        this.A03 = new int[2];
                    }
                    consumed = this.A03;
                } else {
                    String[] strArr2 = A05;
                    strArr2[5] = "gHL5QaZEq3qu3ZW6";
                    strArr2[7] = "on2hgQBHubksAtN0";
                    if (iArr3 == null) {
                    }
                    consumed = this.A03;
                }
            }
            consumed[0] = 0;
            consumed[1] = 0;
            AbstractC1895hr.A04(parent, this.A04, startX, startY, consumed, i5);
            if (iArr2 != null) {
                this.A04.getLocationInWindow(iArr2);
                iArr2[0] = iArr2[0] - i11;
                iArr2[1] = iArr2[1] - i12;
            }
            return (consumed[0] == 0 && consumed[1] == 0) ? false : true;
        }
        if (iArr2 != null) {
            iArr2[0] = 0;
            iArr2[1] = 0;
        }
        return false;
    }
}
