package com.instabridge.mobilesdk.internal.ui.screens;

import com.instabridge.mobilesdk.internal.ui.screens.CheckoutScreenKt;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class c0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35637a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f35638b;

    public /* synthetic */ c0(p1.e1 e1Var, int i5) {
        this.f35637a = i5;
        this.f35638b = e1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35637a) {
            case 0:
                return CheckoutScreenKt.C29071.invoke$lambda$10$lambda$3$lambda$2$lambda$1$lambda$0(this.f35638b, (String) obj);
            case 1:
                return CancelPlanReasonsScreenKt.CancelPlanReasonsScreen$lambda$21$lambda$15$lambda$14$lambda$13(this.f35638b, (r3.z) obj);
            default:
                return MyEsimsScreenKt.EsimActionLabel_3IgeMak$lambda$39$lambda$38(this.f35638b, (k2.c) obj);
        }
    }
}
