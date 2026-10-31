package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel;
import kotlin.jvm.functions.Function0;

/* loaded from: classes3.dex */
public final /* synthetic */ class z1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35976a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ MobileFlowViewModel f35977b;

    public /* synthetic */ z1(MobileFlowViewModel mobileFlowViewModel, int i5) {
        this.f35976a = i5;
        this.f35977b = mobileFlowViewModel;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f35976a) {
            case 0:
                return TravelEsimScreensKt.TravelEsimReadyScreen$lambda$7$lambda$6(this.f35977b);
            case 1:
                return TravelEsimScreensKt.TravelEsimReadyScreen$lambda$9$lambda$8(this.f35977b);
            case 2:
                return TravelPlansScreenKt.TravelPlansScreen$lambda$33$lambda$30$lambda$16$lambda$15$lambda$14(this.f35977b);
            case 3:
                return TravelPlansScreenKt.TravelPlansScreen$lambda$33$lambda$30$lambda$25$lambda$24$lambda$23(this.f35977b);
            case 4:
                return TravelPlansScreenKt.TravelPlansScreen$lambda$33$lambda$32$lambda$31(this.f35977b);
            case 5:
                return WinbackPlansScreenKt.WinbackPlansScreen$lambda$18$lambda$12$lambda$4$lambda$3$lambda$2(this.f35977b);
            case 6:
                return WinbackPlansScreenKt.WinbackPlansScreen$lambda$18$lambda$17$lambda$14$lambda$13(this.f35977b);
            default:
                return WinbackPlansScreenKt.WinbackPlansScreen$lambda$18$lambda$17$lambda$16$lambda$15(this.f35977b);
        }
    }
}
