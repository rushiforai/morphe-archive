package com.facebook.ads.redexgen.X;

import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.internal.api.BuildConfigApi;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.measurement.dynamite.ModuleDescriptor;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;
import javax.annotation.Nullable;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.c2, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1539c2 {
    public static byte[] A0G;
    public static String[] A0H = {"4lWoymCKcFFqvR4KGqpukkAdeBkDHFLG", "4SfXhahvn2cvHTwc", "1H78NFRDPNrHyZuRtW6OfnE16", "5zR7eGXCNOES3F", "tNutlosLurIud7dAWRzPLPvdzTHVgEY0", "XrTXE7Mp98Q", "ALMz8CaD4gcY6rgjWR0f79B0Q", "oMfYSWXrIKFBNYq7bMfMNj8ewYt05Dn"};
    public static final String A0I;
    public int A00;
    public int A01;
    public int A02;
    public long A03;

    @Nullable
    public AbstractRunnableC2319oq A04;
    public C1537c0 A05;
    public Map<String, Integer> A06;
    public boolean A07;
    public boolean A08;
    public final int A09;
    public final int A0A;
    public final Handler A0B;
    public final View A0C;
    public final C0958Hi A0D;
    public final WeakReference<AbstractC1540c3> A0E;
    public final boolean A0F;

    /* JADX WARN: Code restructure failed: missing block: B:34:0x0106, code lost:
    
        r8 = r8 + 1;
     */
    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 17 out of bounds for length 14
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A08(Vector<Rect> vector) {
        int size = vector.size();
        int[] iArr = new int[size * 2];
        int[] iArr2 = new int[size * 2];
        boolean[][] zArr = (boolean[][]) Array.newInstance((Class<?>) Boolean.TYPE, size * 2, size * 2);
        int i5 = 0;
        int i11 = 0;
        for (int i12 = 0; i12 < size; i12++) {
            Rect rectElementAt = vector.elementAt(i12);
            int i13 = i5 + 1;
            iArr[i5] = rectElementAt.left;
            int i14 = i11 + 1;
            iArr2[i11] = rectElementAt.bottom;
            i5 = i13 + 1;
            iArr[i13] = rectElementAt.right;
            i11 = i14 + 1;
            iArr2[i14] = rectElementAt.top;
        }
        Arrays.sort(iArr);
        Arrays.sort(iArr2);
        for (int i15 = 0; i15 < size; i15++) {
            Rect rectElementAt2 = vector.elementAt(i15);
            int iA09 = A09(iArr, rectElementAt2.left);
            int iA092 = A09(iArr, rectElementAt2.right);
            int iA093 = A09(iArr2, rectElementAt2.top);
            int i16 = rectElementAt2.bottom;
            if (A0H[0].charAt(24) != 'e') {
                throw new RuntimeException();
            }
            A0H[5] = "OkBp9M6GoSG";
            int iA094 = A09(iArr2, i16);
            for (int i17 = iA09 + 1; i17 <= iA092; i17++) {
                for (int i18 = iA093 + 1; i18 <= iA094; i18++) {
                    zArr[i17][i18] = true;
                }
            }
        }
        int i19 = 0;
        int i21 = 0;
        while (i21 < size * 2) {
            int i22 = 0;
            while (true) {
                int i23 = size * 2;
                String[] strArr = A0H;
                if (strArr[3].length() == strArr[6].length()) {
                    throw new RuntimeException();
                }
                A0H[5] = "8mdjYFfHzfR";
                if (i22 < i23) {
                    i19 += zArr[i21][i22] ? (iArr[i21] - iArr[i21 - 1]) * (iArr2[i22] - iArr2[i22 - 1]) : 0;
                    String[] strArr2 = A0H;
                    if (strArr2[3].length() != strArr2[6].length()) {
                        A0H[5] = "Lo9ucXqSR57";
                        i22++;
                    } else {
                        String[] strArr3 = A0H;
                        strArr3[3] = "Va2huEuqJLy8G9";
                        strArr3[6] = "xLD3f1Ctst12pSyAioan4nQjy";
                        i22 += 0;
                    }
                }
            }
        }
        return i19;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 9 out of bounds for length 9
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static C1537c0 A0E(View view, int i5, C0958Hi c0958Hi) {
        if (view == null) {
            A0N(null, false, A0H(353, 16, 31));
            return new C1537c0(EnumC1638dd.A08);
        }
        boolean zA2s = C2203mv.A2s(c0958Hi);
        String strA0H = A0H(TTAdConstant.VIDEO_COVER_URL_CODE, 37, 113);
        String strA0H2 = A0H(331, 22, 99);
        if (zA2s) {
            if (view.getParent() == null) {
                A0N(view, false, strA0H2);
                return new C1537c0(EnumC1638dd.A0K);
            }
            if (!view.isShown()) {
                A0N(view, false, strA0H);
                return new C1537c0(EnumC1638dd.A0N);
            }
        } else {
            if (view.getParent() == null) {
                A0N(view, false, strA0H2);
                return new C1537c0(EnumC1638dd.A0H);
            }
            if (!view.isShown()) {
                A0N(view, false, strA0H);
                return new C1537c0(EnumC1638dd.A0H);
            }
        }
        if (view.getWindowVisibility() != 0) {
            A0N(view, false, A0H(528, 37, 99));
            return new C1537c0(EnumC1638dd.A0I);
        }
        if (view.getMeasuredWidth() <= 0 || view.getMeasuredHeight() <= 0) {
            A0N(view, false, A0H(295, 36, 57) + view.getMeasuredWidth() + A0H(27, 4, 45) + view.getMeasuredHeight());
            return new C1537c0(EnumC1638dd.A0G);
        }
        if (A00(view) < 0.9f) {
            A0N(view, false, A0H(369, 27, 30));
            return new C1537c0(EnumC1638dd.A0B);
        }
        view.getWidth();
        view.getHeight();
        if (A0H[4].charAt(15) != 'A') {
            throw new RuntimeException();
        }
        A0H[4] = "6urEtCeD4ew6lB3ALfyGXwnH3LBfrVYN";
        try {
            view.getLocationOnScreen(new int[2]);
            Rect rect = new Rect();
            if (!view.getGlobalVisibleRect(rect)) {
                return new C1537c0(EnumC1638dd.A07);
            }
            ((WindowManager) c0958Hi.getSystemService(A0H(594, 6, 109))).getDefaultDisplay().getRealMetrics(new DisplayMetrics());
            Vector<Rect> vectorA0K = A0K(view);
            int iA08 = A08(vectorA0K);
            vectorA0K.add(rect);
            float fA08 = ((A08(vectorA0K) - iA08) * 1.0f) / (view.getMeasuredHeight() * view.getMeasuredWidth());
            float fA01 = A01(i5, view) / 100.0f;
            if (fA08 < fA01) {
                A0N(view, false, String.format(Locale.US, A0H(452, 76, 42), Float.valueOf(fA08), Float.valueOf(fA01)));
                return new C1537c0(EnumC1638dd.A04, fA08);
            }
            if (!C2446qw.A03(c0958Hi)) {
                A0N(view, false, A0H(ModuleDescriptor.MODULE_VERSION, 26, 62));
                return new C1537c0(EnumC1638dd.A0L, fA08);
            }
            Map<String, String> mapA01 = C2447qx.A01(c0958Hi);
            if (C2427qd.A04(mapA01) && !C2203mv.A2i(c0958Hi)) {
                A0N(view, false, A0H(156, 29, 77));
                return new C1537c0(EnumC1638dd.A0A, fA08);
            }
            if (C2203mv.A26(c0958Hi) && C2427qd.A03(mapA01)) {
                A0N(view, false, A0H(31, 31, 14));
                return new C1537c0(EnumC1638dd.A05, fA08, mapA01);
            }
            A0N(view, true, A0H(396, 19, 63));
            return new C1537c0(EnumC1638dd.A0J, fA08, mapA01);
        } catch (NullPointerException unused) {
            A0N(view, false, A0H(62, 30, 43));
            return new C1537c0(EnumC1638dd.A0G);
        }
    }

    public static String A0H(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0G, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 88);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0M() {
        A0G = new byte[]{-40, -32, -35, -26, -23, 30, -35, -35, -31, -28, 45, 55, -28, -60, 27, 13, 24, 12, -60, 22, 9, 5, 23, 19, 18, -34, -60, -79, -91, -19, -62, -89, -54, -122, -49, -39, -122, -43, -44, -122, -38, -43, -42, -122, -43, -52, -122, -38, -50, -53, -122, -78, -43, -55, -47, -39, -55, -40, -53, -53, -44, -108, -58, -28, -15, -15, -14, -9, -93, -22, -24, -9, -93, -17, -14, -26, -28, -9, -20, -14, -15, -93, -14, -15, -93, -10, -26, -11, -24, -24, -15, -79, -86, -43, -53, -39, -44, -115, -38, -122, -45, -57, -47, -53, -122, -39, -53, -44, -39, -53, -122, -38, -43, -122, -39, -53, -38, -122, -55, -50, -53, -55, -47, -122, -49, -44, -38, -53, -40, -36, -57, -46, -122, -52, -43, -40, -122, -44, -43, -44, -109, -40, -53, -42, -53, -57, -38, -122, -55, -50, -53, -55, -47, -53, -40, -108, -16, 10, 30, 12, 26, 6, 23, 9, -59, 14, 24, -59, 20, 7, 24, 25, 23, 26, 8, 25, 14, 19, 12, -59, 27, 14, 10, 28, -45, -23, -7, 8, -5, -5, 4, -74, -1, 9, -74, 4, 5, 10, -74, -1, 4, 10, -5, 8, -9, -7, 10, -1, 12, -5, -60, -64, -44, -47, -116, -32, -43, -49, -41, -47, -34, -116, -49, -51, -38, -38, -37, -32, -116, -50, -47, -116, -38, -47, -45, -51, -32, -43, -30, -47, 28, 47, 43, 61, -26, -31, -19, -21, -84, -28, -33, -31, -29, -32, -19, -19, -23, -84, -33, -30, -15, -84, -25, -20, -14, -29, -16, -20, -33, -22, -84, -12, -25, -29, -11, -84, -60, -13, -22, -22, -47, -31, -16, -29, -29, -20, -65, -30, -46, -19, -19, -22, -32, -33, -16, -2, -46, -11, -25, -6, -10, 8, -79, -7, -14, 4, -79, -6, -1, 7, -6, 4, -6, -13, -3, -10, -79, -11, -6, -2, -10, -1, 4, -6, 0, -1, 4, -79, -71, 8, -50, 40, -4, 31, 17, 36, 32, 50, -37, 35, 28, 46, -37, 41, 42, -37, 43, 28, 45, 32, 41, 47, -23, -28, -72, -37, -51, -32, -36, -18, -105, -32, -22, -105, -27, -20, -29, -29, -91, -29, -73, -38, -52, -33, -37, -19, -106, -33, -23, -106, -22, -27, -27, -106, -22, -24, -41, -28, -23, -26, -41, -24, -37, -28, -22, -92, 4, -40, -5, -19, 0, -4, 14, -73, 0, 10, -73, 13, 0, 10, 0, -7, 3, -4, -59, 54, 10, 45, 31, 50, 46, 64, -23, 57, 42, 59, 46, 55, 61, -23, 50, 60, -23, 55, 56, 61, -23, 60, 46, 61, -23, 61, 56, -23, 31, 18, 28, 18, 11, 21, 14, -9, -17, -61, -26, -40, -21, -25, -7, -94, -8, -21, -11, -21, -28, -18, -25, -94, -29, -12, -25, -29, -94, -21, -11, -94, -10, -15, -15, -94, -11, -17, -29, -18, -18, -94, -35, -89, -80, -76, -24, -89, -89, -94, -8, -21, -11, -21, -28, -18, -25, -82, -94, -27, -9, -12, -12, -25, -16, -10, -94, -10, -22, -12, -25, -11, -22, -15, -18, -26, -94, -89, -80, -76, -24, -89, -89, -33, 40, -4, 31, 17, 36, 32, 50, -37, 50, 36, 41, 31, 42, 50, -37, 36, 46, -37, 41, 42, 47, -37, 46, 32, 47, -37, 47, 42, -37, 17, 4, 14, 4, -3, 7, 0, -23, 63, 64, 69, -15, 71, 58, 54, 72, 50, 51, 61, 54, 73, 59, 31, 18, 14, 32, 10, 11, 21, 14, 47, 41, 34, 30, 15, 18, 16, 60, 46, 51, 41, 52, 60};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 7 out of bounds for length 7
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final synchronized String A0R() {
        return EnumC1638dd.valuesCustom()[this.A05.A01()].toString() + String.format(Locale.US, A0H(0, 9, 96), Float.valueOf(this.A05.A00() * 100.0f));
    }

    static {
        A0M();
        A0I = C1539c2.class.getSimpleName();
    }

    public C1539c2(View view, int i5, int i11, boolean z11, WeakReference<AbstractC1540c3> weakReference, C0958Hi c0958Hi) {
        this.A0B = new Handler();
        this.A01 = 0;
        this.A02 = 1000;
        this.A08 = true;
        this.A05 = new C1537c0(EnumC1638dd.A0M);
        this.A06 = new HashMap();
        this.A03 = 0L;
        this.A00 = 0;
        this.A07 = true;
        this.A0D = c0958Hi;
        this.A0C = view;
        if (this.A0C.getId() == -1) {
            AbstractC2426qc.A0L(this.A0C);
        }
        this.A0A = i5;
        this.A0E = weakReference;
        this.A0F = z11;
        if (i11 < 0) {
            if (BuildConfigApi.isDebug()) {
                Log.w(A0I, A0H(211, 29, 20));
            }
            i11 = 0;
        }
        this.A09 = i11;
    }

    public C1539c2(View view, int i5, WeakReference<AbstractC1540c3> weakReference, C0958Hi c0958Hi) {
        this(view, i5, 0, false, weakReference, c0958Hi);
    }

    public C1539c2(View view, int i5, boolean z11, WeakReference<AbstractC1540c3> weakReference, C0958Hi c0958Hi) {
        this(view, i5, 0, z11, weakReference, c0958Hi);
    }

    public static float A00(View view) {
        float alpha = view.getAlpha();
        while (view.getParent() instanceof ViewGroup) {
            view = (View) view.getParent();
            float alpha2 = view.getAlpha();
            if (alpha2 < 0.0f) {
                alpha2 = 0.0f;
            }
            if (alpha2 > 1.0f) {
                alpha2 = 1.0f;
            }
            alpha *= alpha2;
        }
        return alpha;
    }

    public static int A01(int i5, View view) {
        int width = view.getWidth() * view.getHeight();
        float onePixelPercentage = width > 0 ? 100.0f / width : 100.0f;
        int viewArea = (int) Math.max(i5, Math.ceil(onePixelPercentage));
        return viewArea;
    }

    public static /* synthetic */ int A05(C1539c2 c1539c2) {
        int i5 = c1539c2.A00;
        c1539c2.A00 = i5 + 1;
        return i5;
    }

    public static int A09(int[] iArr, int i5) {
        int i11 = 0;
        int length = iArr.length;
        while (i11 < length) {
            int low = length - i11;
            int i12 = (low / 2) + i11;
            int low2 = iArr[i12];
            if (low2 == i5) {
                return i12;
            }
            int i13 = iArr[i12];
            String[] strArr = A0H;
            String str = strArr[2];
            String str2 = strArr[7];
            int high = str.length();
            int low3 = str2.length();
            if (high == low3) {
                throw new RuntimeException();
            }
            A0H[0] = "QqEyOv5K4c2a7TamOIPTrCyFewVDGSxi";
            if (i13 > i5) {
                length = i12;
            } else {
                i11 = i12 + 1;
            }
        }
        return -1;
    }

    public static Vector<Rect> A0K(View view) {
        Vector<Rect> vector = new Vector<>();
        if (!(view.getParent() instanceof ViewGroup)) {
            return vector;
        }
        ViewGroup viewGroup = (ViewGroup) view.getParent();
        for (int iIndexOfChild = viewGroup.indexOfChild(view) + 1; iIndexOfChild < viewGroup.getChildCount(); iIndexOfChild++) {
            View childAt = viewGroup.getChildAt(iIndexOfChild);
            boolean z11 = true;
            boolean z12 = !(childAt instanceof C1908i4);
            if ((childAt instanceof C0870Dx) && AbstractC1536bz.A00(childAt)) {
                z11 = false;
            }
            if (z12 && z11) {
                Vector<Rect> rectVector = A0L(childAt);
                vector.addAll(rectVector);
            }
        }
        Vector<Rect> rectVector2 = A0K(viewGroup);
        vector.addAll(rectVector2);
        return vector;
    }

    public static Vector<Rect> A0L(View view) {
        Vector<Rect> vector = new Vector<>();
        if (!view.isShown() || view.getAlpha() <= 0.0f) {
            return vector;
        }
        boolean isTransparentToolbar = view.getClass().getName().equals(A0H(245, 50, 38)) && view.getBackground() != null && (view.getBackground() instanceof GradientDrawable);
        if ((view instanceof ViewGroup) && (AbstractC1536bz.A00(view) || isTransparentToolbar)) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i5 = 0; i5 < viewGroup.getChildCount(); i5++) {
                Vector<Rect> visibleRectInView = A0L(viewGroup.getChildAt(i5));
                vector.addAll(visibleRectInView);
            }
            return vector;
        }
        Rect rect = new Rect();
        if (view.getGlobalVisibleRect(rect)) {
            vector.add(rect);
        }
        return vector;
    }

    public static void A0N(View view, boolean z11, String str) {
        if (BuildConfigApi.isDebug()) {
            String str2 = A0H(240, 5, 110) + view + A0H(9, 4, 108) + (z11 ? A0H(579, 8, 81) : A0H(565, 12, Sdk.SDKError.Reason.TPAT_ERROR_VALUE)) + A0H(13, 14, 76) + str;
        }
    }

    public final synchronized Map<String, String> A0S() {
        HashMap map;
        map = new HashMap();
        map.put(A0H(589, 3, 84), String.valueOf(this.A05.A01()));
        map.put(A0H(587, 2, 97), String.valueOf(this.A05.A00()));
        map.put(A0H(577, 2, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE), new JSONObject(this.A06).toString());
        map.put(A0H(592, 2, 68), C2416qS.A06(this.A03));
        Map<String, String> viewabilityData = this.A05.A03();
        map.putAll(viewabilityData);
        return map;
    }

    public final synchronized void A0T() {
        this.A05 = new C1537c0(EnumC1638dd.A0M);
    }

    public final synchronized void A0U() {
        if (this.A04 != null) {
            A0V();
        }
        if (this.A07) {
            this.A0D.A0F().A4I();
        }
        this.A04 = new C06514v(this, this.A0D);
        this.A0B.postDelayed(this.A04, this.A01);
        this.A08 = false;
        this.A00 = 0;
        this.A05 = new C1537c0(EnumC1638dd.A0M);
        this.A06 = new HashMap();
    }

    public final synchronized void A0V() {
        if (this.A07) {
            this.A0D.A0F().A4J();
        }
        this.A0B.removeCallbacks(this.A04);
        this.A04 = null;
        this.A08 = true;
        this.A00 = 0;
    }

    public final void A0W(int i5) {
        this.A01 = i5;
    }

    public final void A0X(int i5) {
        if (BuildConfigApi.isDebug() && !this.A0F) {
            Log.w(A0I, A0H(92, 64, 14));
        }
        this.A02 = i5;
    }

    public final void A0Y(boolean z11) {
        this.A07 = z11;
    }

    public final synchronized boolean A0Z() {
        return this.A08;
    }
}
