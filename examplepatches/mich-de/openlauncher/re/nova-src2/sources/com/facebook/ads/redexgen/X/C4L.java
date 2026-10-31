package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.text.TextUtils;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.NoRouteToHostException;
import java.net.Proxy;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.GZIPInputStream;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.4L, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C4L extends C9J implements C9C {
    public static byte[] A0F;
    public static String[] A0G = {"nOs3Tt6IrluNYDSOSLESBXSCSc7WyuF", "gB1sPMl0EzjK9", "jgjU8GI64F0Y9Lmze2t", "rHj9", "SvLqmlanW48Wj", "SfQAdFr8qtnlMOHcdEz777nqnLEWS", "4l3q", "CYEftcUDuniojuuZHfgRqMFva2dqwEDV"};

    @MetaExoPlayerCustomization
    public static final Pattern A0H;
    public int A00;
    public long A01;
    public long A02;
    public NX A03;
    public InterfaceC1334Wt<String> A04;
    public InputStream A05;
    public HttpURLConnection A06;
    public boolean A07;
    public final int A08;
    public final int A09;
    public final C1103Nd A0A;
    public final C1103Nd A0B;
    public final String A0C;
    public final boolean A0D;
    public final boolean A0E;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0F, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 24);
        }
        return new String(bArrCopyOfRange);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 20 out of bounds for length 17
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @MetaExoPlayerCustomization
    private HttpURLConnection A05(URL url, int i5, byte[] bArr, long j11, long j12, boolean z11, boolean z12, Map<String, String> map) throws IOException {
        HttpURLConnection httpURLConnectionA04;
        if (InetAddress.getByName(url.getHost()).isLoopbackAddress()) {
            Proxy proxy = Proxy.NO_PROXY;
            if (A0G[7].charAt(23) == 'a') {
                throw new RuntimeException();
            }
            A0G[7] = "OxfBNhcm3vCNP1oRQr9i0V4XObkL5ACx";
            httpURLConnectionA04 = A06(url, proxy);
        } else {
            httpURLConnectionA04 = A04(url);
        }
        httpURLConnectionA04.setConnectTimeout(this.A08);
        httpURLConnectionA04.setReadTimeout(this.A09);
        HashMap map2 = new HashMap();
        if (this.A0A != null) {
            map2.putAll(this.A0A.A00());
        }
        map2.putAll(this.A0B.A00());
        map2.putAll(map);
        for (Map.Entry entry : map2.entrySet()) {
            httpURLConnectionA04.setRequestProperty((String) entry.getKey(), (String) entry.getValue());
        }
        String strA03 = AbstractC1104Ne.A03(j11, j12);
        if (strA03 != null) {
            httpURLConnectionA04.setRequestProperty(A02(172, 5, 55), strA03);
        }
        if (this.A0C != null) {
            httpURLConnectionA04.setRequestProperty(A02(Sdk.SDKError.Reason.AD_CLOSED_TEMPLATE_ERROR_VALUE, 10, 46), this.A0C);
        }
        httpURLConnectionA04.setRequestProperty(A02(5, 15, 53), z11 ? A02(490, 4, 86) : A02(PglCryptUtils.COMPRESS_FAILED, 8, 63));
        httpURLConnectionA04.setInstanceFollowRedirects(z12);
        httpURLConnectionA04.setDoOutput(bArr != null);
        httpURLConnectionA04.setRequestMethod(NX.A01(i5));
        if (bArr != null) {
            httpURLConnectionA04.setFixedLengthStreamingMode(bArr.length);
            httpURLConnectionA04.connect();
            OutputStream outputStream = httpURLConnectionA04.getOutputStream();
            outputStream.write(bArr);
            outputStream.close();
        } else {
            httpURLConnectionA04.connect();
        }
        return httpURLConnectionA04;
    }

    public static void A09() {
        A0F = new byte[]{66, -106, -111, 66, -119, -114, -80, -80, -78, -67, -63, 122, -110, -69, -80, -68, -79, -74, -69, -76, 121, -91, -92, -86, -101, -92, -86, 99, 123, -92, -103, -91, -102, -97, -92, -99, -61, -17, -18, -12, -27, -18, -12, -83, -52, -27, -18, -25, -12, -24, -70, -26, -27, -21, -36, -27, -21, -92, -55, -40, -27, -34, -36, -88, -55, -54, -59, -39, -48, -40, -84, -40, -40, -44, -88, -59, -40, -59, -73, -45, -39, -42, -57, -55, -80, -43, -33, -51, -40, -40, -37, -29, -47, -48, -116, -49, -34, -37, -33, -33, -103, -36, -34, -37, -32, -37, -49, -37, -40, -116, -34, -47, -48, -43, -34, -47, -49, -32, -116, -108, 102, -117, -128, -116, -117, -112, -122, -112, -111, -126, -117, -111, 61, -123, -126, 126, -127, -126, -113, -112, 61, 120, -104, -69, -81, -83, -64, -75, -69, -70, -87, -48, -57, -57, 123, -57, -54, -66, -68, -49, -60, -54, -55, 123, -51, -64, -65, -60, -51, -64, -66, -49, -95, -80, -67, -74, -76, -35, -8, -8, -87, -10, -22, -9, 2, -87, -5, -18, -19, -14, -5, -18, -20, -3, -4, -61, -87, -27, -2, -11, 8, 0, -11, -13, 4, -11, -12, -80, -45, -1, -2, 4, -11, -2, 4, -67, -36, -11, -2, -9, 4, -8, -80, -21, -52, -27, -36, -17, -25, -36, -38, -21, -36, -37, -105, -70, -26, -27, -21, -36, -27, -21, -92, -55, -40, -27, -34, -36, -105, -46, AbstractJsonLexerKt.TC_INVALID, -104, -113, -94, -102, -113, -115, -98, -113, -114, 74, -113, -100, -100, -103, -100, 74, -95, -110, -109, -106, -113, 74, -114, -109, -99, -115, -103, -104, -104, -113, -115, -98, -109, -104, -111, 126, -105, -100, -98, -103, -103, -104, -101, -99, -114, -115, 73, -103, -101, -104, -99, -104, -116, -104, -107, 73, -101, -114, -115, -110, -101, -114, -116, -99, 99, 73, -101, -71, -85, -72, 115, -121, -83, -85, -76, -70, -113, -64, -125, -66, -113, -109, -86, -91, -106, -92, 81, 89, -115, -107, 92, 90, 94, 89, -115, -107, 92, 90, 96, 89, -115, -107, 92, 90, 85, -62, -50, -52, -115, -64, -51, -61, -47, -50, -56, -61, -115, -50, -54, -57, -45, -45, -49, -115, -56, -51, -45, -60, -47, -51, -64, -53, -115, -57, -45, -45, -49, -115, -89, -45, -45, -49, -77, -47, -64, -51, -46, -49, -50, -47, -45, -125, -94, -57, -44, -51, -54, -60, -61, -88, -51, -49, -44, -45, -78, -45, -47, -60, -64, -52, -104, -92, -94, 99, -106, -93, -103, -89, -92, -98, -103, 99, -92, -96, -99, -87, -87, -91, 99, -98, -93, -87, -102, -89, -93, -106, -95, 99, -99, -87, -87, -91, 99, 125, -87, -87, -91, -119, -89, -106, -93, -88, -91, -92, -89, -87, 89, 123, -98, -83, -102, -103, -127, -102, -93, -100, -87, -99, 126, -93, -91, -86, -87, -120, -87, -89, -102, -106, -94, -43, -24, -41, -34, -13, -1, -1, -5, -49, -37, -37, -41, -38, -64, -69, -68, -59, -53, -64, -53, -48, -88, -95, -104, -85, -93, -104, -106, -89, -104, -105, 120, -95, -105, -126, -103, 124, -95, -93, -88, -89};
    }

    static {
        A09();
        A0H = Pattern.compile(A02(331, 25, 25));
    }

    @Deprecated
    public C4L() {
        this(null, 8000, 8000);
    }

    @Deprecated
    public C4L(String str, int i5, int i11) {
        this(str, i5, i11, false, null);
    }

    @Deprecated
    public C4L(String str, int i5, int i11, boolean z11, C1103Nd c1103Nd) {
        this(str, i5, i11, z11, c1103Nd, null, false);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Wt != com.google.common.base.Predicate<java.lang.String> */
    public C4L(String str, int i5, int i11, boolean z11, C1103Nd c1103Nd, InterfaceC1334Wt<String> interfaceC1334Wt, boolean z12) {
        super(true);
        this.A0C = str;
        this.A08 = i5;
        this.A09 = i11;
        this.A0D = z11;
        this.A0A = c1103Nd;
        this.A04 = interfaceC1334Wt;
        this.A0B = new C1103Nd();
        this.A0E = z12;
    }

    private int A00(byte[] bArr, int i5, int i11) throws IOException {
        if (i11 == 0) {
            return 0;
        }
        if (this.A02 != -1) {
            long bytesRemaining = this.A02 - this.A01;
            if (bytesRemaining == 0) {
                return -1;
            }
            i11 = (int) Math.min(i11, bytesRemaining);
        }
        int i12 = ((InputStream) N1.A0f(this.A05)).read(bArr, i5, i11);
        if (i12 == -1) {
            return -1;
        }
        long j11 = this.A01;
        if (A0G[7].charAt(23) == 'a') {
            throw new RuntimeException();
        }
        String[] strArr = A0G;
        strArr[4] = "tOxuCLyEbNpkL";
        strArr[1] = "xWGiLZQxGBwvW";
        this.A01 = j11 + i12;
        A0F(i12);
        return i12;
    }

    @MetaExoPlayerCustomization
    public static long A01(HttpURLConnection httpURLConnection) throws NumberFormatException {
        long jMax = -1;
        String headerField = httpURLConnection.getHeaderField(A02(36, 14, 104));
        boolean zIsEmpty = TextUtils.isEmpty(headerField);
        String strA02 = A02(327, 1, 26);
        String strA022 = A02(63, 21, 76);
        if (!zIsEmpty) {
            try {
                jMax = Long.parseLong(headerField);
            } catch (NumberFormatException unused) {
                MV.A05(strA022, A02(197, 27, 120) + headerField + strA02);
            }
        }
        String headerField2 = httpURLConnection.getHeaderField(A02(50, 13, 95));
        if (!TextUtils.isEmpty(headerField2)) {
            Matcher matcher = A0H.matcher(headerField2);
            if (matcher.find()) {
                try {
                    long j11 = (Long.parseLong(matcher.group(2)) - Long.parseLong(matcher.group(1))) + 1;
                    if (jMax < 0) {
                        return j11;
                    }
                    if (jMax != j11) {
                        MV.A07(strA022, A02(120, 22, 5) + headerField + A02(328, 3, 75) + headerField2 + strA02);
                        jMax = Math.max(jMax, j11);
                        return jMax;
                    }
                    return jMax;
                } catch (NumberFormatException unused2) {
                    MV.A05(strA022, A02(Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 26, 95) + headerField2 + strA02);
                    return jMax;
                }
            }
            return jMax;
        }
        return jMax;
    }

    /* JADX WARN: Code restructure failed: missing block: B:53:0x012f, code lost:
    
        return r14;
     */
    /* JADX WARN: Removed duplicated region for block: B:13:0x005e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private HttpURLConnection A03(NX nx2) throws IOException {
        URL url = new URL(nx2.A06.toString());
        int i5 = nx2.A01;
        byte[] bArr = nx2.A0A;
        long j11 = nx2.A04;
        long j12 = nx2.A03;
        boolean zA06 = nx2.A06(1);
        if (!this.A0D) {
            boolean z11 = this.A0E;
            String[] strArr = A0G;
            if (strArr[4].length() == strArr[1].length()) {
                A0G[2] = "WznkL24kjHwXXIHVlGm";
                if (!z11) {
                    Map<String, String> map = nx2.A09;
                    String[] strArr2 = A0G;
                    if (strArr2[4].length() == strArr2[1].length()) {
                        String[] strArr3 = A0G;
                        strArr3[6] = "5p2E";
                        strArr3[3] = "FBks";
                        return A05(url, i5, bArr, j11, j12, zA06, true, map);
                    }
                } else if (A0G[2].length() == 19) {
                    String[] strArr4 = A0G;
                    strArr4[4] = "2ueBBRbAbVBQq";
                    strArr4[1] = "VbFmIvYecAPj0";
                    int redirectCount = 0;
                    while (true) {
                        int i11 = redirectCount + 1;
                        if (redirectCount > 20) {
                            throw new T6(new NoRouteToHostException(A02(177, 20, 113) + i11), nx2, 2001, 1);
                        }
                        URL url2 = url;
                        HttpURLConnection httpURLConnectionA05 = A05(url, i5, bArr, j11, j12, zA06, false, nx2.A09);
                        int responseCode = httpURLConnectionA05.getResponseCode();
                        String headerField = httpURLConnectionA05.getHeaderField(A02(142, 8, 52));
                        if ((i5 == 1 || i5 == 3) && (responseCode == 300 || responseCode == 301 || responseCode == 302 || responseCode == 303 || responseCode == 307 || responseCode == 308)) {
                            httpURLConnectionA05.disconnect();
                            url = A07(url2, headerField, nx2);
                        } else {
                            if (i5 != 2 || (responseCode != 300 && responseCode != 301 && responseCode != 302 && responseCode != 303)) {
                                break;
                            }
                            httpURLConnectionA05.disconnect();
                            if (!(this.A0E && responseCode == 302)) {
                                i5 = 1;
                                String[] strArr5 = A0G;
                                if (strArr5[5].length() == strArr5[0].length()) {
                                    throw new RuntimeException();
                                }
                                String[] strArr6 = A0G;
                                strArr6[4] = "CE74qWX2EDukT";
                                strArr6[1] = "rzNAupre8NrJB";
                                bArr = null;
                            }
                            url = A07(url2, headerField, nx2);
                        }
                        redirectCount = i11;
                    }
                }
            }
        }
        throw new RuntimeException();
    }

    private final HttpURLConnection A04(URL url) throws IOException {
        return (HttpURLConnection) url.openConnection();
    }

    @MetaExoPlayerCustomization
    private final HttpURLConnection A06(URL url, Proxy proxy) throws IOException {
        return (HttpURLConnection) url.openConnection(proxy);
    }

    private URL A07(URL url, String str, NX nx2) throws T6 {
        if (str == null) {
            throw new T6(A02(PerAppFeatureCatalog.MAX_TOOLS, 22, 67), nx2, 2001, 1);
        }
        try {
            URL url2 = new URL(url, str);
            String protocol = url2.getProtocol();
            if (!A02(498, 5, 79).equals(protocol) && !A02(494, 4, 115).equals(protocol)) {
                throw new T6(A02(286, 31, 17) + protocol, nx2, 2001, 1);
            }
            if (!this.A0D && !protocol.equals(url.getProtocol())) {
                throw new T6(A02(84, 36, 84) + url.getProtocol() + A02(0, 4, 10) + protocol + A02(4, 1, 72), nx2, 2001, 1);
            }
            return url2;
        } catch (MalformedURLException e3) {
            throw new T6(e3, nx2, 2001, 1);
        }
    }

    private void A08() {
        if (this.A06 != null) {
            try {
                this.A06.disconnect();
            } catch (Exception e3) {
                MV.A08(A02(63, 21, 76), A02(androidx.recyclerview.widget.n0.DEFAULT_SWIPE_ANIMATION_DURATION, 36, 18), e3);
            }
            this.A06 = null;
        }
    }

    private void A0A(long j11, NX nx2) throws IOException {
        if (j11 == 0) {
            return;
        }
        byte[] bArr = new byte[androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT];
        while (j11 > 0) {
            int i5 = ((InputStream) N1.A0f(this.A05)).read(bArr, 0, (int) Math.min(j11, bArr.length));
            if (!Thread.currentThread().isInterrupted()) {
                if (i5 != -1) {
                    j11 -= i5;
                    A0F(i5);
                } else {
                    throw new T6(nx2, 2008, 1);
                }
            } else {
                throw new T6(new InterruptedIOException(), nx2, 2000, 1);
            }
        }
    }

    public static void A0B(HttpURLConnection httpURLConnection, long j11) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        if (httpURLConnection == null || N1.A02 < 19) {
            return;
        }
        int i5 = N1.A02;
        if (A0G[7].charAt(23) == 'a') {
            throw new RuntimeException();
        }
        String[] strArr = A0G;
        strArr[4] = "oYk1pyLAkrhbV";
        strArr[1] = "OYwXHLGm308d0";
        if (i5 > 20) {
            return;
        }
        try {
            InputStream inputStream = httpURLConnection.getInputStream();
            if (j11 == -1) {
                if (inputStream.read() == -1) {
                    return;
                }
            } else if (j11 <= 2048) {
                return;
            }
            String name = inputStream.getClass().getName();
            if (A02(356, 65, 71).equals(name) || A02(421, 69, 29).equals(name)) {
                Method declaredMethod = ((Class) AbstractC1062Ln.A01(inputStream.getClass().getSuperclass())).getDeclaredMethod(A02(511, 20, 27), new Class[0]);
                declaredMethod.setAccessible(true);
                declaredMethod.invoke(inputStream, new Object[0]);
            }
        } catch (Exception unused) {
        }
    }

    public static boolean A0C(HttpURLConnection httpURLConnection) {
        String headerField = httpURLConnection.getHeaderField(A02(20, 16, 30));
        String contentEncoding = A02(490, 4, 86);
        return contentEncoding.equalsIgnoreCase(headerField);
    }

    public final void A0I(String str, String str2) {
        AbstractC1062Ln.A01(str);
        AbstractC1062Ln.A01(str2);
        this.A0B.A01(str, str2);
    }

    @Override // com.facebook.ads.redexgen.X.C9J, com.facebook.ads.redexgen.X.TE
    public final Map<String, List<String>> A9W() {
        if (this.A06 == null) {
            return AbstractC1307Vq.A04();
        }
        return new C9G(this.A06.getHeaderFields());
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final Uri AA2() {
        if (this.A06 == null) {
            return null;
        }
        return Uri.parse(this.A06.getURL().toString());
    }

    /* JADX WARN: Code restructure failed: missing block: B:68:0x016f, code lost:
    
        if ((r3 instanceof com.facebook.ads.redexgen.X.T6) != false) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x0173, code lost:
    
        throw ((com.facebook.ads.redexgen.X.T6) r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x0185, code lost:
    
        if ((r3 instanceof com.facebook.ads.redexgen.X.T6) != false) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x018e, code lost:
    
        throw new com.facebook.ads.redexgen.X.T6(r3, r16, 2000, 1);
     */
    @Override // com.facebook.ads.redexgen.X.TE
    @MetaExoPlayerCustomization
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long AHv(final NX nx2) throws IOException, NumberFormatException {
        final byte[] bArrA1F;
        final NQ nq2;
        this.A03 = nx2;
        long bytesToSkip = 0;
        this.A01 = 0L;
        this.A02 = 0L;
        A0G(nx2);
        if (nx2.A07 != null) {
            for (Map.Entry<String, String> entry : nx2.A07.A0P.entrySet()) {
                A0I(entry.getKey(), entry.getValue());
            }
        }
        try {
            this.A06 = A03(nx2);
            HttpURLConnection httpURLConnection = this.A06;
            this.A00 = httpURLConnection.getResponseCode();
            final String responseMessage = httpURLConnection.getResponseMessage();
            int i5 = this.A00;
            String contentType = A02(50, 13, 95);
            if (i5 < 200 || this.A00 > 299) {
                final Map<String, List<String>> headerFields = httpURLConnection.getHeaderFields();
                if (this.A00 == 416) {
                    if (nx2.A04 == AbstractC1104Ne.A00(httpURLConnection.getHeaderField(contentType))) {
                        this.A07 = true;
                        A0H(nx2);
                        if (nx2.A03 != -1) {
                            return nx2.A03;
                        }
                        return 0L;
                    }
                }
                InputStream errorStream = httpURLConnection.getErrorStream();
                try {
                    bArrA1F = errorStream != null ? N1.A1F(errorStream) : N1.A07;
                } catch (IOException unused) {
                    bArrA1F = N1.A07;
                }
                A08();
                if (this.A00 == 416) {
                    nq2 = new NQ(2008);
                } else {
                    nq2 = null;
                }
                final int i11 = this.A00;
                throw new T6(i11, responseMessage, nq2, headerFields, nx2, bArrA1F) { // from class: com.facebook.ads.redexgen.X.9D
                    public static byte[] A04;
                    public static String[] A05 = {"JAli2j9y0ZzlqAjJFPwPKYRltVStFftu", "S0rVsuizIrf2heiHRtUtxs6hnvBHx2yC", "V707ztTXfPVWZsi3kHmUKha67juacPtk", "XaW4WsxvrFpxNTQkFH5Kkth2dot66Zv2", "OIMHJQtaFdaxpqliHbyA1Kd6zuQ2ai9P", "pb95JTSnUmF3oisMmeyIM8RvAEJFnA5X", "bvEGhFfWugRaXpJ59hdzI5tWoAjq2MRi", "0rvajko4jU3vYPDzBOunjuajj4833"};
                    public final int A00;
                    public final String A01;
                    public final Map<String, List<String>> A02;
                    public final byte[] A03;

                    public static String A00(int i12, int i13, int i14) {
                        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i12, i12 + i13);
                        for (int i15 = 0; i15 < bArrCopyOfRange.length; i15++) {
                            bArrCopyOfRange[i15] = (byte) ((bArrCopyOfRange[i15] ^ i14) ^ 3);
                        }
                        return new String(bArrCopyOfRange);
                    }

                    public static void A01() {
                        byte[] bArr = {48, 7, 17, 18, 13, 12, 17, 7, 66, 1, 13, 6, 7, 88, 66};
                        String[] strArr = A05;
                        if (strArr[0].charAt(3) == strArr[1].charAt(3)) {
                            throw new RuntimeException();
                        }
                        A05[2] = "47ds8857xceN7QB7wgGve0GkuxWCJwMo";
                        A04 = bArr;
                    }

                    static {
                        A01();
                    }

                    {
                        super(A00(0, 15, 97) + i11, nq2, nx2, 2004, 1);
                        this.A00 = i11;
                        this.A01 = responseMessage;
                        this.A02 = headerFields;
                        this.A03 = bArrA1F;
                    }
                };
            }
            final String contentType2 = httpURLConnection.getContentType();
            if (this.A04 == null || this.A04.A4d(contentType2)) {
                if (this.A00 == 200 && nx2.A04 != 0) {
                    bytesToSkip = nx2.A04;
                }
                boolean zA0C = A0C(httpURLConnection);
                if (zA0C) {
                    this.A02 = nx2.A03;
                } else {
                    int i12 = (A01(httpURLConnection) > (-1L) ? 1 : (A01(httpURLConnection) == (-1L) ? 0 : -1));
                    if (nx2.A03 != -1) {
                        this.A02 = nx2.A03;
                    } else {
                        String responseMessage2 = A02(36, 14, 104);
                        String headerField = httpURLConnection.getHeaderField(responseMessage2);
                        String responseMessage3 = httpURLConnection.getHeaderField(contentType);
                        long jA01 = AbstractC1104Ne.A01(headerField, responseMessage3);
                        this.A02 = jA01 != -1 ? jA01 - bytesToSkip : -1L;
                    }
                }
                try {
                    this.A05 = httpURLConnection.getInputStream();
                    if (zA0C) {
                        this.A05 = new GZIPInputStream(this.A05);
                    }
                    this.A07 = true;
                    String[] strArr = A0G;
                    if (strArr[4].length() != strArr[1].length()) {
                        throw new RuntimeException();
                    }
                    A0G[2] = "vOmLJzPKHhABJ0mtpNg";
                    A0H(nx2);
                    try {
                        A0A(bytesToSkip, nx2);
                        return this.A02;
                    } catch (IOException e3) {
                        String[] strArr2 = A0G;
                        if (strArr2[6].length() != strArr2[3].length()) {
                            String[] strArr3 = A0G;
                            strArr3[4] = "6oIj3ukvUJNim";
                            strArr3[1] = "P3GSGxSKjKm7O";
                            A08();
                        } else {
                            String[] strArr4 = A0G;
                            strArr4[6] = "GCpS";
                            strArr4[3] = "NWfr";
                            A08();
                        }
                    }
                } catch (IOException e11) {
                    A08();
                    throw new T6(e11, nx2, 2000, 1);
                }
            } else {
                A08();
                IOException e12 = new T6(contentType2, nx2) { // from class: com.facebook.ads.redexgen.X.9E
                    public static byte[] A01 = null;
                    public static String[] A02 = {"CRchbvH5GlFN7NYNx7RPIbuSr5KZs1AF", "b4Pw3jsalXQqMIPt2e8fSjKdsWbkTvb4", "xR6rBLuzucYoGtgsM7XUfClL", "zjLPl8SGISPPGo15aH65bQ72foMyVTPe", "uz7EEryteENlNTIvmJNBWHQiA57trEq4", "Vt3fAwNpFEhpFeljlPmtktQK8ss7Jvuu", "teDlErPiqg6k4O59eAmaFeOZTAY5oa4h", "xx3dbKmP8ijSvrB0PPXqUNxrFHCT5dy6"};
                    public static final long serialVersionUID = 1;
                    public final String A00;

                    public static String A00(int i13, int i14, int i15) {
                        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i13, i13 + i14);
                        for (int i16 = 0; i16 < bArrCopyOfRange.length; i16++) {
                            bArrCopyOfRange[i16] = (byte) ((bArrCopyOfRange[i16] ^ i15) ^ 89);
                        }
                        return new String(bArrCopyOfRange);
                    }

                    public static void A01() {
                        byte[] bArr = {108, 75, 83, 68, 73, 76, 65, 5, 70, 74, 75, 81, 64, 75, 81, 5, 81, 92, 85, 64, 31, 5};
                        if (A02[3].charAt(23) != '2') {
                            throw new RuntimeException();
                        }
                        String[] strArr5 = A02;
                        strArr5[4] = "rYaYEGGZIb5dmyzxE5shd4OJdCcNUYYi";
                        strArr5[6] = "vbriEjSEvYwddni4Bl8IplFMswspWEIE";
                        A01 = bArr;
                    }

                    static {
                        A01();
                    }

                    {
                        super(A00(0, 22, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE) + contentType2, nx2, 2003, 1);
                        this.A00 = contentType2;
                    }
                };
                throw e12;
            }
        } catch (IOException e13) {
            A08();
            throw T6.A04(e13, nx2, 1);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0088  */
    @Override // com.facebook.ads.redexgen.X.TE
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void close() throws T6 {
        try {
            InputStream inputStream = this.A05;
            if (inputStream != null) {
                A0B(this.A06, this.A02 != -1 ? this.A02 - this.A01 : -1L);
                try {
                    inputStream.close();
                } catch (IOException e3) {
                    throw new T6(e3, (NX) N1.A0f(this.A03), 2000, 3);
                }
            }
            this.A05 = null;
            A08();
            boolean z11 = this.A07;
            if (A0G[7].charAt(23) == 'a') {
                throw new RuntimeException();
            }
            String[] strArr = A0G;
            strArr[5] = "IKlqhotxoqxb0sXFSHQCNyXwMGh2A";
            strArr[0] = "2ShhlgZ2mV8xyohXA7l4PYfcRFl2zSH";
            if (z11) {
                this.A07 = false;
                A0E();
            }
        } catch (Throwable th2) {
            this.A05 = null;
            A08();
            String[] strArr2 = A0G;
            if (strArr2[4].length() != strArr2[1].length()) {
                String[] strArr3 = A0G;
                strArr3[4] = "u1XyGuwIlt9s0";
                strArr3[1] = "Vm5En7AKzwSAn";
                if (this.A07) {
                    this.A07 = false;
                    if (A0G[2].length() != 19) {
                        A0E();
                    } else {
                        String[] strArr4 = A0G;
                        strArr4[6] = "UKl3";
                        strArr4[3] = "R8V0";
                        A0E();
                    }
                }
            } else {
                A0G[2] = "dSIHxMwnwlCy6xxTpfV";
                if (this.A07) {
                }
            }
            throw th2;
        }
    }

    @Override // com.facebook.ads.redexgen.X.KR
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        try {
            return A00(bArr, i5, i11);
        } catch (IOException e3) {
            throw T6.A04(e3, (NX) N1.A0f(this.A03), 2);
        }
    }
}
