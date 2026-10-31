package com.fyber.inneractive.sdk.web;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class w implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ x f31409a;

    public w(x xVar) {
        this.f31409a = xVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f31409a.f31417a.getClass();
        com.fyber.inneractive.sdk.util.r.f31216b.post(new v("Image failed to download."));
        this.f31409a.f31417a.a(com.fyber.inneractive.sdk.mraid.k.STORE_PICTURE, "Error downloading and saving image file.");
        IAlog.a("failed to download and save the image file.", new Object[0]);
    }
}
