package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.rewardedcountdowntimer;

import h6.a0;
import kotlin.jvm.functions.Function1;
import p1.e1;
import p1.l0;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f40048a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a0 f40049b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ c0.e f40050c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ e1 f40051d;

    public /* synthetic */ f(a0 a0Var, c0.e eVar, e1 e1Var, int i5) {
        this.f40048a = i5;
        this.f40049b = a0Var;
        this.f40050c = eVar;
        this.f40051d = e1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f40048a) {
            case 0:
                return b.a(this.f40049b, this.f40050c, this.f40051d, (l0) obj);
            default:
                return c.a(this.f40049b, this.f40050c, this.f40051d, (l0) obj);
        }
    }
}
