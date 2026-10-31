package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class z0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35973a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f35974b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f35975c;

    public /* synthetic */ z0(boolean z11, int i5, int i11) {
        this.f35973a = i11;
        this.f35974b = z11;
        this.f35975c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        Integer num = (Integer) obj2;
        switch (this.f35973a) {
            case 0:
                return DashboardTravelKt.TravelStatusPill$lambda$32(this.f35974b, this.f35975c, oVar, num.intValue());
            default:
                num.intValue();
                a.a.n(this.f35974b, oVar, p1.a0.l(this.f35975c | 1));
                return Unit.f71706a;
        }
    }
}
