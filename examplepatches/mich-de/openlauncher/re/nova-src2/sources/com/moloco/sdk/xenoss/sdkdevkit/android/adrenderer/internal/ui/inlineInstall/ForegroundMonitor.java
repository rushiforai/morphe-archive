package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall;

import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.ProcessLifecycleOwner;
import h6.a0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import w70.g2;
import w70.i2;
import w70.m1;
import w70.u1;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0003¢\u0006\u0004\b\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0005\u0010\u0003J\u0017\u0010\b\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\b\u0010\tJ\u0017\u0010\n\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\n\u0010\tR\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\f0\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u000eR\u0016\u0010\u0012\u001a\u00020\f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0010\u0010\u0011R\u0017\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\f0\u00138F¢\u0006\u0006\u001a\u0004\b\r\u0010\u0014¨\u0006\u0016"}, d2 = {"Lcom/moloco/sdk/xenoss/sdkdevkit/android/adrenderer/internal/ui/inlineInstall/ForegroundMonitor;", "Landroidx/lifecycle/DefaultLifecycleObserver;", "<init>", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Lh6/a0;", "owner", "onStart", "(Lh6/a0;)V", "onStop", "Lw70/m1;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "b", "Lw70/m1;", "_isForeground", "c", "Z", "isInitialized", "Lw70/g2;", "()Lw70/g2;", "isForeground", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
/* loaded from: classes4.dex */
public final class ForegroundMonitor implements DefaultLifecycleObserver {

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    public static boolean isInitialized;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final ForegroundMonitor f39813a = new ForegroundMonitor();

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public static final m1 _isForeground = u1.c(Boolean.TRUE);

    /* renamed from: d, reason: collision with root package name */
    public static final int f39816d = 8;

    private ForegroundMonitor() {
    }

    public final void a() {
        if (isInitialized) {
            return;
        }
        ProcessLifecycleOwner processLifecycleOwner = ProcessLifecycleOwner.f14727c;
        ProcessLifecycleOwner.f14727c.f14729b.a(this);
        isInitialized = true;
    }

    @NotNull
    public final g2 b() {
        return _isForeground;
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public void onStart(@NotNull a0 owner) {
        Intrinsics.g(owner, "owner");
        m1 m1Var = _isForeground;
        Boolean bool = Boolean.TRUE;
        i2 i2Var = (i2) m1Var;
        i2Var.getClass();
        i2Var.k(null, bool);
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public void onStop(@NotNull a0 owner) {
        Intrinsics.g(owner, "owner");
        m1 m1Var = _isForeground;
        Boolean bool = Boolean.FALSE;
        i2 i2Var = (i2) m1Var;
        i2Var.getClass();
        i2Var.k(null, bool);
    }
}
