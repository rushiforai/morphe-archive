package com.facebook.ads.redexgen.X;

import android.util.Log;
import com.vungle.ads.internal.protos.Sdk;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.Proxy;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Locale;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public abstract class AY implements InterfaceC1473ay {
    public static SSLContext A02;
    public static byte[] A03;
    public static String[] A04 = {"rzjVC70O4bd9DzHjbWZgWXgUSmVLYSU4", "d5zo8W4K", "Hv98ROwnq0amXTKQof8zpMynpU6nXYzw", "m02wtPmJvn7xvEVIhgILVdsvYaekd1y1", "NwXA6aDXoJPzKJxJycW", "lujFiBBwg3lGF", "5iNla1hEs57TMoL8Mlh58N0Q757SBHKY", "iek06qmxI9TIJY"};
    public final InterfaceC1469au A00;
    public final boolean A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 14);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A03 = new byte[]{70, -121, 124, 70, 126, 121, 123, 125, 122, -121, -121, -125, 70, 123, -121, -123, -118, -49, -66, -118, -62, -67, -65, -63, -66, -53, -53, -57, -118, -65, -53, -55, -104, -70, -70, -68, -57, -53, -124, -102, -65, -72, -55, -54, -68, -53, -90, -59, -41, -51, -57, -74, -55, -43, -39, -55, -41, -40, -84, -59, -46, -56, -48, -55, -42, 114, -111, -93, -103, -109, -126, -107, -95, -91, -107, -93, -92, 120, -111, -98, -108, -100, -107, -94, 94, -97, -98, 117, -94, -94, -97, -94, -124, -80, -81, -75, -90, -81, -75, 110, -107, -70, -79, -90, -47, -20, -12, -9, -16, -17, -85, -1, -6, -85, -18, -3, -16, -20, -1, -16, -85, -38, -49, -85, -34, -34, -41, -85, -18, -6, -7, -1, -16, 3, -1, -70, -78, -71, -49, -50, -64, -89, -78};
    }

    static {
        A02();
    }

    public AY(InterfaceC1469au interfaceC1469au, boolean z11) {
        this.A00 = interfaceC1469au;
        this.A01 = z11;
    }

    public static SSLContext A01() throws NoSuchAlgorithmException, KeyManagementException {
        if (A02 == null) {
            try {
                TrustManager[] trustManagerArr = {new C1484b9()};
                SSLContext sSLContext = SSLContext.getInstance(A00(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 3, 88));
                sSLContext.init(null, trustManagerArr, new SecureRandom());
                A02 = sSLContext;
            } catch (Exception e3) {
                Log.e(A00(46, 19, 86), A00(104, 31, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE), e3);
            }
        }
        SSLContext sSLContext2 = A02;
        if (A04[3].charAt(25) != 'a') {
            throw new RuntimeException();
        }
        String[] strArr = A04;
        strArr[2] = "8hMnjOyTpbJQb1slQ3UyoTsFqj7usGCv";
        strArr[6] = "CamiAuKelugehhtOYX0XeGsbVkNLvlHT";
        return sSLContext2;
    }

    public static void A03(HttpURLConnection httpURLConnection) {
        SSLContext context;
        if ((httpURLConnection instanceof HttpsURLConnection) && (context = A01()) != null) {
            ((HttpsURLConnection) httpURLConnection).setSSLSocketFactory(context.getSocketFactory());
            ((HttpsURLConnection) httpURLConnection).setHostnameVerifier(new HostnameVerifier() { // from class: com.facebook.ads.redexgen.X.bF
                @Override // javax.net.ssl.HostnameVerifier
                public final boolean verify(String str, SSLSession sSLSession) {
                    return AY.A06(str, sSLSession);
                }
            });
        }
    }

    private boolean A04(C1476b1 c1476b1) throws Throwable {
        for (Throwable cause = c1476b1.getCause(); cause != null; cause = cause.getCause()) {
            if ((cause instanceof SocketException) || (cause instanceof SocketTimeoutException) || (cause instanceof ConnectException) || (cause instanceof SSLException)) {
                return true;
            }
        }
        if (A04[1].length() != 4) {
            A04[4] = "Q0cPEPQlPnXr9vF2tAe";
            return false;
        }
        Throwable cause2 = new RuntimeException();
        throw cause2;
    }

    public static boolean A05(String str) {
        try {
            String host = new URL(str).getHost();
            if (host == null) {
                return false;
            }
            String lowerCase = host.toLowerCase(Locale.US);
            if (!lowerCase.endsWith(A00(0, 16, 10))) {
                if (!lowerCase.endsWith(A00(16, 16, 78))) {
                    return false;
                }
            }
            return true;
        } catch (Exception unused) {
            return false;
        }
    }

    public static /* synthetic */ boolean A06(String str, SSLSession sSLSession) {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1473ay
    public final boolean AEu(C1476b1 c1476b1) {
        InterfaceC1533bw interfaceC1533bwA00 = c1476b1.A00();
        if (this.A00.ABH()) {
            Log.e(AY.class.getSimpleName(), A00(65, 27, 34), c1476b1);
        }
        if ((interfaceC1533bwA00 != null && interfaceC1533bwA00.A9p() > 0) || A04(c1476b1)) {
            return true;
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1473ay
    public final HttpURLConnection AHy(String str, Proxy proxy) throws IOException {
        HttpURLConnection uc2;
        URL url = new URL(str);
        if (proxy == null) {
            uc2 = (HttpURLConnection) url.openConnection();
        } else {
            uc2 = (HttpURLConnection) url.openConnection(proxy);
        }
        if (this.A01 && A05(str)) {
            A03(uc2);
        }
        return uc2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1473ay
    public final InputStream AHz(HttpURLConnection httpURLConnection) throws IOException {
        return httpURLConnection.getInputStream();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1473ay
    public final OutputStream AI0(HttpURLConnection httpURLConnection) throws IOException {
        return httpURLConnection.getOutputStream();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1473ay
    public final void AIJ(HttpURLConnection httpURLConnection, EnumC1481b6 enumC1481b6, String str) throws IOException {
        httpURLConnection.setRequestMethod(enumC1481b6.A03());
        httpURLConnection.setDoOutput(enumC1481b6.A05());
        httpURLConnection.setDoInput(enumC1481b6.A04());
        if (str != null) {
            httpURLConnection.setRequestProperty(A00(92, 12, 51), str);
        }
        httpURLConnection.setRequestProperty(A00(32, 14, 73), A00(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 5, 108));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1473ay
    public final byte[] AIg(InputStream inputStream) throws IOException {
        byte[] bArr = new byte[ReaderJsonLexerKt.BATCH_SIZE];
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        while (true) {
            int i5 = inputStream.read(bArr);
            if (i5 == -1) {
                byteArrayOutputStream.flush();
                byte[] data = byteArrayOutputStream.toByteArray();
                return data;
            }
            if (A04[4].length() != 19) {
                throw new RuntimeException();
            }
            String[] strArr = A04;
            strArr[2] = "eO7qbggyddGiOQuVn8N8jDULGwym82oB";
            strArr[6] = "iN6CFd4LV6hdOWp44ZZbGtT2nODAuDvC";
            byteArrayOutputStream.write(bArr, 0, i5);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1473ay
    public final void AMS(OutputStream outputStream, byte[] bArr) throws IOException {
        outputStream.write(bArr);
    }
}
