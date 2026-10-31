package com.vungle.ads.internal.util;

import android.content.Context;
import android.content.Intent;
import java.lang.ref.WeakReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class a {
    public static void a(b listener) {
        Intrinsics.g(listener, "listener");
        d.a(d.f47677f, listener);
    }

    public static void b(b listener) {
        Intrinsics.g(listener, "listener");
        d.f47677f.a(listener);
    }

    public static void a(Context context) {
        Intrinsics.g(context, "context");
        d.a(d.f47677f, context);
    }

    public static boolean a() {
        return d.a(d.f47677f);
    }

    public static boolean a(Context context, Intent intent, Intent intent2, com.vungle.ads.internal.ui.m mVar) {
        Intrinsics.g(context, "context");
        d dVar = d.f47677f;
        if (!d.a(dVar)) {
            dVar.f47681d = new c(new WeakReference(context), intent, intent2, mVar);
            return false;
        }
        return d.a(dVar, context, intent, intent2, mVar);
    }
}
