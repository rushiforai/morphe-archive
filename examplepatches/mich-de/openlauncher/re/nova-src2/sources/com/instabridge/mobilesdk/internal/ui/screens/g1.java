package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.PurchasedPackage;
import com.instabridge.mobilesdk.internal.ui.screens.DashboardTravelKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class g1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35700a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f35701b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ PurchasedPackage f35702c;

    public /* synthetic */ g1(Function1 function1, PurchasedPackage purchasedPackage, int i5) {
        this.f35700a = i5;
        this.f35701b = function1;
        this.f35702c = purchasedPackage;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f35700a) {
            case 0:
                return DashboardTravelKt.AnonymousClass3.invoke$lambda$8$lambda$7$lambda$6$lambda$5(this.f35701b, this.f35702c);
            default:
                return DashboardTravelKt.TravelPackageRow$lambda$60$lambda$58$lambda$57$lambda$56(this.f35701b, this.f35702c);
        }
    }
}
