package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.ViewGroup;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.j4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1968j4 {
    public static byte[] A09;
    public static String[] A0A = {"ulA9tMpXJ0Fgz3L6", "kmBp6JcSqPlb9eogqvbvj6g5ppHVaWSS", "klPqAM4BpBJNr6xIOjiQhoS6UO4TrOHS", "7VyM9GgXJuu8YzSYQI3HrMroeBYRJajD", "jF2bnw6E6wYHKm8plX11kYiLrSAbSJmD", "6pBnRch9VxXRPJwtqH0gd323b09mKXXU", "Clk2oRExhn8z5HC1wWkAqM8aEwWEfAA8", "Myq33IQdIYqIzBMhSJhfspyke76FBM0c"};
    public C1967j3 A01;
    public AbstractC1976jC A04;
    public final /* synthetic */ C7O A08;
    public final ArrayList<AbstractC1978jE> A05 = new ArrayList<>();
    public ArrayList<AbstractC1978jE> A02 = null;
    public final ArrayList<AbstractC1978jE> A06 = new ArrayList<>();
    public final List<AbstractC1978jE> A07 = Collections.unmodifiableList(this.A05);
    public int A03 = 2;
    public int A00 = 2;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 58);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A09 = new byte[]{-91, -18, -8, -58, -7, -7, -26, -24, -19, -22, -23, -65, -59, -32, 39, 30, 30, 43, 29, 44, -14, -53, -48, -62, -21, 22, 7, 15, -62, 5, 17, 23, 16, 22, -36, -38, -33, 36, 37, 18, 37, 22, -21, -120, 122, -83, -50, -69, -50, -65, 122, -61, -50, -65, -57, 122, -67, -55, -49, -56, -50, 122, -61, -51, 122, -13, 17, 28, 28, 21, 20, -48, 35, 19, 34, 17, 32, -48, 38, 25, 21, 39, -48, 39, 25, 36, 24, -48, 17, 30, -48, 25, 30, 38, 17, 28, 25, 20, -48, 38, 25, 21, 39, -34, -48, -7, 30, 38, 17, 28, 25, 20, -48, 38, 25, 21, 39, 35, -48, 19, 17, 30, 30, 31, 36, -48, 18, 21, -48, 34, 21, 37, 35, 21, 20, -48, 22, 34, 31, 29, -48, 35, 19, 34, 17, 32, -36, -48, 36, 24, 21, 41, -48, 35, 24, 31, 37, 28, 20, -48, 34, 21, 18, 31, 37, 30, 20, -48, 22, 34, 31, 29, -48, 34, 21, 19, 41, 19, 28, 21, 34, -48, 32, 31, 31, 28, -34, -13, 24, 13, 25, 24, 29, 19, 29, 30, 15, 24, 13, 35, -54, 14, 15, 30, 15, 13, 30, 15, 14, -40, -54, -13, 24, 32, 11, 22, 19, 14, -54, 19, 30, 15, 23, -54, 26, 25, 29, 19, 30, 19, 25, 24, -54, -125, -88, -99, -87, -88, -83, -93, -83, -82, -97, -88, -99, -77, 90, -98, -97, -82, -97, -99, -82, -97, -98, 104, 90, -125, -88, -80, -101, -90, -93, -98, 90, -80, -93, -97, -79, 90, -94, -87, -90, -98, -97, -84, 90, -101, -98, -101, -86, -82, -97, -84, 90, -86, -87, -83, -93, -82, -93, -87, -88, -73, -36, -28, -49, -38, -41, -46, -114, -41, -30, -45, -37, -114, -34, -35, -31, -41, -30, -41, -35, -36, -114, -36, -20, -5, -22, -7, -7, -18, -19, -87, -8, -5, -87, -22, -3, -3, -22, -20, -15, -18, -19, -87, -1, -14, -18, 0, -4, -87, -10, -22, 2, -87, -9, -8, -3, -87, -21, -18, -87, -5, -18, -20, 2, -20, -11, -18, -19, -73, -87, -14, -4, -36, -20, -5, -22, -7, -61, -102, -77, -74, 102, -86, -85, -70, -89, -87, -82, -85, -86, 102, -68, -81, -85, -67, 102, -71, -82, -75, -69, -78, -86, 102, -88, -85, 102, -72, -85, -77, -75, -68, -85, -86, 102, -84, -72, -75, -77, 102, -104, -85, -87, -65, -87, -78, -85, -72, -100, -81, -85, -67, 102, -88, -85, -84, -75, -72, -85, 102, -81, -70, 102, -87, -89, -76, 102, -88, -85, 102, -72, -85, -87, -65, -87, -78, -85, -86, -128, 102, -38, -8, -1, -17, -12, -19, -90, -6, -11, -90, -8, -21, -23, -1, -23, -14, -21, -90, -25, -12, -90, -17, -19, -12, -11, -8, -21, -22, -90, -4, -17, -21, -3, -90, -18, -11, -14, -22, -21, -8, -76, -90, -33, -11, -5, -90, -7, -18, -11, -5, -14, -22, -90, -20, -17, -8, -7, -6, -90, -23, -25, -14, -14, -90, -7, -6, -11, -10, -49, -19, -12, -11, -8, -17, -12, -19, -36, -17, -21, -3, -82, -4, -17, -21, -3, -81, -90, -24, -21, -20, -11, -8, -21, -90, -23, -25, -14, -14, -17, -12, -19, -90, -8, -21, -23, -1, -23, -14, -21, -76, -78, -80, -65, -95, -76, -80, -62, -111, -70, -67, -101, -70, -66, -76, -65, -76, -70, -71, -116, -71, -81, -97, -60, -69, -80, -66, -61, -53, -74, -63, -66, -71, 117, -59, -60, -56, -66, -55, -66, -60, -61, 117, -28, -39, -15, -25, -19, -20, -104, -31, -26, -36, -35, -16, -104, -21, -32, -25, -19, -28, -36, -104, -26, -25, -20, -104, -38, -35, -104, -91, -87, -104, -39, -34, -20, -35, -22, -104, -19, -26, -32, -31, -36, -31, -26, -33, -104, -39, -104, -18, -31, -35, -17, -78, -12, -13, -37, -18, -22, -4, -41, -22, -24, -2, -24, -15, -22, -23};
    }

    static {
        A05();
    }

    public C1968j4(C7O c7o) {
        this.A08 = c7o;
    }

    private final View A00(int i5, boolean z11) {
        return A0J(i5, z11, Long.MAX_VALUE).A0H;
    }

    private final AbstractC1978jE A01(int i5) {
        int size;
        int iA0D;
        if (this.A02 == null || (size = this.A02.size()) == 0) {
            return null;
        }
        for (int i11 = 0; i11 < size; i11++) {
            AbstractC1978jE abstractC1978jE = this.A02.get(i11);
            if (!abstractC1978jE.A0t()) {
                int i12 = abstractC1978jE.A0T();
                if (i12 == i5) {
                    abstractC1978jE.A0e(32);
                    return abstractC1978jE;
                }
            }
        }
        if (this.A08.A04.A0O() && (iA0D = this.A08.A00.A0D(i5)) > 0) {
            int offsetPosition = this.A08.A04.A0B();
            if (iA0D < offsetPosition) {
                long jA0D = this.A08.A04.A0D(iA0D);
                for (int i13 = 0; i13 < size; i13++) {
                    AbstractC1978jE abstractC1978jE2 = this.A02.get(i13);
                    if (!abstractC1978jE2.A0t() && abstractC1978jE2.A0V() == jA0D) {
                        abstractC1978jE2.A0e(32);
                        return abstractC1978jE2;
                    }
                }
            }
        }
        return null;
    }

    private final AbstractC1978jE A02(int i5, boolean z11) {
        View viewA08;
        int size = this.A05.size();
        for (int i11 = 0; i11 < size; i11++) {
            AbstractC1978jE abstractC1978jE = this.A05.get(i11);
            if (!abstractC1978jE.A0t()) {
                int scrapCount = abstractC1978jE.A0T();
                if (scrapCount == i5 && !abstractC1978jE.A0m() && (this.A08.A0s.A09 || !abstractC1978jE.A0n())) {
                    abstractC1978jE.A0e(32);
                    return abstractC1978jE;
                }
            }
        }
        if (!z11 && (viewA08 = this.A08.A01.A08(i5)) != null) {
            AbstractC1978jE abstractC1978jEA0F = C7O.A0F(viewA08);
            this.A08.A01.A0G(viewA08);
            int iA07 = this.A08.A01.A07(viewA08);
            if (iA07 != -1) {
                this.A08.A01.A0C(iA07);
                A0X(viewA08);
                abstractC1978jEA0F.A0e(8224);
                return abstractC1978jEA0F;
            }
            throw new IllegalStateException(A04(604, 52, 62) + abstractC1978jEA0F + this.A08.A1L());
        }
        int size2 = this.A06.size();
        for (int i12 = 0; i12 < size2; i12++) {
            AbstractC1978jE abstractC1978jE2 = this.A06.get(i12);
            if (!abstractC1978jE2.A0m()) {
                int scrapCount2 = abstractC1978jE2.A0T();
                if (scrapCount2 == i5) {
                    if (!z11) {
                        this.A06.remove(i12);
                    }
                    return abstractC1978jE2;
                }
            }
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0046, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /* JADX WARN: Removed duplicated region for block: B:29:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00d4 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00ec A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final AbstractC1978jE A03(long j11, int i5, boolean z11) {
        int count = this.A05.size();
        int i11 = count - 1;
        while (true) {
            if (i11 >= 0) {
                AbstractC1978jE abstractC1978jE = this.A05.get(i11);
                if (abstractC1978jE.A0V() == j11 && !abstractC1978jE.A0t()) {
                    int count2 = abstractC1978jE.A0S();
                    if (i5 == count2) {
                        abstractC1978jE.A0e(32);
                        if (abstractC1978jE.A0n()) {
                            C7O c7o = this.A08;
                            int i12 = A0A[4].charAt(3);
                            if (i12 == 98) {
                                A0A[0] = "q3aWXTgT7NsVf007";
                                if (!c7o.A0s.A07()) {
                                    String[] strArr = A0A;
                                    String str = strArr[2];
                                    String str2 = strArr[1];
                                    int cacheSize = str.charAt(0);
                                    int count3 = str2.charAt(0);
                                    if (cacheSize != count3) {
                                        A0A[4] = "NC6bFXUosLdTEwJsXrsHGkbXBsQUMG7q";
                                        abstractC1978jE.A0f(2, 14);
                                    } else {
                                        String[] strArr2 = A0A;
                                        strArr2[2] = "kBSMDIkt47Rx4hHhTamY1xnSrMWRxYxp";
                                        strArr2[1] = "kToZLwND7zKVFlbtf8XZb6UwHA5zPLAu";
                                        abstractC1978jE.A0f(2, 14);
                                    }
                                }
                            }
                        }
                        return abstractC1978jE;
                    }
                    if (!z11) {
                        this.A05.remove(i11);
                        this.A08.removeDetachedView(abstractC1978jE.A0H, false);
                        A0W(abstractC1978jE.A0H);
                    }
                }
                i11--;
            } else {
                int count4 = this.A06.size();
                for (int i13 = count4 - 1; i13 >= 0; i13--) {
                    AbstractC1978jE abstractC1978jE2 = this.A06.get(i13);
                    if (abstractC1978jE2.A0V() == j11) {
                        int iA0S = abstractC1978jE2.A0S();
                        int cacheSize2 = A0A[0].length();
                        if (cacheSize2 != 16) {
                            String[] strArr3 = A0A;
                            strArr3[7] = "lrD7iCy3KBiO8gA6PsFToJiVZrW1xMAl";
                            strArr3[6] = "amz9CZtibeJcU8bEqG7a4ZYgRNeZgxWk";
                            if (i5 == iA0S) {
                                if (!z11) {
                                    ArrayList<AbstractC1978jE> arrayList = this.A06;
                                    String[] strArr4 = A0A;
                                    String str3 = strArr4[5];
                                    String str4 = strArr4[3];
                                    int cacheSize3 = str3.charAt(0);
                                    int count5 = str4.charAt(0);
                                    if (cacheSize3 != count5) {
                                        String[] strArr5 = A0A;
                                        strArr5[5] = "or4YmCu0ppqzW1VFAnuQtpcwvOCNSyKL";
                                        strArr5[3] = "x7G8xrEgau2heO3LEdjWfX9qC3RDyC0d";
                                        arrayList.remove(i13);
                                    } else {
                                        arrayList.remove(i13);
                                    }
                                }
                                return abstractC1978jE2;
                            }
                            if (z11) {
                                A07(i13);
                                String[] strArr6 = A0A;
                                String str5 = strArr6[2];
                                String str6 = strArr6[1];
                                int cacheSize4 = str5.charAt(0);
                                int count6 = str6.charAt(0);
                                if (cacheSize4 == count6) {
                                    A0A[4] = "2lrbY7WLbUziAPe6QkcwvBQ2VEr9QFta";
                                    return null;
                                }
                            }
                        } else {
                            String[] strArr7 = A0A;
                            strArr7[2] = "kYzWBiiTSiU3KogqfJ4EJctPAodLTQqF";
                            strArr7[1] = "kIBKgO4naDZyukeXVXxcwMENrZxoY36q";
                            if (i5 == iA0S) {
                                if (!z11) {
                                }
                                return abstractC1978jE2;
                            }
                            if (z11) {
                            }
                        }
                    }
                }
                return null;
            }
        }
    }

    private final void A06() {
        int count = this.A06.size();
        for (int count2 = count - 1; count2 >= 0; count2--) {
            A07(count2);
        }
        this.A06.clear();
        if (C7O.A1E) {
            this.A08.A02.A02();
        }
    }

    private final void A07(int i5) {
        A0e(this.A06.get(i5), true);
        this.A06.remove(i5);
    }

    private void A08(ViewGroup viewGroup, boolean z11) {
        for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = viewGroup.getChildAt(childCount);
            if (childAt instanceof ViewGroup) {
                String[] strArr = A0A;
                String str = strArr[7];
                String str2 = strArr[6];
                int iCharAt = str.charAt(8);
                int i5 = str2.charAt(8);
                if (iCharAt == i5) {
                    throw new RuntimeException();
                }
                A0A[4] = "0ZJbYELQTNKw4GYvMFOIJ2JFgvUoupt2";
                A08((ViewGroup) childAt, true);
            }
        }
        if (!z11) {
            return;
        }
        if (viewGroup.getVisibility() == 4) {
            viewGroup.setVisibility(0);
            viewGroup.setVisibility(4);
        } else {
            int visibility = viewGroup.getVisibility();
            viewGroup.setVisibility(4);
            viewGroup.setVisibility(visibility);
        }
    }

    private void A09(AbstractC1978jE abstractC1978jE) {
        if (this.A08.A1x()) {
            View view = abstractC1978jE.A0H;
            if (AbstractC1880hb.A00(view) == 0) {
                AbstractC1880hb.A09(view, 1);
            }
            if (!AbstractC1880hb.A0F(view)) {
                abstractC1978jE.A0e(ReaderJsonLexerKt.BATCH_SIZE);
                AbstractC1880hb.A0B(view, this.A08.A09.A0A());
            }
        }
    }

    private void A0A(AbstractC1978jE abstractC1978jE) {
        if (abstractC1978jE.A0H instanceof ViewGroup) {
            A08((ViewGroup) abstractC1978jE.A0H, false);
        }
    }

    private final void A0B(AbstractC1978jE abstractC1978jE) {
        if (0 != 0) {
            throw new NullPointerException(A04(656, 14, 75));
        }
        if (this.A08.A04 != null) {
            this.A08.A04.A0K(abstractC1978jE);
        }
        if (this.A08.A0s != null) {
            this.A08.A0t.A0B(abstractC1978jE);
        }
    }

    private final boolean A0C(AbstractC1978jE abstractC1978jE) {
        if (abstractC1978jE.A0n()) {
            return this.A08.A0s.A07();
        }
        if (abstractC1978jE.A03 >= 0 && abstractC1978jE.A03 < this.A08.A04.A0B()) {
            if (!this.A08.A0s.A07()) {
                int iA0C = this.A08.A04.A0C(abstractC1978jE.A03);
                int type = abstractC1978jE.A0S();
                if (iA0C != type) {
                    return false;
                }
            }
            return !this.A08.A04.A0O() || abstractC1978jE.A0V() == this.A08.A04.A0D(abstractC1978jE.A03);
        }
        throw new IndexOutOfBoundsException(A04(233, 60, 0) + abstractC1978jE + this.A08.A1L());
    }

    private boolean A0D(AbstractC1978jE abstractC1978jE, int i5, int i11, long startBindNs) {
        abstractC1978jE.A08 = this.A08;
        int iA0S = abstractC1978jE.A0S();
        long nanoTime = this.A08.getNanoTime();
        if (startBindNs != Long.MAX_VALUE) {
            C1967j3 c1967j3 = this.A01;
            String[] strArr = A0A;
            String str = strArr[5];
            String str2 = strArr[3];
            int iCharAt = str.charAt(0);
            int viewType = str2.charAt(0);
            if (iCharAt == viewType) {
                throw new RuntimeException();
            }
            A0A[0] = "We3abAYlnqMpJzTP";
            if (!c1967j3.A0A(iA0S, nanoTime, startBindNs)) {
                return false;
            }
        }
        this.A08.A04.A0L(abstractC1978jE, i5);
        this.A01.A05(abstractC1978jE.A0S(), this.A08.getNanoTime() - nanoTime);
        A09(abstractC1978jE);
        if (this.A08.A0s.A07()) {
            abstractC1978jE.A04 = i11;
            return true;
        }
        return true;
    }

    public final int A0E() {
        return this.A05.size();
    }

    public final int A0F(int i5) {
        if (i5 >= 0) {
            C7O c7o = this.A08;
            if (A0A[0].length() != 16) {
                throw new RuntimeException();
            }
            A0A[0] = "3KxCBQFQ0qPnaRqJ";
            if (i5 < c7o.A0s.A03()) {
                if (!this.A08.A0s.A07()) {
                    return i5;
                }
                return this.A08.A00.A0D(i5);
            }
        }
        throw new IndexOutOfBoundsException(A04(587, 17, 27) + i5 + A04(43, 22, 32) + this.A08.A0s.A03() + this.A08.A1L());
    }

    public final View A0G(int i5) {
        return this.A05.get(i5).A0H;
    }

    public final View A0H(int i5) {
        return A00(i5, false);
    }

    public final C1967j3 A0I() {
        if (this.A01 == null) {
            this.A01 = new C1967j3();
        }
        return this.A01;
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x0246  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x024c  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x026d  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0273  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0180 A[PHI: r7 r9
      0x0180: PHI (r7v3 boolean) = (r7v2 boolean), (r7v4 boolean), (r7v4 boolean) binds: [B:24:0x0052, B:50:0x00c5, B:66:0x0173] A[DONT_GENERATE, DONT_INLINE]
      0x0180: PHI (r9v3 com.facebook.ads.redexgen.X.jE) = (r9v2 com.facebook.ads.redexgen.X.jE), (r9v5 com.facebook.ads.redexgen.X.jE), (r9v6 com.facebook.ads.redexgen.X.jE) binds: [B:24:0x0052, B:50:0x00c5, B:66:0x0173] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:74:0x019f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final AbstractC1978jE A0J(int i5, boolean z11, long j11) {
        C1961ix c1961ix;
        C7O c7oA0H;
        if (i5 >= 0 && i5 < this.A08.A0s.A03()) {
            boolean z12 = false;
            AbstractC1978jE abstractC1978jEA0E = null;
            boolean fromScrapOrHiddenOrCache = this.A08.A0s.A07();
            if (fromScrapOrHiddenOrCache) {
                abstractC1978jEA0E = A01(i5);
                z12 = abstractC1978jEA0E != null;
            }
            if (abstractC1978jEA0E == null && (abstractC1978jEA0E = A02(i5, z11)) != null) {
                boolean fromScrapOrHiddenOrCache2 = A0C(abstractC1978jEA0E);
                if (!fromScrapOrHiddenOrCache2) {
                    if (!z11) {
                        abstractC1978jEA0E.A0e(4);
                        boolean fromScrapOrHiddenOrCache3 = abstractC1978jEA0E.A0o();
                        if (fromScrapOrHiddenOrCache3) {
                            this.A08.removeDetachedView(abstractC1978jEA0E.A0H, false);
                            abstractC1978jEA0E.A0d();
                        } else {
                            boolean fromScrapOrHiddenOrCache4 = abstractC1978jEA0E.A0t();
                            if (fromScrapOrHiddenOrCache4) {
                                abstractC1978jEA0E.A0Z();
                            }
                        }
                        A0c(abstractC1978jEA0E);
                    }
                    abstractC1978jEA0E = null;
                } else {
                    z12 = true;
                }
            }
            if (abstractC1978jEA0E == null) {
                int iA0D = this.A08.A00.A0D(i5);
                if (iA0D < 0 || iA0D >= this.A08.A04.A0B()) {
                    throw new IndexOutOfBoundsException(A04(187, 46, 112) + i5 + A04(13, 8, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) + iA0D + A04(35, 8, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE) + this.A08.A0s.A03() + this.A08.A1L());
                }
                int iA0C = this.A08.A04.A0C(iA0D);
                boolean fromScrapOrHiddenOrCache5 = this.A08.A04.A0O();
                if (fromScrapOrHiddenOrCache5 && (abstractC1978jEA0E = A03(this.A08.A04.A0D(iA0D), iA0C, z11)) != null) {
                    abstractC1978jEA0E.A03 = iA0D;
                    z12 = true;
                }
                if (abstractC1978jEA0E == null && 0 != 0) {
                    throw new NullPointerException(A04(TTAdConstant.STYLE_SIZE_RADIO_9_16, 25, 17));
                }
                if (abstractC1978jEA0E == null && (abstractC1978jEA0E = A0I().A03(iA0C)) != null) {
                    abstractC1978jEA0E.A0b();
                    boolean fromScrapOrHiddenOrCache6 = C7O.A1C;
                    if (fromScrapOrHiddenOrCache6) {
                        A0A(abstractC1978jEA0E);
                    }
                }
                if (abstractC1978jEA0E == null) {
                    long nanoTime = this.A08.getNanoTime();
                    if (j11 != Long.MAX_VALUE) {
                        boolean fromScrapOrHiddenOrCache7 = this.A01.A0B(iA0C, nanoTime, j11);
                        if (!fromScrapOrHiddenOrCache7) {
                            String[] strArr = A0A;
                            if (strArr[7].charAt(8) != strArr[6].charAt(8)) {
                                A0A[4] = "fdYbLns5cH4Uqi6qZhk44zURNmgZymnf";
                                return null;
                            }
                        }
                    }
                    abstractC1978jEA0E = this.A08.A04.A0E(this.A08, iA0C);
                    boolean fromScrapOrHiddenOrCache8 = C7O.A1E;
                    if (fromScrapOrHiddenOrCache8 && (c7oA0H = C7O.A0H(abstractC1978jEA0E.A0H)) != null) {
                        abstractC1978jEA0E.A09 = new WeakReference<>(c7oA0H);
                    }
                    this.A01.A06(iA0C, this.A08.getNanoTime() - nanoTime);
                    if (z12) {
                        abstractC1978jEA0E.A0f(0, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                        if (this.A08.A0s.A0C) {
                        }
                    }
                    boolean zA0D = false;
                    if (!this.A08.A0s.A07()) {
                        if (!abstractC1978jEA0E.A0l()) {
                        }
                    }
                }
            } else {
                if (z12 && !this.A08.A0s.A07() && abstractC1978jEA0E.A0v(UserMetadata.MAX_INTERNAL_KEY_SIZE)) {
                    abstractC1978jEA0E.A0f(0, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                    if (this.A08.A0s.A0C) {
                        int changeFlags = AbstractC1956is.A06(abstractC1978jEA0E);
                        C1955ir info = this.A08.A05.A0F(this.A08.A0s, abstractC1978jEA0E, changeFlags | androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT, abstractC1978jEA0E.A0W());
                        this.A08.A1r(abstractC1978jEA0E, info);
                    }
                }
                boolean zA0D2 = false;
                if (!this.A08.A0s.A07() && abstractC1978jEA0E.A0l()) {
                    abstractC1978jEA0E.A04 = i5;
                } else if (!abstractC1978jEA0E.A0l()) {
                    boolean zA0r = abstractC1978jEA0E.A0r();
                    String[] strArr2 = A0A;
                    if (strArr2[7].charAt(8) != strArr2[6].charAt(8)) {
                        A0A[0] = "CFgmPUuP3iY97c6j";
                        if (!zA0r) {
                            if (abstractC1978jEA0E.A0m()) {
                                int iA0D2 = this.A08.A00.A0D(i5);
                                String[] strArr3 = A0A;
                                if (strArr3[5].charAt(0) != strArr3[3].charAt(0)) {
                                    String[] strArr4 = A0A;
                                    strArr4[7] = "X7QTRdk7uAM61axx4OEln6Aqdeva9JgC";
                                    strArr4[6] = "2m6xaCXVB1m17nX7qirmFmeuDGGSO6lD";
                                    zA0D2 = A0D(abstractC1978jEA0E, iA0D2, i5, j11);
                                }
                            }
                        }
                    } else if (!zA0r) {
                    }
                }
                View view = abstractC1978jEA0E.A0H;
                if (A0A[4].charAt(3) == 'b') {
                    String[] strArr5 = A0A;
                    strArr5[5] = "ymmTOXtQojU6rRVoJMbBfUBDtyf096Lh";
                    strArr5[3] = "VCdUEMmmzbvfUZbBbNepcELfQrdDFyYX";
                    ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
                    if (layoutParams == null) {
                        c1961ix = (C1961ix) this.A08.generateDefaultLayoutParams();
                        abstractC1978jEA0E.A0H.setLayoutParams(c1961ix);
                    } else if (!this.A08.checkLayoutParams(layoutParams)) {
                        ViewGroup.LayoutParams layoutParamsGenerateLayoutParams = this.A08.generateLayoutParams(layoutParams);
                        String[] strArr6 = A0A;
                        if (strArr6[2].charAt(0) == strArr6[1].charAt(0)) {
                            String[] strArr7 = A0A;
                            strArr7[2] = "kqh2PWeHxAL2DpvJL4iRMn0O7hIhaGbv";
                            strArr7[1] = "kmhB7ilmrFE2abkLd0sKBmmWm2mWDiPj";
                            c1961ix = (C1961ix) layoutParamsGenerateLayoutParams;
                            abstractC1978jEA0E.A0H.setLayoutParams(c1961ix);
                        }
                    } else {
                        c1961ix = (C1961ix) layoutParams;
                    }
                    c1961ix.A00 = abstractC1978jEA0E;
                    c1961ix.A02 = z12 && zA0D2;
                    return abstractC1978jEA0E;
                }
            }
            throw new RuntimeException();
        }
        throw new IndexOutOfBoundsException(A04(293, 22, 52) + i5 + A04(12, 1, 99) + i5 + A04(21, 14, 104) + this.A08.A0s.A03() + this.A08.A1L());
    }

    public final List<AbstractC1978jE> A0K() {
        return this.A07;
    }

    public final void A0L() {
        int size = this.A06.size();
        for (int i5 = 0; i5 < size; i5++) {
            this.A06.get(i5).A0X();
        }
        int i11 = this.A05.size();
        for (int scrapCount = 0; scrapCount < i11; scrapCount++) {
            this.A05.get(scrapCount).A0X();
        }
        ArrayList<AbstractC1978jE> arrayList = this.A02;
        String[] strArr = A0A;
        String str = strArr[2];
        String str2 = strArr[1];
        int scrapCount2 = str.charAt(0);
        int cachedCount = str2.charAt(0);
        if (scrapCount2 != cachedCount) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0A;
        strArr2[7] = "w7WcMXH384MQxArKBWq9tfOfmOANhXYh";
        strArr2[6] = "ji6HgViVTGyvfONq8Vqt8Uaju4D1iJHU";
        if (arrayList != null) {
            int changedScrapCount = this.A02.size();
            for (int scrapCount3 = 0; scrapCount3 < changedScrapCount; scrapCount3++) {
                this.A02.get(scrapCount3).A0X();
            }
        }
    }

    public final void A0M() {
        this.A05.clear();
        if (this.A02 != null) {
            this.A02.clear();
        }
    }

    public final void A0N() {
        int size = this.A06.size();
        for (int i5 = 0; i5 < size; i5++) {
            C1961ix c1961ix = (C1961ix) this.A06.get(i5).A0H.getLayoutParams();
            if (c1961ix != null) {
                c1961ix.A01 = true;
            }
        }
    }

    public final void A0O() {
        if (this.A08.A04 != null && this.A08.A04.A0O()) {
            int size = this.A06.size();
            for (int i5 = 0; i5 < size; i5++) {
                AbstractC1978jE abstractC1978jE = this.A06.get(i5);
                int i11 = A0A[0].length();
                if (i11 != 16) {
                    throw new RuntimeException();
                }
                String[] strArr = A0A;
                strArr[2] = "kx9etu5Uswf3mlSSd54JM5SDJxoMGNTv";
                strArr[1] = "kxxNK4Rys8aPJuu822sP3fs8sDM7v1G0";
                if (abstractC1978jE != null) {
                    abstractC1978jE.A0e(6);
                    abstractC1978jE.A0j(null);
                }
            }
            return;
        }
        A06();
    }

    public final void A0P() {
        int extraCache;
        if (this.A08.A06 != null) {
            AbstractC1960iw abstractC1960iw = this.A08.A06;
            if (A0A[0].length() == 16) {
                String[] strArr = A0A;
                strArr[2] = "kSelswvDf1EbxUzrii1mBr6dHJR0d4zj";
                strArr[1] = "kcuGN1lunmBh6z5P1vsNJWvgiUTpOK0Q";
                extraCache = abstractC1960iw.A00;
            }
            throw new RuntimeException();
        }
        extraCache = 0;
        this.A00 = this.A03 + extraCache;
        int extraCache2 = this.A06.size();
        for (int i5 = extraCache2 - 1; i5 >= 0; i5--) {
            int size = this.A06.size();
            String[] strArr2 = A0A;
            String str = strArr2[2];
            String str2 = strArr2[1];
            int i11 = str.charAt(0);
            int extraCache3 = str2.charAt(0);
            if (i11 != extraCache3) {
                throw new RuntimeException();
            }
            String[] strArr3 = A0A;
            strArr3[2] = "kpxxdOz3cEfo3MLV8RPQuR2Jasv2n6jF";
            strArr3[1] = "kgO1H2GjmHeLX2ZusVi9gFRUJKE1zGI0";
            int extraCache4 = this.A00;
            if (size > extraCache4) {
                A07(i5);
            } else {
                return;
            }
        }
    }

    public final void A0Q() {
        this.A05.clear();
        A06();
    }

    public final void A0R(int i5) {
        this.A03 = i5;
        A0P();
    }

    public final void A0S(int i5, int i11) {
        int size = this.A06.size();
        for (int i12 = 0; i12 < size; i12++) {
            AbstractC1978jE abstractC1978jE = this.A06.get(i12);
            if (abstractC1978jE != null) {
                int cachedCount = abstractC1978jE.A03;
                if (cachedCount >= i5) {
                    abstractC1978jE.A0h(i11, true);
                }
            }
        }
    }

    public final void A0T(int i5, int i11) {
        int i12;
        int i13;
        int i14;
        if (i5 < i11) {
            i12 = i5;
            i13 = i11;
            i14 = -1;
        } else {
            i12 = i11;
            i13 = i5;
            i14 = 1;
        }
        int size = this.A06.size();
        for (int i15 = 0; i15 < size; i15++) {
            AbstractC1978jE abstractC1978jE = this.A06.get(i15);
            if (abstractC1978jE != null) {
                int start = abstractC1978jE.A03;
                if (start >= i12) {
                    int start2 = abstractC1978jE.A03;
                    if (start2 > i13) {
                        continue;
                    } else {
                        int i16 = abstractC1978jE.A03;
                        String[] strArr = A0A;
                        String str = strArr[5];
                        String str2 = strArr[3];
                        int end = str.charAt(0);
                        int start3 = str2.charAt(0);
                        if (end == start3) {
                            throw new RuntimeException();
                        }
                        String[] strArr2 = A0A;
                        strArr2[2] = "kvvW4F2OCwdEIl1qwIuxYVFpmp0ugJY5";
                        strArr2[1] = "kzcCp2wTfEGQm2KGuN32b5oIYABnQWPG";
                        if (i16 == i5) {
                            int end2 = i11 - i5;
                            abstractC1978jE.A0h(end2, false);
                        } else {
                            abstractC1978jE.A0h(i14, false);
                        }
                    }
                } else {
                    continue;
                }
            }
        }
    }

    public final void A0U(int i5, int i11) {
        int positionEnd;
        int i12 = i5 + i11;
        for (int i13 = this.A06.size() - 1; i13 >= 0; i13--) {
            AbstractC1978jE abstractC1978jE = this.A06.get(i13);
            if (abstractC1978jE != null && (positionEnd = abstractC1978jE.A03) >= i5 && positionEnd < i12) {
                abstractC1978jE.A0e(2);
                A07(i13);
            }
        }
    }

    public final void A0V(int i5, int i11, boolean z11) {
        int i12 = i5 + i11;
        int removedEnd = this.A06.size();
        for (int i13 = removedEnd - 1; i13 >= 0; i13--) {
            AbstractC1978jE abstractC1978jE = this.A06.get(i13);
            if (abstractC1978jE != null) {
                int removedEnd2 = abstractC1978jE.A03;
                if (removedEnd2 >= i12) {
                    int removedEnd3 = -i11;
                    abstractC1978jE.A0h(removedEnd3, z11);
                } else {
                    int removedEnd4 = abstractC1978jE.A03;
                    if (removedEnd4 >= i5) {
                        abstractC1978jE.A0e(8);
                        A07(i13);
                    }
                }
            }
        }
    }

    public final void A0W(View view) {
        AbstractC1978jE abstractC1978jEA0F = C7O.A0F(view);
        abstractC1978jEA0F.A0F = null;
        abstractC1978jEA0F.A0G = false;
        abstractC1978jEA0F.A0Z();
        A0c(abstractC1978jEA0F);
    }

    public final void A0X(View view) {
        AbstractC1978jE abstractC1978jEA0F = C7O.A0F(view);
        if (abstractC1978jEA0F.A0v(12) || !abstractC1978jEA0F.A0q() || this.A08.A25(abstractC1978jEA0F)) {
            boolean zA0m = abstractC1978jEA0F.A0m();
            if (A0A[0].length() != 16) {
                throw new RuntimeException();
            }
            String[] strArr = A0A;
            strArr[5] = "cscHAR4ImnAFzAxZJ9yqjMNa91RcN8Vb";
            strArr[3] = "pspTzLDNU823NSI2ymIgIumCpfqVQlal";
            if (!zA0m || abstractC1978jEA0F.A0n() || this.A08.A04.A0O()) {
                abstractC1978jEA0F.A0i(this, false);
                this.A05.add(abstractC1978jEA0F);
                return;
            }
            throw new IllegalArgumentException(A04(65, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE) + this.A08.A1L());
        }
        if (this.A02 == null) {
            this.A02 = new ArrayList<>();
        }
        abstractC1978jEA0F.A0i(this, true);
        this.A02.add(abstractC1978jEA0F);
    }

    public final void A0Y(View view) {
        AbstractC1978jE abstractC1978jEA0F = C7O.A0F(view);
        if (abstractC1978jEA0F.A0p()) {
            this.A08.removeDetachedView(view, false);
        }
        if (abstractC1978jEA0F.A0o()) {
            abstractC1978jEA0F.A0d();
        } else if (abstractC1978jEA0F.A0t()) {
            abstractC1978jEA0F.A0Z();
        }
        A0c(abstractC1978jEA0F);
    }

    public final void A0Z(AbstractC1948ik abstractC1948ik, AbstractC1948ik abstractC1948ik2, boolean z11) {
        A0Q();
        A0I().A08(abstractC1948ik, abstractC1948ik2, z11);
    }

    public final void A0a(C1967j3 c1967j3) {
        if (this.A01 != null) {
            C1967j3 c1967j32 = this.A01;
            String[] strArr = A0A;
            if (strArr[7].charAt(8) == strArr[6].charAt(8)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0A;
            strArr2[5] = "eg5celMCH5XhNc8VzkIGx3YtNAPnP9H4";
            strArr2[3] = "1J6YUmXidV7MMEP0bzwuQdNnIs5cPq10";
            c1967j32.A04();
        }
        this.A01 = c1967j3;
        if (c1967j3 != null) {
            this.A01.A07(this.A08.getAdapter());
        }
    }

    public final void A0b(AbstractC1976jC abstractC1976jC) {
        this.A04 = abstractC1976jC;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0135  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0c(AbstractC1978jE abstractC1978jE) {
        boolean transientStatePreventsRecycling;
        if (abstractC1978jE.A0o() || abstractC1978jE.A0H.getParent() != null) {
            throw new IllegalArgumentException(A04(Sdk.SDKError.Reason.JSON_PARAMS_ENCODE_ERROR_VALUE, 56, 79) + abstractC1978jE.A0o() + A04(0, 12, 75) + (abstractC1978jE.A0H.getParent() != null) + this.A08.A1L());
        }
        boolean zA0p = abstractC1978jE.A0p();
        String[] strArr = A0A;
        if (strArr[2].charAt(0) != strArr[1].charAt(0)) {
            throw new RuntimeException();
        }
        A0A[4] = "QZZbfikyhDCMiV1imXgamooHNWBI4VfH";
        if (!zA0p) {
            if (abstractC1978jE.A0s()) {
                throw new IllegalArgumentException(A04(452, 110, 76) + this.A08.A1L());
            }
            boolean zA0K = abstractC1978jE.A0K();
            if (this.A08.A04 != null && zA0K) {
                boolean transientStatePreventsRecycling2 = this.A08.A04.A0P(abstractC1978jE);
                if (transientStatePreventsRecycling2) {
                    transientStatePreventsRecycling = true;
                }
            } else {
                transientStatePreventsRecycling = false;
            }
            boolean z11 = false;
            boolean z12 = false;
            if (!transientStatePreventsRecycling) {
                boolean transientStatePreventsRecycling3 = abstractC1978jE.A0u();
                if (transientStatePreventsRecycling3) {
                    int i5 = this.A00;
                    String[] strArr2 = A0A;
                    if (strArr2[2].charAt(0) != strArr2[1].charAt(0)) {
                        A0A[4] = "JXkbPmQXP2BcwiEI3FqqjfiGok6rwhAB";
                        if (i5 > 0) {
                            boolean transientStatePreventsRecycling4 = abstractC1978jE.A0v(526);
                            if (!transientStatePreventsRecycling4) {
                                int size = this.A06.size();
                                if (size >= this.A00 && size > 0) {
                                    A07(0);
                                    size--;
                                }
                                boolean transientStatePreventsRecycling5 = C7O.A1E;
                                if (transientStatePreventsRecycling5 && size > 0) {
                                    boolean transientStatePreventsRecycling6 = this.A08.A02.A05(abstractC1978jE.A03);
                                    if (!transientStatePreventsRecycling6) {
                                        int i11 = size - 1;
                                        while (i11 >= 0) {
                                            int targetCacheIndex = this.A06.get(i11).A03;
                                            boolean transientStatePreventsRecycling7 = this.A08.A02.A05(targetCacheIndex);
                                            if (!transientStatePreventsRecycling7) {
                                                break;
                                            } else {
                                                i11--;
                                            }
                                        }
                                        size = i11 + 1;
                                    }
                                }
                                this.A06.add(size, abstractC1978jE);
                                z11 = true;
                            }
                        }
                        if (!z11) {
                            A0e(abstractC1978jE, true);
                            z12 = true;
                        }
                    } else {
                        A0A[4] = "iMRb6lH7bzEtCSJD4TfZYArDATXy6kqw";
                        if (i5 > 0) {
                        }
                        if (!z11) {
                        }
                    }
                }
            }
            this.A08.A0t.A0B(abstractC1978jE);
            if (!z11 && !z12 && zA0K) {
                abstractC1978jE.A08 = null;
                return;
            }
            return;
        }
        throw new IllegalArgumentException(A04(371, 81, 12) + abstractC1978jE + this.A08.A1L());
    }

    public final void A0d(AbstractC1978jE abstractC1978jE) {
        if (abstractC1978jE.A0G) {
            this.A02.remove(abstractC1978jE);
        } else {
            this.A05.remove(abstractC1978jE);
        }
        abstractC1978jE.A0F = null;
        abstractC1978jE.A0G = false;
        abstractC1978jE.A0Z();
    }

    public final void A0e(AbstractC1978jE abstractC1978jE, boolean z11) {
        C7O.A0t(abstractC1978jE);
        if (abstractC1978jE.A0v(ReaderJsonLexerKt.BATCH_SIZE)) {
            abstractC1978jE.A0f(0, ReaderJsonLexerKt.BATCH_SIZE);
            AbstractC1880hb.A0B(abstractC1978jE.A0H, null);
        }
        if (z11) {
            A0B(abstractC1978jE);
        }
        abstractC1978jE.A08 = null;
        A0I().A09(abstractC1978jE);
    }
}
