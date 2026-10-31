package com.fyber.inneractive.sdk.player.exoplayer2.util;

import android.net.Uri;
import android.text.TextUtils;

/* loaded from: classes3.dex */
public abstract class x {
    public static Uri a(String str, String str2) {
        String strA;
        StringBuilder sb2 = new StringBuilder();
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (str2 == null) {
            str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        int[] iArrA = a(str2);
        if (iArrA[0] != -1) {
            sb2.append(str2);
            a(sb2, iArrA[1], iArrA[2]);
            strA = sb2.toString();
        } else {
            int[] iArrA2 = a(str);
            if (iArrA[3] == 0) {
                sb2.append((CharSequence) str, 0, iArrA2[3]);
                sb2.append(str2);
                strA = sb2.toString();
            } else if (iArrA[2] == 0) {
                sb2.append((CharSequence) str, 0, iArrA2[2]);
                sb2.append(str2);
                strA = sb2.toString();
            } else {
                int i5 = iArrA[1];
                if (i5 != 0) {
                    int i11 = iArrA2[0] + 1;
                    sb2.append((CharSequence) str, 0, i11);
                    sb2.append(str2);
                    strA = a(sb2, iArrA[1] + i11, i11 + iArrA[2]);
                } else if (str2.charAt(i5) == '/') {
                    sb2.append((CharSequence) str, 0, iArrA2[1]);
                    sb2.append(str2);
                    int i12 = iArrA2[1];
                    strA = a(sb2, i12, iArrA[2] + i12);
                } else {
                    int i13 = iArrA2[0] + 2;
                    int i14 = iArrA2[1];
                    if (i13 >= i14 || i14 != iArrA2[2]) {
                        int iLastIndexOf = str.lastIndexOf(47, iArrA2[2] - 1);
                        int i15 = iLastIndexOf == -1 ? iArrA2[1] : iLastIndexOf + 1;
                        sb2.append((CharSequence) str, 0, i15);
                        sb2.append(str2);
                        strA = a(sb2, iArrA2[1], i15 + iArrA[2]);
                    } else {
                        sb2.append((CharSequence) str, 0, i14);
                        sb2.append('/');
                        sb2.append(str2);
                        int i16 = iArrA2[1];
                        strA = a(sb2, i16, iArrA[2] + i16 + 1);
                    }
                }
            }
        }
        return Uri.parse(strA);
    }

    public static String a(StringBuilder sb2, int i5, int i11) {
        int i12;
        int iLastIndexOf;
        if (i5 >= i11) {
            return sb2.toString();
        }
        if (sb2.charAt(i5) == '/') {
            i5++;
        }
        int i13 = i5;
        int i14 = i13;
        while (i13 <= i11) {
            if (i13 == i11) {
                i12 = i13;
            } else if (sb2.charAt(i13) == '/') {
                i12 = i13 + 1;
            } else {
                i13++;
            }
            int i15 = i14 + 1;
            if (i13 == i15 && sb2.charAt(i14) == '.') {
                sb2.delete(i14, i12);
                i11 -= i12 - i14;
            } else {
                if (i13 == i14 + 2 && sb2.charAt(i14) == '.' && sb2.charAt(i15) == '.') {
                    iLastIndexOf = sb2.lastIndexOf("/", i14 - 2) + 1;
                    int i16 = iLastIndexOf > i5 ? iLastIndexOf : i5;
                    sb2.delete(i16, i12);
                    i11 -= i12 - i16;
                } else {
                    iLastIndexOf = i13 + 1;
                }
                i14 = iLastIndexOf;
            }
            i13 = i14;
        }
        return sb2.toString();
    }

    public static int[] a(String str) {
        int iIndexOf;
        int[] iArr = new int[4];
        if (TextUtils.isEmpty(str)) {
            iArr[0] = -1;
            return iArr;
        }
        int length = str.length();
        int iIndexOf2 = str.indexOf(35);
        if (iIndexOf2 != -1) {
            length = iIndexOf2;
        }
        int iIndexOf3 = str.indexOf(63);
        if (iIndexOf3 == -1 || iIndexOf3 > length) {
            iIndexOf3 = length;
        }
        int iIndexOf4 = str.indexOf(47);
        if (iIndexOf4 == -1 || iIndexOf4 > iIndexOf3) {
            iIndexOf4 = iIndexOf3;
        }
        int iIndexOf5 = str.indexOf(58);
        if (iIndexOf5 > iIndexOf4) {
            iIndexOf5 = -1;
        }
        int i5 = iIndexOf5 + 2;
        if (i5 < iIndexOf3 && str.charAt(iIndexOf5 + 1) == '/' && str.charAt(i5) == '/') {
            iIndexOf = str.indexOf(47, iIndexOf5 + 3);
            if (iIndexOf == -1 || iIndexOf > iIndexOf3) {
                iIndexOf = iIndexOf3;
            }
        } else {
            iIndexOf = iIndexOf5 + 1;
        }
        iArr[0] = iIndexOf5;
        iArr[1] = iIndexOf;
        iArr[2] = iIndexOf3;
        iArr[3] = length;
        return iArr;
    }
}
