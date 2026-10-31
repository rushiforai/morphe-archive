package com.stripe.android.financialconnections.launcher;

import com.stripe.android.financialconnections.ElementsSessionContext;
import com.stripe.android.financialconnections.FinancialConnectionsSheetConfiguration;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g implements rr.b {

    /* renamed from: a, reason: collision with root package name */
    public final j.c f42691a;

    public g(j.c activityResultLauncher) {
        Intrinsics.g(activityResultLauncher, "activityResultLauncher");
        this.f42691a = activityResultLauncher;
    }

    @Override // rr.b
    public final void a(FinancialConnectionsSheetConfiguration configuration, ElementsSessionContext elementsSessionContext) {
        Intrinsics.g(configuration, "configuration");
        this.f42691a.a(new FinancialConnectionsSheetActivityArgs.ForData(configuration, elementsSessionContext), null);
    }
}
