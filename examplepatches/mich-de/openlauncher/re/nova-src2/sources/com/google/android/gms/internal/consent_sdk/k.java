package com.google.android.gms.internal.consent_sdk;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.os.Bundle;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class k implements Application.ActivityLifecycleCallbacks {

    /* renamed from: a, reason: collision with root package name */
    public final Activity f32116a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m f32117b;

    public k(m mVar, Activity activity) {
        Objects.requireNonNull(mVar);
        this.f32117b = mVar;
        this.f32116a = activity;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        m mVar = this.f32117b;
        Dialog dialog = mVar.f32139g;
        AtomicReference atomicReference = mVar.f32144l;
        if (dialog == null || !mVar.f32145m) {
            return;
        }
        dialog.setOwnerActivity(activity);
        t tVar = mVar.f32134b;
        if (tVar != null) {
            tVar.f32241a = activity;
        }
        k kVar = (k) atomicReference.getAndSet(null);
        if (kVar != null) {
            kVar.f32117b.f32133a.unregisterActivityLifecycleCallbacks(kVar);
            k kVar2 = new k(mVar, activity);
            mVar.f32133a.registerActivityLifecycleCallbacks(kVar2);
            atomicReference.set(kVar2);
        }
        Dialog dialog2 = mVar.f32139g;
        if (dialog2 != null) {
            dialog2.show();
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
        Dialog dialog;
        if (activity != this.f32116a) {
            return;
        }
        boolean zIsChangingConfigurations = activity.isChangingConfigurations();
        m mVar = this.f32117b;
        if (zIsChangingConfigurations && mVar.f32145m && (dialog = mVar.f32139g) != null) {
            dialog.dismiss();
            return;
        }
        zzg zzgVar = new zzg(3, "Activity is destroyed.");
        Dialog dialog2 = mVar.f32139g;
        if (dialog2 != null) {
            dialog2.dismiss();
            mVar.f32139g = null;
        }
        mVar.f32134b.f32241a = null;
        k kVar = (k) mVar.f32144l.getAndSet(null);
        if (kVar != null) {
            kVar.f32117b.f32133a.unregisterActivityLifecycleCallbacks(kVar);
        }
        ox.r rVar = (ox.r) mVar.f32143k.getAndSet(null);
        if (rVar == null) {
            return;
        }
        mVar.d(zzgVar);
        rVar.a(zzgVar.a());
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
    }
}
