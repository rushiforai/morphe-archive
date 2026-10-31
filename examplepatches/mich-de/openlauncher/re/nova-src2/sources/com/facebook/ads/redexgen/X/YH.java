package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONObject;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class YH {
    public static byte[] A00;
    public static String[] A01 = {"qnwqctT6ageO1xl3dFxNmj0l", "6DllNKJrbB", "Q7", "Zsf0dCDvEOjJrtmBer1H6rN5VyjI0QwC", "zVW1DUPU1YxLWRSsgR4pVO2JJMe7GGhC", "QKeXNxXVlWNwk2QLqX4uD4lq1qh3Z9rY", "Il", "E7csg90lErhJ6bkx9OV"};

    public /* synthetic */ YH(AbstractC05811i abstractC05811i) {
        this();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 48);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A00 = new byte[]{123, 120, 121, 126, AbstractJsonLexerKt.TC_INVALID, 124, 125, 114, 115, 112, 113, 118, 119, 116, 117, 106, 107, 104, 105, 110, 111, 108, 109, 98, 99, 96, 91, 88, 89, 94, 95, 92, 93, 82, 83, 80, 81, 86, 87, 84, 85, 74, 75, 72, 73, 78, 79, 76, 77, 66, 67, 64, 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 17, 21, 68, 71, 85, 67, 98, 67, 74, 82, 71, 10, 92, 61, 26, 46, 63, 50, 52, 11, 59, 4, 8, 26, 12, 15, 1, 8, 88, 93, 29, 21, 83, 73, 105, 85, 79, 84, 94, 117, 84, 20, 14, 43, 20, 24, 10, 28, 31, 17, 24, 72, 77, 82, 73, 117, 82, 84, 79, 72, 65, 14, 8, 8, 8, 15, 76, 95, 72, 73, 83, 85, 84, 101, 60, 123, 108, 108, 60, 36, 60, 77, 87, 68, 91, 65, 91, 70, 93, 91, 91, 90, 65, 83, 95, 70, 65, 93, 95, 78, 60, 99};
    }

    static {
        A07();
    }

    public YH() {
    }

    private final long A00(long j11) {
        return (j11 << 1) ^ (j11 >> 63);
    }

    private final long A01(List<YF> list, int i5, int i11) {
        HashMap map = new HashMap();
        int i12 = i5 + i11;
        for (int i13 = i5 + 1; i13 < i12; i13++) {
            long jA03 = list.get(i13).A03();
            long jA01 = list.get(i13).A01();
            Long lValueOf = Long.valueOf(jA03);
            Long lValueOf2 = Long.valueOf(jA03);
            Object obj = map.get(lValueOf2);
            if (obj == null) {
                obj = 0;
                map.put(lValueOf2, obj);
            }
            map.put(lValueOf, Integer.valueOf(((Number) obj).intValue() + 1));
            Long lValueOf3 = Long.valueOf(jA01);
            Long lValueOf4 = Long.valueOf(jA01);
            Object obj2 = map.get(lValueOf4);
            if (obj2 == null) {
                obj2 = 0;
                map.put(lValueOf4, obj2);
            }
            map.put(lValueOf3, Integer.valueOf(((Number) obj2).intValue() + 1));
        }
        long j11 = 3333;
        int i14 = 0;
        Iterator it = map.entrySet().iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            if (A01[7].length() != 19) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[6] = "u6";
            strArr[2] = "2Z";
            if (zHasNext) {
                Map.Entry entry = (Map.Entry) it.next();
                long jLongValue = ((Number) entry.getKey()).longValue();
                int iIntValue = ((Number) entry.getValue()).intValue();
                if (i14 < iIntValue) {
                    i14 = iIntValue;
                    String[] strArr2 = A01;
                    if (strArr2[4].charAt(18) != strArr2[5].charAt(18)) {
                        throw new RuntimeException();
                    }
                    A01[0] = "HAyBDUSIlz45orPJ7SvTyDzH";
                    j11 = jLongValue;
                }
            } else {
                int i15 = i5 + i11;
                for (int i16 = i5 + 1; i16 < i15; i16++) {
                    list.get(i16).A09(list.get(i16).A03() - j11);
                    list.get(i16).A07(list.get(i16).A01() - j11);
                }
                return j11;
            }
        }
    }

    private final String A03(String str) {
        String strA02 = A02(0, 64, 10);
        StringBuilder sb2 = new StringBuilder(str);
        StringBuilder sb3 = new StringBuilder();
        StringBuilder sb4 = new StringBuilder();
        int length = sb2.length() % 3;
        if (length > 0) {
            while (length < 3) {
                sb4.append('=');
                sb2.append((char) 0);
                length++;
            }
        }
        for (int n32 = 0; n32 < sb2.length(); n32 += 3) {
            int iCharAt = (sb2.charAt(n32) << 16) + (sb2.charAt(n32 + 1) << '\b') + sb2.charAt(n32 + 2);
            int n42 = (iCharAt >> 12) & 63;
            StringBuilder sb5 = sb3.append(strA02.charAt((iCharAt >> 18) & 63));
            sb5.append(strA02.charAt(n42)).append(strA02.charAt((iCharAt >> 6) & 63)).append(strA02.charAt(iCharAt & 63));
        }
        StringBuilder r11 = new StringBuilder();
        String base64chars = sb3.substring(0, sb3.length() - sb4.length());
        return r11.append(base64chars).append((Object) sb4).toString();
    }

    private final String A04(List<Long> list) {
        StringBuilder sb2 = new StringBuilder();
        Iterator<Long> it = list.iterator();
        while (it.hasNext()) {
            A08(sb2, A00(it.next().longValue()));
        }
        String string = sb2.toString();
        C1h.A08(string, A02(115, 13, 22));
        return A03(string);
    }

    private final String A05(List<YF> list, int i5, int i11, boolean z11) {
        if (list == null || list.isEmpty() || i5 < 0 || i5 >= list.size() || i11 <= 0 || i5 + i11 > list.size()) {
            return null;
        }
        Map frameDataMap = new HashMap();
        frameDataMap.put(A02(73, 2, 92), list.get(i5).A05());
        frameDataMap.put(A02(128, 7, 10), 1);
        boolean z12 = false;
        boolean z13 = false;
        if (i11 > 1) {
            A09(list, i5, i11);
            frameDataMap.put(A02(64, 9, 22), Long.valueOf(A01(list, i5, i11)));
            ArrayList arrayList = new ArrayList();
            List framesTimestampList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            int i12 = i5 + i11;
            for (int i13 = i5 + 1; i13 < i12; i13++) {
                arrayList.add(Long.valueOf(list.get(i13).A03()));
                arrayList.add(Long.valueOf(list.get(i13).A01()));
                arrayList.add(Long.valueOf(list.get(i13).A02()));
                framesTimestampList.add(Long.valueOf(list.get(i13).A00()));
                if (list.get(i13).A00() != 0) {
                    z12 = true;
                }
                if (z11) {
                    arrayList2.add(Long.valueOf(list.get(i13).A04()));
                    if (list.get(i13).A04() != 0) {
                        z13 = true;
                    }
                }
            }
            String[] strArr = A01;
            if (strArr[6].length() != strArr[2].length()) {
                throw new RuntimeException();
            }
            A01[7] = "7rsfaig8zHVSiLY1BNm";
            frameDataMap.put(A02(92, 2, 75), A04(arrayList));
            frameDataMap.put(A02(75, 6, 107), A04(framesTimestampList));
            frameDataMap.put(A02(94, 9, 10), Boolean.valueOf(z12));
            if (z11) {
                frameDataMap.put(A02(81, 11, 93), A04(arrayList2));
                frameDataMap.put(A02(103, 12, 77), Boolean.valueOf(z13));
            }
        }
        String strA06 = A06(frameDataMap);
        if (strA06.length() > 900000) {
            return A02(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 29, 46);
        }
        return strA06;
    }

    private final String A06(Map<String, ? extends Object> map) {
        JSONObject json = new JSONObject(map);
        String string = json.toString();
        C1h.A08(string, A02(115, 13, 22));
        return string;
    }

    private final void A08(StringBuilder sb2, long j11) {
        while (j11 >= 128) {
            long j12 = (128 - 1) & j11;
            long v11 = 128;
            j11 >>= 7;
            sb2.append((char) (AnonymousClass23.A00((short) (j12 | v11)) & 65535));
        }
        sb2.append((char) (AnonymousClass23.A00((short) j11) & 65535));
    }

    /* JADX WARN: Code restructure failed: missing block: B:7:0x002a, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void A09(List<YF> list, int i5, int i11) {
        long jA00;
        int i12 = (i5 + i11) - 1;
        int i13 = i5 + 1;
        if (i13 > i12) {
            return;
        }
        while (true) {
            YF yf2 = list.get(i12);
            long jA03 = list.get(i12).A03();
            if (A01[7].length() == 19) {
                A01[3] = "0iwomLXeg9YMvBvgcoead3c8N7DnJaUP";
                int i14 = i12 - 1;
                yf2.A09(jA03 - list.get(i14).A03());
                int i15 = i12 - 1;
                list.get(i12).A07(list.get(i12).A01() - list.get(i15).A01());
                int i16 = i12 - 1;
                list.get(i12).A08(list.get(i12).A02() - list.get(i16).A02());
                YF yf3 = list.get(i12);
                int i17 = i12 - 1;
                long jA04 = 0;
                if (list.get(i17).A00() == -1) {
                    jA00 = 0;
                } else {
                    int i18 = i12 - 1;
                    jA00 = list.get(i12).A00() - list.get(i18).A00();
                }
                yf3.A06(jA00);
                YF yf4 = list.get(i12);
                int i19 = i12 - 1;
                if (list.get(i19).A04() != -1) {
                    int i21 = i12 - 1;
                    jA04 = list.get(i12).A04() - list.get(i21).A04();
                }
                yf4.A0A(jA04);
                if (A01[3].charAt(8) == 'u') {
                    break;
                }
                A01[0] = "GWUflG3X1Ler6fL2IZrO2ff1";
                list.get(i12).A08(list.get(i12).A02() - list.get(i12).A01());
                if (i12 == i13) {
                    return;
                } else {
                    i12--;
                }
            } else {
                break;
            }
        }
    }

    @JvmStatic
    public final String A0A(List<YF> list) {
        if (list == null) {
            return null;
        }
        return A05(list, 0, list.size(), false);
    }
}
