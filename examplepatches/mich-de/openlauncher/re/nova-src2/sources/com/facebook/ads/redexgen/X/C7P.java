package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.PointF;
import android.util.DisplayMetrics;
import android.view.View;
import androidx.compose.ui.node.LayoutNode;

/* renamed from: com.facebook.ads.redexgen.X.7P, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C7P extends IY {
    public static String[] A02 = {"C44Ajl3kvJruV1G0pt7gVRuztfjSJyFq", "J5x5lFquh7whloqA7FngbvBzLsCb", "NWBvU5bW0Pue", "3", "BTAVkHunqM91yRRN2KcoYuZCergWfboL", "2NY5ANPTvwBPWrnTgdotgLNYCmp8", "bg7eF9CjngMlwdFplTojabi", "lLeEucKPPYu6Z0yxrpg2o1MG4v3W39r2"};
    public AbstractC1944ig A00;
    public AbstractC1944ig A01;

    private int A00(AbstractC1960iw abstractC1960iw, View view, AbstractC1944ig abstractC1944ig) {
        int containerCenter;
        int iA0G = abstractC1944ig.A0G(view) + (abstractC1944ig.A0E(view) / 2);
        if (abstractC1960iw.A2s()) {
            int iA0B = abstractC1944ig.A0B();
            int childCenter = abstractC1944ig.A0C();
            containerCenter = iA0B + (childCenter / 2);
        } else {
            int childCenter2 = abstractC1944ig.A06();
            containerCenter = childCenter2 / 2;
        }
        return iA0G - containerCenter;
    }

    private View A01(AbstractC1960iw abstractC1960iw, AbstractC1944ig abstractC1944ig) {
        int childCenter;
        int iA1T = abstractC1960iw.A1T();
        if (iA1T == 0) {
            return null;
        }
        View view = null;
        if (abstractC1960iw.A2s()) {
            int iA0B = abstractC1944ig.A0B();
            int iA0C = abstractC1944ig.A0C();
            if (A02[3].length() != 1) {
                throw new RuntimeException();
            }
            A02[4] = "QSrTWOl4jyYASaYHeqwJw7nAVlZS9nVf";
            int childCount = iA0C / 2;
            childCenter = iA0B + childCount;
        } else {
            int childCount2 = abstractC1944ig.A06();
            childCenter = childCount2 / 2;
        }
        int i5 = LayoutNode.NotPlacedPlaceOrder;
        for (int absClosest = 0; absClosest < iA1T; absClosest++) {
            View viewA20 = abstractC1960iw.A20(absClosest);
            int iA0G = abstractC1944ig.A0G(viewA20);
            int childCount3 = abstractC1944ig.A0E(viewA20);
            int childCount4 = Math.abs((iA0G + (childCount3 / 2)) - childCenter);
            if (childCount4 < i5) {
                i5 = childCount4;
                view = viewA20;
            }
        }
        return view;
    }

    private View A02(AbstractC1960iw abstractC1960iw, AbstractC1944ig abstractC1944ig) {
        int iA1T = abstractC1960iw.A1T();
        if (iA1T == 0) {
            return null;
        }
        View closestChild = null;
        int childStart = LayoutNode.NotPlacedPlaceOrder;
        for (int i5 = 0; i5 < iA1T; i5++) {
            View viewA20 = abstractC1960iw.A20(i5);
            int childCount = abstractC1944ig.A0G(viewA20);
            if (childCount < childStart) {
                childStart = childCount;
                if (A02[3].length() != 1) {
                    throw new RuntimeException();
                }
                A02[3] = "0";
                closestChild = viewA20;
            }
        }
        return closestChild;
    }

    private AbstractC1944ig A03(AbstractC1960iw abstractC1960iw) {
        if (this.A00 == null || this.A00.A02 != abstractC1960iw) {
            this.A00 = AbstractC1944ig.A00(abstractC1960iw);
        }
        return this.A00;
    }

    private AbstractC1944ig A04(AbstractC1960iw abstractC1960iw) {
        if (this.A01 == null || this.A01.A02 != abstractC1960iw) {
            this.A01 = AbstractC1944ig.A01(abstractC1960iw);
        }
        return this.A01;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:30:0x007a  */
    @Override // com.facebook.ads.redexgen.X.IY
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int A0C(AbstractC1960iw abstractC1960iw, int i5, int i11) {
        int centerPosition;
        boolean reverseLayout;
        int iA1W = abstractC1960iw.A1W();
        if (iA1W == 0) {
            return -1;
        }
        View viewA02 = null;
        if (abstractC1960iw.A2w()) {
            viewA02 = A02(abstractC1960iw, A04(abstractC1960iw));
        } else if (abstractC1960iw.A2v()) {
            AbstractC1944ig abstractC1944igA03 = A03(abstractC1960iw);
            if (A02[3].length() != 1) {
                throw new RuntimeException();
            }
            A02[4] = "gb7KateBwDTMhlVKT6fWGE4qrSBelOuo";
            viewA02 = A02(abstractC1960iw, abstractC1944igA03);
        }
        if (viewA02 == null || (centerPosition = abstractC1960iw.A1o(viewA02)) == -1) {
            return -1;
        }
        if (abstractC1960iw.A2v()) {
            reverseLayout = i5 > 0;
        } else {
            reverseLayout = i11 > 0;
        }
        boolean z11 = false;
        if (abstractC1960iw instanceof InterfaceC1972j8) {
            int itemCount = iA1W - 1;
            PointF pointFA5f = ((InterfaceC1972j8) abstractC1960iw).A5f(itemCount);
            if (A02[3].length() != 1) {
                String[] strArr = A02;
                strArr[6] = "yuw4mNpzW34AqVSRehlxNeo";
                strArr[2] = "wkUUhZpWZ02e";
                if (pointFA5f != null) {
                    z11 = pointFA5f.x < 0.0f || pointFA5f.y < 0.0f;
                }
            } else {
                A02[0] = "mSLQWLSJnMsLfeZB8hd0gvJZQvTgwPgU";
                if (pointFA5f != null) {
                }
            }
        }
        return z11 ? reverseLayout ? centerPosition - 1 : centerPosition : reverseLayout ? centerPosition + 1 : centerPosition;
    }

    @Override // com.facebook.ads.redexgen.X.IY
    public final View A0D(AbstractC1960iw abstractC1960iw) {
        if (abstractC1960iw.A2w()) {
            return A01(abstractC1960iw, A04(abstractC1960iw));
        }
        if (abstractC1960iw.A2v()) {
            return A01(abstractC1960iw, A03(abstractC1960iw));
        }
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.IY
    public final J5 A0E(AbstractC1960iw abstractC1960iw) {
        if (!(abstractC1960iw instanceof InterfaceC1972j8)) {
            return null;
        }
        final Context context = super.A00.getContext();
        return new J5(context) { // from class: com.facebook.ads.redexgen.X.7Q
            @Override // com.facebook.ads.redexgen.X.J5, com.facebook.ads.redexgen.X.AbstractC1973j9
            public final void A0L(View view, C1975jB c1975jB, C1971j7 c1971j7) {
                int[] iArrA0H = this.A00.A0H(((IY) this.A00).A00.getLayoutManager(), view);
                if (iArrA0H != null) {
                    int time = iArrA0H[0];
                    int dy2 = iArrA0H[1];
                    int dx2 = A0S(Math.max(Math.abs(time), Math.abs(dy2)));
                    if (dx2 > 0) {
                        c1971j7.A04(time, dy2, dx2, ((J5) this).A04);
                    }
                }
            }

            @Override // com.facebook.ads.redexgen.X.J5
            public final float A0P(DisplayMetrics displayMetrics) {
                return 100.0f / displayMetrics.densityDpi;
            }

            @Override // com.facebook.ads.redexgen.X.J5
            public final int A0R(int i5) {
                return Math.min(100, super.A0R(i5));
            }
        };
    }

    @Override // com.facebook.ads.redexgen.X.IY
    public final int[] A0H(AbstractC1960iw abstractC1960iw, View view) {
        int[] iArr = new int[2];
        if (abstractC1960iw.A2v()) {
            iArr[0] = A00(abstractC1960iw, view, A03(abstractC1960iw));
        } else {
            iArr[0] = 0;
        }
        boolean zA2w = abstractC1960iw.A2w();
        String[] strArr = A02;
        if (strArr[1].length() != strArr[5].length()) {
            throw new RuntimeException();
        }
        A02[0] = "E62MX6H1I4NpqQbgkpQnwXfK7jhgOp7C";
        if (zA2w) {
            iArr[1] = A00(abstractC1960iw, view, A04(abstractC1960iw));
        } else {
            iArr[1] = 0;
        }
        return iArr;
    }
}
