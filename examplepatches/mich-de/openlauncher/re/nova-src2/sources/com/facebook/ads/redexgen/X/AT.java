package com.facebook.ads.redexgen.X;

import android.net.TrafficStats;
import android.text.TextUtils;
import android.util.Log;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.net.URL;
import java.nio.charset.Charset;
import java.security.cert.CertificateException;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import javax.net.ssl.HttpsURLConnection;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class AT implements InterfaceC1529bs {
    public static byte[] A07;
    public static String[] A08 = {"Z3ZBH3trhaxMswGoeO0i3WMhBsCqcWgs", "P814sFImmOC", "INcscN3Z5kcfIuBeknVxelrdNm8ANoXs", "RvJjsajerkLdUat3TDI8NPR3DDSWtO", "ZLSXhw", "wxtWSqUF9a7Aw2d1StIocmcoa4QX", "58xAXbC3p", "Zj1UZNXOzFX"};
    public static final String A09;
    public InterfaceC2125le A00;
    public Executor A01;
    public boolean A02;
    public C1505bU A03;
    public final InterfaceC1491bG A04 = new AZ();
    public final InterfaceC1473ay A05;
    public final InterfaceC1469au A06;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 15 out of bounds for length 11
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.restartVar(DebugInfoParser.java:193)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:141)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private final InterfaceC1533bw A01(AbstractC1480b5 abstractC1480b5) throws C1476b1 {
        String strA07 = A07(Sdk.SDKError.Reason.AD_RESPONSE_RETRY_AFTER_VALUE, 7, 7);
        HttpURLConnection httpURLConnection = null;
        AU auA05 = null;
        boolean z11 = false;
        try {
            try {
                this.A02 = false;
                HttpURLConnection httpURLConnectionA08 = A08(abstractC1480b5.A07(), C2353pR.A04() ? A09() : null);
                A0H(httpURLConnectionA08, abstractC1480b5);
                A0G(httpURLConnectionA08, abstractC1480b5);
                if (this.A06.ABH()) {
                    this.A06.ACi(httpURLConnectionA08, abstractC1480b5.A08());
                }
                httpURLConnectionA08.connect();
                this.A02 = true;
                Set<String> setA01 = this.A03.A01();
                Set<String> setA02 = this.A03.A02();
                boolean z12 = (setA01 == null || setA01.isEmpty()) ? false : true;
                if (setA02 != null && !setA02.isEmpty()) {
                    z11 = true;
                }
                if ((httpURLConnectionA08 instanceof HttpsURLConnection) && (z12 || z11)) {
                    try {
                        AbstractC1466ar.A03((HttpsURLConnection) httpURLConnectionA08, setA01, setA02);
                    } catch (CertificateException e3) {
                        this.A00.ACp(strA07, AbstractC2126lf.A1z, new C2127lg(e3));
                    } catch (Exception e11) {
                        this.A00.ACp(strA07, AbstractC2126lf.A1y, new C2127lg(e11));
                    }
                }
                if (httpURLConnectionA08.getDoOutput() && abstractC1480b5.A08() != null) {
                    A00(httpURLConnectionA08, abstractC1480b5.A08());
                }
                AU auA06 = httpURLConnectionA08.getDoInput() ? A06(httpURLConnectionA08) : new AU(httpURLConnectionA08, null);
                if (this.A06.ABH()) {
                    this.A06.ACj(auA06);
                }
                if (httpURLConnectionA08 != null) {
                    httpURLConnectionA08.disconnect();
                }
                return auA06;
            } catch (Exception e12) {
                try {
                    try {
                        auA05 = A05(null);
                        if (auA05 == null || auA05.A9p() <= 0) {
                            throw new C1476b1(e12, auA05);
                        }
                        if (this.A06.ABH()) {
                            this.A06.ACj(auA05);
                        }
                        if (0 != 0) {
                            httpURLConnection.disconnect();
                        }
                        return auA05;
                    } catch (Exception unused) {
                        Log.e(getClass().getSimpleName(), A07(Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, 13, 53), e12);
                        if (auA05 == null || auA05.A9p() <= 0) {
                            throw new C1476b1(e12, auA05);
                        }
                        if (this.A06.ABH()) {
                            InterfaceC1469au interfaceC1469au = this.A06;
                            String[] strArr = A08;
                            if (strArr[0].charAt(28) == strArr[2].charAt(28)) {
                                throw new RuntimeException();
                            }
                            String[] strArr2 = A08;
                            strArr2[0] = "IlkFDbfWlXmKaUvETbHYmdNk6OEHYi1H";
                            strArr2[2] = "BN3YcSqfdOqAJI6hng3gZMbRThXyngdJ";
                            interfaceC1469au.ACj(auA05);
                        }
                        if (0 != 0) {
                            httpURLConnection.disconnect();
                        }
                        return auA05;
                    }
                } catch (Throwable unused2) {
                    if (auA05 == null || auA05.A9p() <= 0) {
                        throw new C1476b1(e12, auA05);
                    }
                    if (this.A06.ABH()) {
                        this.A06.ACj(auA05);
                    }
                    if (0 != 0) {
                        httpURLConnection.disconnect();
                    }
                    return auA05;
                }
            }
        } catch (Throwable th2) {
            if (this.A06.ABH()) {
                this.A06.ACj(auA05);
            }
            if (0 != 0) {
                httpURLConnection.disconnect();
            }
            throw th2;
        }
    }

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 93);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A07 = new byte[]{16, 18, 55, 58, 95, 55, 53, 74, 71, 14, 74, 72, 15, 76, 90, 93, 67, 15, 14, 71, 93, 14, 64, 65, 90, 14, 79, 14, 88, 79, 66, 71, 74, 14, 123, 124, 98, 14, 65, 72, 14, 94, 102, 106, 9, 30, 106, 119, 106, 28, 16, 98, 100, 16, 13, 16, 55, 59, 111, 105, 98, 114, 117, 124, 59, 81, 17, 59, 50, 63, 46, 45, 59, 58, 94, 42, 55, 51, 59, 94, 67, 94, 1, 35, 50, 50, 47, 40, 33, 102, 50, 46, 35, 102, 46, 50, 50, 54, 102, 52, 35, 53, 54, 41, 40, 53, 35, 102, 50, 47, 43, 35, 34, 102, 41, 51, 50, 38, 13, 28, 31, 7, 26, 3, 72, 13, 26, 26, 7, 26, 34, 35, 49, 90, 79, 122, 107, 107, 119, 114, 120, 122, 111, 114, 116, 117, 52, 99, 54, 108, 108, 108, 54, 125, 116, 105, 118, 54, 110, 105, 119, 126, 117, 120, 116, AbstractJsonLexerKt.TC_INVALID, 126, AbstractJsonLexerKt.TC_INVALID, 32, 120, 115, 122, 105, 104, 126, 111, 38, 78, 79, 93, 54, 35, 47, 57, 62, 32, 108, 97, 39, 108, 97, 37, 24, 4, 4, 0, 94, 0, 2, 31, 8, 9, 56, 31, 3, 4, AbstractJsonLexerKt.TC_INVALID, 99, 99, 103, 57, 103, 101, 120, 111, 110, 71, 120, 101, 99, 52, 63, 46, 45, 53, 40, 49};
    }

    /* JADX WARN: Code restructure failed: missing block: B:64:0x017c, code lost:
    
        r7 = r29.A00;
        r10 = java.lang.System.currentTimeMillis() - r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0185, code lost:
    
        if (r30.A04 != null) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0187, code lost:
    
        r2 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0189, code lost:
    
        r7.ACc(r0, r10, 0, r2, 0, new java.util.concurrent.TimeoutException(A07(82, 35, 27)));
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x01a4, code lost:
    
        return null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x01a5, code lost:
    
        r2 = r30.A04.length;
     */
    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 44 out of bounds for length 31
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x011b  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0131  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0136  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final InterfaceC1533bw A0J(AbstractC1480b5 abstractC1480b5) throws InterruptedException, C1476b1 {
        InterfaceC1533bw interfaceC1533bwA00;
        long length;
        InterfaceC1533bw interfaceC1533bwA01;
        int i5 = 0;
        long jCurrentTimeMillis = System.currentTimeMillis();
        int iA01 = abstractC1480b5.A04().A01();
        long jA03 = abstractC1480b5.A04().A03();
        long jCurrentTimeMillis2 = System.currentTimeMillis() + abstractC1480b5.A04().A04();
        while (true) {
            if (A08[5].length() != 28) {
                break;
            }
            A08[5] = "uw7CndVwumsNWx3tR5uVNB4kWYqq";
            if (i5 >= iA01 || jCurrentTimeMillis2 <= System.currentTimeMillis()) {
                break;
            }
            try {
                if (this.A06.ABH()) {
                    String str = (i5 + 1) + A07(37, 4, 115) + iA01 + A07(56, 9, 70) + abstractC1480b5.A07();
                }
                jCurrentTimeMillis = System.currentTimeMillis();
                interfaceC1533bwA01 = A01(abstractC1480b5);
            } catch (C1476b1 e3) {
                if (!A0I(e3, jCurrentTimeMillis, abstractC1480b5) || i5 >= iA01 - 1) {
                    InterfaceC1473ay interfaceC1473ay = this.A05;
                    if (A08[5].length() == 28) {
                        A08[4] = "QCV1DKlppK5B8d9XgS0nl0pavHf";
                        if (!interfaceC1473ay.AEu(e3)) {
                            break;
                        }
                        interfaceC1533bwA00 = e3.A00();
                        InterfaceC2125le interfaceC2125le = this.A00;
                        long jCurrentTimeMillis3 = System.currentTimeMillis() - jCurrentTimeMillis;
                        if (interfaceC1533bwA00 != null) {
                        }
                        interfaceC2125le.ACc(jCurrentTimeMillis, jCurrentTimeMillis3, length, abstractC1480b5.A04 == null ? 0L : abstractC1480b5.A04.length, interfaceC1533bwA00 == null ? 0 : interfaceC1533bwA00.A9p(), e3);
                        throw e3;
                    }
                    A08[4] = "RTCgSwX4E1qAS9DeUF79c1CzYGzjCcSq";
                    if (!interfaceC1473ay.AEu(e3)) {
                        break;
                    }
                    if (i5 >= iA01 - 1) {
                        break;
                    }
                    if (jA03 > 0) {
                        try {
                            Thread.sleep(jA03);
                        } catch (InterruptedException e11) {
                            this.A00.ACc(jCurrentTimeMillis, System.currentTimeMillis() - jCurrentTimeMillis, 0L, abstractC1480b5.A04 != null ? abstractC1480b5.A04.length : 0L, 0, e11);
                            throw e3;
                        }
                    } else {
                        continue;
                    }
                    interfaceC1533bwA00 = e3.A00();
                    InterfaceC2125le interfaceC2125le2 = this.A00;
                    long jCurrentTimeMillis32 = System.currentTimeMillis() - jCurrentTimeMillis;
                    if (interfaceC1533bwA00 != null) {
                        length = 0;
                    }
                    interfaceC2125le2.ACc(jCurrentTimeMillis, jCurrentTimeMillis32, length, abstractC1480b5.A04 == null ? 0L : abstractC1480b5.A04.length, interfaceC1533bwA00 == null ? 0 : interfaceC1533bwA00.A9p(), e3);
                    throw e3;
                }
                continue;
            }
            if (interfaceC1533bwA01 != null) {
                this.A00.ACc(jCurrentTimeMillis, System.currentTimeMillis() - jCurrentTimeMillis, interfaceC1533bwA01.A7c().length, abstractC1480b5.A04 == null ? 0L : abstractC1480b5.A04.length, interfaceC1533bwA01.A9p(), null);
                return interfaceC1533bwA01;
            }
            continue;
            i5++;
        }
        interfaceC1533bwA00 = e3.A00();
        InterfaceC2125le interfaceC2125le22 = this.A00;
        long jCurrentTimeMillis322 = System.currentTimeMillis() - jCurrentTimeMillis;
        if (interfaceC1533bwA00 != null && interfaceC1533bwA00.A7c() != null) {
            byte[] bArrA7c = interfaceC1533bwA00.A7c();
            String[] strArr = A08;
            if (strArr[3].length() != strArr[6].length()) {
                String[] strArr2 = A08;
                strArr2[3] = "kZCGiI5zGihRv0GXktBIsysHbk9bX5";
                strArr2[6] = "FynZg164G";
                length = bArrA7c.length;
            }
            throw new RuntimeException();
        }
        length = 0;
        interfaceC2125le22.ACc(jCurrentTimeMillis, jCurrentTimeMillis322, length, abstractC1480b5.A04 == null ? 0L : abstractC1480b5.A04.length, interfaceC1533bwA00 == null ? 0 : interfaceC1533bwA00.A9p(), e3);
        throw e3;
    }

    static {
        A0A();
        A09 = InterfaceC1529bs.class.getSimpleName();
    }

    public AT(C1505bU c1505bU, InterfaceC2125le interfaceC2125le, Executor executor) {
        A0B();
        this.A03 = c1505bU;
        this.A06 = new AS(c1505bU.A04());
        final InterfaceC1469au interfaceC1469au = this.A06;
        final boolean zA05 = c1505bU.A05();
        this.A05 = new AY(interfaceC1469au, zA05) { // from class: com.facebook.ads.redexgen.X.4u
        };
        this.A01 = executor;
        this.A00 = interfaceC2125le;
    }

    private final int A00(HttpURLConnection httpURLConnection, byte[] bArr) throws Exception {
        OutputStream outputStreamAI0 = null;
        try {
            outputStreamAI0 = this.A05.AI0(httpURLConnection);
            if (outputStreamAI0 != null) {
                this.A05.AMS(outputStreamAI0, bArr);
            }
            int responseCode = httpURLConnection.getResponseCode();
            if (outputStreamAI0 != null) {
                try {
                    outputStreamAI0.close();
                } catch (Exception unused) {
                }
            }
            return responseCode;
        } catch (Throwable th2) {
            if (outputStreamAI0 != null) {
                try {
                    outputStreamAI0.close();
                } catch (Exception unused2) {
                }
            }
            throw th2;
        }
    }

    private final InterfaceC1533bw A02(AbstractC1480b5 abstractC1480b5) {
        if (this.A03.A04()) {
            A0C(abstractC1480b5);
        }
        InterfaceC1533bw interfaceC1533bwA01 = null;
        try {
            interfaceC1533bwA01 = A01(abstractC1480b5);
            return interfaceC1533bwA01;
        } catch (C1476b1 hre) {
            this.A05.AEu(hre);
            return interfaceC1533bwA01;
        } catch (Exception e3) {
            this.A05.AEu(new C1476b1(e3, interfaceC1533bwA01));
            return interfaceC1533bwA01;
        }
    }

    private final InterfaceC1533bw A03(String str, C1474az c1474az, C1501bQ c1501bQ) {
        return A02(new AW(str, c1474az, c1501bQ));
    }

    private final InterfaceC1533bw A04(String str, String str2, byte[] bArr, C1501bQ c1501bQ) {
        return A02(new AV(str, null, str2, bArr, c1501bQ));
    }

    private final AU A05(HttpURLConnection httpURLConnection) throws Exception {
        InputStream errorStream = null;
        byte[] responseBody = null;
        try {
            errorStream = httpURLConnection.getErrorStream();
            if (errorStream != null) {
                responseBody = this.A05.AIg(errorStream);
            }
            AU au2 = new AU(httpURLConnection, responseBody);
            if (errorStream != null) {
                try {
                    errorStream.close();
                } catch (Exception unused) {
                }
            }
            return au2;
        } catch (Throwable th2) {
            if (A08[5].length() != 28) {
                throw new RuntimeException();
            }
            A08[4] = "eS";
            if (errorStream != null) {
                try {
                    errorStream.close();
                } catch (Exception unused2) {
                }
            }
            throw th2;
        }
    }

    private final AU A06(HttpURLConnection httpURLConnection) throws Exception {
        InputStream inputStreamAHz = null;
        byte[] responseBody = null;
        try {
            inputStreamAHz = this.A05.AHz(httpURLConnection);
            if (inputStreamAHz != null) {
                responseBody = this.A05.AIg(inputStreamAHz);
            }
            AU au2 = new AU(httpURLConnection, responseBody);
            if (inputStreamAHz != null) {
                try {
                    inputStreamAHz.close();
                } catch (Exception unused) {
                }
            }
            return au2;
        } catch (Throwable th2) {
            if (inputStreamAHz != null) {
                try {
                    inputStreamAHz.close();
                } catch (Exception unused2) {
                }
            }
            throw th2;
        }
    }

    private final HttpURLConnection A08(String str, Proxy proxy) throws IOException {
        try {
            new URL(str);
            TrafficStats.setThreadStatsTag(61453);
            return this.A05.AHy(str, proxy);
        } catch (MalformedURLException e3) {
            throw new IllegalArgumentException(str + A07(18, 19, 115), e3);
        }
    }

    public static Proxy A09() throws NumberFormatException {
        Proxy proxy = Proxy.NO_PROXY;
        String property = System.getProperty(A07(192, 14, 45));
        String property2 = System.getProperty(A07(Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE, 14, 74));
        int i5 = -1;
        if (property2 != null) {
            try {
                i5 = Integer.parseInt(property2);
            } catch (NumberFormatException unused) {
                return proxy;
            }
        }
        boolean zIsEmpty = TextUtils.isEmpty(property);
        String[] strArr = A08;
        String proxyAddress = strArr[0];
        String portStr = strArr[2];
        if (proxyAddress.charAt(28) == portStr.charAt(28)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A08;
        strArr2[3] = "UW2PAxLqNCWQ7bdKo0A7Pw4nSyNkIv";
        strArr2[6] = "26yRDH09B";
        if (!zIsEmpty && i5 > 0 && i5 <= 65535) {
            return new Proxy(Proxy.Type.HTTP, new InetSocketAddress(property, i5));
        }
        return proxy;
    }

    public static synchronized void A0B() {
        if (CookieHandler.getDefault() == null) {
            CookieHandler.setDefault(new CookieManager());
        }
    }

    private void A0C(AbstractC1480b5 abstractC1480b5) {
        StringBuilder sb2 = new StringBuilder(A07(182, 10, 17));
        boolean zEquals = abstractC1480b5.A05().equals(EnumC1481b6.A06);
        String strA07 = A07(41, 1, 33);
        if (zEquals && abstractC1480b5.A08() != null) {
            sb2.append(A07(7, 5, 55));
            sb2.append(new String(abstractC1480b5.A08(), Charset.forName(A07(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 5, 42))));
            sb2.append(strA07);
        }
        Map<String, String> mapA06 = abstractC1480b5.A04().A06();
        String[] strArr = A08;
        if (strArr[1].length() != strArr[7].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A08;
        strArr2[3] = "s0c02ga9sXqOOqZgqzjFkG4II3gfLx";
        strArr2[6] = "iECV1gT3x";
        for (Map.Entry<String, String> entry : mapA06.entrySet()) {
            sb2.append(A07(2, 5, 74));
            sb2.append(entry.getKey());
            sb2.append(A07(66, 1, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE));
            sb2.append(entry.getValue());
            sb2.append(strA07);
        }
        sb2.append(A07(0, 2, 109));
        sb2.append(abstractC1480b5.A07());
        sb2.append(strA07);
        String string = sb2.toString();
        A0E(string, 1, (string.length() / 4000) + 1);
    }

    private void A0D(AbstractC1480b5 abstractC1480b5, InterfaceC1527bq interfaceC1527bq) {
        this.A04.A7Y(this, interfaceC1527bq, this.A01).A04(abstractC1480b5);
        if (this.A03.A04()) {
            A0C(abstractC1480b5);
        }
    }

    private void A0E(String str, int i5, int i11) {
        String str2 = A09 + A07(12, 6, 114) + i5 + A07(65, 1, 35) + i11;
        if (str.length() > 4000) {
            str.substring(0, 4000);
            A0E(str.substring(4000), i5 + 1, i11);
        }
    }

    private void A0F(String str, String str2, byte[] bArr, InterfaceC1527bq interfaceC1527bq, C1501bQ c1501bQ) {
        AV req = new AV(str, null, str2, bArr, c1501bQ);
        A0D(req, interfaceC1527bq);
    }

    private void A0G(HttpURLConnection httpURLConnection, AbstractC1480b5 abstractC1480b5) {
        Map<String, String> mapA06 = abstractC1480b5.A04().A06();
        InterfaceC1534bx interfaceC1534bxA05 = abstractC1480b5.A04().A05();
        for (String str : mapA06.keySet()) {
            httpURLConnection.setRequestProperty(str, mapA06.get(str));
        }
        if (interfaceC1534bxA05 != null) {
            Map<String, String> mapA7G = interfaceC1534bxA05.A7G(this.A03.A03());
            for (String str2 : mapA7G.keySet()) {
                httpURLConnection.setRequestProperty(str2, mapA7G.get(str2));
            }
        }
    }

    private final void A0H(HttpURLConnection httpURLConnection, AbstractC1480b5 abstractC1480b5) throws IOException {
        C1501bQ c1501bQA04 = abstractC1480b5.A04();
        httpURLConnection.setConnectTimeout(c1501bQA04.A00());
        httpURLConnection.setReadTimeout(c1501bQA04.A02());
        this.A05.AIJ(httpURLConnection, abstractC1480b5.A05(), abstractC1480b5.A06());
    }

    private final boolean A0I(Throwable th2, long j11, AbstractC1480b5 abstractC1480b5) {
        C1501bQ c1501bQA04 = abstractC1480b5.A04();
        long elapsedTime = (System.currentTimeMillis() - j11) + 10;
        if (this.A06.ABH()) {
            String str = A07(67, 15, 35) + elapsedTime + A07(42, 7, 23) + c1501bQA04.A00() + A07(49, 7, 109) + c1501bQA04.A02();
        }
        if (this.A02) {
            return elapsedTime >= ((long) c1501bQA04.A02());
        }
        long jA00 = c1501bQA04.A00();
        if (A08[5].length() != 28) {
            throw new RuntimeException();
        }
        String[] strArr = A08;
        strArr[3] = "UT6xnSlzbr9JaeC9T1uoRQiwoDXC3Y";
        strArr[6] = "g5URFCrsk";
        return elapsedTime >= jA00;
    }

    public final C1505bU A0K() {
        return this.A03;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1529bs
    @Deprecated
    public final InterfaceC1533bw AI9(String str, Map<String, String> parameters) {
        return A03(str, new C1474az(parameters), this.A03.A00());
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1529bs
    @Deprecated
    public final InterfaceC1533bw AIA(String str, byte[] bArr) {
        return A04(str, A07(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 47, 70), bArr, this.A03.A00());
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1529bs
    public final void AIB(String str, byte[] bArr, InterfaceC1527bq interfaceC1527bq) {
        A0F(str, A07(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 47, 70), bArr, interfaceC1527bq, this.A03.A00());
    }
}
