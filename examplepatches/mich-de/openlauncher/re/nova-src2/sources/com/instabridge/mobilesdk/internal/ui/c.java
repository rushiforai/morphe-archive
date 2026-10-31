package com.instabridge.mobilesdk.internal.ui;

import com.instabridge.mobilesdk.internal.ui.MobileFlowActivity;
import java.util.Map;
import kotlin.jvm.functions.Function0;

/* loaded from: classes3.dex */
public final /* synthetic */ class c implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35583a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35584b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f35585c;

    public /* synthetic */ c(int i5, Object obj, Object obj2) {
        this.f35583a = i5;
        this.f35584b = obj;
        this.f35585c = obj2;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f35583a) {
            case 0:
                return MobileFlowActivity.AnonymousClass6.AnonymousClass1.C01351.invoke$lambda$16$lambda$15$lambda$14((MobileFlowActivity) this.f35584b, (JourneyOfferClaimedTarget) this.f35585c);
            default:
                return MobileFlowViewModel.verifyPurchase$lambda$104((Map) this.f35584b, (MobileFlowViewModel) this.f35585c);
        }
    }
}
