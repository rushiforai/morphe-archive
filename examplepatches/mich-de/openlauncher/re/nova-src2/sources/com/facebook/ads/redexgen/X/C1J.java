package com.facebook.ads.redexgen.X;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.widget.LinearLayout;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.1J, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C1J {
    public static byte[] A0E;
    public static String[] A0F = {"ciowXTSxQuaQyhX8rTWn7", "DisJvu9swd0CTHGF6BHCnvyyZ00xPQ7", "xWuTPxfBqCH2dyc8Xjmnr", "mVrZvJxjJfjXpwc", "kKC5x3rSafb3nIMchNhd1pvl93FRCFvc", "ZA2PBwyvmzkm1gxveKbqyoWIeaWpUzlq", "u6w7uuViu7j5rX2E05gRaqN2X5PX0NqK", "ZjaSE0KB14"};
    public static final int A0G;
    public ValueAnimator A00;
    public Drawable A01;
    public LinearLayout A02;
    public F8 A03;
    public C2590tG A04;
    public F4 A05;
    public C2735vb A06;
    public boolean A07;
    public boolean A08;
    public boolean A09;
    public final ViewGroup A0A;
    public final C0958Hi A0B;
    public final C1L A0C;
    public final String A0D;

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0E, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 5);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0C() {
        A0E = new byte[]{41, 44, 43, 46};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 14 out of bounds for length 14
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private void A0H(final View view, final View view2) {
        final int height = this.A0A.getHeight();
        if (height <= 0 || this.A02 == null) {
            this.A0A.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.1U
                @Override // java.lang.Runnable
                public final void run() {
                    this.A00.A0L();
                }
            });
            return;
        }
        final int i5 = (int) (height * 0.25f);
        ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams(-1, height - i5);
        marginLayoutParams.topMargin = height;
        this.A0A.addView(this.A02, marginLayoutParams);
        final int iA01 = A01(view, height);
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        valueAnimatorOfFloat.setDuration(300L);
        valueAnimatorOfFloat.setInterpolator(new AccelerateDecelerateInterpolator());
        valueAnimatorOfFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.facebook.ads.redexgen.X.1T
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                float animatedFraction = valueAnimator.getAnimatedFraction();
                int i11 = iA01;
                float fraction = i5 - iA01;
                int i12 = i11 + ((int) (fraction * animatedFraction));
                int i13 = height;
                int currentDslHeight = i5;
                float fraction2 = currentDslHeight - height;
                int currentBrowseTop = i13 + ((int) (fraction2 * animatedFraction));
                C1J.A0E(view, i12);
                if (view2 != null) {
                    C1J.A0E(view2, i12);
                }
                if (this.A05.A02 != null) {
                    C1J.A0F(this.A05.A02, currentBrowseTop);
                }
            }
        });
        valueAnimatorOfFloat.addListener(new AnimatorListenerAdapter() { // from class: com.facebook.ads.redexgen.X.1S
            public boolean A00;

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public final void onAnimationCancel(Animator animator) {
                this.A00 = true;
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public final void onAnimationEnd(Animator animator) {
                if (this.A01.A00 == animator) {
                    this.A01.A00 = null;
                }
                if (!this.A00) {
                    this.A01.A0C.AHr();
                }
            }
        });
        this.A00 = valueAnimatorOfFloat;
        valueAnimatorOfFloat.start();
    }

    static {
        A0C();
        A0G = C2735vb.A09;
    }

    public C1J(C0958Hi c0958Hi, ViewGroup viewGroup, C1L c1l, String str) {
        this.A0B = c0958Hi;
        this.A0A = viewGroup;
        this.A0C = c1l;
        this.A0D = str;
    }

    public static int A00(int i5) {
        return (int) (i5 * 0.25f);
    }

    public static int A01(View view, int i5) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams == null) {
            return i5;
        }
        int i11 = layoutParams.height;
        if (A0F[4].charAt(8) == 'U') {
            throw new RuntimeException();
        }
        A0F[0] = "403xTAizHvzCxqGBYbXL8";
        return i11 == -1 ? i5 : layoutParams.height;
    }

    public static String A09(String str) {
        try {
            String link = AbstractC2351pP.A00(str).getQueryParameter(A08(0, 4, 64));
            if (!TextUtils.isEmpty(link)) {
                return link;
            }
        } catch (Exception unused) {
        }
        String[] strArr = A0F;
        if (strArr[2].length() == strArr[3].length()) {
            throw new RuntimeException();
        }
        A0F[0] = "xKmsJxvhrCmXlS6GSREeo";
        return null;
    }

    private void A0A() {
        F4 f42;
        LinearLayout linearLayout = new LinearLayout(this.A0B);
        linearLayout.setOrientation(1);
        linearLayout.setBackgroundColor(-1);
        AbstractC2426qc.A0L(linearLayout);
        InterfaceC2599tP browserListener = new C0866Dt(this, null);
        if (this.A0B.A0E() != null) {
            f42 = new F4(this.A0B, this.A0B.A0E(), browserListener);
        } else {
            f42 = new F4(this.A0B, browserListener);
        }
        F8 f82 = new F8(this.A0B, f42, true);
        f82.setListener(new C0867Du(this));
        f42.setBrowserNavigationListener(f82.getBrowserNavigationListener());
        C2590tG c2590tG = new C2590tG(this.A0B, null, 16842872);
        linearLayout.addView(f82, new LinearLayout.LayoutParams(-1, -2));
        linearLayout.addView(c2590tG, new LinearLayout.LayoutParams(-1, -2));
        linearLayout.addView(f42, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        this.A02 = linearLayout;
        this.A05 = f42;
        this.A03 = f82;
        this.A04 = c2590tG;
    }

    private void A0B() {
        if (this.A00 != null) {
            ValueAnimator valueAnimator = this.A00;
            this.A00 = null;
            valueAnimator.cancel();
        }
    }

    public static void A0D(View view) {
        A0E(view, -1);
    }

    public static void A0E(View view, int i5) {
        ViewGroup.LayoutParams raw = view.getLayoutParams();
        if (raw == null) {
            return;
        }
        raw.height = i5;
        view.setLayoutParams(raw);
    }

    public static void A0F(View view, int i5) {
        ViewGroup.LayoutParams raw = view.getLayoutParams();
        if (raw instanceof ViewGroup.MarginLayoutParams) {
            ((ViewGroup.MarginLayoutParams) raw).topMargin = i5;
            view.setLayoutParams(raw);
        }
    }

    private void A0I(View view, View view2) {
        A0B();
        A0D(view);
        if (view2 != null) {
            A0D(view2);
        }
        if (this.A09) {
            this.A0C.AEG();
            this.A0B.A0F().A5E(EnumC2299oW.A03.name());
        }
        A0K();
    }

    private boolean A0J(String str, View view, View view2) {
        int height = this.A0A.getHeight();
        int iA00 = height > 0 ? height - A00(height) : 0;
        C2735vb c2735vb = new C2735vb(this.A0B, new C0868Dv(this));
        this.A06 = c2735vb;
        this.A09 = true;
        if (!c2735vb.A0D(str, iA00, 0)) {
            this.A06 = null;
            this.A09 = false;
            return false;
        }
        if (height > 0) {
            int totalHeight = A00(height);
            A0E(view, totalHeight);
            if (view2 != null) {
                A0E(view2, totalHeight);
            }
        }
        this.A01 = this.A0A.getBackground();
        this.A07 = true;
        this.A0A.setBackgroundColor(-16777216);
        this.A0C.AHr();
        return true;
    }

    public final void A0K() {
        A0B();
        if (this.A06 != null) {
            this.A06.A0C();
            this.A06.A0B();
            this.A06 = null;
        }
        this.A09 = false;
        if (this.A07) {
            this.A0A.setBackground(this.A01);
            this.A01 = null;
            this.A07 = false;
        }
        if (this.A05 != null) {
            this.A05.destroy();
            this.A05 = null;
        }
        if (this.A02 != null) {
            this.A0A.removeView(this.A02);
            this.A02 = null;
        }
        this.A03 = null;
        this.A04 = null;
        this.A08 = false;
        if (A0F[1].length() == 21) {
            throw new RuntimeException();
        }
        String[] strArr = A0F;
        strArr[5] = "hg1KE4zK5w2BHZt1j0mAEsFo1Ca2P6ES";
        strArr[7] = "jvmP8GFAvD";
    }

    public final /* synthetic */ void A0L() {
        this.A0C.AHr();
    }

    public final boolean A0M() {
        return this.A08;
    }

    public final boolean A0N() {
        return this.A09;
    }

    public final boolean A0O(View view, View view2) {
        if (!this.A08) {
            return false;
        }
        A0I(view, view2);
        return true;
    }

    public final boolean A0P(String str, String str2, View view, View view2) {
        if (this.A08) {
            return false;
        }
        String strA09 = A09(str);
        if (TextUtils.isEmpty(strA09)) {
            return false;
        }
        this.A08 = true;
        String browseUrl = this.A0D;
        EnumC2303oa enumC2303oaA00 = EnumC2303oa.A00(browseUrl);
        EnumC2299oW enumC2299oWA00 = C2301oY.A00(enumC2303oaA00, this.A0B);
        InterfaceC1640df interfaceC1640dfA0F = this.A0B.A0F();
        String strName = enumC2303oaA00.name();
        String browseUrl2 = enumC2299oWA00.name();
        interfaceC1640dfA0F.A5G(strName, browseUrl2);
        if (enumC2299oWA00 == EnumC2299oW.A03 && A0J(strA09, view, view2)) {
            InterfaceC1640df interfaceC1640dfA0F2 = this.A0B.A0F();
            String strName2 = EnumC2299oW.A03.name();
            String browseUrl3 = A0F[1];
            if (browseUrl3.length() == 21) {
                throw new RuntimeException();
            }
            A0F[0] = "eb2FCQpi0JJdWiGAwUDg2";
            interfaceC1640dfA0F2.A5F(strName2);
            return true;
        }
        A0A();
        F4 webView = this.A05;
        String[] strArr = A0F;
        String str3 = strArr[2];
        String browseUrl4 = strArr[3];
        if (str3.length() == browseUrl4.length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0F;
        strArr2[5] = "vXWiLp3qbUORmgVUBDsI011627OlAaPQ";
        strArr2[7] = "NqclEFzSQX";
        if (webView != null) {
            webView.loadUrl(strA09);
        }
        A0H(view, view2);
        InterfaceC1640df interfaceC1640dfA0F3 = this.A0B.A0F();
        String browseUrl5 = EnumC2299oW.A05.name();
        interfaceC1640dfA0F3.A5F(browseUrl5);
        return true;
    }
}
