package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class u1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35890a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f35891b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f35892c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f35893d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f35894e;

    public /* synthetic */ u1(Object obj, float f11, int i5, int i11, int i12) {
        this.f35890a = i12;
        this.f35894e = obj;
        this.f35891b = f11;
        this.f35892c = i5;
        this.f35893d = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35890a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                return ShimmerKt.ShimmerBox_rAjV9yQ$lambda$1((b2.t) this.f35894e, this.f35891b, this.f35892c, this.f35893d, (p1.o) obj, iIntValue);
            default:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(this.f35892c | 1);
                p10.c0.b((hv.x0) this.f35894e, this.f35891b, (p1.o) obj, iL, this.f35893d);
                return Unit.f71706a;
        }
    }
}
