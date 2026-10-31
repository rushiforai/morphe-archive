package com.google.android.gms.internal.consent_sdk;

import android.os.Handler;
import android.webkit.WebView;

/* loaded from: classes3.dex */
public final class s extends WebView {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ int f32228d = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Handler f32229a;

    /* renamed from: b, reason: collision with root package name */
    public final v f32230b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f32231c;

    public s(t tVar, Handler handler, v vVar) {
        super(tVar);
        this.f32231c = false;
        this.f32229a = handler;
        this.f32230b = vVar;
    }

    public final void a(String str, String str2) {
        this.f32229a.post(new n(1, this, a80.m.h(str, "(", str2, ");")));
    }
}
