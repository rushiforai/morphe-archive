package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class e1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35665a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f35666b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f35667c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f35668d;

    public /* synthetic */ e1(Function0 function0, Function0 function02, int i5, int i11) {
        this.f35665a = i11;
        this.f35666b = function0;
        this.f35667c = function02;
        this.f35668d = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f35665a;
        p1.o oVar = (p1.o) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i5) {
            case 0:
                return DashboardTravelKt.LocalPlanOfferCard$lambda$92(this.f35666b, this.f35667c, this.f35668d, oVar, iIntValue);
            default:
                return TravelIntroScreenKt.TravelIntroScreen$lambda$0(this.f35666b, this.f35667c, this.f35668d, oVar, iIntValue);
        }
    }
}
