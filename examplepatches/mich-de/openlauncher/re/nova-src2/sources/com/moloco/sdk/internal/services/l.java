package com.moloco.sdk.internal.services;

import android.content.Context;
import android.content.pm.PackageInfo;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes.dex */
public final class l implements InterfaceC2963k {

    /* renamed from: c, reason: collision with root package name */
    public static final int f38117c = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f38118a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public C2962j f38119b;

    public l(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f38118a = context;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.moloco.sdk.internal.services.InterfaceC2963k
    @NotNull
    public C2962j invoke() {
        Result.Failure failureA;
        C2962j c2962j = this.f38119b;
        if (c2962j != null) {
            return c2962j;
        }
        try {
            int i5 = Result.f71687b;
            Context context = this.f38118a;
            String string = context.getPackageManager().getApplicationLabel(context.getApplicationInfo()).toString();
            PackageInfo packageInfoA = m.a(this.f38118a);
            String packageName = packageInfoA.packageName;
            Intrinsics.f(packageName, "packageName");
            String versionName = packageInfoA.versionName;
            Intrinsics.f(versionName, "versionName");
            C2962j c2962j2 = new C2962j(string, packageName, versionName);
            this.f38119b = c2962j2;
            failureA = c2962j2;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            failureA = ResultKt.a(th2);
        }
        boolean z11 = failureA instanceof Result.Failure;
        Object obj = failureA;
        if (z11) {
            obj = null;
        }
        C2962j c2962j3 = (C2962j) obj;
        return c2962j3 == null ? new C2962j(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b) : c2962j3;
    }
}
