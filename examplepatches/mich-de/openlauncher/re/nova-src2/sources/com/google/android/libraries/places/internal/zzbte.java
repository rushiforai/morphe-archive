package com.google.android.libraries.places.internal;

import java.security.cert.CertificateParsingException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSession;

/* loaded from: classes3.dex */
public final class zzbte implements HostnameVerifier {
    public static final zzbte zza = new zzbte();
    private static final Pattern zzb = Pattern.compile("([0-9a-fA-F]*:[0-9a-fA-F:.]*)|([\\d.]+)");

    private zzbte() {
    }

    private static List zza(X509Certificate x509Certificate, int i5) throws CertificateParsingException {
        Integer num;
        String str;
        ArrayList arrayList = new ArrayList();
        try {
            Collection<List<?>> subjectAlternativeNames = x509Certificate.getSubjectAlternativeNames();
            if (subjectAlternativeNames == null) {
                return Collections.EMPTY_LIST;
            }
            for (List<?> list : subjectAlternativeNames) {
                if (list != null && list.size() >= 2 && (num = (Integer) list.get(0)) != null && num.intValue() == i5 && (str = (String) list.get(1)) != null) {
                    arrayList.add(str);
                }
            }
            return arrayList;
        } catch (CertificateParsingException unused) {
            return Collections.EMPTY_LIST;
        }
    }

    private static final boolean zzb(String str, String str2) {
        if (str != null && str.length() != 0 && !str.startsWith(".") && !str.endsWith("..") && str2 != null && str2.length() != 0 && !str2.startsWith(".") && !str2.endsWith("..")) {
            if (!str.endsWith(".")) {
                str = str.concat(".");
            }
            if (!str2.endsWith(".")) {
                str2 = str2.concat(".");
            }
            String lowerCase = str2.toLowerCase(Locale.US);
            if (!lowerCase.contains("*")) {
                return str.equals(lowerCase);
            }
            if (!lowerCase.startsWith("*.") || lowerCase.indexOf(42, 1) != -1 || str.length() < lowerCase.length() || "*.".equals(lowerCase)) {
                return false;
            }
            String strSubstring = lowerCase.substring(1);
            if (!str.endsWith(strSubstring)) {
                return false;
            }
            int length = str.length() - strSubstring.length();
            return length <= 0 || str.lastIndexOf(46, length + (-1)) == -1;
        }
        return false;
    }

    @Override // javax.net.ssl.HostnameVerifier
    public final boolean verify(String str, SSLSession sSLSession) throws CertificateParsingException {
        X509Certificate x509Certificate;
        String strZza;
        try {
            x509Certificate = (X509Certificate) sSLSession.getPeerCertificates()[0];
        } catch (SSLException unused) {
        }
        if (zzb.matcher(str).matches()) {
            List listZza = zza(x509Certificate, 7);
            int size = listZza.size();
            for (int i5 = 0; i5 < size; i5++) {
                if (str.equalsIgnoreCase((String) listZza.get(i5))) {
                    return true;
                }
            }
            return false;
        }
        String lowerCase = str.toLowerCase(Locale.US);
        List listZza2 = zza(x509Certificate, 2);
        int size2 = listZza2.size();
        int i11 = 0;
        boolean z11 = false;
        while (i11 < size2) {
            if (zzb(lowerCase, (String) listZza2.get(i11))) {
                return true;
            }
            i11++;
            z11 = true;
        }
        if (!z11 && (strZza = new zzbta(x509Certificate.getSubjectX500Principal()).zza("cn")) != null) {
            return zzb(lowerCase, strZza);
        }
        return false;
    }
}
