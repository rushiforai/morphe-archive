package com.fyber.inneractive.sdk.flow;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class j implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ k f28163a;

    public j(k kVar) {
        this.f28163a = kVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        k kVar = this.f28163a;
        kVar.getClass();
        IAlog.a("%s : IAAdContentLoaderImpl : retry load ad task started execution", IAlog.a(kVar));
        this.f28163a.b();
    }
}
