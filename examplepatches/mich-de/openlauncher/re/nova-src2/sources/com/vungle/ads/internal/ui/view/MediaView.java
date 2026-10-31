package com.vungle.ads.internal.ui.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.RelativeLayout;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.k2;
import com.vungle.ads.internal.o1;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.nativead.NativeVideoListener;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(bv = {}, d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u00002\u00020\u0001B'\b\u0007\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\b\b\u0002\u0010\u000f\u001a\u00020\b¢\u0006\u0004\b\u0010\u0010\u0011J\n\u0010\u0003\u001a\u0004\u0018\u00010\u0002H\u0002J\u000e\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004J\u0006\u0010\t\u001a\u00020\bJ\u0006\u0010\n\u001a\u00020\b¨\u0006\u0012"}, d2 = {"Lcom/vungle/ads/internal/ui/view/MediaView;", "Landroid/widget/RelativeLayout;", "Lcom/vungle/ads/nativead/a;", "getVideoControl", "Lcom/vungle/ads/nativead/NativeVideoListener;", "listener", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "setNativeVideoListener", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getDuration", "getCurrentTime", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "defStyleAttr", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;I)V", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class MediaView extends RelativeLayout {

    /* renamed from: a, reason: collision with root package name */
    public NativeVideoListener f47592a;

    /* renamed from: b, reason: collision with root package name */
    public e f47593b;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public MediaView(@NotNull Context context) {
        this(context, null, 0, 6, null);
        Intrinsics.g(context, "context");
    }

    private final com.vungle.ads.nativead.a getVideoControl() {
        ViewParent viewParent = this.f47593b;
        if (viewParent instanceof com.vungle.ads.nativead.a) {
            return (com.vungle.ads.nativead.a) viewParent;
        }
        return null;
    }

    public final void a(o1 internal) {
        Intrinsics.g(internal, "internal");
        if (internal.t()) {
            if (this.f47593b == null) {
                Context context = getContext();
                Intrinsics.f(context, "context");
                m mVar = new m(context, internal);
                mVar.setNativeVideoListener(this.f47592a);
                AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
                k2 k2Var = new k2(Sdk.SDKMetric.SDKMetricType.NATIVE_PLAY_ASSET_TYPE);
                k2Var.a((Long) 1L);
                AnalyticsClient.a(analyticsClient, k2Var, internal.e(), 4);
                this.f47593b = mVar;
            }
        } else if (this.f47593b == null) {
            Context context2 = getContext();
            Intrinsics.f(context2, "context");
            e eVar = new e(context2, internal);
            AnalyticsClient analyticsClient2 = AnalyticsClient.INSTANCE;
            k2 k2Var2 = new k2(Sdk.SDKMetric.SDKMetricType.NATIVE_PLAY_ASSET_TYPE);
            k2Var2.a((Long) 2L);
            AnalyticsClient.a(analyticsClient2, k2Var2, internal.e(), 4);
            this.f47593b = eVar;
        }
        e eVar2 = this.f47593b;
        if (eVar2 != null) {
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
            layoutParams.addRule(13);
            eVar2.setLayoutParams(layoutParams);
            if (!Intrinsics.b(eVar2.getParent(), this)) {
                ViewGroup viewGroup = (ViewGroup) eVar2.getParent();
                if (viewGroup != null) {
                    viewGroup.removeView(eVar2);
                }
                addView(eVar2);
            }
            Context context3 = getContext();
            Intrinsics.f(context3, "context");
            eVar2.a(context3);
        }
    }

    public final int getCurrentTime() {
        com.vungle.ads.nativead.a videoControl = getVideoControl();
        return (videoControl != null ? ((m) videoControl).getCurrentTime() : 0) / 1000;
    }

    public final int getDuration() {
        com.vungle.ads.nativead.a videoControl = getVideoControl();
        return (videoControl != null ? ((m) videoControl).getDuration() : 0) / 1000;
    }

    public final void setNativeVideoListener(@NotNull NativeVideoListener listener) {
        Intrinsics.g(listener, "listener");
        this.f47592a = listener;
        e eVar = this.f47593b;
        m mVar = eVar instanceof m ? (m) eVar : null;
        if (mVar == null) {
            return;
        }
        mVar.setNativeVideoListener(listener);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public MediaView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0, 4, null);
        Intrinsics.g(context, "context");
    }

    public /* synthetic */ MediaView(Context context, AttributeSet attributeSet, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i11 & 2) != 0 ? null : attributeSet, (i11 & 4) != 0 ? 0 : i5);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public MediaView(@NotNull Context context, @Nullable AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        Intrinsics.g(context, "context");
    }

    public final void a() {
        setOnClickListener(null);
        setOnTouchListener(null);
        removeAllViews();
        e eVar = this.f47593b;
        if (eVar != null) {
            eVar.a();
        }
        this.f47593b = null;
    }
}
