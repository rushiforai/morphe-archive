package com.tiktok.iap.billing.client;

import android.text.TextUtils;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes4.dex */
public final class BillUtils {
    private static final Pattern P_JSON = Pattern.compile("jsonString='(.*?)'");

    public static String parserJsonFromProductDetail(String str) {
        if (TextUtils.isEmpty(str) || !str.contains("jsonString=")) {
            return null;
        }
        try {
            Matcher matcher = P_JSON.matcher(str);
            if (matcher.find()) {
                return matcher.group(1);
            }
        } catch (Throwable unused) {
        }
        return null;
    }
}
