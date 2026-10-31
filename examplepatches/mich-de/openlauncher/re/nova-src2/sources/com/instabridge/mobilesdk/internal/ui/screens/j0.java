package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class j0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35736a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f35737b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f35738c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f35739d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f35740e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f35741f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f35742g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f35743h;

    public /* synthetic */ j0(boolean z11, tz.u uVar, boolean z12, boolean z13, boolean z14, g30.b bVar, int i5) {
        this.f35736a = 2;
        this.f35737b = z11;
        this.f35741f = uVar;
        this.f35738c = z12;
        this.f35739d = z13;
        this.f35740e = z14;
        this.f35742g = bVar;
        this.f35743h = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35736a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                return DashboardScreenKt.QuickActions$lambda$98(this.f35737b, this.f35738c, this.f35739d, this.f35740e, (Function0) this.f35741f, (Function0) this.f35742g, this.f35743h, (p1.o) obj, iIntValue);
            case 1:
                int iIntValue2 = ((Integer) obj2).intValue();
                return DashboardScreenKt.QuickActions$lambda$99(this.f35737b, this.f35738c, this.f35739d, this.f35740e, (Function0) this.f35741f, (Function0) this.f35742g, this.f35743h, (p1.o) obj, iIntValue2);
            default:
                ((Integer) obj2).getClass();
                iy.p0.e(this.f35737b, (tz.u) this.f35741f, this.f35738c, this.f35739d, this.f35740e, (g30.b) this.f35742g, (p1.o) obj, p1.a0.l(this.f35743h | 1));
                return Unit.f71706a;
        }
    }

    public /* synthetic */ j0(boolean z11, boolean z12, boolean z13, boolean z14, Function0 function0, Function0 function02, int i5, int i11) {
        this.f35736a = i11;
        this.f35737b = z11;
        this.f35738c = z12;
        this.f35739d = z13;
        this.f35740e = z14;
        this.f35741f = function0;
        this.f35742g = function02;
        this.f35743h = i5;
    }
}
