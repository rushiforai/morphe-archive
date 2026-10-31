package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class d implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35644a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f35645b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f35646c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f35647d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f35648e;

    public /* synthetic */ d(int i5, int i11, long j11, String str, String str2) {
        this.f35644a = i11;
        this.f35645b = str;
        this.f35646c = str2;
        this.f35647d = j11;
        this.f35648e = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        Integer num = (Integer) obj2;
        switch (this.f35644a) {
            case 0:
                return BoosterAddedScreenKt.DetailRow_XO_JAsU$lambda$5(this.f35645b, this.f35646c, this.f35647d, this.f35648e, oVar, num.intValue());
            case 1:
                return KeepYourNumberScreenKt.LineSummary_XO_JAsU$lambda$10(this.f35645b, this.f35646c, this.f35647d, this.f35648e, oVar, num.intValue());
            default:
                num.getClass();
                ux.z.b(this.f35645b, this.f35646c, this.f35647d, oVar, p1.a0.l(this.f35648e | 1));
                return Unit.f71706a;
        }
    }
}
