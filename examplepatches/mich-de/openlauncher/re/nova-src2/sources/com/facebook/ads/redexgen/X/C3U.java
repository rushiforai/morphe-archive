package com.facebook.ads.redexgen.X;

import android.util.AttributeSet;
import android.view.View;
import androidx.compose.ui.node.LayoutNode;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.3U, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C3U extends AbstractViewOnTouchListenerC06203q implements InterfaceC2334p5 {
    public static byte[] A07;
    public static String[] A08 = {"T7MK6mm4Fzbg8PTMnM4kcHpb21LLpIaw", "PTQtUxKdjysMmbj8hCZsGKEwd1IRWqqZ", "Zw8mt4VncD", "79VYCrnrWW", "2MnAMBnkkiKtyd2cP7mHhabJycDYuMiE", "jaMauIT7sdi", "OgIH7ZaBRtH9hoDgrnw", "xZmsCngT77DU5lblEiekqTVKPqNdsast"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public InterfaceC2471rL A04;
    public boolean A05;
    public final AnonymousClass76 A06;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 28);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A07 = new byte[]{-6, -7, -37, -20, -14, -16, -50, -13, -20, -7, -14, -16, -17};
    }

    static {
        A03();
    }

    public C3U(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A03 = -1;
        this.A02 = -1;
        this.A01 = 0;
        this.A00 = 0;
        this.A05 = false;
        this.A06 = new AnonymousClass76(c0958Hi, new C2349pN(), new C2368pg());
        A02();
    }

    public C3U(C0958Hi c0958Hi, AttributeSet attributeSet) {
        super(c0958Hi, attributeSet);
        this.A03 = -1;
        this.A02 = -1;
        this.A01 = 0;
        this.A00 = 0;
        this.A05 = false;
        this.A06 = new AnonymousClass76(c0958Hi, new C2349pN(), new C2368pg());
        A02();
    }

    public C3U(C0958Hi c0958Hi, AttributeSet attributeSet, int i5) {
        super(c0958Hi, attributeSet, i5);
        this.A03 = -1;
        this.A02 = -1;
        this.A01 = 0;
        this.A00 = 0;
        this.A05 = false;
        this.A06 = new AnonymousClass76(c0958Hi, new C2349pN(), new C2368pg());
        A02();
    }

    private int A00(int i5) {
        int i11 = this.A00 * 2;
        int measuredWidth = getMeasuredWidth();
        int spacing = getPaddingLeft();
        int i12 = (measuredWidth - spacing) - i11;
        int itemSize = getAdapter().A0B();
        int numFullItems = 0;
        int spacing2 = LayoutNode.NotPlacedPlaceOrder;
        while (spacing2 > i5) {
            numFullItems++;
            if (numFullItems >= itemSize) {
                return i5;
            }
            int spacing3 = numFullItems * i11;
            spacing2 = (int) ((i12 - spacing3) / (numFullItems + 0.333f));
        }
        return spacing2;
    }

    private void A02() {
        this.A06.A3F(0);
        setLayoutManager(this.A06);
        setSaveEnabled(false);
        setSnapDelegate(this);
        AbstractC2426qc.A0L(this);
    }

    private void A04(int i5, int i11) {
        if (i5 == this.A03 && i11 == this.A02) {
            return;
        }
        this.A03 = i5;
        if (A08[1].charAt(11) == 'q') {
            throw new RuntimeException();
        }
        A08[6] = "hNBaptvkpj";
        this.A02 = i11;
        if (0 != 0) {
            throw new NullPointerException(A01(0, 13, 111));
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractViewOnTouchListenerC06203q
    public final void A27(int i5, boolean z11) {
        super.A27(i5, z11);
        A04(i5, 0);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2334p5
    public final int A9R(int i5) {
        int iAbs = Math.abs(i5);
        int scrollXAbs = ((AbstractViewOnTouchListenerC06203q) this).A06;
        if (iAbs <= scrollXAbs) {
            return 0;
        }
        int scrollXAbs2 = this.A01;
        if (scrollXAbs2 == 0) {
            return 1;
        }
        int scrollXAbs3 = this.A01;
        return 1 + (iAbs / scrollXAbs3);
    }

    public int getChildSpacing() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.C7O, android.view.View
    public final void onMeasure(int i5, int i11) {
        int height;
        int itemSize;
        super.onMeasure(i5, i11);
        int paddingTop = getPaddingTop() + getPaddingBottom();
        if (this.A05) {
            int i12 = (int) AbstractC2385px.A02;
            int verticalPadding = C2203mv.A0D(getContext());
            height = (i12 * verticalPadding) + paddingTop;
        } else {
            int verticalPadding2 = getMeasuredWidth();
            height = Math.round(verticalPadding2 / 1.91f);
        }
        int verticalPadding3 = View.MeasureSpec.getMode(i11);
        switch (verticalPadding3) {
            case Integer.MIN_VALUE:
                int verticalPadding4 = View.MeasureSpec.getSize(i11);
                height = Math.min(verticalPadding4, height);
                break;
            case 1073741824:
                height = View.MeasureSpec.getSize(i11);
                break;
        }
        int height2 = height - paddingTop;
        if (this.A05) {
            int verticalPadding5 = C2465rF.A09;
            itemSize = Math.min(verticalPadding5, height2);
        } else {
            itemSize = A00(height2);
        }
        int height3 = getMeasuredWidth();
        int verticalPadding6 = itemSize + paddingTop;
        setMeasuredDimension(height3, verticalPadding6);
        if (!this.A05) {
            int verticalPadding7 = this.A00;
            setChildWidth((verticalPadding7 * 2) + itemSize);
        }
    }

    @Override // com.facebook.ads.redexgen.X.C7O
    public void setAdapter(AbstractC1948ik abstractC1948ik) {
        this.A06.A3M(abstractC1948ik == null ? -1 : abstractC1948ik.hashCode());
        super.setAdapter(abstractC1948ik);
    }

    public void setChildSpacing(int i5) {
        this.A00 = i5;
    }

    public void setChildWidth(int i5) {
        this.A01 = i5;
        int measuredWidth = getMeasuredWidth();
        int pageWidth = getPaddingLeft();
        int i11 = measuredWidth - pageWidth;
        int pageWidth2 = getPaddingRight();
        int i12 = i11 - pageWidth2;
        AnonymousClass76 anonymousClass76 = this.A06;
        int pageWidth3 = this.A01;
        anonymousClass76.A3N((i12 - pageWidth3) / 2);
        AnonymousClass76 anonymousClass762 = this.A06;
        int pageWidth4 = this.A01;
        anonymousClass762.A3L(pageWidth4 / measuredWidth);
    }

    public void setCurrentPosition(int i5) {
        A27(i5, false);
    }

    public void setOnPageChangedListener(InterfaceC2471rL interfaceC2471rL) {
        this.A04 = interfaceC2471rL;
    }

    public void setShowTextInCarousel(boolean z11) {
        this.A05 = z11;
    }
}
