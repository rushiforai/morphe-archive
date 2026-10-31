package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.ub, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2673ub {
    public static byte[] A0A;
    public static String[] A0B = {"blwIylcv5yfckK", "U7OkuDjWJ6h5", "Pq0LfiZvTKka", "TsaZXiNy3Uy1tlOTMDRsn7BeKmVz8Z9D", "1TPm9g0LuevT5E3CUFkROu0mNHLpFmVN", "uPTZiym1KUhMoU", "xTm2DhSXMGS7yGrMxxmHwS3wrfNVZ6SN", "EVKSL15x3uh2Wvv62pknEuNynGoOBI"};
    public static final C2670uY A0C;
    public FrameLayout A00;
    public C2566ss A01;
    public C2566ss A02;
    public ViewOnClickListenerC0884El A03;
    public final LA A04;
    public final C1731fA A05;
    public final C1742fL A06;
    public final C0958Hi A07;
    public final C2232nO A08;
    public final InterfaceC2459r9 A09;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 118);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        String[] strArr = A0B;
        if (strArr[5].length() == strArr[7].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0B;
        strArr2[6] = "Z5Yxk6v3AVjMgPtBPOtkwXAg0cctCwf1";
        strArr2[3] = "4FOdLlK5WvVEcclsuRgU9xrQFj9B5RFL";
        A0A = new byte[]{-78, -57, -65, -65, -65, -65, -65, -65, -65, 78, 93, 80, 76, 95, 80, 49, 96, 87, 87, 62, 78, 93, 80, 80, 89, 44, 79, 46, 93, 80, 79, 84, 95, 55, 84, 89, 80, 62, 95, 76, 95, 84, 78, 65, 84, 80, 98, 19, 25, 25, 25, 20, 29, 44, 31, 27, 46, 31, 13, 29, 27, 38, 31, 30, -4, 35, 46, 39, 27, 42, -30, -24, -24, -24, -29, -7, -10, 9, -10, -41, 10, 3, -7, 1, -6, 0, -2, 13, -38, -3, -36, 8, 5, 8, 11, 12, -63, -57, -57, -57, -62, -28, -30, -15, -66, -31, -54, -30, -15, -34, -31, -34, -15, -34, -91, -85, -85, -85, -90, 49, 47, 62, 12, 51, 62, 55, 43, 58, 16, 60, 57, 55, 15, 56, 45, 57, 46, 47, 46, 19, 55, 43, 49, 47, -14, -8, -8, -8, -13, 25, 18, 31, 21, 29, 22, 35, 26, -16, 28, 27, 33, 18, 37, 33, 88, 55, 84, 94, 95, 80, 89, 80, 93, -13, -12, -50, -14, -26, -20, -22, -40, -18, -1, -22, -48, -13, -12, -4, -13, -83, -77, -77, -77, -82};
    }

    static {
        A05();
        A0C = new C2670uY(null);
    }

    public C2673ub(C0958Hi c0958Hi, LA la2, C2232nO c2232nO, Handler handler, InterfaceC2459r9 interfaceC2459r9) {
        C1h.A09(c0958Hi, A04(156, 8, 55));
        C1h.A09(la2, A04(75, 10, 31));
        C1h.A09(handler, A04(149, 7, 59));
        C1h.A09(interfaceC2459r9, A04(164, 9, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
        this.A07 = c0958Hi;
        this.A08 = c2232nO;
        this.A09 = interfaceC2459r9;
        C1742fL c1742fLA0J = la2.A32().A0J();
        C1h.A08(c1742fLA0J, A04(101, 18, 7));
        this.A06 = c1742fLA0J;
        C1731fA c1731fAA31 = la2.A31();
        C1h.A08(c1731fAA31, A04(85, 16, 35));
        this.A05 = c1731fAA31;
        this.A04 = la2;
    }

    private final View A00(ViewOnClickListenerC0884El viewOnClickListenerC0884El, ImageView imageView) {
        this.A03 = viewOnClickListenerC0884El;
        ViewOnClickListenerC0884El viewOnClickListenerC0884El2 = this.A03;
        if (viewOnClickListenerC0884El2 != null) {
            viewOnClickListenerC0884El2.A0G(this.A04.A32().A0K());
        }
        FrameLayout frameLayout = new FrameLayout(this.A07);
        frameLayout.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        this.A00 = frameLayout;
        A09(frameLayout);
        return frameLayout;
    }

    private final C2661uP A03() {
        C2661uP iconView = new C2661uP(this.A07);
        AbstractC2426qc.A0O(iconView, 0);
        iconView.setRadius(15);
        iconView.setLayoutParams(new RelativeLayout.LayoutParams(AbstractC2383pv.A04, AbstractC2383pv.A04));
        AbstractC2426qc.A0L(iconView);
        AsyncTaskC0892Et asyncTaskC0892EtA04 = new AsyncTaskC0892Et(iconView, this.A07).A04();
        C1h.A08(asyncTaskC0892EtA04, A04(TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 21, 15));
        asyncTaskC0892EtA04.A07(this.A04.A35().A01());
        return iconView;
    }

    private final void A06(FrameLayout frameLayout) {
        FrameLayout frameLayout2 = new FrameLayout(this.A07);
        this.A01 = AbstractC2571sx.A01(this.A07, false, this.A04, this.A08, this.A09, EnumC2569sv.A02, AbstractC2568su.A00(this.A04));
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2, 8388693);
        layoutParams.setMargins(0, 0, AbstractC2383pv.A0n, AbstractC2383pv.A0e);
        frameLayout2.addView(this.A01, layoutParams);
        frameLayout.addView(frameLayout2);
    }

    private final void A07(FrameLayout frameLayout) {
        FrameLayout frameLayout2 = new FrameLayout(this.A07);
        this.A02 = AbstractC2571sx.A01(this.A07, false, this.A04, this.A08, this.A09, EnumC2569sv.A02, EnumC2572sy.A04);
        AbstractC2426qc.A0L(this.A02);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2, 8388691);
        layoutParams.setMargins(AbstractC2383pv.A0h, 0, 0, AbstractC2383pv.A0e);
        frameLayout2.addView(this.A02, layoutParams);
        frameLayout.addView(frameLayout2);
    }

    private final void A08(FrameLayout frameLayout) {
        FrameLayout frameLayout2 = new FrameLayout(this.A07);
        C2570sw c2570swA02 = AbstractC2571sx.A02(this.A07, EnumC2569sv.A02, this.A04);
        C1h.A08(c2570swA02, A04(9, 43, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2, 8388691);
        layoutParams.setMargins(AbstractC2383pv.A0n, 0, 0, AbstractC2383pv.A0e);
        frameLayout2.addView(c2570swA02, layoutParams);
        frameLayout.addView(frameLayout2);
    }

    private final void A09(FrameLayout frameLayout) {
        ViewGroup viewGroup;
        String strA08 = this.A04.A32().A0I().A08();
        String str = strA08;
        if (!(str == null || str.length() == 0)) {
            AbstractC2668uW.A01(this.A07, frameLayout, strA08, Color.argb(179, 12, 16, 20));
        }
        ViewOnClickListenerC0884El viewOnClickListenerC0884El = this.A03;
        C2667uV c2667uV = new C2667uV(this.A07, this.A05.A01(), true, false, false);
        c2667uV.A04(this.A06.A0G(), this.A06.A0H(), null, false, false);
        c2667uV.setAlignment(17);
        c2667uV.setTitleTextSize(30);
        c2667uV.setDescriptionTextSize(15);
        c2667uV.A02();
        c2667uV.setPadding(AbstractC2383pv.A0s, 0, AbstractC2383pv.A0s, 0);
        AbstractC2426qc.A0H(1111, c2667uV);
        LinearLayout linearLayout = new LinearLayout(this.A07);
        linearLayout.setClickable(true);
        if (C2203mv.A1C(this.A07)) {
            linearLayout.setOnClickListener(new ViewOnClickListenerC2672ua(viewOnClickListenerC0884El));
        }
        linearLayout.setPadding(0, -AbstractC2383pv.A0h, 0, 0);
        linearLayout.setOrientation(1);
        linearLayout.setGravity(17);
        C2661uP c2661uPA03 = A03();
        if (c2661uPA03 != null) {
            ViewParent parent = c2661uPA03.getParent();
            boolean z11 = parent instanceof ViewGroup;
            String[] strArr = A0B;
            String str2 = strArr[1];
            String imageUrl = strArr[2];
            if (str2.length() != imageUrl.length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0B;
            strArr2[1] = "CDUDK4hY6kxc";
            strArr2[2] = "u9r89zf0CVYR";
            if (z11) {
                viewGroup = (ViewGroup) parent;
            } else {
                viewGroup = null;
            }
            if (viewGroup != null) {
                viewGroup.removeView(c2661uPA03);
            }
            linearLayout.addView(c2661uPA03);
        }
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(0, AbstractC2383pv.A0e, 0, AbstractC2383pv.A0y);
        linearLayout.addView(c2667uV, layoutParams);
        if (viewOnClickListenerC0884El != null) {
            A0C(viewOnClickListenerC0884El);
            ViewParent parent2 = viewOnClickListenerC0884El.getParent();
            ViewGroup viewGroup2 = parent2 instanceof ViewGroup ? (ViewGroup) parent2 : null;
            if (viewGroup2 != null) {
                viewGroup2.removeView(viewOnClickListenerC0884El);
            }
            linearLayout.addView(viewOnClickListenerC0884El, layoutParams);
            if (TextUtils.isEmpty(viewOnClickListenerC0884El.getText())) {
                AbstractC2426qc.A0I(viewOnClickListenerC0884El);
            }
        }
        A0B(linearLayout);
        linearLayout.setAlpha(1.0f);
        frameLayout.addView(linearLayout);
        A0A(frameLayout, viewOnClickListenerC0884El);
        if (this.A04.A3F()) {
            A06(frameLayout);
        }
        if (this.A04.A3U()) {
            A08(frameLayout);
        } else {
            if (!this.A04.A3T()) {
                return;
            }
            A07(frameLayout);
        }
    }

    private final void A0A(FrameLayout frameLayout, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        FrameLayout frameLayout2 = new FrameLayout(this.A07);
        frameLayout2.setPadding(0, AbstractC2383pv.A0S, AbstractC2383pv.A0c, AbstractC2383pv.A0c);
        Bitmap bitmapA01 = AbstractC2438qo.A01(EnumC2437qn.NAV_CROSS);
        C1h.A08(bitmapA01, A04(Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 30, 84));
        Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmapA01, AbstractC2383pv.A0e, AbstractC2383pv.A0e, true);
        C1h.A08(bitmapCreateScaledBitmap, A04(52, 23, 68));
        ImageView imageView = new ImageView(this.A07);
        AbstractC2426qc.A0H(1002, imageView);
        imageView.setImageBitmap(bitmapCreateScaledBitmap);
        imageView.setColorFilter(-1);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        gradientDrawable.setColor(Color.parseColor(A04(0, 9, 25)));
        imageView.setBackground(gradientDrawable);
        imageView.setPadding(AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(AbstractC2383pv.A0H, AbstractC2383pv.A0H, 8388661);
        layoutParams.setMargins(0, 0, 0, 0);
        imageView.setOnClickListener(new ViewOnClickListenerC2671uZ(this));
        frameLayout2.addView(imageView, layoutParams);
        imageView.setVisibility(8);
        frameLayout.addView(frameLayout2, new FrameLayout.LayoutParams(-1, -2, 48));
    }

    private final void A0B(LinearLayout linearLayout) {
        LinearLayout linearLayout2 = new LinearLayout(this.A07);
        linearLayout2.setOrientation(0);
        linearLayout2.setGravity(17);
        linearLayout2.setAlpha(0.5f);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 1;
        layoutParams.setMargins(0, AbstractC2383pv.A0y, 0, 0);
        linearLayout2.setLayoutParams(layoutParams);
        C2651uF c2651uF = new C2651uF(this.A07, -1, -1, EnumC2437qn.GOOGLE_PLAY_STORE);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(AbstractC2383pv.A06, AbstractC2383pv.A06);
        layoutParams2.rightMargin = AbstractC2383pv.A0w;
        c2651uF.setLayoutParams(layoutParams2);
        linearLayout2.addView(c2651uF);
        TextView textView = new TextView(this.A07);
        textView.setText(this.A06.A08());
        textView.setTextSize(12.0f);
        textView.setTextColor(-1);
        linearLayout2.addView(textView);
        linearLayout.addView(linearLayout2);
    }

    private final void A0C(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(13);
        viewOnClickListenerC0884El.setPadding(AbstractC2383pv.A0P, AbstractC2383pv.A06, AbstractC2383pv.A0P, AbstractC2383pv.A06);
        viewOnClickListenerC0884El.setTypeface(viewOnClickListenerC0884El.getTypeface(), 1);
        viewOnClickListenerC0884El.setTextSize(16.0f);
        viewOnClickListenerC0884El.A0D();
        viewOnClickListenerC0884El.setIncludeFontPadding(true);
        viewOnClickListenerC0884El.setLayoutParams(layoutParams);
        viewOnClickListenerC0884El.setTextColor(-16777216);
        AbstractC2426qc.A0W(viewOnClickListenerC0884El, AbstractC2426qc.A06(-1, 32));
        viewOnClickListenerC0884El.setId(View.generateViewId());
        ViewParent parent = viewOnClickListenerC0884El.getParent();
        ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
        if (viewGroup != null) {
            viewGroup.removeView(viewOnClickListenerC0884El);
        }
    }

    public final View A0D(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        if (viewOnClickListenerC0884El != null) {
            viewOnClickListenerC0884El.setV2Design(true);
        }
        return A00(viewOnClickListenerC0884El, null);
    }

    public final void A0E() {
        C2566ss c2566ss = this.A01;
        if (c2566ss != null) {
            c2566ss.A0O();
        }
        C2566ss c2566ss2 = this.A02;
        if (c2566ss2 != null) {
            c2566ss2.A0O();
        }
    }

    public final void A0F(int i5) {
        FrameLayout frameLayout = this.A00;
        if (frameLayout == null) {
            return;
        }
        C2566ss c2566ss = this.A01;
        if (c2566ss != null) {
            c2566ss.A0O();
        }
        this.A01 = null;
        C2566ss c2566ss2 = this.A02;
        if (c2566ss2 != null) {
            c2566ss2.A0O();
        }
        this.A02 = null;
        frameLayout.removeAllViews();
        A09(frameLayout);
    }

    public final void A0G(boolean z11) {
        C2566ss c2566ss;
        if (!z11 && (c2566ss = this.A01) != null) {
            c2566ss.A0P();
        }
        C2566ss c2566ss2 = this.A02;
        String[] strArr = A0B;
        if (strArr[5].length() == strArr[7].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0B;
        strArr2[1] = "hiD8huI3w5Io";
        strArr2[2] = "opvDXGdfqGeK";
        if (c2566ss2 != null) {
            c2566ss2.A0P();
        }
    }
}
