package com.iab.omid.library.vungle.internal;

import android.annotation.SuppressLint;
import android.content.Context;

/* loaded from: classes3.dex */
public class g {

    /* renamed from: b, reason: collision with root package name */
    @SuppressLint({"StaticFieldLeak"})
    private static g f35217b = new g();

    /* renamed from: a, reason: collision with root package name */
    private Context f35218a;

    private g() {
    }

    public static g b() {
        return f35217b;
    }

    public Context a() {
        return this.f35218a;
    }

    public void a(Context context) {
        this.f35218a = context != null ? context.getApplicationContext() : null;
    }
}
