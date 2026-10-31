package com.bytedance.sdk.openadsdk.core;

import android.app.Application;
import android.content.Context;
import com.bytedance.sdk.openadsdk.ApmHelper;

/* loaded from: classes2.dex */
public class dy {
    private final com.bytedance.sdk.openadsdk.utils.ycx ycx = new com.bytedance.sdk.openadsdk.utils.ycx();

    /* renamed from: zb, reason: collision with root package name */
    private boolean f25353zb;

    public static class ycx {
        private static final dy ycx = new dy();
    }

    public static dy ycx() {
        return ycx.ycx;
    }

    public boolean dj() {
        return this.ycx.ycx();
    }

    public com.bytedance.sdk.openadsdk.utils.ycx lud() {
        return this.ycx;
    }

    public boolean sya() {
        return this.f25353zb;
    }

    public void zb() {
        try {
            Context contextYcx = pmi.ycx();
            if (contextYcx instanceof Application) {
                ((Application) contextYcx).registerActivityLifecycleCallbacks(this.ycx);
                this.f25353zb = true;
            } else {
                if (contextYcx == null || contextYcx.getApplicationContext() == null) {
                    return;
                }
                ((Application) contextYcx.getApplicationContext()).registerActivityLifecycleCallbacks(this.ycx);
                this.f25353zb = true;
            }
        } catch (Throwable th2) {
            ApmHelper.reportCustomError("registerActivityLifecycleError", "registerActivityLifecycle", th2);
        }
    }

    public boolean ycx(boolean z11) {
        return this.ycx.ycx(z11);
    }
}
