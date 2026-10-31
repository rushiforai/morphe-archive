package com.fyber.inneractive.sdk.flow;

import android.os.Handler;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public Handler f28045a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.interfaces.b f28046b;

    /* renamed from: c, reason: collision with root package name */
    public final b f28047c = new b(this);

    /* renamed from: d, reason: collision with root package name */
    public final c f28048d = new c(this);

    public d(com.fyber.inneractive.sdk.interfaces.b bVar) {
        this.f28046b = bVar;
    }

    public final void a() {
        IAlog.a("%s : ContentLoadTimeoutHandler destroying timeout handler", IAlog.a(this));
        if (this.f28045a != null) {
            IAlog.a("%s : ContentLoadTimeoutHandler stopping timeout handler", IAlog.a(this));
            Handler handler = this.f28045a;
            if (handler != null) {
                handler.removeCallbacks(this.f28048d);
            }
            this.f28045a.getLooper().quitSafely();
            this.f28045a = null;
        }
    }
}
