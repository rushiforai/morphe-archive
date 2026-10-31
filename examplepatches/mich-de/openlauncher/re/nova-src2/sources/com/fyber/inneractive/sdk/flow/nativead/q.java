package com.fyber.inneractive.sdk.flow.nativead;

import b.c0;
import com.fyber.inneractive.sdk.config.IAConfigManager;

/* loaded from: classes3.dex */
public abstract class q {

    /* renamed from: a, reason: collision with root package name */
    public static final String f28243a;

    /* renamed from: b, reason: collision with root package name */
    public static final String f28244b;

    static {
        String strB = com.fyber.inneractive.sdk.util.o.b("ia_js_load_monitor.txt");
        f28243a = c0.l("<html><head>", strB, "<script src='%s'></script></head><body></body></html>");
        f28244b = c0.l("<html><head>", strB, "%s</head><body></body></html>");
    }

    public static boolean a(String str) {
        return (str == null || str.trim().isEmpty()) ? false : true;
    }

    public static String b(String str) {
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        if (str.startsWith(iAConfigManager.f27758r ? "https" : "http")) {
            return String.format(f28243a, str);
        }
        if (iAConfigManager.f27758r && !str.startsWith("https")) {
            return null;
        }
        if (!str.startsWith("<script")) {
            str = "<script type='text/javascript'>".concat(str);
        }
        if (!str.endsWith("</script>")) {
            str = str.concat("</script>");
        }
        return String.format(f28244b, str);
    }
}
