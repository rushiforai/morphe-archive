package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class b implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35611a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ MobileFlowViewModel f35612b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f35613c;

    public /* synthetic */ b(MobileFlowViewModel mobileFlowViewModel, int i5, int i11) {
        this.f35611a = i11;
        this.f35612b = mobileFlowViewModel;
        this.f35613c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f35611a;
        p1.o oVar = (p1.o) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i5) {
            case 0:
                return BoosterAddedScreenKt.BoosterAddedScreen$lambda$1(this.f35612b, this.f35613c, oVar, iIntValue);
            case 1:
                return BoosterPlansScreenKt.BoosterPlansScreen$lambda$25(this.f35612b, this.f35613c, oVar, iIntValue);
            case 2:
                return CancelPlanReasonsScreenKt.CancelPlanReasonsScreen$lambda$28(this.f35612b, this.f35613c, oVar, iIntValue);
            case 3:
                return CarrierLockedScreenKt.CarrierLockedScreen$lambda$4(this.f35612b, this.f35613c, oVar, iIntValue);
            case 4:
                return ConnectedScreenKt.ConnectedScreen$lambda$1(this.f35612b, this.f35613c, oVar, iIntValue);
            case 5:
                return CouldntInstallScreenKt.CouldntInstallScreen$lambda$1(this.f35612b, this.f35613c, oVar, iIntValue);
            case 6:
                return CouldntInstallScreenKt.CouldntInstallScreen$lambda$2(this.f35612b, this.f35613c, oVar, iIntValue);
            case 7:
                return DashboardScreenKt.DashboardScreen$lambda$65(this.f35612b, this.f35613c, oVar, iIntValue);
            case 8:
                return HowItWorksScreenKt.HowItWorksScreen$lambda$1(this.f35612b, this.f35613c, oVar, iIntValue);
            case 9:
                return InstallEsimScreenKt.InstallEsimScreen$lambda$2(this.f35612b, this.f35613c, oVar, iIntValue);
            case 10:
                return KeepYourNumberScreenKt.KeepYourNumberScreen$lambda$1(this.f35612b, this.f35613c, oVar, iIntValue);
            case 11:
                return MyEsimsScreenKt.MyEsimsScreen$lambda$15(this.f35612b, this.f35613c, oVar, iIntValue);
            case 12:
                return OnboardingScreenKt.OnboardingScreen$lambda$0(this.f35612b, this.f35613c, oVar, iIntValue);
            case 13:
                return PlanUpdatedScreenKt.PlanUpdatedScreen$lambda$1(this.f35612b, this.f35613c, oVar, iIntValue);
            case 14:
                return PlansScreenKt.PlansScreen$lambda$28(this.f35612b, this.f35613c, oVar, iIntValue);
            case 15:
                return TravelDestinationsPickerKt.TravelDestinationsScreen$lambda$43(this.f35612b, this.f35613c, oVar, iIntValue);
            case 16:
                return TravelEsimInstallOptionsScreenKt.TravelEsimInstallOptionsScreen$lambda$24(this.f35612b, this.f35613c, oVar, iIntValue);
            case 17:
                return TravelEsimScreensKt.TravelEsimInstalledScreen$lambda$21(this.f35612b, this.f35613c, oVar, iIntValue);
            case 18:
                return TravelEsimScreensKt.TravelEsimReadyScreen$lambda$3(this.f35612b, this.f35613c, oVar, iIntValue);
            case 19:
                return TravelEsimScreensKt.TravelEsimReadyScreen$lambda$10(this.f35612b, this.f35613c, oVar, iIntValue);
            case 20:
                return TravelPlansScreenKt.TravelPlansScreen$lambda$36(this.f35612b, this.f35613c, oVar, iIntValue);
            default:
                return WinbackPlansScreenKt.WinbackPlansScreen$lambda$19(this.f35612b, this.f35613c, oVar, iIntValue);
        }
    }
}
