package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.Plan;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class c implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35634a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Plan f35635b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f35636c;

    public /* synthetic */ c(Plan plan, int i5, int i11) {
        this.f35634a = i11;
        this.f35635b = plan;
        this.f35636c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f35634a;
        p1.o oVar = (p1.o) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i5) {
            case 0:
                return BoosterAddedScreenKt.BoosterDetailsCard$lambda$3(this.f35635b, this.f35636c, oVar, iIntValue);
            case 1:
                return ConnectedScreenKt.PlanFeatures$lambda$3(this.f35635b, this.f35636c, oVar, iIntValue);
            default:
                return ConnectedScreenKt.PlanFeatures$lambda$5(this.f35635b, this.f35636c, oVar, iIntValue);
        }
    }
}
