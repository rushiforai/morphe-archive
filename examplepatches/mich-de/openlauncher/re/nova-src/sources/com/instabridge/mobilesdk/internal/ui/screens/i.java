package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class i implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35713a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f35714b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f35715c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function0 f35716d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f35717e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f35718f;

    public /* synthetic */ i(String str, String str2, Function0 function0, boolean z11, int i5) {
        this.f35714b = str;
        this.f35715c = str2;
        this.f35716d = function0;
        this.f35717e = z11;
        this.f35718f = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35713a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                String str = this.f35714b;
                String str2 = this.f35715c;
                Function0 function0 = this.f35716d;
                return CancelPlanReasonsScreenKt.CancellationReasonItem$lambda$32(str, str2, this.f35717e, function0, this.f35718f, (p1.o) obj, iIntValue);
            default:
                int iIntValue2 = ((Integer) obj2).intValue();
                return DashboardTravelKt.UsageUnavailableCard$lambda$89(this.f35714b, this.f35715c, this.f35716d, this.f35717e, this.f35718f, (p1.o) obj, iIntValue2);
        }
    }

    public /* synthetic */ i(String str, String str2, boolean z11, Function0 function0, int i5) {
        this.f35714b = str;
        this.f35715c = str2;
        this.f35717e = z11;
        this.f35716d = function0;
        this.f35718f = i5;
    }
}
