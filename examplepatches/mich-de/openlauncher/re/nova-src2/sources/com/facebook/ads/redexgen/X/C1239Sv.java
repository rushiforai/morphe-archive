package com.facebook.ads.redexgen.X;

import android.text.Html;
import android.text.Layout;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.text.style.TypefaceSpan;
import android.text.style.UnderlineSpan;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.vungle.ads.internal.protos.Sdk;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.Inflater;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

/* renamed from: com.facebook.ads.redexgen.X.Sv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1239Sv implements WB {
    public static byte[] A01;
    public static String[] A02 = {"RzHtHQlp9n4Yq", "p8CNpS872ldVgXlWcqfv2QWVETdv17eW", "V5aF1AJWL9", "ks77GUXob4", "HRKDNERx4si89RhZHXNQq8TgSXRynpYh", "3Y9xJOWYHV7if", "gt8YEnjkmuFc9zNqd3YMVSmahY1sgvgv", "sIt2D0JrmTtJ"};
    public final /* synthetic */ C1233Sp A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 68);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{9, 60, 60, 45, 37, 56, 60, 45, 44, 104, 60, 39, 104, 43, 58, 45, 41, 60, 45, 104, 44, 45, 43, 39, 44, 45, 58, 104, 46, 39, 58, 104, 61, 38, 59, 61, 56, 56, 39, 58, 60, 45, 44, 104, 46, 39, 58, 37, 41, 60, 120, 105, 105, 117, 112, 122, 120, 109, 112, 118, 119, 54, 122, 124, 120, 52, 47, 41, 33, 116, 101, 101, 121, 124, 118, 116, 97, 124, 122, 123, 58, 118, 112, 116, 56, 34, 37, 45, 38, 55, 55, 43, 46, 36, 38, 51, 46, 40, 41, 104, 35, 49, 37, 52, 50, 37, 52, 4, 21, 21, 9, 12, 6, 4, 17, 12, 10, 11, 74, 21, 2, 22, 90, 75, 75, 87, 82, 88, 90, 79, 82, 84, 85, 20, 79, 79, 86, 87, 16, 67, 86, 87, 40, 57, 57, 37, 32, 42, 40, 61, 32, 38, 39, 102, 49, 100, 36, 57, 125, 100, 42, 44, 40, 100, AbstractJsonLexerKt.TC_INVALID, 121, 113, 86, 71, 71, 91, 94, 84, 86, 67, 94, 88, 89, 24, 79, 26, 90, 71, 3, 26, 65, 67, 67, 41, 56, 56, 36, 33, 43, 41, 60, 33, 39, 38, 103, 48, 101, 57, 61, 33, 43, 35, 60, 33, 37, 45, 101, 60, 48, 123, 47, 6, 23, 23, 11, 14, 4, 6, 19, 14, 8, 9, 72, 31, 74, 20, 18, 5, 21, 14, 23, 112, 97, 124, 112, 43, 114, 112, 112, 122, 107, 118, 122, 33, 118, 35, 125, 125, 111};
    }

    static {
        A01();
    }

    public C1239Sv(C1233Sp c1233Sp) {
        this.A00 = c1233Sp;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0102  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0110  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0119  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0009  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0130  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0136  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0142  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x014a  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x000d  */
    @Override // com.facebook.ads.redexgen.X.WB
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final InterfaceC1136Ok A5t(VC vc) {
        char c11;
        String str = vc.A0W;
        switch (str.hashCode()) {
            case -1351681404:
                c11 = str.equals(A00(88, 19, 3)) ? '\t' : (char) 65535;
                switch (c11) {
                    case 0:
                        return new C8C() { // from class: com.facebook.ads.redexgen.X.3x
                            public static byte[] A02;
                            public static String[] A03 = {"98ZB2p52BfDI9InG", "sBB1", "tybSS6tuSkVrXmoNozbfwWWtkiaETjnA", "4TmFxpA75ClG7hN", "41cd45Lpa", "CSPkkd2CcXilORAbTgbw", "ZfCDoC0hlCURmxdhfevGj1", "MSucVwagIdDU"};
                            public final C1084Mk A00;
                            public final C1556cJ A01;

                            public static String A01(int i5, int i11, int i12) {
                                byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
                                int i13 = 0;
                                while (true) {
                                    int length = bArrCopyOfRange.length;
                                    if (A03[5].length() != 20) {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr = A03;
                                    strArr[1] = "e5xI";
                                    strArr[7] = "uVRZajoyR3Xb";
                                    if (i13 >= length) {
                                        return new String(bArrCopyOfRange);
                                    }
                                    byte b11 = bArrCopyOfRange[i13];
                                    String[] strArr2 = A03;
                                    if (strArr2[1].length() != strArr2[7].length()) {
                                        String[] strArr3 = A03;
                                        strArr3[1] = "UO1P";
                                        strArr3[7] = "SlnsVpW3VNIC";
                                        bArrCopyOfRange[i13] = (byte) ((b11 - i12) - 6);
                                        i13++;
                                    } else {
                                        A03[2] = "C0vMq6SbLyy0VcQkGRmCtlZRxub0dCvX";
                                        bArrCopyOfRange[i13] = (byte) ((b11 - i12) - 1);
                                        i13 += 0;
                                    }
                                }
                            }

                            public static void A02() {
                                A02 = new byte[]{-115, 108, -65, -64, -59, -72, -79, 108, -82, -72, -69, -81, -73, 108, -61, -83, -65, 108, -78, -69, -63, -70, -80, 108, -83, -78, -64, -79, -66, 108, -64, -76, -79, 108, -78, -75, -66, -65, -64, 108, -81, -63, -79, 122, 105, 106, 111, 96, -122, -121, -116, AbstractJsonLexerKt.TC_INVALID, 120, -123, -109, -112, -92, -94, -94, 114, -109, -111, -99, -110, -109, -96};
                            }

                            static {
                                A02();
                            }

                            {
                                A01(53, 13, 40);
                                this.A00 = new C1084Mk();
                                this.A01 = new C1556cJ();
                            }

                            public static int A00(C1084Mk c1084Mk) {
                                int currentInputPosition = -1;
                                int iA09 = 0;
                                while (currentInputPosition == -1) {
                                    iA09 = c1084Mk.A09();
                                    String strA0T = c1084Mk.A0T();
                                    if (strA0T == null) {
                                        currentInputPosition = 0;
                                    } else if (A01(48, 5, 45).equals(strA0T)) {
                                        currentInputPosition = 2;
                                    } else if (strA0T.startsWith(A01(44, 4, 21))) {
                                        currentInputPosition = 1;
                                    } else {
                                        currentInputPosition = 3;
                                    }
                                }
                                c1084Mk.A0f(iA09);
                                return currentInputPosition;
                            }

                            public static void A03(C1084Mk c1084Mk) {
                                while (!TextUtils.isEmpty(c1084Mk.A0T())) {
                                }
                            }

                            @Override // com.facebook.ads.redexgen.X.C8C
                            public final InterfaceC1506bV A0g(byte[] bArr, int i5, boolean z11) throws C1135Oj {
                                C1564cR c1564cRA0A;
                                this.A00.A0j(bArr, i5);
                                ArrayList arrayList = new ArrayList();
                                try {
                                    AbstractC1573ca.A04(this.A00);
                                    while (!TextUtils.isEmpty(this.A00.A0T())) {
                                    }
                                    ArrayList arrayList2 = new ArrayList();
                                    while (true) {
                                        int iA00 = A00(this.A00);
                                        if (iA00 != 0) {
                                            if (iA00 == 1) {
                                                A03(this.A00);
                                            } else if (iA00 == 2) {
                                                if (arrayList2.isEmpty()) {
                                                    this.A00.A0T();
                                                    arrayList.addAll(this.A01.A0F(this.A00));
                                                } else {
                                                    throw new C1135Oj(A01(0, 44, 70));
                                                }
                                            } else if (iA00 == 3 && (c1564cRA0A = AbstractC1572cZ.A0A(this.A00, arrayList)) != null) {
                                                arrayList2.add(c1564cRA0A);
                                            }
                                        } else {
                                            return new OS(arrayList2);
                                        }
                                    }
                                } catch (L9 e3) {
                                    throw new C1135Oj(e3);
                                }
                            }
                        };
                    case 1:
                        return new AnonymousClass42(vc.A0X);
                    case 2:
                        return new C8C() { // from class: com.facebook.ads.redexgen.X.3y
                            public static byte[] A01;
                            public static String[] A02 = {"bB4fX5LAMTv2rYFSZf5QpPO9cK3aM7U2", "4rNogpiUeXzxD1XRjYnBUgq0bpiXGeso", "ZZjdhlJY5PlDp7fwok9ve2Ik4GbTskO", "jY68eWle734mFwRjbZBzuLEFRACXLxDE", "mRAvLdoBWCjAldrwDnCVKI9QK2oAThr5", "6volBaa2rN43J7VxTNDfeECqhrMfRzho", "mjIk3s9ZgepLEFBTZf2kDHtQWBPBKtqB", "CXgr6PN5OiOE5PNPA1AaLgjy3tzHi00L"};
                            public final C1084Mk A00;

                            public static String A01(int i5, int i11, int i12) {
                                byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
                                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 30);
                                }
                                return new String(bArrCopyOfRange);
                            }

                            public static void A02() {
                                A01 = new byte[]{-79, -42, -53, -41, -43, -40, -44, -51, -36, -51, -120, -75, -40, -100, -65, -51, -54, -34, -36, -36, -120, -68, -41, -40, -120, -76, -51, -34, -51, -44, -120, -54, -41, -32, -120, -48, -51, -55, -52, -51, -38, -120, -50, -41, -35, -42, -52, -106, -53, -16, -27, -15, -17, -14, -18, -25, -10, -25, -94, -8, -10, -10, -94, -27, -9, -25, -94, -28, -15, -6, -94, -22, -25, -29, -26, -25, -12, -94, -24, -15, -9, -16, -26, -80, -96, -61, -121, -86, -72, -75, -55, -57, -57, -105, -72, -74, -62, -73, -72, -59};
                            }

                            static {
                                A02();
                            }

                            {
                                A01(84, 16, 53);
                                this.A00 = new C1084Mk();
                            }

                            public static C1251Th A00(C1084Mk c1084Mk, int i5) throws C1135Oj {
                                C1052Ld c1052LdA08 = null;
                                CharSequence charSequenceA01 = null;
                                while (i5 > 0) {
                                    if (i5 >= 8) {
                                        int iA0C = c1084Mk.A0C();
                                        int iA0C2 = c1084Mk.A0C();
                                        int boxSize = iA0C - 8;
                                        String boxPayload = N1.A0r(c1084Mk.A0l(), c1084Mk.A09(), boxSize);
                                        c1084Mk.A0g(boxSize);
                                        i5 = (i5 - 8) - boxSize;
                                        if (iA0C2 == 1937011815) {
                                            c1052LdA08 = AbstractC1572cZ.A08(boxPayload);
                                        } else {
                                            if (A02[2].length() != 31) {
                                                throw new RuntimeException();
                                            }
                                            A02[4] = "YquTnVnq4Dti6RPquF2vG2WgObuH9hxq";
                                            if (iA0C2 == 1885436268) {
                                                String strTrim = boxPayload.trim();
                                                List listEmptyList = Collections.emptyList();
                                                String[] strArr = A02;
                                                if (strArr[6].charAt(24) != strArr[7].charAt(24)) {
                                                    A02[4] = "10dvpXEAewHmzGu21u7WoYUOoiuX3xy2";
                                                    charSequenceA01 = AbstractC1572cZ.A07(null, strTrim, listEmptyList);
                                                } else {
                                                    A02[0] = "j8fjVcciPmm4fGWSGJhTDqoRISMd2XgS";
                                                    charSequenceA01 = AbstractC1572cZ.A07(null, strTrim, listEmptyList);
                                                }
                                            }
                                        }
                                    } else {
                                        throw new C1135Oj(A01(48, 36, 100));
                                    }
                                }
                                if (charSequenceA01 == null) {
                                    charSequenceA01 = A01(0, 0, 60);
                                }
                                if (c1052LdA08 != null) {
                                    C1052Ld cueBuilder = c1052LdA08.A0G(charSequenceA01);
                                    return cueBuilder.A0H();
                                }
                                return AbstractC1572cZ.A09(charSequenceA01);
                            }

                            @Override // com.facebook.ads.redexgen.X.C8C
                            public final InterfaceC1506bV A0g(byte[] bArr, int i5, boolean z11) throws C1135Oj {
                                this.A00.A0j(bArr, i5);
                                ArrayList arrayList = new ArrayList();
                                while (this.A00.A07() > 0) {
                                    if (this.A00.A07() >= 8) {
                                        int boxType = this.A00.A0C();
                                        int boxSize = this.A00.A0C();
                                        if (boxSize == 1987343459) {
                                            arrayList.add(A00(this.A00, boxType - 8));
                                        } else {
                                            C1084Mk c1084Mk = this.A00;
                                            int i11 = boxType - 8;
                                            int boxSize2 = A02[0].charAt(15);
                                            if (boxSize2 != 83) {
                                                throw new RuntimeException();
                                            }
                                            A02[2] = "GKrRm3LJBxgEObb0KOgy3tLddm7uZ1k";
                                            c1084Mk.A0g(i11);
                                        }
                                    } else {
                                        throw new C1135Oj(A01(0, 48, 74));
                                    }
                                }
                                return new OT(arrayList);
                            }
                        };
                    case 3:
                        return new C8C() { // from class: com.facebook.ads.redexgen.X.40
                            public static byte[] A01;
                            public static String[] A02 = {"Hb0oD6d2hGz8N6b0bBhwCbPu83tqp5OL", "glmYgAqOXq7mJQ5l29beRVWSoZZVHHDx", "7uSJ0aqkklEjd7", "CLDvcAkxp5ooPVD6wk7XI2a8SnWOM9DL", "K4mMehV56TmlTmPDWXJZOvVE5C1aV2k2", "sySaB2b8nqwnFYuyJzJUaC0UEjiMFtOv", "NK4puuocgnPQZZoAtQ43VdAFTEF", "Atuoeav4R601XGSm72WoSp1KDOvFrnhl"};
                            public static final Pattern A03;
                            public static final Pattern A04;
                            public static final C1542c5 A05;
                            public static final C1543c6 A06;
                            public static final Pattern A07;
                            public static final Pattern A08;
                            public static final Pattern A09;
                            public static final Pattern A0A;
                            public static final Pattern A0B;
                            public final XmlPullParserFactory A00;

                            /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
                            /* JADX WARN: Failed to parse debug info
                            java.lang.ArrayIndexOutOfBoundsException
                             */
                            /* JADX WARN: Removed duplicated region for block: B:21:0x00af  */
                            /* JADX WARN: Removed duplicated region for block: B:48:0x014d  */
                            /*
                                Code decompiled incorrectly, please refer to instructions dump.
                            */
                            public static long A01(String str2, C1543c6 c1543c6) throws C1135Oj, NumberFormatException {
                                Matcher matcher = A08.matcher(str2);
                                char c12 = 5;
                                if (matcher.matches()) {
                                    double d5 = (Long.parseLong((String) AbstractC1062Ln.A01(matcher.group(1))) * k.f40328b) + (Long.parseLong((String) AbstractC1062Ln.A01(matcher.group(2))) * 60) + Long.parseLong((String) AbstractC1062Ln.A01(matcher.group(3)));
                                    String strGroup = matcher.group(4);
                                    return (long) (1000000.0d * (d5 + (strGroup != null ? Double.parseDouble(strGroup) : 0.0d) + (matcher.group(5) != null ? Long.parseLong(r0) / c1543c6.A00 : 0.0d) + (matcher.group(6) != null ? (Long.parseLong(r0) / c1543c6.A01) / c1543c6.A00 : 0.0d)));
                                }
                                Matcher matcher2 = A0A.matcher(str2);
                                if (!matcher2.matches()) {
                                    throw new C1135Oj(A0A(708, 27, 95) + str2);
                                }
                                double d11 = Double.parseDouble((String) AbstractC1062Ln.A01(matcher2.group(1)));
                                String str3 = (String) AbstractC1062Ln.A01(matcher2.group(2));
                                switch (str3.hashCode()) {
                                    case 102:
                                        if (!str3.equals(A0A(1361, 1, 36))) {
                                            c12 = 65535;
                                            break;
                                        } else {
                                            c12 = 4;
                                            break;
                                        }
                                    case 104:
                                        if (A02[2].length() == 14) {
                                            A02[6] = "NTv5CnEcOEKuo27YoCL7GX9";
                                            if (str3.equals(A0A(1467, 1, 89))) {
                                            }
                                        } else if (str3.equals(A0A(1467, 1, 89))) {
                                            c12 = 0;
                                            break;
                                        }
                                        break;
                                    case 109:
                                        if (str3.equals(A0A(1552, 1, 89))) {
                                            c12 = 1;
                                            break;
                                        }
                                        break;
                                    case 115:
                                        if (str3.equals(A0A(1640, 1, 3))) {
                                            c12 = 2;
                                            break;
                                        }
                                        break;
                                    case GZIP_ENCODE_ERROR_VALUE:
                                        if (!str3.equals(A0A(1679, 1, 21))) {
                                        }
                                        break;
                                    case 3494:
                                        if (str3.equals(A0A(1561, 2, 25))) {
                                            c12 = 3;
                                            break;
                                        }
                                        break;
                                }
                                switch (c12) {
                                    case 0:
                                        d11 *= 3600.0d;
                                        break;
                                    case 1:
                                        d11 *= 60.0d;
                                        break;
                                    case 3:
                                        d11 /= 1000.0d;
                                        break;
                                    case 4:
                                        double d12 = c1543c6.A00;
                                        if (A02[6].length() == 4) {
                                            throw new RuntimeException();
                                        }
                                        String[] strArr = A02;
                                        strArr[4] = "R599Ypd0gXL5S9jfhCJlXlJyfZ11Rwcz";
                                        strArr[5] = "djHX7kon8t8CWr2R8WJ39DQ5W3xp2TYq";
                                        d11 /= d12;
                                        break;
                                    case 5:
                                        d11 /= c1543c6.A02;
                                        break;
                                }
                                return (long) (1000000.0d * d11);
                            }

                            /* JADX WARN: Failed to parse debug info
                            java.lang.ArrayIndexOutOfBoundsException
                             */
                            public static C1542c5 A03(XmlPullParser xmlPullParser, C1542c5 c1542c5) throws C1135Oj, NumberFormatException {
                                String attributeValue = xmlPullParser.getAttributeValue(A0A(1472, 35, 7), A0A(1285, 14, 58));
                                if (attributeValue == null) {
                                    return c1542c5;
                                }
                                Matcher matcher = A07.matcher(attributeValue);
                                boolean zMatches = matcher.matches();
                                String strA0A = A0A(166, 36, 39);
                                String strA0A2 = A0A(892, 11, 82);
                                if (!zMatches) {
                                    MV.A07(strA0A2, strA0A + attributeValue);
                                    return c1542c5;
                                }
                                try {
                                    int i5 = Integer.parseInt((String) AbstractC1062Ln.A01(matcher.group(1)));
                                    int i11 = Integer.parseInt((String) AbstractC1062Ln.A01(matcher.group(2)));
                                    if (i5 == 0 || i11 == 0) {
                                        throw new C1135Oj(A0A(557, 24, 40) + i5 + A0A(0, 1, 57) + i11);
                                    }
                                    return new C1542c5(i5, i11);
                                } catch (NumberFormatException unused) {
                                    MV.A07(strA0A2, strA0A + attributeValue);
                                    return c1542c5;
                                }
                            }

                            /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
                            /* JADX WARN: Failed to parse debug info
                            java.lang.ArrayIndexOutOfBoundsException
                             */
                            /* JADX WARN: Removed duplicated region for block: B:10:0x0042  */
                            /* JADX WARN: Removed duplicated region for block: B:13:0x0055  */
                            /* JADX WARN: Removed duplicated region for block: B:16:0x0060  */
                            /* JADX WARN: Removed duplicated region for block: B:19:0x006a  */
                            /* JADX WARN: Removed duplicated region for block: B:20:0x006f  */
                            /* JADX WARN: Removed duplicated region for block: B:35:0x00d5  */
                            /* JADX WARN: Removed duplicated region for block: B:6:0x0039  */
                            /* JADX WARN: Removed duplicated region for block: B:70:0x003f A[SYNTHETIC] */
                            /*
                                Code decompiled incorrectly, please refer to instructions dump.
                            */
                            public static C1545c8 A06(XmlPullParser xmlPullParser, C1545c8 c1545c8, Map<String, C1546c9> map, C1543c6 c1543c6) throws C1135Oj, NumberFormatException {
                                char c12;
                                long jA01 = -9223372036854775807L;
                                long jA012 = -9223372036854775807L;
                                long jA013 = -9223372036854775807L;
                                String strA0A = A0A(0, 0, 34);
                                String strSubstring = null;
                                String[] strArr = null;
                                int attributeCount = xmlPullParser.getAttributeCount();
                                C1552cF c1552cFA09 = A09(xmlPullParser, null);
                                for (int i5 = 0; i5 < attributeCount; i5++) {
                                    String attributeName = xmlPullParser.getAttributeName(i5);
                                    String attributeValue = xmlPullParser.getAttributeValue(i5);
                                    switch (attributeName.hashCode()) {
                                        case -934795532:
                                            c12 = attributeName.equals(A0A(1613, 6, 106)) ? (char) 4 : (char) 65535;
                                            switch (c12) {
                                                case 0:
                                                    jA012 = A01(attributeValue, c1543c6);
                                                    break;
                                                case 1:
                                                    jA013 = A01(attributeValue, c1543c6);
                                                    break;
                                                case 2:
                                                    jA01 = A01(attributeValue, c1543c6);
                                                    if (A02[2].length() != 14) {
                                                        throw new RuntimeException();
                                                    }
                                                    A02[6] = "idu7VILTlStWH4B";
                                                    break;
                                                case 3:
                                                    String[] strArrA0G = A0G(attributeValue);
                                                    if (strArrA0G.length > 0) {
                                                        strArr = strArrA0G;
                                                        break;
                                                    } else {
                                                        break;
                                                    }
                                                case 4:
                                                    if (map.containsKey(attributeValue)) {
                                                        strA0A = attributeValue;
                                                        break;
                                                    } else {
                                                        break;
                                                    }
                                                case 5:
                                                    if (attributeValue.startsWith(A0A(1, 1, 14))) {
                                                        strSubstring = attributeValue.substring(1);
                                                        break;
                                                    } else {
                                                        break;
                                                    }
                                            }
                                            break;
                                        case 99841:
                                            if (attributeName.equals(A0A(1347, 3, 110))) {
                                                c12 = 2;
                                            }
                                            switch (c12) {
                                            }
                                            break;
                                        case 100571:
                                            String[] strArr2 = A02;
                                            if (strArr2[1].charAt(9) == strArr2[3].charAt(9)) {
                                                throw new RuntimeException();
                                            }
                                            A02[2] = "T6LlqUEW3MXc0H";
                                            if (attributeName.equals(A0A(1352, 3, 90))) {
                                                c12 = 1;
                                            }
                                            switch (c12) {
                                            }
                                            break;
                                        case 93616297:
                                            if (attributeName.equals(A0A(1270, 5, 15))) {
                                                c12 = 0;
                                            }
                                            switch (c12) {
                                            }
                                            break;
                                        case 109780401:
                                            if (attributeName.equals(A0A(1655, 5, 100))) {
                                                c12 = 3;
                                            }
                                            switch (c12) {
                                            }
                                            break;
                                        case 1292595405:
                                            if (attributeName.equals(A0A(1232, 15, 69))) {
                                                c12 = 5;
                                            }
                                            switch (c12) {
                                            }
                                            break;
                                    }
                                }
                                if (c1545c8 != null && c1545c8.A02 != -9223372036854775807L) {
                                    if (jA012 != -9223372036854775807L) {
                                        jA012 += c1545c8.A02;
                                    }
                                    if (jA013 != -9223372036854775807L) {
                                        jA013 += c1545c8.A02;
                                    }
                                }
                                if (jA013 == -9223372036854775807L) {
                                    if (jA01 != -9223372036854775807L) {
                                        jA013 = jA012 + jA01;
                                    } else if (c1545c8 != null && c1545c8.A01 != -9223372036854775807L) {
                                        jA013 = c1545c8.A01;
                                    }
                                }
                                return C1545c8.A02(xmlPullParser.getName(), jA012, jA013, c1552cFA09, strArr, strA0A, strSubstring, c1545c8);
                            }

                            public static String A0A(int i5, int i11, int i12) {
                                byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
                                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                                    int i14 = bArrCopyOfRange[i13] - i12;
                                    String[] strArr = A02;
                                    if (strArr[7].charAt(10) == strArr[0].charAt(10)) {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr2 = A02;
                                    strArr2[1] = "fPT8rcnhViZ1J9hO02JFMOKk4uxCCk4U";
                                    strArr2[3] = "TNsloISjZ5is3j5VOUXKMUppGEk5U08h";
                                    bArrCopyOfRange[i13] = (byte) (i14 - 5);
                                }
                                return new String(bArrCopyOfRange);
                            }

                            /* JADX WARN: Failed to parse debug info
                            java.lang.ArrayIndexOutOfBoundsException
                             */
                            public static Map<String, C1552cF> A0B(XmlPullParser xmlPullParser, Map<String, C1552cF> map, C1542c5 c1542c5, C1544c7 c1544c7, Map<String, C1546c9> map2, Map<String, String> map3) throws XmlPullParserException, IOException, NumberFormatException {
                                do {
                                    xmlPullParser.next();
                                    String[] strArr = A02;
                                    if (strArr[4].charAt(18) != strArr[5].charAt(18)) {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr2 = A02;
                                    strArr2[4] = "D6d435JLCZi7HSPm6dJ87GWhzG5FXdUn";
                                    strArr2[5] = "MyhmfLgGrzGntDosjXJxy2iQ3Nyu1mX4";
                                    String strA0A = A0A(1655, 5, 100);
                                    if (N7.A04(xmlPullParser, strA0A)) {
                                        String strA00 = N7.A00(xmlPullParser, strA0A);
                                        C1552cF c1552cFA09 = A09(xmlPullParser, new C1552cF());
                                        if (strA00 != null) {
                                            String[] strArrA0G = A0G(strA00);
                                            for (String str2 : strArrA0G) {
                                                c1552cFA09.A0O(map.get(str2));
                                            }
                                        }
                                        String strA0X = c1552cFA09.A0X();
                                        if (strA0X != null) {
                                            map.put(strA0X, c1552cFA09);
                                        }
                                    } else if (N7.A04(xmlPullParser, A0A(1613, 6, 106))) {
                                        C1546c9 c1546c9A07 = A07(xmlPullParser, c1542c5, c1544c7);
                                        if (c1546c9A07 != null) {
                                            map2.put(c1546c9A07.A09, c1546c9A07);
                                        }
                                    } else if (N7.A04(xmlPullParser, A0A(1553, 8, 120))) {
                                        A0E(xmlPullParser, map3);
                                    }
                                } while (!N7.A03(xmlPullParser, A0A(1468, 4, 35)));
                                return map;
                            }

                            public static void A0C() {
                                A01 = new byte[]{94, 54, 75, 45, 52, 108, -89, -45, -39, -48, -56, -46, -117, -40, -124, -57, -42, -55, -59, -40, -55, -124, -68, -47, -48, -76, -39, -48, -48, -76, -59, -42, -41, -55, -42, -86, -59, -57, -40, -45, -42, -35, -124, -51, -46, -41, -40, -59, -46, -57, -55, -77, -50, -42, -39, -46, -47, -115, -35, -50, -33, -32, -42, -37, -44, -115, -49, -50, -48, -40, -44, -33, -36, -30, -37, -47, -115, -29, -50, -39, -30, -46, -89, -115, 118, -111, -103, -100, -107, -108, 80, -96, -111, -94, -93, -103, -98, -105, 80, -109, -97, -100, -97, -94, 80, -90, -111, -100, -91, -107, 106, 80, -76, -49, -41, -38, -45, -46, -114, -34, -49, -32, -31, -41, -36, -43, -114, -44, -35, -36, -30, -63, -41, -24, -45, -114, -28, -49, -38, -29, -45, -88, -114, -80, -53, -45, -42, -49, -50, -118, -34, -39, -118, -38, -53, -36, -35, -49, -118, -35, -46, -49, -53, -36, -92, -118, 117, -109, -102, -101, -98, -107, -102, -109, 76, -103, -115, -104, -110, -101, -98, -103, -111, -112, 76, -113, -111, -104, -104, 76, -98, -111, -97, -101, -104, -95, -96, -107, -101, -102, 102, 76, -87, -57, -50, -49, -46, -55, -50, -57, -128, -51, -63, -52, -58, -49, -46, -51, -59, -60, -128, -44, -44, -45, -128, -59, -40, -44, -59, -50, -44, -102, -128, -97, -67, -60, -59, -56, -65, -60, -67, 118, -60, -59, -60, -125, -58, -65, -50, -69, -62, 118, -54, -54, -55, 118, -69, -50, -54, -69, -60, -54, -112, 118, -104, -74, -67, -66, -63, -72, -67, -74, 111, -63, -76, -74, -72, -66, -67, 111, -58, -72, -61, -73, 111, -68, -80, -69, -75, -66, -63, -68, -76, -77, 111, -76, -57, -61, -76, -67, -61, -119, 111, 118, -108, -101, -100, -97, -106, -101, -108, 77, -97, -110, -108, -106, -100, -101, 77, -92, -106, -95, -107, 77, -102, -114, -103, -109, -100, -97, -102, -110, -111, 77, -100, -97, -106, -108, -106, -101, 103, 77, 96, 126, -123, -122, -119, -128, -123, 126, 55, -119, 124, 126, -128, -122, -123, 55, -114, -128, -117, AbstractJsonLexerKt.TC_INVALID, 55, -124, -128, -118, -118, -128, -123, 126, 55, -117, -117, -118, 81, 124, -113, -117, 124, -123, -117, 81, 55, -115, -85, -78, -77, -74, -83, -78, -85, 100, -74, -87, -85, -83, -77, -78, 100, -69, -83, -72, -84, 100, -71, -78, -73, -71, -76, -76, -77, -74, -72, -87, -88, 100, -87, -68, -72, -87, -78, -72, 126, 100, 96, 126, -123, -122, -119, -128, -123, 126, 55, -119, 124, 126, -128, -122, -123, 55, -114, -128, -117, AbstractJsonLexerKt.TC_INVALID, 55, -116, -123, -118, -116, -121, -121, -122, -119, -117, 124, 123, 55, -122, -119, -128, 126, -128, -123, 81, 55, 93, 123, -126, -125, -122, 125, -126, 123, 52, -122, 121, 123, 125, -125, -126, 52, -117, 125, -120, 124, -125, -119, -120, 52, 117, -126, 52, 121, -116, -120, 121, -126, -120, -63, -33, -26, -25, -22, -31, -26, -33, -104, -22, -35, -33, -31, -25, -26, -104, -17, -31, -20, -32, -25, -19, -20, -104, -39, -26, -104, -25, -22, -31, -33, -31, -26, -120, -90, -83, -82, -79, -88, -83, -90, 95, -76, -83, -78, -76, -81, -81, -82, -79, -77, -92, -93, 95, -77, -96, -90, 121, 95, 118, -101, -93, -114, -103, -106, -111, 77, -112, -110, -103, -103, 77, -97, -110, -96, -100, -103, -94, -95, -106, -100, -101, 77, 78, 115, 123, 102, 113, 110, 105, 37, 106, 125, 117, 119, 106, 120, 120, 110, 116, 115, 37, 107, 116, 119, 37, 107, 116, 115, 121, 88, 110, AbstractJsonLexerKt.TC_INVALID, 106, 63, 37, 44, -104, -67, -59, -80, -69, -72, -77, 111, -67, -60, -68, -79, -76, -63, 111, -66, -75, 111, -76, -67, -61, -63, -72, -76, -62, 111, -75, -66, -63, 111, -75, -66, -67, -61, -94, -72, -55, -76, -119, 111, -69, -32, -24, -45, -34, -37, -42, -110, -25, -32, -37, -26, -110, -40, -31, -28, -110, -40, -31, -32, -26, -59, -37, -20, -41, -84, -110, -103, -83, -46, -38, -59, -48, -51, -56, -124, -38, -59, -48, -39, -55, -124, -54, -45, -42, -124, -41, -52, -55, -59, -42, -98, -124, -79, -59, -48, -54, -45, -42, -47, -55, -56, -124, -40, -51, -47, -55, -124, -55, -36, -44, -42, -55, -41, -41, -51, -45, -46, -98, -124, -76, -36, -45, -37, -48, -41, -45, -52, -121, -35, -56, -45, -36, -52, -38, -121, -48, -43, -121, -51, -42, -43, -37, -70, -48, -31, -52, -121, -56, -37, -37, -39, -48, -55, -36, -37, -52, -107, -121, -73, -48, -54, -46, -48, -43, -50, -121, -37, -49, -52, -121, -38, -52, -54, -42, -43, -53, -121, -35, -56, -45, -36, -52, -121, -51, -42, -39, -121, -35, -52, -39, -37, -48, -54, -56, -45, -121, -51, -42, -43, -37, -121, -38, -48, -31, -52, -121, -56, -43, -53, -121, -48, -50, -43, -42, -39, -48, -43, -50, -121, -37, -49, -52, -121, -51, -48, -39, -38, -37, -107, 112, -111, 66, 118, 118, 111, 110, 66, -107, -105, -124, -106, -117, -106, -114, -121, -107, 66, -120, -111, -105, -112, -122, -75, -41, -46, -46, -44, -57, -43, -43, -53, -48, -55, -126, -46, -61, -44, -43, -57, -44, -126, -57, -44, -44, -47, -44, -85, -53, -60, -61, -101, -68, -70, -58, -69, -68, -55, 104, -127, 116, 117, AbstractJsonLexerKt.TC_INVALID, 120, 51, -121, -126, 51, 119, 120, 118, -126, 119, 120, 51, -122, -126, -120, -123, 118, 120, 110, -121, 126, -111, -119, 126, 124, -115, 126, 125, 57, 126, -117, -117, -120, -117, 57, -112, -127, 126, -121, 57, -117, 126, 122, 125, -126, -121, -128, 57, -126, -121, -119, -114, -115, 71, -45, -22, -94, -40, -94, -94, -43, -86, -89, -77, -41, -92, -88, -93, -71, -43, -86, -89, -77, -41, -91, -93, -94, -22, -14, -10, -33, -25, -10, -97, -93, -98, -54, -108, -57, -103, -105, -55, 
                                -85, -56, -48, -105, -56, -102, -85, -56, -48, -106, -85, -107, -111, -112, -73, -127, -76, -119, -122, -110, -74, -124, -127, -104, -109, -75, -121, -76, -119, -122, -110, -74, -124, -126, -104, -126, -127, -63, -43, -58, -43, -52, -43, -58, -52, -43, -65, -43, -51, -126, 125, -82, 120, -85, -128, 125, -119, -83, -85, -128, 125, -119, -83, 123, 121, -118, 120, -85, -128, 125, -119, -83, -85, -128, 125, -119, -83, 121, -118, 120, -85, -128, 125, -119, -83, -85, -128, 125, -119, -83, 121, 120, -113, -118, 120, -84, 126, -85, -128, 125, -119, -83, 123, 121, -52, -118, 120, -85, -128, 125, -119, -83, -85, -128, 125, -119, -83, 121, 120, -113, -118, -84, 126, 120, -85, -128, 125, -119, -83, 123, 121, 121, -113, 121, -113, 116, -39, -93, -41, -33, -90, -92, -101, -93, -41, -33, -90, -92, -97, 109, 55, 107, 115, 58, 107, 61, 78, 107, 115, 57, 78, 56, 52, 47, 55, 107, 115, 58, 107, 61, 78, 107, 115, 57, 78, 56, 52, 51, -101, 101, -103, -95, 104, -103, 107, 124, -103, -95, 103, 124, 102, -83, -75, 93, 101, -103, -95, 104, -103, 107, 124, -103, -95, 103, 124, 102, -83, -75, 97, 114, 119, -123, 118, -125, -39, -28, -28, 105, 104, 106, 114, 110, 121, 118, 124, 117, 107, 74, 118, 115, 118, 121, -84, -85, -83, -75, -79, -68, -71, -65, -72, -82, -109, -73, -85, -79, -81, -120, -121, -103, -117, -95, -96, -78, -92, -126, -82, -83, -77, -96, -88, -83, -92, -79, -53, -50, -49, -40, -37, -50, 118, 121, 123, 125, -126, 108, 121, 110, -125, -87, -74, -77, -85, -49, -33, -94, -92, -85, -85, -111, -92, -78, -82, -85, -76, -77, -88, -82, -83, -47, -45, -36, -30, -45, -32, 106, 118, 115, 118, 121, -111, -99, -100, -94, -113, -105, -100, -109, -96, -123, -126, -107, -126, -100, -99, -92, -95, -91, -95, -84, -99, -86, -32, -27, -17, -20, -24, -35, -11, -67, -24, -27, -29, -22, -120, -115, -102, -41, -24, -27, -49, -41, -60, -51, -61, -52, -33, -37, -52, -43, -37, -113, -73, -64, -65, -59, -105, -78, -66, -70, -67, -54, 108, 117, 116, 122, 89, 111, -128, 107, -45, -36, -37, -31, -64, -31, -26, -39, -46, -121, -112, -113, -107, 120, -122, -118, -120, -119, -107, 121, -123, 116, -128, 120, 101, 116, -121, 120, -68, -56, -73, -61, -69, -88, -73, -54, -69, -93, -53, -62, -54, -65, -58, -62, -65, -69, -56, 111, 123, 106, 118, 110, 91, 106, 125, 110, 86, 126, 117, 125, 114, 121, 117, 114, 110, 123, 41, 109, 120, 110, 124, 119, 48, 125, 41, 113, 106, AbstractJsonLexerKt.TC_INVALID, 110, 41, 59, 41, 121, 106, 123, 125, 124, -58, -112, -115, -119, -116, 116, -128, -128, 124, 70, 59, 59, -125, -125, -125, 58, -125, 63, 58, 123, 126, 115, 59, 122, AbstractJsonLexerKt.TC_INVALID, 59, -128, -128, 121, 120, 47, 124, 109, 126, 109, 121, 113, -128, 113, 126, AbstractJsonLexerKt.TC_INVALID, 122, -99, -95, -107, -101, -103, 123, -128, 120, -127, -124, AbstractJsonLexerKt.TC_INVALID, 115, -122, 123, -127, -128, -70, -59, -78, -67, -70, -76, 113, 102, 126, 116, 122, 121, -67, -74, -73, -59, -120, -123, -118, -127, -112, -124, -114, -117, -111, -125, -124, -53, -22, -30, -15, -34, -31, -34, -15, -34, -117, -111, -64, -56, -65, -57, -68, -91, -62, -54, -108, -65, -68, -70, -63, -88, -87, -90, -93, -88, -97, -82, -94, -84, -87, -81, -95, -94, -24, -23, -24, -33, -123, -122, -116, -123, 123, 124, -119, -125, -128, -123, 124, 123, 126, 117, 115, 117, 122, -25, -32, -24, -31, -44, -42, -40, -34, -35, -126, 121, 119, 120, -124, -88, -85, -104, -81, -93, -90, -109, -86, -127, -96, -92, -102, -91, -102, -96, -97, 123, -9, -20, -23, -27, -10, -49, -52, -67, -54, -39, -38, -57, -40, -38, -36, -35, -30, -43, -50, -65, -64, -59, -72, -75, -70, -77, -49, -47, -66, -94, -50, -67, -55, -63, -82, -67, -48, -63, -114, -27, -45, -85, -103, -93, -87, -67, -85, -69, -75, -69, -84, -65, -69, -120, 121, -116, -120, 85, -128, 125, 123, -126, -35, -50, -31, -35, -84, -40, -42, -53, -46, -41, -50, -95, -110, -91, -95, 112, -100, -101, -95, -114, -106, -101, -110, -97, -81, -96, -77, -81, AbstractJsonLexerKt.TC_INVALID, -96, -98, -86, -83, -100, -81, -92, -86, -87, -124, 117, -120, -124, 85, 125, -128, 120, 113, -125, 121, -125, -37, -48, -54, -46, -71, -56, -37, -52, 126, 126, -116, -123, 123, 124, -119, -125, -128, -123, 124, -54, -59, -68, -57, -68, -63, -70, -96, -62, -73, -72};
                            }

                            /* JADX WARN: Code restructure failed: missing block: B:15:0x008a, code lost:
                            
                                if (r12 == 0) goto L19;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:18:0x009a, code lost:
                            
                                if (r12 == 0) goto L19;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:19:0x009c, code lost:
                            
                                r9 = r13.getName();
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:20:0x00a0, code lost:
                            
                                r1 = A0A(1761, 2, 5);
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:21:0x00a8, code lost:
                            
                                if (r10 != r11) goto L32;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:23:0x00ae, code lost:
                            
                                if (r1.equals(r9) == false) goto L28;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:24:0x00b0, code lost:
                            
                                r3 = A04(r13);
                                r15 = A03(r13, com.facebook.ads.redexgen.X.AnonymousClass40.A05);
                                r16 = A05(r13);
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:26:0x00c8, code lost:
                            
                                if (com.facebook.ads.redexgen.X.AnonymousClass40.A02[6].length() == 4) goto L74;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:27:0x00ca, code lost:
                            
                                r2 = com.facebook.ads.redexgen.X.AnonymousClass40.A02;
                                r2[1] = "1ZGm7YUCkaYScxmoQAMNyYCLrVLgyAJ1";
                                r2[3] = "4pr2z9VPFXXzi3syhegggi8UN1FRCKvW";
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:28:0x00d6, code lost:
                            
                                r10 = A0F(r9);
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:29:0x00da, code lost:
                            
                                r1 = A0A(892, 11, 82);
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:30:0x00e4, code lost:
                            
                                if (r10 != false) goto L50;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:31:0x00e6, code lost:
                            
                                com.facebook.ads.redexgen.X.MV.A06(r1, A0A(531, 26, 58) + r13.getName());
                                r12 = r12 + 1;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:33:0x010c, code lost:
                            
                                if (r10 != 4) goto L35;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:34:0x010e, code lost:
                            
                                ((com.facebook.ads.redexgen.X.C1545c8) com.facebook.ads.redexgen.X.AbstractC1062Ln.A01(r8)).A0F(com.facebook.ads.redexgen.X.C1545c8.A01(r13.getText()));
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:36:0x0121, code lost:
                            
                                if (r10 != 3) goto L79;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:38:0x012b, code lost:
                            
                                if (r13.getName().equals(r1) == false) goto L40;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:39:0x012d, code lost:
                            
                                r5 = new com.facebook.ads.redexgen.X.OV((com.facebook.ads.redexgen.X.C1545c8) com.facebook.ads.redexgen.X.AbstractC1062Ln.A01((com.facebook.ads.redexgen.X.C1545c8) r4.peek()), r14, r7, r6);
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:40:0x013e, code lost:
                            
                                r4.pop();
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:42:0x014d, code lost:
                            
                                if (com.facebook.ads.redexgen.X.AnonymousClass40.A02[2].length() == 14) goto L44;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:44:0x0151, code lost:
                            
                                com.facebook.ads.redexgen.X.AnonymousClass40.A02[2] = "HklMzQs2tDzjJB";
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:45:0x0158, code lost:
                            
                                if (r10 != r11) goto L47;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:46:0x015a, code lost:
                            
                                r12 = r12 + 1;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:48:0x015e, code lost:
                            
                                if (r10 != 3) goto L82;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:49:0x0160, code lost:
                            
                                r12 = r12 - 1;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:51:0x0170, code lost:
                            
                                if (A0A(1468, 4, 35).equals(r9) == false) goto L69;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:52:0x0172, code lost:
                            
                                A0B(r13, r14, r15, r16, r7, r6);
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:54:0x0182, code lost:
                            
                                r0 = A06(r13, r8, r7, r3);
                                r4.push(r0);
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:55:0x0189, code lost:
                            
                                if (r8 == null) goto L84;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:56:0x018b, code lost:
                            
                                r8.A0F(r0);
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:57:0x018f, code lost:
                            
                                r9 = move-exception;
                             */
                            /* JADX WARN: Code restructure failed: missing block: B:58:0x0190, code lost:
                            
                                com.facebook.ads.redexgen.X.MV.A0A(r1, A0A(868, 24, 93), r9);
                                r12 = r12 + 1;
                             */
                            /* JADX WARN: Failed to parse debug info
                            java.lang.ArrayIndexOutOfBoundsException
                             */
                            @Override // com.facebook.ads.redexgen.X.C8C
                            /*
                                Code decompiled incorrectly, please refer to instructions dump.
                            */
                            public final InterfaceC1506bV A0g(byte[] bArr, int i5, boolean z11) throws XmlPullParserException, C1135Oj, IOException, NumberFormatException {
                                int i11;
                                String strA0A = A0A(0, 0, 34);
                                try {
                                    XmlPullParser xmlPullParserNewPullParser = this.A00.newPullParser();
                                    HashMap map = new HashMap();
                                    HashMap map2 = new HashMap();
                                    HashMap map3 = new HashMap();
                                    map2.put(strA0A, new C1546c9(strA0A));
                                    xmlPullParserNewPullParser.setInput(new ByteArrayInputStream(bArr, 0, i5), null);
                                    OV ov2 = null;
                                    ArrayDeque arrayDeque = new ArrayDeque();
                                    int i12 = 0;
                                    int eventType = xmlPullParserNewPullParser.getEventType();
                                    C1543c6 c1543c6A04 = A06;
                                    C1542c5 c1542c5A03 = A05;
                                    C1544c7 c1544c7A05 = null;
                                    if (A02[2].length() == 14) {
                                        String[] strArr = A02;
                                        strArr[1] = "bxsv4xJM5aE9pnNtKSkPazfSSp5rVnYF";
                                        strArr[3] = "rIrnESQOXJ3AbfzO40bGiSve5aw9iib2";
                                        while (eventType != 1) {
                                            C1545c8 c1545c8 = (C1545c8) arrayDeque.peek();
                                            String[] strArr2 = A02;
                                            if (strArr2[4].charAt(18) != strArr2[5].charAt(18)) {
                                                A02[2] = "4k9FAwSJxbkjGu";
                                                i11 = 1;
                                            } else {
                                                String[] strArr3 = A02;
                                                strArr3[4] = "M1POo8Uu97M2nsvff7JlLaEeoiXGFxRn";
                                                strArr3[5] = "WAhO3f0i7Gz2RzbdWaJh3dH3Ad31LURd";
                                                i11 = 2;
                                            }
                                        }
                                        if (ov2 != null) {
                                            return ov2;
                                        }
                                        throw new C1135Oj(A0A(845, 23, 29));
                                    }
                                    throw new RuntimeException();
                                    xmlPullParserNewPullParser.next();
                                    eventType = xmlPullParserNewPullParser.getEventType();
                                } catch (IOException e3) {
                                    throw new IllegalStateException(A0A(926, 36, 20), e3);
                                } catch (XmlPullParserException e11) {
                                    throw new C1135Oj(A0A(903, 23, 14), e11);
                                }
                            }

                            static {
                                A0C();
                                A08 = Pattern.compile(A0A(1051, 85, 75));
                                A0A = Pattern.compile(A0A(1014, 37, 84));
                                A09 = Pattern.compile(A0A(965, 29, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
                                A04 = Pattern.compile(A0A(994, 20, 103));
                                A03 = Pattern.compile(A0A(1149, 29, 10));
                                A0B = Pattern.compile(A0A(1178, 31, 56));
                                A07 = Pattern.compile(A0A(1136, 13, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE));
                                A06 = new C1543c6(30.0f, 1, 1);
                                A05 = new C1542c5(32, 15);
                            }

                            {
                                A0A(892, 11, 82);
                                try {
                                    this.A00 = XmlPullParserFactory.newInstance();
                                    this.A00.setNamespaceAware(true);
                                } catch (XmlPullParserException e3) {
                                    throw new RuntimeException(A0A(6, 45, 95), e3);
                                }
                            }

                            public static float A00(String str2) {
                                Matcher matcher = A04.matcher(str2);
                                boolean zMatches = matcher.matches();
                                String strA0A = A0A(892, 11, 82);
                                if (!zMatches) {
                                    MV.A07(strA0A, A0A(683, 25, 95) + str2);
                                    return Float.MAX_VALUE;
                                }
                                try {
                                    return Math.min(100.0f, Math.max(-100.0f, Float.parseFloat((String) AbstractC1062Ln.A01(matcher.group(1)))));
                                } catch (NumberFormatException e3) {
                                    MV.A0A(strA0A, A0A(143, 23, 101) + str2, e3);
                                    return Float.MAX_VALUE;
                                }
                            }

                            /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
                            /* JADX WARN: Removed duplicated region for block: B:20:0x007a  */
                            /* JADX WARN: Removed duplicated region for block: B:30:0x00b3  */
                            /* JADX WARN: Removed duplicated region for block: B:32:0x00b6  */
                            /* JADX WARN: Removed duplicated region for block: B:34:0x00b9  */
                            /* JADX WARN: Removed duplicated region for block: B:4:0x000b  */
                            /* JADX WARN: Removed duplicated region for block: B:6:0x000f A[RETURN] */
                            /*
                                Code decompiled incorrectly, please refer to instructions dump.
                            */
                            public static Layout.Alignment A02(String str2) {
                                char c12;
                                String strA01 = XC.A01(str2);
                                switch (strA01.hashCode()) {
                                    case -1364013995:
                                        c12 = strA01.equals(A0A(1299, 6, 105)) ? (char) 4 : (char) 65535;
                                        switch (c12) {
                                            case 0:
                                            case 1:
                                                return Layout.Alignment.ALIGN_NORMAL;
                                            case 2:
                                            case 3:
                                                return Layout.Alignment.ALIGN_OPPOSITE;
                                            case 4:
                                                return Layout.Alignment.ALIGN_CENTER;
                                            default:
                                                return null;
                                        }
                                    case 100571:
                                        if (strA01.equals(A0A(1352, 3, 90))) {
                                            c12 = 3;
                                        }
                                        switch (c12) {
                                        }
                                    case 3317767:
                                        if (A02[6].length() != 4) {
                                            String[] strArr = A02;
                                            strArr[7] = "CVIc3QguhGqEPOGNGglLIbu2Eb4dnTDp";
                                            strArr[0] = "XH772ff1W8zGhv9EekUO43pkaqm4vXCm";
                                            if (strA01.equals(A0A(1537, 4, 76))) {
                                                c12 = 0;
                                            }
                                        } else {
                                            A02[2] = "siSD1kKGcAhttp";
                                            if (strA01.equals(A0A(1537, 4, 1))) {
                                            }
                                        }
                                        switch (c12) {
                                        }
                                    case 108511772:
                                        if (strA01.equals(A0A(1619, 5, 11))) {
                                            c12 = 2;
                                        }
                                        switch (c12) {
                                        }
                                    case 109757538:
                                        String[] strArr2 = A02;
                                        if (strArr2[7].charAt(10) != strArr2[0].charAt(10)) {
                                            String[] strArr3 = A02;
                                            strArr3[4] = "6gmBXNTGuagtp6WCINJSftdlatAIaECF";
                                            strArr3[5] = "4H14LcbbOY6HeCYDHrJtzxvFGV8p744E";
                                            if (strA01.equals(A0A(1650, 5, 97))) {
                                                c12 = 1;
                                            }
                                            switch (c12) {
                                            }
                                        } else {
                                            throw new RuntimeException();
                                        }
                                }
                            }

                            public static C1543c6 A04(XmlPullParser xmlPullParser) throws C1135Oj, NumberFormatException {
                                int i5 = 30;
                                String strA0A = A0A(1399, 9, 14);
                                String strA0A2 = A0A(1472, 35, 7);
                                String attributeValue = xmlPullParser.getAttributeValue(strA0A2, strA0A);
                                if (attributeValue != null) {
                                    i5 = Integer.parseInt(attributeValue);
                                }
                                float denominator = 1.0f;
                                String attributeValue2 = xmlPullParser.getAttributeValue(strA0A2, A0A(1408, 19, 81));
                                if (attributeValue2 != null) {
                                    String[] strArrA1O = N1.A1O(attributeValue2, A0A(0, 1, 57));
                                    if (strArrA1O.length == 2) {
                                        int frameRate = Integer.parseInt(strArrA1O[0]);
                                        float denominator2 = frameRate;
                                        int frameRate2 = Integer.parseInt(strArrA1O[1]);
                                        denominator = denominator2 / frameRate2;
                                    } else {
                                        String frameRateString = A0A(1427, 40, 4);
                                        throw new C1135Oj(frameRateString);
                                    }
                                }
                                int i11 = A06.A01;
                                String attributeValue3 = xmlPullParser.getAttributeValue(strA0A2, A0A(1667, 12, 87));
                                if (attributeValue3 != null) {
                                    i11 = Integer.parseInt(attributeValue3);
                                }
                                int subFrameRate = A06.A02;
                                String[] strArr = A02;
                                String frameRateString2 = strArr[1];
                                String str2 = strArr[3];
                                int iCharAt = frameRateString2.charAt(9);
                                int frameRate3 = str2.charAt(9);
                                if (iCharAt == frameRate3) {
                                    throw new RuntimeException();
                                }
                                A02[6] = "jzWgjzuVw4Iopxi9lkEbJ1qF2pPcyd";
                                String attributeValue4 = xmlPullParser.getAttributeValue(strA0A2, A0A(1753, 8, 98));
                                if (attributeValue4 != null) {
                                    subFrameRate = Integer.parseInt(attributeValue4);
                                }
                                return new C1543c6(i5 * denominator, i11, subFrameRate);
                            }

                            public static C1544c7 A05(XmlPullParser xmlPullParser) throws NumberFormatException {
                                String strA00 = N7.A00(xmlPullParser, A0A(1355, 6, 98));
                                if (strA00 == null) {
                                    return null;
                                }
                                Matcher matcher = A0B.matcher(strA00);
                                boolean zMatches = matcher.matches();
                                String strA0A = A0A(892, 11, 82);
                                if (!zMatches) {
                                    StringBuilder sb2 = new StringBuilder();
                                    String ttsExtent = A0A(233, 31, 81);
                                    MV.A07(strA0A, sb2.append(ttsExtent).append(strA00).toString());
                                    return null;
                                }
                                try {
                                    String ttsExtent2 = matcher.group(1);
                                    int i5 = Integer.parseInt((String) AbstractC1062Ln.A01(ttsExtent2));
                                    String ttsExtent3 = matcher.group(2);
                                    return new C1544c7(i5, Integer.parseInt((String) AbstractC1062Ln.A01(ttsExtent3)));
                                } catch (NumberFormatException unused) {
                                    StringBuilder sb3 = new StringBuilder();
                                    String ttsExtent4 = A0A(Sdk.SDKError.Reason.AD_CONSUMED_VALUE, 31, 91);
                                    MV.A07(strA0A, sb3.append(ttsExtent4).append(strA00).toString());
                                    return null;
                                }
                            }

                            /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
                            /* JADX WARN: Multi-variable type inference failed */
                            /* JADX WARN: Removed duplicated region for block: B:37:0x0191  */
                            /* JADX WARN: Removed duplicated region for block: B:43:0x01bb  */
                            /* JADX WARN: Removed duplicated region for block: B:47:0x01d1  */
                            /* JADX WARN: Removed duplicated region for block: B:48:0x01d4  */
                            /* JADX WARN: Removed duplicated region for block: B:73:0x0294  */
                            /* JADX WARN: Type inference failed for: r3v1, types: [java.lang.String] */
                            /* JADX WARN: Type inference failed for: r3v3 */
                            /* JADX WARN: Type inference failed for: r8v0, types: [java.lang.String] */
                            /* JADX WARN: Type inference failed for: r8v2 */
                            /*
                                Code decompiled incorrectly, please refer to instructions dump.
                            */
                            public static C1546c9 A07(XmlPullParser xmlPullParser, C1542c5 c1542c5, C1544c7 c1544c7) throws NumberFormatException {
                                float f11;
                                float f12;
                                float f13;
                                float f14;
                                float width;
                                String strA00 = N7.A00(xmlPullParser, A0A(1507, 2, 17));
                                if (strA00 == null) {
                                    return null;
                                }
                                String strA002 = N7.A00(xmlPullParser, A0A(1604, 6, 7));
                                String strA0A = A0A(892, 11, 82);
                                if (strA002 != null) {
                                    Matcher matcher = A03.matcher(strA002);
                                    Matcher matcher2 = A0B.matcher(strA002);
                                    boolean zMatches = matcher.matches();
                                    String strA0A2 = A0A(303, 39, 40);
                                    String strA0A3 = A0A(342, 41, 18);
                                    char c12 = 2;
                                    try {
                                        if (zMatches) {
                                            try {
                                                f11 = Float.parseFloat((String) AbstractC1062Ln.A01(matcher.group(1))) / 100.0f;
                                                f12 = Float.parseFloat((String) AbstractC1062Ln.A01(matcher.group(2))) / 100.0f;
                                            } catch (NumberFormatException unused) {
                                                MV.A07(strA0A, ((String) strA0A2) + strA002);
                                                return null;
                                            }
                                        } else if (matcher2.matches()) {
                                            if (c1544c7 == null) {
                                                MV.A07(strA0A, strA0A3 + strA002);
                                                return null;
                                            }
                                            int i5 = Integer.parseInt((String) AbstractC1062Ln.A01(matcher2.group(1)));
                                            int i11 = Integer.parseInt((String) AbstractC1062Ln.A01(matcher2.group(2)));
                                            int width2 = c1544c7.A01;
                                            f11 = i5 / width2;
                                            int width3 = c1544c7.A00;
                                            f12 = i11 / width3;
                                        } else {
                                            MV.A07(strA0A, A0A(424, 41, 18) + strA002);
                                            return null;
                                        }
                                        strA0A2 = 1355;
                                        String strA003 = N7.A00(xmlPullParser, A0A(1355, 6, 98));
                                        if (strA003 != null) {
                                            Matcher matcher3 = A03.matcher(strA003);
                                            Matcher extentPercentageMatcher = A0B.matcher(strA003);
                                            boolean zMatches2 = matcher3.matches();
                                            String strA0A4 = A0A(264, 39, 74);
                                            try {
                                                if (zMatches2) {
                                                    try {
                                                        f13 = Float.parseFloat((String) AbstractC1062Ln.A01(matcher3.group(1))) / 100.0f;
                                                        f14 = Float.parseFloat((String) AbstractC1062Ln.A01(matcher3.group(2))) / 100.0f;
                                                    } catch (NumberFormatException unused2) {
                                                        MV.A07(strA0A, strA0A4 + strA002);
                                                        return null;
                                                    }
                                                } else if (extentPercentageMatcher.matches()) {
                                                    if (c1544c7 == null) {
                                                        MV.A07(strA0A, strA0A3 + strA002);
                                                        return null;
                                                    }
                                                    int i12 = Integer.parseInt((String) AbstractC1062Ln.A01(extentPercentageMatcher.group(1)));
                                                    int i13 = Integer.parseInt((String) AbstractC1062Ln.A01(extentPercentageMatcher.group(2)));
                                                    int extentWidth = c1544c7.A01;
                                                    f13 = i12 / extentWidth;
                                                    int extentWidth2 = c1544c7.A00;
                                                    f14 = i13 / extentWidth2;
                                                } else {
                                                    MV.A07(strA0A, A0A(383, 41, 63) + strA002);
                                                    return null;
                                                }
                                                int i14 = 0;
                                                strA0A = 1332;
                                                String strA004 = N7.A00(xmlPullParser, A0A(1332, 12, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
                                                if (strA004 != null) {
                                                    String strA01 = XC.A01(strA004);
                                                    float width4 = strA01.hashCode();
                                                    switch (width4) {
                                                        case -8.1307995E-11f:
                                                            String[] strArr = A02;
                                                            if (strArr[4].charAt(18) != strArr[5].charAt(18)) {
                                                                A02[2] = "JWZe38OI3bFI4d";
                                                                if (!strA01.equals(A0A(1299, 1, 81))) {
                                                                    width = Float.NaN;
                                                                    break;
                                                                } else {
                                                                    width = 0.0f;
                                                                    break;
                                                                }
                                                            } else {
                                                                String[] strArr2 = A02;
                                                                strArr2[7] = "yFPajzz8OaAa62J7c8wtT4v6Vf8O3ZX0";
                                                                strArr2[0] = "QncUD5w4HYT7zaF8GzOBD2KMc7Yar5Cn";
                                                                if (strA01.equals(A0A(1299, 6, 105))) {
                                                                }
                                                            }
                                                        case 1.2697491E-35f:
                                                            if (strA01.equals(A0A(1209, 5, 12))) {
                                                                width = Float.MIN_VALUE;
                                                                break;
                                                            }
                                                            break;
                                                    }
                                                    switch (width) {
                                                        case 0.0f:
                                                            i14 = 1;
                                                            String[] strArr3 = A02;
                                                            if (strArr3[4].charAt(18) == strArr3[5].charAt(18)) {
                                                                String[] strArr4 = A02;
                                                                strArr4[1] = "u0zN4xc1SWrgJTBeWYLLYp0Ak8xeh4QN";
                                                                strArr4[3] = "g6R0MiGrpRFJsyd2obMmZCiM3c3IGf6H";
                                                                float width5 = f14 / 2.0f;
                                                                f12 += width5;
                                                                break;
                                                            } else {
                                                                throw new RuntimeException();
                                                            }
                                                        case Float.MIN_VALUE:
                                                            i14 = 2;
                                                            f12 += f14;
                                                            break;
                                                    }
                                                }
                                                float width6 = c1542c5.A01;
                                                float f15 = 1.0f / width6;
                                                int i15 = Integer.MIN_VALUE;
                                                String strA005 = N7.A00(xmlPullParser, A0A(1772, 11, 78));
                                                if (strA005 != null) {
                                                    String strA012 = XC.A01(strA005);
                                                    float width7 = strA012.hashCode();
                                                    switch (width7) {
                                                        case 5.176E-42f:
                                                            c12 = strA012.equals(A0A(1680, 2, 108)) ? (char) 0 : (char) 65535;
                                                            switch (c12) {
                                                                case 0:
                                                                case 1:
                                                                    i15 = 2;
                                                                    break;
                                                                case 2:
                                                                    i15 = 1;
                                                                    break;
                                                            }
                                                        case 4.979368E-39f:
                                                            if (strA012.equals(A0A(1682, 4, 50))) {
                                                                c12 = 1;
                                                            }
                                                            switch (c12) {
                                                            }
                                                        case 4.97962E-39f:
                                                            String[] strArr5 = A02;
                                                            if (strArr5[1].charAt(9) == strArr5[3].charAt(9)) {
                                                                throw new RuntimeException();
                                                            }
                                                            A02[6] = "3Z8MmW2eflwqRpQs";
                                                            if (!strA012.equals(A0A(1686, 4, 68))) {
                                                            }
                                                            switch (c12) {
                                                            }
                                                    }
                                                }
                                                float regionTextHeight = f13;
                                                float position = f11;
                                                return new C1546c9(strA00, position, f12, 0, i14, regionTextHeight, f14, 1, f15, i15);
                                            } catch (NumberFormatException unused3) {
                                                MV.A07(strA0A, strA0A4 + strA002);
                                                return null;
                                            }
                                        }
                                        MV.A07(strA0A, A0A(465, 33, 15));
                                        return null;
                                    } catch (NumberFormatException unused4) {
                                        MV.A07(strA0A, strA0A2 + strA002);
                                        return null;
                                    }
                                }
                                MV.A07(strA0A, A0A(498, 33, 115));
                                return null;
                            }

                            public static C1552cF A08(C1552cF c1552cF) {
                                return c1552cF == null ? new C1552cF() : c1552cF;
                            }

                            /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
                            /* JADX WARN: Code restructure failed: missing block: B:223:0x002f, code lost:
                            
                                continue;
                             */
                            /* JADX WARN: Removed duplicated region for block: B:101:0x034b  */
                            /* JADX WARN: Removed duplicated region for block: B:10:0x0032  */
                            /* JADX WARN: Removed duplicated region for block: B:11:0x003f  */
                            /* JADX WARN: Removed duplicated region for block: B:120:0x03fa  */
                            /* JADX WARN: Removed duplicated region for block: B:12:0x004c  */
                            /* JADX WARN: Removed duplicated region for block: B:16:0x0077  */
                            /* JADX WARN: Removed duplicated region for block: B:182:0x0368 A[EXC_TOP_SPLITTER, SYNTHETIC] */
                            /* JADX WARN: Removed duplicated region for block: B:191:0x002f A[SYNTHETIC] */
                            /* JADX WARN: Removed duplicated region for block: B:220:0x002f A[SYNTHETIC] */
                            /* JADX WARN: Removed duplicated region for block: B:33:0x00e3  */
                            /* JADX WARN: Removed duplicated region for block: B:34:0x00ed  */
                            /* JADX WARN: Removed duplicated region for block: B:35:0x00f7  */
                            /* JADX WARN: Removed duplicated region for block: B:36:0x0101  */
                            /* JADX WARN: Removed duplicated region for block: B:37:0x010b  */
                            /* JADX WARN: Removed duplicated region for block: B:39:0x0116  */
                            /* JADX WARN: Removed duplicated region for block: B:52:0x016c  */
                            /* JADX WARN: Removed duplicated region for block: B:6:0x0021  */
                            /* JADX WARN: Removed duplicated region for block: B:73:0x0205  */
                            /* JADX WARN: Removed duplicated region for block: B:88:0x027d  */
                            /* JADX WARN: Removed duplicated region for block: B:89:0x028b  */
                            /* JADX WARN: Removed duplicated region for block: B:92:0x02b9  */
                            /* JADX WARN: Removed duplicated region for block: B:93:0x02d0  */
                            /* JADX WARN: Removed duplicated region for block: B:94:0x02e7  */
                            /* JADX WARN: Removed duplicated region for block: B:95:0x02f1  */
                            /* JADX WARN: Removed duplicated region for block: B:98:0x031e  */
                            /*
                                Code decompiled incorrectly, please refer to instructions dump.
                            */
                            public static C1552cF A09(XmlPullParser xmlPullParser, C1552cF c1552cF) {
                                char c12;
                                C1552cF c1552cFA08 = c1552cF;
                                int attributeCount = xmlPullParser.getAttributeCount();
                                for (int i5 = 0; i5 < attributeCount; i5++) {
                                    String attributeValue = xmlPullParser.getAttributeValue(i5);
                                    String attributeName = xmlPullParser.getAttributeName(i5);
                                    int attributeCount2 = attributeName.hashCode();
                                    char c13 = 5;
                                    char c14 = 3;
                                    char c15 = 65535;
                                    switch (attributeCount2) {
                                        case -1550943582:
                                            c12 = attributeName.equals(A0A(1380, 9, 104)) ? (char) 6 : (char) 65535;
                                            String strA0A = A0A(892, 11, 82);
                                            switch (c12) {
                                                case 0:
                                                    if (A0A(1655, 5, 100).equals(xmlPullParser.getName())) {
                                                        c1552cFA08 = A08(c1552cFA08).A0Q(attributeValue);
                                                        break;
                                                    } else {
                                                        break;
                                                    }
                                                case 1:
                                                    c1552cFA08 = A08(c1552cFA08);
                                                    try {
                                                        int attributeCount3 = AbstractC1070Lw.A01(attributeValue);
                                                        c1552cFA08.A0G(attributeCount3);
                                                        break;
                                                    } catch (IllegalArgumentException unused) {
                                                        MV.A07(strA0A, A0A(51, 33, 104) + attributeValue);
                                                        break;
                                                    }
                                                case 2:
                                                    c1552cFA08 = A08(c1552cFA08);
                                                    try {
                                                        int attributeCount4 = AbstractC1070Lw.A01(attributeValue);
                                                        c1552cFA08.A0H(attributeCount4);
                                                        break;
                                                    } catch (IllegalArgumentException unused2) {
                                                        MV.A07(strA0A, A0A(84, 28, 43) + attributeValue);
                                                        break;
                                                    }
                                                case 3:
                                                    c1552cFA08 = A08(c1552cFA08).A0P(attributeValue);
                                                    break;
                                                case 4:
                                                    try {
                                                        c1552cFA08 = A08(c1552cFA08);
                                                        A0D(attributeValue, c1552cFA08);
                                                        break;
                                                    } catch (C1135Oj unused3) {
                                                        MV.A07(strA0A, A0A(112, 31, 105) + attributeValue);
                                                        break;
                                                    }
                                                case 5:
                                                    c1552cFA08 = A08(c1552cFA08).A0R(A0A(1279, 4, 66).equalsIgnoreCase(attributeValue));
                                                    break;
                                                case 6:
                                                    c1552cFA08 = A08(c1552cFA08).A0S(A0A(1525, 6, 76).equalsIgnoreCase(attributeValue));
                                                    break;
                                                case 7:
                                                    C1552cF c1552cFA082 = A08(c1552cFA08);
                                                    String[] strArr = A02;
                                                    String str2 = strArr[7];
                                                    String str3 = strArr[0];
                                                    int i11 = str2.charAt(10);
                                                    int attributeCount5 = str3.charAt(10);
                                                    if (i11 == attributeCount5) {
                                                        throw new RuntimeException();
                                                    }
                                                    String[] strArr2 = A02;
                                                    strArr2[7] = "wnCEK2584vYzcW6z3Sz2kR6B988o5Ws1";
                                                    strArr2[0] = "6TeAn7fy0J7f9uyCtSaXnOhSOdBG8Thw";
                                                    c1552cFA08 = c1552cFA082.A0M(A02(attributeValue));
                                                    break;
                                                case '\b':
                                                    c1552cFA08 = A08(c1552cFA08).A0L(A02(attributeValue));
                                                    break;
                                                case '\t':
                                                    String strA01 = XC.A01(attributeValue);
                                                    int attributeCount6 = strA01.hashCode();
                                                    switch (attributeCount6) {
                                                        case 96673:
                                                            if (strA01.equals(A0A(1214, 3, 115))) {
                                                                c15 = 1;
                                                                break;
                                                            }
                                                            break;
                                                        case 3387192:
                                                            if (strA01.equals(A0A(1589, 4, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE))) {
                                                                c15 = 0;
                                                                break;
                                                            }
                                                            break;
                                                    }
                                                    switch (c15) {
                                                        case 0:
                                                            c1552cFA08 = A08(c1552cFA08).A0U(false);
                                                            break;
                                                        case 1:
                                                            C1552cF c1552cFA083 = A08(c1552cFA08);
                                                            String[] strArr3 = A02;
                                                            String str4 = strArr3[4];
                                                            String str5 = strArr3[5];
                                                            int i12 = str4.charAt(18);
                                                            int attributeCount7 = str5.charAt(18);
                                                            if (i12 != attributeCount7) {
                                                                String[] strArr4 = A02;
                                                                strArr4[1] = "BOSjahKK48gQQcfgpMpPnkM75c2oqyWr";
                                                                strArr4[3] = "RJQUC2iDAFQsVPsdRqkFGdNDS9A7W8oZ";
                                                                c1552cFA08 = c1552cFA083.A0U(true);
                                                                break;
                                                            } else {
                                                                String[] strArr5 = A02;
                                                                strArr5[4] = "q6yXS3j6sQ6ZFzRTzwJaAxRAbIc8WPz8";
                                                                strArr5[5] = "WuLyOMHvNwjlaMb0daJACEPAN22egagf";
                                                                c1552cFA08 = c1552cFA083.A0U(true);
                                                                break;
                                                            }
                                                    }
                                                case '\n':
                                                    String strA012 = XC.A01(attributeValue);
                                                    int attributeCount8 = strA012.hashCode();
                                                    switch (attributeCount8) {
                                                        case -618561360:
                                                            if (strA012.equals(A0A(1251, 13, 58))) {
                                                                c13 = 2;
                                                                break;
                                                            } else {
                                                                c13 = 65535;
                                                                break;
                                                            }
                                                        case -410956671:
                                                            if (strA012.equals(A0A(1310, 9, 41))) {
                                                                c13 = 0;
                                                                break;
                                                            }
                                                            break;
                                                        case -250518009:
                                                            boolean zEquals = strA012.equals(A0A(1323, 9, 51));
                                                            int i13 = A02[2].length();
                                                            if (i13 == 14) {
                                                                String[] strArr6 = A02;
                                                                strArr6[4] = "qlSzk1yGFNId1GvWfcJkvs6lnv0OyfcJ";
                                                                strArr6[5] = "RZ2grigk5CJ9qUgSBgJ02tvsslg8isgW";
                                                                if (!zEquals) {
                                                                }
                                                            } else if (!zEquals) {
                                                            }
                                                            break;
                                                        case -136074796:
                                                            String[] strArr7 = A02;
                                                            String str6 = strArr7[7];
                                                            String str7 = strArr7[0];
                                                            int i14 = str6.charAt(10);
                                                            int attributeCount9 = str7.charAt(10);
                                                            if (i14 != attributeCount9) {
                                                                A02[6] = "3kdJiXgV2Xqvz2";
                                                                if (strA012.equals(A0A(1714, 13, 40))) {
                                                                    c13 = 4;
                                                                    break;
                                                                }
                                                            } else {
                                                                String[] strArr8 = A02;
                                                                strArr8[4] = "dd9qNAy4fFkpm8EHxVJosHdZdo4HwM7A";
                                                                strArr8[5] = "woe0jGCEvtYkhcybJGJNk7ekpUpVZfxh";
                                                                if (strA012.equals(A0A(1714, 13, 40))) {
                                                                }
                                                            }
                                                            break;
                                                        case 3016401:
                                                            if (strA012.equals(A0A(1247, 4, 33))) {
                                                                c13 = 1;
                                                                break;
                                                            }
                                                            break;
                                                        case 3556653:
                                                            if (strA012.equals(A0A(1690, 4, 66))) {
                                                                c13 = 3;
                                                                break;
                                                            }
                                                            break;
                                                    }
                                                    switch (c13) {
                                                        case 0:
                                                            c1552cFA08 = A08(c1552cFA08).A0K(1);
                                                            break;
                                                        case 1:
                                                        case 2:
                                                            c1552cFA08 = A08(c1552cFA08).A0K(2);
                                                            break;
                                                        case 3:
                                                        case 4:
                                                            c1552cFA08 = A08(c1552cFA08).A0K(3);
                                                            break;
                                                        case 5:
                                                            c1552cFA08 = A08(c1552cFA08).A0K(4);
                                                            break;
                                                    }
                                                case 11:
                                                    String strA013 = XC.A01(attributeValue);
                                                    int iHashCode = strA013.hashCode();
                                                    int i15 = A02[2].length();
                                                    if (i15 != 14) {
                                                        throw new RuntimeException();
                                                    }
                                                    A02[2] = "xylMtH9UFMcdtu";
                                                    switch (iHashCode) {
                                                        case -1392885889:
                                                            if (strA013.equals(A0A(1264, 6, 100))) {
                                                                c15 = 0;
                                                                break;
                                                            }
                                                            break;
                                                        case 92734940:
                                                            if (strA013.equals(A0A(1209, 5, 12))) {
                                                                c15 = 1;
                                                                break;
                                                            }
                                                            break;
                                                    }
                                                    switch (c15) {
                                                        case 0:
                                                            C1552cF c1552cFA084 = A08(c1552cFA08);
                                                            int i16 = A02[6].length();
                                                            if (i16 == 4) {
                                                                throw new RuntimeException();
                                                            }
                                                            String[] strArr9 = A02;
                                                            strArr9[1] = "xAtWOcqXNA55fxZceqNy7AuybJij05mB";
                                                            strArr9[3] = "LrqwBjzBoTDomI0PQDMphUVyMsIfzuHC";
                                                            c1552cFA08 = c1552cFA084.A0J(1);
                                                            break;
                                                        case 1:
                                                            c1552cFA08 = A08(c1552cFA08).A0J(2);
                                                            break;
                                                    }
                                                case '\f':
                                                    String strA014 = XC.A01(attributeValue);
                                                    String[] strArr10 = A02;
                                                    String str8 = strArr10[7];
                                                    String str9 = strArr10[0];
                                                    int i17 = str8.charAt(10);
                                                    int attributeCount10 = str9.charAt(10);
                                                    if (i17 == attributeCount10) {
                                                        throw new RuntimeException();
                                                    }
                                                    String[] strArr11 = A02;
                                                    strArr11[4] = "CZsdGhmgxqBZPVpB9LJcZtG4rRKO3AiG";
                                                    strArr11[5] = "kbdpPZ2pYoMp6OhI08JAMLioyAn4KZsG";
                                                    int attributeCount11 = strA014.hashCode();
                                                    switch (attributeCount11) {
                                                        case -1461280213:
                                                            String[] strArr12 = A02;
                                                            String str10 = strArr12[7];
                                                            String str11 = strArr12[0];
                                                            int i18 = str10.charAt(10);
                                                            int attributeCount12 = str11.charAt(10);
                                                            if (i18 == attributeCount12) {
                                                                throw new RuntimeException();
                                                            }
                                                            String[] strArr13 = A02;
                                                            strArr13[4] = "M4wPk2Q3RDc7leQWVpJJrKZ1lZWKLnMT";
                                                            strArr13[5] = "KQUEu4hziCCKE9r5yjJCR7jx83AoqKVe";
                                                            if (!strA014.equals(A0A(1593, 11, 18))) {
                                                                c14 = 65535;
                                                            }
                                                            switch (c14) {
                                                                case 0:
                                                                    c1552cFA08 = A08(c1552cFA08).A0T(true);
                                                                    break;
                                                                case 1:
                                                                    c1552cFA08 = A08(c1552cFA08).A0T(false);
                                                                    break;
                                                                case 2:
                                                                    c1552cFA08 = A08(c1552cFA08).A0V(true);
                                                                    break;
                                                                case 3:
                                                                    c1552cFA08 = A08(c1552cFA08).A0V(false);
                                                                    break;
                                                            }
                                                        case -1026963764:
                                                            if (strA014.equals(A0A(1763, 9, 18))) {
                                                                c14 = 2;
                                                            }
                                                            switch (c14) {
                                                            }
                                                        case 913457136:
                                                            if (strA014.equals(A0A(1576, 13, 53))) {
                                                                c14 = 1;
                                                            }
                                                            switch (c14) {
                                                            }
                                                        case 1679736913:
                                                            if (strA014.equals(A0A(1541, 11, 23))) {
                                                                c14 = 0;
                                                            }
                                                            switch (c14) {
                                                            }
                                                    }
                                                case '\r':
                                                    c1552cFA08 = A08(c1552cFA08).A0N(C1541c4.A01(attributeValue));
                                                    break;
                                                case 14:
                                                    c1552cFA08 = A08(c1552cFA08).A0F(A00(attributeValue));
                                                    break;
                                            }
                                            break;
                                        case -1224696685:
                                            if (attributeName.equals(A0A(1362, 10, 76))) {
                                                c12 = 3;
                                            }
                                            String strA0A2 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case -1065511464:
                                            if (attributeName.equals(A0A(1694, 9, 15))) {
                                                c12 = 7;
                                            }
                                            String strA0A22 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case -879295043:
                                            if (attributeName.equals(A0A(1727, 14, 54))) {
                                                c12 = '\f';
                                            }
                                            String strA0A222 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case -734428249:
                                            if (attributeName.equals(A0A(1389, 10, 28))) {
                                                c12 = 5;
                                            }
                                            String strA0A2222 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case 3355:
                                            if (attributeName.equals(A0A(1507, 2, 17))) {
                                                c12 = 0;
                                            }
                                            String strA0A22222 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case 3511770:
                                            if (attributeName.equals(A0A(1624, 4, 49))) {
                                                c12 = '\n';
                                            }
                                            String strA0A222222 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case 94842723:
                                            if (attributeName.equals(A0A(1305, 5, 2))) {
                                                c12 = 2;
                                            }
                                            String strA0A2222222 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case 109403361:
                                            if (attributeName.equals(A0A(1641, 5, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE))) {
                                                c12 = 14;
                                            }
                                            String strA0A22222222 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case 110138194:
                                            if (attributeName.equals(A0A(1703, 11, 100))) {
                                                c12 = '\t';
                                            }
                                            String strA0A222222222 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case 365601008:
                                            if (attributeName.equals(A0A(1372, 8, 1))) {
                                                c12 = 4;
                                            }
                                            String strA0A2222222222 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case 921125321:
                                            String strA0A3 = A0A(1741, 12, 11);
                                            String[] strArr14 = A02;
                                            String str12 = strArr14[7];
                                            String str13 = strArr14[0];
                                            int i19 = str12.charAt(10);
                                            int attributeCount13 = str13.charAt(10);
                                            if (i19 == attributeCount13) {
                                                throw new RuntimeException();
                                            }
                                            A02[6] = "WS";
                                            if (attributeName.equals(strA0A3)) {
                                                c12 = '\r';
                                            }
                                            String strA0A22222222222 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case 1115953443:
                                            if (attributeName.equals(A0A(1628, 12, 44))) {
                                                c12 = 11;
                                            }
                                            String strA0A222222222222 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case 1287124693:
                                            if (attributeName.equals(A0A(1217, 15, 2))) {
                                                c12 = 1;
                                            }
                                            String strA0A2222222222222 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                        case 1754920356:
                                            if (attributeName.equals(A0A(1563, 13, 78))) {
                                                c12 = '\b';
                                            }
                                            String strA0A22222222222222 = A0A(892, 11, 82);
                                            switch (c12) {
                                            }
                                            break;
                                    }
                                }
                                return c1552cFA08;
                            }

                            /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
                            /* JADX WARN: Removed duplicated region for block: B:11:0x003b  */
                            /* JADX WARN: Removed duplicated region for block: B:29:0x00dc  */
                            /* JADX WARN: Removed duplicated region for block: B:30:0x00e0  */
                            /* JADX WARN: Removed duplicated region for block: B:31:0x00e4  */
                            /* JADX WARN: Removed duplicated region for block: B:9:0x0037  */
                            /*
                                Code decompiled incorrectly, please refer to instructions dump.
                            */
                            public static void A0D(String str2, C1552cF c1552cF) throws C1135Oj {
                                Matcher matcher;
                                char c12;
                                String[] strArrA1O = N1.A1O(str2, A0A(962, 3, 114));
                                if (strArrA1O.length == 1) {
                                    matcher = A09.matcher(str2);
                                } else if (strArrA1O.length == 2) {
                                    matcher = A09.matcher(strArrA1O[1]);
                                    MV.A07(A0A(892, 11, 82), A0A(735, 110, 98));
                                } else {
                                    throw new C1135Oj(A0A(615, 40, 74) + strArrA1O.length + A0A(5, 1, 57));
                                }
                                boolean zMatches = matcher.matches();
                                String strA0A = A0A(3, 2, 1);
                                if (zMatches) {
                                    String str3 = (String) AbstractC1062Ln.A01(matcher.group(3));
                                    switch (str3.hashCode()) {
                                        case 37:
                                            c12 = str3.equals(A0A(2, 1, 33)) ? (char) 2 : (char) 65535;
                                            switch (c12) {
                                                case 0:
                                                    c1552cF.A0I(1);
                                                    break;
                                                case 1:
                                                    c1552cF.A0I(2);
                                                    break;
                                                case 2:
                                                    c1552cF.A0I(3);
                                                    break;
                                                default:
                                                    throw new C1135Oj(A0A(655, 28, 109) + str3 + strA0A);
                                            }
                                            c1552cF.A0E(Float.parseFloat((String) AbstractC1062Ln.A01(matcher.group(1))));
                                            return;
                                        case 3240:
                                            String[] strArr = A02;
                                            if (strArr[4].charAt(18) != strArr[5].charAt(18)) {
                                                throw new RuntimeException();
                                            }
                                            String[] strArr2 = A02;
                                            strArr2[4] = "RlD46m9KSK1h59RifBJB1jlKaNKUNJzd";
                                            strArr2[5] = "DSPeHPzuy17st5ZAPEJZcggBUTc6ttvu";
                                            if (str3.equals(A0A(1350, 2, 101))) {
                                                c12 = 1;
                                            }
                                            switch (c12) {
                                            }
                                            c1552cF.A0E(Float.parseFloat((String) AbstractC1062Ln.A01(matcher.group(1))));
                                            return;
                                        case 3592:
                                            if (str3.equals(A0A(1611, 2, 107))) {
                                                c12 = 0;
                                            }
                                            switch (c12) {
                                            }
                                            c1552cF.A0E(Float.parseFloat((String) AbstractC1062Ln.A01(matcher.group(1))));
                                            return;
                                    }
                                }
                                throw new C1135Oj(A0A(581, 34, 0) + str2 + strA0A);
                            }

                            public static void A0E(XmlPullParser xmlPullParser, Map<String, String> map) throws XmlPullParserException, IOException {
                                String encodedBitmapData;
                                do {
                                    xmlPullParser.next();
                                    if (N7.A04(xmlPullParser, A0A(1509, 5, 47)) && (encodedBitmapData = N7.A00(xmlPullParser, A0A(1507, 2, 17))) != null) {
                                        String id2 = xmlPullParser.nextText();
                                        map.put(encodedBitmapData, id2);
                                    }
                                } while (!N7.A03(xmlPullParser, A0A(1553, 8, 120)));
                            }

                            public static boolean A0F(String str2) {
                                if (!str2.equals(A0A(1761, 2, 5)) && !str2.equals(A0A(1468, 4, 35))) {
                                    String[] strArr = A02;
                                    if (strArr[7].charAt(10) == strArr[0].charAt(10)) {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr2 = A02;
                                    strArr2[1] = "Cv64ERjVkUVbwpzLoBr1CF1SSWLfWToL";
                                    strArr2[3] = "c3vv5KiYNpc5XhFXmyASfZBUNARB9fIc";
                                    if (!str2.equals(A0A(1275, 4, 5)) && !str2.equals(A0A(1344, 3, 31)) && !str2.equals(A0A(1610, 1, 114)) && !str2.equals(A0A(1646, 4, 87)) && !str2.equals(A0A(1283, 2, 104)) && !str2.equals(A0A(1655, 5, 100)) && !str2.equals(A0A(1660, 7, 71)) && !str2.equals(A0A(1531, 6, 0)) && !str2.equals(A0A(1613, 6, 106)) && !str2.equals(A0A(1553, 8, 120)) && !str2.equals(A0A(1509, 5, 47)) && !str2.equals(A0A(1319, 4, 28)) && !str2.equals(A0A(1514, 11, 13))) {
                                        return false;
                                    }
                                }
                                return true;
                            }

                            public static String[] A0G(String str2) {
                                String strTrim = str2.trim();
                                return strTrim.isEmpty() ? new String[0] : N1.A1O(strTrim, A0A(962, 3, 114));
                            }
                        };
                    case 4:
                        return new C8C() { // from class: com.facebook.ads.redexgen.X.41
                            public static byte[] A02;
                            public static String[] A03 = {"rGnU9VVIW2n7enlmWkgO6WwWfxVNPMro", "AmOcmxqwhpCh6xEGUpvINLkKtwmei3z", "cjC52AUw8dkJcplgCOKzQA5n2lLL6sO7", "XYDqNuct2LMXp", "aViH2oO", "HI9ukGzBsCo5fpD332RsUgXOiUmkoSGa", "xoLhuLshRx5w8a4oP1KWI", "FRrK8xJBHk6JWDujspMlt7IiWLdRl0AS"};
                            public static final Pattern A04;
                            public static final Pattern A05;
                            public final StringBuilder A00;
                            public final ArrayList<String> A01;

                            public static String A03(int i5, int i11, int i12) {
                                byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
                                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 58);
                                }
                                return new String(bArrCopyOfRange);
                            }

                            public static void A06() {
                                A02 = new byte[]{-109, -71, -55, -107, -66, -42, -44, -37, -37, -44, -39, -46, -117, -44, -39, -31, -52, -41, -44, -49, -117, -44, -39, -49, -48, -29, -91, -117, -55, -31, -33, -26, -26, -33, -28, -35, -106, -33, -28, -20, -41, -30, -33, -38, -106, -22, -33, -29, -33, -28, -35, -80, -106, -53, -19, -38, -22, -31, -24, -68, -35, -37, -25, -36, -35, -22, -75, -50, -59, -40, -48, -59, -61, -44, -59, -60, -128, -59, -50, -60, -19, 4, -69, -71, -71, -48, -53, -71, -19, -11, -68, -70, -53, -70, -48, -71, -19, -11, -68, -70, -53, -71, -19, -11, -68, -70, -71, -48, -53, -67, -71, -19, -11, -68, -70, -70, -48, -70, -19, 4, -69, -66, -66, -49, -19, 4, -69, -71, -71, -48, -53, -71, -19, -11, -68, -70, -53, -70, -48, -71, -19, -11, -68, -70, -53, -71, -19, -11, -68, -70, -71, -48, -53, -67, -71, -19, -11, -68, -70, -70, -48, -70, -19, 4, -69, 0, 31, 0, 0, -46, -50, -29, 0, 33, -104, -73, -104, -104, -99, -86, -105, 109, 105, 117, -103, -104, -71, -32, -63, -58, -45, -106, -30, 19, -12, -7, 6, -54, 21, 32, 1, 6, 19, -40, 34, -11, -42, -37, -24, -82, -9, -11, -42, -37, -24, -81, -9, -14, -45, -40, -27, -83, -12, -22, -53, -48, -35, -90, -20, 9, -22, -17, -4, -58, 11, -19, -50, -45, -32, -85, -17};
                            }

                            static {
                                A06();
                                A05 = Pattern.compile(A03(80, 85, 87));
                                A04 = Pattern.compile(A03(165, 9, 106));
                            }

                            {
                                A03(53, 13, 62);
                                this.A00 = new StringBuilder();
                                this.A01 = new ArrayList<>();
                            }

                            public static float A00(int i5) {
                                switch (i5) {
                                    case 0:
                                        return 0.08f;
                                    case 1:
                                        return 0.5f;
                                    case 2:
                                        return 0.92f;
                                    default:
                                        throw new IllegalArgumentException();
                                }
                            }

                            public static long A01(Matcher matcher, int i5) {
                                long j11;
                                String hours = matcher.group(i5 + 1);
                                if (hours != null) {
                                    long j12 = Long.parseLong(hours) * 60 * 60;
                                    if (A03[1].length() == 9) {
                                        throw new RuntimeException();
                                    }
                                    A03[1] = "fmVNceR9";
                                    j11 = j12 * 1000;
                                } else {
                                    j11 = 0;
                                }
                                long j13 = j11 + (Long.parseLong((String) AbstractC1062Ln.A01(matcher.group(i5 + 2))) * 60 * 1000) + (Long.parseLong((String) AbstractC1062Ln.A01(matcher.group(i5 + 3))) * 1000);
                                String hours2 = matcher.group(i5 + 4);
                                if (hours2 != null) {
                                    j13 += Long.parseLong(hours2);
                                }
                                long timestampMs = 1000 * j13;
                                return timestampMs;
                            }

                            /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
                            /* JADX WARN: Removed duplicated region for block: B:13:0x007d  */
                            /* JADX WARN: Removed duplicated region for block: B:8:0x006f  */
                            /*
                                Code decompiled incorrectly, please refer to instructions dump.
                            */
                            private C1251Th A02(Spanned spanned, String str2) {
                                char c12;
                                char c13;
                                C1052Ld c1052LdA0G = new C1052Ld().A0G(spanned);
                                if (str2 == null) {
                                    return c1052LdA0G.A0H();
                                }
                                int iHashCode = str2.hashCode();
                                String strA03 = A03(235, 6, 56);
                                String strA032 = A03(229, 6, 84);
                                String strA033 = A03(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 6, 53);
                                String strA034 = A03(Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE, 6, 61);
                                String strA035 = A03(211, 6, 64);
                                String strA036 = A03(Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE, 6, 64);
                                String strA037 = A03(199, 6, 107);
                                String strA038 = A03(193, 6, 94);
                                String strA039 = A03(187, 6, 43);
                                switch (iHashCode) {
                                    case -685620710:
                                        if (!str2.equals(strA039)) {
                                            c12 = 65535;
                                            break;
                                        } else {
                                            c12 = 0;
                                            break;
                                        }
                                    case -685620679:
                                        if (str2.equals(strA038)) {
                                            c12 = 6;
                                            break;
                                        }
                                        break;
                                    case -685620648:
                                        if (str2.equals(strA037)) {
                                            c12 = 3;
                                            break;
                                        }
                                        break;
                                    case -685620617:
                                        if (str2.equals(strA036)) {
                                            c12 = 1;
                                            break;
                                        }
                                        break;
                                    case -685620586:
                                        if (str2.equals(strA035)) {
                                            c12 = 7;
                                            break;
                                        }
                                        break;
                                    case -685620555:
                                        if (str2.equals(strA034)) {
                                            c12 = 4;
                                            break;
                                        }
                                        break;
                                    case -685620524:
                                        if (str2.equals(strA033)) {
                                            c12 = 2;
                                            break;
                                        }
                                        break;
                                    case -685620493:
                                        if (str2.equals(strA032)) {
                                            c12 = '\b';
                                            break;
                                        }
                                        break;
                                    case -685620462:
                                        if (str2.equals(strA03)) {
                                            c12 = 5;
                                            break;
                                        }
                                        break;
                                }
                                switch (c12) {
                                    case 0:
                                    case 1:
                                    case 2:
                                        c1052LdA0G.A0A(0);
                                        break;
                                    case 3:
                                    case 4:
                                    case 5:
                                        c1052LdA0G.A0A(2);
                                        break;
                                    default:
                                        c1052LdA0G.A0A(1);
                                        break;
                                }
                                switch (str2.hashCode()) {
                                    case -685620710:
                                        if (!str2.equals(strA039)) {
                                            c13 = 65535;
                                            break;
                                        } else {
                                            c13 = 0;
                                            break;
                                        }
                                    case -685620679:
                                        if (str2.equals(strA038)) {
                                            c13 = 1;
                                            break;
                                        }
                                        break;
                                    case -685620648:
                                        if (str2.equals(strA037)) {
                                            c13 = 2;
                                            break;
                                        }
                                        break;
                                    case -685620617:
                                        if (str2.equals(strA036)) {
                                            c13 = 6;
                                            break;
                                        }
                                        break;
                                    case -685620586:
                                        if (str2.equals(strA035)) {
                                            c13 = 7;
                                            break;
                                        }
                                        break;
                                    case -685620555:
                                        if (str2.equals(strA034)) {
                                            c13 = '\b';
                                            break;
                                        }
                                        break;
                                    case -685620524:
                                        if (str2.equals(strA033)) {
                                            c13 = 3;
                                            break;
                                        }
                                        break;
                                    case -685620493:
                                        if (str2.equals(strA032)) {
                                            c13 = 4;
                                            break;
                                        }
                                        break;
                                    case -685620462:
                                        if (str2.equals(strA03)) {
                                            c13 = 5;
                                            break;
                                        }
                                        break;
                                }
                                switch (c13) {
                                    case 0:
                                    case 1:
                                    case 2:
                                        c1052LdA0G.A09(2);
                                        break;
                                    case 3:
                                    case 4:
                                    case 5:
                                        c1052LdA0G.A09(0);
                                        break;
                                    default:
                                        c1052LdA0G.A09(1);
                                        break;
                                }
                                return c1052LdA0G.A04(A00(c1052LdA0G.A01())).A07(A00(c1052LdA0G.A00()), 0).A0H();
                            }

                            private String A04(String str2, ArrayList<String> arrayList) {
                                String strTrim = str2.trim();
                                int i5 = 0;
                                StringBuilder sb2 = new StringBuilder(strTrim);
                                Matcher matcher = A04.matcher(strTrim);
                                while (matcher.find()) {
                                    String strGroup = matcher.group();
                                    arrayList.add(strGroup);
                                    int tagLength = matcher.start() - i5;
                                    int start = strGroup.length();
                                    sb2.replace(tagLength, tagLength + start, A03(0, 0, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
                                    i5 += start;
                                }
                                return sb2.toString();
                            }

                            private Charset A05(C1084Mk c1084Mk) {
                                Charset charset = c1084Mk.A0Z();
                                return charset != null ? charset : XA.A05;
                            }

                            @Override // com.facebook.ads.redexgen.X.C8C
                            public final InterfaceC1506bV A0g(byte[] bArr, int i5, boolean z11) throws NumberFormatException {
                                String strA03 = A03(53, 13, 62);
                                ArrayList arrayList = new ArrayList();
                                MW mw2 = new MW();
                                C1084Mk c1084Mk = new C1084Mk(bArr, i5);
                                Charset charsetA05 = A05(c1084Mk);
                                while (true) {
                                    String strA0Y = c1084Mk.A0Y(charsetA05);
                                    if (strA0Y == null) {
                                        break;
                                    }
                                    if (strA0Y.length() != 0) {
                                        try {
                                            Integer.parseInt(strA0Y);
                                            String strA0Y2 = c1084Mk.A0Y(charsetA05);
                                            if (strA0Y2 == null) {
                                                MV.A07(strA03, A03(66, 14, 38));
                                                break;
                                            }
                                            Matcher matcher = A05.matcher(strA0Y2);
                                            if (matcher.matches()) {
                                                mw2.A04(A01(matcher, 1));
                                                mw2.A04(A01(matcher, 6));
                                                this.A00.setLength(0);
                                                this.A01.clear();
                                                for (String strA0Y3 = c1084Mk.A0Y(charsetA05); !TextUtils.isEmpty(strA0Y3); strA0Y3 = c1084Mk.A0Y(charsetA05)) {
                                                    if (this.A00.length() > 0) {
                                                        this.A00.append(A03(0, 4, 29));
                                                    }
                                                    this.A00.append(A04(strA0Y3, this.A01));
                                                }
                                                Spanned spannedFromHtml = Html.fromHtml(this.A00.toString());
                                                String tag = null;
                                                int i11 = 0;
                                                while (true) {
                                                    if (i11 >= this.A01.size()) {
                                                        break;
                                                    }
                                                    String alignmentTag = this.A01.get(i11);
                                                    if (alignmentTag.matches(A03(174, 13, 2))) {
                                                        tag = alignmentTag;
                                                        break;
                                                    }
                                                    i11++;
                                                }
                                                arrayList.add(A02(spannedFromHtml, tag));
                                                arrayList.add(C1251Th.A0J);
                                            } else {
                                                MV.A07(strA03, A03(28, 25, 60) + strA0Y2);
                                            }
                                        } catch (NumberFormatException unused) {
                                            MV.A07(strA03, A03(4, 24, 49) + strA0Y);
                                        }
                                    }
                                }
                                return new C1129Od((C1251Th[]) arrayList.toArray(new C1251Th[0]), mw2.A05());
                            }
                        };
                    case 5:
                        final List<byte[]> list = vc.A0X;
                        return new C8C(list) { // from class: com.facebook.ads.redexgen.X.3z
                            public static byte[] A07;
                            public static String[] A08 = {"A91V7rz", "J9aozvJ8VyEDCYwSCt97BCRBWvNVu7QB", "PATIjWQFvghQxa4OepNHirgNSdB", "ysRX8gFTOE8", "DSIcDjqBkehWeHzN5VLQywS4nDt", "yS6yPgT4BEJIBdI3kPN7vZiIQ7j", "j7DDPRqJVrPGHjFDzmP0esf2yTjRxOal", "bjrvULLYDv4qD6tjKOHoEKDgD"};
                            public final float A00;
                            public final int A01;
                            public final int A02;
                            public final int A03;
                            public final C1084Mk A04;
                            public final String A05;
                            public final boolean A06;

                            public static String A00(int i5, int i11, int i12) {
                                byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
                                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 66);
                                    String[] strArr = A08;
                                    if (strArr[2].length() != strArr[4].length()) {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr2 = A08;
                                    strArr2[3] = "xvDr8n8z38q";
                                    strArr2[5] = "JHLcdJULTaVyjeZwj8PdKiPY8In";
                                }
                                return new String(bArrCopyOfRange);
                            }

                            public static void A02() {
                                A07 = new byte[]{-78, -87, -57, -58, -87, -18, -9, -19, -87, -79, -36, -45, 39, 34, -45, 22, 40, 24, 7, 24, 43, 39, -31, 31, 24, 33, 26, 39, 27, -37, -36, -45, -37, -60, -55, -26, 4, 11, 12, 15, 6, 11, 4, -67, 16, 17, 22, 9, -67, 20, 6, 17, 5, -67, 16, 17, -2, 15, 17, -67, -59, -72, -54, -41, -50, -53, -41, -11, -8, -15, -26, -28, -9, -20, -15, -22, -93, -10, -9, -4, -17, -93, -24, -15, -25, -93, -85, -22, 14, -55, -3, -38, -5, -7, 5, -6, -5, 8, -54, -29, -38, -19, -27, -38, -40, -23, -38, -39, -107, -24, -22, -41, -23, -34, -23, -31, -38, -107, -37, -28, -25, -30, -42, -23, -93, -32, -50, -37, -32, -102, -32, -46, -33, -42, -45, 32, 18, 31, 22, 19};
                            }

                            static {
                                A02();
                            }

                            {
                                super(A00(87, 11, 84));
                                this.A04 = new C1084Mk();
                                int size = list.size();
                                String strA00 = A00(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 10, 43);
                                if (size == 1 && (list.get(0).length == 48 || list.get(0).length == 53)) {
                                    byte[] bArr = list.get(0);
                                    this.A03 = bArr[24];
                                    this.A02 = ((bArr[26] & 255) << 24) | ((bArr[27] & 255) << 16) | ((bArr[28] & 255) << 8) | (bArr[29] & 255);
                                    this.A05 = A00(61, 5, 35).equals(N1.A0r(bArr, 43, bArr.length - 43)) ? A00(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 5, 107) : strA00;
                                    this.A01 = bArr[25] * 20;
                                    this.A06 = (bArr[0] & 32) != 0;
                                    if (this.A06) {
                                        int requestedVerticalPlacement = ((bArr[10] & 255) << 8) | (bArr[11] & 255);
                                        this.A00 = N1.A00(requestedVerticalPlacement / this.A01, 0.0f, 0.95f);
                                        return;
                                    } else {
                                        this.A00 = 0.85f;
                                        return;
                                    }
                                }
                                this.A03 = 0;
                                this.A02 = -1;
                                this.A05 = strA00;
                                this.A06 = false;
                                this.A00 = 0.85f;
                                this.A01 = -1;
                            }

                            public static String A01(C1084Mk c1084Mk) throws C1135Oj {
                                A07(c1084Mk.A07() >= 2);
                                int bomSize = c1084Mk.A0M();
                                if (bomSize == 0) {
                                    return A00(0, 0, 113);
                                }
                                int iA09 = c1084Mk.A09();
                                Charset charsetA0Z = c1084Mk.A0Z();
                                int textLength = c1084Mk.A09();
                                int bomSize2 = bomSize - (textLength - iA09);
                                if (charsetA0Z == null) {
                                    charsetA0Z = XA.A05;
                                }
                                return c1084Mk.A0X(bomSize2, charsetA0Z);
                            }

                            public static void A03(SpannableStringBuilder spannableStringBuilder, int i5, int i11, int i12, int i13, int i14) {
                                if (i5 != i11) {
                                    int colorArgb = i14 | 33;
                                    spannableStringBuilder.setSpan(new ForegroundColorSpan(((i5 & 255) << 24) | (i5 >>> 8)), i12, i13, colorArgb);
                                }
                            }

                            public static void A04(SpannableStringBuilder spannableStringBuilder, int i5, int i11, int i12, int i13, int i14) {
                                if (i5 != i11) {
                                    int i15 = i14 | 33;
                                    int flags = i5 & 1;
                                    boolean z11 = flags != 0;
                                    int flags2 = i5 & 2;
                                    boolean z12 = flags2 != 0;
                                    if (z11) {
                                        if (z12) {
                                            spannableStringBuilder.setSpan(new StyleSpan(3), i12, i13, i15);
                                        } else {
                                            spannableStringBuilder.setSpan(new StyleSpan(1), i12, i13, i15);
                                        }
                                    } else if (z12) {
                                        spannableStringBuilder.setSpan(new StyleSpan(2), i12, i13, i15);
                                    }
                                    int flags3 = i5 & 4;
                                    boolean z13 = flags3 != 0;
                                    if (z13) {
                                        spannableStringBuilder.setSpan(new UnderlineSpan(), i12, i13, i15);
                                    }
                                    if (!z13 && !z11 && !z12) {
                                        spannableStringBuilder.setSpan(new StyleSpan(0), i12, i13, i15);
                                    }
                                }
                            }

                            public static void A05(SpannableStringBuilder spannableStringBuilder, String str2, int i5, int i11) {
                                if (str2 != A00(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 10, 43)) {
                                    spannableStringBuilder.setSpan(new TypefaceSpan(str2), i5, i11, 16711713);
                                }
                            }

                            private void A06(C1084Mk c1084Mk, SpannableStringBuilder spannableStringBuilder) throws C1135Oj {
                                A07(c1084Mk.A07() >= 12);
                                int fontFace = c1084Mk.A0M();
                                int iA0M = c1084Mk.A0M();
                                c1084Mk.A0g(2);
                                int iA0I = c1084Mk.A0I();
                                c1084Mk.A0g(1);
                                int iA0C = c1084Mk.A0C();
                                int length = spannableStringBuilder.length();
                                String strA00 = A00(33, 2, 89);
                                String strA002 = A00(87, 11, 84);
                                if (iA0M > length) {
                                    StringBuilder sbAppend = new StringBuilder().append(A00(66, 21, 65)).append(iA0M).append(A00(10, 23, 113));
                                    int start = spannableStringBuilder.length();
                                    MV.A07(strA002, sbAppend.append(start).append(strA00).toString());
                                    iA0M = spannableStringBuilder.length();
                                }
                                if (fontFace < iA0M) {
                                    A04(spannableStringBuilder, iA0I, this.A03, fontFace, iA0M, 0);
                                    String[] strArr = A08;
                                    String str2 = strArr[3];
                                    String str3 = strArr[5];
                                    int end = str2.length();
                                    int start2 = str3.length();
                                    if (end == start2) {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr2 = A08;
                                    strArr2[3] = "6HBeEbjJg4s";
                                    strArr2[5] = "ivqURRoqLd6kXOwYsXbwUcn68bl";
                                    A03(spannableStringBuilder, iA0C, this.A02, fontFace, iA0M, 0);
                                    return;
                                }
                                MV.A07(strA002, A00(35, 26, 91) + fontFace + A00(0, 10, 71) + iA0M + strA00);
                            }

                            public static void A07(boolean z11) throws C1135Oj {
                                if (z11) {
                                } else {
                                    throw new C1135Oj(A00(98, 27, 51));
                                }
                            }

                            @Override // com.facebook.ads.redexgen.X.C8C
                            public final InterfaceC1506bV A0g(byte[] bArr, int i5, boolean z11) throws C1135Oj {
                                this.A04.A0j(bArr, i5);
                                String strA01 = A01(this.A04);
                                if (strA01.isEmpty()) {
                                    return OU.A01;
                                }
                                SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(strA01);
                                A04(spannableStringBuilder, this.A03, 0, 0, spannableStringBuilder.length(), 16711680);
                                A03(spannableStringBuilder, this.A02, -1, 0, spannableStringBuilder.length(), 16711680);
                                A05(spannableStringBuilder, this.A05, 0, spannableStringBuilder.length());
                                float fA00 = this.A00;
                                while (this.A04.A07() >= 8) {
                                    int iA09 = this.A04.A09();
                                    int requestedVerticalPlacement = this.A04.A0C();
                                    int atomType = this.A04.A0C();
                                    if (atomType == 1937013100) {
                                        A07(this.A04.A07() >= 2);
                                        int iA0M = this.A04.A0M();
                                        for (int i11 = 0; i11 < iA0M; i11++) {
                                            A06(this.A04, spannableStringBuilder);
                                        }
                                    } else if (atomType == 1952608120 && this.A06) {
                                        A07(this.A04.A07() >= 2);
                                        float verticalPlacement = this.A04.A0M();
                                        fA00 = N1.A00(verticalPlacement / this.A01, 0.0f, 0.95f);
                                    }
                                    this.A04.A0f(iA09 + requestedVerticalPlacement);
                                }
                                return new OU(new C1052Ld().A0G(spannableStringBuilder).A07(fA00, 0).A09(0).A0H());
                            }
                        };
                    case 6:
                    case 7:
                        return new AnonymousClass48(vc.A0W, vc.A03, -9223372036854775807L);
                    case '\b':
                        final int i5 = vc.A03;
                        final List list2 = null;
                        return new AnonymousClass89(i5, list2) { // from class: com.facebook.ads.redexgen.X.47
                            public static byte[] A0B;
                            public static String[] A0C = {"ZOlAUWQGT6naRgir1L2tF4wzh9edzyMh", "7AD11JBWzfxl6tsUCQsjlL7mrmutc9Be", "FTBsfZ5qBVdWn7zl0DmUX6COJ1aupOdf", "AkinXL3BWGdULKhY3bXwB", "c6Ghs4E9bFeHiORjBklyi", "DSx95", "kI6KbiIBzowBDHmpVOVqTz3mEPk1toZh", "sJEQRmy6X3YQzhK8pZH1ysDLKCkdqTOG"};
                            public int A00;
                            public C1512bb A02;
                            public C1513bc A03;
                            public List<C1251Th> A04;
                            public List<C1251Th> A05;
                            public final int A06;
                            public final boolean A09;
                            public final C1512bb[] A0A;
                            public final C1084Mk A08 = new C1084Mk();
                            public final C1083Mj A07 = new C1083Mj();
                            public int A01 = -1;

                            public static String A00(int i11, int i12, int i13) {
                                byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i11, i11 + i12);
                                int i14 = 0;
                                while (true) {
                                    int length = bArrCopyOfRange.length;
                                    if (A0C[4].length() == 22) {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr = A0C;
                                    strArr[7] = "3Ipbocx8RLkvCj1vqq7XUtTUpq35MhMg";
                                    strArr[6] = "uJ6bMqEJ6Y3GuElRoFvuxg9nFRwcZltP";
                                    if (i14 >= length) {
                                        return new String(bArrCopyOfRange);
                                    }
                                    bArrCopyOfRange[i14] = (byte) ((bArrCopyOfRange[i14] - i13) - 23);
                                    i14++;
                                }
                            }

                            /* JADX WARN: Failed to parse debug info
                            java.lang.ArrayIndexOutOfBoundsException
                             */
                            private void A03() {
                                this.A02.A0C(this.A07.A04(4), this.A07.A04(2), this.A07.A04(2), this.A07.A0H(), this.A07.A0H(), this.A07.A04(3), this.A07.A04(3));
                            }

                            /* JADX WARN: Failed to parse debug info
                            java.lang.ArrayIndexOutOfBoundsException
                             */
                            private void A04() {
                                int iA01 = C1512bb.A01(this.A07.A04(2), this.A07.A04(2), this.A07.A04(2), this.A07.A04(2));
                                int iA012 = C1512bb.A01(this.A07.A04(2), this.A07.A04(2), this.A07.A04(2), this.A07.A04(2));
                                this.A07.A09(2);
                                this.A02.A0B(iA01, iA012, C1512bb.A00(this.A07.A04(2), this.A07.A04(2), this.A07.A04(2)));
                            }

                            /* JADX WARN: Failed to parse debug info
                            java.lang.ArrayIndexOutOfBoundsException
                             */
                            private void A06() {
                                int iA01 = C1512bb.A01(this.A07.A04(2), this.A07.A04(2), this.A07.A04(2), this.A07.A04(2));
                                int iA04 = this.A07.A04(2);
                                int iA00 = C1512bb.A00(this.A07.A04(2), this.A07.A04(2), this.A07.A04(2));
                                if (this.A07.A0H()) {
                                    iA04 |= 4;
                                }
                                boolean zA0H = this.A07.A0H();
                                int iA042 = this.A07.A04(2);
                                int iA043 = this.A07.A04(2);
                                int iA044 = this.A07.A04(2);
                                this.A07.A09(8);
                                this.A02.A0D(iA01, iA00, zA0H, iA04, iA042, iA043, iA044);
                            }

                            public static void A09() {
                                byte[] bArr = {102, 110, -71, -85, -73, -69, -85, -76, -87, -85, 102, -76, -69, -77, -88, -85, -72, 102, -80, -13, 5, 2, 2, -11, -2, 4, -51, -106, -115, -28, -43, -46, -37, -115, -49, -39, -36, -48, -40, -64, -42, -25, -46, -115, -42, -32, -115, -99, 69, 87, AbstractJsonLexerKt.TC_INVALID, 115, -75, -56, -57, 115, -74, -56, -59, -59, -72, -63, -57, 115, -68, -63, -73, -72, -53, 115, -68, -58, 115, -77, -43, -47, -89, -96, -88, -76, -43, -45, -33, -44, -43, -30, 112, -94, -97, -97, -110, -101, -95, -103, -90, 77, -94, -101, -96, -94, -99, -99, -100, -97, -95, -110, -111, 77, 112, 124, 122, 122, 110, 123, 113, -116, 114, -123, -127, 94, 77, 112, -100, -102, -102, -114, -101, -111, 103, 77, -124, -74, -77, -77, -90, -81, -75, -83, -70, 97, -74, -81, -76, -74, -79, -79, -80, -77, -75, -90, -91, 97, -124, -112, -114, -114, -126, -113, -123, -96, -111, 114, 119, 97, -124, -80, -82, -82, -94, -81, -91, 123, 97, -73, -25, -23, -74, -42, -61, -44, -42, -34, -40, -25, -109, -40, -31, -41, -40, -41, -109, -29, -27, -40, -32, -44, -25, -24, -27, -40, -33, -20, -82, -109, -26, -36, -19, -40, -109, -36, -26, -109, -51, -10, -21, -9, -3, -10, -4, -19, -6, -19, -20, -88, -52, -36, -34, -53, -53, -25, -40, -55, -53, -45, -51, -36, -25, -52, -55, -36, -55, -88, -22, -19, -18, -9, -6, -19, -88, -52, -36, -34, -53, -53, -25, -40, -55, -53, -45, -51, -36, -25, -37, -36, -55, -38, -36, -46, -9, -1, -22, -11, -14, -19, -87, -52, -71, -87, -20, -8, -10, -10, -22, -9, -19, -61, -87, -59, -22, -14, -35, -24, -27, -32, -100, -65, -83, -100, -33, -21, -23, -23, -35, -22, -32, -74, -100, -88, -51, -43, -64, -53, -56, -61, AbstractJsonLexerKt.TC_INVALID, -90, -111, AbstractJsonLexerKt.TC_INVALID, -62, -57, -64, -47, -64, -62, -45, -60, -47, -103, AbstractJsonLexerKt.TC_INVALID, -34, 3, 11, -10, 1, -2, -7, -75, -36, -56, -75, -8, -3, -10, 7, -10, -8, 9, -6, 7, -49, -75, -92, -55, -47, -68, -57, -60, -65, 123, -67, -68, -50, -64, 123, -66, -54, -56, -56, -68, -55, -65, -107, 123, 101, -118, -110, 125, -120, -123, -128, 60, -127, -108, -112, -127, -118, -128, -127, -128, 60, AbstractJsonLexerKt.TC_INVALID, -117, -119, -119, 125, -118, -128, 86, 60, -38, -1, 7, -14, -3, -6, -11, -79, -10, 9, 5, -10, -1, -11, -10, -11, -79, 4, -10, 3, 7, -6, -12, -10, -79, -1, 6, -2, -13, -10, 3, -53, -79, -97, -79, -67, -63, -79, -70, -81, -79, 108, -70, -63, -71, -82, -79, -66, 108, -80, -75, -65, -81, -69, -70, -64, -75, -70, -63, -75, -64, -59, 122, 108, -68, -66, -79, -62, -75, -69, -63, -65, -119, -81, -95, -82, -78, -91, -97, -95, -118, -79, -87, -98, -95, -82, 92, -91, -81, 92, -86, -85, -86, 105, -74, -95, -82, -85, 92, 100};
                                if (A0C[4].length() == 22) {
                                    throw new RuntimeException();
                                }
                                String[] strArr = A0C;
                                strArr[1] = "IEVbL8fjtNym3uFOysNHbAZY8ahWoh0D";
                                strArr[0] = "eDwI1FqhTcB24RzcZ9uLwJRnNFvKe8FG";
                                A0B = bArr;
                            }

                            /* JADX WARN: Failed to parse debug info
                            java.lang.ArrayIndexOutOfBoundsException
                             */
                            private void A0E(int i11) {
                                C1512bb c1512bb = this.A0A[i11];
                                this.A07.A09(2);
                                boolean zA0H = this.A07.A0H();
                                boolean zA0H2 = this.A07.A0H();
                                boolean zA0H3 = this.A07.A0H();
                                int iA04 = this.A07.A04(3);
                                boolean zA0H4 = this.A07.A0H();
                                int iA042 = this.A07.A04(7);
                                int iA043 = this.A07.A04(8);
                                int iA044 = this.A07.A04(4);
                                int iA045 = this.A07.A04(4);
                                this.A07.A09(2);
                                int iA046 = this.A07.A04(6);
                                this.A07.A09(2);
                                c1512bb.A0F(zA0H, zA0H2, zA0H3, iA04, zA0H4, iA042, iA043, iA045, iA046, iA044, this.A07.A04(3), this.A07.A04(3));
                            }

                            static {
                                A09();
                            }

                            {
                                this.A06 = i5 == -1 ? 1 : i5;
                                this.A09 = list2 != null && Lv.A06(list2);
                                this.A0A = new C1512bb[8];
                                for (int i11 = 0; i11 < 8; i11++) {
                                    this.A0A[i11] = new C1512bb();
                                }
                                this.A02 = this.A0A[0];
                            }

                            private List<C1251Th> A01() {
                                C1511ba c1511baA05;
                                ArrayList arrayList = new ArrayList();
                                for (int i11 = 0; i11 < 8; i11++) {
                                    if (!this.A0A[i11].A0H() && this.A0A[i11].A0I() && (c1511baA05 = this.A0A[i11].A05()) != null) {
                                        arrayList.add(c1511baA05);
                                    }
                                }
                                Collections.sort(arrayList, C1511ba.A01());
                                ArrayList arrayList2 = new ArrayList(arrayList.size());
                                for (int i12 = 0; i12 < arrayList.size(); i12++) {
                                    C1251Th c1251Th = ((C1511ba) arrayList.get(i12)).A01;
                                    if (A0C[5].length() == 23) {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr = A0C;
                                    strArr[1] = "41CaR852DlJ2BhDjh2AP8v3NIBFEBlGj";
                                    strArr[0] = "TywRMMAHBICPmhYpNZDPCICO4KoykFOi";
                                    arrayList2.add(c1251Th);
                                }
                                return Collections.unmodifiableList(arrayList2);
                            }

                            private void A02() {
                                if (this.A03 == null) {
                                    return;
                                }
                                A07();
                                this.A03 = null;
                            }

                            private void A05() {
                                this.A07.A09(4);
                                int iA04 = this.A07.A04(4);
                                this.A07.A09(2);
                                int column = this.A07.A04(6);
                                this.A02.A0A(iA04, column);
                            }

                            @RequiresNonNull
                            private void A07() {
                                int i11 = this.A03.A00;
                                int i12 = (this.A03.A01 * 2) - 1;
                                String strA00 = A00(73, 13, 89);
                                if (i11 != i12) {
                                    MV.A04(strA00, A00(TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 39, 92) + ((this.A03.A01 * 2) - 1) + A00(50, 23, 60) + this.A03.A00 + A00(0, 18, 47) + this.A03.A02 + A00(48, 2, 5));
                                }
                                boolean z11 = false;
                                this.A07.A0E(this.A03.A03, this.A03.A00);
                                while (true) {
                                    C1083Mj c1083Mj = this.A07;
                                    String[] strArr = A0C;
                                    if (strArr[1].charAt(17) == strArr[0].charAt(17)) {
                                        throw new RuntimeException();
                                    }
                                    A0C[2] = "CfK0YniBgYBZajSDqb5Dx8cwwNPCbHUC";
                                    if (c1083Mj.A01() <= 0) {
                                        break;
                                    }
                                    int blockSize = this.A07.A04(3);
                                    int iA04 = this.A07.A04(5);
                                    if (blockSize == 7) {
                                        this.A07.A09(2);
                                        blockSize = this.A07.A04(6);
                                        if (blockSize < 7) {
                                            MV.A07(strA00, A00(399, 33, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE) + blockSize);
                                        }
                                    }
                                    if (iA04 == 0) {
                                        if (blockSize != 0) {
                                            MV.A07(strA00, A00(472, 27, 37) + blockSize + A00(27, 21, 86));
                                        }
                                    } else if (blockSize != this.A06) {
                                        this.A07.A0A(iA04);
                                    } else {
                                        int iA03 = this.A07.A03() + (iA04 * 8);
                                        while (this.A07.A03() < iA03) {
                                            int blockSize2 = this.A07.A04(8);
                                            if (blockSize2 != 16) {
                                                if (blockSize2 <= 31) {
                                                    A0A(blockSize2);
                                                } else if (blockSize2 <= 127) {
                                                    A0F(blockSize2);
                                                    z11 = true;
                                                } else if (blockSize2 <= 159) {
                                                    A0B(blockSize2);
                                                    z11 = true;
                                                } else if (blockSize2 <= 255) {
                                                    A0G(blockSize2);
                                                    z11 = true;
                                                } else {
                                                    MV.A07(strA00, A00(351, 22, 68) + blockSize2);
                                                }
                                            } else {
                                                int blockSize3 = this.A07.A04(8);
                                                if (blockSize3 <= 31) {
                                                    A0C(blockSize3);
                                                } else if (blockSize3 <= 127) {
                                                    A0H(blockSize3);
                                                    z11 = true;
                                                } else if (blockSize3 <= 159) {
                                                    A0D(blockSize3);
                                                } else if (blockSize3 <= 255) {
                                                    A0I(blockSize3);
                                                    z11 = true;
                                                } else {
                                                    MV.A07(strA00, A00(373, 26, 5) + blockSize3);
                                                }
                                            }
                                        }
                                    }
                                }
                                if (z11) {
                                    this.A04 = A01();
                                }
                            }

                            private void A08() {
                                for (int i11 = 0; i11 < 8; i11++) {
                                    this.A0A[i11].A08();
                                }
                            }

                            private void A0A(int i11) {
                                switch (i11) {
                                    case 0:
                                    case 14:
                                        return;
                                    case 3:
                                        List<C1251Th> listA01 = A01();
                                        if (A0C[5].length() == 23) {
                                            throw new RuntimeException();
                                        }
                                        A0C[2] = "zXgpNOi8fn3mVrAAHoymcRG2SZM82uOw";
                                        this.A04 = listA01;
                                        return;
                                    case 8:
                                        this.A02.A06();
                                        return;
                                    case 12:
                                        A08();
                                        return;
                                    case 13:
                                        this.A02.A09('\n');
                                        return;
                                    default:
                                        String strA00 = A00(73, 13, 89);
                                        String[] strArr = A0C;
                                        if (strArr[1].charAt(17) != strArr[0].charAt(17)) {
                                            A0C[4] = "GuV6";
                                            if (i11 >= 17 && i11 <= 23) {
                                                MV.A07(strA00, A00(86, 44, 22) + i11);
                                                this.A07.A09(8);
                                                return;
                                            } else if (i11 >= 24 && i11 <= 31) {
                                                MV.A07(strA00, A00(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 43, 42) + i11);
                                                this.A07.A09(16);
                                                return;
                                            } else {
                                                MV.A07(strA00, A00(267, 20, 114) + i11);
                                                return;
                                            }
                                        }
                                        throw new RuntimeException();
                                }
                            }

                            private void A0B(int i11) {
                                switch (i11) {
                                    case 128:
                                    case EMPTY_TPAT_ERROR_VALUE:
                                    case MRAID_DOWNLOAD_JS_ERROR_VALUE:
                                    case MRAID_JS_WRITE_FAILED_VALUE:
                                    case OMSDK_DOWNLOAD_JS_ERROR_VALUE:
                                    case OMSDK_JS_WRITE_FAILED_VALUE:
                                    case STORE_REGION_CODE_ERROR_VALUE:
                                    case INVALID_CONFIG_RESPONSE_VALUE:
                                        int i12 = i11 - 128;
                                        int window = this.A00;
                                        if (window != i12) {
                                            this.A00 = i12;
                                            this.A02 = this.A0A[i12];
                                            break;
                                        }
                                        break;
                                    case PRIVACY_URL_ERROR_VALUE:
                                        for (int i13 = 1; i13 <= 8; i13++) {
                                            if (this.A07.A0H()) {
                                                int i14 = 8 - i13;
                                                this.A0A[i14].A07();
                                            }
                                        }
                                        break;
                                    case TPAT_RETRY_FAILED_VALUE:
                                        for (int i15 = 1; i15 <= 8; i15++) {
                                            if (this.A07.A0H()) {
                                                int i16 = 8 - i15;
                                                this.A0A[i16].A0E(true);
                                            }
                                        }
                                        break;
                                    case CONFIG_REFRESH_FAILED_VALUE:
                                        for (int i17 = 1; i17 <= 8; i17++) {
                                            if (this.A07.A0H()) {
                                                int i18 = 8 - i17;
                                                this.A0A[i18].A0E(false);
                                            }
                                        }
                                        break;
                                    case 139:
                                        for (int i19 = 1; i19 <= 8; i19++) {
                                            if (this.A07.A0H()) {
                                                int i21 = 8 - i19;
                                                this.A0A[i21].A0E(!r1.A0I());
                                            }
                                        }
                                        break;
                                    case 140:
                                        for (int i22 = 1; i22 <= 8; i22++) {
                                            if (this.A07.A0H()) {
                                                int i23 = 8 - i22;
                                                this.A0A[i23].A08();
                                            }
                                        }
                                        break;
                                    case 141:
                                        this.A07.A09(8);
                                        break;
                                    case 142:
                                        break;
                                    case 143:
                                        A08();
                                        break;
                                    case 144:
                                        if (!this.A02.A0G()) {
                                            this.A07.A09(16);
                                            break;
                                        } else {
                                            A03();
                                            break;
                                        }
                                    case 145:
                                        if (!this.A02.A0G()) {
                                            this.A07.A09(24);
                                            break;
                                        } else {
                                            A04();
                                            break;
                                        }
                                    case 146:
                                        if (!this.A02.A0G()) {
                                            this.A07.A09(16);
                                            break;
                                        } else {
                                            A05();
                                            break;
                                        }
                                    case 147:
                                    case 148:
                                    case 149:
                                    case PerAppFeatureCatalog.MAX_TOOLS /* 150 */:
                                    default:
                                        MV.A07(A00(73, 13, 89), A00(287, 20, 101) + i11);
                                        break;
                                    case 151:
                                        if (!this.A02.A0G()) {
                                            this.A07.A09(32);
                                            break;
                                        } else {
                                            A06();
                                            break;
                                        }
                                    case 152:
                                    case 153:
                                    case 154:
                                    case 155:
                                    case 156:
                                    case 157:
                                    case 158:
                                    case 159:
                                        int i24 = i11 - 152;
                                        A0E(i24);
                                        int window2 = this.A00;
                                        if (window2 != i24) {
                                            this.A00 = i24;
                                            this.A02 = this.A0A[i24];
                                            break;
                                        }
                                        break;
                                }
                            }

                            private void A0C(int i11) {
                                if (i11 <= 7) {
                                    return;
                                }
                                if (i11 <= 15) {
                                    this.A07.A09(8);
                                    return;
                                }
                                if (A0C[2].charAt(13) == 'I') {
                                    throw new RuntimeException();
                                }
                                String[] strArr = A0C;
                                strArr[1] = "JR2n817sh95PTOSqww1hgEyLKKQ0p2pj";
                                strArr[0] = "eLgG8MLXBTHAZ6Xs7lB3Q6qMQmPTnKZd";
                                if (i11 <= 23) {
                                    this.A07.A09(16);
                                } else {
                                    if (i11 > 31) {
                                        return;
                                    }
                                    this.A07.A09(24);
                                }
                            }

                            private void A0D(int i11) {
                                if (i11 <= 135) {
                                    this.A07.A09(32);
                                    return;
                                }
                                if (i11 <= 143) {
                                    this.A07.A09(40);
                                } else {
                                    if (i11 > 159) {
                                        return;
                                    }
                                    this.A07.A09(2);
                                    int length = this.A07.A04(6);
                                    this.A07.A09(length * 8);
                                }
                            }

                            private void A0F(int i11) {
                                if (i11 == 127) {
                                    this.A02.A09((char) 9835);
                                } else {
                                    this.A02.A09((char) (i11 & 255));
                                }
                            }

                            private void A0G(int i11) {
                                this.A02.A09((char) (i11 & 255));
                            }

                            private void A0H(int i11) {
                                switch (i11) {
                                    case 32:
                                        this.A02.A09(' ');
                                        return;
                                    case 33:
                                        this.A02.A09((char) 160);
                                        return;
                                    case 37:
                                        this.A02.A09((char) 8230);
                                        return;
                                    case 42:
                                        this.A02.A09((char) 352);
                                        return;
                                    case 44:
                                        this.A02.A09((char) 338);
                                        return;
                                    case 48:
                                        this.A02.A09((char) 9608);
                                        return;
                                    case 49:
                                        this.A02.A09((char) 8216);
                                        return;
                                    case 50:
                                        C1512bb c1512bb = this.A02;
                                        if (A0C[2].charAt(13) != 'I') {
                                            A0C[2] = "dhWUuAwdVMrp6MrXgZUlvzNpGy6KWNlB";
                                            c1512bb.A09((char) 8217);
                                            return;
                                        } else {
                                            A0C[4] = "5ptZzseBFh92AYCOfZHHL49Br";
                                            c1512bb.A09((char) 8217);
                                            return;
                                        }
                                    case 51:
                                        this.A02.A09((char) 8220);
                                        return;
                                    case 52:
                                        this.A02.A09((char) 8221);
                                        return;
                                    case 53:
                                        this.A02.A09((char) 8226);
                                        return;
                                    case 57:
                                        C1512bb c1512bb2 = this.A02;
                                        if (A0C[4].length() == 22) {
                                            throw new RuntimeException();
                                        }
                                        A0C[4] = "271ZhtKPeMEwZVI7uJ5TCKwYr8";
                                        c1512bb2.A09((char) 8482);
                                        return;
                                    case 58:
                                        this.A02.A09((char) 353);
                                        return;
                                    case 60:
                                        this.A02.A09((char) 339);
                                        return;
                                    case 61:
                                        this.A02.A09((char) 8480);
                                        return;
                                    case 63:
                                        this.A02.A09((char) 376);
                                        return;
                                    case PROTOBUF_SERIALIZATION_ERROR_VALUE:
                                        this.A02.A09((char) 8539);
                                        return;
                                    case JSON_ENCODE_ERROR_VALUE:
                                        this.A02.A09((char) 8540);
                                        return;
                                    case 120:
                                        this.A02.A09((char) 8541);
                                        return;
                                    case TPAT_ERROR_VALUE:
                                        this.A02.A09((char) 8542);
                                        return;
                                    case INVALID_ADS_ENDPOINT_VALUE:
                                        this.A02.A09((char) 9474);
                                        return;
                                    case INVALID_RI_ENDPOINT_VALUE:
                                        this.A02.A09((char) 9488);
                                        return;
                                    case INVALID_LOG_ERROR_ENDPOINT_VALUE:
                                        C1512bb c1512bb3 = this.A02;
                                        if (A0C[2].charAt(13) != 'I') {
                                            A0C[2] = "7jtVWfiMO5taYpVp1TdCvykx3ef1pdrL";
                                            c1512bb3.A09((char) 9492);
                                            return;
                                        }
                                        break;
                                    case INVALID_METRICS_ENDPOINT_VALUE:
                                        this.A02.A09((char) 9472);
                                        return;
                                    case ASSET_FAILED_INSUFFICIENT_SPACE_VALUE:
                                        C1512bb c1512bb4 = this.A02;
                                        if (A0C[3].length() != 11) {
                                            A0C[5] = "WLVd2BsLGUE7Vnh";
                                            c1512bb4.A09((char) 9496);
                                            return;
                                        }
                                        break;
                                    case ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE:
                                        this.A02.A09((char) 9484);
                                        return;
                                    default:
                                        MV.A07(A00(73, 13, 89), A00(Sdk.SDKError.Reason.AD_EXPIRED_ON_PLAY_VALUE, 22, 72) + i11);
                                        return;
                                }
                                throw new RuntimeException();
                            }

                            private void A0I(int i11) {
                                if (i11 == 160) {
                                    this.A02.A09((char) 13252);
                                    return;
                                }
                                MV.A07(A00(73, 13, 89), A00(329, 22, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) + i11);
                                this.A02.A09('_');
                            }

                            @Override // com.facebook.ads.redexgen.X.AnonymousClass89
                            /* renamed from: A0W */
                            public final /* bridge */ /* synthetic */ C8B A6Q() throws C1135Oj {
                                return super.A6Q();
                            }

                            @Override // com.facebook.ads.redexgen.X.AnonymousClass89
                            /* renamed from: A0X */
                            public final /* bridge */ /* synthetic */ C8A A6S() throws C1135Oj {
                                return super.A6S();
                            }

                            @Override // com.facebook.ads.redexgen.X.AnonymousClass89
                            public final C1133Oh A0Z() {
                                this.A05 = this.A04;
                                return new C1133Oh((List) AbstractC1062Ln.A01(this.A04));
                            }

                            @Override // com.facebook.ads.redexgen.X.AnonymousClass89
                            /* renamed from: A0a */
                            public final /* bridge */ /* synthetic */ void AIW(C8B c8b) throws C1135Oj {
                                super.AIW(c8b);
                            }

                            @Override // com.facebook.ads.redexgen.X.AnonymousClass89
                            public final void A0b(C8B c8b) {
                                ByteBuffer byteBuffer = (ByteBuffer) AbstractC1062Ln.A01(c8b.A02);
                                this.A08.A0j(byteBuffer.array(), byteBuffer.limit());
                                while (this.A08.A07() >= 3) {
                                    int iA0I = this.A08.A0I() & 7;
                                    int i11 = iA0I & 3;
                                    boolean z11 = (iA0I & 4) == 4;
                                    byte bA0I = (byte) this.A08.A0I();
                                    byte bA0I2 = (byte) this.A08.A0I();
                                    if (i11 == 2 || i11 == 3) {
                                        if (z11) {
                                            String strA00 = A00(73, 13, 89);
                                            if (i11 == 3) {
                                                A02();
                                                int packetSize = (bA0I & 192) >> 6;
                                                if (this.A01 != -1 && packetSize != (this.A01 + 1) % 4) {
                                                    A08();
                                                    MV.A07(strA00, A00(432, 40, 53) + this.A01 + A00(18, 9, Sdk.SDKError.Reason.TPAT_ERROR_VALUE) + packetSize);
                                                }
                                                this.A01 = packetSize;
                                                int i12 = bA0I & 63;
                                                if (i12 == 0) {
                                                    i12 = 64;
                                                }
                                                this.A03 = new C1513bc(packetSize, i12);
                                                byte[] inputBufferData = this.A03.A03;
                                                C1513bc c1513bc = this.A03;
                                                int i13 = c1513bc.A00;
                                                c1513bc.A00 = i13 + 1;
                                                inputBufferData[i13] = bA0I2;
                                            } else {
                                                AbstractC1062Ln.A07(i11 == 2);
                                                if (this.A03 == null) {
                                                    MV.A05(strA00, A00(Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE, 55, 113));
                                                } else {
                                                    byte[] inputBufferData2 = this.A03.A03;
                                                    C1513bc c1513bc2 = this.A03;
                                                    int i14 = c1513bc2.A00;
                                                    c1513bc2.A00 = i14 + 1;
                                                    inputBufferData2[i14] = bA0I;
                                                    byte[] inputBufferData3 = this.A03.A03;
                                                    C1513bc c1513bc3 = this.A03;
                                                    int i15 = c1513bc3.A00;
                                                    c1513bc3.A00 = i15 + 1;
                                                    inputBufferData3[i15] = bA0I2;
                                                }
                                            }
                                            if (this.A03.A00 == (this.A03.A01 * 2) - 1) {
                                                A02();
                                            }
                                        }
                                    }
                                }
                            }

                            @Override // com.facebook.ads.redexgen.X.AnonymousClass89
                            public final boolean A0d() {
                                return this.A04 != this.A05;
                            }

                            @Override // com.facebook.ads.redexgen.X.AnonymousClass89, com.facebook.ads.redexgen.X.InterfaceC1115Np
                            public final /* bridge */ /* synthetic */ void AIp() {
                                super.AIp();
                            }

                            @Override // com.facebook.ads.redexgen.X.AnonymousClass89, com.facebook.ads.redexgen.X.InterfaceC1136Ok
                            public final /* bridge */ /* synthetic */ void AKz(long j11) {
                                super.AKz(j11);
                            }

                            @Override // com.facebook.ads.redexgen.X.AnonymousClass89, com.facebook.ads.redexgen.X.InterfaceC1115Np
                            public final void flush() {
                                super.flush();
                                this.A04 = null;
                                this.A05 = null;
                                this.A00 = 0;
                                this.A02 = this.A0A[this.A00];
                                A08();
                                this.A03 = null;
                            }
                        };
                    case '\t':
                        final List<byte[]> list3 = vc.A0X;
                        return new C8C(list3) { // from class: com.facebook.ads.redexgen.X.44
                            public static byte[] A01;
                            public final C1525bo A00;

                            static {
                                A01();
                            }

                            /* JADX WARN: Failed to parse debug info
                            java.lang.ArrayIndexOutOfBoundsException
                             */
                            {
                                super(A00(0, 10, 58));
                                C1084Mk c1084Mk = new C1084Mk(list3.get(0));
                                this.A00 = new C1525bo(c1084Mk.A0M(), c1084Mk.A0M());
                            }

                            public static String A00(int i11, int i12, int i13) {
                                byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i11, i11 + i12);
                                for (int i14 = 0; i14 < bArrCopyOfRange.length; i14++) {
                                    bArrCopyOfRange[i14] = (byte) ((bArrCopyOfRange[i14] ^ i13) ^ 72);
                                }
                                return new String(bArrCopyOfRange);
                            }

                            public static void A01() {
                                A01 = new byte[]{54, 4, 16, 54, 23, 17, 29, 22, 23, 0};
                            }

                            @Override // com.facebook.ads.redexgen.X.C8C
                            public final InterfaceC1506bV A0g(byte[] bArr, int i11, boolean z11) {
                                if (z11) {
                                    this.A00.A0J();
                                }
                                return new C1132Og(this.A00.A0I(bArr, i11));
                            }
                        };
                    case '\n':
                        return new C8C() { // from class: com.facebook.ads.redexgen.X.43
                            public static byte[] A04;
                            public static String[] A05 = {"3AJEQxRXPp4Rm0ZyH", "wy8ZQWuOIz4K7qTVtXaRXiEJG5Llo6sV", "S46AIoOCh192Q5pb2", "Sg35VX5z7QDjswjLDybvza84gF0rozVw", "kJIi5xXsdUwMILg3N0Df7YANmgAdjt5d", "Rp0Yl03ANXOJNy", "7QoQUdrMrD", "DdBZLl5GiXUPpPfKi"};
                            public Inflater A00;
                            public final C1084Mk A01;
                            public final C1084Mk A02;
                            public final C1528br A03;

                            public static String A01(int i11, int i12, int i13) {
                                byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i11, i11 + i12);
                                for (int i14 = 0; i14 < bArrCopyOfRange.length; i14++) {
                                    bArrCopyOfRange[i14] = (byte) ((bArrCopyOfRange[i14] ^ i13) ^ 103);
                                }
                                return new String(bArrCopyOfRange);
                            }

                            public static void A02() {
                                byte[] bArr = {13, 58, 46, 25, 56, 62, 50, 57, 56, 47};
                                if (A05[7].length() != 17) {
                                    throw new RuntimeException();
                                }
                                A05[6] = "D2COK1qTPO";
                                A04 = bArr;
                            }

                            static {
                                A02();
                            }

                            {
                                A01(0, 10, 58);
                                this.A01 = new C1084Mk();
                                this.A02 = new C1084Mk();
                                this.A03 = new C1528br();
                            }

                            public static C1251Th A00(C1084Mk c1084Mk, C1528br c1528br) {
                                int sectionLength = c1084Mk.A0A();
                                int sectionType = c1084Mk.A0I();
                                int limit = c1084Mk.A0M();
                                int iA09 = c1084Mk.A09() + limit;
                                if (iA09 > sectionLength) {
                                    c1084Mk.A0f(sectionLength);
                                    return null;
                                }
                                C1251Th c1251ThA06 = null;
                                switch (sectionType) {
                                    case 20:
                                        c1528br.A02(c1084Mk, limit);
                                        break;
                                    case 21:
                                        c1528br.A00(c1084Mk, limit);
                                        break;
                                    case 22:
                                        c1528br.A01(c1084Mk, limit);
                                        break;
                                    case 128:
                                        c1251ThA06 = c1528br.A06();
                                        int sectionType2 = A05[6].length();
                                        if (sectionType2 == 10) {
                                            A05[7] = "58RsgqCBPGQZ5OLBi";
                                            c1528br.A07();
                                            break;
                                        } else {
                                            throw new RuntimeException();
                                        }
                                }
                                c1084Mk.A0f(iA09);
                                return c1251ThA06;
                            }

                            private void A03(C1084Mk c1084Mk) {
                                if (c1084Mk.A07() > 0 && c1084Mk.A0B() == 120) {
                                    if (this.A00 == null) {
                                        this.A00 = new Inflater();
                                    }
                                    if (N1.A1D(c1084Mk, this.A02, this.A00)) {
                                        c1084Mk.A0j(this.A02.A0l(), this.A02.A0A());
                                    }
                                }
                            }

                            @Override // com.facebook.ads.redexgen.X.C8C
                            public final InterfaceC1506bV A0g(byte[] bArr, int i11, boolean z11) throws C1135Oj {
                                this.A01.A0j(bArr, i11);
                                A03(this.A01);
                                this.A03.A07();
                                ArrayList arrayList = new ArrayList();
                                while (this.A01.A07() >= 3) {
                                    C1251Th c1251ThA00 = A00(this.A01, this.A03);
                                    if (c1251ThA00 != null) {
                                        arrayList.add(c1251ThA00);
                                    }
                                }
                                return new C1131Of(Collections.unmodifiableList(arrayList));
                            }
                        };
                    default:
                        throw new IllegalArgumentException(A00(0, 50, 12));
                }
            case -1248334819:
                if (str.equals(A00(107, 15, 33))) {
                    c11 = '\n';
                }
                switch (c11) {
                }
            case -1026075066:
                String[] strArr = A02;
                if (strArr[7].length() == strArr[0].length()) {
                    throw new RuntimeException();
                }
                A02[5] = "67zu9xHwNhmcBMqKb";
                if (str.equals(A00(167, 21, 115))) {
                    c11 = 2;
                }
                switch (c11) {
                }
            case -1004728940:
                if (str.equals(A00(236, 8, 64))) {
                    c11 = 0;
                }
                switch (c11) {
                }
            case 691401887:
                if (str.equals(A00(188, 28, 12))) {
                    c11 = 5;
                }
                switch (c11) {
                }
            case 822864842:
                if (str.equals(A00(244, 10, 74))) {
                    c11 = 1;
                }
                switch (c11) {
                }
            case 930165504:
                if (str.equals(A00(142, 25, 13))) {
                    c11 = 7;
                }
                switch (c11) {
                }
            case 1566015601:
                if (str.equals(A00(50, 19, 93))) {
                    c11 = 6;
                }
                switch (c11) {
                }
            case 1566016562:
                if (str.equals(A00(69, 19, 81))) {
                    c11 = '\b';
                }
                switch (c11) {
                }
            case 1668750253:
                if (str.equals(A00(Sdk.SDKError.Reason.AD_RESPONSE_INVALID_TEMPLATE_TYPE_VALUE, 20, 35))) {
                    c11 = 4;
                }
                switch (c11) {
                }
            case 1693976202:
                if (str.equals(A00(Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, 20, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE))) {
                    c11 = 3;
                }
                switch (c11) {
                }
        }
    }

    @Override // com.facebook.ads.redexgen.X.WB
    public final boolean ALg(VC vc) {
        String str = vc.A0W;
        String mimeType = A00(236, 8, 64);
        if (!mimeType.equals(str)) {
            String mimeType2 = A00(244, 10, 74);
            if (!mimeType2.equals(str)) {
                String strA00 = A00(Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, 20, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
                String mimeType3 = A02[5];
                if (mimeType3.length() != 32) {
                    String[] strArr = A02;
                    strArr[7] = "Gnyhutr293vH";
                    strArr[0] = "26b8fiDZGhRGw";
                    if (!strA00.equals(str)) {
                        String[] strArr2 = A02;
                        String str2 = strArr2[7];
                        String mimeType4 = strArr2[0];
                        if (str2.length() != mimeType4.length()) {
                            String[] strArr3 = A02;
                            strArr3[4] = "wD19EscZ3Anh9t64unIfECEUU9J1awUj";
                            strArr3[6] = "47akpO0sJfQt9W3qPQTcJ37OSB1CEhzE";
                            String mimeType5 = A00(167, 21, 115);
                            if (!mimeType5.equals(str)) {
                                String mimeType6 = A00(Sdk.SDKError.Reason.AD_RESPONSE_INVALID_TEMPLATE_TYPE_VALUE, 20, 35);
                                if (!mimeType6.equals(str)) {
                                    String[] strArr4 = A02;
                                    if (strArr4[4].charAt(12) == strArr4[6].charAt(12)) {
                                        String[] strArr5 = A02;
                                        strArr5[7] = "ibTKBHkab6VU";
                                        strArr5[0] = "3pDH8sFnKWyBK";
                                        String mimeType7 = A00(188, 28, 12);
                                        if (!mimeType7.equals(str)) {
                                            String mimeType8 = A00(50, 19, 93);
                                            if (!mimeType8.equals(str)) {
                                                String mimeType9 = A00(142, 25, 13);
                                                if (!mimeType9.equals(str)) {
                                                    String mimeType10 = A00(69, 19, 81);
                                                    if (!mimeType10.equals(str)) {
                                                        String mimeType11 = A00(88, 19, 3);
                                                        if (!mimeType11.equals(str)) {
                                                            String mimeType12 = A00(107, 15, 33);
                                                            if (!mimeType12.equals(str)) {
                                                                return false;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                throw new RuntimeException();
            }
        }
        return true;
    }
}
