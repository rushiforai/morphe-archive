package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class x implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35920a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f35921b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f35922c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f35923d;

    public /* synthetic */ x(boolean z11, Function0 function0, int i5, int i11) {
        this.f35920a = i11;
        this.f35921b = z11;
        this.f35922c = function0;
        this.f35923d = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        Integer num = (Integer) obj2;
        switch (this.f35920a) {
            case 0:
                break;
            case 1:
                break;
            case 2:
                num.intValue();
                io.sentry.config.a.a(this.f35921b, this.f35922c, oVar, p1.a0.l(this.f35923d | 1));
                break;
            case 3:
                num.intValue();
                ys.s0.i(this.f35921b, this.f35922c, oVar, p1.a0.l(this.f35923d | 1));
                break;
            default:
                num.intValue();
                ys.s0.b(this.f35921b, this.f35922c, oVar, p1.a0.l(this.f35923d | 1));
                break;
        }
        return Unit.f71706a;
    }
}
