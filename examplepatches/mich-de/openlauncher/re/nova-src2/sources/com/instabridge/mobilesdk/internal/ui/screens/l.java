package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.PurchasedPackage;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class l implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35764a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ PurchasedPackage f35765b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f35766c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f35767d;

    public /* synthetic */ l(PurchasedPackage purchasedPackage, Function0 function0, int i5, int i11) {
        this.f35764a = i11;
        this.f35765b = purchasedPackage;
        this.f35766c = function0;
        this.f35767d = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f35764a;
        p1.o oVar = (p1.o) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i5) {
            case 0:
                return CarrierLockedScreenKt.SubscriptionCard$lambda$8(this.f35765b, this.f35766c, this.f35767d, oVar, iIntValue);
            default:
                return DashboardScreenKt.UpcomingPlanBlockedSheet$lambda$84(this.f35765b, this.f35766c, this.f35767d, oVar, iIntValue);
        }
    }
}
