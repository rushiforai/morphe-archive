package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class n0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35795a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f35796b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f35797c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function0 f35798d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f35799e;

    public /* synthetic */ n0(boolean z11, Function0 function0, Function0 function02, int i5, int i11) {
        this.f35795a = i11;
        this.f35796b = z11;
        this.f35797c = function0;
        this.f35798d = function02;
        this.f35799e = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35795a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                return DashboardScreenKt.ProvisioningCard$lambda$81(this.f35796b, this.f35797c, this.f35798d, this.f35799e, (p1.o) obj, iIntValue);
            default:
                int iIntValue2 = ((Integer) obj2).intValue();
                return ManagePlanSheetKt.ActiveBody$lambda$1(this.f35796b, this.f35797c, this.f35798d, this.f35799e, (p1.o) obj, iIntValue2);
        }
    }
}
