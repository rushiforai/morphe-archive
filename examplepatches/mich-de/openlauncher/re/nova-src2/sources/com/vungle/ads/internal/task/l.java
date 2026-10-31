package com.vungle.ads.internal.task;

import android.content.Context;
import android.os.Bundle;
import com.vungle.ads.internal.util.PathProvider;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l implements c {

    /* renamed from: a, reason: collision with root package name */
    public final Context f47542a;

    public l(Context context, PathProvider pathProvider) {
        Intrinsics.g(context, "context");
        Intrinsics.g(pathProvider, "pathProvider");
        this.f47542a = context;
    }

    @Override // com.vungle.ads.internal.task.c
    public final int a(Bundle bundle, g jobRunner) {
        Intrinsics.g(bundle, "bundle");
        Intrinsics.g(jobRunner, "jobRunner");
        ((com.vungle.ads.internal.network.r) LazyKt.b(LazyThreadSafetyMode.f71679a, new k(this.f47542a)).getValue()).b();
        return 0;
    }
}
