package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel;
import kotlin.jvm.functions.Function0;

/* loaded from: classes3.dex */
public final /* synthetic */ class v implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35895a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ MobileFlowViewModel f35896b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f35897c;

    public /* synthetic */ v(MobileFlowViewModel mobileFlowViewModel, p1.e1 e1Var, int i5) {
        this.f35895a = i5;
        this.f35896b = mobileFlowViewModel;
        this.f35897c = e1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f35895a) {
            case 0:
                return CheckoutScreenKt.CheckoutScreen$lambda$34$lambda$33(this.f35896b, this.f35897c);
            default:
                return DashboardScreenKt.DashboardScreen$lambda$30$lambda$29(this.f35896b, this.f35897c);
        }
    }
}
