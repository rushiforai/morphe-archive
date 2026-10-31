package com.pgl.ssdk;

import android.os.HandlerThread;
import com.pgl.ssdk.a3;

/* loaded from: classes.dex */
public class az {

    /* renamed from: a, reason: collision with root package name */
    private final a2<a0> f42322a;

    /* renamed from: b, reason: collision with root package name */
    private a3 f42323b;

    /* renamed from: c, reason: collision with root package name */
    private a3 f42324c;

    /* loaded from: classes4.dex */
    public static class b {

        /* renamed from: a, reason: collision with root package name */
        private static final az f42325a = new az();
    }

    private az() {
        this.f42322a = a2.a(2);
    }

    private a0 a(a3.a aVar, String str) {
        try {
            HandlerThread handlerThread = new HandlerThread(str);
            handlerThread.start();
            return new a0(handlerThread, aVar);
        } catch (Throwable unused) {
            return null;
        }
    }

    public a3 b() {
        if (this.f42324c == null) {
            synchronized (az.class) {
                try {
                    if (this.f42324c == null) {
                        this.f42324c = a("pags_net_handler");
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return this.f42324c;
    }

    public a3 c() {
        if (this.f42323b == null) {
            synchronized (az.class) {
                try {
                    if (this.f42323b == null) {
                        this.f42323b = a("pags_ssdk_handler");
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return this.f42323b;
    }

    public a3 a(String str) {
        return b(null, str);
    }

    public a3 b(a3.a aVar, String str) {
        a0 a0Var = (a0) this.f42322a.a();
        if (a0Var == null) {
            return a(aVar, str);
        }
        a0Var.a(aVar);
        a0Var.a(str);
        return a0Var;
    }

    public static az a() {
        return b.f42325a;
    }
}
