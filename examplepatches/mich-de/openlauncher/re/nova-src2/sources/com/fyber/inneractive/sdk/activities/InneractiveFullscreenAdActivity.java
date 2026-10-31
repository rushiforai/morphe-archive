package com.fyber.inneractive.sdk.activities;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.config.enums.Orientation;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.config.y0;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveAdSpotManager;
import com.fyber.inneractive.sdk.external.InneractiveUnitController;
import com.fyber.inneractive.sdk.flow.b0;
import com.fyber.inneractive.sdk.flow.h0;
import com.fyber.inneractive.sdk.flow.p0;
import com.fyber.inneractive.sdk.network.z;
import com.fyber.inneractive.sdk.renderers.v;
import com.fyber.inneractive.sdk.ui.CloseButtonConfiguration;
import com.fyber.inneractive.sdk.ui.CloseButtonFlowManager;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.l0;
import com.fyber.inneractive.sdk.util.n0;
import com.fyber.inneractive.sdk.util.r;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public class InneractiveFullscreenAdActivity extends InneractiveBaseActivity implements com.fyber.inneractive.sdk.interfaces.e {
    public static final String EXTRA_KEY_SPOT_ID = "spotId";

    /* renamed from: b, reason: collision with root package name */
    public ViewGroup f27563b;

    /* renamed from: c, reason: collision with root package name */
    public InneractiveAdSpot f27564c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.interfaces.f f27565d;

    /* renamed from: i, reason: collision with root package name */
    public CloseButtonFlowManager f27570i;

    /* renamed from: e, reason: collision with root package name */
    public int f27566e = 0;

    /* renamed from: f, reason: collision with root package name */
    public int f27567f = 0;

    /* renamed from: g, reason: collision with root package name */
    public int f27568g = 0;

    /* renamed from: h, reason: collision with root package name */
    public boolean f27569h = false;
    protected final Runnable mHideNavigationBarTask = new c(this);

    /* loaded from: classes.dex */
    public interface FullScreenRendererProvider {
        com.fyber.inneractive.sdk.interfaces.f getFullscreenRenderer();
    }

    /* loaded from: classes.dex */
    public interface OnInneractiveFullscreenAdDestroyListener {
        void onActivityDestroyed(InneractiveFullscreenAdActivity inneractiveFullscreenAdActivity);
    }

    public void cancelHideNavigationBarTask() {
        getWindow().getDecorView().setOnSystemUiVisibilityChangeListener(null);
        r.f31216b.removeCallbacks(this.mHideNavigationBarTask);
    }

    @Override // com.fyber.inneractive.sdk.interfaces.e
    public void destroy() {
        if (isFinishing() || this.f27563b == null) {
            return;
        }
        finish();
    }

    @Override // com.fyber.inneractive.sdk.interfaces.e
    public void disableCloseButton() {
        CloseButtonFlowManager closeButtonFlowManager = this.f27570i;
        if (closeButtonFlowManager == null) {
            return;
        }
        closeButtonFlowManager.f31124c.setVisibility(8);
        closeButtonFlowManager.f31122a.setVisibility(8);
    }

    @Override // com.fyber.inneractive.sdk.interfaces.e
    public void dismissAd(boolean z11) {
        this.f27569h = z11;
        cancelHideNavigationBarTask();
        com.fyber.inneractive.sdk.interfaces.f fVar = this.f27565d;
        if (fVar != null) {
            fVar.b(z11);
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.e
    public View getCloseButton() {
        CloseButtonFlowManager closeButtonFlowManager = this.f27570i;
        if (closeButtonFlowManager != null) {
            return closeButtonFlowManager.f31126e;
        }
        return null;
    }

    @Override // com.fyber.inneractive.sdk.interfaces.e
    public ViewGroup getLayout() {
        return this.f27563b;
    }

    public void hideNavigationBar() {
        View decorView = getWindow().getDecorView();
        if ((decorView.getSystemUiVisibility() & 2) == 0) {
            decorView.setSystemUiVisibility(2818);
        }
        decorView.setOnSystemUiVisibilityChangeListener(new e(this));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void initWindowFeatures(com.fyber.inneractive.sdk.interfaces.f fVar) {
        requestWindowFeature(1);
        getWindow().addFlags(1024);
        getWindow().addFlags(128);
        if (Build.VERSION.SDK_INT >= 28) {
            getWindow().addFlags(2);
        }
        if (fVar != 0 && (((b0) fVar) instanceof v)) {
            setTheme(16973831);
            requestWindowFeature(67108864);
            requestWindowFeature(134217728);
            requestWindowFeature(Integer.MIN_VALUE);
        }
        hideNavigationBar();
        y0 y0Var = ((w0) this.f27564c.getAdContent().f28440d).f27948f;
        if (y0Var != null) {
            Orientation orientation = y0Var.f27958e;
            setActivityOrientation(orientation.allowOrientationChange, orientation);
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.e
    public boolean isCloseButtonDisplay() {
        CloseButtonFlowManager closeButtonFlowManager = this.f27570i;
        return closeButtonFlowManager != null && closeButtonFlowManager.f31125d.getVisibility() == 0;
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        com.fyber.inneractive.sdk.interfaces.f fVar = this.f27565d;
        if (fVar == null || !fVar.u()) {
            super.onBackPressed();
        }
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        com.fyber.inneractive.sdk.interfaces.f fVar = this.f27565d;
        if (fVar != null) {
            int i5 = configuration.orientation;
            if (i5 != this.f27566e) {
                this.f27566e = i5;
                fVar.a();
                return;
            }
            int i11 = this.f27567f;
            int i12 = configuration.screenHeightDp;
            if (i11 == i12 && this.f27568g == configuration.screenWidthDp) {
                return;
            }
            this.f27567f = i12;
            this.f27568g = configuration.screenWidthDp;
            fVar.a();
        }
    }

    @Override // com.fyber.inneractive.sdk.activities.InneractiveBaseActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        String stringExtra = getIntent().getStringExtra("spotId");
        InneractiveAdSpot inneractiveAdSpot = null;
        if (TextUtils.isEmpty(stringExtra)) {
            IAlog.f("%sSpot id must be provided as an extra before calling createActivity with InneractiveInterstitialAdActivty", IAlog.a(this));
        } else {
            InneractiveAdSpot spot = InneractiveAdSpotManager.get().getSpot(stringExtra);
            if (spot == null) {
                IAlog.b("%sSpot id %s cannot be found in spot manager!", IAlog.a(this), stringExtra);
            }
            if (spot != null && spot.getAdContent() == null) {
                IAlog.a("%sSpot does not have a content. Cannot start activity", IAlog.a(this));
            }
            if (spot != null && spot.getAdContent() != null) {
                inneractiveAdSpot = spot;
            }
        }
        this.f27564c = inneractiveAdSpot;
        if (inneractiveAdSpot == null || inneractiveAdSpot.getAdContent() == null || this.f27564c.getAdContent().f28440d == null) {
            super.onCreate(bundle);
            finish();
            return;
        }
        InneractiveUnitController selectedUnitController = this.f27564c.getSelectedUnitController();
        if (selectedUnitController == null || !(selectedUnitController instanceof FullScreenRendererProvider)) {
            IAlog.f("%sno appropriate unit controller found for full screen ad. Aborting", IAlog.a(this));
            super.onCreate(bundle);
            finish();
            return;
        }
        com.fyber.inneractive.sdk.interfaces.f fullscreenRenderer = ((FullScreenRendererProvider) selectedUnitController).getFullscreenRenderer();
        this.f27565d = fullscreenRenderer;
        initWindowFeatures(fullscreenRenderer);
        super.onCreate(bundle);
        IAlog.a("%sInterstitial for spot id %s created", IAlog.a(this), this.f27564c.getLocalUniqueId());
        this.f27566e = getResources().getConfiguration().orientation;
        this.f27567f = getResources().getConfiguration().screenHeightDp;
        this.f27568g = getResources().getConfiguration().screenWidthDp;
        if (this.f27565d == null) {
            IAlog.f("Interstitial Activity: Could not find an appropriate full screen ad renderer for content!", new Object[0]);
            finish();
            return;
        }
        try {
            setContentView(R.layout.ia_layout_fullscreen_activity);
            this.f27563b = (ViewGroup) findViewById(R.id.ia_ad_content);
            this.f27570i = new CloseButtonFlowManager(this, new d(this));
            ((p0) this.f27565d).initialize(this.f27564c);
            try {
                this.f27565d.a(this, this);
                CloseButtonFlowManager closeButtonFlowManager = this.f27570i;
                if (closeButtonFlowManager != null) {
                    this.f27565d.b(closeButtonFlowManager);
                }
                this.f27564c.getAdContent().f28441e = true;
                InneractiveAdSpot inneractiveAdSpot2 = this.f27564c;
                if (inneractiveAdSpot2 != null && (inneractiveAdSpot2 instanceof h0) && (this.f27565d instanceof com.fyber.inneractive.sdk.rtb.watermark.a)) {
                    com.fyber.inneractive.sdk.rtb.watermark.b bVar = ((h0) inneractiveAdSpot2).f28162m;
                    if (bVar == null || bVar.f31092a == null || this.f27563b == null) {
                        IAlog.a("%sCouldn't add watermark. %s is null", IAlog.a(this), bVar == null ? "Watermark" : bVar.f31092a == null ? "Watermark ImageView" : "mContentLayout");
                        return;
                    }
                    FrameLayout frameLayout = new FrameLayout(this);
                    frameLayout.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
                    frameLayout.setClickable(false);
                    frameLayout.addView(bVar.f31092a);
                    this.f27563b.addView(frameLayout);
                    ((com.fyber.inneractive.sdk.rtb.watermark.a) this.f27565d).a(frameLayout);
                }
            } catch (Resources.NotFoundException e3) {
                IAlog.f("Interstitial Activity: %s", e3.getMessage());
                finish();
            } catch (InneractiveUnitController.AdDisplayError e11) {
                IAlog.f("Interstitial Activity: %s", e11.getMessage());
                finish();
            }
        } catch (Throwable th2) {
            z.a(th2, this.f27564c.getAdContent().f28437a, this.f27564c.getAdContent().f28438b);
            finish();
        }
    }

    @Override // com.fyber.inneractive.sdk.activities.InneractiveBaseActivity, android.app.Activity
    public void onDestroy() {
        com.fyber.inneractive.sdk.interfaces.f fVar;
        n0 n0Var = l0.f31201a;
        n0Var.getClass();
        IAlog.a("%scleanupForDestroyedActivity called for: %s", "IAVisibilityTracker: ", this);
        Context applicationContext = getApplicationContext();
        WeakHashMap weakHashMap = (WeakHashMap) n0Var.f31207b.remove(applicationContext);
        if (weakHashMap != null) {
            IAlog.a("%sRemoved tracking entries for destroyed activity", "IAVisibilityTracker: ");
            weakHashMap.clear();
        }
        n0Var.a(applicationContext);
        CloseButtonFlowManager closeButtonFlowManager = this.f27570i;
        if (closeButtonFlowManager != null) {
            closeButtonFlowManager.f31124c.setOnClickListener(null);
            this.f27570i = null;
        }
        ViewGroup viewGroup = this.f27563b;
        if (viewGroup != null) {
            viewGroup.removeAllViews();
            this.f27563b = null;
        }
        InneractiveAdSpot inneractiveAdSpot = this.f27564c;
        InneractiveUnitController selectedUnitController = inneractiveAdSpot == null ? null : inneractiveAdSpot.getSelectedUnitController();
        if (selectedUnitController != null && (selectedUnitController instanceof OnInneractiveFullscreenAdDestroyListener)) {
            ((OnInneractiveFullscreenAdDestroyListener) selectedUnitController).onActivityDestroyed(this);
        }
        if (!isFinishing() && (fVar = this.f27565d) != null) {
            CloseButtonFlowManager closeButtonFlowManager2 = this.f27570i;
            if (closeButtonFlowManager2 != null) {
                fVar.a(closeButtonFlowManager2);
            }
            this.f27565d.k();
            this.f27565d.destroy();
            this.f27565d = null;
        }
        super.onDestroy();
        InneractiveAdSpot inneractiveAdSpot2 = this.f27564c;
        if (inneractiveAdSpot2 != null) {
            inneractiveAdSpot2.destroy();
        }
    }

    @Override // android.app.Activity
    public void onPause() {
        super.onPause();
        if (!isFinishing()) {
            com.fyber.inneractive.sdk.interfaces.f fVar = this.f27565d;
            if (fVar != null) {
                fVar.r();
                return;
            }
            return;
        }
        com.fyber.inneractive.sdk.interfaces.f fVar2 = this.f27565d;
        if (fVar2 != null) {
            CloseButtonFlowManager closeButtonFlowManager = this.f27570i;
            if (closeButtonFlowManager != null) {
                fVar2.a(closeButtonFlowManager);
            }
            this.f27565d.k();
            this.f27565d.destroy();
            this.f27565d = null;
        }
    }

    @Override // android.app.Activity
    public void onResume() {
        super.onResume();
        com.fyber.inneractive.sdk.interfaces.f fVar = this.f27565d;
        if (fVar != null) {
            fVar.m();
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        if (!z11) {
            com.fyber.inneractive.sdk.interfaces.f fVar = this.f27565d;
            if (fVar != null) {
                fVar.r();
                return;
            }
            return;
        }
        hideNavigationBar();
        com.fyber.inneractive.sdk.interfaces.f fVar2 = this.f27565d;
        if (fVar2 != null) {
            fVar2.m();
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.e
    public void secondEndCardWasDisplayed() {
        CloseButtonFlowManager closeButtonFlowManager = this.f27570i;
        if (closeButtonFlowManager == null) {
            return;
        }
        closeButtonFlowManager.f31127f = true;
    }

    @Override // com.fyber.inneractive.sdk.interfaces.e
    public void setActivityOrientation(boolean z11, Orientation orientation) {
        if (z11 && orientation.equals(Orientation.USER)) {
            setRequestedOrientation(13);
        } else if (z11 && orientation.equals(Orientation.NONE)) {
            setRequestedOrientation(getRequestedOrientation());
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.e
    public void showCloseButton(boolean z11, int i5, int i11) {
        CloseButtonFlowManager closeButtonFlowManager = this.f27570i;
        if (closeButtonFlowManager == null) {
            return;
        }
        CloseButtonConfiguration closeButtonConfiguration = closeButtonFlowManager.f31128g;
        closeButtonConfiguration.f31117c = z11;
        closeButtonConfiguration.f31118d = i5;
        closeButtonConfiguration.f31119e = i11;
        closeButtonConfiguration.f31116b = true;
        closeButtonConfiguration.f31115a = false;
        closeButtonConfiguration.f31121g.a(closeButtonConfiguration);
    }

    @Override // com.fyber.inneractive.sdk.interfaces.e
    public void showCloseCountdown() {
        CloseButtonFlowManager closeButtonFlowManager = this.f27570i;
        if (closeButtonFlowManager == null) {
            return;
        }
        closeButtonFlowManager.f31123b.setBackgroundResource(R.drawable.ia_round_overlay_bg);
        CloseButtonConfiguration closeButtonConfiguration = closeButtonFlowManager.f31128g;
        closeButtonConfiguration.f31115a = true;
        closeButtonConfiguration.f31116b = false;
        closeButtonConfiguration.f31121g.a(closeButtonConfiguration);
    }

    @Override // com.fyber.inneractive.sdk.interfaces.e
    public void updateCloseCountdown(int i5) {
        CloseButtonFlowManager closeButtonFlowManager = this.f27570i;
        if (closeButtonFlowManager != null && i5 > 0) {
            closeButtonFlowManager.f31123b.setText(Integer.toString(i5));
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.e
    public boolean wasDismissedByUser() {
        return this.f27569h;
    }
}
