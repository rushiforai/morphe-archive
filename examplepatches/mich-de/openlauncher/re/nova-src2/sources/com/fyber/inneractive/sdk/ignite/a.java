package com.fyber.inneractive.sdk.ignite;

import com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.web.r0;

/* loaded from: classes3.dex */
public final class a extends IIgniteServiceCallback.Stub {

    /* renamed from: a, reason: collision with root package name */
    public final r0 f28469a;

    public a(r0 r0Var) {
        this.f28469a = r0Var;
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onError(String str) {
        IAlog.a("CancelTaskCallback onError %s", str);
        this.f28469a.a(false);
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onProgress(String str) {
        IAlog.a("CancelTaskCallback onProgress %s", str);
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onScheduled(String str) {
        IAlog.a("CancelTaskCallback onScheduled %s", str);
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onStart(String str) {
        IAlog.a("CancelTaskCallback onStart %s", str);
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onSuccess(String str) {
        IAlog.a("CancelTaskCallback onSuccess %s", str);
        this.f28469a.a(true);
    }
}
