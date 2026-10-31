package com.facebook.ads.redexgen.X;

import android.graphics.PointF;
import android.text.Layout;
import android.text.SpannableString;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.StrikethroughSpan;
import android.text.style.StyleSpan;
import android.text.style.UnderlineSpan;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* renamed from: com.facebook.ads.redexgen.X.42, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass42 extends C8C {
    public static byte[] A05;
    public static String[] A06 = {"xbnCgKFzPDtux71hi6SpiioG4IwmRHBk", "3owY3Ap9luKWwPsAK25ne8wIVcCUn5JR", "FALgiAFIRpKoJzILG2rL", "VYC3eNSa18fVQa4jjeRnJSXlztjlcjqe", "6zSgZNb2SgCQYSVm7OWWQdLKxVFzji9G", "C3fF681Isvt2M5djOp3Dlhy5YNaLaBgK", "ZbCLQeP0ma1QvLm1XWzLDe6emcm3qYWC", "I30lsL6qeO5KldQ"};
    public static final Pattern A07;
    public float A00;
    public float A01;
    public Map<String, C1535by> A02;
    public final C1530bt A03;
    public final boolean A04;

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 62);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A05 = new byte[]{-73, -127, -104, -109, -127, -75, -67, -124, -126, -109, -126, -104, -127, -75, -67, -124, -126, -109, -127, -75, -67, -124, -126, -76, -109, -121, -74, -127, -75, -67, -124, -126, -84, -106, -12, 25, 17, 28, 31, 23, 37, 21, -22, -7, 34, 37, 32, 20, 39, -19, -42, -18, -20, -13, -13, -20, -15, -22, -93, -86, -42, -9, -4, -17, -24, -67, -86, -93, -17, -20, -15, -24, -93, -27, -24, -23, -14, -11, -24, -93, -86, -55, -14, -11, -16, -28, -9, -67, -86, -93, -17, -20, -15, -24, -67, -93, 2, 26, 24, 31, 31, 24, 29, 22, -49, 19, 24, 16, 27, 30, 22, 36, 20, -49, 27, 24, 29, 20, -49, 17, 20, 21, 30, 33, 20, -49, 18, 30, 28, 31, 27, 20, 35, 20, -49, 21, 30, 33, 28, 16, 35, -23, -49, -69, -45, -47, -40, -40, -47, -42, -49, -120, -52, -47, -55, -44, -41, -49, -35, -51, -120, -44, -47, -42, -51, -120, -33, -47, -36, -48, -120, -50, -51, -33, -51, -38, -120, -53, -41, -44, -35, -43, -42, -37, -120, -36, -48, -55, -42, -120, -50, -41, -38, -43, -55, -36, -94, -120, -32, -8, -10, -3, -3, -10, -5, -12, -83, -10, -5, 3, -18, -7, -10, -15, -83, 1, -10, -6, -10, -5, -12, -57, -83, -53, -21, -39, -68, -35, -37, -25, -36, -35, -22, 12, 45, 50, 37, 30, -13, -7, 18, 15, 18, 19, 27, 18, -60, 5, 16, 13, 11, 18, 17, 9, 18, 24, -34, -60, -37, -59, -10, -27, -18, -12, -13, -35, 4, -4, 12, 27, 18, 25, 29, -55, -14, 23, 15, 24, 6, -2, -7, -41, -61, -10, 23, 28, 15, 8, 22, 0, -85, -90, -124, 112, -93, -60, -55, -68, -75, -61, -83, 112, -79, -62, -75, 112, -66, -65, -60, 112, -61, -59, -64, -64, -65, -62, -60, -75, -76, -2, -7, -41, -50, -61, -10, 23, 28, 15, 8, 22, 0, -38, -52, -51, -39, -57, -39, -75, -79, -90, -66, -73, -86, -72, -67, 21, 17, 6, 30, 23, 10, 24, 30, 121, 87};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private void A0D(String str, C1530bt c1530bt, List<List<C1251Th>> list, List<Long> list2) {
        String strA07 = A07(34, 9, 114);
        AbstractC1062Ln.A07(str.startsWith(strA07));
        String[] strArrSplit = str.substring(strA07.length()).split(A07(32, 1, 66), c1530bt.A01);
        int length = strArrSplit.length;
        int i5 = c1530bt.A01;
        String strA072 = A07(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 10, 58);
        if (length != i5) {
            MV.A07(strA072, A07(143, 55, 42) + str);
            return;
        }
        long jA04 = A04(strArrSplit[c1530bt.A02]);
        String strA073 = A07(198, 25, 79);
        if (jA04 == -9223372036854775807L) {
            MV.A07(strA072, strA073 + str);
            return;
        }
        long jA042 = A04(strArrSplit[c1530bt.A00]);
        if (jA042 == -9223372036854775807L) {
            MV.A07(strA072, strA073 + str);
            return;
        }
        C1535by c1535by = (this.A02 == null || c1530bt.A03 == -1) ? null : this.A02.get(strArrSplit[c1530bt.A03].trim());
        String str2 = strArrSplit[c1530bt.A04];
        C1532bv c1532bvA02 = C1532bv.A02(str2);
        String strA04 = C1532bv.A04(str2);
        String strA074 = A07(331, 2, 64);
        String strA075 = A07(0, 1, 111);
        C1251Th c1251ThA06 = A06(strA04.replace(strA074, strA075).replace(A07(335, 2, 45), strA075).replace(A07(333, 2, 51), A07(353, 2, Sdk.SDKError.Reason.TPAT_ERROR_VALUE)), c1535by, c1532bvA02, this.A01, this.A00);
        int iA03 = A03(jA042, list2, list);
        for (int iA032 = A03(jA04, list2, list); iA032 < iA03; iA032++) {
            list.get(iA032).add(c1251ThA06);
        }
    }

    static {
        A09();
        A07 = Pattern.compile(A07(1, 31, 27));
    }

    public AnonymousClass42() {
        this(null);
    }

    public AnonymousClass42(List<byte[]> list) {
        super(A07(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 10, 58));
        this.A01 = -3.4028235E38f;
        this.A00 = -3.4028235E38f;
        if (list != null && !list.isEmpty()) {
            this.A04 = true;
            String strA0q = N1.A0q(list.get(0));
            String formatLine = A07(43, 7, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
            AbstractC1062Ln.A07(strA0q.startsWith(formatLine));
            this.A03 = (C1530bt) AbstractC1062Ln.A01(C1530bt.A00(strA0q));
            A0A(new C1084Mk(list.get(1)));
            return;
        }
        this.A04 = false;
        this.A03 = null;
    }

    public static float A00(int i5) {
        switch (i5) {
            case 0:
                return 0.05f;
            case 1:
                if (A06[1].charAt(29) == 'X') {
                    throw new RuntimeException();
                }
                String[] strArr = A06;
                strArr[0] = "ioNayQ3WXGIOa3oyuyV3JORtfQpSd3Hu";
                strArr[6] = "voG9Dz1LHbY8eCjev7dDxv9y22HrDzXa";
                return 0.5f;
            case 2:
                return 0.95f;
            default:
                return -3.4028235E38f;
        }
    }

    public static int A01(int i5) {
        switch (i5) {
            case -1:
                return Integer.MIN_VALUE;
            case 0:
            default:
                MV.A07(A07(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 10, 58), A07(239, 19, 102) + i5);
                return Integer.MIN_VALUE;
            case 1:
            case 2:
            case 3:
                if (A06[5].charAt(12) != 'M') {
                    throw new RuntimeException();
                }
                A06[5] = "wbmolFowgyKoMv8BT53csS9QgncO0HGb";
                return 2;
            case 4:
            case 5:
            case 6:
                return 1;
            case 7:
            case 8:
            case 9:
                return 0;
        }
    }

    public static int A02(int i5) {
        switch (i5) {
            case -1:
                return Integer.MIN_VALUE;
            case 0:
            default:
                MV.A07(A07(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 10, 58), A07(239, 19, 102) + i5);
                return Integer.MIN_VALUE;
            case 1:
            case 4:
            case 7:
                String[] strArr = A06;
                if (strArr[3].charAt(4) == strArr[4].charAt(4)) {
                    throw new RuntimeException();
                }
                A06[1] = "wr3J1YuF59dNmHzqw7UYwGvsz4dBhi1l";
                return 0;
            case 2:
            case 5:
            case 8:
                return 1;
            case 3:
            case 6:
            case 9:
                return 2;
        }
    }

    public static int A03(long j11, List<Long> sortedCueTimesUs, List<List<C1251Th>> list) {
        ArrayList arrayList;
        int i5 = 0;
        int insertionIndex = sortedCueTimesUs.size();
        int i11 = insertionIndex - 1;
        while (true) {
            if (i11 < 0) {
                break;
            }
            if (sortedCueTimesUs.get(i11).longValue() == j11) {
                return i11;
            }
            if (sortedCueTimesUs.get(i11).longValue() < j11) {
                i5 = i11 + 1;
                break;
            }
            i11--;
        }
        sortedCueTimesUs.add(i5, Long.valueOf(j11));
        if (i5 == 0) {
            arrayList = new ArrayList();
        } else {
            int insertionIndex2 = i5 - 1;
            arrayList = new ArrayList(list.get(insertionIndex2));
        }
        list.add(i5, arrayList);
        return i5;
    }

    public static long A04(String str) {
        Matcher matcher = A07.matcher(str.trim());
        if (!matcher.matches()) {
            return -9223372036854775807L;
        }
        return (Long.parseLong((String) N1.A0f(matcher.group(1))) * 60 * 60 * 1000000) + (Long.parseLong((String) N1.A0f(matcher.group(2))) * 60 * 1000000) + (Long.parseLong((String) N1.A0f(matcher.group(3))) * 1000000) + (Long.parseLong((String) N1.A0f(matcher.group(4))) * h.f42227c);
    }

    public static Layout.Alignment A05(int i5) {
        switch (i5) {
            case -1:
                return null;
            case 0:
            default:
                MV.A07(A07(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 10, 58), A07(239, 19, 102) + i5);
                return null;
            case 1:
            case 4:
            case 7:
                return Layout.Alignment.ALIGN_NORMAL;
            case 2:
            case 5:
            case 8:
                return Layout.Alignment.ALIGN_CENTER;
            case 3:
            case 6:
            case 9:
                return Layout.Alignment.ALIGN_OPPOSITE;
        }
    }

    public static C1251Th A06(String str, C1535by c1535by, C1532bv c1532bv, float f11, float f12) {
        int i5;
        SpannableString spannableString = new SpannableString(str);
        C1052Ld c1052LdA0G = new C1052Ld().A0G(spannableString);
        if (c1535by != null) {
            if (c1535by.A04 != null) {
                spannableString.setSpan(new ForegroundColorSpan(c1535by.A04.intValue()), 0, spannableString.length(), 33);
            }
            if (c1535by.A02 == 3 && c1535by.A03 != null) {
                spannableString.setSpan(new BackgroundColorSpan(c1535by.A03.intValue()), 0, spannableString.length(), 33);
            }
            if (c1535by.A00 != -3.4028235E38f && f12 != -3.4028235E38f) {
                c1052LdA0G.A08(c1535by.A00 / f12, 1);
            }
            if (c1535by.A06 && c1535by.A07) {
                spannableString.setSpan(new StyleSpan(3), 0, spannableString.length(), 33);
            } else if (c1535by.A06) {
                spannableString.setSpan(new StyleSpan(1), 0, spannableString.length(), 33);
            } else if (c1535by.A07) {
                spannableString.setSpan(new StyleSpan(2), 0, spannableString.length(), 33);
            }
            if (c1535by.A09) {
                spannableString.setSpan(new UnderlineSpan(), 0, spannableString.length(), 33);
            }
            if (c1535by.A08) {
                spannableString.setSpan(new StrikethroughSpan(), 0, spannableString.length(), 33);
            }
        }
        if (c1532bv.A00 != -1) {
            i5 = c1532bv.A00;
        } else if (c1535by != null) {
            i5 = c1535by.A01;
        } else {
            i5 = -1;
        }
        C1052Ld cue = c1052LdA0G.A0F(A05(i5));
        cue.A0A(A02(i5)).A09(A01(i5));
        if (c1532bv.A01 != null && f12 != -3.4028235E38f && f11 != -3.4028235E38f) {
            PointF pointF = c1532bv.A01;
            String[] strArr = A06;
            if (strArr[0].charAt(16) == strArr[6].charAt(16)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A06;
            strArr2[3] = "b936oxykl6opzTKM5E1tJSe50SsxvTBB";
            strArr2[4] = "jgdA59R252I7vX8iLnId3nHL3h1eX2f6";
            c1052LdA0G.A04(pointF.x / f11);
            c1052LdA0G.A07(c1532bv.A01.y / f12, 0);
        } else {
            c1052LdA0G.A04(A00(c1052LdA0G.A01()));
            c1052LdA0G.A07(A00(c1052LdA0G.A00()), 0);
        }
        return c1052LdA0G.A0H();
    }

    public static Map<String, C1535by> A08(C1084Mk c1084Mk) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        C1531bu c1531buA00 = null;
        while (true) {
            String strA0T = c1084Mk.A0T();
            if (strA0T == null || (c1084Mk.A07() != 0 && c1084Mk.A0B() == 91)) {
                break;
            }
            if (strA0T.startsWith(A07(43, 7, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE))) {
                c1531buA00 = C1531bu.A00(strA0T);
            } else if (strA0T.startsWith(A07(233, 6, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE))) {
                if (c1531buA00 == null) {
                    String currentLine = A07(50, 46, 69) + strA0T;
                    MV.A07(A07(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 10, 58), currentLine);
                } else {
                    C1535by c1535byA04 = C1535by.A04(strA0T, c1531buA00);
                    if (c1535byA04 != null) {
                        linkedHashMap.put(c1535byA04.A05, c1535byA04);
                    }
                }
            }
        }
        return linkedHashMap;
    }

    private void A0A(C1084Mk c1084Mk) {
        while (true) {
            String strA0T = c1084Mk.A0T();
            if (strA0T != null) {
                if (A07(266, 13, 107).equalsIgnoreCase(strA0T)) {
                    A0B(c1084Mk);
                } else if (A07(Sdk.SDKError.Reason.SILENT_MODE_MONITOR_ERROR_VALUE, 12, 101).equalsIgnoreCase(strA0T)) {
                    this.A02 = A08(c1084Mk);
                } else if (A07(279, 11, 101).equalsIgnoreCase(strA0T)) {
                    MV.A06(A07(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 10, 58), A07(290, 29, 18));
                } else if (A07(258, 8, 66).equalsIgnoreCase(strA0T)) {
                    return;
                }
            } else {
                return;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0054  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0B(C1084Mk c1084Mk) {
        while (true) {
            String strA0T = c1084Mk.A0T();
            if (strA0T != null) {
                if (c1084Mk.A07() == 0 || c1084Mk.A0B() != 91) {
                    String[] strArrSplit = strA0T.split(A07(33, 1, 30));
                    if (strArrSplit.length == 2) {
                        char c11 = 0;
                        String strA01 = XC.A01(strArrSplit[0].trim());
                        String[] strArr = A06;
                        String currentLine = strArr[0];
                        if (currentLine.charAt(16) != strArr[6].charAt(16)) {
                            A06[5] = "ifXCIfHfH71dM6rZrRRLzSgLVtHG8Ljd";
                            switch (strA01.hashCode()) {
                                case 1879649548:
                                    String currentLine2 = A07(337, 8, 7);
                                    if (!strA01.equals(currentLine2)) {
                                        c11 = 65535;
                                        break;
                                    }
                                    break;
                                case 1879649549:
                                    String currentLine3 = A07(345, 8, 103);
                                    if (strA01.equals(currentLine3)) {
                                        c11 = 1;
                                        break;
                                    }
                                    break;
                            }
                            switch (c11) {
                                case 0:
                                    this.A01 = Float.parseFloat(strArrSplit[1].trim());
                                    break;
                                case 1:
                                    try {
                                        this.A00 = Float.parseFloat(strArrSplit[1].trim());
                                        break;
                                    } catch (NumberFormatException unused) {
                                        break;
                                    }
                            }
                        } else {
                            throw new RuntimeException();
                        }
                    }
                } else {
                    return;
                }
            } else {
                return;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x00a5 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0062 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0C(C1084Mk c1084Mk, List<List<C1251Th>> list, List<Long> list2) {
        C1530bt c1530btA00 = this.A04 ? this.A03 : null;
        while (true) {
            String strA0T = c1084Mk.A0T();
            if (strA0T != null) {
                boolean zStartsWith = strA0T.startsWith(A07(43, 7, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
                if (A06[5].charAt(12) != 'M') {
                    throw new RuntimeException();
                }
                String[] strArr = A06;
                strArr[0] = "SxKBgYOXD0g7VRKd6wElRSFayzrxKQkC";
                strArr[6] = "SJNjeDKc8h4oj7g5XsxtT3LxguPyqJDp";
                if (zStartsWith) {
                    c1530btA00 = C1530bt.A00(strA0T);
                } else if (A06[5].charAt(12) != 'M') {
                    if (strA0T.startsWith(A07(34, 9, 114))) {
                        if (c1530btA00 != null) {
                            MV.A07(A07(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 10, 58), A07(96, 47, 113) + strA0T);
                        } else {
                            A0D(strA0T, c1530btA00, list, list2);
                        }
                    }
                } else {
                    String[] strArr2 = A06;
                    strArr2[2] = "Z6D3xawGOuqjWgS5bOOG";
                    strArr2[7] = "y8qvQfw3u7PeS7Q";
                    if (strA0T.startsWith(A07(34, 9, 114))) {
                        if (c1530btA00 != null) {
                        }
                    }
                }
            } else {
                return;
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.C8C
    public final InterfaceC1506bV A0g(byte[] bArr, int i5, boolean z11) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        C1084Mk c1084Mk = new C1084Mk(bArr, i5);
        if (!this.A04) {
            A0A(c1084Mk);
        }
        A0C(c1084Mk, arrayList, arrayList2);
        return new C1130Oe(arrayList, arrayList2);
    }
}
