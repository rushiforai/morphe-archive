package com.fyber.inneractive.sdk.web;

import android.media.MediaScannerConnection;
import android.text.TextUtils;

/* loaded from: classes3.dex */
public final class x implements com.fyber.inneractive.sdk.network.f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i0 f31417a;

    public x(i0 i0Var) {
        this.f31417a = i0Var;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        String str = (String) obj;
        if (exc != null || TextUtils.isEmpty(str)) {
            com.fyber.inneractive.sdk.util.r.f31216b.post(new w(this));
            return;
        }
        i0 i0Var = this.f31417a;
        if (com.fyber.inneractive.sdk.util.o.a(i0Var.f31304b) != null) {
            a0 a0Var = new a0(str);
            MediaScannerConnection mediaScannerConnection = new MediaScannerConnection(com.fyber.inneractive.sdk.util.o.a(i0Var.f31304b).getApplicationContext(), a0Var);
            a0Var.f31261b = mediaScannerConnection;
            mediaScannerConnection.connect();
        }
    }
}
