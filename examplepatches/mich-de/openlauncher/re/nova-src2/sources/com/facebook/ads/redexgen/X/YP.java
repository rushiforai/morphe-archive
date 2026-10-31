package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.Formattable;
import java.util.MissingFormatArgumentException;
import java.util.UnknownFormatConversionException;
import javax.annotation.Nullable;

/* loaded from: assets/audience_network/classes.dex */
public abstract class YP {
    public static byte[] A00;
    public static String[] A01 = {"s22ei7jEKUY9529lCkJcZ4gJOWEEq6sw", "duV9wRl87qqwtjVxV5Z0l273mrzPB", "wMMC0QDni77iJPSC6cwStA4u0doNggjm", "8ULfkGAtnNjfoAXaBKqRxFGDDrSAPchC", "VlaoSfTQE6wEJso3tLAiebs4KdKOrk2p", "qxQGNomuCID4prBZS5y4k4PWwIkvdajS", b.f42142b, "T0faEiDKlZDlpeu3iXR"};
    public static final Object[] A02;

    public static String A0G(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 101);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0L() {
        A00 = new byte[]{6, -20, -54, -33, -26, -20, -29, -37, -105, -27, -26, -21, -105, -39, -36, -105, -27, -20, -29, -29, -105, -20, -27, -37, -36, -23, -105, -27, -26, -23, -28, -40, -29, -105, -38, -32, -23, -38, -20, -28, -22, -21, -40, -27, -38, -36, -22, -13, -6, -15, -15};
    }

    static {
        A0L();
        A02 = new Object[]{null};
    }

    public static int A00(String str) {
        return A0C(null, str, 0, null, null, null, null);
    }

    public static int A01(String str, int i5) {
        int length = str.length();
        char ch = 0;
        while (i5 < length) {
            int index = str.charAt(i5);
            if (index == 37) {
                int formatLen = A02(str, i5);
                if (formatLen == -100) {
                    int index2 = i5 + 1;
                    if (str.charAt(index2) == 37) {
                        i5++;
                        ch = 1;
                    } else {
                        int index3 = i5 + 2;
                        return index3;
                    }
                } else {
                    continue;
                }
            }
            i5++;
        }
        return ch != 0 ? -201 : -200;
    }

    public static int A02(String str, int i5) {
        int i11 = i5 + 1;
        int nextIndex = str.length();
        if (nextIndex > i11) {
            char nextChar = str.charAt(i11);
            if (nextChar == 's' || nextChar == 'd' || nextChar == '%') {
                return -100;
            }
            return -101;
        }
        return -101;
    }

    public static int A03(@Nullable String str, @Nullable int i5, @Nullable Object obj, @Nullable Object obj2, @Nullable Object obj3, Object obj4, Object[] objArr) {
        switch (i5) {
            case 0:
                int iA00 = A00(str);
                if (A01[6].length() == 24) {
                    throw new RuntimeException();
                }
                A01[7] = "WehvTxaaI3lXA2zhZ2U";
                return iA00;
            case 1:
                return A04(str, obj);
            case 2:
                return A05(str, obj, obj2);
            case 3:
                return A06(str, obj, obj2, obj3);
            case 4:
                return A07(str, obj, obj2, obj3, obj4);
            default:
                return A08(str, objArr);
        }
    }

    public static int A04(@Nullable String str, Object obj) {
        return A0C(null, str, 1, obj, null, null, null);
    }

    public static int A05(@Nullable String str, @Nullable Object obj, Object obj2) {
        return A0C(null, str, 2, obj, obj2, null, null);
    }

    public static int A06(@Nullable String str, @Nullable Object obj, @Nullable Object obj2, Object obj3) {
        return A0C(null, str, 3, obj, obj2, obj3, null);
    }

    public static int A07(@Nullable String str, @Nullable Object obj, @Nullable Object obj2, @Nullable Object obj3, Object obj4) {
        return A0C(null, str, 4, obj, obj2, obj3, obj4);
    }

