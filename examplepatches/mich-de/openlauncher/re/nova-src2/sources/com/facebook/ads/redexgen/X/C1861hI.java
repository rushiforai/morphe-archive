package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.os.Handler;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.hI, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1861hI {
    public static byte[] A0n;
    public static String[] A0o = {"tcfXpaWAVkoQ2BNjYJNJsoFSM2", "creEdCM", "wDroJIJ", "aIq45EPfSvmmcYKahwQmQmbYWTVCxHWT", "be3NMLJl6ooSZid2rv", "2UYX2PQ", "thIIrzB4nRx1mczinnGRYVZEy7VAX2va", "ZYUKwomLReyh0D"};
    public ImageView A0M;
    public ImageView A0N;
    public LinearLayout A0O;
    public RelativeLayout A0P;
    public TextView A0Q;
    public TextView A0R;
    public C7O A0S;
    public C2566ss A0T;
    public C2566ss A0U;
    public C2570sw A0V;
    public C2661uP A0W;
    public C2701v3 A0X;
    public final Handler A0b;
    public final FrameLayout A0c;
    public final LA A0d;
    public final C1731fA A0e;
    public final C1742fL A0f;
    public final C1747fQ A0g;
    public final C1756fZ A0h;
    public final C0958Hi A0i;
    public final C2232nO A0j;
    public final InterfaceC2459r9 A0k;
    public final ViewOnClickListenerC0884El A0l;
    public int A06 = 160;
    public int A07 = Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE;
    public int A03 = 56;
    public int A04 = 430;
    public int A0K = 110;
    public int A0L = 70;
    public int A0A = 120;
    public int A0G = 48;
    public int A0F = 44;
    public int A0D = 24;
    public int A0C = 20;
    public int A0B = 16;
    public int A09 = 12;
    public int A08 = 10;
    public int A0H = 8;
    public int A0E = 4;
    public int A0J = 530;
    public int A0I = 300;
    public int A05 = Sdk.SDKError.Reason.AD_RESPONSE_RETRY_AFTER_VALUE;
    public boolean A0Y = false;
    public final AtomicBoolean A0m = new AtomicBoolean(false);
    public int A00 = 0;
    public int A02 = 0;
    public int A01 = this.A06;
    public boolean A0Z = true;
    public final int A0a = Math.max(1, (int) AbstractC2385px.A02);

    public static String A0H(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0n, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 38);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0M() {
        A0n = new byte[]{97, 111, AbstractJsonLexerKt.TC_INVALID, 111, AbstractJsonLexerKt.TC_INVALID, 111, AbstractJsonLexerKt.TC_INVALID, -98, -77, -85, -85, -85, -85, -85, -85, -85, -36, -23, -38, -36, -34, -17, -28, -15, -28, -17, -12, -90, -78, -80, 113, -87, -92, -90, -88, -91, -78, -78, -82, 113, -92, -89, -74, 113, -84, -79, -73, -88, -75, -74, -73, -84, -73, -84, -92, -81, 113, -87, -84, -79, -84, -74, -85, -94, -92, -90, -73, -84, -71, -84, -73, -68, -90, -81, -91, -124, -94, -77, -91, -105, 115, -108, -92, -77, -90, -90, -81, -76, -87, -80, -75, -109, -90, -92, -70, -92, -83, -90, -77, -126, -91, -94, -79, -75, -90, -77, 97, -86, -76, 97, -81, -74, -83, -83, -68, -76, -78, -71};
    }

    static {
        A0M();
    }

    public C1861hI(final C0958Hi c0958Hi, LA la2, InterfaceC2459r9 interfaceC2459r9, ViewOnClickListenerC0884El viewOnClickListenerC0884El, Handler handler, C2232nO c2232nO) {
        this.A0i = c0958Hi;
        this.A0d = la2;
        this.A0j = c2232nO;
        this.A0h = la2.A35();
        this.A0g = la2.A32().A0L();
        this.A0k = interfaceC2459r9;
        this.A0b = handler;
        this.A0f = la2.A32().A0J();
        this.A0e = la2.A31();
        this.A0l = viewOnClickListenerC0884El;
        this.A0S = new C7O(c0958Hi) { // from class: com.facebook.ads.redexgen.X.3h
            @Override // com.facebook.ads.redexgen.X.C7O, android.view.ViewGroup
            public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
                return false;
            }

            @Override // com.facebook.ads.redexgen.X.C7O, android.view.View
            public final boolean onTouchEvent(MotionEvent motionEvent) {
                return false;
            }
        };
        this.A0P = new RelativeLayout(c0958Hi);
        this.A0W = new C2661uP(c0958Hi);
        this.A0R = new TextView(c0958Hi);
        this.A0M = new ImageView(c0958Hi);
        this.A0c = new FrameLayout(this.A0i);
        A0K();
        if (this.A0l != null) {
            AbstractC2426qc.A0H(1001, this.A0l);
        }
    }

    public static int A00(int i5) {
        if (AbstractC1841gx.A01(i5, -1) >= 4.5d) {
            return -1;
        }
        return -16777216;
    }

    private FrameLayout.LayoutParams A01() {
        if (this.A0i.getResources().getConfiguration().orientation == 2) {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
            int i5 = this.A0L;
            int orientation = this.A0C;
            layoutParams.setMargins(0, i5, 0, orientation);
            return layoutParams;
        }
        int orientation2 = this.A0Y ? this.A0I : this.A0J;
        FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(-1, orientation2);
        int orientation3 = this.A0K;
        layoutParams2.setMargins(0, orientation3, 0, 0);
        return layoutParams2;
    }

    private FrameLayout.LayoutParams A02() {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(AbstractC2383pv.A0H, AbstractC2383pv.A0H, 8388661);
        layoutParams.setMargins(0, this.A0G, this.A09, 0);
        return layoutParams;
    }

    private ImageView A03() {
        Bitmap scaledBitmap = Bitmap.createScaledBitmap(AbstractC2438qo.A01(EnumC2437qn.OTHER_SKIP), AbstractC2383pv.A0e, AbstractC2383pv.A0e, true);
        ImageView imageView = new ImageView(this.A0i);
        imageView.setImageBitmap(scaledBitmap);
        imageView.setColorFilter(-1);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        gradientDrawable.setColor(Color.parseColor(A0H(7, 9, 85)));
        imageView.setBackground(gradientDrawable);
        imageView.setPadding(AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y);
        imageView.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.hP
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.A00.A0b(view);
            }
        });
        if (this.A0l != null && this.A0l.getCtaActionHelper().A07() == null) {
            this.A0l.getCtaActionHelper().A09(new InterfaceC1699ed() { // from class: com.facebook.ads.redexgen.X.Bv
                @Override // com.facebook.ads.redexgen.X.InterfaceC1699ed
                public final void ADg() {
                    this.A00.A0Z();
                }
            });
        }
        imageView.setLayoutParams(A02());
        imageView.setVisibility(0);
        return imageView;
    }

    private LinearLayout.LayoutParams A04() {
        int marginTop = this.A0i.getResources().getConfiguration().orientation;
        int height = -1;
        int width = -2;
        int i5 = 0;
        if (marginTop == 2) {
            height = this.A04;
            width = -2;
            i5 = this.A0B;
        }
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(height, width);
        layoutParams.gravity = 81;
        int height2 = this.A0B;
        int width2 = this.A0B;
        layoutParams.setMargins(height2, i5, width2, 0);
        return layoutParams;
    }

    private LinearLayout A05() {
        LinearLayout linearLayout = new LinearLayout(this.A0i);
        linearLayout.setOrientation(1);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -1);
        linearLayout.setClipChildren(false);
        linearLayout.setClipToPadding(false);
        linearLayout.setGravity(80);
        linearLayout.setLayoutParams(layoutParams);
        return linearLayout;
    }

    private LinearLayout A06() {
        String strA0A;
        LinearLayout linearLayout = new LinearLayout(this.A0i);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(17);
        if (this.A0f.A0D().isEmpty() && !this.A0g.A07()) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        if (!this.A0f.A0D().isEmpty()) {
            arrayList.add(new C1834gq(this.A0i).A01(new C2651uF(this.A0i, -1, -1, EnumC2437qn.RATINGS)).A03(this.A0f.A0D()).A02(this.A0f.A0C()));
        }
        if (this.A0g.A08() && !this.A0f.A07().isEmpty()) {
            C1742fL c1742fL = this.A0f;
            String[] strArr = A0o;
            if (strArr[5].length() != strArr[2].length()) {
                throw new RuntimeException();
            }
            A0o[7] = "f4qazDhyphTHhR";
            strA0A = c1742fL.A07();
        } else if (!this.A0f.A0A().isEmpty()) {
            try {
                strA0A = AbstractC2395q7.A01(Integer.parseInt(this.A0f.A0A()));
            } catch (NumberFormatException unused) {
                strA0A = this.A0f.A0A();
            }
        } else {
            strA0A = A0H(0, 0, 38);
        }
        if (!strA0A.isEmpty()) {
            arrayList.add(new C1834gq(this.A0i).A01(new C2651uF(this.A0i, -1, -1, EnumC2437qn.NUCLEUS_GROUP)).A03(strA0A).A02(this.A0f.A0B()));
        }
        if (!this.A0f.A05().isEmpty()) {
            arrayList.add(new C1834gq(this.A0i).A01(new C2651uF(this.A0i, -1, -1, EnumC2437qn.DOWNLOAD)).A03(this.A0f.A05()).A02(this.A0f.A06()));
        }
        if (!this.A0f.A01().isEmpty()) {
            arrayList.add(new C1834gq(this.A0i).A01(new C2651uF(this.A0i, -1, -1, EnumC2437qn.NUCLEUS_DURATION)).A03(this.A0f.A01()).A02(this.A0f.A0E()));
        }
        if (!this.A0f.A02().isEmpty()) {
            arrayList.add(new C1834gq(this.A0i).A01(new C2651uF(this.A0i, -1, -1, EnumC2437qn.GRID_4)).A03(this.A0f.A02()).A02(this.A0f.A03()));
        }
        for (int i5 = 0; i5 < Math.min(3, arrayList.size()); i5++) {
            linearLayout.addView((View) arrayList.get(i5));
        }
        linearLayout.setId(View.generateViewId());
        return linearLayout;
    }

    private LinearLayout A07(RelativeLayout relativeLayout, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        LinearLayout linearLayout = new LinearLayout(this.A0i);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(17);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(3, viewOnClickListenerC0884El.getId());
        layoutParams.addRule(14);
        layoutParams.setMargins(0, this.A0H, 0, 0);
        linearLayout.setLayoutParams(layoutParams);
        TextView textView = new TextView(this.A0i);
        textView.setText(this.A0f.A08());
        textView.setTextSize(10.0f);
        linearLayout.setId(View.generateViewId());
        C2651uF iconView = new C2651uF(this.A0i, -1, -1, EnumC2437qn.GOOGLE_PLAY_STORE);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(this.A09, this.A09);
        layoutParams2.rightMargin = this.A0E;
        iconView.setLayoutParams(layoutParams2);
        iconView.setAlpha(0.5f);
        linearLayout.addView(iconView);
        linearLayout.addView(textView);
        relativeLayout.addView(linearLayout);
        return linearLayout;
    }

    private RelativeLayout.LayoutParams A08(LinearLayout linearLayout) {
        int i5;
        int i11 = this.A0i.getResources().getConfiguration().orientation;
        if (linearLayout == null || this.A0Y || i11 == 2) {
            int orientation = this.A01;
            i5 = (-orientation) / 4;
        } else {
            int i12 = this.A01;
            String[] strArr = A0o;
            String str = strArr[6];
            String str2 = strArr[3];
            int topMargin = str.charAt(26);
            int orientation2 = str2.charAt(26);
            if (topMargin != orientation2) {
                throw new RuntimeException();
            }
            A0o[7] = "oVxYG9ybqO9nsq";
            i5 = (-i12) / 2;
        }
        int i13 = this.A01;
        int orientation3 = this.A01;
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(i13, orientation3);
        layoutParams.setMargins(0, i5, 0, 0);
        layoutParams.addRule(14);
        return layoutParams;
    }

    private RelativeLayout.LayoutParams A09(LinearLayout linearLayout, TextView textView) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(14);
        if (this.A0l != null) {
            this.A0l.setTextColor(A00(this.A0e.A01().A04()));
            AbstractC2426qc.A0W(this.A0l, AbstractC2426qc.A06(this.A0e.A01().A04(), 40));
        }
        if (linearLayout != null) {
            layoutParams.addRule(3, linearLayout.getId());
            layoutParams.setMargins(this.A0B, this.A0D + this.A00 + this.A02, this.A0B, 0);
        } else {
            layoutParams.addRule(3, textView.getId());
            layoutParams.setMargins(this.A0B, this.A0A + this.A00 + this.A02, this.A0B, 0);
        }
        return layoutParams;
    }

    private RelativeLayout.LayoutParams A0A(TextView textView) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(14);
        layoutParams.setMargins(0, this.A0D + this.A02, 1, 0);
        layoutParams.addRule(3, textView.getId());
        return layoutParams;
    }

    private RelativeLayout.LayoutParams A0B(C2661uP c2661uP) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(14);
        layoutParams.addRule(3, c2661uP.getId());
        layoutParams.setMargins(this.A0B, this.A0D + this.A02, this.A0B, 0);
        return layoutParams;
    }

    private RelativeLayout A0C() {
        RelativeLayout relativeLayout = new RelativeLayout(this.A0i);
        LinearLayout.LayoutParams layoutParams = A04();
        relativeLayout.setClipChildren(false);
        relativeLayout.setLayoutParams(layoutParams);
        relativeLayout.setId(View.generateViewId());
        return relativeLayout;
    }

    private TextView A0D(RelativeLayout relativeLayout, TextView textView) {
        if (TextUtils.isEmpty(this.A0d.A32().A0J().A09())) {
            return null;
        }
        TextView textView2 = new TextView(this.A0i);
        textView2.setText(this.A0d.A32().A0J().A09());
        textView2.setTextColor(-855638017);
        textView2.setMaxLines(1);
        textView2.setEllipsize(TextUtils.TruncateAt.END);
        textView2.setTypeface(Typeface.DEFAULT);
        textView2.setTextSize(12.0f);
        textView2.setTextAlignment(4);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(14);
        layoutParams.addRule(3, textView.getId());
        textView2.setLayoutParams(layoutParams);
        layoutParams.setMargins(0, AbstractC2383pv.A0y, 0, 0);
        relativeLayout.addView(textView2);
        AbstractC2426qc.A0L(textView2);
        return textView2;
    }

    private TextView A0E(RelativeLayout relativeLayout, C2661uP c2661uP) {
        TextView textView = new TextView(this.A0i);
        textView.setText(this.A0f.A0H());
        textView.setTextColor(-1);
        textView.setMaxLines(2);
        textView.setEllipsize(TextUtils.TruncateAt.END);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        textView.setTextSize(30.0f);
        textView.setTextAlignment(4);
        textView.setLayoutParams(A0B(c2661uP));
        relativeLayout.addView(textView);
        textView.setId(View.generateViewId());
        return textView;
    }

    private C2661uP A0G(LinearLayout linearLayout) {
        C2661uP c2661uP = new C2661uP(this.A0i);
        c2661uP.setRadius(30);
        AbstractC2426qc.A0O(c2661uP, 0);
        AsyncTaskC0892Et downloadImageTask = new AsyncTaskC0892Et(c2661uP, this.A0i).A04();
        downloadImageTask.A07(this.A0h.A01());
        c2661uP.setLayoutParams(A08(linearLayout));
        c2661uP.setId(View.generateViewId());
        return c2661uP;
    }

    private void A0I() {
        Bitmap scaledBitmap;
        final boolean zA06 = this.A0g.A06();
        if (zA06) {
            scaledBitmap = AbstractC2438qo.A01(EnumC2437qn.SKIP_ARROW_APP_INSTALL);
        } else {
            scaledBitmap = AbstractC2438qo.A01(EnumC2437qn.NAV_CROSS);
        }
        Bitmap scaledBitmap2 = Bitmap.createScaledBitmap(scaledBitmap, AbstractC2383pv.A0e, AbstractC2383pv.A0e, true);
        this.A0M = new ImageView(this.A0i);
        AbstractC2426qc.A0H(1002, this.A0M);
        this.A0M.setImageBitmap(scaledBitmap2);
        this.A0M.setColorFilter(-1);
        GradientDrawable circleBackground = new GradientDrawable();
        circleBackground.setShape(1);
        circleBackground.setColor(Color.parseColor(A0H(7, 9, 85)));
        this.A0M.setBackground(circleBackground);
        this.A0M.setPadding(AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y);
        this.A0M.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.hQ
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.A00.A0g(zA06, view);
            }
        });
        this.A0M.setLayoutParams(A02());
        this.A0c.addView(this.A0M);
        boolean shouldShowThirdEndCard = this.A0Z;
        if (!shouldShowThirdEndCard) {
            this.A0M.setVisibility(8);
        }
        this.A0N = null;
        boolean shouldShowThirdEndCard2 = this.A0Z;
        if (shouldShowThirdEndCard2 && this.A0g.A00() > 0) {
            boolean shouldShowThirdEndCard3 = this.A0d.A3N();
            if (shouldShowThirdEndCard3) {
                this.A0N = A03();
                this.A0c.addView(this.A0N);
            }
            AbstractC1856hD.A01(this.A0i, this.A0M, this.A0g.A00(), this.A0N);
        }
    }

    private void A0J() {
        if (this.A0l != null) {
            A0T(this.A0P, this.A0l, this.A0O, this.A0Q != null ? this.A0Q : this.A0R);
            LinearLayout linearLayoutA07 = A07(this.A0P, this.A0l);
            if (this.A0d.A3F()) {
                A0Q(this.A0P, linearLayoutA07, this.A0l);
            }
            if (this.A0d.A3U()) {
                A0S(this.A0P, linearLayoutA07, this.A0l);
            } else {
                if (!this.A0d.A3T()) {
                    return;
                }
                A0R(this.A0P, linearLayoutA07, this.A0l);
            }
        }
    }

    private void A0K() {
        this.A0J *= this.A0a;
        this.A0I *= this.A0a;
        this.A05 *= this.A0a;
        this.A0K *= this.A0a;
        this.A0L *= this.A0a;
        this.A06 *= this.A0a;
        this.A01 *= this.A0a;
        this.A07 *= this.A0a;
        this.A03 *= this.A0a;
        this.A04 *= this.A0a;
        this.A0A *= this.A0a;
        this.A0G *= this.A0a;
        this.A0F *= this.A0a;
        this.A0D *= this.A0a;
        this.A0C *= this.A0a;
        this.A0B *= this.A0a;
        this.A09 *= this.A0a;
        this.A08 *= this.A0a;
        this.A0H *= this.A0a;
        this.A0E *= this.A0a;
    }

    private void A0L() {
        ViewParent parent = this.A0c.getParent();
        boolean z11 = parent instanceof ViewGroup;
        String strA0H = A0H(27, 45, 29);
        if (!z11) {
            this.A0k.A5C(strA0H);
            return;
        }
        ((ViewGroup) parent).removeView(this.A0c);
        ViewParent parent2 = parent.getParent();
        if (A0o[4].length() == 28) {
            throw new RuntimeException();
        }
        A0o[7] = "bBqwAbij60vazk";
        if (parent2 instanceof ViewGroup) {
            this.A0m.set(true);
            this.A0X = new C2701v3(this.A0i, this.A0d, this.A0j, this.A0b, this.A0k);
            ((ViewGroup) parent.getParent()).addView(this.A0X.A0F(this.A0l, this.A0W));
            return;
        }
        this.A0k.A5C(strA0H);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: A0N, reason: merged with bridge method [inline-methods] */
    public final void A0Z() {
        AbstractC2426qc.A0K(this.A0N);
        this.A0d.A3D(false);
        this.A0d.A32().A0N(-1);
    }

    private void A0O(View view, int i5, float[] fArr) {
        RoundRectShape roundRectShape = new RoundRectShape(fArr, null, null);
        ShapeDrawable shapeDrawable = new ShapeDrawable(roundRectShape);
        shapeDrawable.getPaint().setColor(i5);
        view.setBackground(shapeDrawable);
    }

    private void A0P(RelativeLayout relativeLayout) {
        A0O(relativeLayout, Color.argb(230, 13, 13, 13), new float[]{100.0f, 100.0f, 100.0f, 100.0f, 0.0f, 0.0f, 0.0f, 0.0f});
    }

    private void A0Q(RelativeLayout relativeLayout, LinearLayout linearLayout, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        this.A0T = AbstractC2571sx.A01(this.A0i, false, this.A0d, this.A0j, this.A0k, EnumC2569sv.A02, AbstractC2568su.A00(this.A0d));
        AbstractC2426qc.A0H(1116, this.A0T);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(0, this.A0B, 0, this.A0B);
        layoutParams.addRule(7, viewOnClickListenerC0884El.getId());
        layoutParams.addRule(3, linearLayout.getId());
        this.A0T.setLayoutParams(layoutParams);
        relativeLayout.addView(this.A0T);
    }

    private void A0R(RelativeLayout relativeLayout, LinearLayout linearLayout, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        this.A0U = AbstractC2571sx.A01(this.A0i, false, this.A0d, this.A0j, this.A0k, EnumC2569sv.A02, EnumC2572sy.A04);
        AbstractC2426qc.A0L(this.A0U);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(0, this.A0H, 0, this.A0B);
        layoutParams.addRule(5, viewOnClickListenerC0884El.getId());
        layoutParams.addRule(3, linearLayout.getId());
        this.A0U.setLayoutParams(layoutParams);
        relativeLayout.addView(this.A0U);
    }

    private void A0S(RelativeLayout relativeLayout, LinearLayout linearLayout, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        this.A0V = AbstractC2571sx.A02(this.A0i, EnumC2569sv.A02, this.A0d);
        AbstractC2426qc.A0H(1117, this.A0V);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(0, this.A0B, 0, this.A0B);
        layoutParams.addRule(5, viewOnClickListenerC0884El.getId());
        layoutParams.addRule(3, linearLayout.getId());
        this.A0V.setLayoutParams(layoutParams);
        relativeLayout.addView(this.A0V);
    }

    private void A0T(RelativeLayout relativeLayout, ViewOnClickListenerC0884El viewOnClickListenerC0884El, LinearLayout linearLayout, TextView textView) {
        RelativeLayout.LayoutParams layoutParamsA09 = A09(linearLayout, textView);
        viewOnClickListenerC0884El.setIncludeFontPadding(false);
        viewOnClickListenerC0884El.setLayoutParams(layoutParamsA09);
        viewOnClickListenerC0884El.A0G(this.A0d.A32().A0K());
        viewOnClickListenerC0884El.A0D();
        viewOnClickListenerC0884El.setHeight(this.A03);
        viewOnClickListenerC0884El.setTextSize(18.0f);
        viewOnClickListenerC0884El.setCornerRadiusPx(40);
        viewOnClickListenerC0884El.setTextColor(A00(this.A0e.A01().A04()));
        AbstractC2426qc.A0W(viewOnClickListenerC0884El, AbstractC2426qc.A06(this.A0e.A01().A04(), 40));
        viewOnClickListenerC0884El.setId(View.generateViewId());
        if (viewOnClickListenerC0884El.getParent() != null) {
            ((ViewGroup) viewOnClickListenerC0884El.getParent()).removeView(viewOnClickListenerC0884El);
        }
        relativeLayout.addView(viewOnClickListenerC0884El);
    }

    private void A0U(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        this.A0S.setLayoutManager(new J7(this.A0i, 0, false));
        FrameLayout.LayoutParams screenshotsRecyclerViewParams = A01();
        this.A0S.setLayoutParams(screenshotsRecyclerViewParams);
        int i5 = 4;
        if (this.A0i.getResources().getConfiguration().orientation == 2) {
            i5 = 2;
        }
        this.A0S.setAdapter(new C0815Bu(this.A0i, this.A0g.A03(), this.A0H, this.A0S, viewOnClickListenerC0884El, i5));
    }

    private void A0V(final InterfaceC1863hK interfaceC1863hK) {
        final ImageView imageView = new ImageView(this.A0i);
        imageView.setAdjustViewBounds(true);
        AsyncTaskC0892Et asyncTaskC0892Et = new AsyncTaskC0892Et(imageView, this.A0i);
        if (!this.A0g.A03().isEmpty()) {
            asyncTaskC0892Et.A06(new InterfaceC2617th() { // from class: com.facebook.ads.redexgen.X.Bw
                @Override // com.facebook.ads.redexgen.X.InterfaceC2617th
                public final void AFA(C2616tg c2616tg) {
                    this.A02.A0c(imageView, interfaceC1863hK, c2616tg);
                }
            });
            asyncTaskC0892Et.A07(this.A0g.A03().get(0));
        } else {
            interfaceC1863hK.AFC();
        }
    }

    public final FrameLayout A0W() {
        this.A0c.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        int orientation = this.A0i.getResources().getConfiguration().orientation;
        if (orientation == 2) {
            int orientation2 = this.A07;
            this.A01 = orientation2;
        }
        View view = new View(this.A0i);
        view.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        int orientation3 = Color.parseColor(A0H(0, 7, 24));
        view.setBackgroundColor(orientation3);
        this.A0c.addView(view);
        final LinearLayout linearLayout = A05();
        this.A0P = A0C();
        if (C2203mv.A1C(this.A0i)) {
            this.A0P.setOnClickListener(new ViewOnClickListenerC1867hO(this));
        }
        A0P(this.A0P);
        this.A0O = A06();
        this.A0W = A0G(this.A0O);
        this.A0P.addView(this.A0W);
        this.A0R = A0E(this.A0P, this.A0W);
        this.A0Q = A0D(this.A0P, this.A0R);
        if (this.A0O != null) {
            this.A0O.setLayoutParams(A0A(this.A0Q != null ? this.A0Q : this.A0R));
            this.A0P.addView(this.A0O);
        }
        A0J();
        linearLayout.addView(this.A0P);
        if (this.A0d.A3R()) {
            View blackBackgroundView = new View(this.A0i);
            blackBackgroundView.setOnClickListener(new ViewOnClickListenerC1866hN(this));
            int orientation4 = this.A0i.getResources().getConfiguration().orientation;
            if (orientation4 == 2) {
                blackBackgroundView.setLayoutParams(new FrameLayout.LayoutParams(-1, this.A0L, 48));
            } else {
                blackBackgroundView.setLayoutParams(new FrameLayout.LayoutParams(-1, this.A0K, 48));
            }
            this.A0c.addView(blackBackgroundView);
        }
        A0I();
        this.A0c.addView(linearLayout);
        A0V(new InterfaceC1863hK() { // from class: com.facebook.ads.redexgen.X.Bx
            @Override // com.facebook.ads.redexgen.X.InterfaceC1863hK
            public final void AFC() {
                this.A01.A0d(linearLayout);
            }
        });
        if (this.A0j != null) {
            AbstractC2234nQ.A04(this.A0c, this.A0j, EnumC2231nN.A0S);
        }
        return this.A0c;
    }

    public final FrameLayout A0X() {
        return this.A0c;
    }

    public final void A0Y() {
        if (this.A0T != null) {
            this.A0T.A0O();
        }
        if (this.A0U != null) {
            this.A0U.A0P();
        }
        if (this.A0X != null) {
            this.A0X.A0H();
        }
    }

    public final void A0a(int i5) {
        if (!this.A0m.get()) {
            C0815Bu c0815Bu = (C0815Bu) this.A0S.getAdapter();
            if (c0815Bu == null) {
                this.A0i.A08().ABz(A0H(16, 11, 85), AbstractC2126lf.A0A, new C2127lg(A0H(72, 42, 27)));
            }
            if (this.A0l != null) {
                A09(this.A0O, this.A0Q != null ? this.A0Q : this.A0R);
            }
            if (i5 == 2) {
                this.A01 = this.A07;
                this.A00 = 0;
                if (c0815Bu != null) {
                    c0815Bu.A0Q(2);
                }
                if (this.A0d.A3F()) {
                    this.A02 = -this.A08;
                }
            } else {
                this.A02 = 0;
                this.A01 = this.A06;
                if (this.A0Y) {
                    this.A00 = this.A05;
                    if (this.A0d.A3F()) {
                        this.A00 = this.A05 - this.A0F;
                    }
                }
                if (c0815Bu != null) {
                    c0815Bu.A0Q(4);
                }
            }
            this.A0S.setLayoutParams(A01());
            this.A0P.setLayoutParams(A04());
            this.A0W.setLayoutParams(A08(this.A0O));
            this.A0R.setLayoutParams(A0B(this.A0W));
            if (this.A0O != null) {
                LinearLayout linearLayout = this.A0O;
                String[] strArr = A0o;
                if (strArr[5].length() != strArr[2].length()) {
                    throw new RuntimeException();
                }
                A0o[7] = "QjH4Dyqapqc4xU";
                linearLayout.setLayoutParams(A0A(this.A0Q != null ? this.A0Q : this.A0R));
            }
            if (this.A0l != null) {
                this.A0l.setLayoutParams(A09(this.A0O, this.A0Q != null ? this.A0Q : this.A0R));
            }
            this.A0M.setLayoutParams(A02());
        }
    }

    public final /* synthetic */ void A0b(View view) {
        if (this.A0l != null) {
            EnumC1698ec enumC1698ecA0E = this.A0l.A0E(A0H(114, 4, 35));
            if (this.A0d.A3H()) {
                return;
            }
            EnumC1698ec actionOutcome = EnumC1698ec.A08;
            if (enumC1698ecA0E != actionOutcome) {
                EnumC1698ec actionOutcome2 = EnumC1698ec.A05;
                if (enumC1698ecA0E != actionOutcome2) {
                    A0Z();
                }
            }
        }
    }

    public final /* synthetic */ void A0c(ImageView imageView, InterfaceC1863hK interfaceC1863hK, C2616tg c2616tg) {
        Drawable drawable = imageView.getDrawable();
        if (drawable != null) {
            int imageWidth = drawable.getIntrinsicWidth();
            if (imageWidth > drawable.getIntrinsicHeight()) {
                this.A0Y = true;
                C0958Hi c0958Hi = this.A0i;
                String[] strArr = A0o;
                String str = strArr[6];
                String str2 = strArr[3];
                int imageWidth2 = str.charAt(26);
                if (imageWidth2 != str2.charAt(26)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0o;
                strArr2[1] = "7Dev1L4";
                strArr2[0] = "dGLpy909iskfnmZlIK3PmV3hZ0";
                int imageWidth3 = c0958Hi.getResources().getConfiguration().orientation;
                if (imageWidth3 == 2) {
                    this.A00 = 0;
                } else {
                    this.A00 = this.A05;
                    if (this.A0d.A3F()) {
                        this.A00 = this.A05 - this.A0F;
                    }
                }
            }
        }
        interfaceC1863hK.AFC();
    }

    public final /* synthetic */ void A0d(LinearLayout linearLayout) {
        A0U(this.A0l);
        AbstractC2426qc.A0K(this.A0S);
        this.A0c.addView(this.A0S);
        linearLayout.bringToFront();
        this.A0M.bringToFront();
    }

    public final void A0e(boolean z11) {
        if (!z11 && this.A0T != null) {
            this.A0T.A0P();
        }
        if (this.A0U != null) {
            this.A0U.A0P();
        }
        if (this.A0X != null) {
            this.A0X.A0J(z11);
        }
    }

    public final void A0f(boolean z11) {
        this.A0Z = z11;
    }

    public final /* synthetic */ void A0g(boolean z11, View view) {
        if (z11) {
            A0L();
        } else {
            this.A0i.A0F().ABl();
            this.A0k.A5C(A0H(27, 45, 29));
        }
    }

    public final boolean A0h() {
        return this.A0M != null && this.A0M.getVisibility() == 0;
    }
}
