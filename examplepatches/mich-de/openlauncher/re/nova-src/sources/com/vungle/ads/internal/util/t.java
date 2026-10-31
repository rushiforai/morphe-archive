package com.vungle.ads.internal.util;

import android.util.Log;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class t {
    public static void a(String message) {
        Intrinsics.g(message, "message");
        if (u.f47714a) {
            Log.i("VungleWebClient", u.f47715b.h("xxx.xxx.xxx.xxx", message));
        }
    }

    public static void b(String tag, String message) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(message, "message");
        if (u.f47714a) {
            Log.e(tag, u.f47715b.h("xxx.xxx.xxx.xxx", message));
        }
    }

    public static void c(String tag, String message) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(message, "message");
        if (u.f47714a) {
            Log.w(tag, u.f47715b.h("xxx.xxx.xxx.xxx", message));
        }
    }

    public static int a(String tag, String message) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(message, "message");
        if (u.f47714a) {
            return Log.d(tag, u.f47715b.h("xxx.xxx.xxx.xxx", message));
        }
        return -1;
    }

    public static void a(String tag, String message, Throwable throwable) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(message, "message");
        Intrinsics.g(throwable, "throwable");
        if (u.f47714a) {
            Log.e(tag, u.f47715b.h("xxx.xxx.xxx.xxx", message) + "; error: " + throwable.getLocalizedMessage());
        }
    }

    public static void a(String tag, Function0 message) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(message, "message");
        if (u.f47714a) {
            String str = (String) message.invoke();
            Intrinsics.g(str, "<this>");
            Log.w(tag, u.f47715b.h("xxx.xxx.xxx.xxx", str));
        }
    }
}
