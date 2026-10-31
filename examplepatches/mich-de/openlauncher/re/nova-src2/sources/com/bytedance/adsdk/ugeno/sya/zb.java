package com.bytedance.adsdk.ugeno.sya;

import android.os.Build;
import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class zb {
    public static String ycx(BigDecimal bigDecimal, String str, Locale locale, int i5, int i11, int i12) {
        Locale locale2;
        String strYcx;
        if (bigDecimal == null || TextUtils.isEmpty(str) || locale == null) {
            return b.f42142b;
        }
        String upperCase = str.trim().toUpperCase(Locale.ROOT);
        if (Build.VERSION.SDK_INT >= 30) {
            locale2 = locale;
            strYcx = dj.ycx(bigDecimal, upperCase, locale2, i5, i11, i12);
        } else {
            locale2 = locale;
            strYcx = ycx.ycx(bigDecimal, upperCase, locale2, i5, i11, i12);
        }
        return ycx(locale2) ? ycx(strYcx) : strYcx;
    }

    public static List<sya> zb(BigDecimal bigDecimal, String str, Locale locale, int i5, int i11, int i12) {
        Locale locale2;
        List<sya> listZb;
        if (bigDecimal == null || TextUtils.isEmpty(str) || locale == null) {
            return Collections.EMPTY_LIST;
        }
        String upperCase = str.trim().toUpperCase(Locale.ROOT);
        if (Build.VERSION.SDK_INT >= 30) {
            locale2 = locale;
            listZb = dj.zb(bigDecimal, upperCase, locale2, i5, i11, i12);
        } else {
            locale2 = locale;
            listZb = ycx.zb(bigDecimal, upperCase, locale2, i5, i11, i12);
        }
        if (ycx(locale2)) {
            for (int i13 = 0; i13 < listZb.size(); i13++) {
                sya syaVar = listZb.get(i13);
                String strYcx = ycx(syaVar.zb());
                if (!strYcx.equals(syaVar.zb())) {
                    listZb.set(i13, new sya(syaVar.ycx(), strYcx, syaVar.sya(), syaVar.dj()));
                }
            }
        }
        return listZb;
    }

    private static boolean ycx(Locale locale) {
        if (locale == null) {
            return false;
        }
        return "ar".equalsIgnoreCase(locale.getLanguage());
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0043  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static String ycx(String str) {
        if (str == null || str.isEmpty()) {
            return str;
        }
        StringBuilder sb2 = new StringBuilder();
        for (char c11 : str.toCharArray()) {
            if (Character.isDigit(c11)) {
                int numericValue = Character.getNumericValue(c11);
                if (numericValue >= 0 && numericValue <= 9) {
                    sb2.append((char) (numericValue + 48));
                } else {
                    sb2.append(c11);
                }
            } else if (c11 == 1644) {
                sb2.append(AbstractJsonLexerKt.COMMA);
            } else if (c11 == 1643) {
                sb2.append('.');
            }
        }
        return sb2.toString();
    }
}
