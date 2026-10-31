package com.fyber.inneractive.sdk.network;

import android.app.Application;
import android.os.HandlerThread;
import java.util.concurrent.LinkedBlockingQueue;
import org.json.JSONArray;

/* loaded from: classes.dex */
public final class f implements com.fyber.inneractive.sdk.util.e1 {

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.util.d1 f28712d;

    /* renamed from: e, reason: collision with root package name */
    public int f28713e;

    /* renamed from: a, reason: collision with root package name */
    public final LinkedBlockingQueue f28709a = new LinkedBlockingQueue();

    /* renamed from: b, reason: collision with root package name */
    public JSONArray f28710b = new JSONArray();

    /* renamed from: f, reason: collision with root package name */
    public boolean f28714f = false;

    /* renamed from: g, reason: collision with root package name */
    public boolean f28715g = false;

    /* renamed from: c, reason: collision with root package name */
    public final HandlerThread f28711c = new HandlerThread("EventCollectorHandlerThread", 0);

    public final void a(Application application) {
        if (!this.f28715g) {
            this.f28715g = true;
            this.f28711c.start();
            com.fyber.inneractive.sdk.util.d1 d1Var = new com.fyber.inneractive.sdk.util.d1(this.f28711c.getLooper(), this);
            this.f28712d = d1Var;
            this.f28714f = true;
            this.f28713e = 30;
            if (d1Var.hasMessages(12312329)) {
                this.f28712d.removeMessages(12312329);
            }
            long j11 = this.f28713e * 1000;
            com.fyber.inneractive.sdk.util.d1 d1Var2 = this.f28712d;
            if (d1Var2 != null) {
                d1Var2.post(new c(this, 12312329, j11));
            }
        }
        application.registerActivityLifecycleCallbacks(new d(this));
    }
}
