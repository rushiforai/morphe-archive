package com.bytedance.sdk.openadsdk.activity.single;

import android.app.Activity;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.View;
import android.window.OnBackInvokedCallback;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.component.reward.ycx.uh;
import com.bytedance.sdk.openadsdk.utils.bhi;
import com.bytedance.sdk.openadsdk.utils.oty;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

/* loaded from: classes2.dex */
public class TTBaseActivity extends Activity {
    protected String kgy;
    private OnBackInvokedCallback sya;
    private View ycx;
    protected boolean rmy = false;

    /* renamed from: zb, reason: collision with root package name */
    private int f24323zb = 0;

    /* renamed from: dj, reason: collision with root package name */
    private Boolean f24322dj = null;

    public static class ycx implements OnBackInvokedCallback {
        private final WeakReference<TTBaseActivity> ycx;

        public ycx(TTBaseActivity tTBaseActivity) {
            this.ycx = new WeakReference<>(tTBaseActivity);
        }

        public void onBackInvoked() {
            TTBaseActivity tTBaseActivity = this.ycx.get();
            if (tTBaseActivity != null) {
                tTBaseActivity.h_();
            }
        }
    }

    private void ycx(boolean z11, Configuration configuration) {
        if (a_()) {
            this.f24323zb = uh.ycx(this, this.ycx, configuration, this.f24323zb, z11);
        }
    }

    private boolean zb() {
        if (this.f24322dj == null) {
            this.f24322dj = Boolean.valueOf(com.bytedance.sdk.openadsdk.dv.lud.ycx("auto_size_opt_enable", 0) == 1);
        }
        return this.f24322dj.booleanValue();
    }

    public boolean a_() {
        return false;
    }

    public boolean dj() {
        return false;
    }

    @Override // android.app.Activity
    public void finish() {
        try {
            super.finish();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oPlBC5SMSUQ8FUmAg=", "XecjnBC0", Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE);
        }
    }

    @Override // android.view.ContextThemeWrapper, android.content.ContextWrapper, android.content.Context
    public Resources getResources() {
        try {
            if (!zb()) {
                return super.getResources();
            }
            Resources resources = super.getResources();
            if (resources != null) {
                ycx(resources);
            }
            return resources;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oPlBC5SMSUQ8FUmAg=", "XOs5pwavZtKSSdJO", 178);
            return super.getResources();
        }
    }

    public void h_() {
        onBackPressed();
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        ycx(true, configuration);
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (dj() && oty.ycx()) {
            this.sya = new ycx(this);
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(0, this.sya);
        }
    }

    @Override // android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        if (!oty.ycx() || this.sya == null) {
            return;
        }
        getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(this.sya);
        this.sya = null;
    }

    @Override // android.app.Activity
    public void onPause() throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        if (Build.VERSION.SDK_INT < 33) {
            super.onPause();
            return;
        }
        try {
            super.onPause();
        } catch (IllegalArgumentException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oPlBC5SMSUQ8FUmAg=", "VOAdlBavbA==", 151);
            try {
                Field declaredField = Activity.class.getDeclaredField("mCalled");
                declaredField.setAccessible(true);
                declaredField.set(this, Boolean.TRUE);
            } catch (Exception e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oPlBC5SMSUQ8FUmAg=", "VOAdlBavbA==", 158);
            }
        }
    }

    @Override // android.app.Activity
    public void onResume() throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        if (Build.VERSION.SDK_INT > 28) {
            super.onResume();
            return;
        }
        try {
            super.onResume();
        } catch (IllegalArgumentException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oPlBC5SMSUQ8FUmAg=", "VOAfkBCpZMI=", Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE);
            htf.ycx("TTBaseActivity", "super.onResume() run fail", e3);
            try {
                Field declaredField = Activity.class.getDeclaredField("mCalled");
                declaredField.setAccessible(true);
                declaredField.set(this, Boolean.TRUE);
            } catch (Exception e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oPlBC5SMSUQ8FUmAg=", "VOAfkBCpZMI=", Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE);
                htf.ycx("TTBaseActivity", "onResume set mCalled fail", e11);
            }
        }
    }

    public void pmi() {
        try {
            if (!bhi.zb() || Build.VERSION.SDK_INT < 29) {
                return;
            }
            getWindow().getDecorView().setForceDarkAllowed(false);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oPlBC5SMSUQ8FUmAg=", "Xec1uCqJQJbSbtZPhzyvLF7i", 245);
        }
    }

    @Override // android.app.Activity
    public void setContentView(View view) {
        super.setContentView(view);
        if (a_()) {
            this.ycx = view;
            ycx(false, (Configuration) null);
        }
    }

    public void sya(boolean z11) {
        this.rmy = z11;
    }

    private void ycx(Resources resources) {
        if (resources == null) {
            return;
        }
        DisplayMetrics displayMetrics = Resources.getSystem().getDisplayMetrics();
        DisplayMetrics displayMetrics2 = resources.getDisplayMetrics();
        if (ycx(displayMetrics2, displayMetrics)) {
            displayMetrics2.density = displayMetrics.density;
            displayMetrics2.scaledDensity = displayMetrics.scaledDensity;
            displayMetrics2.densityDpi = displayMetrics.densityDpi;
            Configuration configuration = resources.getConfiguration();
            configuration.densityDpi = displayMetrics.densityDpi;
            resources.updateConfiguration(configuration, displayMetrics2);
        }
    }

    private boolean ycx(DisplayMetrics displayMetrics, DisplayMetrics displayMetrics2) {
        if (displayMetrics == null || displayMetrics2 == null) {
            return false;
        }
        return (displayMetrics.density == displayMetrics2.density && displayMetrics.scaledDensity == displayMetrics2.scaledDensity && displayMetrics.densityDpi == displayMetrics2.densityDpi) ? false : true;
    }
}
