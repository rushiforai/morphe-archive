package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class s0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35854a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f35855b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f35856c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function0 f35857d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f35858e;

    public /* synthetic */ s0(String str, Function0 function0, Function0 function02, int i5, int i11) {
        this.f35854a = i11;
        this.f35855b = str;
        this.f35856c = function0;
        this.f35857d = function02;
        this.f35858e = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35854a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                return DashboardScreenKt.NoUpgradesSheet$lambda$86(this.f35855b, this.f35856c, this.f35857d, this.f35858e, (p1.o) obj, iIntValue);
            case 1:
                int iIntValue2 = ((Integer) obj2).intValue();
                return DashboardScreenKt.CycleLockedSheet$lambda$89(this.f35855b, this.f35856c, this.f35857d, this.f35858e, (p1.o) obj, iIntValue2);
            default:
                ((Integer) obj2).intValue();
                int iL = p1.a0.l(this.f35858e | 1);
                com.stripe.android.paymentsheet.paymentdatacollection.ach.f.b(this.f35855b, this.f35856c, this.f35857d, (p1.o) obj, iL);
                return Unit.f71706a;
        }
    }

    public /* synthetic */ s0(Function0 function0, Function0 function02, String str, int i5) {
        this.f35854a = 2;
        this.f35856c = function0;
        this.f35857d = function02;
        this.f35855b = str;
        this.f35858e = i5;
    }
}
