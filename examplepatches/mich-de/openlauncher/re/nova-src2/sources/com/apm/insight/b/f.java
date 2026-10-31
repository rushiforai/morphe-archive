package com.apm.insight.b;

import android.content.Context;

/* loaded from: classes.dex */
public class f {

    /* renamed from: a, reason: collision with root package name */
    private static volatile f f21459a;

    /* renamed from: c, reason: collision with root package name */
    private static g f21460c;

    /* renamed from: b, reason: collision with root package name */
    private final b f21461b;

    private f(Context context) {
        this.f21461b = new b(context);
        g gVar = new g();
        f21460c = gVar;
        gVar.a();
    }

    public static f a(Context context) {
        if (f21459a == null) {
            synchronized (f.class) {
                try {
                    if (f21459a == null) {
                        f21459a = new f(context);
                    }
                } finally {
                }
            }
        }
        return f21459a;
    }

    public static g b() {
        return f21460c;
    }

    public final void c() {
        this.f21461b.a();
    }

    public final void d() {
        this.f21461b.b();
    }

    public final b a() {
        return this.f21461b;
    }
}
