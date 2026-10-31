package com.fyber.inneractive.sdk.util;

import java.util.concurrent.RejectedExecutionException;

/* loaded from: classes3.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object[] f31176a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.web.e f31177b;

    public c(com.fyber.inneractive.sdk.web.e eVar) {
        this.f31177b = eVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f31177b.getClass();
        com.fyber.inneractive.sdk.web.e eVar = this.f31177b;
        boolean z11 = eVar.f31284f;
        if (z11) {
            return;
        }
        d dVar = new d(eVar);
        eVar.f31282d = dVar;
        if (z11) {
            return;
        }
        try {
            eVar.f31279a.execute(dVar);
        } catch (NullPointerException e3) {
            IAlog.f("AsyncTaskExecutor : execute(): Unable to execute the null task: %s", e3.getMessage());
        } catch (RejectedExecutionException e11) {
            IAlog.f("AsyncTaskExecutor : execute(): Unable to execute the task: %s", e11.getMessage());
        }
    }
}
