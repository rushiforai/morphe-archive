package com.google.android.libraries.ads.mobile.sdk.common;

import ads_mobile_sdk.ci3;
import ads_mobile_sdk.db0;
import ads_mobile_sdk.gu0;
import ads_mobile_sdk.j0;
import ads_mobile_sdk.l0;
import ads_mobile_sdk.mu0;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import ar.a;
import b.b4;
import b.f4;
import g.o;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import mx.e0;
import t70.m0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/google/android/libraries/ads/mobile/sdk/common/AdActivity;", "Lg/o;", "<init>", "()V", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final class AdActivity extends o {
    public f4 o;

    @Override // g.o, android.app.Activity, android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration newConfig) {
        Intrinsics.g(newConfig, "newConfig");
        super.onConfigurationChanged(newConfig);
        f4 f4Var = this.o;
        if (f4Var != null) {
            f4Var.onConfigurationChanged(newConfig);
        }
    }

    @Override // g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        Bundle bundle2;
        super.onCreate(bundle);
        b4.f15783a.getClass();
        if (gu0.f4079b.f1694a == null) {
            finish();
            return;
        }
        Bundle extras = getIntent().getExtras();
        Continuation continuation = null;
        Integer numValueOf = (extras == null || (bundle2 = extras.getBundle("ad_activity_delegate_bundle")) == null) ? null : Integer.valueOf(bundle2.getInt("ad_activity_delegate"));
        if (numValueOf == null) {
            ((ci3) ((db0) gu0.a()).F.get()).a("AdActivityMissingDelegateKey", (Throwable) new Exception("AdActivityMissingDelegateKey"));
            mu0.a("Could not retrieve AdActivityDelegate key", (Exception) null);
            finish();
            return;
        }
        j0 j0Var = (j0) ((l0) ((db0) gu0.a()).Q.get()).f6026d.remove(numValueOf);
        if (j0Var != null) {
            j0Var.f5070b.c(null);
        }
        f4 f4Var = j0Var != null ? j0Var.f5069a : null;
        if (f4Var == null) {
            ((ci3) ((db0) gu0.a()).F.get()).a("AdActivityMissingDelegate", (Throwable) new Exception("AdActivityMissingDelegate"));
            mu0.a("No AdActivityDelegate associated with key", (Exception) null);
            finish();
            return;
        }
        this.o = f4Var;
        requestWindowFeature(1);
        try {
            Intrinsics.f(getWindow().getDecorView(), "getDecorView(...)");
            f4Var.a(this);
        } catch (Exception e3) {
            b4.f15783a.getClass();
            ((ci3) ((db0) gu0.a()).F.get()).a("AdActivityDecorViewWorkaround", (Throwable) e3);
            mu0.a("Failed to get DecorView", e3);
            t70.j0 j0Var2 = (t70.j0) ((db0) gu0.a()).f2348u.get();
            e0 e0Var = new e0(f4Var, continuation, 4);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var2, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var2, context, null, new a(e0Var, null), 2);
            finish();
        }
    }

    @Override // android.app.Activity
    public final void onDestroy() {
        f4 f4Var = this.o;
        if (f4Var != null) {
            f4Var.onDestroy();
        }
        this.o = null;
        super.onDestroy();
    }

    @Override // android.app.Activity
    public final void onPause() {
        f4 f4Var = this.o;
        if (f4Var != null) {
            f4Var.onPause();
        }
        super.onPause();
    }

    @Override // android.app.Activity
    public final void onRestart() {
        super.onRestart();
        f4 f4Var = this.o;
        if (f4Var != null) {
            f4Var.c();
        }
    }

    @Override // android.app.Activity
    public final void onResume() {
        super.onResume();
        f4 f4Var = this.o;
        if (f4Var != null) {
            f4Var.onResume();
        }
    }

    @Override // android.app.Activity
    public final void onStart() {
        super.onStart();
        f4 f4Var = this.o;
        if (f4Var != null) {
            f4Var.a$1();
        }
    }

    @Override // android.app.Activity
    public final void onStop() {
        f4 f4Var = this.o;
        if (f4Var != null) {
            f4Var.onStop();
        }
        super.onStop();
    }

    @Override // g.o, android.app.Activity
    public final void onUserLeaveHint() {
        super.onUserLeaveHint();
        f4 f4Var = this.o;
        if (f4Var != null) {
            f4Var.b();
        }
    }

    @Override // g.o, android.app.Activity
    public final void setContentView(int i5) {
        super.setContentView(i5);
        f4 f4Var = this.o;
        if (f4Var != null) {
            f4Var.e();
        }
    }

    @Override // g.o, android.app.Activity
    public final void setContentView(View view) {
        super.setContentView(view);
        f4 f4Var = this.o;
        if (f4Var != null) {
            f4Var.e();
        }
    }

    @Override // g.o, android.app.Activity
    public final void setContentView(View view, ViewGroup.LayoutParams layoutParams) {
        super.setContentView(view, layoutParams);
        f4 f4Var = this.o;
        if (f4Var != null) {
            f4Var.e();
        }
    }
}
