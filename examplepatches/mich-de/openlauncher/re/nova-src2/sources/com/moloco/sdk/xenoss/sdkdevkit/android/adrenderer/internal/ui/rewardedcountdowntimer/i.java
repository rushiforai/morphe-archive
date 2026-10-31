package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.rewardedcountdowntimer;

import h6.a0;
import h6.s;
import h6.y;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class i implements y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f40069a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c0.e f40070b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e1 f40071c;

    public /* synthetic */ i(c0.e eVar, e1 e1Var, int i5) {
        this.f40069a = i5;
        this.f40070b = eVar;
        this.f40071c = e1Var;
    }

    @Override // h6.y
    public final void d(a0 a0Var, s sVar) {
        switch (this.f40069a) {
            case 0:
                b.a(this.f40070b, this.f40071c, a0Var, sVar);
                break;
            default:
                c.a(this.f40070b, this.f40071c, a0Var, sVar);
                break;
        }
    }
}
