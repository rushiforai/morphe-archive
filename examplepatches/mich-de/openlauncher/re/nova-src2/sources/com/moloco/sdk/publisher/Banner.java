package com.moloco.sdk.publisher;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w70.g2;
import w70.i2;
import w70.m1;
import w70.o1;
import w70.u1;

@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b'\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003B\u000f\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u001f\u0010\r\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\nH\u0014¢\u0006\u0004\b\r\u0010\u000eR$\u0010\u0010\u001a\u0004\u0018\u00010\u000f8\u0016@\u0016X\u0096\u000e¢\u0006\u0012\n\u0004\b\u0010\u0010\u0011\u001a\u0004\b\u0012\u0010\u0013\"\u0004\b\u0014\u0010\u0015R\u001a\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00170\u00168\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010\u0019R \u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00170\u001a8\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u001b\u0010\u001c\u001a\u0004\b\u001b\u0010\u001d¨\u0006\u001e"}, d2 = {"Lcom/moloco/sdk/publisher/Banner;", "Landroid/widget/FrameLayout;", "Lcom/moloco/sdk/publisher/AdLoad;", "Lcom/moloco/sdk/publisher/Destroyable;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "Landroid/view/View;", "changedView", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "visibility", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onVisibilityChanged", "(Landroid/view/View;I)V", "Lcom/moloco/sdk/publisher/BannerAdShowListener;", "adShowListener", "Lcom/moloco/sdk/publisher/BannerAdShowListener;", "getAdShowListener", "()Lcom/moloco/sdk/publisher/BannerAdShowListener;", "setAdShowListener", "(Lcom/moloco/sdk/publisher/BannerAdShowListener;)V", "Lw70/m1;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "_isViewShown", "Lw70/m1;", "Lw70/g2;", "isViewShown", "Lw70/g2;", "()Lw70/g2;", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class Banner extends FrameLayout implements AdLoad, Destroyable {
    public static final int $stable = 8;

    @NotNull
    private final m1 _isViewShown;

    @Nullable
    private BannerAdShowListener adShowListener;

    @NotNull
    private final g2 isViewShown;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Banner(@NotNull Context context) {
        super(context);
        Intrinsics.g(context, "context");
        setTag("MolocoBannerView");
        i2 i2VarC = u1.c(Boolean.FALSE);
        this._isViewShown = i2VarC;
        this.isViewShown = new o1(i2VarC);
    }

    @Nullable
    public BannerAdShowListener getAdShowListener() {
        return this.adShowListener;
    }

    @NotNull
    /* renamed from: isViewShown, reason: from getter */
    public g2 getIsViewShown() {
        return this.isViewShown;
    }

    @Override // android.view.View
    public void onVisibilityChanged(@NotNull View changedView, int visibility) {
        Intrinsics.g(changedView, "changedView");
        m1 m1Var = this._isViewShown;
        Boolean boolValueOf = Boolean.valueOf(changedView.isShown());
        i2 i2Var = (i2) m1Var;
        i2Var.getClass();
        i2Var.k(null, boolValueOf);
    }

    public void setAdShowListener(@Nullable BannerAdShowListener bannerAdShowListener) {
        this.adShowListener = bannerAdShowListener;
    }
}
