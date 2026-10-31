package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.internal.data.repo.TravelTarget;
import com.instabridge.mobilesdk.internal.ui.screens.DashboardTravelKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class h1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35710a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f35711b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ TravelTarget f35712c;

    public /* synthetic */ h1(Function1 function1, TravelTarget travelTarget, int i5) {
        this.f35710a = i5;
        this.f35711b = function1;
        this.f35712c = travelTarget;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f35710a) {
            case 0:
                return DashboardTravelKt.C29241.invoke$lambda$2$lambda$1$lambda$0(this.f35711b, this.f35712c);
            default:
                return DashboardTravelKt.TravelActionPrompts$lambda$36$lambda$35$lambda$34(this.f35711b, this.f35712c);
        }
    }
}
