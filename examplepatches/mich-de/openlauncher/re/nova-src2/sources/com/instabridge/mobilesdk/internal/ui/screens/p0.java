package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class p0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35819a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f35820b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f35821c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f35822d;

    public /* synthetic */ p0(int i5, int i11, int i12, String str) {
        this.f35819a = i12;
        this.f35820b = i5;
        this.f35821c = str;
        this.f35822d = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f35819a;
        p1.o oVar = (p1.o) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i5) {
            case 0:
                return DashboardScreenKt.PlanCardSkeleton$lambda$93(this.f35821c, this.f35820b, this.f35822d, oVar, iIntValue);
            case 1:
                return HowItWorksScreenKt.IconStep$lambda$15(this.f35820b, this.f35821c, this.f35822d, oVar, iIntValue);
            case 2:
                return KeepYourNumberScreenKt.NumberedStep$lambda$13(this.f35820b, this.f35821c, this.f35822d, oVar, iIntValue);
            case 3:
                return TravelEsimInstallOptionsScreenKt.NumberedStep$lambda$40(this.f35820b, this.f35821c, this.f35822d, oVar, iIntValue);
            default:
                return TravelIntroScreenKt.TravelIntroPoint$lambda$2(this.f35820b, this.f35821c, this.f35822d, oVar, iIntValue);
        }
    }

    public /* synthetic */ p0(String str, int i5, int i11) {
        this.f35819a = 0;
        this.f35821c = str;
        this.f35820b = i5;
        this.f35822d = i11;
    }
}
