package ads_mobile_sdk;

import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class jy0 extends FrameLayout {

    /* renamed from: a, reason: collision with root package name */
    public final tx0 f5452a;

    /* renamed from: b, reason: collision with root package name */
    public wf0 f5453b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jy0(tx0 gmaWebView) {
        super(gmaWebView.getContext());
        Intrinsics.g(gmaWebView, "gmaWebView");
        this.f5452a = gmaWebView;
        setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
        addView(gmaWebView);
        setBackgroundColor(0);
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent ev2) {
        Intrinsics.g(ev2, "ev");
        wf0 wf0Var = this.f5453b;
        if (wf0Var == null) {
            return false;
        }
        wf0Var.a(ev2);
        return false;
    }

    @Override // android.view.ViewGroup
    public final void removeAllViews() {
        mu0.b("Attempting to remove ad from its container, this should not be done unless the ad is destroyed.", null);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void removeView(View view) {
        Intrinsics.g(view, "view");
        mu0.b("Attempting to remove ad from its container, this should not be done unless the ad is destroyed.", null);
        super.removeView(view);
    }

    @Override // android.view.ViewGroup
    public final void removeViewAt(int i5) {
        mu0.b("Attempting to remove ad from its container, this should not be done unless the ad is destroyed.", null);
        super.removeViewAt(i5);
    }

    @Override // android.view.ViewGroup
    public final void removeViews(int i5, int i11) {
        mu0.b("Attempting to remove ad from its container, this should not be done unless the ad is destroyed.", null);
        super.removeViews(i5, i11);
    }
}
