package com.vungle.ads.internal.network;

import android.os.Build;
import com.vungle.ads.BuildConfig;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class f0 {

    /* renamed from: a, reason: collision with root package name */
    public static String f47245a = a();

    /* renamed from: b, reason: collision with root package name */
    public static String f47246b;

    /* renamed from: c, reason: collision with root package name */
    public static String f47247c;

    public static void a(String str) {
        f47246b = str;
    }

    public static String b() {
        return f47246b;
    }

    public static void c(String str) {
        Intrinsics.g(str, "<set-?>");
        f47245a = str;
    }

    public static String d() {
        return f47245a;
    }

    public static String a() {
        return ("Amazon".equals(Build.MANUFACTURER) ? "VungleAmazon/" : "VungleDroid/").concat(BuildConfig.VERSION_NAME);
    }

    public static void b(String str) {
        f47247c = str;
    }

    public static String c() {
        return f47247c;
    }
}