    public static int A08(@Nullable String str, Object[] objArr) {
        return A0F(null, str, objArr);
    }

    /* JADX WARN: Code restructure failed: missing block: B:39:0x00bb, code lost:
    
        if (r3 != false) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00bd, code lost:
    
        if (r6 != null) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00bf, code lost:
    
        r5 = 0 + 20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00ca, code lost:
    
        if (r3 != false) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00cd, code lost:
    
        r6.append(((java.lang.Long) r7).longValue());
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00d8, code lost:
    
        if (r6 != null) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00da, code lost:
    
        return -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00e1, code lost:
    
        throw new java.lang.AssertionError();
     */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0041 A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0042 A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A09(@Nullable StringBuilder sb2, @Nullable Object obj) {
        int i5 = 0;
        if (obj == null) {
            if (A01[1].length() == 29) {
                String[] strArr = A01;
                strArr[0] = "quS3FtdEJc8pIw7YWoimB41t6YmKEhJj";
                strArr[5] = "9yujm8fM67Qfoyy5IiJhg4Ysq7tAQxkw";
                String strA0G = A0G(47, 4, 32);
                if (sb2 == null) {
                    int length = strA0G.length();
                    i5 = 0 + length;
                } else {
                    sb2.append(strA0G);
                }
                if (sb2 != null) {
                    return i5;
                }
                return -3;
            }
            throw new RuntimeException();
        }
        if (obj instanceof Integer) {
            if (sb2 == null) {
                i5 = 0 + 11;
            } else {
                int length2 = ((Number) obj).intValue();
                sb2.append(length2);
            }
        } else if (obj instanceof Short) {
            if (sb2 == null) {
                i5 = 0 + 6;
            } else {
                Number number = (Number) obj;
                if (A01[7].length() != 19) {
                    int length3 = number.intValue();
                    sb2.append(length3);
                } else {
                    A01[4] = "TMPvKOVVzNQQbWd0BUQkkejykTOsNvUF";
                    int length4 = number.intValue();
                    sb2.append(length4);
                }
            }
        } else {
            boolean z11 = obj instanceof Byte;
            if (A01[1].length() == 29) {
                A01[6] = "s3";
                if (z11) {
                    if (sb2 == null) {
                        i5 = 0 + 4;
                    } else {
                        int length5 = ((Number) obj).intValue();
                        sb2.append(length5);
                    }
                } else {
                    boolean z12 = obj instanceof Long;
                    if (A01[7].length() != 19) {
                        A01[1] = "iNLd9F0jnEpsxqy1iq2koshjG7Cem";
                    } else {
                        A01[3] = "8oF02HpiiNyioS6v2HdIaX3HTJH9lv2f";
                    }
                }
            }
            throw new RuntimeException();
        }
        if (sb2 != null) {
        }
    }

