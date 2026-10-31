package com.facebook.ads.redexgen.X;

import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebChromeClient;
import android.webkit.WebViewClient;
import androidx.compose.ui.node.LayoutNode;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Dx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0870Dx extends AbstractC2607tX {
    public static byte[] A01;
    public final /* synthetic */ C1245Tb A00;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 114);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A01 = new byte[]{5, 24, 15, 0, 12, 8, 2, 62, 18, 5, 10, 62, 13, 0, 24, 4, 19, 62, 2, 14, 15, 21, 4, 15, 21, 62, 9, 4, 8, 6, 9, 21, 12, 17, 6, 9, 5, 1, 11, 55, 27, 12, 3, 55, 4, 9, 17, 13, 26, 55, 11, 7, 6, 28, 13, 6, 28, 55, 31, 1, 12, 28, 0};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 14 out of bounds for length 14
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // android.webkit.WebView, android.widget.AbsoluteLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        int dynamicWebViewWidth = getDynamicWebViewWidth();
        int dynamicWebViewHeight = getDynamicWebViewHeight();
        if (dynamicWebViewWidth <= 0 || dynamicWebViewHeight <= 0) {
            super.onMeasure(i5, i11);
            return;
        }
        float f11 = dynamicWebViewWidth / dynamicWebViewHeight;
        int mode = View.MeasureSpec.getMode(i5);
        int mode2 = View.MeasureSpec.getMode(i11);
        boolean z11 = mode != 1073741824;
        boolean z12 = mode2 != 1073741824;
        int width = getResources().getDisplayMetrics().widthPixels;
        int height = getResources().getDisplayMetrics().heightPixels;
        ViewGroup viewGroup = (ViewGroup) getParent();
        if (viewGroup != null) {
            int width2 = viewGroup.getWidth();
            height = LayoutNode.NotPlacedPlaceOrder;
            width = width2 != 0 ? viewGroup.getWidth() : LayoutNode.NotPlacedPlaceOrder;
            if (viewGroup.getHeight() != 0) {
                height = viewGroup.getHeight();
            }
        }
        int iA00 = A00(dynamicWebViewWidth, width, i5);
        int iA002 = A00(dynamicWebViewHeight, height, i11);
        if ((z12 || z11) && Math.abs((iA00 / iA002) - f11) > 1.0E-7d) {
            boolean z13 = false;
            if (z12) {
                iA002 = (int) (iA00 / f11);
                z13 = true;
            }
            if (!z13 && z11) {
                iA00 = (int) (iA002 * f11);
            }
        }
        setMeasuredDimension(iA00, iA002);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0870Dx(C1245Tb c1245Tb, C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A00 = c1245Tb;
        getSettings().setAllowFileAccess(true);
        setBackgroundColor(0);
    }

    private int A00(int i5, int i11, int i12) {
        int specMode = View.MeasureSpec.getMode(i12);
        int result = View.MeasureSpec.getSize(i12);
        switch (specMode) {
            case Integer.MIN_VALUE:
                return Math.min(Math.min(i5, result), i11);
            case 0:
                return Math.min(i5, i11);
            case 1073741824:
                return result;
            default:
                return i5;
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2607tX
    public final WebChromeClient A0G() {
        return new C2202mu(this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2607tX
    public final WebViewClient A0H() {
        return new C1889hl(this.A00);
    }

    private int getDynamicWebViewHeight() {
        return this.A00.A0E.A1x().optInt(A01(0, 32, 19));
    }

    private int getDynamicWebViewWidth() {
        return this.A00.A0E.A1x().optInt(A01(32, 31, 26));
    }

    @Override // android.webkit.WebView, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (this.A00.A04 != null) {
            this.A00.A04.AHL(this, motionEvent);
        }
        return super.onTouchEvent(motionEvent);
    }
}
