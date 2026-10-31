package com.instabridge.mobilesdk.internal.ui.screens;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class k implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35746a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f35747b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f35748c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function0 f35749d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f35750e;

    public /* synthetic */ k(long j11, String str, Function0 function0, int i5) {
        this.f35747b = j11;
        this.f35748c = str;
        this.f35749d = function0;
        this.f35750e = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        Integer num = (Integer) obj2;
        switch (this.f35746a) {
            case 0:
                return CarrierLockedScreenKt.CardButton_iJQMabo$lambda$10(this.f35748c, this.f35747b, this.f35749d, this.f35750e, oVar, num.intValue());
            default:
                num.getClass();
                p10.y1.t(this.f35748c, this.f35747b, this.f35749d, oVar, p1.a0.l(this.f35750e | 1));
                return Unit.f71706a;
        }
    }

    public /* synthetic */ k(String str, long j11, Function0 function0, int i5) {
        this.f35748c = str;
        this.f35747b = j11;
        this.f35749d = function0;
        this.f35750e = i5;
    }
}
