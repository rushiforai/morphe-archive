package com.facebook.ads.redexgen.X;

import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.List;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.vU, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2728vU {
    public static byte[] A0C;
    public static String[] A0D = {"j7QbJr5AIpIYO828wBTwpNsJEGDPP7q8", "tMzteZEfNFgBXyt7u8cronhNe4LC", "Zw6ipv3ALRtOoDrQ6Wdd", "KSNF1VtFdJkV4ApfmieoyehlzbGy2aYh", b.f42142b, "YqSlfwJ5NLUvvLTrXrvFKS11MaPht1uN", "nnH2BntsxoVjTLTvZPeZ", "YmyUjId47jvF0zwXhqCNcmZjoUI1pU1X"};
    public static final C2721vN A0E;
    public int A00;
    public int A01;
    public RelativeLayout A02;
    public ViewOnClickListenerC0884El A03;
    public final Handler A04;
    public final View A05;
    public final LA A06;
    public final C1742fL A07;
    public final C0958Hi A08;
    public final C2232nO A09;
    public final InterfaceC2459r9 A0A;
    public final C2729vV A0B;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private final LinearLayout A03() {
        LinearLayout linearLayout = new LinearLayout(this.A08);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(16);
        C2661uP c2661uP = new C2661uP(this.A08);
        AbstractC2426qc.A0O(c2661uP, 0);
        c2661uP.setRadius(20);
        int i5 = (int) (70 * AbstractC2385px.A02);
        c2661uP.setLayoutParams(new LinearLayout.LayoutParams(i5, i5));
        AbstractC2426qc.A0L(c2661uP);
        AsyncTaskC0892Et asyncTaskC0892EtA04 = new AsyncTaskC0892Et(c2661uP, this.A08).A04();
        C1h.A08(asyncTaskC0892EtA04, A09(74, 21, 1));
        asyncTaskC0892EtA04.A07(this.A06.A35().A01());
        linearLayout.addView(c2661uP);
        LinearLayout linearLayout2 = new LinearLayout(this.A08);
        linearLayout2.setOrientation(1);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(0, -2, 1.0f);
        layoutParams.setMargins(AbstractC2383pv.A0y, 0, 0, 0);
        linearLayout2.setLayoutParams(layoutParams);
        TextView textView = new TextView(this.A08);
        textView.setText(this.A07.A0H());
        textView.setTextSize(16.0f);
        textView.setLineSpacing((AbstractC2385px.A02 * 20.0f) - (AbstractC2385px.A02 * 16.0f), 1.0f);
        textView.setTextColor(-16777216);
        textView.setTypeface(textView.getTypeface(), 1);
        textView.setMaxLines(1);
        textView.setEllipsize(TextUtils.TruncateAt.END);
        linearLayout2.addView(textView);
        TextView textView2 = new TextView(this.A08);
        textView2.setText(this.A07.A0G());
        textView2.setTextSize(14.0f);
        textView2.setLineSpacing((AbstractC2385px.A02 * 18.0f) - (AbstractC2385px.A02 * 14.0f), 1.0f);
        textView2.setTextColor(Color.parseColor(A09(7, 7, 86)));
        textView2.setMaxLines(1);
        textView2.setEllipsize(TextUtils.TruncateAt.END);
        linearLayout2.addView(textView2);
        linearLayout.addView(linearLayout2);
        return linearLayout;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private final LinearLayout A05(ViewOnClickListenerC0884El viewOnClickListenerC0884El, EnumC2722vO enumC2722vO, int i5, C2661uP c2661uP, C2661uP c2661uP2) {
        LinearLayout linearLayout = new LinearLayout(this.A08);
        linearLayout.setOrientation(1);
        linearLayout.setPadding(AbstractC2383pv.A0e, AbstractC2383pv.A0h, AbstractC2383pv.A0e, AbstractC2383pv.A0h);
        linearLayout.setClickable(true);
        linearLayout.setOnClickListener(new ViewOnClickListenerC2727vT(viewOnClickListenerC0884El));
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(-1);
        gradientDrawable.setCornerRadius(AbstractC2385px.A02 * 20.0f);
        linearLayout.setBackground(gradientDrawable);
        linearLayout.addView(A03(), new LinearLayout.LayoutParams(-1, -2));
        List<C2277o9> listA02 = this.A06.A32().A0L().A02();
        C1h.A06(listA02);
        if (true ^ listA02.isEmpty()) {
            LinearLayout linearLayoutA08 = A08(listA02);
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, AbstractC2383pv.A0L);
            layoutParams.setMargins(0, AbstractC2383pv.A0e, 0, 0);
            linearLayout.addView(linearLayoutA08, layoutParams);
        }
        LinearLayout linearLayoutA06 = A06(enumC2722vO, i5, c2661uP, c2661uP2);
        if (linearLayoutA06 != null) {
            LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
            layoutParams2.setMargins(0, AbstractC2383pv.A0e, 0, 0);
            linearLayout.addView(linearLayoutA06, layoutParams2);
        }
        return linearLayout;
    }

    public static String A09(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 1);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A0C = new byte[]{-128, -114, -111, -108, -110, -93, -113, 122, -115, -103, -114, -121, -114, -112, -105, -85, -89, -85, -89, -85, -89, -99, -102, -83, -102, 123, -82, -89, -99, -91, -98, -30, -32, -17, -68, -33, -56, -32, -17, -36, -33, -36, -17, -36, -93, -87, -87, -87, -92, 114, 72, 116, 115, 121, 106, 125, 121, -66, -103, -78, -65, -75, -67, -74, -61, -62, -95, -66, -56, -55, -70, -61, -70, -57, 112, 113, 75, 111, 99, 105, 103, 85, 107, 124, 103, 77, 112, 113, 121, 112, 42, 48, 48, 48, 43};
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final void A0G(RelativeLayout relativeLayout, int i5, ViewOnClickListenerC0884El viewOnClickListenerC0884El, EnumC2722vO enumC2722vO, C2661uP c2661uP, C2661uP c2661uP2) {
        AbstractC2426qc.A0K(c2661uP);
        AbstractC2426qc.A0K(c2661uP2);
        LinearLayout linearLayout = new LinearLayout(this.A08);
        linearLayout.setOrientation(1);
        linearLayout.setGravity(1);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(i5, -2);
        layoutParams.addRule(14);
        layoutParams.setMargins(AbstractC2383pv.A0m, (int) (AbstractC2385px.A04.heightPixels * 0.18f), AbstractC2383pv.A0m, 0);
        linearLayout.setLayoutParams(layoutParams);
        AbstractC2426qc.A0L(linearLayout);
        linearLayout.addView(A05(viewOnClickListenerC0884El, enumC2722vO, i5, c2661uP, c2661uP2), new LinearLayout.LayoutParams(-1, -2));
        relativeLayout.addView(linearLayout);
        int iA06 = this.A0B.A06(relativeLayout, AbstractC2383pv.A0L);
        LinearLayout linearLayoutA02 = A02();
        int iGenerateViewId = View.generateViewId();
        linearLayoutA02.setId(iGenerateViewId);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams2.addRule(2, iA06);
        layoutParams2.addRule(14);
        layoutParams2.setMargins(0, 0, 0, AbstractC2383pv.A0e);
        relativeLayout.addView(linearLayoutA02, layoutParams2);
        if (viewOnClickListenerC0884El != null) {
            A0I(viewOnClickListenerC0884El);
            int i11 = AbstractC2383pv.A0L;
            RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-1, -2);
            layoutParams3.addRule(2, iGenerateViewId);
            layoutParams3.setMargins(i11, 0, i11, AbstractC2383pv.A0y);
            relativeLayout.addView(viewOnClickListenerC0884El, layoutParams3);
        }
    }

    static {
        A0A();
        A0E = new C2721vN(null);
    }

    public C2728vU(C0958Hi c0958Hi, LA la2, C2232nO c2232nO, Handler handler, InterfaceC2459r9 interfaceC2459r9, View view) {
        C1h.A09(c0958Hi, A09(49, 8, 4));
        C1h.A09(la2, A09(21, 10, 56));
        C1h.A09(handler, A09(57, 8, 80));
        C1h.A09(interfaceC2459r9, A09(65, 9, 84));
        this.A08 = c0958Hi;
        this.A09 = c2232nO;
        this.A04 = handler;
        this.A0A = interfaceC2459r9;
        this.A05 = view;
        C1742fL c1742fLA0J = la2.A32().A0J();
        C1h.A08(c1742fLA0J, A09(31, 18, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE));
        this.A07 = c1742fLA0J;
        this.A06 = la2;
        this.A00 = this.A08.getResources().getConfiguration().orientation;
        this.A0B = new C2729vV(this.A08, la2, this.A09, this.A0A);
    }

    private final LinearLayout A02() {
        LinearLayout linearLayout = new LinearLayout(this.A08);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(17);
        linearLayout.setAlpha(0.5f);
        C2651uF c2651uF = new C2651uF(this.A08, -1, -1, EnumC2437qn.GOOGLE_PLAY_STORE);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(AbstractC2383pv.A06, AbstractC2383pv.A06);
        layoutParams.rightMargin = AbstractC2383pv.A0w;
        c2651uF.setLayoutParams(layoutParams);
        linearLayout.addView(c2651uF);
        TextView storeTitleView = new TextView(this.A08);
        storeTitleView.setText(this.A07.A08());
        storeTitleView.setTextSize(14.0f);
        storeTitleView.setLineSpacing((AbstractC2385px.A02 * 18.0f) - (AbstractC2385px.A02 * 14.0f), 1.0f);
        storeTitleView.setTextColor(-1);
        linearLayout.addView(storeTitleView);
        return linearLayout;
    }

    private final LinearLayout A04(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        LinearLayout headerRow = new LinearLayout(this.A08);
        headerRow.setOrientation(1);
        headerRow.setPadding(AbstractC2383pv.A0e, AbstractC2383pv.A0h, AbstractC2383pv.A0e, AbstractC2383pv.A0h);
        headerRow.setClickable(true);
        headerRow.setOnClickListener(new ViewOnClickListenerC2726vS(viewOnClickListenerC0884El));
        GradientDrawable cardBackground = new GradientDrawable();
        cardBackground.setColor(-1);
        cardBackground.setCornerRadius(AbstractC2385px.A02 * 20.0f);
        headerRow.setBackground(cardBackground);
        headerRow.addView(A03(), new LinearLayout.LayoutParams(-1, -2));
        List<C2277o9> listA02 = this.A06.A32().A0L().A02();
        C1h.A06(listA02);
        if (true ^ listA02.isEmpty()) {
            LinearLayout linearLayoutA08 = A08(listA02);
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, AbstractC2383pv.A0L);
            layoutParams.setMargins(0, AbstractC2383pv.A0e, 0, 0);
            headerRow.addView(linearLayoutA08, layoutParams);
        }
        return headerRow;
    }

    private final LinearLayout A06(EnumC2722vO enumC2722vO, int i5, C2661uP c2661uP, C2661uP c2661uP2) {
        if (enumC2722vO == EnumC2722vO.A05) {
            return null;
        }
        LinearLayout linearLayout = new LinearLayout(this.A08);
        int i11 = i5 - (AbstractC2383pv.A0e * 2);
        switch (C2723vP.A00[enumC2722vO.ordinal()]) {
            case 1:
                linearLayout.setOrientation(0);
                c2661uP.setRadius(20);
                c2661uP2.setRadius(20);
                int imageHeight = (int) (((i11 - AbstractC2383pv.A0y) / 2) / 0.45801526f);
                c2661uP.setLayoutParams(new LinearLayout.LayoutParams(0, imageHeight, 1.0f));
                linearLayout.addView(c2661uP);
                LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(0, imageHeight, 1.0f);
                layoutParams.setMargins(AbstractC2383pv.A0y, 0, 0, 0);
                c2661uP2.setLayoutParams(layoutParams);
                linearLayout.addView(c2661uP2);
                return linearLayout;
            case 2:
                linearLayout.setOrientation(1);
                c2661uP.setRadius(16);
                c2661uP2.setRadius(16);
                int i12 = (int) (i11 / 2.1023622f);
                c2661uP.setLayoutParams(new LinearLayout.LayoutParams(-1, i12));
                linearLayout.addView(c2661uP);
                LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, i12);
                layoutParams2.setMargins(0, AbstractC2383pv.A0y, 0, 0);
                c2661uP2.setLayoutParams(layoutParams2);
                linearLayout.addView(c2661uP2);
                return linearLayout;
            case 3:
                return null;
            default:
                throw new AnonymousClass28();
        }
    }

    private final LinearLayout A07(C2277o9 c2277o9) {
        LinearLayout linearLayout = new LinearLayout(this.A08);
        linearLayout.setOrientation(1);
        linearLayout.setGravity(1);
        LinearLayout linearLayout2 = new LinearLayout(this.A08);
        linearLayout2.setOrientation(0);
        linearLayout2.setGravity(16);
        TextView textView = new TextView(this.A08);
        textView.setText(c2277o9.A04());
        textView.setTextSize(16.0f);
        textView.setLineSpacing((AbstractC2385px.A02 * 20.0f) - (AbstractC2385px.A02 * 16.0f), 1.0f);
        textView.setTextColor(-16777216);
        textView.setGravity(17);
        textView.setMaxLines(1);
        textView.setEllipsize(TextUtils.TruncateAt.END);
        linearLayout2.addView(textView);
        String strA02 = c2277o9.A02();
        if (strA02 != null) {
            if (strA02.length() > 0) {
                ImageView iconView = new ImageView(this.A08);
                LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(AbstractC2383pv.A06, AbstractC2383pv.A06);
                layoutParams.setMargins(AbstractC2383pv.A0r, 0, 0, 0);
                layoutParams.gravity = 16;
                iconView.setLayoutParams(layoutParams);
                iconView.setScaleType(ImageView.ScaleType.FIT_CENTER);
                AsyncTaskC0892Et downloadTask = new AsyncTaskC0892Et(iconView, this.A08).A04();
                C1h.A08(downloadTask, A09(74, 21, 1));
                downloadTask.A07(strA02);
                linearLayout2.addView(iconView);
            }
        }
        linearLayout.addView(linearLayout2, new LinearLayout.LayoutParams(-2, -2));
        TextView textView2 = new TextView(this.A08);
        textView2.setText(c2277o9.A03());
        textView2.setTextSize(14.0f);
        textView2.setLineSpacing((AbstractC2385px.A02 * 18.0f) - (AbstractC2385px.A02 * 14.0f), 1.0f);
        textView2.setTextColor(Color.parseColor(A09(14, 7, 115)));
        textView2.setGravity(17);
        textView2.setMaxLines(1);
        textView2.setEllipsize(TextUtils.TruncateAt.END);
        linearLayout.addView(textView2);
        return linearLayout;
    }

    private final LinearLayout A08(List<C2277o9> list) {
        LinearLayout linearLayout = new LinearLayout(this.A08);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(16);
        int iMin = Math.min(list.size(), 3);
        if (iMin < 3) {
            linearLayout.setPadding(AbstractC2383pv.A0L, 0, AbstractC2383pv.A0L, 0);
        }
        for (int i5 = 0; i5 < iMin; i5++) {
            LinearLayout linearLayoutA07 = A07(list.get(i5));
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(0, -2, 1.0f);
            if (i5 > 0) {
                layoutParams.setMargins(AbstractC2383pv.A0h, 0, 0, 0);
            }
            linearLayout.addView(linearLayoutA07, layoutParams);
        }
        return linearLayout;
    }

    private final void A0B(LinearLayout linearLayout) {
        LinearLayout linearLayoutA02 = A02();
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 1;
        layoutParams.setMargins(0, AbstractC2383pv.A0y, 0, 0);
        linearLayout.addView(linearLayoutA02, layoutParams);
    }

    private final void A0C(RelativeLayout relativeLayout) {
        String imageUrl = this.A06.A32().A0I().A08();
        String imageUrl2 = imageUrl;
        if (!(imageUrl2 == null || imageUrl2.length() == 0)) {
            AbstractC2668uW.A01(this.A08, relativeLayout, imageUrl, Color.argb(179, 12, 16, 20));
        }
        int screenHeight = AbstractC2385px.A04.heightPixels;
        int iMin = Math.min(screenHeight, AbstractC2385px.A04.widthPixels) - (AbstractC2383pv.A0m * 2);
        ViewOnClickListenerC0884El viewOnClickListenerC0884El = this.A03;
        List<String> listA03 = this.A06.A32().A0L().A03();
        if (this.A00 == 2 || listA03.size() < 2) {
            A0E(relativeLayout, iMin, viewOnClickListenerC0884El);
        } else {
            C1h.A06(listA03);
            A0H(relativeLayout, iMin, listA03, viewOnClickListenerC0884El);
        }
        relativeLayout.post(new RunnableC2725vR(this));
    }

    private final void A0D(RelativeLayout relativeLayout, int i5, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        LinearLayout linearLayout = new LinearLayout(this.A08);
        linearLayout.setOrientation(1);
        linearLayout.setGravity(1);
        RelativeLayout.LayoutParams containerParams = new RelativeLayout.LayoutParams(i5, -2);
        containerParams.addRule(13);
        linearLayout.setLayoutParams(containerParams);
        linearLayout.addView(A04(viewOnClickListenerC0884El), new LinearLayout.LayoutParams(-1, -2));
        if (viewOnClickListenerC0884El != null) {
            A0I(viewOnClickListenerC0884El);
            LinearLayout.LayoutParams ctaParams = new LinearLayout.LayoutParams(-1, -2);
            ctaParams.setMargins(0, AbstractC2383pv.A0y, 0, 0);
            linearLayout.addView(viewOnClickListenerC0884El, ctaParams);
        }
        A0B(linearLayout);
        relativeLayout.addView(linearLayout);
        this.A0B.A06(relativeLayout, AbstractC2383pv.A0L);
    }

    private final void A0E(RelativeLayout relativeLayout, int i5, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        boolean isPortrait = this.A00 == 1;
        if (isPortrait) {
            A0F(relativeLayout, i5, viewOnClickListenerC0884El);
        } else {
            A0D(relativeLayout, i5, viewOnClickListenerC0884El);
        }
        boolean isPortrait2 = C2203mv.A1C(this.A08);
        if (isPortrait2) {
            relativeLayout.setClickable(true);
            relativeLayout.setOnClickListener(new ViewOnClickListenerC2724vQ(viewOnClickListenerC0884El));
        }
    }

    private final void A0F(RelativeLayout relativeLayout, int i5, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        int i11 = AbstractC2383pv.A0L;
        LinearLayout whiteCard = new LinearLayout(this.A08);
        whiteCard.setOrientation(1);
        whiteCard.setGravity(1);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(13);
        whiteCard.setLayoutParams(layoutParams);
        LinearLayout container = A04(viewOnClickListenerC0884El);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams2.setMargins(i11, 0, i11, 0);
        whiteCard.addView(container, layoutParams2);
        if (viewOnClickListenerC0884El != null) {
            A0I(viewOnClickListenerC0884El);
            LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-1, -2);
            int edgeMargin = AbstractC2383pv.A0y;
            layoutParams3.setMargins(i11, edgeMargin, i11, 0);
            whiteCard.addView(viewOnClickListenerC0884El, layoutParams3);
        }
        A0B(whiteCard);
        relativeLayout.addView(whiteCard);
        this.A0B.A06(relativeLayout, i11);
    }

    private final void A0H(RelativeLayout relativeLayout, int i5, List<String> list, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        int i11 = this.A01;
        C1g c1g = new C1g();
        C2661uP screenshotView1 = new C2661uP(this.A08);
        C2661uP screenshotView2 = new C2661uP(this.A08);
        screenshotView1.setScaleType(ImageView.ScaleType.CENTER_CROP);
        screenshotView2.setScaleType(ImageView.ScaleType.CENTER_CROP);
        AsyncTaskC0892Et asyncTaskC0892EtA04 = new AsyncTaskC0892Et(screenshotView1, this.A08).A04();
        String strA09 = A09(74, 21, 1);
        C1h.A08(asyncTaskC0892EtA04, strA09);
        asyncTaskC0892EtA04.A06(new EQ(this, i11, c1g, relativeLayout, i5, viewOnClickListenerC0884El, screenshotView1, screenshotView2));
        asyncTaskC0892EtA04.A07(list.get(0));
        AsyncTaskC0892Et asyncTaskC0892EtA042 = new AsyncTaskC0892Et(screenshotView2, this.A08).A04();
        C1h.A08(asyncTaskC0892EtA042, strA09);
        asyncTaskC0892EtA042.A07(list.get(1));
    }

    private final void A0I(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        AbstractC2426qc.A0H(1001, viewOnClickListenerC0884El);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(Color.parseColor(A09(0, 7, 92)));
        gradientDrawable.setCornerRadius(AbstractC2385px.A02 * 12.0f);
        viewOnClickListenerC0884El.setBackground(gradientDrawable);
        viewOnClickListenerC0884El.setPadding(AbstractC2383pv.A0h, AbstractC2383pv.A08, AbstractC2383pv.A0h, AbstractC2383pv.A08);
        viewOnClickListenerC0884El.setTextColor(-1);
        viewOnClickListenerC0884El.setTextSize(16.0f);
        viewOnClickListenerC0884El.setTypeface(viewOnClickListenerC0884El.getTypeface(), 1);
        viewOnClickListenerC0884El.setGravity(17);
        viewOnClickListenerC0884El.A0D();
        viewOnClickListenerC0884El.setIncludeFontPadding(false);
        viewOnClickListenerC0884El.setId(View.generateViewId());
        ViewParent parent = viewOnClickListenerC0884El.getParent();
        ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
        if (viewGroup != null) {
            viewGroup.removeView(viewOnClickListenerC0884El);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x003b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final View A0K(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        if (viewOnClickListenerC0884El != null) {
            if (A0D[5].charAt(1) == 'd') {
                throw new RuntimeException();
            }
            String[] strArr = A0D;
            strArr[0] = "bt7zPrm6aysAIXkK75GpzNM8OGuneizb";
            strArr[3] = "ZWHAdAGEEYIkYqk7lIuZoptbUScULLuf";
            viewOnClickListenerC0884El.setV2Design(true);
        }
        this.A03 = viewOnClickListenerC0884El;
        ViewOnClickListenerC0884El viewOnClickListenerC0884El2 = this.A03;
        if (A0D[5].charAt(1) != 'd') {
            A0D[5] = "dphCyl6lvmiE6rHXEjdEcCOKobFQnCQ3";
            if (viewOnClickListenerC0884El2 != null) {
                viewOnClickListenerC0884El2.A0G(this.A06.A32().A0K());
            }
        } else {
            A0D[7] = "4yJGmhO1yM92igHwi10nWPZb1JyCMFYP";
            if (viewOnClickListenerC0884El2 != null) {
            }
        }
        RelativeLayout relativeLayout = new RelativeLayout(this.A08);
        relativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        this.A02 = relativeLayout;
        this.A00 = this.A08.getResources().getConfiguration().orientation;
        A0C(relativeLayout);
        return relativeLayout;
    }

    public final void A0L() {
        this.A0B.A07();
    }

    public final void A0M(int i5) {
        RelativeLayout relativeLayout = this.A02;
        if (relativeLayout == null) {
            return;
        }
        relativeLayout.removeAllViews();
        this.A00 = i5;
        this.A01++;
        A0C(relativeLayout);
    }

    public final void A0N(boolean z11) {
        this.A0B.A08(z11);
    }
}
