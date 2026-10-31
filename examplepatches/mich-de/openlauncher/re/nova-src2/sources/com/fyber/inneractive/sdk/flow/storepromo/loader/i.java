package com.fyber.inneractive.sdk.flow.storepromo.loader;

import b.c0;
import b.u4;

/* loaded from: classes3.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public static final String f28333a = b("app_screen_%d");

    /* renamed from: b, reason: collision with root package name */
    public static final String f28334b = "document.getElementById(\"app_screen_%d\").src = app_screen_%d;\n";

    /* renamed from: c, reason: collision with root package name */
    public static final String f28335c = b("app_video_url_%d");

    /* renamed from: d, reason: collision with root package name */
    public static final String f28336d = "document.getElementById(\"app_video_url_%d\").src = app_video_url_%d;\n";

    /* renamed from: e, reason: collision with root package name */
    public static final String f28337e = b("app_icon");

    /* renamed from: f, reason: collision with root package name */
    public static final String f28338f = "document.getElementById(\"app_icon\").src = app_icon;\n";

    /* renamed from: g, reason: collision with root package name */
    public static final String f28339g = b("app_name");

    /* renamed from: h, reason: collision with root package name */
    public static final String f28340h = a("app_name");

    /* renamed from: i, reason: collision with root package name */
    public static final String f28341i = b("app_pub_name");

    /* renamed from: j, reason: collision with root package name */
    public static final String f28342j = a("app_pub_name");

    /* renamed from: k, reason: collision with root package name */
    public static final String f28343k = b("app_label");

    /* renamed from: l, reason: collision with root package name */
    public static final String f28344l = a("app_label");

    /* renamed from: m, reason: collision with root package name */
    public static final String f28345m = b("app_size");
    public static final String n = a("app_size");
    public static final String o = b("app_rating");

    /* renamed from: p, reason: collision with root package name */
    public static final String f28346p = a("app_rating");

    /* renamed from: q, reason: collision with root package name */
    public static final String f28347q = b("app_rating_icon");

    /* renamed from: r, reason: collision with root package name */
    public static final String f28348r = "document.getElementById(\"app_rating_icon\").src = app_rating_icon;\n";

    public static String a(String str) {
        return c0.n("document.getElementById(\"", str, "\").innerHTML = `${", str, "}`;\n");
    }

    public static String b(String str) {
        return c0.l("var ", str, " = `%s`;\n");
    }

    public static String a(boolean z11, String str) {
        return c0.q(u4.k("document.getElementById(\"", str, "\").style.display = "), z11 ? "'block'" : "'none'", ";\n");
    }
}
