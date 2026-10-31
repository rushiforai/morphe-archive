package com.facebook.ads.redexgen.X;

import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.1I, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C1I {
    public static byte[] A00;
    public static String[] A01 = {"qzld4Qy39Azn7KYrj1sXbPZPr2qv6GgB", "1yyYiWnNu", "Zg1voNH89a01plQdKkVOTIE3hJJ00If9", "AO", "oO", "LhD7lTYtuMCYkgD1PnemOg5ERT23PX0", "YB3LukNHUN2DaV56yaS9yy46zwl6QYin", "pfYbPlfLNAe5pcAyURRpn9lPUi7k7Z7a"};
    public static final String A02;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 105);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        byte[] bArr = {21, 51, 53, 58, 55, -14, 63, 59, 69, 69, -14, 56, 65, 68, -14, 56, 59, 62, 55, -14, 71, 68, 62, 12, -14, -61, -31, -29, -24, -27, -96, -19, -23, -13, -13, -96, -26, -17, -14, -96, -23, -19, -31, -25, -27, -96, -11, -14, -20, -70, -96, 33, 37, 48, -46, -1, -1, -4, -1, -83, -4, -3, -14, -5, -10, -5, -12, -83, -16, -18, -16, -11, -14, -15, -83, -13, -10, -7, -14, -83, -13, -4, -1, -83, 2, -1, -7, -57, -83, -26, -30, -31, 21, 4, 9, 5, 14, 3, 5, -18, 5, 20, 23, 15, 18, 11, -61, -65, -56, -22, -25, -37, -35, -21, -21, -31, -26, -33, -104, -34, -31, -28, -35, -104, -19, -22, -28, -78, -104, -2, 32, 29, 17, 19, 33, 33, 23, 28, 21, -50, 23, 27, 15, 21, 19, -50, 35, 32, 26, -24, -50, -7, 27, 24, 12, 14, 28, 28, 18, 23, 16, -55, 31, 18, 13, 14, 24, -55, 30, 27, 21, -29, -55, 73, 88, 81, -16, -5, -6, -9, -15};
        String[] strArr = A01;
        if (strArr[7].charAt(12) != strArr[2].charAt(12)) {
            throw new RuntimeException();
        }
        A01[1] = "7l6kM9ADseoG9RLfCJpKjz7J";
        A00 = bArr;
    }

    static {
        A04();
        A02 = C1I.class.getSimpleName();
    }

    public static WebResourceResponse A00(C0958Hi c0958Hi, C2086kz c2086kz, WebResourceRequest webResourceRequest, AnonymousClass26 anonymousClass26, boolean z11) {
        String string = webResourceRequest.getUrl().toString();
        if (anonymousClass26.A05) {
            return null;
        }
        try {
            HashMap map = new HashMap();
            String strGuessContentTypeFromName = URLConnection.guessContentTypeFromName(string);
            if (anonymousClass26.A01.contains(string)) {
                StringBuilder sb2 = new StringBuilder();
                String url = A03(108, 21, 15);
                sb2.append(url).append(string).toString();
                File cachedFile = c2086kz.A0P(string);
                if (cachedFile != null) {
                    if (z11) {
                        String url2 = anonymousClass26.A00;
                        if (string.equals(url2)) {
                            final C0957Hh c0957HhA02 = c0958Hi.A02();
                            final FileInputStream fileInputStream = new FileInputStream(cachedFile);
                            final C0865Ds c0865Ds = new C0865Ds(c0958Hi, string);
                            return A02(map, strGuessContentTypeFromName, new InputStream(c0957HhA02, fileInputStream, c0865Ds) { // from class: com.facebook.ads.redexgen.X.4E
                                public static byte[] A04;
                                public static String[] A05 = {"5FxkjmViipfuOEmeGZRh1rWuAhi58BIY", "P0uDFh8HOwAWvDVGkGeATzc", "FQ2HPVuJ9Fju5P7EfteSFhbDkCSiUGCr", "lMnDCDrcSzZtU6RMhKfYe1rO633Hkzz8", "BZaCeAJ4mpNw1z6aTzzGkvXJAvKgKDg7", "gl5vlYV0aCgrCc0s0sEnhviYHRKbo8Yg", "Tgc0UJMQxUN8PgOF6KJ9ZKrej2a3tpw", "OSPCme8ftb56UzOVrw2bgiBSvmZFYlRk"};
                                public MessageDigest A00;
                                public final C0957Hh A01;
                                public final C8s A02;
                                public final FileInputStream A03;

                                public static String A00(int i5, int i11, int i12) {
                                    byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
                                    int i13 = 0;
                                    while (true) {
                                        int length = bArrCopyOfRange.length;
                                        if (A05[7].charAt(24) == 'i') {
                                            break;
                                        }
                                        A05[7] = "wkBtkBfOXubsKwfKzYpxBJzZI93GSJMw";
                                        if (i13 >= length) {
                                            return new String(bArrCopyOfRange);
                                        }
                                        byte b11 = bArrCopyOfRange[i13];
                                        String[] strArr = A05;
                                        if (strArr[0].charAt(11) == strArr[3].charAt(11)) {
                                            break;
                                        }
                                        String[] strArr2 = A05;
                                        strArr2[1] = "6MRboz4pfSS0DylRcsmX7nz";
                                        strArr2[6] = "Z3yJOYkAPU5AGas9ZlGFYfEzislvm9u";
                                        bArrCopyOfRange[i13] = (byte) ((b11 - i12) - 45);
                                        i13++;
                                    }
                                    throw new RuntimeException();
                                }

                                public static void A01() {
                                    A04 = new byte[]{-104, -113, -128, 11, 26, 19};
                                }

                                static {
                                    A01();
                                }

                                {
                                    this.A03 = fileInputStream;
                                    this.A02 = c0865Ds;
                                    this.A01 = c0957HhA02;
                                    try {
                                        this.A00 = MessageDigest.getInstance(A00(0, 3, 30));
                                    } catch (NoSuchAlgorithmException unused) {
                                        this.A00 = null;
                                    }
                                }

                                @Override // java.io.InputStream
                                public final int available() throws IOException {
                                    return this.A03.available();
                                }

                                @Override // java.io.InputStream
                                public final int read() throws IOException {
                                    byte[] b11 = new byte[1];
                                    return read(b11);
                                }

                                @Override // java.io.InputStream
                                public final int read(byte[] bArr, int i5, int i11) throws IOException {
                                    int i12 = this.A03.read(bArr, i5, i11);
                                    if (this.A00 != null) {
                                        if (A05[7].charAt(24) == 'i') {
                                            throw new RuntimeException();
                                        }
                                        A05[2] = "wFnf9K6AarqF2rYbRIkm3wGElU25UaCd";
                                        try {
                                            if (i12 > 0) {
                                                this.A00.update(bArr, i5, i12);
                                            } else if (i12 == -1) {
                                                this.A02.AAW(C2388q0.A05(this.A00.digest()));
                                                this.A00 = null;
                                            }
                                        } catch (Exception e3) {
                                            this.A00 = null;
                                            this.A01.A08().ACp(A00(3, 3, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), AbstractC2126lf.A13, new C2127lg(e3));
                                        }
                                    }
                                    return i12;
                                }

                                @Override // java.io.InputStream
                                public final long skip(long j11) throws IOException {
                                    int actuallyRead = (int) j11;
                                    byte[] bArr = new byte[1024];
                                    long j12 = 0;
                                    while (actuallyRead > 0) {
                                        int bytesToRead = read(bArr, 0, Math.min(actuallyRead, 1024));
                                        if (bytesToRead <= 0) {
                                            break;
                                        }
                                        actuallyRead -= bytesToRead;
                                        j12 += bytesToRead;
                                    }
                                    return j12;
                                }
                            });
                        }
                    }
                    return A01(map, strGuessContentTypeFromName, cachedFile);
                }
                StringBuilder sb3 = new StringBuilder();
                String url3 = A03(0, 25, 105);
                sb3.append(url3).append(string).toString();
            }
            if (anonymousClass26.A02.contains(string)) {
                StringBuilder sb4 = new StringBuilder();
                String url4 = A03(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, 22, 69);
                sb4.append(url4).append(string).toString();
                File fileA0Q = c2086kz.A0Q(string);
                if (fileA0Q != null) {
                    return A01(map, strGuessContentTypeFromName, fileA0Q);
                }
                StringBuilder sb5 = new StringBuilder();
                String url5 = A03(25, 26, 23);
                sb5.append(url5).append(string).toString();
            }
            if (anonymousClass26.A03.contains(string)) {
                StringBuilder sb6 = new StringBuilder();
                String url6 = A03(151, 22, 64);
                sb6.append(url6).append(string).toString();
                return AbstractC1661e1.A00(c0958Hi, webResourceRequest, webResourceRequest.getUrl(), strGuessContentTypeFromName, map);
            }
        } catch (IOException e3) {
            StringBuilder sb7 = new StringBuilder();
            String url7 = A03(54, 35, 36);
            String mimeType = sb7.append(url7).append(string).toString();
            String url8 = A03(89, 17, 55);
            Log.e(url8, mimeType, e3);
        }
        return null;
    }

    public static WebResourceResponse A01(HashMap<String, String> responseHeaders, String str, File file) throws FileNotFoundException {
        return A02(responseHeaders, str, new FileInputStream(file));
    }

    public static WebResourceResponse A02(HashMap<String, String> responseHeaders, String str, InputStream inputStream) {
        return new WebResourceResponse(str, null, 200, A03(106, 2, 11), responseHeaders, inputStream);
    }

    public static void A05(C2095lA c2095lA, String str, String str2) throws JSONException {
        C2127lg c2127lg = new C2127lg(A03(51, 3, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
        c2127lg.A05(1);
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(A03(176, 2, 31), str);
            jSONObject.put(A03(178, 3, 28), str2);
            c2127lg.A07(jSONObject);
        } catch (JSONException unused) {
        }
        c2095lA.A08().AC0(A03(TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 3, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE), AbstractC2126lf.A12, c2127lg);
    }
}
