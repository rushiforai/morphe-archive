package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Arrays;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.pP, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2351pP {
    public static byte[] A00;
    public static String[] A01 = {"7ohGC5g", "BESl4Xd", "iUgFvmR9fU9rB14tb7We98OmvwePZ1", "TAphUfcpA", "kzqdOSSqZA4kTMjsfdu0WHMTMSeOJpsG", "kkWiSP6EEdgokKFwFZk1KzEPUpP5pdBL", "Sq5ynKeXE6NTcDzdnBNMA", "lzNSrnHLqWOxwLQ"};

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 114);
            if (A01[3].length() == 19) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[7] = "rgUP3FcFDVOOAnn";
            strArr[6] = "C5ye4JewP89EotTU6TfsV";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A00 = new byte[]{7, 58, 64, 12, 89, 32, 12, 57, 60, 58, 64, 12, 89, 32, 12, 57, 15, 12, 24, 10, 13, 12, 60, 9, 8, 30, 3, 20, 37, 38, 28, 33, 26, -45, 40, 37, 31, -45, -40, 38, -45, 22, 20, 40, 38, 24, 23, -45, 24, 43, 22, 24, 35, 39, 28, 34, 33, -19, -45, -40, 38, -31, -24, 48, 39, 60, 39, -26, 59, 56, 47, -26, -24, -21, 57, -24, -26, 52, 53, 58, -26, 43, 55, 59, 39, 50, -26, 58, 53, -26, 39, 52, 42, 56, 53, 47, 42, -26, 59, 56, 47, -26, -24, -21, 57, -24, -12, -26, 10, 43, 40, 59, 45, -26, 47, 52, 44, 53, 0, -26, -21, 57, -12, -26, 21, 56, 47, 45, 47, 52, 39, 50, -26, 59, 56, 47, 0, -26, -21, 57, -9, -18, 3, -18, -30, -1, -10, -83, -18, 2, 1, -11, -4, -1, -10, 1, 6, -57, -83, -81, -78, 0, -81, -69, -83, -18, -5, -15, -1, -4, -10, -15, -30, -1, -10, -83, -18, 2, 1, -11, -4, -1, -10, 1, 6, -57, -83, -81, -78, 0, -81, -69, 22, 13, 34, 13, 1, 30, 21, -52, 27, 28, 13, 29, 33, 17, -52, 28, 13, 30, 32, -26, -52, -50, -47, 31, -50, -38, -52, 13, 26, 16, 30, 27, 21, 16, 1, 30, 21, -52, 27, 28, 13, 29, 33, 17, -52, 28, 13, 30, 32, -26, -52, -50, -47, 31, -50, -38, 48, 39, 60, 39, 27, 56, 47, -26, 54, 39, 58, 46, 0, -26, -24, -21, 57, -24, -12, -26, 39, 52, 42, 56, 53, 47, 42, 27, 56, 47, -26, 54, 39, 58, 46, 0, -26, -24, -21, 57, -24, -12, 1, -8, 13, -8, -20, 9, 0, -73, 10, -6, -1, -4, 4, -4, -47, -73, -71, -68, 10, -71, -59, -73, -8, 5, -5, 9, 6, 0, -5, -20, 9, 0, -73, 10, -6, -1, -4, 4, -4, -47, -73, -71, -68, 10, -71, -59};
    }

    static {
        A09();
    }

    public static Uri A00(String str) throws SecurityException {
        Uri uri = Uri.parse(str);
        C0957Hh c0957HhA00 = AbstractC2094l9.A00();
        if (c0957HhA00 != null) {
            boolean zA30 = C2203mv.A30(c0957HhA00);
            if (A01[4].charAt(6) != 'S') {
                throw new RuntimeException();
            }
            A01[4] = "EnCbrOSPna2eJt3ahTIDz2YGURRqGvvY";
            if (!zA30) {
                return uri;
            }
        }
        if (!A0D(uri)) {
            Uri androidUri = A01(str);
            return androidUri;
        }
        A0A(str, uri);
        if (A01[0].length() == 17) {
            throw new RuntimeException();
        }
        A01[0] = "gq60LFwB18XMq";
        return uri;
    }

    public static Uri A01(String str) {
        try {
            URI uri = new URI(str);
            if (uri.isOpaque()) {
                Uri androidUri = A03(uri);
                A0B(str, uri, androidUri);
                return androidUri;
            }
            Uri androidUri2 = A02(uri);
            A0C(str, uri, androidUri2, false);
            return androidUri2;
        } catch (URISyntaxException e3) {
            throw A04(str, e3);
        }
    }

    public static Uri A02(URI uri) {
        return new Uri.Builder().scheme(uri.getScheme()).encodedAuthority(uri.getRawAuthority()).encodedPath(uri.getRawPath()).encodedQuery(uri.getRawQuery()).encodedFragment(uri.getRawFragment()).build();
    }

    public static Uri A03(URI uri) {
        return new Uri.Builder().scheme(uri.getScheme()).encodedOpaquePart(uri.getRawSchemeSpecificPart()).encodedFragment(uri.getRawFragment()).build();
    }

    public static SecurityException A04(String str, URISyntaxException uRISyntaxException) {
        return new SecurityException(String.format(Locale.US, A05(26, 36, 65), str, uRISyntaxException.getMessage()));
    }

    public static URI A06(Uri uri) {
        try {
            URI javaUri = new URI(uri.toString());
            if (A0F(javaUri, uri)) {
                return javaUri;
            }
            return null;
        } catch (URISyntaxException unused) {
            return null;
        }
    }

    public static URI A07(String str, Uri uri) {
        try {
            return new URI(uri.getScheme(), uri.getUserInfo(), uri.getHost(), uri.getPort(), uri.getPath(), uri.getQuery(), uri.getFragment());
        } catch (URISyntaxException e3) {
            if (A01[3].length() == 19) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[7] = "2Q8u2ghBzy6EIpF";
            strArr[6] = "vCUILh5Fo1xS1klaxOFGD";
            URI uriA06 = A06(uri);
            if (uriA06 != null) {
                return uriA06;
            }
            throw A04(str, e3);
        }
    }

    public static URI A08(String str, Uri uri) {
        try {
            return new URI(uri.getScheme(), uri.getSchemeSpecificPart(), uri.getFragment());
        } catch (URISyntaxException e3) {
            throw A04(str, e3);
        }
    }

    public static void A0A(String str, Uri uri) throws SecurityException {
        if (uri.isOpaque()) {
            URI javaUri = A08(str, uri);
            A0B(str, javaUri, uri);
        } else {
            URI uriA07 = A07(str, uri);
            A0C(str, uriA07, uri, A0F(uriA07, uri));
        }
    }

    public static void A0B(String str, URI uri, Uri uri2) {
        boolean zA0E = A0E(uri.getScheme(), uri2.getScheme());
        boolean zA0E2 = A0E(uri.getSchemeSpecificPart(), uri2.getSchemeSpecificPart());
        if (zA0E && zA0E2) {
            return;
        }
        String strA05 = A05(0, 0, 114);
        if (!zA0E) {
            strA05 = strA05 + String.format(Locale.US, A05(290, 46, 37), uri.getScheme(), uri2.getScheme());
        }
        if (!zA0E2) {
            strA05 = strA05 + String.format(Locale.US, A05(192, 56, 58), uri.getSchemeSpecificPart(), uri2.getSchemeSpecificPart());
        }
        Locale locale = Locale.US;
        String debugInfo = uri.toString();
        throw new SecurityException(String.format(locale, A05(63, 77, 84), debugInfo, uri2.toString(), strA05, str));
    }

    public static void A0C(String str, URI uri, Uri uri2, boolean z11) {
        boolean zA0E = A0E(uri.getScheme(), uri2.getScheme());
        boolean zA0E2 = A0E(uri.getAuthority(), uri2.getAuthority());
        boolean zA0E3 = A0E(uri.getPath(), uri2.getPath());
        String strA05 = A05(0, 0, 114);
        if (!zA0E) {
            strA05 = strA05 + String.format(Locale.US, A05(290, 46, 37), uri.getScheme(), uri2.getScheme());
        }
        if (!z11 && !zA0E2) {
            strA05 = strA05 + String.format(Locale.US, A05(140, 52, 27), uri.getAuthority(), uri2.getAuthority());
        }
        if (!zA0E3) {
            strA05 = strA05 + String.format(Locale.US, A05(248, 42, 84), uri.getPath(), uri2.getPath());
        }
        if (zA0E && zA0E2 && zA0E3) {
        } else {
            throw new SecurityException(String.format(Locale.US, A05(63, 77, 84), uri.toString(), uri2.toString(), strA05, str));
        }
    }

    public static boolean A0D(Uri uri) {
        if (uri.getScheme() == null) {
            return true;
        }
        return uri.getScheme().matches(A05(0, 26, 109));
    }

    public static boolean A0E(String str, String str2) {
        String strA05 = A05(0, 0, 114);
        if (str == null || str.equals(strA05)) {
            return str2 == null || str2.equals(strA05);
        }
        return str.equals(str2);
    }

    public static boolean A0F(URI uri, Uri uri2) {
        String host = uri2.getHost();
        String androidHost = uri.getHost();
        if (androidHost == null && host != null) {
            String androidHost2 = A05(62, 1, 23);
            if (host.contains(androidHost2)) {
                return true;
            }
        }
        return false;
    }
}
