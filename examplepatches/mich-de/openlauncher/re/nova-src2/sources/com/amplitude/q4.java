package com.amplitude;

import android.webkit.ValueCallback;
import kotlin.Result;

/* loaded from: classes2.dex */
public final class q4 implements ValueCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t70.m f20733a;

    public q4(t70.m mVar) {
        this.f20733a = mVar;
    }

    @Override // android.webkit.ValueCallback
    public final void onReceiveValue(Object obj) {
        t70.m mVar = this.f20733a;
        int i5 = Result.f71687b;
        mVar.resumeWith((String) obj);
    }
}
