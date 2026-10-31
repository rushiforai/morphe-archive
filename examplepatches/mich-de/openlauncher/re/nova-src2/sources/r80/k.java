package r80;

import b.c0;
import com.vungle.ads.internal.protos.Sdk;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Locale;
import java.util.regex.Pattern;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
import nova.branch.engage.sesame_lite.internal.State;

/* loaded from: classes.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f85688a;

    /* renamed from: b, reason: collision with root package name */
    public static final char[] f85689b;

    /* renamed from: c, reason: collision with root package name */
    public static final String[] f85690c;

    /* renamed from: d, reason: collision with root package name */
    public static final Pair[] f85691d;

    /* renamed from: e, reason: collision with root package name */
    public static final Pattern f85692e;

    /* renamed from: f, reason: collision with root package name */
    public static final byte[] f85693f;

    static {
        Pattern patternCompile = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        Intrinsics.f(patternCompile, "compile(...)");
        f85688a = patternCompile;
        f85689b = new char[]{230, 339, 248, 223, 254, 198, 338, 222};
        f85690c = new String[]{"ae", "oe", "oe", "ss", "th", "Ae", "Oe", "Th"};
        f85691d = new Pair[]{new Pair((char) 322, 'l'), new Pair((char) 273, 'd'), new Pair((char) 240, 'd'), new Pair((char) 305, 'i'), new Pair((char) 248, 'o')};
        Pattern patternCompile2 = Pattern.compile("\\s+");
        Intrinsics.f(patternCompile2, "compile(...)");
        f85692e = patternCompile2;
        byte b11 = (byte) 112;
        byte b12 = (byte) 113;
        byte b13 = (byte) Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE;
        byte b14 = (byte) 101;
        byte b15 = (byte) 114;
        byte b16 = (byte) Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE;
        byte b17 = (byte) Sdk.SDKError.Reason.TPAT_ERROR_VALUE;
        byte b18 = (byte) Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE;
        byte b19 = (byte) 105;
        byte b21 = (byte) 111;
        byte b22 = (byte) 115;
        byte b23 = (byte) 104;
        byte b24 = (byte) Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE;
        byte b25 = (byte) 110;
        byte b26 = (byte) 102;
        byte b27 = (byte) 120;
        byte b28 = (byte) 100;
        byte b29 = (byte) 103;
        byte b31 = (byte) 99;
        byte b32 = (byte) 106;
        byte b33 = (byte) 98;
        byte b34 = (byte) 107;
        byte b35 = (byte) 108;
        byte b36 = (byte) 109;
        byte b37 = (byte) 97;
        byte b38 = (byte) Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE;
        f85693f = new byte[]{b11, 0, 0, 0, 0, b12, 0, 0, 0, 0, b13, 0, 0, 0, 0, b14, 0, 0, 0, 0, b15, 0, 0, 0, 0, b16, 0, 0, 0, 0, b17, 0, 0, 0, 0, b18, 0, 0, 0, 0, b19, 0, 0, 0, 0, b21, 0, 0, 0, 0, b12, b13, b22, 0, 0, b23, b24, b25, 0, 0, b26, b27, b24, 0, 0, b14, b15, b22, b26, b27, b13, b15, b22, b28, 0, b15, b16, b28, b29, b31, b16, b17, b26, b23, b24, b17, b18, b29, b32, b33, b18, b21, b32, b34, 0, b18, b19, b23, b34, b25, b19, b21, b32, b35, b36, b21, b11, b34, 0, 0, b34, b25, 0, 0, 0, b32, b33, b36, 0, 0, b19, b11, b34, b35, 0, b21, b35, 0, 0, 0, b13, b14, b37, b22, 0, b14, b16, b28, b26, 0, b13, b14, b37, b28, b38, b15, b17, b26, b29, 0, b17, b19, b23, b32, 0, b29, b31, b33, 0, 0, b12, b14, b37, b22, 0, b28, b38, b31, 0, 0, b16, b18, b29, b23, 0, b22, b27, 0, 0, 0};
    }

    public static double a(long[] times, long j11) {
        Intrinsics.g(times, "times");
        double dMin = 0.0d;
        for (long j12 : times) {
            double d5 = (j11 - j12) / 900000;
            dMin += Math.min(Math.pow(Math.cos(0.032724923474893676d * d5), 1024.0d) * 10.0d, Math.max(1.0d, 10 - (d5 / 96.0d)));
        }
        return dMin;
    }

    public static double b(long[] times, long j11) {
        Intrinsics.g(times, "times");
        double d5 = 0.0d;
        for (long j12 : times) {
            d5 += 1.0d / ((((j11 - j12) / 900000) * 0.9d) + 0.1d);
        }
        return d5;
    }

    public static final void c(int i5, String str, ArrayList arrayList) {
        char[] cArr = f85689b;
        int iT0 = r70.k.T0(str, cArr, i5, false);
        if (iT0 == -1) {
            return;
        }
        String str2 = f85690c[kotlin.collections.c.H0(cArr, str.charAt(iT0))];
        int i11 = iT0 + 1;
        String string = r70.k.e1(str, iT0, i11, str2).toString();
        arrayList.add(string);
        c(i11, str, arrayList);
        c(i11, string, arrayList);
    }

    public static final void d(ArrayList arrayList, String[] strArr, int i5) {
        if (i5 == strArr.length - 1) {
            arrayList.add(strArr.clone());
        }
        int length = strArr.length - 1;
        if (i5 > length) {
            return;
        }
        int i11 = i5;
        while (true) {
            String str = strArr[i5];
            strArr[i5] = strArr[i11];
            strArr[i11] = str;
            d(arrayList, strArr, i5 + 1);
            String str2 = strArr[i11];
            strArr[i11] = strArr[i5];
            strArr[i5] = str2;
            if (i11 == length) {
                return;
            } else {
                i11++;
            }
        }
    }

    public static boolean e(int i5, String disp) {
        Intrinsics.g(disp, "disp");
        if (i5 >= 0 && i5 < disp.length() && Character.isLetterOrDigit(disp.charAt(i5))) {
            if (i5 != 0) {
                boolean z11 = Character.isDigit(disp.charAt(i5)) && !Character.isDigit(disp.charAt(i5 + (-1)));
                boolean z12 = (Character.isUpperCase(disp.charAt(i5)) || Character.isIdeographic(disp.charAt(i5))) && !Character.isUpperCase(disp.charAt(i5 + (-1)));
                boolean zIsLetterOrDigit = Character.isLetterOrDigit(disp.charAt(i5 - 1));
                if (z12 || !zIsLetterOrDigit || z11) {
                }
            }
            return true;
        }
        return false;
    }

    public static boolean f(int[] matchIndices) {
        int length;
        Intrinsics.g(matchIndices, "matchIndices");
        int length2 = matchIndices.length;
        if (length2 == 0) {
            return false;
        }
        if (length2 != 1 && 1 <= (length = matchIndices.length - 1)) {
            int i5 = 1;
            while (true) {
                int i11 = matchIndices[i5];
                if (i11 != -1) {
                    int i12 = matchIndices[i5 - 1];
                    if (i12 != -1 || length2 < 3) {
                        if (i11 != i12 + 1) {
                            return false;
                        }
                    } else if (i11 != matchIndices[i5 - 2] + 1) {
                        return false;
                    }
                }
                if (i5 == length) {
                    break;
                }
                i5++;
            }
        }
        return true;
    }

    public static boolean g(char c11, char c12) {
        int i5;
        if ('0' <= c11 && c11 < ':') {
            i5 = c11 - '0';
        } else {
            if ('a' > c11 || c11 >= '{') {
                return false;
            }
            i5 = c11 - 'W';
        }
        int i11 = i5 * 5;
        byte b11 = (byte) c12;
        byte[] bArr = f85693f;
        return bArr[i11] == b11 || bArr[i11 + 1] == b11 || bArr[i11 + 2] == b11 || bArr[i11 + 3] == b11 || bArr[i11 + 4] == b11;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0098 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean h(String str, String hayDisp, String hayPlain, int[] iArr, int[] iArr2) {
        int i5;
        boolean z11;
        int i11;
        Intrinsics.g(hayDisp, "hayDisp");
        Intrinsics.g(hayPlain, "hayPlain");
        if (iArr.length != str.length()) {
            throw new IllegalArgumentException("The `matchIdx` array must be the same length as the `needle` String");
        }
        if (hayDisp.length() != hayPlain.length()) {
            throw new IllegalArgumentException("The display String and the plain String must be the same length");
        }
        String string = r70.k.u1(str).toString();
        if (!Intrinsics.b(string, str)) {
            throw new IllegalArgumentException("The normalized `needle` String must not contain leading or trailing spaces");
        }
        int length = string.length();
        int length2 = hayPlain.length();
        int i12 = 0;
        boolean z12 = iArr2.length == 0;
        u90.b.C(-1, 0, 6, iArr);
        int i13 = 0;
        while (i13 <= length2 - length) {
            int i14 = i12;
            int i15 = i14;
            int i16 = -1;
            while (i14 < length) {
                int i17 = i13 + i14;
                z11 = true;
                int i18 = string.charAt(i14) == hayPlain.charAt(i17) ? 1 : i12;
                if (!z12 && i18 == 0 && i16 == -1 && length >= 3) {
                    i5 = i12;
                    if (g(string.charAt(i14), hayPlain.charAt(i17))) {
                        i11 = 1;
                    }
                    if ((i18 != 0 && i11 == 0) || (i14 <= 0 && !e(i17, hayDisp))) {
                        i15 = i5;
                        break;
                    }
                    iArr[i14] = i17;
                    if (i11 != 0) {
                        i16 = i17;
                    }
                    i14++;
                    i15 = 1;
                    i12 = i5;
                } else {
                    i5 = i12;
                }
                i11 = i5;
                if (i18 != 0) {
                    iArr[i14] = i17;
                    if (i11 != 0) {
                    }
                    i14++;
                    i15 = 1;
                    i12 = i5;
                } else {
                    iArr[i14] = i17;
                    if (i11 != 0) {
                    }
                    i14++;
                    i15 = 1;
                    i12 = i5;
                }
            }
            i5 = i12;
            z11 = true;
            if (i15 != 0) {
                if (!z12) {
                    iArr2[i5] = i16;
                }
                return z11;
            }
            i13++;
            i12 = i5;
        }
        return i12;
    }

    /* JADX WARN: Code restructure failed: missing block: B:147:0x0225, code lost:
    
        return false;
     */
    /* JADX WARN: Removed duplicated region for block: B:115:0x0198  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x019c  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x0223 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:149:0x0228 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:166:0x0234 A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:168:0x010c A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0100 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0105 A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean i(String str, String hayDisp, String hayPlain, int[] iArr, int[] iArr2) {
        boolean z11;
        int i5;
        boolean z12;
        char cCharAt;
        char cCharAt2;
        boolean z13;
        boolean z14;
        int[] iArr3 = iArr;
        Intrinsics.g(hayDisp, "hayDisp");
        Intrinsics.g(hayPlain, "hayPlain");
        if (iArr3.length != str.length()) {
            throw new IllegalArgumentException("The `matchIdx` array must be the same length as the `needle` String");
        }
        if (hayDisp.length() != hayPlain.length()) {
            throw new IllegalArgumentException("The display String and the plain String must be the same length");
        }
        String string = r70.k.u1(str).toString();
        if (!Intrinsics.b(string, str)) {
            throw new IllegalArgumentException("The normalized `needle` String must not contain leading or trailing spaces");
        }
        int length = string.length();
        int length2 = hayPlain.length();
        boolean z15 = iArr2.length == 0;
        u90.b.C(-1, 0, 6, iArr3);
        int i11 = 100;
        int i12 = 0;
        int i13 = 0;
        int i14 = 100;
        int i15 = -1;
        int i16 = -1;
        int i17 = -1;
        while (true) {
            if (i12 >= i11) {
                p log = State.INSTANCE.getLog();
                l.Companion.getClass();
                int iOrdinal = log.getLevel().ordinal();
                o oVar = o.f85697a;
                if (iOrdinal >= 1) {
                    n writer = log.getWriter();
                    int iHashCode = hayDisp.hashCode();
                    int iHashCode2 = hayPlain.hashCode();
                    StringBuilder sbV = c0.v("ERROR: Infinite loop avoided: needle=", iHashCode, string, ", hayDisp.hashCode=", ", hayPlain.hashCode=");
                    sbV.append(iHashCode2);
                    writer.error(sbV.toString());
                    return false;
                }
            } else {
                i12++;
                boolean z16 = i13 == 0;
                if (i14 == 100) {
                    if (i16 == -1) {
                        i16 = z16 ? 0 : iArr3[i13 - 1] + 1;
                    }
                    int i18 = i17;
                    for (int i19 = i16; i19 < length2; i19++) {
                        char cCharAt3 = string.charAt(i13);
                        char cCharAt4 = hayPlain.charAt(i19);
                        boolean z17 = cCharAt3 == cCharAt4 || (cCharAt3 == ' ' && !Character.isLetterOrDigit(cCharAt4));
                        if (z15 || z17 || i15 != -1 || i18 != -1 || length < 3) {
                            z13 = z17;
                        } else {
                            z13 = z17;
                            z14 = g(string.charAt(i13), hayPlain.charAt(i19));
                            if ((!z13 || z14) && e(i19, hayDisp)) {
                                iArr[i13] = i19;
                                if (z14) {
                                    i15 = i19;
                                }
                                if (i18 == -1 && i13 > 0) {
                                    i18 = i19;
                                }
                                if (i15 == -1 || i18 == -1) {
                                    i13++;
                                    z11 = true;
                                    i14 = 200;
                                    i16 = -1;
                                    break;
                                }
                                iArr[i13] = -1;
                                i15 = -1;
                                i18 = -1;
                            }
                        }
                        if (!z13) {
                            iArr[i13] = i19;
                            if (z14) {
                            }
                            if (i18 == -1) {
                                i18 = i19;
                            }
                            if (i15 == -1) {
                            }
                            i13++;
                            z11 = true;
                            i14 = 200;
                            i16 = -1;
                            break;
                        }
                        iArr[i13] = i19;
                        if (z14) {
                        }
                        if (i18 == -1) {
                        }
                        if (i15 == -1) {
                        }
                        i13++;
                        z11 = true;
                        i14 = 200;
                        i16 = -1;
                        break;
                    }
                    z11 = false;
                    i17 = i18;
                    if (!z11 && string.charAt(i13) == ' ') {
                        iArr[i13] = -1;
                        i13++;
                        z11 = true;
                        i14 = 100;
                    }
                    if (z11 || z16) {
                        if (z11 && z16) {
                            break;
                        }
                        if (z11 && i13 >= length) {
                            if (z15) {
                                return true;
                            }
                            iArr2[0] = i15;
                            return true;
                        }
                        iArr3 = iArr;
                        i11 = 100;
                    } else {
                        i14 = 300;
                        i16 = -1;
                        if (z11) {
                        }
                        if (z11) {
                        }
                        iArr3 = iArr;
                        i11 = 100;
                    }
                } else if (i14 == 200) {
                    int i21 = iArr[i13 - 1] + 1;
                    boolean z18 = i21 < length2 && ((cCharAt = string.charAt(i13)) == (cCharAt2 = hayPlain.charAt(i21)) || (cCharAt == ' ' && !Character.isLetterOrDigit(cCharAt2)));
                    if (z15 || i21 >= length2 || z18 || i15 != -1) {
                        i5 = i17;
                    } else {
                        i5 = i17;
                        if (i5 == -1 && length >= 3 && g(string.charAt(i13), hayPlain.charAt(i21))) {
                            z12 = true;
                        }
                        if (!z18 || z12) {
                            iArr[i13] = i21;
                            if (z12) {
                                i15 = i21;
                            }
                            i13++;
                            z11 = true;
                            i14 = 200;
                        } else {
                            i14 = i15 == -1 ? 100 : 301;
                            z11 = false;
                        }
                        i17 = i5;
                        i16 = -1;
                        if (z11) {
                        }
                        if (z11) {
                        }
                        iArr3 = iArr;
                        i11 = 100;
                    }
                    z12 = false;
                    if (z18) {
                        iArr[i13] = i21;
                        if (z12) {
                        }
                        i13++;
                        z11 = true;
                        i14 = 200;
                        i17 = i5;
                        i16 = -1;
                        if (z11) {
                        }
                        if (z11) {
                        }
                        iArr3 = iArr;
                        i11 = 100;
                    }
                } else {
                    int i22 = i17;
                    if (i14 == 300 || i14 == 301) {
                        do {
                            i13--;
                            if (i13 <= 0) {
                                break;
                            }
                        } while (iArr[i13] < 0);
                        int i23 = iArr[i13];
                        i17 = i23 <= i22 ? -1 : i22;
                        if (i23 <= i15) {
                            i15 = -1;
                        }
                        int i24 = i23 + 1;
                        iArr[i13] = -1;
                        if (i15 == -1 || i14 != 301) {
                            i14 = 100;
                        }
                        z11 = false;
                        i16 = i24;
                        if (z11) {
                        }
                        if (z11) {
                        }
                        iArr3 = iArr;
                        i11 = 100;
                    } else {
                        p log2 = State.INSTANCE.getLog();
                        l.Companion.getClass();
                        int iOrdinal2 = log2.getLevel().ordinal();
                        o oVar2 = o.f85697a;
                        if (iOrdinal2 >= 1) {
                            log2.getWriter().error("ERROR: Invalid state: " + i14 + ": needle=" + string + ", hayDisp.hashCode=" + hayDisp.hashCode() + ", hayPlain.hashCode=" + hayPlain.hashCode());
                            return false;
                        }
                    }
                }
            }
        }
    }

    public static String j(String display) {
        Intrinsics.g(display, "display");
        String element = f85688a.matcher(Normalizer.normalize(display, Normalizer.Form.NFD)).replaceAll(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        Intrinsics.f(element, "element");
        String lowerCase = element.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        for (Pair pair : f85691d) {
            lowerCase = r70.j.E0(lowerCase, ((Character) pair.f71683a).charValue(), ((Character) pair.f71684b).charValue());
        }
        if (lowerCase.length() == display.length()) {
            return lowerCase;
        }
        if (lowerCase.length() > display.length()) {
            lowerCase = Normalizer.normalize(lowerCase, Normalizer.Form.NFC);
        }
        if (lowerCase.length() == display.length()) {
            return lowerCase;
        }
        String lowerCase2 = display.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase2, "toLowerCase(...)");
        return lowerCase2.length() == display.length() ? lowerCase2 : display;
    }

    public static String[] k(String rawQuery) {
        String[] strArr;
        Intrinsics.g(rawQuery, "rawQuery");
        String string = r70.k.u1(rawQuery).toString();
        Pattern pattern = f85692e;
        String strReplaceAll = pattern.matcher(string).replaceAll(" ");
        Intrinsics.f(strReplaceAll, "replaceAll(...)");
        String[] strArr2 = (String[]) r70.k.i1(strReplaceAll, new String[]{" "}, 6).toArray(new String[0]);
        if (strArr2.length > 4) {
            strArr = new String[]{kotlin.collections.c.O0(strArr2, " ", null, null, null, 62)};
        } else {
            ArrayList arrayList = new ArrayList();
            d(arrayList, strArr2, 0);
            ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
            int size = arrayList.size();
            int i5 = 0;
            while (i5 < size) {
                Object obj = arrayList.get(i5);
                i5++;
                arrayList2.add(kotlin.collections.c.O0((String[]) obj, " ", null, null, null, 62));
            }
            strArr = (String[]) arrayList2.toArray(new String[0]);
        }
        ArrayList arrayList3 = new ArrayList();
        for (String str : strArr) {
            String strReplaceAll2 = pattern.matcher(str).replaceAll(" ");
            Intrinsics.f(strReplaceAll2, "replaceAll(...)");
            String string2 = r70.k.u1(strReplaceAll2).toString();
            if (string2.length() != 0) {
                ArrayList arrayList4 = new ArrayList();
                arrayList4.add(string2);
                c(0, string2, arrayList4);
                for (String str2 : (String[]) arrayList4.toArray(new String[0])) {
                    arrayList3.add(j(str2));
                }
            }
        }
        return (String[]) arrayList3.toArray(new String[0]);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0024 A[PHI: r13 r14
      0x0024: PHI (r13v6 int) = (r13v1 int), (r13v2 int) binds: [B:6:0x0022, B:12:0x003d] A[DONT_GENERATE, DONT_INLINE]
      0x0024: PHI (r14v6 int) = (r14v1 int), (r14v2 int) binds: [B:6:0x0022, B:12:0x003d] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static double l(int i5, String matchDisp, int[] iArr) {
        boolean z11;
        double d5;
        double[] dArr;
        int i11;
        int i12;
        Intrinsics.g(matchDisp, "matchDisp");
        int length = matchDisp.length();
        double[] dArr2 = new double[length];
        int length2 = matchDisp.length();
        int i13 = 0;
        int i14 = 0;
        int i15 = 0;
        int i16 = 0;
        int i17 = 1;
        int i18 = -1;
        int i19 = -1;
        int iMax = -1;
        while (i14 < length2) {
            if (i15 < iArr.length) {
                boolean zE = e(i14, matchDisp);
                if (zE) {
                    iMax = Math.max(i13, i19);
                    i19++;
                }
                if (i14 == iArr[i15]) {
                    int i21 = i14;
                    if (zE) {
                        dArr = dArr2;
                        i11 = length2;
                        dArr[i21] = Math.max(16.0d - iMax, 8.0d);
                        i16 = 1;
                    } else {
                        dArr = dArr2;
                        i11 = length2;
                        dArr[i21] = Math.max(8.0d - iMax, 1.0d);
                        i16 = (i15 <= 0 || iArr[i15 + (-1)] != iArr[i15] - 1 || i16 < 1) ? 0 : i16 + 1;
                    }
                    i12 = i21;
                    if (kotlin.collections.c.q0(f85689b, matchDisp.charAt(i12))) {
                        dArr[i12] = dArr[i12] * 4.0d;
                    }
                    i15++;
                    if (i16 > i17) {
                        i18 = (i12 + 1) - i16;
                        i17 = i16;
                    }
                } else {
                    i11 = length2;
                    i12 = i14;
                    dArr = dArr2;
                }
            }
            int i22 = i12 + 1;
            double[] dArr3 = dArr;
            i14 = i22;
            dArr2 = dArr3;
            length2 = i11;
            i13 = 0;
        }
        double[] dArr4 = dArr2;
        if (i17 > 1) {
            IntRange intRangeM0 = kotlin.ranges.a.m0(i18, i17 + i18);
            if (intRangeM0.g(i5)) {
                d5 = 1.333d;
                z11 = true;
            } else {
                d5 = 2.0d;
                z11 = false;
            }
            int i23 = intRangeM0.f71906a;
            int i24 = intRangeM0.f71907b;
            if (i23 <= i24) {
                while (true) {
                    dArr4[i23] = dArr4[i23] * d5;
                    if (i23 == i24) {
                        break;
                    }
                    i23++;
                }
            }
        } else {
            z11 = false;
        }
        if (!z11 && i5 != -1) {
            dArr4[i5] = dArr4[i5] / 4.0d;
        }
        double d11 = 0.0d;
        for (int i25 = 0; i25 < length; i25++) {
            d11 += dArr4[i25];
        }
        return d11;
    }
}
