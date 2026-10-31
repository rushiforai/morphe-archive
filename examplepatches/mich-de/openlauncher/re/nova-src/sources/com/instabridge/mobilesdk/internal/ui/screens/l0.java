package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.internal.ui.screens.CheckoutScreenKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class l0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35768a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35769b;

    public /* synthetic */ l0(Object obj, int i5) {
        this.f35768a = i5;
        this.f35769b = obj;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35768a) {
            case 0:
                return DashboardScreenKt.SupportPill$lambda$71$lambda$70((String) this.f35769b, (j3.b0) obj);
            case 1:
                return KeepYourNumberScreenKt.ReviewCard$lambda$18$lambda$15$lambda$14((String) this.f35769b, (j3.b0) obj);
            default:
                return CheckoutScreenKt.C29091.invoke$lambda$2$lambda$1$lambda$0((Function0) this.f35769b, ((Boolean) obj).booleanValue());
        }
    }
}
