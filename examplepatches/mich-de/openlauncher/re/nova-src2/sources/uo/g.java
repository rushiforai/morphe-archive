package uo;

import java.io.Serializable;
import java.text.ParseException;

/* loaded from: classes4.dex */
public abstract class g implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public r f91436a = null;

    public static lp.b[] a(String str) throws ParseException {
        String strTrim = str.trim();
        int iIndexOf = strTrim.indexOf(".");
        if (iIndexOf == -1) {
            throw new ParseException("Invalid serialized unsecured/JWS/JWE object: Missing part delimiters", 0);
        }
        int i5 = iIndexOf + 1;
        int iIndexOf2 = strTrim.indexOf(".", i5);
        if (iIndexOf2 == -1) {
            throw new ParseException("Invalid serialized unsecured/JWS/JWE object: Missing second delimiter", 0);
        }
        int i11 = iIndexOf2 + 1;
        int iIndexOf3 = strTrim.indexOf(".", i11);
        if (iIndexOf3 == -1) {
            return new lp.b[]{new lp.b(strTrim.substring(0, iIndexOf)), new lp.b(strTrim.substring(i5, iIndexOf2)), new lp.b(strTrim.substring(i11))};
        }
        int i12 = iIndexOf3 + 1;
        int iIndexOf4 = strTrim.indexOf(".", i12);
        if (iIndexOf4 == -1) {
            throw new ParseException("Invalid serialized JWE object: Missing fourth delimiter", 0);
        }
        if (iIndexOf4 == -1 || strTrim.indexOf(".", iIndexOf4 + 1) == -1) {
            return new lp.b[]{new lp.b(strTrim.substring(0, iIndexOf)), new lp.b(strTrim.substring(i5, iIndexOf2)), new lp.b(strTrim.substring(i11, iIndexOf3)), new lp.b(strTrim.substring(i12, iIndexOf4)), new lp.b(strTrim.substring(iIndexOf4 + 1))};
        }
        throw new ParseException("Invalid serialized unsecured/JWS/JWE object: Too many part delimiters", 0);
    }
}
