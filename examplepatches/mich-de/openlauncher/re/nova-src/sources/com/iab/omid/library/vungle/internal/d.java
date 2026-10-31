package com.iab.omid.library.vungle.internal;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;

/* loaded from: classes3.dex */
public class d implements Application.ActivityLifecycleCallbacks {

    /* renamed from: a, reason: collision with root package name */
    private boolean f35208a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f35209b;

    /* renamed from: c, reason: collision with root package name */
    private a f35210c;

    public interface a {
        void a(boolean z11);
    }

    public void a(Context context) {
        if (context instanceof Application) {
            ((Application) context).registerActivityLifecycleCallbacks(this);
        }
    }

    public ActivityManager.RunningAppProcessInfo b() {
        ActivityManager.RunningAppProcessInfo runningAppProcessInfo = new ActivityManager.RunningAppProcessInfo();
        ActivityManager.getMyMemoryState(runningAppProcessInfo);
        return runningAppProcessInfo;
    }

    public boolean c() {
        return this.f35209b;
    }

    public boolean d() {
        return false;
    }

    public void e() {
        this.f35208a = true;
        boolean zA = a();
        this.f35209b = zA;
        b(zA);
    }

    public void f() {
        this.f35208a = false;
        this.f35210c = null;
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
    public void onActivityResumed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(Activity activity) {
        a(true);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
        a(a());
    }

    public void a(a aVar) {
        this.f35210c = aVar;
    }

    public void b(boolean z11) {
    }

    private void a(boolean z11) {
        if (this.f35209b != z11) {
            this.f35209b = z11;
            if (this.f35208a) {
                b(z11);
                a aVar = this.f35210c;
                if (aVar != null) {
                    aVar.a(z11);
                }
            }
        }
    }

    private boolean a() {
        return b().importance == 100 || d();
    }
}
