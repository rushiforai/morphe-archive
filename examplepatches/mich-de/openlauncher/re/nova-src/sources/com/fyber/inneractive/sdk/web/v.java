package com.fyber.inneractive.sdk.web;

import android.widget.Toast;

/* loaded from: classes3.dex */
public final class v implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f31384a;

    public v(String str) {
        this.f31384a = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Toast.makeText(com.fyber.inneractive.sdk.util.o.f31210a, this.f31384a, 0).show();
    }
}
