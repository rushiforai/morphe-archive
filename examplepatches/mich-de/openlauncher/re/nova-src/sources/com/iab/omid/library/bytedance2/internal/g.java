package com.iab.omid.library.bytedance2.internal;

import android.annotation.SuppressLint;
import android.content.Context;

/* loaded from: classes3.dex */
public class g {

    /* renamed from: b, reason: collision with root package name */
    @SuppressLint({"StaticFieldLeak"})
    private static g f35063b = new g();

    /* renamed from: a, reason: collision with root package name */
    private Context f35064a;

    private g() {
    }

    public static g b() {
        return f35063b;
    }

    public Context a() {
        return this.f35064a;
    }

    public void a(Context context) {
        this.f35064a = context != null ? context.getApplicationContext() : null;
    }
}
