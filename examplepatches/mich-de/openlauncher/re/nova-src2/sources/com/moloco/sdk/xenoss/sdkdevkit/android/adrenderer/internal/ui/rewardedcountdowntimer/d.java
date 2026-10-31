package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.rewardedcountdowntimer;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import m3.p0;
import p1.a0;
import p1.o;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f40040a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f40041b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f40042c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f40043d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f40044e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f40045f;

    public /* synthetic */ d(com.moloco.sdk.internal.ortb.model.k kVar, int i5, int i11, Function0 function0, int i12) {
        this.f40044e = kVar;
        this.f40041b = i5;
        this.f40042c = i11;
        this.f40045f = function0;
        this.f40043d = i12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f40040a) {
            case 0:
                int iIntValue = ((Integer) obj2).intValue();
                return a.a((com.moloco.sdk.internal.ortb.model.k) this.f40044e, this.f40041b, this.f40042c, (Function0) this.f40045f, this.f40043d, (o) obj, iIntValue);
            default:
                ((Integer) obj2).getClass();
                int iL = a0.l(this.f40042c | 1);
                z10.a.a(this.f40041b, iL, this.f40043d, (String) this.f40044e, (p0) this.f40045f, (o) obj);
                return Unit.f71706a;
        }
    }

    public /* synthetic */ d(String str, int i5, p0 p0Var, int i11, int i12) {
        this.f40044e = str;
        this.f40041b = i5;
        this.f40045f = p0Var;
        this.f40042c = i11;
        this.f40043d = i12;
    }
}
