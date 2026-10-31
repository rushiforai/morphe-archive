package com.bytedance.sdk.openadsdk.core.ok.ycx;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class ycx implements Application.ActivityLifecycleCallbacks {
    private static volatile ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final zb f25891zb;

    private ycx(Application application) {
        this.f25891zb = zb.ycx(application);
    }

    public static ycx ycx(Application application) {
        if (ycx == null) {
            synchronized (ycx.class) {
                try {
                    if (ycx == null) {
                        ycx = new ycx(application);
                        application.registerActivityLifecycleCallbacks(ycx);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityDestroyed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPostResumed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityResumed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(Activity activity) {
        zb zbVar = this.f25891zb;
        if (zbVar != null) {
            zbVar.ycx(activity);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
        zb zbVar = this.f25891zb;
        if (zbVar != null) {
            zbVar.zb(activity);
        }
    }

    public String ycx(String str, long j11, int i5) {
        zb zbVar = this.f25891zb;
        if (zbVar != null) {
            return zbVar.ycx(str, j11, i5);
        }
        return AbstractJsonLexerKt.NULL;
    }
}
