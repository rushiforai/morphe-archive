package ni;

import ads_mobile_sdk.ew1;
import ads_mobile_sdk.jn;
import ads_mobile_sdk.jr0;
import ads_mobile_sdk.wf0;
import ads_mobile_sdk.zt1;
import android.content.Context;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.google.android.libraries.ads.mobile.sdk.internal.nativead.InternalNativeAd;
import java.lang.ref.WeakReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public abstract class o extends FrameLayout {

    /* renamed from: a, reason: collision with root package name */
    public final ew1 f78297a;

    /* renamed from: b, reason: collision with root package name */
    public final FrameLayout f78298b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(Context context) {
        super(context);
        Intrinsics.g(context, "context");
        FrameLayout frameLayout = new FrameLayout(context);
        frameLayout.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        addView(frameLayout);
        this.f78298b = frameLayout;
        this.f78297a = new ew1(this, frameLayout);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        super.addView(view, i5, layoutParams);
        super.bringChildToFront(this.f78298b);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void bringChildToFront(View view) {
        super.bringChildToFront(view);
        FrameLayout frameLayout = this.f78298b;
        if (Intrinsics.b(frameLayout, view)) {
            return;
        }
        super.bringChildToFront(frameLayout);
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent ev2) {
        zt1 zt1Var;
        wf0 wf0Var;
        Intrinsics.g(ev2, "ev");
        ew1 ew1Var = this.f78297a;
        ew1Var.getClass();
        synchronized (ew1Var) {
            try {
                if (ew1Var.f3070d.get()) {
                    return false;
                }
                InternalNativeAd internalNativeAd = ew1Var.f3075i;
                if (internalNativeAd != null && (zt1Var = internalNativeAd.f33988l) != null) {
                    jr0 jr0Var = internalNativeAd.f33991s;
                    jr0Var.getClass();
                    Boolean bool = Boolean.FALSE;
                    jn jnVar = jn.a$10;
                    if (((Boolean) jr0Var.a("gads:report_touch_event_on_intercept_touch:enabled", bool, jnVar)).booleanValue()) {
                        zt1Var.a(ew1Var.f3068b, ev2);
                    }
                    InternalNativeAd internalNativeAd2 = ew1Var.f3075i;
                    if (internalNativeAd2 != null) {
                        jr0 jr0Var2 = internalNativeAd2.f33991s;
                        jr0Var2.getClass();
                        if (((Boolean) jr0Var2.a("gads:native_ad_view:on_intercept_touch_event:enabled", Boolean.TRUE, jnVar)).booleanValue()) {
                            InternalNativeAd internalNativeAd3 = ew1Var.f3075i;
                            if (internalNativeAd3 != null && (wf0Var = internalNativeAd3.f33992t) != null) {
                                wf0Var.a(ev2);
                            }
                            if (zt1Var.e() != 0) {
                                zt1Var.f12657f = new WeakReference(this);
                                GestureDetector gestureDetector = ew1Var.f3073g;
                                if (gestureDetector != null) {
                                    gestureDetector.onTouchEvent(ev2);
                                }
                            }
                        }
                    }
                    return false;
                }
                return false;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // android.view.ViewGroup
    public final void removeAllViews() {
        super.removeAllViews();
        super.addView(this.f78298b);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void removeView(View view) {
        if (Intrinsics.b(this.f78298b, view)) {
            return;
        }
        super.removeView(view);
    }
}
