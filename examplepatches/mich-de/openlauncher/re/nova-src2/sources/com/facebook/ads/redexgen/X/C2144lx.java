package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.lx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2144lx {
    public static byte[] A00;
    public static String[] A01 = {"SWOQ8EmAtKHlzZcnhV3YPL4K", "M3DVw", "YVE29eGnYTMF7iZct0Cj857VOjyovHsA", "GsTrOHOfJOMPEz3TtMJGwYId3HC2p3bG", "s7QUE4krJA5TTfkvFa", "pn7zI1zHrzc9", "8NXaUMRA8hrChxJo41VImiAbHhwwLtwc", "TY6eOsWpSXfO6Gf7dJ7d"};

    public /* synthetic */ C2144lx(AbstractC05811i abstractC05811i) {
        this();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 116);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{27, 95, 96, 91, 94, 81, 66, 78, 78, 74, 86, 98, 98, 94, 97, 1, -11, 6, -1, -7, 8, 21, 17, 6, 30, -45, 12, 20, 20, 12, 17, 10, -45, 8, 20, 18, 39, 40, 35, 38, 25, -4, -3, -8, -5, -18, -24, -2, -5, -11, -18, -23, -58, -23, -15, -33, -20, -67, -37, -19, -33, -94, -88, -88, -88, -93};
    }

    static {
        A01();
    }

    public C2144lx() {
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0055  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final boolean A02(Uri uri) {
        if (!C1h.A0C(A00(36, 5, 64), uri.getAuthority())) {
            return false;
        }
        if (A01[0].length() == 16) {
            throw new RuntimeException();
        }
        A01[0] = "uY";
        String queryParameter = uri.getQueryParameter(A00(41, 9, 21));
        if (queryParameter == null) {
            return true;
        }
        try {
            Uri uriA00 = AbstractC2351pP.A00(queryParameter);
            C1h.A06(uriA00);
            String scheme = uriA00.getScheme();
            if (A01[6].length() == 32) {
                String[] strArr = A01;
                strArr[3] = "hxXjqnt3J8MipBVWaydfLCeyVdA2hnI4";
                strArr[2] = "mNw3nO79D4MJpcDCPUDZwSR6RaPlXjNk";
                if (scheme != null) {
                }
            } else if (scheme != null) {
                String lowerCase = scheme.toLowerCase(Locale.ROOT);
                C1h.A08(lowerCase, A00(50, 16, 6));
                if (lowerCase != null) {
                    if (!C1h.A0C(lowerCase, A00(15, 6, 32))) {
                        if (!C1h.A0C(uriA00.getHost(), A00(21, 15, 49))) {
                            return false;
                        }
                        String path = uriA00.getPath();
                        if (!(path != null && AnonymousClass06.A07(path, A00(0, 6, 120), false, 2, null))) {
                            return false;
                        }
                    }
                    return true;
                }
            }
            return false;
        } catch (SecurityException unused) {
            return true;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x00df, code lost:
    
        if (r3 != false) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00f2, code lost:
    
        if (r3 != false) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00f7, code lost:
    
        return null;
     */
    @JvmStatic
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String A03(Uri uri) {
        String scheme;
        Uri uriA00;
        String lowerCase;
        if (uri != null && !A02(uri)) {
            Iterator it = C2141lu.A0U.iterator();
            while (true) {
                boolean zHasNext = it.hasNext();
                String[] strArr = A01;
                if (strArr[7].length() == strArr[4].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A01;
                strArr2[3] = "cq8AP5nJp6MHzKv7Fyv9OKnr2LdcXxMx";
                strArr2[2] = "2i9dHveX3zMngYmJsUYoUfEAAZb6oey7";
                String strA00 = A00(10, 5, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
                String strA002 = A00(6, 4, 102);
                String strA003 = A00(50, 16, 6);
                if (zHasNext) {
                    String param = uri.getQueryParameter((String) it.next());
                    if (param != null && (!AnonymousClass04.A02(param))) {
                        try {
                            uriA00 = AbstractC2351pP.A00(param);
                            C1h.A06(uriA00);
                            String param2 = uriA00.getScheme();
                            if (param2 != null) {
                                lowerCase = param2.toLowerCase(Locale.ROOT);
                                C1h.A08(lowerCase, strA003);
                            } else {
                                lowerCase = null;
                            }
                            if (C1h.A0C(lowerCase, strA002)) {
                                break;
                            }
                            boolean zA0C = C1h.A0C(lowerCase, strA00);
                            String[] strArr3 = A01;
                            if (strArr3[7].length() != strArr3[4].length()) {
                                A01[0] = "LmrebXgT8l7tt0oYZ94BNEJMt49W9u";
                                if (zA0C) {
                                    break;
                                }
                            } else if (zA0C) {
                                break;
                            }
                        } catch (SecurityException unused) {
                            continue;
                        }
                    }
                } else {
                    String param3 = uri.getScheme();
                    if (param3 != null) {
                        scheme = param3.toLowerCase(Locale.ROOT);
                        C1h.A08(scheme, strA003);
                    } else {
                        scheme = null;
                    }
                    if (!C1h.A0C(scheme, strA002)) {
                        boolean zA0C2 = C1h.A0C(scheme, strA00);
                        if (A01[6].length() != 32) {
                            String[] strArr4 = A01;
                            strArr4[1] = "KV8fk";
                            strArr4[5] = "d3jITbKLO0sR";
                        } else {
                            String[] strArr5 = A01;
                            strArr5[3] = "0oHxLEndN3MKS2ZDrq77j2Kvj45sqgXr";
                            strArr5[2] = "57qeRm75soMgQWHUXVQmato4yVZ3hQq8";
                        }
                    }
                    return uri.toString();
                }
            }
            return uriA00.toString();
        }
        return null;
    }
}
