package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.XmlResourceParser;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.util.Arrays;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicReference;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* renamed from: com.facebook.ads.redexgen.X.pY, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2360pY {
    public static int A00;
    public static byte[] A01;
    public static String[] A02 = {"W5GQ1A2ylrhjGcW6pMhO2KpBuuMbjdB5", "Zx6aawmOn04orHuEArp9Y", "DMoITyb3L57ZarlqFv80uTh", "nsJ3", "1RYBeERStpTg7BOn5NhEUzstvZKMnlwS", "VuYSQW8JaBTDlxPB8JxFHKy", b.f42142b, "NX"};
    public static final AtomicReference<Boolean> A03;
    public static volatile EnumC2359pX A04;

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 58);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A01 = new byte[]{60, 19, 25, 15, 18, 20, 25, 48, 28, 19, 20, 27, 24, 14, 9, 83, 5, 16, 17, 123, 121, 110, 115, 108, 115, 110, 99, 22, 7, 7, 27, 30, 20, 22, 3, 30, 24, 25, 24, 26, 17, 26, 13, 22, 28, 77, 73, 78, 115, 68, 75, 118, 69, 82, 83, 73, 79, 78, 17, 6, 16, 10, 25, 6, 2, 1, 15, 6, 34, 0, 23, 10, 21, 10, 23, 26, 122, 124, 106, 124, 34, 124, 107, 100};
    }

    static {
        A07();
        A00 = -1;
        A04 = EnumC2359pX.A04;
        A03 = new AtomicReference<>(null);
    }

    public static int A01(Context context) {
        if (A04 == EnumC2359pX.A04) {
            A08(context);
        }
        return A00;
    }

    public static int A02(Context context) {
        try {
            XmlResourceParser parser = context.getAssets().openXmlResourceParser(A06(0, 19, 71));
            return A05(parser);
        } catch (Throwable unused) {
            return 0;
        }
    }

    public static int A03(Context context) {
        try {
            return context.getPackageManager().getApplicationInfo(context.getPackageName(), 0).minSdkVersion;
        } catch (PackageManager.NameNotFoundException unused) {
            return 0;
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:10:0x0027 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A05(XmlPullParser xmlPullParser) throws XmlPullParserException, NumberFormatException, IOException {
        while (xmlPullParser.next() != 1) {
            if (xmlPullParser.getEventType() == 2 && xmlPullParser.getName().equals(A06(76, 8, 53))) {
                for (int i5 = 0; i5 < i; i5++) {
                    if (xmlPullParser.getAttributeName(i5).equals(A06(45, 13, 26))) {
                        int i11 = Integer.parseInt(xmlPullParser.getAttributeValue(i5));
                        return i11;
                    }
                }
            }
        }
        return 0;
    }

    public static void A08(Context context) {
        if (A0B()) {
            return;
        }
        A09(context);
    }

    public static void A09(Context context) {
        if (A04 != EnumC2359pX.A04) {
            return;
        }
        A04 = EnumC2359pX.A03;
        Executors.newSingleThreadExecutor().execute(new GB(context));
    }

    public static void A0A(C2095lA c2095lA, Throwable th2) {
        c2095lA.A08().ABz(A06(38, 7, 69), AbstractC2126lf.A1c, new C2127lg(th2));
    }

    public static boolean A0B() {
        return A04 == EnumC2359pX.A02;
    }

    public static boolean A0C(C2095lA c2095lA) {
        Boolean cachedValue = A03.get();
        if (cachedValue != null) {
            return cachedValue.booleanValue();
        }
        XmlResourceParser xmlResourceParserOpenXmlResourceParser = null;
        boolean z11 = true;
        try {
            xmlResourceParserOpenXmlResourceParser = c2095lA.getAssets().openXmlResourceParser(A06(0, 19, 71));
            loop0: while (true) {
                if (xmlResourceParserOpenXmlResourceParser.next() == 1) {
                    break;
                }
                if (xmlResourceParserOpenXmlResourceParser.getEventType() == 2 && (xmlResourceParserOpenXmlResourceParser.getName().equals(A06(27, 11, 77)) || xmlResourceParserOpenXmlResourceParser.getName().equals(A06(19, 8, 32)))) {
                    for (int i5 = 0; i5 < xmlResourceParserOpenXmlResourceParser.getAttributeCount(); i5++) {
                        if (xmlResourceParserOpenXmlResourceParser.getAttributeName(i5).equals(A06(58, 18, 89)) && !Boolean.parseBoolean(xmlResourceParserOpenXmlResourceParser.getAttributeValue(i5))) {
                            z11 = false;
                            break loop0;
                        }
                    }
                }
            }
        } catch (Throwable th2) {
            A0A(c2095lA, th2);
            String[] strArr = A02;
            if (strArr[5].length() != strArr[2].length()) {
                throw new RuntimeException();
            }
            A02[0] = "eeMQW8Hjee4jIvBA7BhrF0CVQhVUWKRk";
            if (xmlResourceParserOpenXmlResourceParser != null) {
                try {
                    xmlResourceParserOpenXmlResourceParser.close();
                } catch (Exception e3) {
                    A0A(c2095lA, e3);
                }
            }
        }
        A03.set(Boolean.valueOf(z11));
        return z11;
    }
}
