package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.util.SparseBooleanArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.lu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2141lu {
    public static byte[] A0Q;
    public static String[] A0R = {"1jj8SStxLaN5Gyjeaj", "QvgR6gjZKPqPLN", "apBsNQLtySqcFbdMMI9pw7irAJNoIH7N", "WFUEGw1tXvrGnX", "aQ2MrcVxSn6lZk2kOw3AV7hj7b4buGYQ", "Q9MDG20ve4CP8cK9zJz6gY5cXp", "NCbcrL", "iOvYt6PwRkqdpvQ5ar7yKU7mCg"};
    public static final C2144lx A0S;
    public static final int A0T;
    public static final List<String> A0U;
    public int A00;
    public int A01;
    public int A02;
    public View A03;
    public RelativeLayout A04;
    public C2376po A05;
    public C2566ss A06;
    public F8 A07;
    public C2590tG A08;
    public F4 A09;
    public C2635tz A0A;
    public C2648uC A0B;
    public C8 A0C;
    public C0781Am A0D;
    public List<C1962iy> A0E;
    public boolean A0F;
    public final SparseBooleanArray A0G;
    public final RelativeLayout A0H;
    public final LA A0I;
    public final C1750fT A0J;
    public final C0958Hi A0K;
    public final InterfaceC2224nG A0L;
    public final C2232nO A0M;
    public final C2417qT A0N;
    public final InterfaceC2459r9 A0O;
    public final C1539c2 A0P;

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0Q, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 16);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A0Q = new byte[]{-38, -35, -67, -38, -19, -38, -69, -18, -25, -35, -27, -34, -30, -27, -58, -9, -26, -17, -11, -50, -30, -17, -30, -24, -26, -13, -79, -81, -64, -78, -63, -105, -69, -66, -64, -77, -63, -63, -73, -67, -68, -63, -29, -20, -23, -29, -21, -33, -13, -17, -11, -14, -29, -27, -85, -73, -74, -68, -83, -64, -68, -117, -102, -115, -119, -100, -115, 110, -99, -108, -108, 123, -117, -102, -115, -115, -106, 105, -116, 107, -102, -115, -116, -111, -100, 116, -111, -106, -115, 123, -100, -119, -100, -111, -117, 126, -111, -115, -97, 80, 86, 86, 86, 81, -70, -55, -68, -72, -53, -68, -99, -52, -61, -61, -86, -70, -55, -68, -68, -59, -104, -69, -102, -55, -68, -69, -64, -53, -93, -64, -59, -68, -83, -64, -68, -50, AbstractJsonLexerKt.TC_INVALID, -123, -123, -123, -128, -12, 3, -4, -4, -13, -6, -38, -3, -11, -11, -9, -4, -11, -42, -17, -4, -14, -6, -13, 0, -33, -35, -26, -35, -22, -31, -37, -91, -93, -78, -127, -86, -89, -93, -84, -78, -110, -83, -87, -93, -84, 102, 108, 108, 108, 103, -64, -59, -53, -68, -55, -72, -70, -53, -64, -51, -68, -102, -72, -55, -69, -96, -59, -67, -58, -93, -64, -54, -53, -104, -107, -102, -105, -32, -35, -25, -24, -39, -30, -39, -26, -7, 0, -9, -9, -85, -18, -20, -7, -7, -6, -1, -85, -19, -16, -85, -18, -20, -2, -1, -85, -1, -6, -85, -7, -6, -7, -72, -7, 0, -9, -9, -85, -1, 4, -5, -16, -85, -20, -7, -17, -3, -6, -12, -17, -71, 2, -12, -17, -14, -16, -1, -71, -35, -16, -9, -20, -1, -12, 1, -16, -41, -20, 4, -6, 0, -1, -71, -41, -20, 4, -6, 0, -1, -37, -20, -3, -20, -8, -2, -110, -111, 102, -110, -112, -109, -113, -120, -105, -120, -72, -87, -70, -83, -74, -68, -98, -79, -83, -65, -80, -95, -78, -91, -82, -76, -106, -87, -91, -73, -95, -94, -87, -84, -87, -76, -71, -125, -88, -91, -93, -85, -91, -78, -100, -103, -107, -110, -99, -120, -97, -110, -114, -96, -48, -51, -55, -58, -47, -68, -45, -58, -62, -44, -68, -47, -59, -46, -54, -65, -53, -66, -58, -55, -47, -46, -51, -48, -61, -67, -45, -48, -54, -14, -13, -18, -15, -28, -34, -12, -15, -21, -34, -10, -28, -31, -34, -27, -32, -21, -21, -31, -32, -30, -22, -80, -85, -79, -97, -92, -128, -99, -80, -99, -114, -95, -97, -85, -82, -96, -95, -82, -120, -127, 124, -119, 120, -123, -122, 116, AbstractJsonLexerKt.TC_INVALID, 114, AbstractJsonLexerKt.TC_INVALID, 124, -127, 126};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 11 out of bounds for length 11
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final void A0N(int i5) {
        if (this.A04 != null) {
            return;
        }
        this.A01 = i5;
        RelativeLayout relativeLayout = new RelativeLayout(this.A0K);
        relativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        C7O c7oA02 = A02();
        int i11 = AbstractC2383pv.A0P + AbstractC2452r2.A00;
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(10);
        layoutParams.setMargins(0, i11, 0, 0);
        AbstractC2426qc.A0L(c7oA02);
        this.A02 = c7oA02.getId();
        relativeLayout.addView(c7oA02, layoutParams);
        int id2 = c7oA02.getId();
        if (this.A0E.size() > 1) {
            C2648uC c2648uC = new C2648uC(this.A0K, this.A0E.size());
            c2648uC.setDotsOnlyMode(true);
            c2648uC.setCurrentPosition(i5);
            this.A0B = c2648uC;
            RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, AbstractC2383pv.A0A);
            layoutParams2.addRule(3, id2);
            layoutParams2.setMargins(0, AbstractC2383pv.A0X, 0, AbstractC2383pv.A06);
            AbstractC2426qc.A0L(c2648uC);
            relativeLayout.addView(c2648uC, layoutParams2);
            id2 = c2648uC.getId();
        }
        LinearLayout linearLayoutA01 = A01();
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams3.addRule(3, id2);
        relativeLayout.addView(linearLayoutA01, layoutParams3);
        this.A04 = relativeLayout;
        this.A0H.addView(relativeLayout);
        A0B();
        A0C(i5, A07(345, 10, 25));
    }

    static {
        A0A();
        A0S = new C2144lx(null);
        A0T = AbstractC2383pv.A0g;
        A0U = AbstractC05700v.A0A(A07(Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE, 4, 28), A07(384, 22, 111), A07(375, 9, 78), A07(423, 14, 3));
    }

    public C2141lu(C0958Hi c0958Hi, RelativeLayout relativeLayout, LA la2, InterfaceC2224nG interfaceC2224nG, C2417qT c2417qT, InterfaceC2459r9 interfaceC2459r9, C2232nO c2232nO, C1539c2 c1539c2, C1750fT c1750fT, SparseBooleanArray sparseBooleanArray) {
        C1h.A09(c0958Hi, A07(54, 7, 56));
        C1h.A09(relativeLayout, A07(Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY_VALUE, 10, 56));
        C1h.A09(la2, A07(0, 12, 105));
        C1h.A09(interfaceC2224nG, A07(12, 14, 113));
        C1h.A09(c2417qT, A07(TTAdConstant.LANDING_PAGE_TYPE_CODE, 17, 44));
        C1h.A09(interfaceC2459r9, A07(Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE, 8, 100));
        C1h.A09(c2232nO, A07(141, 20, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
        C1h.A09(c1539c2, A07(Sdk.SDKError.Reason.BLACK_SCREEN_DETECTION_ERROR_VALUE, 24, 48));
        C1h.A09(sparseBooleanArray, A07(26, 16, 62));
        this.A0K = c0958Hi;
        this.A0H = relativeLayout;
        this.A0I = la2;
        this.A0L = interfaceC2224nG;
        this.A0N = c2417qT;
        this.A0O = interfaceC2459r9;
        this.A0M = c2232nO;
        this.A0P = c1539c2;
        this.A0J = c1750fT;
        this.A0G = sparseBooleanArray;
        this.A0E = AbstractC05700v.A09();
    }

    private final LinearLayout A01() {
        F4 f42;
        LinearLayout linearLayout = new LinearLayout(this.A0K);
        linearLayout.setOrientation(1);
        AbstractC2426qc.A0W(linearLayout, new ColorDrawable(-1));
        CE ce2 = new CE(this);
        Activity activityA0E = this.A0K.A0E();
        if (AbstractC2204mw.A02(this.A0K) || activityA0E == null) {
            f42 = new F4(this.A0K, ce2);
        } else {
            f42 = new F4(this.A0K, activityA0E, ce2);
        }
        this.A09 = f42;
        F8 $this$createBrowserSection_u24lambda_u2413 = new F8(this.A0K, this.A09, true);
        $this$createBrowserSection_u24lambda_u2413.setCloseButtonVisibility(8);
        this.A07 = $this$createBrowserSection_u24lambda_u2413;
        linearLayout.addView(this.A07, new LinearLayout.LayoutParams(-1, -2));
        this.A08 = new C2590tG(this.A0K, null, 16842872);
        linearLayout.addView(this.A08, new LinearLayout.LayoutParams(-1, A0T));
        linearLayout.addView(this.A09, new LinearLayout.LayoutParams(-1, -1));
        return linearLayout;
    }

    private final C7O A02() {
        C7O recyclerView = new C7O(this.A0K);
        recyclerView.setLayoutManager(new J7(this.A0K, 0, false));
        C0958Hi c0958Hi = this.A0K;
        List<C1962iy> list = this.A0E;
        int i5 = this.A0K.getResources().getConfiguration().orientation;
        InterfaceC2224nG interfaceC2224nG = this.A0L;
        C2417qT c2417qT = this.A0N;
        String strA37 = this.A0I.A37();
        C1h.A08(strA37, A07(168, 19, 46));
        this.A0C = new C8(c0958Hi, list, i5, interfaceC2224nG, c2417qT, strA37, this.A0P, this.A0J, null, this.A0G, this.A0I.A2J(), new C06163m(this));
        recyclerView.setAdapter(this.A0C);
        recyclerView.setPadding(0, AbstractC2383pv.A0U, 0, AbstractC2383pv.A0U);
        recyclerView.setClipToPadding(false);
        recyclerView.A1n(new CD());
        recyclerView.A1o(new CC(this));
        recyclerView.post(new RunnableC2142lv(recyclerView, this));
        return recyclerView;
    }

    @JvmStatic
    public static final String A08(Uri uri) {
        return A0S.A03(uri);
    }

    private final void A0B() {
        RelativeLayout relativeLayout = this.A04;
        if (relativeLayout == null) {
            return;
        }
        if (A0H()) {
            A0D(relativeLayout);
            A0E(relativeLayout);
        } else {
            A0F(relativeLayout);
        }
    }

    private final void A0C(int i5, String str) {
        F4 f42;
        if (i5 < 0 || i5 >= this.A0E.size()) {
            return;
        }
        this.A01 = i5;
        C1962iy c1962iy = this.A0E.get(i5);
        C1735fE c1735fEA03 = c1962iy.A03();
        if (c1735fEA03 == null) {
            return;
        }
        C8 c82 = this.A0C;
        if (c82 != null) {
            c82.A0Q(i5);
        }
        HashMap map = new HashMap(c1962iy.A08());
        map.put(A07(42, 12, 112), str);
        this.A0M.A04(EnumC2231nN.A0J, map);
        C1746fP c1746fPA0K = c1735fEA03.A0K();
        Uri uriA00 = null;
        String strA06 = c1746fPA0K != null ? c1746fPA0K.A06() : null;
        if (strA06 != null && (!AnonymousClass04.A02(strA06))) {
            try {
                uriA00 = AbstractC2351pP.A00(strA06);
            } catch (SecurityException e3) {
                this.A0K.A08().ABz(A07(161, 7, 104), AbstractC2126lf.A2a, new C2127lg(e3));
            }
            String strA03 = A0S.A03(uriA00);
            if (strA03 == null || !(!AnonymousClass04.A02(strA03)) || (f42 = this.A09) == null) {
                return;
            }
            f42.loadUrl(strA03);
        }
    }

    private final void A0D(RelativeLayout relativeLayout) {
        if (this.A0I.A3S() || this.A0I.A3O()) {
            C2566ss view = AbstractC2571sx.A01(this.A0K, true, this.A0I, this.A0M, this.A0O, EnumC2569sv.A03, AbstractC2568su.A00(this.A0I));
            C1h.A08(view, A07(104, 37, 71));
            this.A06 = view;
            AbstractC2426qc.A0H(1116, view);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.addRule(3, this.A02);
            layoutParams.addRule(11);
            layoutParams.setMargins(AbstractC2383pv.A00, AbstractC2383pv.A0U, AbstractC2383pv.A0A, AbstractC2383pv.A0X);
            view.setLayoutParams(layoutParams);
            relativeLayout.addView(view);
        }
    }

    private final void A0E(RelativeLayout relativeLayout) {
        if (this.A0I.A3U()) {
            C2570sw staticView = AbstractC2571sx.A02(this.A0K, EnumC2569sv.A03, this.A0I);
            C1h.A08(staticView, A07(61, 43, 24));
            this.A03 = staticView;
            AbstractC2426qc.A0H(1117, staticView);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.addRule(3, this.A02);
            layoutParams.addRule(9);
            layoutParams.setMargins(AbstractC2383pv.A0A, AbstractC2383pv.A0U, AbstractC2383pv.A00, AbstractC2383pv.A0X);
            staticView.setLayoutParams(layoutParams);
            relativeLayout.addView(staticView);
        }
    }

    private final void A0F(RelativeLayout relativeLayout) {
        C2635tz c2635tz = new C2635tz(this.A0K, this.A0I, this.A0O, this.A0M, 0L, 16, null);
        this.A0A = c2635tz;
        ViewGroup.LayoutParams layoutParams = c2635tz.A0A().getLayoutParams();
        C1h.A07(layoutParams, A07(Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE, 79, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
        RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) layoutParams;
        layoutParams2.removeRule(12);
        layoutParams2.addRule(3, this.A02);
        layoutParams2.topMargin = AbstractC2383pv.A0U;
        layoutParams2.bottomMargin = AbstractC2383pv.A00;
        relativeLayout.addView(c2635tz.A0A());
        c2635tz.A0A().bringToFront();
    }

    private final boolean A0H() {
        if (!this.A0I.A3S() && !this.A0I.A3O()) {
            boolean zA3U = this.A0I.A3U();
            String[] strArr = A0R;
            if (strArr[6].length() == strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0R;
            strArr2[6] = "AlMgz6";
            strArr2[0] = "9tjPu4ljTDSbz4cYTV";
            if (!zA3U) {
                return false;
            }
        }
        return true;
    }

    public final void A0J() {
        C2376po c2376po = this.A05;
        if (c2376po != null) {
            c2376po.A0D();
        }
        this.A05 = null;
        C0781Am c0781Am = this.A0D;
        if (c0781Am != null) {
            c0781Am.A07();
        }
        AbstractC2426qc.A0K(this.A0D);
        this.A0D = null;
        F4 f42 = this.A09;
        if (f42 != null) {
            ViewParent parent = f42.getParent();
            ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
            if (viewGroup != null) {
                viewGroup.removeView(f42);
            }
            f42.stopLoading();
            f42.destroy();
        }
        this.A09 = null;
        this.A07 = null;
        this.A08 = null;
        this.A06 = null;
        C2635tz c2635tz = this.A0A;
        if (c2635tz != null) {
            c2635tz.A0B();
        }
        this.A0A = null;
        this.A04 = null;
    }

    public final void A0K() {
        F4 f42 = this.A09;
        if (f42 != null) {
            f42.onPause();
        }
        C2376po c2376po = this.A05;
        if (c2376po != null) {
            c2376po.A0E();
        }
        C2566ss c2566ss = this.A06;
        String[] strArr = A0R;
        if (strArr[3].length() != strArr[1].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0R;
        strArr2[7] = "MMaUZVLQxd3AUHx8WG4dgRVAIo";
        strArr2[5] = "vBEp1ohY0IxmcoXh9tDowuYbEO";
        if (c2566ss != null) {
            c2566ss.A0P();
        }
        C2635tz c2635tz = this.A0A;
        if (c2635tz != null) {
            c2635tz.A0C();
        }
    }

    public final void A0L() {
        F4 f42 = this.A09;
        if (f42 != null) {
            f42.onResume();
        }
        C2376po c2376po = this.A05;
        if (c2376po != null) {
            c2376po.A0F();
        }
    }

    public final void A0M(int i5) {
        A0C(i5, A07(355, 20, 77));
    }

    public final void A0O(long j11, long j12, InterfaceC05620n<AnonymousClass22> interfaceC05620n) {
        C1h.A09(interfaceC05620n, A07(301, 10, 19));
        RelativeLayout relativeLayout = this.A04;
        if (relativeLayout == null) {
            return;
        }
        long j13 = j11 - j12;
        if (j13 <= 0) {
            interfaceC05620n.AB0();
            String[] strArr = A0R;
            if (strArr[3].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0R;
            strArr2[2] = "SeW7s9f0ttwALx53nKPqTXmp33E1hmLI";
            strArr2[4] = "TUe4kjsYvlEfnvwjrAtJoqd1AXEAhSdV";
            return;
        }
        C0781Am c0781Am = new C0781Am(this.A0K, (int) j11);
        c0781Am.A0A(AbstractC0891Es.A0g, AbstractC0891Es.A0f, true);
        AbstractC2426qc.A0L(c0781Am);
        this.A00 = c0781Am.getId();
        this.A0D = c0781Am;
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, AbstractC2383pv.A0U);
        layoutParams.addRule(3, this.A02);
        layoutParams.addRule(14);
        layoutParams.setMargins(AbstractC2383pv.A0A, AbstractC2383pv.A00, AbstractC2383pv.A0A, AbstractC2383pv.A0U);
        relativeLayout.addView(c0781Am, layoutParams);
        C2648uC c2648uC = this.A0B;
        String strA07 = A07(Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE, 79, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
        if (c2648uC != null) {
            ViewGroup.LayoutParams layoutParams2 = c2648uC.getLayoutParams();
            C1h.A07(layoutParams2, strA07);
            RelativeLayout.LayoutParams layoutParams3 = (RelativeLayout.LayoutParams) layoutParams2;
            layoutParams3.removeRule(3);
            layoutParams3.addRule(3, this.A00);
            layoutParams3.topMargin = 0;
            c2648uC.setLayoutParams(layoutParams3);
        }
        C2566ss c2566ss = this.A06;
        if (c2566ss != null) {
            ViewGroup.LayoutParams layoutParams4 = c2566ss.getLayoutParams();
            C1h.A07(layoutParams4, strA07);
            RelativeLayout.LayoutParams layoutParams5 = (RelativeLayout.LayoutParams) layoutParams4;
            layoutParams5.removeRule(3);
            layoutParams5.addRule(3, this.A00);
            layoutParams5.topMargin = 0;
            c2566ss.setLayoutParams(layoutParams5);
        }
        View view = this.A03;
        if (view != null) {
            ViewGroup.LayoutParams layoutParams6 = view.getLayoutParams();
            C1h.A07(layoutParams6, strA07);
            RelativeLayout.LayoutParams layoutParams7 = (RelativeLayout.LayoutParams) layoutParams6;
            layoutParams7.removeRule(3);
            layoutParams7.addRule(3, this.A00);
            layoutParams7.topMargin = 0;
            view.setLayoutParams(layoutParams7);
        }
        C2635tz c2635tz = this.A0A;
        if (c2635tz != null) {
            ViewGroup.LayoutParams layoutParams8 = c2635tz.A0A().getLayoutParams();
            C1h.A07(layoutParams8, strA07);
            RelativeLayout.LayoutParams layoutParams9 = (RelativeLayout.LayoutParams) layoutParams8;
            layoutParams9.removeRule(3);
            layoutParams9.addRule(3, this.A00);
            layoutParams9.topMargin = 0;
            c2635tz.A0A().setLayoutParams(layoutParams9);
        }
        c0781Am.A09((int) j12);
        C2376po c2376po = new C2376po(j13, new CA(interfaceC05620n));
        c2376po.A0H(new CB(this, j12));
        this.A05 = c2376po;
        c2376po.A0G();
    }

    public final void A0P(List<C1962iy> list) {
        C1h.A09(list, A07(187, 23, 71));
        this.A0E = list;
    }
}
