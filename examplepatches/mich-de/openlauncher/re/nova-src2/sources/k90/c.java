package k90;

import b.c0;
import b.u4;
import java.security.cert.Certificate;
import java.security.cert.CertificateParsingException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSession;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import r70.j;
import r70.k;

/* loaded from: classes.dex */
public final class c implements HostnameVerifier {

    /* renamed from: a, reason: collision with root package name */
    public static final c f71242a = new c();

    public static List a(X509Certificate x509Certificate, int i5) throws CertificateParsingException {
        Object obj;
        try {
            Collection<List<?>> subjectAlternativeNames = x509Certificate.getSubjectAlternativeNames();
            if (subjectAlternativeNames == null) {
                return EmptyList.f71733a;
            }
            ArrayList arrayList = new ArrayList();
            for (List<?> list : subjectAlternativeNames) {
                if (list != null && list.size() >= 2 && Intrinsics.b(list.get(0), Integer.valueOf(i5)) && (obj = list.get(1)) != null) {
                    arrayList.add((String) obj);
                }
            }
            return arrayList;
        } catch (CertificateParsingException unused) {
            return EmptyList.f71733a;
        }
    }

    public static boolean b(String str) {
        int i5;
        int length = str.length();
        int length2 = str.length();
        if (length2 < 0) {
            throw new IllegalArgumentException(c0.i(length2, "endIndex < beginIndex: ", " < 0").toString());
        }
        if (length2 > str.length()) {
            StringBuilder sbJ = u4.j(length2, "endIndex > string.length: ", " > ");
            sbJ.append(str.length());
            throw new IllegalArgumentException(sbJ.toString().toString());
        }
        long j11 = 0;
        int i11 = 0;
        while (i11 < length2) {
            char cCharAt = str.charAt(i11);
            if (cCharAt < 128) {
                j11++;
            } else {
                if (cCharAt < 2048) {
                    i5 = 2;
                } else if (cCharAt < 55296 || cCharAt > 57343) {
                    i5 = 3;
                } else {
                    int i12 = i11 + 1;
                    char cCharAt2 = i12 < length2 ? str.charAt(i12) : (char) 0;
                    if (cCharAt > 56319 || cCharAt2 < 56320 || cCharAt2 > 57343) {
                        j11++;
                        i11 = i12;
                    } else {
                        j11 += 4;
                        i11 += 2;
                    }
                }
                j11 += i5;
            }
            i11++;
        }
        return length == ((int) j11);
    }

    /* JADX WARN: Removed duplicated region for block: B:63:0x0105  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean c(String host, X509Certificate x509Certificate) throws CertificateParsingException {
        boolean zB;
        int length;
        Intrinsics.g(host, "host");
        byte[] bArr = y80.c.f96853a;
        if (y80.c.f96858f.f(host)) {
            String strB = y80.a.b(host);
            List listA = a(x509Certificate, 7);
            if (!(listA instanceof Collection) || !listA.isEmpty()) {
                Iterator it = listA.iterator();
                while (it.hasNext()) {
                    if (Intrinsics.b(strB, y80.a.b((String) it.next()))) {
                        return true;
                    }
                }
            }
            return false;
        }
        if (b(host)) {
            Locale US = Locale.US;
            Intrinsics.f(US, "US");
            host = host.toLowerCase(US);
            Intrinsics.f(host, "this as java.lang.String).toLowerCase(locale)");
        }
        List<String> listA2 = a(x509Certificate, 2);
        if (!(listA2 instanceof Collection) || !listA2.isEmpty()) {
            for (String lowerCase : listA2) {
                if (host.length() != 0 && !j.I0(host, ".", false) && !j.A0(host, "..", false) && lowerCase != null && lowerCase.length() != 0 && !j.I0(lowerCase, ".", false) && !j.A0(lowerCase, "..", false)) {
                    String strConcat = !j.A0(host, ".", false) ? host.concat(".") : host;
                    if (!j.A0(lowerCase, ".", false)) {
                        lowerCase = lowerCase.concat(".");
                    }
                    if (b(lowerCase)) {
                        Locale US2 = Locale.US;
                        Intrinsics.f(US2, "US");
                        lowerCase = lowerCase.toLowerCase(US2);
                        Intrinsics.f(lowerCase, "this as java.lang.String).toLowerCase(locale)");
                    }
                    if (!k.K0(lowerCase, "*", false)) {
                        zB = Intrinsics.b(strConcat, lowerCase);
                    } else if (!j.I0(lowerCase, "*.", false) || k.R0('*', 1, 4, lowerCase) != -1 || strConcat.length() < lowerCase.length() || "*.".equals(lowerCase)) {
                        zB = false;
                    } else {
                        String strSubstring = lowerCase.substring(1);
                        Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
                        if (j.A0(strConcat, strSubstring, false) && ((length = strConcat.length() - strSubstring.length()) <= 0 || k.V0('.', length - 1, 4, strConcat) == -1)) {
                            zB = true;
                        }
                    }
                    if (zB) {
                    }
                }
                return true;
            }
        }
        return false;
    }

    @Override // javax.net.ssl.HostnameVerifier
    public final boolean verify(String host, SSLSession session) {
        Intrinsics.g(host, "host");
        Intrinsics.g(session, "session");
        if (b(host)) {
            try {
                Certificate certificate = session.getPeerCertificates()[0];
                Intrinsics.e(certificate, "null cannot be cast to non-null type java.security.cert.X509Certificate");
                return c(host, (X509Certificate) certificate);
            } catch (SSLException unused) {
            }
        }
        return false;
    }
}
