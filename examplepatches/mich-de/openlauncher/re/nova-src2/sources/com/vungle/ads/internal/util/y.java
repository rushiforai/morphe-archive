package com.vungle.ads.internal.util;

import android.os.Handler;
import android.os.Looper;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class y {

    /* renamed from: a, reason: collision with root package name */
    public static final Handler f47718a = new Handler(Looper.getMainLooper());

    public static boolean a() {
        Looper mainLooper = Looper.getMainLooper();
        if (mainLooper == null) {
            return false;
        }
        return mainLooper.isCurrentThread();
    }

    public static final void b(Function0 tmp0) {
        Intrinsics.g(tmp0, "$tmp0");
        tmp0.invoke();
    }

    public static void a(Function0 block) {
        Intrinsics.g(block, "block");
        if (a()) {
            block.invoke();
        } else {
            f47718a.post(new b4.b(block, 4));
        }
    }
}
