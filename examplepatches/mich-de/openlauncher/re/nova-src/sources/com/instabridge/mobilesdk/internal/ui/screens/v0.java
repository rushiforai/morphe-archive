package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.PurchasedPackage;
import com.instabridge.mobilesdk.internal.ui.screens.DashboardScreenKt;
import com.instabridge.mobilesdk.internal.ui.screens.DashboardTravelKt;
import kotlin.jvm.functions.Function0;

/* loaded from: classes3.dex */
public final /* synthetic */ class v0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35898a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ PurchasedPackage f35899b;

    public /* synthetic */ v0(PurchasedPackage purchasedPackage, int i5) {
        this.f35898a = i5;
        this.f35899b = purchasedPackage;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        float fInvoke$lambda$6$lambda$5;
        switch (this.f35898a) {
            case 0:
                fInvoke$lambda$6$lambda$5 = DashboardScreenKt.AnonymousClass2.invoke$lambda$6$lambda$5(this.f35899b);
                break;
            default:
                fInvoke$lambda$6$lambda$5 = DashboardTravelKt.AnonymousClass3.invoke$lambda$10$lambda$9(this.f35899b);
                break;
        }
        return Float.valueOf(fInvoke$lambda$6$lambda$5);
    }
}
