package com.apm.insight.runtime;

import android.os.Handler;
import android.os.HandlerThread;

/* loaded from: classes.dex */
public class m {

    /* renamed from: a, reason: collision with root package name */
    private static volatile p f21910a;

    /* renamed from: b, reason: collision with root package name */
    private static volatile Handler f21911b;

    public static p a() {
        if (f21910a == null) {
            b();
        }
        return f21910a;
    }

    private static HandlerThread b() {
        if (f21910a == null) {
            synchronized (m.class) {
                try {
                    if (f21910a == null) {
                        p pVar = new p("default_npth_thread");
                        f21910a = pVar;
                        pVar.b();
                    }
                } finally {
                }
            }
        }
        return f21910a.c();
    }
}
