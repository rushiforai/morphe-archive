package com.instabridge.mobilesdk.internal.ui.screens;

import e10.z2;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes3.dex */
public final /* synthetic */ class o1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35808a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f35809b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f35810c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b2.t f35811d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f35812e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f35813f;

    public /* synthetic */ o1(b2.t tVar, String str, long j11, int i5, int i11) {
        this.f35808a = 2;
        this.f35811d = tVar;
        this.f35809b = str;
        this.f35810c = j11;
        this.f35812e = i5;
        this.f35813f = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35808a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                return MyEsimsScreenKt.EsimActionLabel_3IgeMak$lambda$42(this.f35809b, this.f35810c, this.f35811d, this.f35812e, this.f35813f, (p1.o) obj, iIntValue);
            case 1:
                int iIntValue2 = ((Integer) obj2).intValue();
                return PlansScreenKt.Badge_3IgeMak$lambda$44(this.f35809b, this.f35810c, this.f35811d, this.f35812e, this.f35813f, (p1.o) obj, iIntValue2);
            default:
                ((Integer) obj2).getClass();
                z2.a(this.f35809b, this.f35810c, this.f35811d, (p1.o) obj, p1.a0.l(this.f35812e | 1), this.f35813f);
                return Unit.f71706a;
        }
    }

    public /* synthetic */ o1(String str, long j11, b2.t tVar, int i5, int i11, int i12) {
        this.f35808a = i12;
        this.f35809b = str;
        this.f35810c = j11;
        this.f35811d = tVar;
        this.f35812e = i5;
        this.f35813f = i11;
    }
}
