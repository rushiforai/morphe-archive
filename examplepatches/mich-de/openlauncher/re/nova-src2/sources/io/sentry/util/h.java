package io.sentry.util;

import b.u4;
import java.nio.charset.Charset;
import java.util.Locale;
import java.util.regex.Pattern;

/* loaded from: classes4.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final Charset f67833a = Charset.forName("UTF-8");

    /* renamed from: b, reason: collision with root package name */
    public static final Pattern f67834b = Pattern.compile("[\\W_]+");

    public static String a(String str) {
        if (str == null || str.isEmpty()) {
            return str;
        }
        StringBuilder sb2 = new StringBuilder();
        String strSubstring = str.substring(0, 1);
        Locale locale = Locale.ROOT;
        sb2.append(strSubstring.toUpperCase(locale));
        sb2.append(str.substring(1).toLowerCase(locale));
        return sb2.toString();
    }

    public static String b(String str) {
        return (str != null && str.startsWith("\"") && str.endsWith("\"")) ? u4.f(1, 1, str) : str;
    }
}
