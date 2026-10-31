package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;

/* renamed from: com.facebook.ads.redexgen.X.gm, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1830gm extends FrameLayout {
    public int A00;
    public int A01;
    public boolean A02;
    public boolean A03;
    public final Rect A04;
    public final Rect A05;
    public final InterfaceC1831gn A06;
    public static String[] A07 = {"jVZ1Tu881vaZhMQc7G1YnAdrBZwLOzLZ", "MIZgMzLB91QWfj9gVmnmcTG9oR84Ntwz", "DCbfL76gOTURmFCUeHCsoybhclYkmTay", "EMPd0g2FUYEiLKskd4o9XcZgPaWME7KU", "G2pxhAodnNK6EDlWmu9QTAPYKMlMfLOc", "qEeDuFDfyNwl7ByTckOuFZ9zHyfaVY7D", "VB67ht075LyAy5nhvmM9NplNYlVRYF1n", "i4ARItf07QURagRfhioscqF5iwXVDFyZ"};
    public static final int[] A0B = {16842801};
    public static final float A08 = Resources.getSystem().getDisplayMetrics().density;
    public static final int A09 = (int) (A08 * 1.0f);
    public static final InterfaceC1832go A0A = new JT();

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 13 out of bounds for length 13
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public C1830gm(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.A04 = new Rect();
        this.A05 = new Rect();
        this.A06 = new JU(this);
        TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(A0B);
        int color = typedArrayObtainStyledAttributes.getColor(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        Color.colorToHSV(color, new float[3]);
        ColorStateList colorStateListValueOf = ColorStateList.valueOf(-328966);
        this.A02 = false;
        this.A03 = true;
        this.A04.left = 0;
        this.A04.top = 0;
        this.A04.right = 0;
        this.A04.bottom = 0;
        float f11 = 10.0f > 50.0f ? 10.0f : 50.0f;
        this.A01 = 0;
        this.A00 = 0;
        A0A.AAu(this.A06, context, colorStateListValueOf, 10.0f, 10.0f, f11);
    }

    static {
        A0A.AAs();
    }

    public C1830gm(Context context) {
        this(context, null);
    }

    public C1830gm(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ColorStateList getCardBackgroundColor() {
        return A0A.A7b(this.A06);
    }

    public float getCardElevation() {
        return A0A.A8W(this.A06);
    }

    public int getContentPaddingBottom() {
        return this.A04.bottom;
    }

    public int getContentPaddingLeft() {
        return this.A04.left;
    }

    public int getContentPaddingRight() {
        return this.A04.right;
    }

    public int getContentPaddingTop() {
        return this.A04.top;
    }

    public float getMaxCardElevation() {
        return A0A.A94(this.A06);
    }

    public boolean getPreventCornerOverlap() {
        return this.A03;
    }

    public float getRadius() {
        return A0A.A9U(this.A06);
    }

    public boolean getUseCompatPadding() {
        return this.A02;
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        if (!(A0A instanceof JT)) {
            int mode = View.MeasureSpec.getMode(i5);
            switch (mode) {
                case Integer.MIN_VALUE:
                case 1073741824:
                    double dCeil = Math.ceil(A0A.A9B(this.A06));
                    if (A07[1].charAt(21) == 'T') {
                        A07[1] = "CoEZjfZf0TpQ2BZBlHTi5T6DWNYutRLI";
                        int minWidth = (int) dCeil;
                        i5 = View.MeasureSpec.makeMeasureSpec(Math.max(minWidth, View.MeasureSpec.getSize(i5)), mode);
                        break;
                    } else {
                        throw new RuntimeException();
                    }
            }
            int mode2 = View.MeasureSpec.getMode(i11);
            switch (mode2) {
                case Integer.MIN_VALUE:
                case 1073741824:
                    i11 = View.MeasureSpec.makeMeasureSpec(Math.max((int) Math.ceil(A0A.A9A(this.A06)), View.MeasureSpec.getSize(i11)), mode2);
                    break;
            }
            super.onMeasure(i5, i11);
            return;
        }
        super.onMeasure(i5, i11);
    }

    public void setCardBackgroundColor(int i5) {
        A0A.AKb(this.A06, ColorStateList.valueOf(i5));
    }

    public void setCardBackgroundColor(ColorStateList colorStateList) {
        A0A.AKb(this.A06, colorStateList);
    }

    public void setCardElevation(float f11) {
        A0A.AKh(this.A06, f11);
    }

    public void setMaxCardElevation(float f11) {
        A0A.AKp(this.A06, f11);
    }

    @Override // android.view.View
    public void setMinimumHeight(int i5) {
        this.A00 = i5;
        super.setMinimumHeight(i5);
    }

    @Override // android.view.View
    public void setMinimumWidth(int i5) {
        this.A01 = i5;
        super.setMinimumWidth(i5);
    }

    @Override // android.view.View
    public final void setPadding(int i5, int i11, int i12, int i13) {
    }

    @Override // android.view.View
    public final void setPaddingRelative(int i5, int i11, int i12, int i13) {
    }

    public void setPreventCornerOverlap(boolean z11) {
        if (z11 != this.A03) {
            this.A03 = z11;
            String[] strArr = A07;
            if (strArr[5].charAt(25) == strArr[2].charAt(25)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A07;
            strArr2[5] = "AF11DlndTIGSrqZz8tUh3XTR3YFTmMvs";
            strArr2[2] = "M7b5sm4OMM6QoyOKa0AwC0c4wRmpSBfx";
            A0A.AGY(this.A06);
        }
    }

    public void setRadius(float f11) {
        A0A.AL1(this.A06, f11);
    }

    public void setUseCompatPadding(boolean z11) {
        if (this.A02 != z11) {
            this.A02 = z11;
            A0A.AEQ(this.A06);
        }
    }
}
