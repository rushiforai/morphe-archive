package com.fyber.inneractive.sdk.ui.controller;

import com.fyber.inneractive.sdk.util.IAlog;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes3.dex */
public final class a implements b {

    /* renamed from: a, reason: collision with root package name */
    public c f31155a;

    /* renamed from: b, reason: collision with root package name */
    public final AtomicBoolean f31156b = new AtomicBoolean(false);

    @Override // com.fyber.inneractive.sdk.ui.controller.b
    public final void a(float f11) {
        if (f11 < 0.01f || !this.f31156b.compareAndSet(false, true)) {
            return;
        }
        IAlog.a("%sVisibility requirement met. visibleViewArea: %.1f%%", IAlog.a(this), Float.valueOf(f11 * 100.0f));
        this.f31155a.t();
    }

    @Override // com.fyber.inneractive.sdk.ui.controller.b
    public final void destroy() {
        throw null;
    }
}
