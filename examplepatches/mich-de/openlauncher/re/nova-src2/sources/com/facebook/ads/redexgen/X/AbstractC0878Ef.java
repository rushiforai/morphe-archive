package com.facebook.ads.redexgen.X;

import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Ef, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC0878Ef extends AbstractC2685un implements InterfaceC2378pq {
    public static byte[] A0A;
    public static String[] A0B = {"1qM0UqBuKeNFs4931PZdKXfB5ZchECK5", "3ZSmcCEAG5Dz0dWrJNlp2MNszP7YT25A", "Vrvau7r1HMpQKQXhvyVkTfJZAsfHOW4A", "oVRoE2FdK0le1s2SfNIozg00Kc9sH4MP", "npYoVlwUwM4clRwIxvjz9nauDkw8jySV", "7Yuh663Y", "kkRlGGIMUj7iwn7pYEfT9Vq54HRzcbQk", "UynwTjbvMY6JmtelA"};
    public static final int A0C;
    public static final int A0D;
    public static final int A0E;
    public static final int A0F;
    public static final int A0G;
    public static final int A0H;
    public static final int A0I;
    public static final int A0J;
    public static final int A0K;
    public static final int A0L;
    public static final int A0M;
    public static final int A0N;
    public static final int A0O;
    public C0793Ay A00;
    public C0777Ai A01;
    public C0774Af A02;
    public final Handler A03;
    public final LA A04;
    public final C1735fE A05;
    public final InterfaceC2459r9 A06;
    public final AbstractC2624to A07;
    public final C2380ps A08;
    public final AtomicBoolean A09;

    public static String A0L(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 22);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0M() {
        A0A = new byte[]{73, 82, 90, 90, 90, 90, 90, 90, 90, 77, 65, 67, 0, 72, 79, 77, 75, 76, 65, 65, 69, 0, 79, 74, 93, 0, 71, 64, 90, 75, 92, 93, 90, 71, 90, 71, 79, 66, 0, 77, 66, 71, 77, 69, 75, 74, 117, 121, 123, 56, 112, 119, 117, 115, 116, 121, 121, 125, 56, 119, 114, 101, 56, AbstractJsonLexerKt.TC_INVALID, 120, 98, 115, 100, 101, 98, AbstractJsonLexerKt.TC_INVALID, 98, AbstractJsonLexerKt.TC_INVALID, 119, 122, 56, 112, AbstractJsonLexerKt.TC_INVALID, 120, AbstractJsonLexerKt.TC_INVALID, 101, 126, 73, 119, 117, 98, AbstractJsonLexerKt.TC_INVALID, 96, AbstractJsonLexerKt.TC_INVALID, 98, 111, 18, 5, 23, 1, 18, 4, 5, 4, 63, 22, 9, 4, 5, 15};
    }

    public abstract AbstractC2624to A1k(C2689ur c2689ur, C1735fE c1735fE, String str);

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final void A1n() {
        LinearLayout linearLayout = new LinearLayout(super.A08.A06());
        linearLayout.setOrientation(1);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(13);
        linearLayout.setLayoutParams(layoutParams);
        TextView textView = new TextView(super.A08.A06());
        textView.setText(super.A08.A05().A1s());
        textView.setTextColor(-1);
        AbstractC2426qc.A0b(textView, true, 24);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams2.setMargins(AbstractC2383pv.A0t, 0, AbstractC2383pv.A0t, AbstractC2383pv.A0e);
        textView.setGravity(1);
        textView.setLayoutParams(layoutParams2);
        C2661uP c2661uP = new C2661uP(super.A08.A06());
        c2661uP.setRadius(15);
        AbstractC2426qc.A0O(c2661uP, 0);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(A0F, A0F);
        layoutParams3.gravity = 17;
        c2661uP.setLayoutParams(layoutParams3);
        new AsyncTaskC0892Et(c2661uP, super.A08.A06()).A05(A0F, A0F).A07(super.A08.A05().A35().A01());
        TextView textView2 = new TextView(super.A08.A06());
        textView2.setText(String.format(Locale.US, super.A08.A05().A1t(), super.A08.A05().A32().A0J().A0H()));
        textView2.setTextColor(-1);
        AbstractC2426qc.A0b(textView2, false, 17);
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams4.setMargins(AbstractC2383pv.A0i, AbstractC2383pv.A0e, AbstractC2383pv.A0i, 0);
        textView2.setGravity(1);
        textView2.setLayoutParams(layoutParams4);
        linearLayout.addView(textView);
        linearLayout.addView(c2661uP);
        linearLayout.addView(textView2);
        addView(linearLayout);
        addView(A0J());
        if (this.A04.A3F() && this.A04.A3P()) {
            C0958Hi c0958HiA06 = super.A08.A06();
            LA laA05 = super.A08.A05();
            C2232nO c2232nOA08 = super.A08.A08();
            EnumC2569sv enumC2569sv = EnumC2569sv.A07;
            InterfaceC2459r9 interfaceC2459r9A0C = super.A08.A0C();
            if (A0B[5].length() == 7) {
                throw new RuntimeException();
            }
            A0B[4] = "xs35kRY7OlursP2LvVzn3Dbf8KPmYq6u";
            addView(A00(c0958HiA06, laA05, c2232nOA08, enumC2569sv, interfaceC2459r9A0C));
        }
        if (this.A04.A3U()) {
            addView(A01(super.A08.A06(), EnumC2569sv.A07));
        }
    }

    static {
        A0M();
        A0I = (int) (AbstractC2385px.A02 * 48.0f);
        A0H = (int) (AbstractC2385px.A02 * 80.0f);
        A0F = (int) (AbstractC2385px.A02 * 120.0f);
        A0G = (int) (AbstractC2385px.A02 * 128.0f);
        A0M = (int) (AbstractC2385px.A02 * 16.0f);
        A0C = (int) (AbstractC2385px.A02 * 4.0f);
        A0L = (int) (AbstractC2385px.A02 * 44.0f);
        A0J = AbstractC2383pv.A0y;
        A0K = (int) (AbstractC2385px.A02 * 12.0f);
        A0O = (int) (AbstractC2385px.A02 * 12.0f);
        A0N = (int) (AbstractC2385px.A02 * 26.0f);
        A0D = AbstractC1841gx.A02(-1, 77);
        A0E = AbstractC1841gx.A02(A0D, 90);
    }

    public AbstractC0878Ef(C2689ur c2689ur, boolean z11) {
        super(c2689ur, z11);
        this.A03 = new Handler(Looper.getMainLooper());
        this.A09 = new AtomicBoolean(false);
        this.A04 = c2689ur.A05();
        this.A08 = C2380ps.A00(c2689ur.A06(), this.A04, this);
        this.A05 = this.A04.A32();
        this.A07 = A0K(c2689ur);
        if (this.A04.A2o()) {
            this.A07.setVisibility(8);
        }
        AbstractC2452r2 abstractC2452r2A0B = c2689ur.A0B();
        this.A06 = c2689ur.A0C();
        if (abstractC2452r2A0B != null) {
            abstractC2452r2A0B.setLayoutParams(new RelativeLayout.LayoutParams(-1, abstractC2452r2A0B.getToolbarHeight()));
            abstractC2452r2A0B.setPageDetailsVisible(false);
        }
    }

    private ImageView A0J() {
        ImageView imageView = new ImageView(super.A08.A06());
        imageView.setImageBitmap(Bitmap.createScaledBitmap(AbstractC2438qo.A01(EnumC2437qn.NAV_CROSS), AbstractC2383pv.A0h, AbstractC2383pv.A0h, true));
        imageView.setColorFilter(-1);
        GradientDrawable circleBackground = new GradientDrawable();
        circleBackground.setShape(1);
        circleBackground.setColor(Color.parseColor(A0L(0, 9, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE)));
        imageView.setBackground(circleBackground);
        imageView.setPadding(AbstractC2383pv.A0b, AbstractC2383pv.A0b, AbstractC2383pv.A0b, AbstractC2383pv.A0b);
        imageView.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.uh
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.A00.A1p(view);
            }
        });
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(0, AbstractC2383pv.A0u, AbstractC2383pv.A0e, 0);
        layoutParams.addRule(11);
        imageView.setLayoutParams(layoutParams);
        return imageView;
    }

    private AbstractC2624to A0K(C2689ur c2689ur) {
        String clickEvent;
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        if (this.A04.A2o()) {
            layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        }
        layoutParams.addRule(12);
        if (c2689ur.A05().A1c().equals(A0L(91, 14, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE))) {
            clickEvent = EnumC1658dy.A04.A03();
        } else {
            clickEvent = A0L(9, 37, 56);
        }
        AbstractC2624to abstractC2624toA1k = A1k(c2689ur, this.A05, clickEvent);
        abstractC2624toA1k.getCTAButton().getCtaActionHelper().A0A(this.A04);
        this.A02 = new C0774Af(abstractC2624toA1k, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, 100, 0);
        AbstractC2426qc.A0L(abstractC2624toA1k);
        abstractC2624toA1k.A0l(c2689ur.A00());
        if (C2203mv.A16(c2689ur.A06())) {
            abstractC2624toA1k.A0k();
            if (c2689ur.A0B() != null) {
                c2689ur.A0B().setCTAClickListener(getCtaButton());
            }
        }
        addView(abstractC2624toA1k, layoutParams);
        abstractC2624toA1k.getCTAButton().A0I(this.A04, c2689ur.A0B());
        return abstractC2624toA1k;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public void A1Q() throws RemoteException {
        super.A1Q();
        this.A03.removeCallbacksAndMessages(null);
        if (this.A04 != null && this.A04.A32().A0M() != null) {
            AbstractC2358pW.A06(super.A08.A06().A02(), this.A04.A32().A0M());
        }
        this.A08.A03();
        String[] strArr = A0B;
        if (strArr[6].charAt(1) == strArr[1].charAt(1)) {
            throw new RuntimeException();
        }
        A0B[3] = "5Kbaf0CIkGxuL526fADXQa3s9VOdhztm";
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public void A1X(C1735fE c1735fE, String str, double d5, Bundle bundle) {
        super.A1X(c1735fE, str, d5, bundle);
        this.A07.setInfo(c1735fE.A0J(), c1735fE.A0K(), str, this.A04.A35().A01(), super.A08.A09(), null);
    }

    public final int A1j(AbstractC2452r2 abstractC2452r2) {
        return abstractC2452r2 == null ? AbstractC2452r2.A00 : abstractC2452r2.getToolbarHeight();
    }

    public void A1l() {
        View expandableLayout = getAdDetailsView().getExpandableLayout();
        if (expandableLayout != null) {
            this.A00 = new C0793Ay(true, false);
            if (this.A01 != null) {
                C0793Ay c0793Ay = this.A00;
                if (A0B[0].charAt(30) == 'l') {
                    throw new RuntimeException();
                }
                A0B[7] = "KTvg88bTO6HmKn15GgbH1";
                c0793Ay.A0L(this.A01);
            }
            C1744fN c1744fNA01 = this.A04.A31().A01();
            this.A00.A0L(new C0775Ag(getAdDetailsView().getCTAButton(), 300, -1, c1744fNA01.A0A(true)));
            this.A00.A0L(new C0778Aj(getAdDetailsView().getCTAButton(), 300, AbstractC2426qc.A08(A0D, A0E, A0C), AbstractC2426qc.A05(c1744fNA01.A09(true), A0C)));
            this.A00.A0L(new C0776Ah(expandableLayout, PerAppFeatureCatalog.MAX_TOOLS, false));
            this.A00.A0K(2300);
        }
    }

    public final void A1m() {
        LinearLayout linearLayout = new LinearLayout(super.A08.A06());
        linearLayout.setOrientation(1);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(13);
        linearLayout.setLayoutParams(layoutParams);
        TextView textView = new TextView(super.A08.A06());
        textView.setText(super.A08.A05().A1i());
        textView.setTextColor(-1);
        AbstractC2426qc.A0b(textView, false, 15);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams2.setMargins(A0M, A0M, A0M, A0M);
        textView.setGravity(1);
        textView.setLayoutParams(layoutParams2);
        C2655uJ c2655uJ = new C2655uJ(super.A08.A06(), 0, -13524404, EnumC2437qn.REWARD_GRANTED_ICON);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(A0I, A0I);
        layoutParams3.gravity = 17;
        c2655uJ.setLayoutParams(layoutParams3);
        linearLayout.addView(c2655uJ);
        linearLayout.addView(textView);
        addView(linearLayout);
    }

    public final void A1o(int i5, ViewGroup viewGroup, RelativeLayout relativeLayout) {
        if (getAdDetailsView() instanceof AbstractC0891Es) {
            if ((getAdDetailsView() instanceof C06986q) || (getAdDetailsView() instanceof C06976p)) {
                AbstractC2426qc.A0K(getAdDetailsView());
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
                if (getResources().getConfiguration().orientation == 2) {
                    layoutParams.addRule(1, relativeLayout.getId());
                    getAdDetailsView().setLayoutParams(layoutParams);
                    viewGroup.addView(getAdDetailsView());
                } else {
                    addView(getAdDetailsView(), layoutParams);
                }
            }
            getAdDetailsView().A0l(i5);
            ((AbstractC0891Es) getAdDetailsView()).A0y(viewGroup, relativeLayout, i5);
        }
    }

    public final /* synthetic */ void A1p(View view) {
        this.A06.A5C(A0L(46, 45, 0));
    }

    public LA getAdDataBundle() {
        return this.A04;
    }

    public C0774Af getAdDetailsAnimation() {
        return this.A02;
    }

    public AbstractC2624to getAdDetailsView() {
        return this.A07;
    }

    public C1735fE getAdInfo() {
        return this.A05;
    }

    public C0793Ay getAnimationPlugin() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un, android.view.View
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.A09.get() && (this.A04.A32().A0L().A03().isEmpty() || this.A04.A32().A0L().A04() || this.A04.A2V())) {
            return;
        }
        getAdDetailsView().A0l(configuration.orientation);
    }

    @Override // android.widget.RelativeLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        View expandableLayout;
        super.onLayout(z11, i5, i11, i12, i13);
        if (this.A04.A32().A0L().A04() || this.A04.A2V()) {
            return;
        }
        LA la2 = this.A04;
        if (A0B[2].charAt(30) != '4') {
            throw new RuntimeException();
        }
        A0B[0] = "AO2Vor543jhYYkt1oYijcT7buZTkR3eI";
        if (!la2.A2o() && (expandableLayout = getAdDetailsView().getExpandableLayout()) != null && z11 && this.A01 == null && this.A00 != null) {
            this.A01 = new C0777Ai(expandableLayout, 300, expandableLayout.getHeight(), 0);
            this.A00.A0L(this.A01);
            this.A00.A0J();
        }
    }
}
