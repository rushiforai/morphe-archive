package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.v3, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2701v3 {
    public static byte[] A0O;
    public static String[] A0P = {"Qyv3hMywYzE", "6oWUxlAGbJMvjt7T925N6hAsD7mKtG3m", "a9aeVgNHaEAoSaJHixC1", "FwJftv30R9N88UDR0eGgkHDHkb5rNS7i", "lRkn6D3F716lGk9KqsTCAJwtqt7RhOud", "8HHmy0e1oLgUUo4zGZAk", "eMIrUwk6iWFnLW", "qrJ4IKon5nfZZhm4V6uG8DHKw06I8Wzz"};
    public C2566ss A08;
    public C2566ss A09;
    public ViewOnClickListenerC0884El A0A;
    public boolean A0B;
    public boolean A0C;
    public boolean A0E;
    public final int A0F;
    public final LA A0G;
    public final C1731fA A0H;
    public final C1742fL A0I;
    public final C1747fQ A0J;
    public final C0958Hi A0K;
    public final C2232nO A0L;
    public final InterfaceC2459r9 A0M;
    public final EnumC2275o7 A0N;
    public int A03 = 16;
    public int A02 = 12;
    public int A01 = 10;
    public int A04 = 20;
    public int A05 = 40;
    public int A06 = 52;
    public int A00 = 10;
    public int A07 = 8;
    public boolean A0D = true;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0O, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 67);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A0O = new byte[]{111, 116, 124, 124, 124, 124, 124, 124, 124, 30, 123, 123, 13, 13, 13, 13, 13, 13, 100, 104, 106, 41, 97, 102, 100, 98, 101, 104, 104, 108, 41, 102, 99, 116, 41, 110, 105, 115, 98, 117, 116, 115, 110, 115, 110, 102, 107, 41, 97, 110, 105, 110, 116, 111, 88, 102, 100, 115, 110, 113, 110, 115, 126, 11, 19, 17, 8};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final View A0F(ViewOnClickListenerC0884El viewOnClickListenerC0884El, ImageView imageView) {
        ImageView imageViewA02 = imageView;
        this.A0A = viewOnClickListenerC0884El;
        if (this.A0A != null) {
            this.A0A.A0G(this.A0G.A32().A0K());
        }
        this.A0B = imageViewA02 != null;
        FrameLayout frameLayout = new FrameLayout(this.A0K);
        frameLayout.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        C2667uV c2667uV = new C2667uV(this.A0K, this.A0H.A01(), true, false, false);
        String strA1n = this.A0G.A1n();
        String strA0H = this.A0I.A0H();
        if (strA1n == null || strA1n.isEmpty()) {
            strA1n = this.A0I.A0F().toLowerCase(Locale.getDefault());
        }
        c2667uV.A04(strA0H, strA1n, null, false, false);
        c2667uV.setAlignment(17);
        c2667uV.setTitleTextSize(A0D() ? 30 : 28);
        if (A0P[0].length() == 30) {
            throw new RuntimeException();
        }
        A0P[4] = "pDhzlxnIx13kRFgPhmccchsWDk3Xlymd";
        c2667uV.setDescriptionTextSize(A0D() ? 15 : 13);
        c2667uV.A02();
        c2667uV.setPadding(this.A05, 0, this.A05, 0);
        AbstractC2426qc.A0H(1111, c2667uV);
        LinearLayout linearLayout = new LinearLayout(this.A0K);
        linearLayout.setClickable(true);
        if (C2203mv.A1C(this.A0K)) {
            linearLayout.setOnClickListener(new ViewOnClickListenerC2699v1(this, viewOnClickListenerC0884El));
        }
        linearLayout.setPadding(0, -this.A04, 0, 0);
        linearLayout.setOrientation(1);
        linearLayout.setGravity(17);
        if (A0D()) {
            imageViewA02 = A02();
        }
        if (imageViewA02 != null) {
            if (imageViewA02.getParent() != null) {
                ((ViewGroup) imageViewA02.getParent()).removeView(imageViewA02);
            }
            linearLayout.addView(imageViewA02);
        }
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(0, this.A03, 0, this.A07);
        linearLayout.addView(c2667uV, layoutParams);
        TextView textViewA01 = A01();
        if (textViewA01 != null) {
            new LinearLayout.LayoutParams(-2, -2).setMargins(0, this.A07, 0, this.A03);
            linearLayout.addView(textViewA01);
        }
        if (viewOnClickListenerC0884El != null) {
            A0B(viewOnClickListenerC0884El);
            linearLayout.addView(viewOnClickListenerC0884El, layoutParams);
            if (TextUtils.isEmpty(viewOnClickListenerC0884El.getText())) {
                AbstractC2426qc.A0I(viewOnClickListenerC0884El);
            }
        }
        linearLayout.setAlpha(1.0f);
        A06(frameLayout);
        frameLayout.addView(linearLayout);
        A0A(frameLayout, viewOnClickListenerC0884El);
        LA la2 = this.A0G;
        if (A0P[1].charAt(10) == 'W') {
            throw new RuntimeException();
        }
        A0P[3] = "fD2T1Ve1WjePiWnkkw6aRP2HYHtz3klq";
        if (la2.A3F()) {
            A07(frameLayout);
        }
        LA la3 = this.A0G;
        if (A0P[4].charAt(31) != 'd') {
            throw new RuntimeException();
        }
        A0P[7] = "bWL7PPSN5wk6yhEerI4fo10dnRMJ9G0K";
        if (la3.A3U()) {
            A09(frameLayout);
        } else if (this.A0G.A3T()) {
            A08(frameLayout);
        }
        return frameLayout;
    }

    static {
        A05();
    }

    public C2701v3(C0958Hi c0958Hi, LA la2, C2232nO c2232nO, Handler handler, InterfaceC2459r9 interfaceC2459r9) {
        this.A0K = c0958Hi;
        this.A0M = interfaceC2459r9;
        this.A0I = la2.A32().A0J();
        this.A0J = la2.A32().A0L();
        this.A0H = la2.A31();
        this.A0E = la2.A3R();
        this.A0C = la2.A3N();
        this.A0F = AbstractC1856hD.A00(c0958Hi.getResources().getDisplayMetrics());
        this.A0L = c2232nO;
        this.A0G = la2;
        A04();
        this.A0N = EnumC2275o7.A00(this.A0G.A1a());
    }

    private ImageView A00(final ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        Bitmap scaledBitmap = Bitmap.createScaledBitmap(AbstractC2438qo.A01(EnumC2437qn.OTHER_SKIP), AbstractC2383pv.A0e, AbstractC2383pv.A0e, true);
        ImageView imageView = new ImageView(this.A0K);
        imageView.setImageBitmap(scaledBitmap);
        imageView.setColorFilter(-1);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        gradientDrawable.setColor(Color.parseColor(A03(0, 9, 15)));
        imageView.setBackground(gradientDrawable);
        imageView.setPadding(AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y);
        imageView.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.v0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                C2701v3.A0C(viewOnClickListenerC0884El, view);
            }
        });
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(AbstractC2383pv.A0H, AbstractC2383pv.A0H, 8388661);
        layoutParams.setMargins(0, 0, 0, 0);
        imageView.setLayoutParams(layoutParams);
        imageView.setVisibility(0);
        return imageView;
    }

    private TextView A01() {
        if (TextUtils.isEmpty(this.A0G.A32().A0J().A09())) {
            return null;
        }
        TextView textView = new TextView(this.A0K);
        textView.setText(this.A0G.A32().A0J().A09());
        textView.setTextColor(-1);
        textView.setTextSize(13.0f);
        textView.setGravity(17);
        return textView;
    }

    private C2661uP A02() {
        C2661uP c2661uP = new C2661uP(this.A0K);
        AbstractC2426qc.A0O(c2661uP, 0);
        c2661uP.setFullCircleCorners(true);
        c2661uP.setLayoutParams(new RelativeLayout.LayoutParams(AbstractC2383pv.A04, AbstractC2383pv.A04));
        AbstractC2426qc.A0L(c2661uP);
        new AsyncTaskC0892Et(c2661uP, this.A0K).A04().A07(this.A0G.A35().A01());
        return c2661uP;
    }

    private void A04() {
        this.A03 *= this.A0F;
        this.A02 *= this.A0F;
        this.A01 *= this.A0F;
        this.A04 *= this.A0F;
        this.A05 *= this.A0F;
        this.A06 *= this.A0F;
        this.A00 *= this.A0F;
        this.A07 *= this.A0F;
    }

    private void A06(FrameLayout frameLayout) {
        if (A0D()) {
            return;
        }
        View view = new View(this.A0K);
        view.setBackgroundColor(Color.parseColor(A03(9, 9, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE)));
        view.setAlpha(0.8f);
        frameLayout.addView(view, new FrameLayout.LayoutParams(-1, -1));
    }

    private void A07(FrameLayout frameLayout) {
        FrameLayout frameLayout2 = new FrameLayout(this.A0K);
        this.A08 = AbstractC2571sx.A01(this.A0K, false, this.A0G, this.A0L, this.A0M, EnumC2569sv.A02, AbstractC2568su.A00(this.A0G));
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2, 8388693);
        layoutParams.setMargins(0, 0, A0D() ? AbstractC2383pv.A0n : this.A04, this.A03);
        C2566ss c2566ss = this.A08;
        if (A0P[6].length() == 4) {
            throw new RuntimeException();
        }
        A0P[4] = "X4E1HHP8EOGrpb4P0nkOSG6f0olRcDrd";
        frameLayout2.addView(c2566ss, layoutParams);
        frameLayout.addView(frameLayout2);
    }

    private void A08(FrameLayout frameLayout) {
        FrameLayout frameLayout2 = new FrameLayout(this.A0K);
        this.A09 = AbstractC2571sx.A01(this.A0K, false, this.A0G, this.A0L, this.A0M, EnumC2569sv.A02, EnumC2572sy.A04);
        AbstractC2426qc.A0L(this.A09);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2, 8388691);
        layoutParams.setMargins(this.A04, 0, 0, this.A03);
        frameLayout2.addView(this.A09, layoutParams);
        frameLayout.addView(frameLayout2);
    }

    private void A09(FrameLayout frameLayout) {
        FrameLayout frameLayout2 = new FrameLayout(this.A0K);
        C2570sw c2570swA02 = AbstractC2571sx.A02(this.A0K, EnumC2569sv.A02, this.A0G);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2, 8388691);
        layoutParams.setMargins(A0D() ? AbstractC2383pv.A0n : this.A04, 0, 0, this.A03);
        frameLayout2.addView(c2570swA02, layoutParams);
        frameLayout.addView(frameLayout2);
    }

    private void A0A(FrameLayout frameLayout, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        FrameLayout frameLayout2 = new FrameLayout(this.A0K);
        frameLayout2.setPadding(0, this.A06, this.A02, this.A02);
        if (this.A0E) {
            frameLayout2.setOnClickListener(new ViewOnClickListenerC2700v2(this, viewOnClickListenerC0884El));
        }
        Bitmap bitmap = Bitmap.createScaledBitmap(AbstractC2438qo.A01(EnumC2437qn.NAV_CROSS), AbstractC2383pv.A0e, AbstractC2383pv.A0e, true);
        ImageView imageView = new ImageView(this.A0K);
        AbstractC2426qc.A0H(1002, imageView);
        imageView.setImageBitmap(bitmap);
        imageView.setColorFilter(-1);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        gradientDrawable.setColor(Color.parseColor(A03(0, 9, 15)));
        imageView.setBackground(gradientDrawable);
        imageView.setPadding(AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(AbstractC2383pv.A0H, AbstractC2383pv.A0H, 8388661);
        layoutParams.setMargins(0, 0, 0, 0);
        imageView.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.uz
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.A00.A0I(view);
            }
        });
        long jA00 = this.A0J.A00();
        if (this.A0B) {
            jA00 = this.A0J.A01();
        }
        if (this.A0D && jA00 > 0) {
            View viewA00 = null;
            if (A0P[6].length() == 4) {
                throw new RuntimeException();
            }
            A0P[4] = "noxhdgHBYesZByvARmcIWYELyQSiTkUd";
            if (this.A0C && viewOnClickListenerC0884El != null) {
                viewA00 = A00(viewOnClickListenerC0884El);
                frameLayout2.addView(viewA00);
            }
            AbstractC1856hD.A01(this.A0K, imageView, jA00, viewA00);
        }
        frameLayout2.addView(imageView, layoutParams);
        if (!this.A0D) {
            imageView.setVisibility(8);
        }
        frameLayout.addView(frameLayout2, new FrameLayout.LayoutParams(-1, -2, 48));
    }

    private void A0B(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(13);
        if (A0D()) {
            viewOnClickListenerC0884El.setPadding(AbstractC2383pv.A0P, AbstractC2383pv.A06, AbstractC2383pv.A0P, AbstractC2383pv.A06);
            viewOnClickListenerC0884El.setTypeface(viewOnClickListenerC0884El.getTypeface(), 1);
            this.A00 = 32;
        } else {
            viewOnClickListenerC0884El.setPadding(this.A04, this.A03, this.A04, this.A03);
        }
        viewOnClickListenerC0884El.setTextSize(A0D() ? 16.0f : 14.0f);
        viewOnClickListenerC0884El.A0D();
        viewOnClickListenerC0884El.setIncludeFontPadding(true);
        viewOnClickListenerC0884El.setLayoutParams(layoutParams);
        viewOnClickListenerC0884El.setTextColor(-16777216);
        AbstractC2426qc.A0W(viewOnClickListenerC0884El, AbstractC2426qc.A06(-1, this.A00));
        viewOnClickListenerC0884El.setId(View.generateViewId());
        if (viewOnClickListenerC0884El.getParent() != null) {
            ((ViewGroup) viewOnClickListenerC0884El.getParent()).removeView(viewOnClickListenerC0884El);
        }
    }

    public static /* synthetic */ void A0C(ViewOnClickListenerC0884El viewOnClickListenerC0884El, View view) {
        viewOnClickListenerC0884El.A0E(A03(63, 4, 59));
        viewOnClickListenerC0884El.setVisibility(4);
    }

    private boolean A0D() {
        return this.A0N == EnumC2275o7.A07;
    }

    public final View A0E(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        if (viewOnClickListenerC0884El != null) {
            viewOnClickListenerC0884El.setV2Design(true);
        }
        if (A0P[7].charAt(24) == 'd') {
            throw new RuntimeException();
        }
        A0P[0] = "o9BXxAxcaY6k";
        return A0F(viewOnClickListenerC0884El, null);
    }

    public final ViewOnClickListenerC0884El A0G() {
        return this.A0A;
    }

    public final void A0H() {
        if (this.A08 != null) {
            this.A08.A0O();
        }
        if (this.A09 != null) {
            this.A09.A0O();
        }
    }

    public final /* synthetic */ void A0I(View view) {
        this.A0K.A0F().ABl();
        this.A0M.A5C(A03(18, 45, 68));
    }

    public final void A0J(boolean z11) {
        if (!z11 && this.A08 != null) {
            this.A08.A0P();
        }
        if (this.A09 != null) {
            this.A09.A0P();
        }
    }

    public final void A0K(boolean z11) {
        this.A0D = z11;
    }
}