    public static int A0A(@Nullable StringBuilder sb2, @Nullable Object obj) {
        if (obj instanceof Formattable) {
            if (sb2 != null) {
                throw new AssertionError();
            }
            String[] strArr = A01;
            if (strArr[0].charAt(21) != strArr[5].charAt(21)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[0] = "4BKkoEbfngOw5R5InwlEw4FZQQsGPoGb";
            strArr2[5] = "0QrsJ9emLHdwhPrF0n6J941lHnHZbBBM";
            return -1;
        }
        String string = null;
        if (obj instanceof String) {
            String str = A01[7];
            if (str.length() != 19) {
                string = (String) obj;
            } else {
                A01[6] = "2Hj2rBW3humzXZ";
                string = (String) obj;
            }
        } else if (obj != null) {
            string = obj.toString();
        }
        if (string == null) {
            string = A0G(47, 4, 32);
        }
        if (sb2 == null) {
            return string.length();
        }
        sb2.append(string);
        return -3;
    }

    public static int A0B(@Nullable StringBuilder sb2, String str, int i5, int i11, boolean z11) {
        int length = str.length();
        int i12 = 0;
        while (i5 < length) {
            char cCharAt = str.charAt(i5);
            if (cCharAt == '%') {
                int formatLen = i5 + 1;
                if (length > formatLen) {
                    int formatLen2 = i5 + 1;
                    if (str.charAt(formatLen2) == 37) {
                        i5++;
                    }
                }
                if (!z11) {
                    throw new AssertionError();
                }
                int index = A01[1].length();
                if (index != 29) {
                    throw new RuntimeException();
                }
                A01[6] = "iV8t4Rd0";
                return -1;
            }
            if (sb2 == null) {
                i12++;
            } else {
                sb2.append(cCharAt);
            }
            i5++;
        }
        if (z11) {
            return i11 + i12;
        }
        return -3;
    }

    public static int A0C(@Nullable StringBuilder sb2, @Nullable String str, @Nullable int length, @Nullable Object obj, @Nullable Object obj2, Object obj3, Object obj4) {
        int appendLen;
        int argIdx = 0;
        int i5 = 0;
        boolean z11 = sb2 == null;
        int i11 = length == 0 ? -1 : 0;
        int i12 = i11;
        while (true) {
            if (i12 < length) {
                int appendLen2 = A0D(sb2, str, argIdx, obj, obj2, obj3, obj4, i12);
                if (appendLen2 == -1) {
                    return -1;
                }
                if (z11) {
                    i5 += appendLen2;
                }
                argIdx = A01(str, argIdx);
                if (i12 == i11) {
                    appendLen = -200;
                    if (argIdx == -200 && z11) {
                        return -2;
                    }
                } else {
                    appendLen = -200;
                }
                if (argIdx < 0) {
                    break;
                }
                i12++;
            } else {
                appendLen = -200;
                break;
            }
        }
        if (argIdx == appendLen || argIdx == -201) {
            if (z11) {
                return i5;
            }
            return -3;
        }
        return A0B(sb2, str, argIdx, i5, z11);
    }

    public static int A0D(@Nullable StringBuilder sb2, @Nullable String str, @Nullable int i5, @Nullable Object obj, @Nullable Object obj2, Object obj3, Object obj4, int i11) {
        switch (i11) {
            case -1:
                int iA0E = A0E(sb2, str, i5, null, false);
                if (A01[3].charAt(12) != 'o') {
                    throw new RuntimeException();
                }
                A01[1] = "hCwEXGE3aO1xOwN9cf3ilFtdUGpFL";
                return iA0E;
            case 0:
                return A0E(sb2, str, i5, obj, true);
            case 1:
                return A0E(sb2, str, i5, obj2, true);
            case 2:
                return A0E(sb2, str, i5, obj3, true);
            case 3:
                return A0E(sb2, str, i5, obj4, true);
            default:
                throw new AssertionError();
        }
    }

    public static int A0E(@Nullable StringBuilder sb2, @Nullable String str, int i5, Object obj, boolean z11) {
        int index;
        int length = str.length();
        int i11 = 0;
        while (i5 < length) {
            char cCharAt = str.charAt(i5);
            if (cCharAt == '%') {
                if (A02(str, i5) != -100) {
                    return -1;
                }
                int index2 = i5 + 1;
                int length2 = str.charAt(index2);
                if (!z11 && length2 != 37) {
                    return -1;
                }
                int formatLen = 1;
                if (length2 == 115) {
                    index = A0A(sb2, obj);
                } else if (length2 == 100) {
                    index = A09(sb2, obj);
                } else if (length2 == 37) {
                    formatLen = 0;
                    if (sb2 != null) {
                        sb2.append('%');
                    }
                    index = 1;
                    i5++;
                } else {
                    index = -1;
                }
                if (index == -1) {
                    return -1;
                }
                if (sb2 == null) {
                    i11 += index;
                }
                if (formatLen != 0) {
                    break;
                }
            } else if (sb2 == null) {
                i11++;
            } else {
                sb2.append(cCharAt);
            }
            i5++;
        }
        if (sb2 == null) {
            return i11;
        }
        return -3;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x002c, code lost:
    
        if (r6 == false) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x002e, code lost:
    
        if (r5 != false) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0030, code lost:
    
        return -2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x003c, code lost:
    
        if (r9 == (-200)) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x003e, code lost:
    
        if (r9 != (-201)) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0040, code lost:
    
        if (r6 == false) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0042, code lost:
    
        return r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x004f, code lost:
    
        if (com.facebook.ads.redexgen.X.YP.A01[1].length() == 29) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0056, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0057, code lost:
    
        com.facebook.ads.redexgen.X.YP.A01[6] = "CmNNkHWmndNZo1faI8JZxc9feyzulH";
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x005e, code lost:
    
        return -3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x005f, code lost:
    
        r0 = A0B(r11, r12, r9, r8, r6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0063, code lost:
    
        return r0;
     */
    /* JADX WARN: Removed duplicated region for block: B:9:0x000c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A0F(@Nullable StringBuilder sb2, @Nullable String str, Object... objArr) {
        int iA01 = 0;
        int i5 = 0;
        int i11 = 0;
        boolean z11 = sb2 == null;
        boolean z12 = false;
        if (objArr != null) {
            int segIdx = objArr.length;
            if (segIdx == 0) {
                objArr = A02;
                z12 = true;
            }
        }
        boolean formatted = false;
        int length = objArr.length;
        while (true) {
            if (i11 < length) {
                int length2 = A0E(sb2, str, iA01, objArr[i11], !z12);
                if (length2 == -1) {
                    return -1;
                }
                if (z11) {
                    i5 += length2;
                }
                iA01 = A01(str, iA01);
                if (iA01 == -200) {
                    break;
                }
                if (iA01 == -201) {
                    formatted = true;
                    break;
                }
                formatted = true;
                i11++;
            } else {
                break;
            }
        }
    }

    public static String A0H(@Nullable String str, @Nullable int i5, @Nullable Object obj, @Nullable Object obj2, @Nullable Object obj3, Object obj4, Object[] objArr) {
        switch (i5) {
            case 0:
                return A0K(str, new Object[0]);
            case 1:
                return A0K(str, obj);
            case 2:
                return A0K(str, obj, obj2);
            case 3:
                return A0K(str, obj, obj2, obj3);
            case 4:
                return A0K(str, obj, obj2, obj3, obj4);
            default:
                return A0K(str, objArr);
        }
    }

    public static String A0I(@Nullable String str, @Nullable int i5, @Nullable Object obj, @Nullable Object obj2, @Nullable Object obj3, Object obj4, Object[] objArr) {
        int iA03 = A03(str, i5, obj, obj2, obj3, obj4, objArr);
        if (iA03 == -1) {
            return A0H(str, i5, obj, obj2, obj3, obj4, objArr);
        }
        if (iA03 == -2) {
            return str;
        }
        StringBuilder sb2 = new StringBuilder(iA03);
        if (i5 == -1) {
            A0F(sb2, str, objArr);
        } else {
            A0C(sb2, str, i5, obj, obj2, obj3, obj4);
        }
        return sb2.toString();
    }

    public static String A0J(@Nullable String str, Object obj) {
        return A0I(str, 1, obj, null, null, null, null);
    }

    public static String A0K(@Nullable String str, Object... objArr) {
        try {
            return String.format(null, str, (Object[]) YL.A00(objArr, A0G(2, 45, 18)));
        } catch (MissingFormatArgumentException | UnknownFormatConversionException ex2) {
            throw new RuntimeException(ex2.getMessage() + A0G(0, 2, 103) + str);
        }
    }
}
