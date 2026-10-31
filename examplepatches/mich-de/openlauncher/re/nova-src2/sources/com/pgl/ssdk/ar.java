package com.pgl.ssdk;

import android.os.Handler;

/* loaded from: classes.dex */
public class ar {
    private static Handler a() {
        return az.a().b();
    }

    public static Handler b() {
        return az.a().c();
    }

    public static void a(Runnable runnable) {
        Handler handlerA;
        if (runnable == null || (handlerA = a()) == null) {
            return;
        }
        handlerA.post(runnable);
    }

    public static void b(Runnable runnable) {
        a(runnable, 0L);
    }

    public static void a(Runnable runnable, long j11) {
        Handler handlerB;
        if (runnable == null || (handlerB = b()) == null) {
            return;
        }
        handlerB.postDelayed(runnable, j11);
    }
}
