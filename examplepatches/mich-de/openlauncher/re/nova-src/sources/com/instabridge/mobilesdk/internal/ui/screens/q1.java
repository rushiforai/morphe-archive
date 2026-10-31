package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class q1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35834a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f35835b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f35836c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f35837d;

    public /* synthetic */ q1(int i5, int i11, int i12, int i13) {
        this.f35834a = i13;
        this.f35835b = i5;
        this.f35836c = i11;
        this.f35837d = i12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f35834a;
        p1.o oVar = (p1.o) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i5) {
            case 0:
                return OnboardingScreenKt.FeatureRow$lambda$2(this.f35835b, this.f35836c, this.f35837d, oVar, iIntValue);
            default:
                return PlansScreenKt.CompactFeature$lambda$32(this.f35835b, this.f35836c, this.f35837d, oVar, iIntValue);
        }
    }
}
