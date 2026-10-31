package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.ng, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2250ng {
    public static byte[] A0I;
    public static String[] A0J = {"GN2Sf6ouZClDTvsjg8mXsRhcXFlXLCDE", "Cuy0P3tFjuNV2zE19XM86tRmtGQ9WEoR", "6mOzZFwIbVxd7XLgjoOaYFq0yg0488yx", "L2ghT39A39nFQ6dYA6YlTzD9O5Bza1a7", "VRbijnTBgoBE0rgFEXkhPPI9AZkHkvmJ", "0rrPs", "JSAkDEDufAz7UxAUB", "2fVaSxEsNUCVfNnYD58vA64DNpDbNeVE"};
    public static final C2274o6 A0K;
    public static final int A0L;
    public static final int A0M;
    public static final int[] A0N;
    public C2566ss A00;
    public C2635tz A01;
    public ViewOnClickListenerC0884El A02;
    public String A03;
    public boolean A04;
    public final int A05;
    public final int A06;
    public final int A07;
    public final LA A08;
    public final C1747fQ A09;
    public final C0958Hi A0A;
    public final InterfaceC2224nG A0B;
    public final C2232nO A0C;
    public final C2417qT A0D;
    public final InterfaceC2459r9 A0E;
    public final C1539c2 A0F;
    public final boolean A0G;
    public final boolean A0H;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private final ImageView A03(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        Bitmap bitmapA01 = AbstractC2438qo.A01(EnumC2437qn.OTHER_SKIP);
        C1h.A08(bitmapA01, A0B(197, 30, 36));
        Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmapA01, AbstractC2383pv.A0e, AbstractC2383pv.A0e, true);
        C1h.A08(bitmapCreateScaledBitmap, A0B(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 23, 16));
        ImageView imageView = new ImageView(this.A0A);
        imageView.setImageBitmap(bitmapCreateScaledBitmap);
        imageView.setColorFilter(-1);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        gradientDrawable.setColor(Color.parseColor(A0B(27, 9, 69)));
        imageView.setBackground(gradientDrawable);
        imageView.setPadding(AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y);
        imageView.setOnClickListener(new ViewOnClickListenerC2266ny(viewOnClickListenerC0884El));
        imageView.setLayoutParams(new FrameLayout.LayoutParams(AbstractC2383pv.A0H, AbstractC2383pv.A0H, 8388661));
        imageView.setVisibility(0);
        return imageView;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private final LinearLayout A04() {
        LinearLayout linearLayout = new LinearLayout(this.A0A);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(16);
        int i5 = this.A05 * 44;
        ImageView imageView = new ImageView(this.A0A);
        imageView.setLayoutParams(new LinearLayout.LayoutParams(i5, i5));
        imageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        imageView.setBackground(gradientDrawable);
        imageView.setClipToOutline(true);
        String strA01 = this.A08.A35().A01();
        C1h.A08(strA01, A0B(292, 20, 106));
        if (strA01.length() > 0) {
            new AsyncTaskC0892Et(imageView, this.A0A).A04().A07(strA01);
        }
        linearLayout.addView(imageView);
        LinearLayout linearLayout2 = new LinearLayout(this.A0A);
        linearLayout2.setOrientation(1);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.setMarginStart(AbstractC2383pv.A0X);
        linearLayout2.setLayoutParams(layoutParams);
        TextView textView = new TextView(this.A0A);
        String strA0G = this.A08.A32().A0J().A0G();
        String strA0B = A0B(0, 0, 78);
        if (strA0G == null) {
            strA0G = strA0B;
        }
        textView.setText(strA0G);
        textView.setTextColor(-1);
        textView.setTextSize(20.0f);
        textView.setIncludeFontPadding(false);
        textView.setTypeface(textView.getTypeface(), 1);
        linearLayout2.addView(textView);
        TextView textView2 = new TextView(this.A0A);
        String strA0F = this.A08.A32().A0J().A0F();
        if (strA0F != null) {
            strA0B = strA0F;
        }
        String lowerCase = strA0B.toLowerCase(Locale.ROOT);
        C1h.A08(lowerCase, A0B(337, 16, 113));
        textView2.setText(lowerCase);
        textView2.setTextColor(Color.parseColor(A0B(45, 7, 19)));
        textView2.setTextSize(12.0f);
        textView2.setIncludeFontPadding(false);
        linearLayout2.addView(textView2);
        linearLayout.addView(linearLayout2);
        return linearLayout;
    }

    public static String A0B(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0I, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 31);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0D() {
        byte[] bArr = {-127, -114, -114, -114, -114, -114, -114, -114, -114, -123, -108, -104, -110, -110, -110, -110, -110, -110, -71, -52, -52, -58, -58, -58, -58, -58, -58, -121, -100, -108, -108, -108, -108, -108, -108, -108, -96, -74, -74, -83, -83, -83, -83, -83, -83, 85, 116, 98, 116, 101, 116, 106, -62, -59, -90, -41, -58, -49, -43, -82, -62, -49, -62, -56, -58, -45, -61, -63, -46, -60, -61, -50, -44, 1, -1, 16, 2, 7, 12, 2, -97, -85, -86, -80, -95, -76, -80, -78, -63, -76, -80, -61, -76, -107, -60, -69, -69, -94, -78, -63, -76, -76, -67, -112, -77, -110, -63, -76, -77, -72, -61, -101, -72, -67, -76, -94, -61, -80, -61, -72, -78, -91, -72, -76, -58, 119, 125, 125, 125, 120, -110, -95, -108, -112, -93, -108, -126, -110, -112, -101, -108, -109, 113, -104, -93, -100, -112, -97, 87, 93, 93, 93, 88, -60, -45, -58, -62, -43, -58, -73, -58, -45, -43, -54, -60, -62, -51, -88, -45, -62, -59, -54, -58, -49, -43, -80, -41, -58, -45, -51, -62, -38, -119, -113, -113, -113, -118, -75, -78, -59, -78, -109, -58, -65, -75, -67, -74, -86, -88, -73, -123, -84, -73, -80, -92, -77, -119, -75, -78, -80, -120, -79, -90, -78, -89, -88, -89, -116, -80, -92, -86, -88, 107, 113, 113, 113, 108, -104, -106, -91, 116, -99, -102, -106, -97, -91, -123, -96, -100, -106, -97, 89, 95, 95, 95, 90, -114, -116, -101, 107, -105, -120, 108, -107, -117, 106, -120, -103, -117, 119, -103, -106, -117, -100, -118, -101, -102, 79, 85, 85, 85, 80, -15, -17, -2, -49, -8, -18, -51, -21, -4, -18, -3, -50, -21, -2, -21, -78, -72, -72, -72, -77, -16, -18, -3, -39, -22, -16, -18, -46, -10, -22, -16, -18, -34, -5, -11, -79, -73, -73, -73, -78, -52, -55, -45, -44, -59, -50, -59, -46, -34, -52, -39, -34, -104, -34, -48, -35, -44, -47, -104, -40, -48, -49, -44, -32, -40, 4, -1, -36, -1, 7, -11, 2, -45, -15, 3, -11, -72, -66, -66, -66, -71, -88, -93, -87, -105, -100, 120, -107, -88, -107, -122, -103, -105, -93, -90, -104, -103, -90, -106, -119, -123, -105, -127, -126, -119, -116, -119, -108, -103, 99, -120, -123, -125, -117, -123, -110};
        if (A0J[1].charAt(5) == '0') {
            throw new RuntimeException();
        }
        A0J[6] = "QP2wMBMLjmxObTzbY";
        A0I = bArr;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final View A0H(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        this.A02 = viewOnClickListenerC0884El;
        this.A03 = viewOnClickListenerC0884El != null ? viewOnClickListenerC0884El.getClickUrl() : null;
        RelativeLayout relativeLayout = new RelativeLayout(this.A0A);
        relativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        int iGenerateViewId = View.generateViewId();
        LinearLayout linearLayoutA04 = A04();
        linearLayoutA04.setId(iGenerateViewId);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(10);
        layoutParams.setMargins(AbstractC2383pv.A0A, AbstractC2383pv.A0P, AbstractC2383pv.A0A, 0);
        relativeLayout.addView(linearLayoutA04, layoutParams);
        C7O c7oA05 = A05(viewOnClickListenerC0884El);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams2.addRule(3, iGenerateViewId);
        layoutParams2.setMargins(0, AbstractC2383pv.A0A, 0, 0);
        relativeLayout.addView(c7oA05, layoutParams2);
        View viewA0B = AbstractC2426qc.A0B(this.A0A, A0N);
        C1h.A08(viewA0B, A0B(153, 34, 66));
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-1, (int) (this.A0A.getResources().getDisplayMetrics().heightPixels * 0.4f));
        layoutParams3.addRule(12);
        relativeLayout.addView(viewA0B, layoutParams3);
        Integer numA08 = A08(relativeLayout);
        if (viewOnClickListenerC0884El != null) {
            viewOnClickListenerC0884El.setV2Design(true);
        }
        View viewA02 = A02(viewOnClickListenerC0884El);
        AbstractC2426qc.A0H(1001, viewA02);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-1, -2);
        if (numA08 != null) {
            layoutParams4.addRule(2, numA08.intValue());
        } else {
            layoutParams4.addRule(12);
        }
        layoutParams4.setMargins(AbstractC2383pv.A0H, 0, AbstractC2383pv.A0H, AbstractC2383pv.A0D);
        relativeLayout.addView(viewA02, layoutParams4);
        A0E(relativeLayout, viewOnClickListenerC0884El);
        String[] strArr = A0J;
        if (strArr[4].charAt(23) != strArr[3].charAt(23)) {
            throw new RuntimeException();
        }
        A0J[6] = "xDpVTxiQh91ViluPZ";
        return relativeLayout;
    }

    static {
        A0D();
        A0K = new C2274o6(null);
        A0M = AbstractC2383pv.A0X;
        A0L = AbstractC2383pv.A05;
        A0N = new int[]{Color.parseColor(A0B(0, 9, 63)), Color.parseColor(A0B(9, 9, 67)), Color.parseColor(A0B(18, 9, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE)), Color.parseColor(A0B(36, 9, 94))};
    }

    public C2250ng(C0958Hi c0958Hi, LA la2, C2232nO c2232nO, InterfaceC2224nG interfaceC2224nG, C1539c2 c1539c2, C2417qT c2417qT, InterfaceC2459r9 interfaceC2459r9) {
        C1h.A09(c0958Hi, A0B(80, 7, 29));
        C1h.A09(la2, A0B(187, 10, 50));
        C1h.A09(interfaceC2224nG, A0B(52, 14, 66));
        C1h.A09(c1539c2, A0B(370, 18, 1));
        C1h.A09(c2417qT, A0B(353, 17, 21));
        C1h.A09(interfaceC2459r9, A0B(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 8, 65));
        this.A0A = c0958Hi;
        this.A08 = la2;
        this.A0C = c2232nO;
        this.A0B = interfaceC2224nG;
        this.A0F = c1539c2;
        this.A0D = c2417qT;
        this.A0E = interfaceC2459r9;
        this.A05 = AbstractC1856hD.A00(this.A0A.getResources().getDisplayMetrics());
        C1747fQ c1747fQA0L = this.A08.A32().A0L();
        C1h.A08(c1747fQA0L, A0B(272, 20, 107));
        this.A09 = c1747fQA0L;
        this.A0H = this.A08.A3R();
        this.A0G = this.A08.A3N();
        this.A04 = true;
        this.A07 = this.A05 * 52;
        this.A06 = this.A05 * 12;
    }

    private final int A01(RelativeLayout relativeLayout) {
        C2570sw staticView = AbstractC2571sx.A02(this.A0A, EnumC2569sv.A02, this.A08);
        C1h.A08(staticView, A0B(87, 43, 48));
        staticView.setBackgroundColor(-2145637581);
        int iGenerateViewId = View.generateViewId();
        staticView.setId(iGenerateViewId);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(12);
        layoutParams.addRule(9);
        int i5 = AbstractC2383pv.A0L;
        int i11 = AbstractC2383pv.A00;
        int id2 = AbstractC2383pv.A00;
        layoutParams.setMargins(i5, i11, id2, AbstractC2383pv.A0A);
        staticView.setLayoutParams(layoutParams);
        relativeLayout.addView(staticView);
        staticView.bringToFront();
        return iGenerateViewId;
    }

    private final View A02(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        if (viewOnClickListenerC0884El == null) {
            return new View(this.A0A);
        }
        ViewParent parent = viewOnClickListenerC0884El.getParent();
        ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
        if (viewGroup != null) {
            viewGroup.removeView(viewOnClickListenerC0884El);
        }
        viewOnClickListenerC0884El.setPadding(AbstractC2383pv.A0C, AbstractC2383pv.A0A, AbstractC2383pv.A0C, AbstractC2383pv.A0A);
        viewOnClickListenerC0884El.setTextSize(18.0f);
        viewOnClickListenerC0884El.setTextColor(-1);
        viewOnClickListenerC0884El.A0G(this.A08.A32().A0K());
        viewOnClickListenerC0884El.A0D();
        if (Build.VERSION.SDK_INT >= 28) {
            viewOnClickListenerC0884El.setTypeface(Typeface.create(Typeface.SANS_SERIF, 600, false));
        } else {
            viewOnClickListenerC0884El.setTypeface(Typeface.create(A0B(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 17, 76), 0));
        }
        AbstractC2426qc.A0W(viewOnClickListenerC0884El, AbstractC2426qc.A06(this.A08.A31().A01().A04(), 30));
        viewOnClickListenerC0884El.setOnClickListener(new ViewOnClickListenerC2270o2(this, viewOnClickListenerC0884El));
        return viewOnClickListenerC0884El;
    }

    private final C7O A05(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        C7O c7o = new C7O(this.A0A);
        final C0958Hi c0958Hi = this.A0A;
        final int i5 = 2;
        c7o.setLayoutManager(new J7(c0958Hi, i5) { // from class: com.facebook.ads.redexgen.X.7R
            public static byte[] A08;
            public static String[] A09 = {"9kLr1WrXsHa3M9TgBHJLOPgxVi9eEaJd", "Hwn1FtZhFEuRGdjcAAiQHbIVkVtzWoXw", "N2FY1RSHagDHrat2sORkMClT1qQJyzT4", "9U5bRn3oIic4od7Lo5Amo88ct05Vzg8U", "e4fPsoc1p5Z5", "BImFMNmrLCZsBrFcKWswQEbzCM1iKCVV", "wO483yQGExLL395Cz2XsuwqkNSOlOT89", "eVpW8ZKHpbYC3WRWTmcpsPIycNmj53gw"};
            public int[] A03;
            public View[] A04;
            public boolean A02 = false;
            public int A00 = -1;
            public final SparseIntArray A07 = new SparseIntArray();
            public final SparseIntArray A06 = new SparseIntArray();
            public AbstractC1938iY A01 = new J9();
            public final Rect A05 = new Rect();

            public static String A04(int i11, int i12, int i13) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A08, i11, i11 + i12);
                for (int i14 = 0; i14 < bArrCopyOfRange.length; i14++) {
                    bArrCopyOfRange[i14] = (byte) ((bArrCopyOfRange[i14] - i13) - 46);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A09() {
                A08 = new byte[]{117, -57, -70, -58, -54, -66, -57, -70, -56, 117, -117, -34, -37, -52, -39, -34, -117, -51, -32, -33, -117, -78, -35, -44, -49, -73, -52, -28, -38, -32, -33, -72, -52, -39, -52, -46, -48, -35, -117, -45, -52, -34, -117, -38, -39, -41, -28, -117, 98, -75, -78, -93, -80, -75, 112, -22, 8, 21, 21, 22, 27, -57, 13, 16, 21, 11, -57, 26, 23, 8, 21, -57, 26, 16, 33, 12, -57, 13, 22, 25, -57, 23, 25, 12, -57, 19, 8, 32, 22, 28, 27, -57, 23, 22, 26, 16, 27, 16, 22, 21, -43, -57, -76, -46, -33, -33, -32, -27, -111, -41, -38, -33, -43, -111, -28, -31, -46, -33, -111, -28, -38, -21, -42, -111, -41, -32, -29, -111, -31, -29, -42, -111, -35, -46, -22, -32, -26, -27, -111, -31, -32, -28, -38, -27, -38, -32, -33, -97, -111, -70, -27, -111, -38, -28, -111, -33, -32, -27, -111, -44, -46, -44, -39, -42, -43, -99, -111, -33, -32, -27, -111, -38, -33, -111, -27, -39, -42, -111, -46, -43, -46, -31, -27, -42, -29, -97, -111, -63, -32, -28, -85, -120, -77, -86, -91, -115, -94, -70, -80, -74, -75, -114, -94, -81, -94, -88, -90, -77, 122, -91, -106, -98, 81, -110, -91, 81, -95, -96, -92, -102, -91, -102, -96, -97, 81, -113, -84, -99, -86, 92, -97, -85, -79, -86, -80, 92, -81, -92, -85, -79, -88, -96, 92, -98, -95, 92, -99, -80, 92, -88, -95, -99, -81, -80, 92, 109, 106, 92, -116, -82, -85, -78, -91, -96, -95, -96, 92};
                if (A09[4].length() != 12) {
                    throw new RuntimeException();
                }
                A09[4] = "puXpivvk6aYt";
            }

            /* JADX WARN: Failed to parse debug info
            java.lang.ArrayIndexOutOfBoundsException: Index 31 out of bounds for length 31
            	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.restartVar(DebugInfoParser.java:193)
            	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:141)
            	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
            	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
            	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
             */
            /* JADX WARN: Removed duplicated region for block: B:49:0x0109  */
            /* JADX WARN: Removed duplicated region for block: B:50:0x010b  */
            /* JADX WARN: Removed duplicated region for block: B:53:0x0113  */
            @Override // com.facebook.ads.redexgen.X.J7, com.facebook.ads.redexgen.X.AbstractC1960iw
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final View A23(View view, int i11, C1968j4 c1968j4, C1975jB c1975jB) {
                int iA1T;
                int i12;
                int iA1T2;
                View viewA21 = A21(view);
                if (viewA21 == null) {
                    return null;
                }
                J8 j82 = (J8) viewA21.getLayoutParams();
                int i13 = j82.A00;
                int i14 = j82.A00 + j82.A01;
                if (super.A23(view, i11, c1968j4, c1975jB) == null) {
                    return null;
                }
                int iA3C = A3C(i11);
                if (A09[7].charAt(15) == 'h') {
                    throw new RuntimeException();
                }
                A09[7] = "1qIyFpk2B4niYfxvijQ1aho3M1IhYpwH";
                if ((iA3C == 1) != ((J7) this).A05) {
                    iA1T = A1T() - 1;
                    String[] strArr = A09;
                    if (strArr[3].charAt(7) == strArr[5].charAt(7)) {
                        throw new RuntimeException();
                    }
                    String[] strArr2 = A09;
                    strArr2[2] = "YgG31yQdUPAjb6n4TdZe4l2XdnEpIpNi";
                    strArr2[0] = "A3NQ1QYXMVCgZV4sIWdPvWV79WRKuFXd";
                    i12 = -1;
                    iA1T2 = -1;
                } else {
                    iA1T = 0;
                    i12 = 1;
                    iA1T2 = A1T();
                }
                boolean z11 = ((J7) this).A00 == 1 && A3K();
                View view2 = null;
                int i15 = -1;
                int iMin = 0;
                View view3 = null;
                int i16 = -1;
                int iMin2 = 0;
                int iA01 = A01(c1968j4, c1975jB, iA1T);
                if (A09[1].charAt(30) != 'Q') {
                    String[] strArr3 = A09;
                    strArr3[2] = "4OXB1zTHK0FfDwcJSNp4SOgnJJIm5T3A";
                    strArr3[0] = "tuUN1bDZVKjuad54EDpRd91g0wEEc6TJ";
                }
                while (iA1T != iA1T2) {
                    int iA012 = A01(c1968j4, c1975jB, iA1T);
                    View viewA20 = A20(iA1T);
                    if (viewA20 == viewA21) {
                        break;
                    }
                    if (!viewA20.hasFocusable() || iA012 == iA01) {
                        J8 j83 = (J8) viewA20.getLayoutParams();
                        int i17 = j83.A00;
                        int i18 = j83.A00 + j83.A01;
                        if (viewA20.hasFocusable() && i17 == i13 && i18 == i14) {
                            return viewA20;
                        }
                        boolean z12 = false;
                        if (A09[1].charAt(30) != 'Q') {
                            A09[6] = "HYCPy5adubR8cXmVzkwO4hDxrSLOMCLt";
                            if (viewA20.hasFocusable()) {
                                if (view2 != null) {
                                    if (viewA20.hasFocusable() || view3 != null) {
                                        int iMin3 = Math.min(i18, i14) - Math.max(i17, i13);
                                        if (viewA20.hasFocusable()) {
                                            if (iMin3 > iMin) {
                                                z12 = true;
                                            } else if (iMin3 == iMin) {
                                                if (z11 == (i17 > i15)) {
                                                    z12 = true;
                                                }
                                            }
                                        } else if (view2 == null) {
                                            if (A32(viewA20, false, true)) {
                                                if (iMin3 > iMin2) {
                                                    z12 = true;
                                                    String[] strArr4 = A09;
                                                    if (strArr4[3].charAt(7) == strArr4[5].charAt(7)) {
                                                        throw new RuntimeException();
                                                    }
                                                    String[] strArr5 = A09;
                                                    strArr5[3] = "yZWA7Oh2mw2x9fGC8vhBsipI7cLu4PjC";
                                                    strArr5[5] = "YDHVrvSltxQIcGyFsmOYsQ12sTCBBKf4";
                                                } else if (iMin3 == iMin2) {
                                                    if (z11 == (i17 > i16)) {
                                                        z12 = true;
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        z12 = true;
                                        if (A09[4].length() != 12) {
                                            throw new RuntimeException();
                                        }
                                        A09[4] = "2y6byukZUBrj";
                                    }
                                    if (z12) {
                                        boolean zHasFocusable = viewA20.hasFocusable();
                                        String[] strArr6 = A09;
                                        if (strArr6[2].charAt(4) != strArr6[0].charAt(4)) {
                                            throw new RuntimeException();
                                        }
                                        A09[6] = "oUcQOSxDGqt19NMnzeTPeCEbWv652xm7";
                                        if (zHasFocusable) {
                                            i15 = j83.A00;
                                            iMin = Math.min(i18, i14) - Math.max(i17, i13);
                                            view2 = viewA20;
                                        } else {
                                            i16 = j83.A00;
                                            iMin2 = Math.min(i18, i14) - Math.max(i17, i13);
                                            view3 = viewA20;
                                        }
                                    } else {
                                        continue;
                                    }
                                }
                            }
                        } else {
                            String[] strArr7 = A09;
                            strArr7[2] = "CJ4u16iyUdK4ThslC3jv84tu05z1Mmam";
                            strArr7[0] = "V4O81gPDHbQ69i6DHeD5Pd1kZExhG9Y2";
                            if (viewA20.hasFocusable()) {
                            }
                        }
                    } else if (view2 != null) {
                        break;
                    }
                    iA1T += i12;
                }
                return view2 != null ? view2 : view3;
            }

            /* JADX WARN: Failed to parse debug info
            java.lang.ArrayIndexOutOfBoundsException
             */
            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Type inference failed for: r0v1 */
            /* JADX WARN: Type inference failed for: r0v2, types: [boolean, int] */
            /* JADX WARN: Type inference failed for: r0v58 */
            @Override // com.facebook.ads.redexgen.X.J7
            public final void A3I(C1968j4 c1968j4, C1975jB c1975jB, C1941ib c1941ib, C1940ia c1940ia) {
                int iMakeMeasureSpec;
                int iA0y;
                View viewA03;
                int iA0A = ((J7) this).A04.A0A();
                ?? r02 = 0;
                boolean z11 = iA0A != 1073741824;
                int i11 = A1T() > 0 ? this.A03[this.A00] : 0;
                if (z11) {
                    A08();
                }
                boolean z12 = c1941ib.A03 == 1;
                int i12 = 0;
                int i13 = 0;
                int iA02 = this.A00;
                if (!z12) {
                    iA02 = A02(c1968j4, c1975jB, c1941ib.A01) + A03(c1968j4, c1975jB, c1941ib.A01);
                }
                while (i12 < this.A00 && c1941ib.A05(c1975jB) && iA02 > 0) {
                    int i14 = c1941ib.A01;
                    int iA03 = A03(c1968j4, c1975jB, i14);
                    if (iA03 > this.A00) {
                        throw new IllegalArgumentException(A04(Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, 17, 3) + i14 + A04(0, 10, 39) + iA03 + A04(10, 38, 61) + this.A00 + A04(48, 7, 20));
                    }
                    iA02 -= iA03;
                    if (iA02 < 0 || (viewA03 = c1941ib.A03(c1968j4)) == null) {
                        break;
                    }
                    i13 += iA03;
                    this.A04[i12] = viewA03;
                    i12++;
                }
                if (i12 == 0) {
                    c1940ia.A01 = true;
                    return;
                }
                int i15 = 0;
                float f11 = 0.0f;
                int i16 = i12;
                A0F(c1968j4, c1975jB, i12, i13, z12);
                int i17 = 0;
                while (i17 < i16) {
                    View view = this.A04[i17];
                    if (c1941ib.A08 == null) {
                        if (z12) {
                            A2L(view);
                        } else {
                            A2N(view, r02);
                        }
                    } else if (z12) {
                        A2K(view);
                    } else {
                        A2M(view, r02);
                    }
                    A2Q(view, this.A05);
                    A0E(view, iA0A, r02);
                    int iA0E = ((J7) this).A04.A0E(view);
                    if (iA0E > i15) {
                        i15 = iA0E;
                    }
                    float fA0F = (((J7) this).A04.A0F(view) * 1.0f) / ((J8) view.getLayoutParams()).A01;
                    if (fA0F > f11) {
                        f11 = fA0F;
                    }
                    i17++;
                    r02 = 0;
                }
                if (z11) {
                    A0A(f11, i11);
                    i15 = 0;
                    for (int i18 = 0; i18 < i16; i18++) {
                        View view2 = this.A04[i18];
                        A0E(view2, 1073741824, true);
                        int iA0E2 = ((J7) this).A04.A0E(view2);
                        if (iA0E2 > i15) {
                            i15 = iA0E2;
                        }
                    }
                }
                for (int i19 = 0; i19 < i16; i19++) {
                    View view3 = this.A04[i19];
                    if (((J7) this).A04.A0E(view3) != i15) {
                        J8 j82 = (J8) view3.getLayoutParams();
                        Rect rect = j82.A03;
                        int i21 = rect.top + rect.bottom + j82.topMargin + j82.bottomMargin;
                        int i22 = rect.left + rect.right + j82.leftMargin + j82.rightMargin;
                        int iA00 = A00(j82.A00, j82.A01);
                        if (((J7) this).A00 == 1) {
                            iMakeMeasureSpec = AbstractC1960iw.A0y(iA00, 1073741824, i22, j82.width, false);
                            iA0y = View.MeasureSpec.makeMeasureSpec(i15 - i21, 1073741824);
                        } else {
                            iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(i15 - i22, 1073741824);
                            iA0y = AbstractC1960iw.A0y(iA00, 1073741824, i21, j82.height, false);
                        }
                        A0D(view3, iMakeMeasureSpec, iA0y, true);
                    }
                }
                c1940ia.A00 = i15;
                int iA1b = 0;
                int iA0F = 0;
                int iA1d = 0;
                int iA0F2 = 0;
                if (((J7) this).A00 == 1) {
                    if (c1941ib.A05 == -1) {
                        iA0F2 = c1941ib.A06;
                        iA1d = iA0F2 - i15;
                    } else {
                        iA1d = c1941ib.A06;
                        iA0F2 = iA1d + i15;
                    }
                } else if (c1941ib.A05 == -1) {
                    iA0F = c1941ib.A06;
                    iA1b = iA0F - i15;
                } else {
                    iA1b = c1941ib.A06;
                    iA0F = iA1b + i15;
                }
                for (int i23 = 0; i23 < i16; i23++) {
                    View view4 = this.A04[i23];
                    J8 j83 = (J8) view4.getLayoutParams();
                    if (((J7) this).A00 != 1) {
                        iA1d = A1d() + this.A03[j83.A00];
                        iA0F2 = ((J7) this).A04.A0F(view4) + iA1d;
                    } else if (A3K()) {
                        iA0F = A1b() + this.A03[this.A00 - j83.A00];
                        iA1b = iA0F - ((J7) this).A04.A0F(view4);
                    } else {
                        iA1b = A1b() + this.A03[j83.A00];
                        iA0F = ((J7) this).A04.A0F(view4) + iA1b;
                    }
                    if (A09[4].length() != 12) {
                        throw new RuntimeException();
                    }
                    String[] strArr = A09;
                    strArr[3] = "jDY10Pv22uFpeMvX0V6i142gwywCcC9J";
                    strArr[5] = "FV7lsl9dkYLhGTz220Rnt8nJefodQa6Z";
                    A2P(view4, iA1b, iA1d, iA0F, iA0F2);
                    if (j83.A02() || j83.A01()) {
                        c1940ia.A03 = true;
                    }
                    c1940ia.A02 |= view4.hasFocusable();
                }
                Arrays.fill(this.A04, (Object) null);
            }

            static {
                A09();
            }

            {
                A0C(i5);
            }

            private final int A00(int i11, int i12) {
                if (((J7) this).A00 == 1 && A3K()) {
                    return this.A03[this.A00 - i11] - this.A03[(this.A00 - i11) - i12];
                }
                return this.A03[i11 + i12] - this.A03[i11];
            }

            private int A01(C1968j4 c1968j4, C1975jB c1975jB, int i11) {
                if (!c1975jB.A07()) {
                    return this.A01.A02(i11, this.A00);
                }
                int iA0F = c1968j4.A0F(i11);
                if (iA0F == -1) {
                    Log.w(A04(191, 17, 19), A04(55, 47, Sdk.SDKError.Reason.TPAT_ERROR_VALUE) + i11);
                    return 0;
                }
                AbstractC1938iY abstractC1938iY = this.A01;
                int adapterPosition = this.A00;
                return abstractC1938iY.A02(iA0F, adapterPosition);
            }

            private int A02(C1968j4 c1968j4, C1975jB c1975jB, int i11) {
                if (!c1975jB.A07()) {
                    return this.A01.A01(i11, this.A00);
                }
                int cached = this.A06.get(i11, -1);
                if (cached != -1) {
                    return cached;
                }
                int iA0F = c1968j4.A0F(i11);
                if (iA0F == -1) {
                    Log.w(A04(191, 17, 19), A04(102, 89, 67) + i11);
                    return 0;
                }
                AbstractC1938iY abstractC1938iY = this.A01;
                String[] strArr = A09;
                if (strArr[3].charAt(7) == strArr[5].charAt(7)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A09;
                strArr2[3] = "JLTNjPrw2Gir3uiEgJ7pvKx1kutZQE6G";
                strArr2[5] = "hHzcc7Wnn6r2KSuYqxenyoprhCz5yDXw";
                return abstractC1938iY.A01(iA0F, this.A00);
            }

            private int A03(C1968j4 c1968j4, C1975jB c1975jB, int i11) {
                if (!c1975jB.A07()) {
                    return this.A01.A00(i11);
                }
                int cached = this.A07.get(i11, -1);
                if (cached != -1) {
                    return cached;
                }
                int iA0F = c1968j4.A0F(i11);
                if (iA0F == -1) {
                    Log.w(A04(191, 17, 19), A04(102, 89, 67) + i11);
                    return 1;
                }
                return this.A01.A00(iA0F);
            }

            private void A05() {
                int iA1T = A1T();
                for (int i11 = 0; i11 < iA1T; i11++) {
                    J8 j82 = (J8) A20(i11).getLayoutParams();
                    int iA00 = j82.A00();
                    SparseIntArray sparseIntArray = this.A07;
                    int childCount = j82.A05();
                    sparseIntArray.put(iA00, childCount);
                    SparseIntArray sparseIntArray2 = this.A06;
                    int childCount2 = j82.A04();
                    sparseIntArray2.put(iA00, childCount2);
                }
            }

            private void A06() {
                this.A07.clear();
                this.A06.clear();
            }

            private void A07() {
                if (this.A04 == null || this.A04.length != this.A00) {
                    this.A04 = new View[this.A00];
                }
            }

            private void A08() {
                int iA1U;
                if (A3B() == 1) {
                    iA1U = (A1e() - A1c()) - A1b();
                } else {
                    iA1U = (A1U() - A1a()) - A1d();
                }
                A0B(iA1U);
            }

            private void A0A(float f11, int i11) {
                int contentSize = Math.round(this.A00 * f11);
                A0B(Math.max(contentSize, i11));
            }

            private void A0B(int i11) {
                this.A03 = A0H(this.A03, this.A00, i11);
            }

            private final void A0C(int i11) {
                if (i11 == this.A00) {
                    return;
                }
                this.A02 = true;
                if (i11 >= 1) {
                    this.A00 = i11;
                    this.A01.A04();
                    A28();
                    return;
                }
                throw new IllegalArgumentException(A04(Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE, 42, 14) + i11);
            }

            private void A0D(View view, int i11, int i12, boolean z11) {
                boolean zA2z;
                C1961ix lp2 = (C1961ix) view.getLayoutParams();
                if (z11) {
                    zA2z = A30(view, i11, i12, lp2);
                } else {
                    zA2z = A2z(view, i11, i12, lp2);
                }
                if (zA2z) {
                    view.measure(i11, i12);
                }
            }

            private void A0E(View view, int i11, boolean z11) {
                int horizontalInsets;
                int availableSpaceInOther;
                J8 j82 = (J8) view.getLayoutParams();
                Rect decorInsets = j82.A03;
                int horizontalInsets2 = decorInsets.top + decorInsets.bottom + j82.topMargin + j82.bottomMargin;
                int availableSpaceInOther2 = decorInsets.left + decorInsets.right + j82.leftMargin + j82.rightMargin;
                int verticalInsets = A00(j82.A00, j82.A01);
                if (((J7) this).A00 == 1) {
                    availableSpaceInOther = AbstractC1960iw.A0y(verticalInsets, i11, availableSpaceInOther2, j82.width, false);
                    horizontalInsets = AbstractC1960iw.A0y(((J7) this).A04.A0C(), A1V(), horizontalInsets2, j82.height, true);
                } else {
                    horizontalInsets = AbstractC1960iw.A0y(verticalInsets, i11, horizontalInsets2, j82.height, false);
                    availableSpaceInOther = AbstractC1960iw.A0y(((J7) this).A04.A0C(), A1f(), availableSpaceInOther2, j82.width, true);
                }
                A0D(view, availableSpaceInOther, horizontalInsets, z11);
            }

            private void A0F(C1968j4 c1968j4, C1975jB c1975jB, int i11, int i12, boolean z11) {
                int i13;
                int i14;
                if (z11) {
                    i13 = 0;
                    i14 = 1;
                } else {
                    i13 = i11 - 1;
                    i11 = -1;
                    i14 = -1;
                }
                int span = 0;
                while (i13 != i11) {
                    View[] viewArr = this.A04;
                    int end = A09[1].charAt(30);
                    if (end == 81) {
                        throw new RuntimeException();
                    }
                    String[] strArr = A09;
                    strArr[2] = "wc6X17K8mmpBkT5fmZtkYbasceXjZ8mX";
                    strArr[0] = "9dmp1WHzjZH9IdBMCA9s1jprMiBM5vHe";
                    View view = viewArr[i13];
                    J8 j82 = (J8) view.getLayoutParams();
                    int start = A1o(view);
                    j82.A01 = A03(c1968j4, c1975jB, start);
                    j82.A00 = span;
                    int start2 = j82.A01;
                    span += start2;
                    i13 += i14;
                }
            }

            private void A0G(C1968j4 c1968j4, C1975jB c1975jB, C1939iZ c1939iZ, int i11) {
                boolean layingOutInPrimaryDirection = i11 == 1;
                int indexLimit = A02(c1968j4, c1975jB, c1939iZ.A01);
                if (layingOutInPrimaryDirection) {
                    while (indexLimit > 0 && c1939iZ.A01 > 0) {
                        c1939iZ.A01--;
                        indexLimit = A02(c1968j4, c1975jB, c1939iZ.A01);
                    }
                    return;
                }
                int span = c1975jB.A03();
                int span2 = span - 1;
                int i12 = c1939iZ.A01;
                while (i12 < span2) {
                    int pos = A02(c1968j4, c1975jB, i12 + 1);
                    if (pos <= indexLimit) {
                        break;
                    }
                    i12++;
                    indexLimit = pos;
                }
                c1939iZ.A01 = i12;
            }

            public static int[] A0H(int[] iArr, int i11, int i12) {
                if (iArr == null || iArr.length != i11 + 1 || iArr[iArr.length - 1] != i12) {
                    int i13 = i11 + 1;
                    if (A09[4].length() != 12) {
                        throw new RuntimeException();
                    }
                    A09[7] = "vv0iURAO3icFnXXnJM2cqXJ9vsdvavs7";
                    iArr = new int[i13];
                }
                iArr[0] = 0;
                int i14 = i12 / i11;
                int i15 = i12 % i11;
                int i16 = 0;
                int i17 = 0;
                for (int i18 = 1; i18 <= i11; i18++) {
                    int itemSize = i14;
                    i17 += i15;
                    if (i17 > 0) {
                        int additionalSize = i11 - i17;
                        String[] strArr = A09;
                        String str = strArr[3];
                        String str2 = strArr[5];
                        int sizePerSpanRemainder = str.charAt(7);
                        int sizePerSpan = str2.charAt(7);
                        if (sizePerSpanRemainder == sizePerSpan) {
                            throw new RuntimeException();
                        }
                        String[] strArr2 = A09;
                        strArr2[3] = "UgNCdvS81XDUHVgyrMOuBJ3R26L0EHoV";
                        strArr2[5] = "R99erQkTVJdSQMxqSAGNSgs10WAqnjdh";
                        if (additionalSize < i15) {
                            itemSize++;
                            i17 -= i11;
                        }
                    }
                    i16 += itemSize;
                    iArr[i18] = i16;
                }
                return iArr;
            }

            @Override // com.facebook.ads.redexgen.X.J7, com.facebook.ads.redexgen.X.AbstractC1960iw
            public final int A1g(int i11, C1968j4 c1968j4, C1975jB c1975jB) {
                A08();
                A07();
                return super.A1g(i11, c1968j4, c1975jB);
            }

            @Override // com.facebook.ads.redexgen.X.J7, com.facebook.ads.redexgen.X.AbstractC1960iw
            public final int A1h(int i11, C1968j4 c1968j4, C1975jB c1975jB) {
                A08();
                A07();
                return super.A1h(i11, c1968j4, c1975jB);
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
            public final int A1p(C1968j4 c1968j4, C1975jB c1975jB) {
                if (((J7) this).A00 == 1) {
                    return this.A00;
                }
                if (c1975jB.A03() < 1) {
                    return 0;
                }
                return A01(c1968j4, c1975jB, c1975jB.A03() - 1) + 1;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
            public final int A1q(C1968j4 c1968j4, C1975jB c1975jB) {
                if (((J7) this).A00 == 0) {
                    return this.A00;
                }
                if (c1975jB.A03() >= 1) {
                    return A01(c1968j4, c1975jB, c1975jB.A03() - 1) + 1;
                }
                if (A09[1].charAt(30) == 'Q') {
                    throw new RuntimeException();
                }
                A09[1] = "NQCGZE4snc0oLCx9Bq0iC7KiMR7a21PL";
                return 0;
            }

            @Override // com.facebook.ads.redexgen.X.J7, com.facebook.ads.redexgen.X.AbstractC1960iw
            public final C1961ix A24() {
                if (((J7) this).A00 == 0) {
                    return new J8(-2, -1);
                }
                return new J8(-1, -2);
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
            public final C1961ix A25(Context context, AttributeSet attributeSet) {
                return new J8(context, attributeSet);
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
            public final C1961ix A26(ViewGroup.LayoutParams layoutParams) {
                if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
                    return new J8((ViewGroup.MarginLayoutParams) layoutParams);
                }
                return new J8(layoutParams);
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
            public final void A2I(Rect rect, int i11, int i12) {
                int height;
                int horizontalPadding;
                if (this.A03 == null) {
                    super.A2I(rect, i11, i12);
                }
                int height2 = A1b() + A1c();
                int iA1d = A1d();
                int horizontalPadding2 = A1a();
                int usedWidth = iA1d + horizontalPadding2;
                int horizontalPadding3 = ((J7) this).A00;
                if (horizontalPadding3 == 1) {
                    int verticalPadding = rect.height();
                    int horizontalPadding4 = A1Y();
                    horizontalPadding = AbstractC1960iw.A0x(i12, verticalPadding + usedWidth, horizontalPadding4);
                    int[] iArr = this.A03;
                    int verticalPadding2 = this.A03.length;
                    int usedHeight = iArr[verticalPadding2 - 1];
                    int verticalPadding3 = A1Z();
                    height = AbstractC1960iw.A0x(i11, usedHeight + height2, verticalPadding3);
                } else {
                    int verticalPadding4 = rect.width();
                    int horizontalPadding5 = A1Z();
                    height = AbstractC1960iw.A0x(i11, verticalPadding4 + height2, horizontalPadding5);
                    int[] iArr2 = this.A03;
                    int horizontalPadding6 = this.A03.length;
                    int i13 = iArr2[horizontalPadding6 - 1] + usedWidth;
                    int iA1Y = A1Y();
                    int verticalPadding5 = A09[6].charAt(16);
                    if (verticalPadding5 != 122) {
                        throw new RuntimeException();
                    }
                    String[] strArr = A09;
                    strArr[2] = "IoRO1mUlIQsql7b5CtjKORAXMJVODzQ4";
                    strArr[0] = "l7qj1AW0tDX7BLad8OKHlCOG6KOG3ICn";
                    horizontalPadding = AbstractC1960iw.A0x(i12, i13, iA1Y);
                }
                A2E(height, horizontalPadding);
            }

            @Override // com.facebook.ads.redexgen.X.J7, com.facebook.ads.redexgen.X.AbstractC1960iw
            public final void A2Z(C1968j4 c1968j4, C1975jB c1975jB) {
                if (c1975jB.A07()) {
                    A05();
                }
                super.A2Z(c1968j4, c1975jB);
                A06();
            }

            /* JADX WARN: Removed duplicated region for block: B:23:0x006e  */
            /* JADX WARN: Removed duplicated region for block: B:24:0x0070  */
            @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final void A2b(C1968j4 c1968j4, C1975jB c1975jB, View view, C1904i0 c1904i0) {
                boolean z11;
                boolean z12;
                ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
                if (!(layoutParams instanceof J8)) {
                    A2R(view, c1904i0);
                    return;
                }
                J8 j82 = (J8) layoutParams;
                int iA01 = A01(c1968j4, c1975jB, j82.A00());
                if (((J7) this).A00 == 0) {
                    int iA04 = j82.A04();
                    int iA05 = j82.A05();
                    if (this.A00 > 1) {
                        int iA052 = j82.A05();
                        int spanGroupIndex = A09[4].length();
                        if (spanGroupIndex != 12) {
                            throw new RuntimeException();
                        }
                        A09[7] = "3PRF4lQlon0k2h16Lcqf7CajCjyMOWkl";
                        z12 = iA052 == this.A00;
                    }
                    c1904i0.A0Q(C1902hy.A00(iA04, iA05, iA01, 1, z12, false));
                    return;
                }
                int iA042 = j82.A04();
                int iA053 = j82.A05();
                if (this.A00 > 1) {
                    int spanGroupIndex2 = j82.A05();
                    z11 = spanGroupIndex2 == this.A00;
                }
                c1904i0.A0Q(C1902hy.A00(iA01, 1, iA042, iA053, z11, false));
            }

            @Override // com.facebook.ads.redexgen.X.J7, com.facebook.ads.redexgen.X.AbstractC1960iw
            public final void A2d(C1975jB c1975jB) {
                super.A2d(c1975jB);
                this.A02 = false;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
            public final void A2e(C7O c7o2) {
                this.A01.A04();
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
            public final void A2i(C7O c7o2, int i11, int i12) {
                this.A01.A04();
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
            public final void A2j(C7O c7o2, int i11, int i12) {
                this.A01.A04();
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
            public final void A2k(C7O c7o2, int i11, int i12, int i13) {
                this.A01.A04();
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
            public final void A2l(C7O c7o2, int i11, int i12, Object obj) {
                this.A01.A04();
            }

            @Override // com.facebook.ads.redexgen.X.J7, com.facebook.ads.redexgen.X.AbstractC1960iw
            public final boolean A2x() {
                return ((J7) this).A03 == null && !this.A02;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
            public final boolean A33(C1961ix c1961ix) {
                return c1961ix instanceof J8;
            }

            @Override // com.facebook.ads.redexgen.X.J7
            public final View A3D(C1968j4 c1968j4, C1975jB c1975jB, int i11, int i12, int i13) {
                A3E();
                View view = null;
                View view2 = null;
                int i14 = ((J7) this).A04.A0B();
                int iA07 = ((J7) this).A04.A07();
                int position = i12 > i11 ? 1 : -1;
                while (i11 != i12) {
                    View viewA20 = A20(i11);
                    int iA1o = A1o(viewA20);
                    if (A09[4].length() != 12) {
                        throw new RuntimeException();
                    }
                    A09[1] = "0gQBPdkOj6jC0BNk2pjE6k0ltAEPixhi";
                    if (iA1o >= 0 && iA1o < i13 && A02(c1968j4, c1975jB, iA1o) == 0) {
                        if (((C1961ix) viewA20.getLayoutParams()).A02()) {
                            if (view == null) {
                                view = viewA20;
                            }
                        } else if (((J7) this).A04.A0G(viewA20) >= iA07 || ((J7) this).A04.A0D(viewA20) < i14) {
                            if (view2 == null) {
                                view2 = viewA20;
                            }
                        } else {
                            return viewA20;
                        }
                    }
                    i11 += position;
                }
                return view2 != null ? view2 : view;
            }

            @Override // com.facebook.ads.redexgen.X.J7
            public final void A3H(C1968j4 c1968j4, C1975jB c1975jB, C1939iZ c1939iZ, int i11) {
                super.A3H(c1968j4, c1975jB, c1939iZ, i11);
                A08();
                if (c1975jB.A03() > 0 && !c1975jB.A07()) {
                    A0G(c1968j4, c1975jB, c1939iZ, i11);
                }
                A07();
            }

            /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
            @Override // com.facebook.ads.redexgen.X.J7
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final void A3J(C1975jB c1975jB, C1941ib c1941ib, InterfaceC1958iu interfaceC1958iu) {
                int i11 = this.A00;
                for (int spanSize = 0; spanSize < remainingSpan; spanSize++) {
                    boolean zA05 = c1941ib.A05(c1975jB);
                    int count = A09[7].charAt(15);
                    if (count != 104) {
                        A09[1] = "eKvfQ3MVY0jgH25E8smk48nzEk1UMoSe";
                        if (zA05 && i11 > 0) {
                            int pos = c1941ib.A01;
                            int remainingSpan = c1941ib.A07;
                            interfaceC1958iu.A4S(pos, Math.max(0, remainingSpan));
                            int remainingSpan2 = this.A01.A00(pos);
                            i11 -= remainingSpan2;
                            int i12 = c1941ib.A01;
                            int count2 = A09[6].charAt(16);
                            if (count2 == 122) {
                                String[] strArr = A09;
                                strArr[3] = "68Sjli68Q4mnkM1aaKbbiIL5wgTi3Uio";
                                strArr[5] = "WGMWaAcffFDLcnaicXdDZfaUrMcy3ekZ";
                                int remainingSpan3 = c1941ib.A03;
                                c1941ib.A01 = i12 + remainingSpan3;
                            }
                        } else {
                            return;
                        }
                    }
                    throw new RuntimeException();
                }
            }
        });
        c7o.setPadding(AbstractC2383pv.A06, 0, AbstractC2383pv.A06, A0L);
        c7o.setClipToPadding(false);
        c7o.A1n(new CN());
        C0958Hi c0958Hi2 = this.A0A;
        List<C2278oA> listA1v = this.A08.A1v();
        C1h.A08(listA1v, A0B(246, 26, 8));
        InterfaceC2224nG interfaceC2224nG = this.A0B;
        C1539c2 c1539c2 = this.A0F;
        C2417qT c2417qT = this.A0D;
        String strA37 = this.A08.A37();
        C1h.A08(strA37, A0B(Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 19, 18));
        c7o.setAdapter(new CP(c0958Hi2, listA1v, interfaceC2224nG, c1539c2, c2417qT, strA37, this.A08.A33(), new C06183o(this, viewOnClickListenerC0884El)));
        return c7o;
    }

    private final Integer A08(RelativeLayout relativeLayout) {
        Integer numA09 = null;
        if (this.A08.A3F()) {
            numA09 = A09(relativeLayout);
        }
        if (this.A08.A3U()) {
            A01(relativeLayout);
        }
        if (!this.A08.A3F() && !this.A08.A3U() && !this.A08.A3T()) {
            return A0A(relativeLayout);
        }
        return numA09;
    }

    private final Integer A09(RelativeLayout relativeLayout) {
        this.A00 = AbstractC2571sx.A01(this.A0A, false, this.A08, this.A0C, this.A0E, EnumC2569sv.A02, AbstractC2568su.A00(this.A08));
        C2566ss creditLine = this.A00;
        if (creditLine == null) {
            return null;
        }
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(12);
        layoutParams.addRule(11);
        layoutParams.setMargins(AbstractC2383pv.A00, AbstractC2383pv.A00, AbstractC2383pv.A0L, AbstractC2383pv.A0A);
        int iGenerateViewId = View.generateViewId();
        creditLine.setId(iGenerateViewId);
        creditLine.setLayoutParams(layoutParams);
        relativeLayout.addView(creditLine);
        creditLine.bringToFront();
        return Integer.valueOf(iGenerateViewId);
    }

    private final Integer A0A(RelativeLayout relativeLayout) {
        this.A01 = new C2635tz(this.A0A, this.A08, this.A0E, this.A0C, 0L, 16, null);
        C2635tz helper = this.A01;
        if (helper == null) {
            return null;
        }
        LinearLayout linearLayoutA0A = helper.A0A();
        int iGenerateViewId = View.generateViewId();
        linearLayoutA0A.setId(iGenerateViewId);
        relativeLayout.addView(linearLayoutA0A);
        linearLayoutA0A.bringToFront();
        return Integer.valueOf(iGenerateViewId);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x010a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void A0E(RelativeLayout relativeLayout, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        FrameLayout parent = new FrameLayout(this.A0A);
        parent.setPadding(0, this.A07, this.A06, this.A06);
        if (this.A0H) {
            parent.setOnClickListener(new ViewOnClickListenerC2271o3(viewOnClickListenerC0884El));
        }
        Bitmap bitmapA01 = AbstractC2438qo.A01(EnumC2437qn.NAV_CROSS);
        C1h.A08(bitmapA01, A0B(197, 30, 36));
        Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmapA01, AbstractC2383pv.A0e, AbstractC2383pv.A0e, true);
        C1h.A08(bitmapCreateScaledBitmap, A0B(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 23, 16));
        ImageView $this$addTopRightImage_u24lambda_u2413 = new ImageView(this.A0A);
        $this$addTopRightImage_u24lambda_u2413.setImageBitmap(bitmapCreateScaledBitmap);
        $this$addTopRightImage_u24lambda_u2413.setColorFilter(-1);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        gradientDrawable.setColor(Color.parseColor(A0B(27, 9, 69)));
        $this$addTopRightImage_u24lambda_u2413.setBackground(gradientDrawable);
        $this$addTopRightImage_u24lambda_u2413.setPadding(AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y, AbstractC2383pv.A0y);
        $this$addTopRightImage_u24lambda_u2413.setOnClickListener(new ViewOnClickListenerC2272o4(this));
        AbstractC2426qc.A0H(1002, $this$addTopRightImage_u24lambda_u2413);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(AbstractC2383pv.A0H, AbstractC2383pv.A0H, 8388661);
        long jA00 = this.A09.A00();
        if (this.A04 && jA00 > 0) {
            ImageView imageViewA03 = null;
            if (this.A0G && viewOnClickListenerC0884El != null) {
                imageViewA03 = A03(viewOnClickListenerC0884El);
                if (A0J[6].length() != 17) {
                    throw new RuntimeException();
                }
                A0J[2] = "qUm4TssES3ddn1g6iYHU1ivbyaOaGCjP";
                parent.addView(imageViewA03);
            }
            AbstractC1856hD.A01(this.A0A, $this$addTopRightImage_u24lambda_u2413, jA00, imageViewA03);
        }
        ImageView closeImageView = $this$addTopRightImage_u24lambda_u2413;
        if (A0J[2].charAt(26) != 'V') {
            A0J[6] = "vc25yqNstetMk0xq4";
            parent.addView(closeImageView, layoutParams);
            if (!this.A04) {
                $this$addTopRightImage_u24lambda_u2413.setVisibility(8);
            }
        } else {
            parent.addView(closeImageView, layoutParams);
            if (!this.A04) {
            }
        }
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(10);
        relativeLayout.addView(parent, layoutParams2);
        parent.bringToFront();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void A0F(ViewOnClickListenerC0884El viewOnClickListenerC0884El, String str, int i5, int i11) {
        if (viewOnClickListenerC0884El != null) {
            String str2 = str;
            if (A0J[2].charAt(26) == 'V') {
                throw new RuntimeException();
            }
            A0J[6] = "TU4oie8fUqrnHMiCu";
            if (str2 == null || str2.length() == 0) {
                return;
            }
            HashMap map = new HashMap();
            map.put(A0B(73, 7, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE), String.valueOf(i5));
            map.put(A0B(66, 7, 65), String.valueOf(i11));
            viewOnClickListenerC0884El.A0F();
            viewOnClickListenerC0884El.setClickUrl(str, map);
        }
    }

    public final ViewOnClickListenerC0884El A0I() {
        return this.A02;
    }

    public final void A0J() {
        C2566ss c2566ss = this.A00;
        if (c2566ss != null) {
            c2566ss.A0O();
        }
        C2635tz c2635tz = this.A01;
        if (c2635tz != null) {
            c2635tz.A0B();
        }
    }

    public final void A0K(boolean z11) {
        C2566ss c2566ss = this.A00;
        if (c2566ss != null) {
            c2566ss.A0P();
        }
        C2635tz c2635tz = this.A01;
        if (c2635tz != null) {
            c2635tz.A0C();
        }
    }

    public final void A0L(boolean z11) {
        this.A04 = z11;
    }
}
