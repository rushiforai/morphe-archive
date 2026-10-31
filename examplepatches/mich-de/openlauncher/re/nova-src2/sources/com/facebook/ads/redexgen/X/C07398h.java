package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.Point;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Pair;
import androidx.compose.ui.node.LayoutNode;
import com.facebook.ads.androidx.media3.common.Timeline;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.8h, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07398h extends R9 {
    public static byte[] A07;
    public static String[] A08 = {"N3ZG1EAeWs47seL3n7lh4Wuuxpt5dQ9S", "oZrngbnpXdb0MQsdT0zVvrp", "Fim13Buiqg0QqQi", "NCw8HvhGeegFdSJV0JTkOh", "1Y8AJD0wDjMc9jtVVPnZ14pSQIsLBm5S", "5vnPQraei", "qi33", "eVlKumeRx"};
    public static final AbstractC1294Vc<Integer> A09;
    public static final AbstractC1294Vc<Integer> A0A;
    public VL A00;
    public C07408i A01;
    public WR A02;
    public final Context A03;
    public final WY A04;
    public final Object A05;
    public final boolean A06;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    /* JADX WARN: Removed duplicated region for block: B:23:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00ae A[LOOP:0: B:3:0x000c->B:32:0x00ae, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00d5 A[SYNTHETIC] */
    @MetaExoPlayerCustomization
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private <T extends WT<T>> Pair<WX, Integer> A0A(int i5, C1316Wa c1316Wa, int[][][] iArr, WS<T> ws2, Comparator<List<T>> comparator) {
        List arrayList;
        ArrayList arrayList2 = new ArrayList();
        int iA02 = c1316Wa.A02();
        int i11 = 0;
        loop0: while (i11 < iA02) {
            if (i5 == c1316Wa.A03(i11)) {
                RY ryA07 = c1316Wa.A07(i11);
                for (int i12 = 0; i12 < ryA07.A01; i12++) {
                    U8 u8A05 = ryA07.A05(i12);
                    List<T> listA5o = ws2.A5o(i11, u8A05, iArr[i11][i12]);
                    boolean[] zArr = new boolean[u8A05.A01];
                    ArrayList arrayList3 = new ArrayList();
                    ArrayList arrayList4 = new ArrayList();
                    for (int i13 = 0; i13 < u8A05.A01; i13++) {
                        T t6 = listA5o.get(i13);
                        int iA08 = t6.A08();
                        if (!zArr[i13] && iA08 != 0) {
                            if (iA08 == 1) {
                                arrayList = AbstractC07549l.A04(t6);
                                String[] strArr = A08;
                                if (strArr[5].length() != strArr[7].length()) {
                                    break loop0;
                                }
                                A08[2] = "ZAJHyq1TMCFZthjm457ogzB9XlfcGEFJ";
                                arrayList3.add(t6);
                            } else {
                                arrayList = new ArrayList();
                                arrayList.add(t6);
                                for (int i14 = i13 + 1; i14 < u8A05.A01; i14++) {
                                    T t9 = listA5o.get(i14);
                                    if (t9.A08() == 2 && t6.A09(t9)) {
                                        arrayList.add(t9);
                                        zArr[i14] = true;
                                    }
                                }
                            }
                            arrayList4.add(arrayList);
                        }
                    }
                    if (this.A01.A0A) {
                        boolean zIsEmpty = arrayList3.isEmpty();
                        if (A08[4].charAt(13) != 'L') {
                            A08[1] = "2CpqC9UnHnvdpm4Z";
                            if (!zIsEmpty) {
                                if (arrayList3.size() == u8A05.A01) {
                                    arrayList4.clear();
                                    arrayList4.add(arrayList3);
                                }
                            }
                        } else {
                            String[] strArr2 = A08;
                            strArr2[5] = "wigRhAYLK";
                            strArr2[7] = "JAXAgZPha";
                            if (!zIsEmpty) {
                            }
                        }
                    }
                    arrayList2.addAll(arrayList4);
                }
                i11++;
                if (A08[2].length() == 0) {
                    String[] strArr3 = A08;
                    strArr3[6] = "sOOT";
                    strArr3[3] = "kMH3ngEeEucpvaC7iBfT6l";
                }
            } else {
                i11++;
                if (A08[2].length() == 0) {
                }
            }
            throw new RuntimeException();
        }
        if (arrayList2.isEmpty()) {
            return null;
        }
        List list = (List) Collections.max(arrayList2, comparator);
        int[] iArr2 = new int[list.size()];
        for (int i15 = 0; i15 < list.size(); i15++) {
            iArr2[i15] = ((WT) list.get(i15)).A01;
        }
        WT wt2 = (WT) list.get(0);
        return Pair.create(new WX(wt2.A03, iArr2), Integer.valueOf(wt2.A00));
    }

    public static String A0J(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 98);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0M() {
        A07 = new byte[]{-52, -84, -32, -49, -44, -38, -117, -50, -45, -52, -39, -39, -48, -41, -117, -50, -38, -32, -39, -33, -117, -50, -38, -39, -34, -33, -35, -52, -44, -39, -33, -34, -117, -50, -52, -39, -39, -38, -33, -117, -51, -48, -117, -52, -37, -37, -41, -44, -48, -49, -117, -30, -44, -33, -45, -38, -32, -33, -117, -35, -48, -47, -48, -35, -48, -39, -50, -48, -117, -33, -38, -117, -82, -38, -39, -33, -48, -29, -33, -103, -117, -83, -32, -44, -41, -49, -117, -33, -45, -48, -117, -33, -35, -52, -50, -42, -117, -34, -48, -41, -48, -50, -33, -38, -35, -117, -44, -39, -34, -33, -52, -39, -50, -48, -117, -30, -44, -33, -45, -117, -38, -39, -48, -117, -38, -47, -117, -33, -45, -48, -117, -39, -38, -39, -104, -49, -48, -37, -35, -48, -50, -52, -33, -48, -49, -117, -50, -38, -39, -34, -33, -35, -32, -50, -33, -38, -35, -34, -117, -33, -45, -52, -33, -117, -33, -52, -42, -48, -117, -52, -117, -82, -38, -39, -33, -48, -29, -33, -117, -52, -35, -46, -32, -40, -48, -39, -33, -103, -41, -8, -7, -12, 8, -1, 7, -25, 5, -12, -10, -2, -26, -8, -1, -8, -10, 7, 2, 5, -46, -26, -43, -38, -32, -96, -46, -44, -92, -27, -7, -24, -19, -13, -77, -27, -25, -72, 58, 78, 61, 66, 72, 8, 62, 58, 60, 12, 19, 39, 22, 27, 33, -31, 23, 19, 21, -27, -33, 28, 33, 21, -38, -45, -55, -4, -17, -22, -21, -11, -75, -25, -4, -74, -73, 2, -11, -16, -15, -5, -69, -19, 2, -17, 60, 47, 42, 43, 53, -11, 42, 53, 50, 40, 63, -13, 60, 47, 57, 47, 53, 52, 60, 47, 42, 43, 53, -11, 46, 43, 60, 41, 10, -3, -8, -7, 3, -61, 12, -63, 10, 2, -8, -62, 3, 2, -58, -62, 10, 4, -51};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static void A0N(RY ry2, U1 u12, Map<Integer, U6> map) {
        U6 u62;
        for (int i5 = 0; i5 < ry2.A01; i5++) {
            U6 u63 = u12.A0G.get(ry2.A05(i5));
            if (u63 != null && ((u62 = map.get(Integer.valueOf(u63.A01()))) == null || (u62.A01.isEmpty() && !u63.A01.isEmpty()))) {
                map.put(Integer.valueOf(u63.A01()), u63);
            }
        }
    }

    static {
        A0M();
        A09 = AbstractC1294Vc.A04(new Comparator() { // from class: com.facebook.ads.redexgen.X.WL
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return C07398h.A05((Integer) obj, (Integer) obj2);
            }
        });
        A0A = AbstractC1294Vc.A04(new Comparator() { // from class: com.facebook.ads.redexgen.X.WM
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return C07398h.A06((Integer) obj, (Integer) obj2);
            }
        });
    }

    @Deprecated
    public C07398h() {
        this(C07408i.A0J, new RT());
    }

    @Deprecated
    public C07398h(U1 u12, WY wy2) {
        this(u12, wy2, null);
    }

    public C07398h(U1 u12, WY wy2, Context context) {
        this.A05 = new Object();
        this.A03 = context != null ? context.getApplicationContext() : null;
        this.A04 = wy2;
        if (u12 instanceof C07408i) {
            this.A01 = (C07408i) u12;
        } else {
            C07408i defaultParameters = context == null ? C07408i.A0J : C07408i.A02(context);
            this.A01 = defaultParameters.A0P().A0u(u12).A0p();
        }
        this.A00 = VL.A07;
        this.A06 = context != null && N1.A18(context);
        if (!this.A06 && context != null && N1.A02 >= 32) {
            this.A02 = WR.A00(context);
        }
        if (this.A01.A08 && context == null) {
            MV.A07(A0J(188, 20, 49), A0J(1, 187, 9));
        }
    }

    @MetaExoPlayerCustomization
    public C07398h(WY wy2) {
        this(C07408i.A0J, wy2);
    }

    public static int A00(int i5, int i11) {
        if (i5 != 0 && i5 == i11) {
            return LayoutNode.NotPlacedPlaceOrder;
        }
        return Integer.bitCount(i5 & i11);
    }

    public static int A02(VC vc, String str, boolean z11) {
        if (!TextUtils.isEmpty(str) && str.equals(vc.A0V)) {
            return 4;
        }
        String strA0K = A0K(str);
        String strA0K2 = A0K(vc.A0V);
        if (strA0K2 == null || strA0K == null) {
            return (z11 && strA0K2 == null) ? 1 : 0;
        }
        if (strA0K2.startsWith(strA0K) || strA0K.startsWith(strA0K2)) {
            return 3;
        }
        String strA0J = A0J(0, 1, 61);
        String str2 = N1.A1P(strA0K2, strA0J)[0];
        String formatLanguage = N1.A1P(strA0K, strA0J)[0];
        if (!str2.equals(formatLanguage)) {
            return 0;
        }
        return 2;
    }

    /* JADX WARN: Incorrect condition in loop: B:10:0x0024 */
    /* JADX WARN: Removed duplicated region for block: B:21:0x006a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A03(U8 u82, int i5, int i11, boolean z11) {
        if (i5 == Integer.MAX_VALUE || i11 == Integer.MAX_VALUE) {
            return LayoutNode.NotPlacedPlaceOrder;
        }
        int i12 = LayoutNode.NotPlacedPlaceOrder;
        if (A08[0].charAt(25) == 'O') {
            throw new RuntimeException();
        }
        A08[1] = "wfFv1AieXG9eNvhmPq2a11ljL";
        for (int i13 = 0; i13 < maxVideoPixelsToRetain; i13++) {
            VC format = u82.A08(i13);
            int maxVideoPixelsToRetain = format.A0L;
            if (maxVideoPixelsToRetain > 0) {
                int maxVideoPixelsToRetain2 = format.A0A;
                if (maxVideoPixelsToRetain2 > 0) {
                    int i14 = format.A0L;
                    int maxVideoPixelsToRetain3 = format.A0A;
                    Point pointA09 = A09(z11, i5, i11, i14, maxVideoPixelsToRetain3);
                    int i15 = format.A0L;
                    int maxVideoPixelsToRetain4 = format.A0A;
                    int i16 = i15 * maxVideoPixelsToRetain4;
                    int i17 = format.A0L;
                    int maxVideoPixelsToRetain5 = pointA09.x;
                    if (i17 >= ((int) (maxVideoPixelsToRetain5 * 0.98f))) {
                        int videoPixels = format.A0A;
                        int i18 = A08[4].charAt(13);
                        if (i18 != 76) {
                            A08[2] = "ADP1T0Hh";
                            int maxVideoPixelsToRetain6 = pointA09.y;
                            if (videoPixels >= ((int) (maxVideoPixelsToRetain6 * 0.98f))) {
                                if (i16 < i12) {
                                    i12 = i16;
                                }
                            }
                        } else {
                            A08[2] = "3Njng6TDHfmlDodg";
                            int maxVideoPixelsToRetain7 = pointA09.y;
                            if (videoPixels >= ((int) (maxVideoPixelsToRetain7 * 0.98f))) {
                            }
                        }
                    }
                }
            }
        }
        return i12;
    }

    public static /* synthetic */ int A05(Integer num, Integer num2) {
        if (num.intValue() == -1) {
            return num2.intValue() == -1 ? 0 : -1;
        }
        if (num2.intValue() == -1) {
            return 1;
        }
        return num.intValue() - num2.intValue();
    }

    public static /* synthetic */ int A06(Integer num, Integer num2) {
        return 0;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:7:0x000f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A07(String str) {
        char c11;
        if (str == null) {
            return 0;
        }
        switch (str.hashCode()) {
            case -1851077871:
                if (!str.equals(A0J(272, 18, 100))) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 0;
                    break;
                }
            case -1662735862:
                if (str.equals(A0J(253, 10, 36))) {
                    c11 = 1;
                    break;
                }
                break;
            case -1662541442:
                if (str.equals(A0J(290, 10, 100))) {
                    c11 = 2;
                    break;
                }
                break;
            case 1331836730:
                if (str.equals(A0J(263, 9, 42))) {
                    c11 = 4;
                    break;
                }
                break;
            case 1599127257:
                if (str.equals(A0J(300, 19, 50))) {
                    c11 = 3;
                    break;
                }
                break;
        }
        switch (c11) {
        }
        return 0;
    }

    @MetaExoPlayerCustomization
    public static Point A09(boolean z11, int i5, int i11, int i12, int i13) {
        if (z11) {
            if ((i12 > i13) != (i5 > i11)) {
                String[] strArr = A08;
                if (strArr[6].length() == strArr[3].length()) {
                    throw new RuntimeException();
                }
                A08[2] = "MRAL2PEWT7Lor36iYCvDrRdop0p2Kv";
                i5 = i11;
                i11 = i5;
            }
        }
        if (i12 * i11 >= i13 * i5) {
            return new Point(i5, N1.A05(i5 * i13, i12));
        }
        return new Point(N1.A05(i11 * i12, i13), i11);
    }

    private final Pair<WX, Integer> A0B(C1316Wa c1316Wa, int[][][] iArr, final C07408i c07408i, final String str) throws AnonymousClass96 {
        return A0A(3, c1316Wa, iArr, new WS() { // from class: com.facebook.ads.redexgen.X.RP
            @Override // com.facebook.ads.redexgen.X.WS
            public final List A5o(int i5, U8 u82, int[] iArr2) {
                return RI.A02(i5, u82, c07408i, iArr2, str);
            }
        }, new Comparator() { // from class: com.facebook.ads.redexgen.X.WK
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return RI.A01((List) obj, (List) obj2);
            }
        });
    }

    private final Pair<WX, Integer> A0C(C1316Wa c1316Wa, int[][][] iArr, int[] iArr2, final C07408i c07408i) throws AnonymousClass96 {
        final boolean z11 = false;
        int i5 = 0;
        while (true) {
            if (i5 < c1316Wa.A02()) {
                if (2 == c1316Wa.A03(i5) && c1316Wa.A07(i5).A01 > 0) {
                    z11 = true;
                    break;
                }
                i5++;
            } else {
                break;
            }
        }
        return A0A(1, c1316Wa, iArr, new WS() { // from class: com.facebook.ads.redexgen.X.RQ
            @Override // com.facebook.ads.redexgen.X.WS
            public final List A5o(int i11, U8 u82, int[] iArr3) {
                return this.A01.A0e(c07408i, z11, i11, u82, iArr3);
            }
        }, new Comparator() { // from class: com.facebook.ads.redexgen.X.WJ
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return RO.A02((List) obj, (List) obj2);
            }
        });
    }

    private final Pair<WX, Integer> A0D(C1316Wa c1316Wa, int[][][] iArr, final int[] iArr2, final C07408i c07408i, final String str) throws AnonymousClass96 {
        return A0A(2, c1316Wa, iArr, new WS() { // from class: com.facebook.ads.redexgen.X.RS
            @Override // com.facebook.ads.redexgen.X.WS
            public final List A5o(int i5, U8 u82, int[] iArr3) {
                return RH.A06(i5, u82, c07408i, iArr3, str, iArr2[i5]);
            }
        }, new Comparator() { // from class: com.facebook.ads.redexgen.X.WI
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return RH.A05((List) obj, (List) obj2);
            }
        });
    }

    private final WX A0E(int i5, RY ry2, int[][] iArr, C07408i c07408i) throws AnonymousClass96 {
        U8 u82 = null;
        int i11 = 0;
        WO wo2 = null;
        for (int trackIndex = 0; trackIndex < ry2.A01; trackIndex++) {
            U8 trackGroup = ry2.A05(trackIndex);
            int[] iArr2 = iArr[trackIndex];
            for (int groupIndex = 0; groupIndex < trackGroup.A01; groupIndex++) {
                int selectedTrackIndex = iArr2[groupIndex];
                if (A0S(selectedTrackIndex, c07408i.A0B)) {
                    WO wo3 = new WO(trackGroup.A08(groupIndex), iArr2[groupIndex]);
                    if (wo2 == null || wo3.compareTo(wo2) > 0) {
                        u82 = trackGroup;
                        i11 = groupIndex;
                        wo2 = wo3;
                    }
                }
            }
        }
        if (u82 == null) {
            return null;
        }
        return new WX(u82, i11);
    }

    public static String A0K(String str) {
        if (TextUtils.isEmpty(str) || TextUtils.equals(str, A0J(androidx.recyclerview.widget.n0.DEFAULT_SWIPE_ANIMATION_DURATION, 3, 3))) {
            return null;
        }
        return str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0L() {
        boolean z11;
        synchronized (this.A05) {
            z11 = this.A01.A08 && !this.A06 && N1.A02 >= 32 && this.A02 != null && this.A02.A06();
        }
        if (z11) {
            A01();
        }
    }

    public static void A0P(C1316Wa c1316Wa, U1 u12, WX[] wxArr) {
        WX wx2;
        int iA02 = c1316Wa.A02();
        HashMap map = new HashMap();
        for (int i5 = 0; i5 < iA02; i5++) {
            A0N(c1316Wa.A07(i5), u12, map);
        }
        A0N(c1316Wa.A06(), u12, map);
        for (int i11 = 0; i11 < iA02; i11++) {
            int rendererCount = c1316Wa.A03(i11);
            U6 u62 = (U6) map.get(Integer.valueOf(rendererCount));
            if (u62 != null) {
                if (!u62.A01.isEmpty() && c1316Wa.A07(i11).A04(u62.A00) != -1) {
                    wx2 = new WX(u62.A00, AnonymousClass19.A0B(u62.A01));
                } else {
                    wx2 = null;
                }
                wxArr[i11] = wx2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A0Q(C1316Wa c1316Wa, C07408i c07408i, WX[] wxArr) {
        WX wx2;
        int iA02 = c1316Wa.A02();
        for (int i5 = 0; i5 < iA02; i5++) {
            RY trackGroups = c1316Wa.A07(i5);
            if (c07408i.A0S(i5, trackGroups)) {
                RJ rjA0Q = c07408i.A0Q(i5, trackGroups);
                if (rjA0Q != null) {
                    int rendererCount = rjA0Q.A03.length;
                    if (rendererCount != 0) {
                        int rendererCount2 = rjA0Q.A00;
                        U8 u8A05 = trackGroups.A05(rendererCount2);
                        int[] iArr = rjA0Q.A03;
                        int rendererIndex = rjA0Q.A02;
                        wx2 = new WX(u8A05, iArr, rendererIndex);
                    } else {
                        wx2 = null;
                    }
                    wxArr[i5] = wx2;
                }
            }
        }
    }

    public static void A0R(C1316Wa c1316Wa, int[][][] iArr, C1154Ph[] c1154PhArr, RA[] raArr) {
        int i5 = -1;
        int i11 = -1;
        int i12 = 1;
        int i13 = 0;
        while (true) {
            int tunnelingAudioRendererIndex = c1316Wa.A02();
            if (i13 >= tunnelingAudioRendererIndex) {
                break;
            }
            int i14 = c1316Wa.A03(i13);
            RA ra2 = raArr[i13];
            if ((i14 == 1 || i14 == 2) && ra2 != null && A0W(iArr[i13], c1316Wa.A07(i13), ra2)) {
                if (i14 == 1) {
                    if (i5 != -1) {
                        i12 = 0;
                        break;
                    }
                    i5 = i13;
                } else {
                    if (i11 != -1) {
                        i12 = 0;
                        break;
                    }
                    i11 = i13;
                }
            }
            i13++;
        }
        int tunnelingAudioRendererIndex2 = (i5 == -1 || i11 == -1) ? 0 : 1;
        if ((i12 & tunnelingAudioRendererIndex2) != 0) {
            C1154Ph c1154Ph = new C1154Ph(true);
            c1154PhArr[i5] = c1154Ph;
            c1154PhArr[i11] = c1154Ph;
        }
    }

    @MetaExoPlayerCustomization
    public static boolean A0S(int i5, boolean z11) {
        int iA03 = PX.A03(i5);
        return iA03 == 4 || (z11 && iA03 == 3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0T(VC vc) {
        boolean z11;
        synchronized (this.A05) {
            z11 = !this.A01.A08 || this.A06 || vc.A06 <= 2 || (A0U(vc) && (N1.A02 < 32 || this.A02 == null || !this.A02.A06())) || (N1.A02 >= 32 && this.A02 != null && this.A02.A06() && this.A02.A04() && this.A02.A05() && this.A02.A07(this.A00, vc));
        }
        return z11;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:9:0x002e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A0U(VC vc) {
        char c11;
        if (vc.A0W == null) {
            return false;
        }
        String str = vc.A0W;
        int iHashCode = str.hashCode();
        String[] strArr = A08;
        if (strArr[6].length() == strArr[3].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A08;
        strArr2[6] = "Km1e";
        strArr2[3] = "HhuKc9C19fuqudqOrF8WI4";
        switch (iHashCode) {
            case -2123537834:
                if (!str.equals(A0J(236, 14, 80))) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 2;
                    break;
                }
            case 187078296:
                if (str.equals(A0J(Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, 9, 15))) {
                    c11 = 0;
                    break;
                }
                break;
            case 187078297:
                if (str.equals(A0J(Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE, 9, 34))) {
                    c11 = 3;
                    break;
                }
                break;
            case 1504578661:
                if (str.equals(A0J(Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE, 10, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE))) {
                    c11 = 1;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
            case 1:
            case 2:
            case 3:
                return true;
            default:
                return false;
        }
    }

    public static boolean A0W(int[][] iArr, RY ry2, RA ra2) {
        if (ra2 == null) {
            return false;
        }
        int iA04 = ry2.A04(ra2.A9y());
        for (int i5 = 0; i5 < ra2.length(); i5++) {
            int trackGroupIndex = PX.A05(iArr[iA04][ra2.A8t(i5)]);
            if (trackGroupIndex != 32) {
                return false;
            }
        }
        return true;
    }

    private final WX[] A0X(C1316Wa c1316Wa, int[][][] iArr, int[] iArr2, C07408i c07408i) throws AnonymousClass96 {
        String str;
        int iA02 = c1316Wa.A02();
        WX[] wxArr = new WX[iA02];
        Pair<WX, Integer> pairA0C = A0C(c1316Wa, iArr, iArr2, c07408i);
        if (pairA0C != null) {
            int iIntValue = ((Integer) pairA0C.second).intValue();
            WX wx2 = (WX) pairA0C.first;
            if (A08[1].length() == 30) {
                throw new RuntimeException();
            }
            String[] strArr = A08;
            strArr[6] = "i1l7";
            strArr[3] = "8gR5IAybtJJSc0KWEFd8Nb";
            wxArr[iIntValue] = wx2;
        }
        if (pairA0C == null) {
            str = null;
        } else {
            U8 u82 = ((WX) pairA0C.first).A01;
            int rendererCount = ((WX) pairA0C.first).A02[0];
            str = u82.A08(rendererCount).A0V;
        }
        Pair<WX, Integer> pairA0D = A0D(c1316Wa, iArr, iArr2, c07408i, str);
        if (pairA0D != null) {
            wxArr[((Integer) pairA0D.second).intValue()] = (WX) pairA0D.first;
        }
        Pair<WX, Integer> pairA0B = A0B(c1316Wa, iArr, c07408i, str);
        if (pairA0B != null) {
            wxArr[((Integer) pairA0B.second).intValue()] = (WX) pairA0B.first;
        }
        for (int i5 = 0; i5 < iA02; i5++) {
            int iA03 = c1316Wa.A03(i5);
            if (iA03 != 2 && iA03 != 1 && iA03 != 3) {
                wxArr[i5] = A0E(iA03, c1316Wa.A07(i5), iArr[i5], c07408i);
            }
        }
        return wxArr;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1323Wi
    public final boolean A0Y() {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.R9
    @MetaExoPlayerCustomization
    public final Pair<C1154Ph[], RA[]> A0d(C1316Wa c1316Wa, int[][][] iArr, int[] iArr2, C1202Rk c1202Rk, Timeline timeline) throws Throwable {
        C07408i c07408i;
        synchronized (this.A05) {
            try {
                c07408i = this.A01;
                if (c07408i.A08 && N1.A02 >= 32 && this.A02 != null) {
                    this.A02.A03(this, (Looper) AbstractC1062Ln.A02(Looper.myLooper()));
                }
            } catch (Throwable th2) {
                th = th2;
                while (true) {
                    try {
                        throw th;
                    } catch (Throwable th3) {
                        th = th3;
                    }
                }
            }
        }
        int iA02 = c1316Wa.A02();
        WX[] wxArrA0X = A0X(c1316Wa, iArr, iArr2, c07408i);
        A0P(c1316Wa, c07408i, wxArrA0X);
        A0Q(c1316Wa, c07408i, wxArrA0X);
        for (int rendererCount = 0; rendererCount < iA02; rendererCount++) {
            int iA03 = c1316Wa.A03(rendererCount);
            if (c07408i.A0R(rendererCount) || c07408i.A0H.contains(Integer.valueOf(iA03))) {
                wxArrA0X[rendererCount] = null;
            }
        }
        RA[] raArrA6A = this.A04.A6A(wxArrA0X, A00(), c1202Rk, timeline);
        C1154Ph[] c1154PhArr = new C1154Ph[iA02];
        for (int i5 = 0; i5 < iA02; i5++) {
            c1154PhArr[i5] = !(c07408i.A0R(i5) || c07408i.A0H.contains(Integer.valueOf(c1316Wa.A03(i5)))) && (c1316Wa.A03(i5) == -2 || raArrA6A[i5] != null) ? C1154Ph.A01 : null;
        }
        if (c07408i.A0D) {
            A0R(c1316Wa, iArr, c1154PhArr, raArrA6A);
        }
        return Pair.create(c1154PhArr, raArrA6A);
    }

    public final /* synthetic */ AbstractC07549l A0e(C07408i c07408i, boolean z11, int i5, U8 u82, int[] iArr) {
        return RO.A03(i5, u82, c07408i, iArr, z11, new InterfaceC1334Wt() { // from class: com.facebook.ads.redexgen.X.RR
            @Override // com.facebook.ads.redexgen.X.InterfaceC1334Wt
            public final boolean A4d(Object obj) {
                return this.A00.A0T((VC) obj);
            }
        });
    }
}
