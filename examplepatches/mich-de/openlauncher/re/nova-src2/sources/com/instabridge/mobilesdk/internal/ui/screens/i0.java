package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel;
import com.instabridge.mobilesdk.internal.ui.screens.CouldntInstallScreenKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class i0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35719a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ MobileFlowViewModel f35720b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f35721c;

    public /* synthetic */ i0(MobileFlowViewModel mobileFlowViewModel, Function1 function1, int i5) {
        this.f35719a = i5;
        this.f35720b = mobileFlowViewModel;
        this.f35721c = function1;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f35719a) {
            case 0:
                return CouldntInstallScreenKt.AnonymousClass3.invoke$lambda$3$lambda$2(this.f35720b, this.f35721c);
            default:
                return TravelEsimInstallOptionsScreenKt.TravelEsimInstallOptionsScreen$lambda$23$lambda$22$lambda$21$lambda$20(this.f35720b, this.f35721c);
        }
    }
}
